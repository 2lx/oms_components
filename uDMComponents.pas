unit uDMComponents;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls, cxGraphics;

type
  TDMOMSComponents = class(TDataModule)
    ImageListNavigator: TcxImageList;
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

end.
