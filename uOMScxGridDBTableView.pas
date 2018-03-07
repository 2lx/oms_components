unit uOMScxGridDBTableView;

interface

uses Classes, cxGridDBTableView, cxGridCustomTableView, cxEdit, cxStyles;

type
  GridSelectionType = (
      gstOneCellOneRow,
      gstAllCellOneRow,
      gstMultiCellOneRow,
      gstMultiCellMultiRow,
      gstAllCellMultiRow
  );

  TOMScxGridDBTableView = class(TcxGridDBTableView)
  private
    procedure InitEditHandler( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit );

    procedure DefaultContentStyle( Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );

    procedure NavigatorOnButtonClickHandler( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean );

  protected
    procedure Loaded; override;

  published
  public
    constructor Create(AOwner: TComponent); override;

    procedure setSelectionType( const gst : GridSelectionType );
  end;

implementation

uses uOMSStyle, Windows, cxGraphics, cxDBExtLookupComboBox, cxDBLookupComboBox, cxSpinEdit, cxFilter,
  cxGridTableView, uDMComponents, cxNavigator, uDataExport, cxGrid;

constructor TOMScxGridDBTableView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

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

  OptionsSelection.InvertSelect := True;
  OptionsSelection.CellSelect := True;
  OptionsSelection.CellMultiSelect := False;
  OptionsSelection.MultiSelect := False;

  OptionsView.GridLines := glBoth;
//  OptionsView.CellEndEllipsis := False;
  OptionsView.Indicator := True;
  OptionsView.IndicatorWidth := 12;
  OptionsView.NoDataToDisplayInfoText := 'НЕТ ДАННЫХ ДЛЯ ОТОБРАЖЕНИЯ';
  OptionsView.GridLineColor := RGB( 190, 190, 190 );

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

  setSelectionType(gstAllCellOneRow);
  Navigator.InfoPanel.DisplayMask := 'Запись: [RecordIndex]/[RecordCount]';

  with NavigatorButtons do
  begin
    if (CustomButtons.Count = 0) AND (not Assigned(OnButtonClick)) then
    begin
      Images := DMOMSComponents.ImageListNavigator;

      // Tcollection
      Insert.ImageIndex := 0;
      Insert.Hint := 'Вставить новую запись';
      Delete.ImageIndex := 1;
      Delete.Hint := 'Удалить запись';
      Post.ImageIndex := 2;
      Post.Hint := 'Сохранить изменения записи';
      Cancel.ImageIndex := 3;
      Cancel.Hint := 'Отменить изменения записи';

      nbtn := CustomButtons.Add;
      nbtn.ImageIndex := 4;
      nbtn.Hint := 'Выгрузить в Excel';

      OnButtonClick := NavigatorOnButtonClickHandler;
    end;
  end;
end;

procedure TOMScxGridDBTableView.NavigatorOnButtonClickHandler( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean );
begin
  if AButtonIndex >= NBDI_FILTER then
  begin
    ADone := True;

    if Navigator.Buttons[ AButtonIndex ].ImageIndex = 4 then  // выгрузка в Excel
    begin
      if (Site <> nil) AND (Site.Parent is TcxGrid )
        then cxGridToExcelWithImages( 'Экранная форма', (Site.Parent as TcxGrid), False );
    end;
  end
  else ADone := False;
end;

procedure TOMScxGridDBTableView.setSelectionType( const gst : GridSelectionType );
begin
  OptionsSelection.InvertSelect := gst in [ gstAllCellOneRow ];
  OptionsSelection.CellSelect := gst in [ gstAllCellOneRow ];
  OptionsSelection.CellMultiSelect := False;
  OptionsSelection.MultiSelect := False;
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

end.
