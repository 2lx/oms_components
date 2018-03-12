unit uOMScxDBMemo;

interface

uses Classes, cxDBEdit, Windows;

type
  TOMScxDBMemo = class(TcxDBMemo)
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

constructor TOMScxDBMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBMemo.Loaded;
begin
  inherited;

  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBMemo.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBMemo.PropertiesChangeHandler(Sender: TObject);
begin
  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
