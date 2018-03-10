unit uOMScxLabel;

interface

uses cxLabel, Classes;

type
  TOMScxLabel = class(TcxLabel)
  private

  protected
    procedure Loaded; override;

  published
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses uOMSStyle, Graphics, Controls;

constructor TOMScxLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TOMScxLabel.Loaded;
begin
  inherited;

  if Assigned(OnDblClick) then
  begin
    Style.TextColor := clOMSSpecialDarkBlueGreen;
    Style.TextStyle := [ fsUnderline ];
    Cursor := crHandPoint;
  end;

  if Properties.Alignment.Horz = taLeftJustify
    then AutoSize := True;
  Properties.WordWrap := True;
end;

end.
