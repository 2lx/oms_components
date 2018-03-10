unit uOMScxGridDBTableView;

interface

uses Classes, cxGridDBTableView, cxGridCustomTableView, cxEdit, cxStyles;

type
  TGridSelectionType = (
      gstNone,
      gstOneCellOneRow,
      gstMultiCellMultiRow
  );

  TPFuncGUIDBoolean = reference to function( const guid: Variant ) : Boolean;

  TProcNavigatorOnButtonClick = procedure( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean ) of object;
  TProcContentStyle = procedure( Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle ) of object;

type
  TOMScxGridDBTableView = class(TcxGridDBTableView)
  private
    FCurrentSelectionType : TGridSelectionType;
    FUserNavigatorOnButtonHandler: TProcNavigatorOnButtonClick;
    FUserContentStyleHandler: TProcContentStyle;

    procedure InitEditHandler( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit );
    procedure GetContentStyleHandler( Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );
    procedure NavigatorOnButtonClickHandler( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean );

  protected
    procedure Loaded; override;

  published
  public
    property CurrentSelectionType : TGridSelectionType read FCurrentSelectionType default gstNone;

    constructor Create(AOwner: TComponent); override;

    procedure setSelectionType( const gst : TGridSelectionType );
    procedure processSelectedRecords( func: TPFuncGUIDBoolean; const colGuidIndex: Integer );
  end;

implementation

uses uOMSStyle, uOMSStyleGridDefault, Windows, Graphics, cxGraphics, cxDBExtLookupComboBox, cxDBLookupComboBox, cxSpinEdit, cxFilter,
  cxGridTableView, uDMComponents, cxNavigator, uDataExport, cxGrid, uOMSDialogs, SysUtils;

constructor TOMScxGridDBTableView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  //overrided settings
//  Styles.Selection := cxStyleBlue;
  Styles.ContentEven := cxStyleContentDefault;
  Styles.ContentOdd := cxStyleContentOdd;
  Styles.FilterRowInfoText := cxStyleContentDefaultBold;

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
    then setSelectionType( gstOneCellOneRow );

  if Assigned(Styles.OnGetContentStyle)
    then FUserContentStyleHandler := Styles.OnGetContentStyle;
  Styles.OnGetContentStyle := GetContentStyleHandler;

  Navigator.InfoPanel.DisplayMask := 'Запись: [RecordIndex]/[RecordCount]';

  with NavigatorButtons do
  begin
    if Assigned(OnButtonClick)
      then FUserNavigatorOnButtonHandler := OnButtonClick;

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
  if (AButtonIndex <= NBDI_FILTER) AND Assigned(FUserNavigatorOnButtonHandler)
    then FUserNavigatorOnButtonHandler(Sender, AButtonIndex, ADone )
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
  OptionsSelection.CellMultiSelect := gst in [ gstMultiCellMultiRow];
  OptionsSelection.CellSelect := gst in [ gstOneCellOneRow, gstMultiCellMultiRow ];
  OptionsSelection.InvertSelect := gst in [ ];
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

procedure TOMScxGridDBTableView.GetContentStyleHandler( Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if checkInvalidStyle(ARecord, AItem) then Exit;

  setupStyleGridBefore(Sender, ARecord, AItem, AStyle);

  if Assigned(FUserContentStyleHandler)
    then FUserContentStyleHandler(Sender, ARecord, AItem, AStyle);

  setupStyleGridAfter(Sender, ARecord, AItem, AStyle);
end;

procedure TOMScxGridDBTableView.processSelectedRecords( func: TPFuncGUIDBoolean; const colGuidIndex: Integer );
var
  i, succCount : Integer;
  guid : Variant;
begin
  succCount := 0;

  try
    DataController.DataSet.DisableControls;

    if Controller.SelectedRecordCount > 0 then
    begin
      for i := 0 to Controller.SelectedRecordCount - 1 do
        if func( Controller.SelectedRecords[ i ].Values[ colGuidIndex ] )
          then Inc(succCount);

      ShowInformation( 'Успешно обновлено записей: ' + IntToStr( succCount ) + ' из '
          + IntToStr( Controller.SelectedRecordCount ));
    end
    else ShowWarning( 'Ни одной записи не выделено.' );
  finally
    DataController.DataSet.EnableControls;
  end;
end;

end.
