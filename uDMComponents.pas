unit uDMComponents;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls, cxGraphics,
  Vcl.Menus;

type
  TDMOMSComponents = class(TDataModule)
    ImageListNavigator: TcxImageList;
    PopupMenuGridViewSettings: TPopupMenu;
    pmiSelectionType1Cell: TMenuItem;
    pmiSelectionTypeMultiCell: TMenuItem;
    pmiSeparator1: TMenuItem;
    procedure pmiSelectionType1CellClick(Sender: TObject);
    procedure pmiSelectionTypeMultiCellClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function PopupMenuHeight(Popup: TPopupMenu): integer;

var
  DMOMSComponents: TDMOMSComponents;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses cxGrid, uOMScxGridViewCommon, uOMScxGridDBTableView, uOMScxGridDBBandedTableView, Windows;

function PopupMenuHeight(Popup: TPopupMenu): integer;
var
  info : tagMENUINFO;
  i, y : Integer;
begin
  FillChar( info, SizeOf( info ), 0);
  info.cbSize := SizeOf( info );
  info.fMask := MIM_MAXHEIGHT;

  if GetMenuInfo( Popup.Handle, info ) and ( info.cyMax > 0 )
    then Result := info.cyMax
    else
    begin
      y := Round(GetSystemMetrics(SM_CYMENUCHECK) *1.4);
      Result := 0;
      if Popup.Items.Count > 0 then
      begin
        for i := 0 to Popup.Items.Count -1 do
          if Popup.Items[i].Visible
            then Inc(Result, y);
      end;
    end;
end;

procedure TDMOMSComponents.pmiSelectionType1CellClick(Sender: TObject);
begin
  if (PopupMenuGridViewSettings.PopupComponent is TOMScxGridDBTableView)
    then (PopupMenuGridViewSettings.PopupComponent as TOMScxGridDBTableView).setSelectionType( gstOneCellOneRow );
end;

procedure TDMOMSComponents.pmiSelectionTypeMultiCellClick(Sender: TObject);
begin
  if (PopupMenuGridViewSettings.PopupComponent is TOMScxGridDBTableView)
    then (PopupMenuGridViewSettings.PopupComponent as TOMScxGridDBTableView).setSelectionType( gstMultiCellMultiRow );
end;

end.
