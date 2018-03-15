unit uOMScxDBCurrencyEdit;

interface

uses Classes, cxDBEdit, Windows;

type
  TProcPropertiesHandler = procedure( Sender: TObject ) of object;

  TOMScxDBCurrencyEdit = class(TcxDBCurrencyEdit)
  private
    FUserProcPropertiesHandler : TProcPropertiesHandler;

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

  Properties.ImmediatePost := True;

  if Assigned( Properties.OnPropertiesChanged )
    then FUserProcPropertiesHandler := Properties.OnPropertiesChanged;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBCurrencyEdit.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxDBCurrencyEdit.PropertiesChangeHandler(Sender: TObject);
begin
  if Assigned( FUserProcPropertiesHandler )
    then FUserProcPropertiesHandler(Sender);

  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
