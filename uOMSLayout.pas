unit uOMSLayout;

interface

uses Controls, Types, System.Generics.Collections, SysUtils,

{$I OMSComponentsInclude.inc}

type
  TLayoutCell = record
    ctrlLabel : TControl;
    ctrlEdit  : TControl;
    RectC : TRect;
  end;

  TArray1OfControl = array of TControl;
  TArray2OfControl = array of TArray1OfControl;

  TLayoutGrid = class
  private
    ctrlPanel : TControl;
    gridSizeC : TSize;
    LayoutCells : TList<TLayoutCell>;
    labelWidthPix, horCellMarginPix : Integer;

    FRowsCount : Integer;
  public
    constructor Create;
    destructor Free; virtual;

    procedure AddCell( ctrlLabel, ctrlEdit: TControl; const cLeft, cTop, cWidth, cHeight: Integer );
    procedure AddRow( const ctrls: TArray2OfControl );
  end;

  TFormLayouts = class
  private
    FLayoutGrids : TList< TLayoutGrid >;
  public
    constructor Create;
    destructor Free; virtual;

    function AddLayout( ctrlPanel: TControl; const colCount, rowCount: Integer;
        const labelWidthPix : Integer; horCellMarginPix: Integer = 10 ) : Integer; deprecated;
    procedure AddLayoutCell( const layoutID : Integer; ctrlLabel, ctrlEdit: TControl;
        const cLeft, cTop, cWidth, cHeight: Integer ); deprecated;

    function Add( ctrlPanel: TControl; const colCount: Integer; const rowCount: Integer = -1;
        const labelWidthPix : Integer = -1; horCellMarginPix: Integer = 10 ) : TLayoutGrid;

    procedure Resize;
  end;

implementation

{ TVectorGrid }

uses uUserSettings;

constructor TLayoutGrid.Create;
begin
  FRowsCount := 0;
  LayoutCells := TList< TLayoutCell >.Create;
end;

destructor TLayoutGrid.Free;
begin
  LayoutCells.Free;
end;

procedure TLayoutGrid.AddCell(ctrlLabel, ctrlEdit: TControl; const cLeft, cTop, cWidth, cHeight: Integer);
var
  sc : TLayoutCell;
begin
  sc.ctrlLabel := ctrlLabel;
  sc.ctrlEdit := ctrlEdit;
  sc.RectC := TRect.Create( TPoint.Create(cLeft, cTop), cWidth, cHeight);

  LayoutCells.Add(sc);
end;

procedure TLayoutGrid.AddRow( const ctrls: TArray2OfControl );
var
  ctrlPair : TArray1OfControl;
  curCol : Integer;
begin
  Inc(FRowsCount);
  curCol := 1;

  for ctrlPair in ctrls do begin
    case High(ctrlPair) + 1 of
      0 : Inc(curCol);
      1 : begin
        AddCell( ctrlPair[0], Nil, curCol, FRowsCount, 1, 1 );
        Inc(curCol);
      end;
      2 : begin
        AddCell( ctrlPair[0], ctrlPair[1], curCol, FRowsCount, 2, 1 );
        curCol := curCol + 2;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------------------

constructor TFormLayouts.Create;
begin
  FLayoutGrids := TList< TLayoutGrid >.Create;
end;

destructor TFormLayouts.Free;
var
  lay : TLayoutGrid;
begin
  for lay in FLayoutGrids do
    lay.Free;

  FLayoutGrids.Free;
end;

function TFormLayouts.AddLayout( ctrlPanel: TControl; const colCount, rowCount: Integer;
        const labelWidthPix : Integer; horCellMarginPix: Integer ) : Integer;
var
  lay : TLayoutGrid;
begin
  lay := TLayoutGrid.Create;

  lay.ctrlPanel := ctrlPanel;
  lay.gridSizeC := TSize.Create( colCount, rowCount );
  lay.labelWidthPix := labelWidthPix;
  lay.horCellMarginPix := horCellMarginPix;

  FLayoutGrids.Add(lay);
  Result := FLayoutGrids.Count;
end;

function TFormLayouts.Add( ctrlPanel: TControl; const colCount: Integer; const rowCount: Integer = -1;
        const labelWidthPix : Integer = -1; horCellMarginPix: Integer = 10 ) : TLayoutGrid;
var
  lay : TLayoutGrid;
begin
  lay := TLayoutGrid.Create;

  lay.ctrlPanel := ctrlPanel;

  lay.gridSizeC := TSize.Create( colCount, rowCount );
  if labelWidthPix = -1
    then lay.labelWidthPix := US.LabelWidth
    else lay.labelWidthPix := labelWidthPix;
  lay.horCellMarginPix := horCellMarginPix;

  FLayoutGrids.Add(lay);
  Result := FLayoutGrids[ FLayoutGrids.Count - 1 ];
end;

procedure TFormLayouts.AddLayoutCell(const layoutID: Integer; ctrlLabel, ctrlEdit: TControl; const cLeft,
  cTop, cWidth, cHeight: Integer);
var
  sc : TLayoutCell;
begin
  if layoutID > FLayoutGrids.Count
    then Exit;

  with FLayoutGrids[ layoutID - 1 ] do
  begin
    sc.ctrlLabel := ctrlLabel;
    sc.ctrlEdit := ctrlEdit;
    sc.RectC := TRect.Create( TPoint.Create(cLeft, cTop), cWidth, cHeight);

    LayoutCells.Add(sc);
  end;
end;

procedure TFormLayouts.Resize;
const
  HOR_PADDING : Integer = 6;
  VER_PADDING : Integer = 4;
  LABEL_EDIT_MARGIN : Integer = 2;
  VER_CELL_MARGIN : Integer = 4;
var
  cellWidthPix, cellHeightPix : Integer;
  txRect: TRect;
  txStr: String;
  grid : TLayoutGrid;
  cell : TLayoutCell;

  function isOneLineControl( var ctrl : TControl ) : Boolean;
  begin
    Result := ( ctrl is TOMScxDBCurrencyEdit ) OR ( ctrl is TOMScxCurrencyEdit )
           OR ( ctrl is TOMScxDBDateEdit ) OR ( ctrl is TOMScxDateEdit )
           OR ( ctrl is TOMScxDBTextEdit ) OR (ctrl is TOMScxTextEdit )
           OR ( ctrl is TOMScxDBExtLookupComboBox ) OR (ctrl is TOMScxExtLookupComboBox )
           OR ( ctrl is TOMScxDBLookupComboBox ) OR (ctrl is TOMScxLookupComboBox )
           OR ( ctrl is TOMScxComboBox )
           OR ( ctrl is TOMScxDBSpinEdit ) OR ( ctrl is TOMScxSpinEdit );
  end;

begin
  for grid in FLayoutGrids do
  begin
    with grid do
    begin
      cellWidthPix := (ctrlPanel.ClientWidth - 2*HOR_PADDING + horCellMarginPix) div gridSizeC.Width - horCellMarginPix;
      cellHeightPix := 22 + ( US.FontSize - 7 ) * 2;

     if Assigned(ctrlPanel) AND not (ctrlPanel.Align in [alClient, alLeft, alRight ] )
        then ctrlPanel.Height := gridSizeC.Height * (cellHeightPix + VER_CELL_MARGIN) + 2*VER_PADDING - VER_CELL_MARGIN;

      for cell in LayoutCells do
      begin
        if not Assigned(cell.ctrlLabel) then Continue;

        cell.ctrlLabel.Left         := HOR_PADDING + ( cell.RectC.Left - 1 ) * (cellWidthPix + horCellMarginPix);
        cell.ctrlLabel.Top          := VER_PADDING + ( cell.RectC.Top - 1 ) * (cellHeightPix + VER_CELL_MARGIN);
        if Assigned(cell.ctrlEdit)
          then cell.ctrlLabel.Width := labelWidthPix - LABEL_EDIT_MARGIN
          else cell.ctrlLabel.Width := cell.RectC.Width * (cellWidthPix + horCellMarginPix) - horCellMarginPix;
        cell.ctrlLabel.Height       := cell.RectC.Height * (cellHeightPix + VER_CELL_MARGIN) - VER_CELL_MARGIN;

        if not Assigned(cell.ctrlEdit) then Continue;

        cell.ctrlEdit.Left   := HOR_PADDING + (cell.RectC.Left - 1) * (cellWidthPix + horCellMarginPix) + labelWidthPix;
        cell.ctrlEdit.Top    := VER_PADDING + (cell.RectC.Top - 1) * (cellHeightPix + VER_CELL_MARGIN);
        cell.ctrlEdit.Width  := (cellWidthPix - labelWidthPix) + (cell.RectC.Width - 1) * (cellWidthPix + horCellMarginPix);
        cell.ctrlEdit.Height := cell.RectC.Height * (cellHeightPix + VER_CELL_MARGIN) - VER_CELL_MARGIN;
      end;
    end;
  end;
end;

end.
