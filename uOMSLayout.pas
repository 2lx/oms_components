unit uOMSLayout;

interface

uses Controls, Types, System.Generics.Collections;

type
  TLayoutCell = record
    compLbl : TControl;
    compEdit : TControl;
    Rect : TRect;
  end;

  TLayoutGrid = record
    LayoutCells : TList<TLayoutCell>;
    ColumnCount, LabelWidth : Integer;
    CompPanel : TControl;
    CompPanelHeight : Integer;
    BeetweenWidth : Integer;
  end;

  TLayoutVec = class
  private
    FLayoutGrids : TList< TLayoutGrid >;
  public
    constructor Create;
    destructor Free; virtual;

    function AddLayout( const ColumnCount, LabelWidth: Integer; compPanel: TControl;
        const iGridHeight: Integer; const BeetweenW : Integer = 10 ) : Integer;
    procedure AddLayoutCell( const GridID : Integer; compLbl, compEdit: TControl;
        const iLeft, iTop, iWidth, iHeight: Integer );

    procedure Resize;
  end;

implementation

{ TVectorGrid }

uses uUserSettings;

constructor TLayoutVec.Create;
begin
  FLayoutGrids := TList< TLayoutGrid >.Create;
end;

destructor TLayoutVec.Free;
var
  lay : TLayoutGrid;
begin
  for lay in FLayoutGrids do
    lay.LayoutCells.Free;

  FLayoutGrids.Free;
end;

function TLayoutVec.AddLayout(const ColumnCount, LabelWidth: Integer; compPanel: TControl;
  const iGridHeight, BeetweenW: Integer) : Integer;
var
  lay : TLayoutGrid;
begin
  lay.CompPanel := compPanel;
  lay.CompPanelHeight := iGridHeight;
  lay.ColumnCount := ColumnCount;
  lay.LabelWidth := LabelWidth;
  lay.BeetweenWidth := BeetweenW;
  lay.LayoutCells := TList<TLayoutCell>.Create;

  FLayoutGrids.Add(lay);
  Result := FLayoutGrids.Count;
end;

procedure TLayoutVec.AddLayoutCell(const GridID: Integer; compLbl, compEdit: TControl; const iLeft,
  iTop, iWidth, iHeight: Integer);
var
  sc : TLayoutCell;
begin
  if GridID > FLayoutGrids.Count
    then Exit;

  with FLayoutGrids[ GridID - 1 ] do
  begin
    sc.compLbl := compLbl;
    sc.compEdit := compEdit;
    sc.Rect := TRect.Create( TPoint.Create(iLeft, iTop), iWidth, iHeight);

    LayoutCells.Add(sc);
  end;
end;

procedure TLayoutVec.Resize;
var
  cw, dw, dh, k : Integer;
  txRect: TRect;
  txStr: String;
  lay : TLayoutGrid;
  sc : TLayoutCell;
begin
  for lay in FLayoutGrids do
  begin
    with lay do
    begin
      cw := CompPanel.ClientWidth - BeetweenWidth;
      dw := cw div ColumnCount;
      dh := 30 + ( US.FontSize - 7 ) * 2;

     if ( CompPanel <> Nil )
        then CompPanel.Height := CompPanelHeight * dh + 10;

      for sc in LayoutCells do
      begin
        if sc.compLbl = Nil
          then Break;

{        if LayoutCells[ i ].compLbl is TcxLabel then
          with ( LayoutCells[ i ].compLbl As TcxLabel ) do
            if ( Properties.Alignment.Horz = taLeftJustify )
              then} sc.compLbl.Height := sc.Rect.Height * dh - 8;

        sc.compLbl.Left := ( sc.Rect.Left - 1 ) * dw + BeetweenWidth;
        sc.compLbl.Top := ( sc.Rect.Top - 1 ) * dh + 8;

        if Assigned(sc.compLbl) then
{        if ( sc.compLbl is TcxImage ) OR ( LayoutCells[ i ].compLbl is TcxGrid )
            OR ( LayoutCells[ i ].compLbl is TcxDBImage ) OR ( LayoutCells[ i ].compLbl is TcxButton )
            OR ( LayoutCells[ i ].compLbl is TcxDBMemo )
            OR ( LayoutCells[ i ].compLbl is TListBox ) OR ( LayoutCells[ i ].compLbl is TcxMemo )
          then } sc.compLbl.Height := sc.Rect.Height * dh - 8;

        if sc.compEdit = Nil
          then sc.compLbl.Width := sc.Rect.Width * dw - BeetweenWidth
          else
          begin
            sc.compLbl.Width := LabelWidth - BeetweenWidth - 4;

            sc.compEdit.Left := ( sc.Rect.Left - 1 ) * dw + LabelWidth;
            sc.compEdit.Top := ( sc.Rect.Top - 1 ) * dh + 8;

            sc.compEdit.Width := ( dw - LabelWidth ) + ( sc.Rect.Width - 1 ) * dw;
            sc.compEdit.Height := sc.Rect.Height * dh - 8;
          end;
      end;
    end;
  end;
end;

end.
