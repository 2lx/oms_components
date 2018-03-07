unit uOMScxGridDBTableView;

interface

uses Classes, cxGridDBTableView, cxGridCustomTableView, cxEdit, cxStyles;

type
  TGridSelectionType = (
      gstNone,
      gstOneCellOneRow,
      gstAllCellOneRow,
      gstMultiCellOneRow,
      gstMultiCellMultiRow
  );

  TPProcGUID = reference to procedure( const guid: Variant );
  TProcNavigatorOnButtonClick = procedure( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean ) of object;

type
  TOMScxGridDBTableView = class(TcxGridDBTableView)
  private
    FCurrentSelectionType : TGridSelectionType;
    FDefNavButtonHandler: TProcNavigatorOnButtonClick;

    procedure InitEditHandler( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit );

    procedure DefaultContentStyle( Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );

    procedure NavigatorOnButtonClickHandler( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean );

  protected
    procedure Loaded; override;

  published
  public
    property CurrentSelectionType : TGridSelectionType read FCurrentSelectionType default gstNone;

    constructor Create(AOwner: TComponent); override;

    procedure setSelectionType( const gst : TGridSelectionType );
    procedure processSelectedRecords( proc: TPProcGUID; const colGuidIndex: Integer );
  end;

implementation

uses uOMSStyle, Windows, Graphics, cxGraphics, cxDBExtLookupComboBox, cxDBLookupComboBox, cxSpinEdit, cxFilter,
  cxGridTableView, uDMComponents, cxNavigator, uDataExport, cxGrid, uOMSDialogs, SysUtils;

constructor TOMScxGridDBTableView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  //overrided settings
  Styles.ContentEven := cxStyleContentDefault;
  Styles.ContentOdd := cxStyleContentOdd;
  Styles.Selection := cxStylePink;
  Styles.FilterRowInfoText := cxStyleContentDefaultBold;

  Styles.OnGetContentStyle := DefaultContentStyle;
  OnInitEdit := InitEditHandler;
end;

procedure TOMScxGridDBTableView.Loaded;
var
  nbtn : TcxNavigatorCustomButton;
begin
  inherited;

  //final settings
  DataController.Filter.PercentWildcard := '*';
  DataController.Filter.Options := [ fcoCaseInsensitive ];

  FilterRow.ApplyChanges := fracImmediately;
  FilterRow.InfoText := 'СТРОКА ДЛЯ УКАЗАНИЯ ФИЛЬТРОВ';

  OptionsBehavior.NavigatorHints := True;
  OptionsBehavior.CellHints := True;
  OptionsBehavior.CopyCaptionsToClipboard := False;
  OptionsBehavior.IncSearch := False;
  OptionsBehavior.EditAutoHeight := eahEditor;
//OptionsBehavior.CopyRecordsToClipboard := False;

  OptionsData.DeletingConfirmation := True;

  OptionsView.GridLines := glBoth;
//  OptionsView.CellEndEllipsis := False;
  OptionsView.Indicator := True;
  OptionsView.IndicatorWidth := 12;
  OptionsView.NoDataToDisplayInfoText := 'НЕТ ДАННЫХ ДЛЯ ОТОБРАЖЕНИЯ';
  OptionsView.GridLineColor := RGB( 190, 190, 190 );

  if CurrentSelectionType = gstNone
    then setSelectionType( gstAllCellOneRow );

  Navigator.InfoPanel.DisplayMask := 'Запись: [RecordIndex]/[RecordCount]';

  with NavigatorButtons do
  begin
    if Assigned(OnButtonClick)
      then FDefNavButtonHandler := OnButtonClick;

    if (not Assigned(OnButtonClick)) then
    begin
      Images := DMOMSComponents.ImageListNavigator;

      // TODO: Tcollection ??
      Insert.ImageIndex := 0;
      Insert.Hint := 'Вставить новую запись';
      Delete.ImageIndex := 1;
      Delete.Hint := 'Удалить запись';
      Post.ImageIndex := 2;
      Post.Hint := 'Сохранить изменения записи';
      Cancel.ImageIndex := 3;
      Cancel.Hint := 'Отменить изменения записи';

      CustomButtons.Clear;

      nbtn := CustomButtons.Add;
      nbtn.ImageIndex := 4;
      nbtn.Hint := 'Выгрузить в Excel';

      OnButtonClick := NavigatorOnButtonClickHandler;
    end;
  end;
end;

procedure TOMScxGridDBTableView.NavigatorOnButtonClickHandler( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean );
begin
  if (AButtonIndex <= NBDI_FILTER) AND Assigned(FDefNavButtonHandler)
    then FDefNavButtonHandler(Sender, AButtonIndex, ADone )
  else if AButtonIndex > NBDI_FILTER then
  begin
    ADone := True;

    case Navigator.Buttons[ AButtonIndex ].ImageIndex of
      4 : begin // выгрузка в Excel
        if (Site <> nil) AND (Site.Parent is TcxGrid)
          then cxGridToExcelWithImages( 'Экранная форма', (Site.Parent as TcxGrid), False );
      end;
      else ADone := False;
    end;
  end
  else ADone := False;
end;

procedure TOMScxGridDBTableView.setSelectionType( const gst : TGridSelectionType );
begin
  OptionsSelection.CellMultiSelect := gst in [gstMultiCellOneRow, gstMultiCellMultiRow];
  OptionsSelection.CellSelect := gst in [ gstAllCellOneRow, gstOneCellOneRow, gstMultiCellMultiRow ];

  OptionsSelection.InvertSelect := gst in [ gstAllCellOneRow ];
  OptionsSelection.MultiSelect := gst in [gstMultiCellMultiRow];

  FCurrentSelectionType := gst;
end;

procedure TOMScxGridDBTableView.InitEditHandler( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit );
begin
  if AEdit is TcxLookupComboBox
    then TcxLookupComboBox(AEdit).Properties.UseMouseWheel := False
  else if AEdit is TcxSpinEdit
    then TcxSpinEdit(AEdit).Properties.UseMouseWheel := False
  else if AEdit is TcxExtLookupComboBox
    then TcxExtLookupComboBox(AEdit).Properties.UseMouseWheel := False;
end;

procedure TOMScxGridDBTableView.DefaultContentStyle( Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if checkInvalidStyle(ARecord, AItem) then Exit;

//  setupStyleGridDefault(Sender, ARecord, AItem, AStyle);
  setupStyleGridEditable(Sender, ARecord, AItem, AStyle);
end;

procedure TOMScxGridDBTableView.processSelectedRecords( proc: TPProcGUID; const colGuidIndex: Integer );
var
  i : Integer;
  guid : Variant;
begin
  if Controller.SelectedRecordCount > 0 then
  begin
    for i := 0 to Controller.SelectedRecordCount - 1 do
    begin
      proc( Controller.SelectedRecords[ i ].Values[ colGuidIndex ] );
    end;

    ShowInformation( 'Успешно обновлено записей: ' + IntToStr( Controller.SelectedRecordCount ));
  end
  else ShowWarning( 'Ни одной записи не выделено.' );
end;

end.
