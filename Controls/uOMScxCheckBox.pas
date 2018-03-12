unit uOMScxCheckBox;

interface

uses Classes, cxCheckBox, Windows;

type
  TOMScxCheckBox = class(TcxCheckBox)
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

constructor TOMScxCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxCheckBox.Loaded;
begin
  inherited;

  AutoSize := True;

  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxCheckBox.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxCheckBox.PropertiesChangeHandler(Sender: TObject);
begin
  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
