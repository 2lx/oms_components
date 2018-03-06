unit uOMScxGridDBTableView;

interface

uses Classes, cxGridDBTableView, cxGridCustomTableView, cxEdit, cxStyles;

type
  TOMScxGridDBTableView = class(TcxGridDBTableView)
  private
    procedure InitEditHandler( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit );

    procedure DefaultContentStyle( Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );

  protected
  published
  public
    constructor Create(AOwner: TComponent); override;

    procedure setSingleCellSelection;
  end;

implementation

uses uOMSStyle, Windows, cxGraphics, cxDBExtLookupComboBox, cxDBLookupComboBox, cxSpinEdit, cxFilter,
  cxGridTableView, uDMComponents;

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

  with NavigatorButtons do begin
    Insert.Hint := 'Вставить новую запись';
    Delete.Hint := 'Удалить запись';
    Post.Hint := 'Сохранить изменения записи';
    Cancel.Hint := 'Отменить изменения записи';

    Insert.ImageIndex := 0;
    Delete.ImageIndex := 1;
    Post.ImageIndex := 2;
    Cancel.ImageIndex := 3;

    Images := DMOMSComponents.ImageListNavigator;
  end;

  Styles.ContentEven := cxStyleContentDefault;
  Styles.ContentOdd := cxStyleContentOdd;
  Styles.Selection := cxStylePink;
  Styles.FilterRowInfoText := cxStyleContentDefaultBold;

  Styles.OnGetContentStyle := DefaultContentStyle;
  OnInitEdit := InitEditHandler;
end;

procedure TOMScxGridDBTableView.setSingleCellSelection;
begin
  OptionsSelection.InvertSelect := False;
  OptionsSelection.CellSelect := True;
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
