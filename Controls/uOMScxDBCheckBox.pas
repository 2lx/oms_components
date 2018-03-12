unit uOMScxDBCheckBox;

interface

uses Classes, cxDBEdit, Windows;

type
  TOMScxDBCheckBox = class(TcxDBCheckBox)
  private
    procedure PropertiesChangeHandler(Sender: TObject);

  protected
    procedure Loaded; override;
    procedure SetEnabled(Value : Boolean); override;

  public
    constructor Create(AOwner: TComponent); override;

  end;

implementation

uses uOMSStyle, Graphics, cxDropDownEdit;

constructor TOMScxDBCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

procedure TOMScxDBCheckBox.Loaded;
begin
  inherited;

end;

procedure TOMScxDBCheckBox.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxDBCheckBox.PropertiesChangeHandler(Sender: TObject);
begin
  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
