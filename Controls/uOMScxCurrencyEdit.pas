unit uOMScxCurrencyEdit;

interface

uses Classes, cxCurrencyEdit, Windows;

type
  TOMScxCurrencyEdit = class(TcxCurrencyEdit)
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

constructor TOMScxCurrencyEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxCurrencyEdit.Loaded;
begin
  inherited;

  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxCurrencyEdit.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxCurrencyEdit.PropertiesChangeHandler(Sender: TObject);
begin
  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
