unit uOMSdxRibbon;

interface

uses Classes, dxRibbon, Windows;

type
  TOMSdxRibbon = class(TdxRibbon)
  private
    procedure MouseWheelHandler(Sender: TObject; Shift: TShiftState;
        WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

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

  ActiveTab := Tabs[0];
  if Tabs.Count = 1
    then ShowTabHeaders := False;

  PopupMenuItems := [ rpmiMinimizeRibbon ];
  Style := rs2013;
  ColorSchemeName := 'DarkGray';
  ColorSchemeAccent := rcsaPurple;

  OnMouseWheel := MouseWheelHandler;
end;

procedure TOMSdxRibbon.MouseWheelHandler(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

end.
