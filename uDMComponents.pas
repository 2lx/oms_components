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

var
  DMOMSComponents: TDMOMSComponents;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses cxGrid, uOMScxGridDBTableView;

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
