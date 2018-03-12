unit uOMScxDBCurrencyEdit;

interface

uses Classes, cxDBEdit, Windows;

type
  TOMScxDBCurrencyEdit = class(TcxDBCurrencyEdit)
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

constructor TOMScxDBCurrencyEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBCurrencyEdit.Loaded;
begin
  inherited;

  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBCurrencyEdit.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxDBCurrencyEdit.PropertiesChangeHandler(Sender: TObject);
begin
  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
