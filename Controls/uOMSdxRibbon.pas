unit uOMSdxRibbon;

interface

uses Classes, dxRibbon;

type
  TOMSdxRibbon = class(TdxRibbon)
  private

  protected
    procedure Loaded; override;

  published
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses dxRibbonSkins;

constructor TOMSdxRibbon.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TOMSdxRibbon.Loaded;
begin
  inherited;

  PopupMenuItems := [ rpmiMinimizeRibbon ];
  Style := rs2013;
  ColorSchemeName := 'DarkGray';
  ColorSchemeAccent := rcsaPurple;
end;

end.
