unit uOMScxGridDBBandedTableView;

interface

uses Classes, cxGridDBBandedTableView, cxGridCustomTableView, cxEdit, cxStyles, cxFilter, uOMScxGridViewCommon;

type
  TOMScxGridDBBandedTableView = class(TcxGridDBBandedTableView)
  private
    FCurrentSelectionType : TGridSelectionType;
    FUserNavigatorOnButtonHandler: TProcNavigatorOnButtonClick;
    FUserContentStyleHandler: TProcContentStyle;

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

    procedure setFilter( AValue: Variant; const opKind: TcxFilterOperatorKind;
        const indexes: array of Integer; const rootOpKind: tcxFilterBoolOperatorKind = fboOR );
  end;

implementation

uses uOMSComponentStyle, Windows, Graphics, cxGraphics, cxDBExtLookupComboBox,
  cxDBLookupComboBox, cxSpinEdit, cxGridTableView, uDMComponents, cxNavigator, uDataExport, cxGrid,
  uDialogs, Controls, SysUtils;

constructor TOMScxGridDBBandedTableView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  //virtual settings
  Styles.ContentEven := cxStyleContentDefault;
  Styles.ContentOdd := cxStyleContentOdd;
  Styles.FilterRowInfoText := cxStyleContentDefaultBold;

  OnInitEdit := TOMScxGridViewCommon.GridViewInitEditHandler;
end;

procedure TOMScxGridDBBandedTableView.Loaded;
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
  OptionsData.Appending := False;

  OptionsView.GridLines := glBoth;
//  OptionsView.CellEndEllipsis := False;
  OptionsView.Indicator := True;
  OptionsView.IndicatorWidth := 12;
  OptionsView.NoDataToDisplayInfoText := 'НЕТ ДАННЫХ ДЛЯ ОТОБРАЖЕНИЯ';
  OptionsView.GridLineColor := RGB( 190, 190, 190 );

  OptionsView.NewItemRowInfoText := 'СТРОКА ДЛЯ ДОБАВЛЕНИЯ ЗАПИСИ';

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

    if (not Assigned(OnButtonClick)) OR (CustomButtons.Count = 0) then
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
      nbtn.ImageIndex := 5;
      nbtn.Hint := 'Настройка таблицы';

      nbtn := CustomButtons.Add;
      nbtn.ImageIndex := 4;
      nbtn.Hint := 'Выгрузить в Excel';

      OnButtonClick := NavigatorOnButtonClickHandler;
    end;
  end;
end;

procedure TOMScxGridDBBandedTableView.NavigatorOnButtonClickHandler( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean );
var
  pmHeight : Integer;
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
      5 : begin // настройки таблицы
        DMOMSComponents.pmiSelectionType1Cell.Checked := FCurrentSelectionType = gstOneCellOneRow;
        DMOMSComponents.pmiSelectionTypeMultiCell.Checked := FCurrentSelectionType = gstMultiCellMultiRow;

        pmHeight := PopupMenuHeight(DMOMSComponents.PopupMenuGridViewSettings);
        DMOMSComponents.PopupMenuGridViewSettings.PopupComponent := Self;
        DMOMSComponents.PopupMenuGridViewSettings.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y - pmHeight);
      end;
    end;
  end;
end;

procedure TOMScxGridDBBandedTableView.GetContentStyleHandler( Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if checkInvalidStyle(ARecord, AItem) then Exit;

  setupStyleGridBefore(Sender, ARecord, AItem, AStyle);

  if Assigned(FUserContentStyleHandler)
    then FUserContentStyleHandler(Sender, ARecord, AItem, AStyle);

  setupStyleGridAfter(Sender, ARecord, AItem, AStyle);
end;

procedure TOMScxGridDBBandedTableView.setSelectionType( const gst : TGridSelectionType );
begin
  OptionsSelection.CellMultiSelect := gst in [ gstMultiCellMultiRow ];
  OptionsSelection.CellSelect := gst in [ gstOneCellOneRow, gstMultiCellMultiRow ];
  OptionsSelection.InvertSelect := gst in [ ];
  OptionsSelection.MultiSelect := gst in [ gstMultiCellMultiRow ];

  FCurrentSelectionType := gst;
end;

procedure TOMScxGridDBBandedTableView.processSelectedRecords( func: TPFuncGUIDBoolean; const colGuidIndex: Integer );
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

procedure TOMScxGridDBBandedTableView.setFilter( AValue: Variant; const opKind: TcxFilterOperatorKind;
    const indexes: array of Integer; const rootOpKind: tcxFilterBoolOperatorKind );
var
  ind : Integer;
  DValue : String;
begin
  with DataController.Filter do
  begin
    Root.Clear;
    Root.BoolOperatorKind := rootOpKind;

    if opKind = foLike
      then AValue := '*' + String( AValue ) + '*';
    DValue := String( AValue );

    for ind in indexes do
      Root.AddItem( Columns[ ind ], opKind, AValue, DValue );

    Active := True;
  end;
end;

end.
