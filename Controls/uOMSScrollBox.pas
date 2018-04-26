unit uOMSScrollBox;

interface

uses Forms, Classes, Controls;

type
  TOMSScrollBox = class(TScrollBox)
  private

  protected
    procedure Loaded; override;
    procedure AutoScrollInView(AControl: TControl); override;

  published
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

constructor TOMSScrollBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TOMSScrollBox.Loaded;
begin
  inherited;

end;

procedure TOMSScrollBox.AutoScrollInView(AControl: TControl);
begin
  //
end;

end.
