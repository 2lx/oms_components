unit uOMScxGridDBTableView;

interface

uses Classes, cxGridDBTableView, cxGridCustomTableView, cxEdit, cxStyles, cxFilter, uOMScxGridViewCommon, XMLDoc;

type
  TOMScxGridDBTableView = class(TcxGridDBTableView)
  private
    FCurrentSelectionType : TGridSelectionType;
    FUserNavigatorOnButtonHandler: TProcNavigatorOnButtonClick;
    FUserContentStyleHandler: TProcContentStyle;
    FEnableHighlight : Boolean;

    procedure GetContentStyleHandler( Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );
    procedure NavigatorOnButtonClickHandler( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean );

    procedure setEnableHighlight(const AValue: Boolean);
  protected
    procedure Loaded; override;

  published
  public
    property CurrentSelectionType : TGridSelectionType read FCurrentSelectionType default gstNone;
    property EnableHighlight : Boolean read FEnableHighlight write setEnableHighlight;

    constructor Create(AOwner: TComponent); override;

    procedure setSelectionType( const gst : TGridSelectionType );
    procedure processSelectedRecords( func: TPFuncGUIDBoolean; const colGuidIndex: Integer );
    function getXMLValues( const colGuidIndex: Integer ) : String;

    procedure setFilter( AValue: Variant; const opKind: TcxFilterOperatorKind;
        const indexes: array of Integer; const rootOpKind: tcxFilterBoolOperatorKind = fboOR );
  end;

implementation

uses uOMSComponentStyle, Windows, Graphics, cxGraphics, cxDBExtLookupComboBox,
  cxDBLookupComboBox, cxSpinEdit, cxGridTableView, uDMComponents, cxNavigator, uDataExport, cxGrid,
  uDialogs, Controls, SysUtils, cxControls, cxCalendar;

constructor TOMScxGridDBTableView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

//  Styles.FilterRowInfoText := styleContentDefaultBold;
  EnableHighlight := True;

  OnInitEdit := TOMScxGridViewCommon.GridViewInitEditHandler;
end;

procedure TOMScxGridDBTableView.Loaded;
var
  nbtn : TcxNavigatorCustomButton;
  i : Integer;
begin
  inherited;

  // TODO: незначительно замедляет выполнение
  for i := 0 to ColumnCount - 1 do
  begin
    if (Columns[ i ].Properties is TcxCustomDateEditProperties) then
    with Columns[ i ].Properties as TcxCustomDateEditProperties do
    begin
      if DisplayFormat = 'dd.mm.yyyy' then
      begin
        DisplayFormat := 'dd.mm.yy';
        EditFormat := 'dd.mm.yy';
      end;
    end;
  end;

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
//  OptionsCustomize.GroupBySorting := False;
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

      Insert.ImageIndex := 0;
      Delete.ImageIndex := 1;
      Post.ImageIndex := 2;
      Cancel.ImageIndex := 3;

      Filter.ImageIndex := 7;
      Filter.Visible := True;

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

// TODO:
//  OnUpdateEdit - посмотреть описание в док-ции
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
        if (Site <> nil) AND (Site.Container is TcxGrid)
          then cxGridToExcelWithImages( 'Экранная форма', (Site.Container as TcxGrid), False );
      end;
      5 : begin // настройки таблицы
        DMOMSComponents.pmiEnableHighlight.Checked := FEnableHighlight;

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
  if checkInvalidStyle(ARecord, AItem) then Exit;

  if FEnableHighlight
    then setupStyleGridBefore(Sender, ARecord, AItem, AStyle);

  if Assigned(FUserContentStyleHandler)
    then FUserContentStyleHandler(Sender, ARecord, AItem, AStyle);

  if FEnableHighlight
    then setupStyleGridAfter(Sender, ARecord, AItem, AStyle);
end;

procedure TOMScxGridDBTableView.setEnableHighlight(const AValue: Boolean);
begin
  FEnableHighlight := AValue;

  if AValue then
  begin
    Styles.ContentEven := cxStyleContentDefault;
    Styles.ContentOdd := cxStyleContentOdd;
  end
  else
  begin
    Styles.ContentEven := Nil;
    Styles.ContentOdd := Nil;
  end;
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

function TOMScxGridDBTableView.getXMLValues( const colGuidIndex: Integer ) : String;
var
  xml: TXMLDocument;
  i : Integer;
begin
  Result := '';

  if Controller.SelectedRecordCount <= 0 then begin
    ShowWarning( 'Ни одной записи не выделено.' );
    Exit;
  end;

  try
    xml := TXMLDocument.Create( Self );
    xml.Active := True;

    DataController.DataSet.DisableControls;

    with xml.AddChild( 'Core' ) do
    begin
      for i := 0 to Controller.SelectedRecordCount - 1 do
        with AddChild( 'Node' ) do
          Attributes[ 'Value' ] := Controller.SelectedRecords[ i ].Values[ colGuidIndex ];

      Result := XML;
    end;

  finally
    DataController.DataSet.EnableControls;
    xml.Free;
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
