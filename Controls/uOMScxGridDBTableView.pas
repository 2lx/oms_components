unit uOMScxGridDBTableView;

interface

uses Classes, cxGridDBTableView, cxGridCustomTableView, cxEdit, cxStyles, cxFilter, uOMScxGridViewCommon;

type
  TOMScxGridDBTableView = class(TcxGridDBTableView)
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
  uDialogs, Controls, SysUtils, cxControls;

constructor TOMScxGridDBTableView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  //virtual settings
  Styles.ContentEven := cxStyleContentDefault;
  Styles.ContentOdd := cxStyleContentOdd;
  Styles.FilterRowInfoText := cxStyleContentDefaultBold;

  OnInitEdit := TOMScxGridViewCommon.GridViewInitEditHandler;
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

  OptionsBehavior.CellHints := True;
  OptionsBehavior.ColumnHeaderHints := True;
  OptionsBehavior.CopyCaptionsToClipboard := False;
//OptionsBehavior.CopyRecordsToClipboard := False;
  OptionsBehavior.ExpandMasterRowOnDblClick := True;
  OptionsBehavior.EditAutoHeight := eahEditor;
  OptionsBehavior.IncSearch := False;
  OptionsBehavior.NavigatorHints := True;
  OptionsBehavior.RecordScrollMode := rsmByPixel;

  OptionsCustomize.ColumnFiltering := True;
  OptionsCustomize.ColumnGrouping := True;
  OptionsCustomize.DataRowSizing := True;
  OptionsCustomize.GroupBySorting := True;
  OptionsCustomize.GroupRowSizing := True;

  OptionsData.DeletingConfirmation := True;
  OptionsData.Appending := False;

  OptionsView.GridLines := glBoth;
//  OptionsView.CellEndEllipsis := False;
  OptionsView.Indicator := True;
  OptionsView.IndicatorWidth := 12;
  OptionsView.GridLineColor := RGB( 190, 190, 190 );

  FindPanel.ApplyInputDelay := 200;
  FindPanel.ShowClearButton := False;
  FindPanel.ShowCloseButton := False;
  FindPanel.InfoText := 'Введите текст для поиска по таблице...';

  if CurrentSelectionType = gstNone
    then setSelectionType( gstMultiCellMultiRow );

  if Assigned(Styles.OnGetContentStyle)
    then FUserContentStyleHandler := Styles.OnGetContentStyle;
  Styles.OnGetContentStyle := GetContentStyleHandler;

  with NavigatorButtons do
  begin
    if Assigned(OnButtonClick)
      then FUserNavigatorOnButtonHandler := OnButtonClick;

    if (not Assigned(OnButtonClick)) OR (CustomButtons.Count = 0) then
    begin
      Images := DMOMSComponents.ImageListNavigator;

      // TODO: Tcollection ??
      Insert.ImageIndex := 0;
//      Insert.Hint := 'Вставить новую запись';
      Delete.ImageIndex := 1;
//      Delete.Hint := 'Удалить запись';
      Post.ImageIndex := 2;
//      Post.Hint := 'Сохранить изменения записи';
      Cancel.ImageIndex := 3;
//      Cancel.Hint := 'Отменить изменения записи';

      CustomButtons.Clear;

      if IsMaster then
      begin
        nbtn := CustomButtons.Add;
        nbtn.ImageIndex := 6;
        nbtn.Hint := 'Свернуть/развернуть все записи';
      end;

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

procedure TOMScxGridDBTableView.NavigatorOnButtonClickHandler( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean );
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

        DMOMSComponents.pmiShowFilterRow.Checked := FilterRow.Visible;
        DMOMSComponents.pmiShowGroupBox.Checked := OptionsView.GroupByBox;
        DMOMSComponents.pmiShowFindPanel.Checked := FindPanel.DisplayMode = fpdmAlways;

        pmHeight := PopupMenuHeight(DMOMSComponents.PopupMenuGridViewSettings);
        DMOMSComponents.PopupMenuGridViewSettings.PopupComponent := Self;
        DMOMSComponents.PopupMenuGridViewSettings.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y - pmHeight);
      end;
      6 : begin // свернуть\развернуть записи
        if ViewData.GetRecordByIndex( DataController.FocusedRecordIndex ).Expanded
          then ViewData.Collapse( True )
          else ViewData.Expand( True );
      end;
    end;
  end;
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

procedure TOMScxGridDBTableView.setSelectionType( const gst : TGridSelectionType );
begin
  OptionsSelection.CellMultiSelect := gst in [ gstMultiCellMultiRow];
  OptionsSelection.CellSelect := gst in [ gstOneCellOneRow, gstMultiCellMultiRow ];
  OptionsSelection.InvertSelect := gst in [ ];
  OptionsSelection.MultiSelect := gst in [gstMultiCellMultiRow];

  FCurrentSelectionType := gst;
end;

procedure TOMScxGridDBTableView.processSelectedRecords( func: TPFuncGUIDBoolean; const colGuidIndex: Integer );
var
  i, succCount, selCount : Integer;
  guid : Variant;
begin
  succCount := 0;
  selCount := Controller.SelectedRecordCount;

  if selCount <= 0 then begin
    ShowWarning( 'Ни одной записи не выделено.' );
    Exit;
  end;

  if not ShowQuestionYesNo('Вы уверены, что хотите выполнить групповую операцию? '
        + #13'Выделено строк: ' + IntToStr( selCount ) ) then Exit;

  try
    DataController.DataSet.DisableControls;

    for i := 0 to Controller.SelectedRecordCount - 1 do
      if func( Controller.SelectedRecords[ i ].Values[ colGuidIndex ] )
        then Inc(succCount);

    ShowInformation( 'Успешно обновлено записей: ' + IntToStr( succCount ) + ' из '
          + IntToStr( Controller.SelectedRecordCount ));

  finally
    DataController.DataSet.EnableControls;
  end;
end;

procedure TOMScxGridDBTableView.setFilter( AValue: Variant; const opKind: TcxFilterOperatorKind;
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
