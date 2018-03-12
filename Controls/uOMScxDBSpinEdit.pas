unit uOMScxDBSpinEdit;

interface

uses Classes, cxDBEdit, Windows;

type
  TOMScxDBSpinEdit = class(TcxDBSpinEdit)
  private
    procedure PropertiesChangeHandler(Sender: TObject);
    procedure DropDownDisableHandler(Sender: TObject);
    procedure MouseWheelHandler(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
          MousePos: TPoint; var Handled: Boolean);

  protected
    procedure Loaded; override;
    procedure SetEnabled(Value : Boolean); override;

  public
    constructor Create(AOwner: TComponent); override;

  end;

implementation

uses uOMSStyle, Graphics, cxDropDownEdit;

constructor TOMScxDBSpinEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBSpinEdit.Loaded;
begin
  inherited;

  OnMouseWheel := MouseWheelHandler;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBSpinEdit.MouseWheelHandler(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TOMScxDBSpinEdit.DropDownDisableHandler(Sender: TObject);
begin
  (Sender as TcxCustomDropDownEdit).DroppedDown := False;
end;

procedure TOMScxDBSpinEdit.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxDBSpinEdit.PropertiesChangeHandler(Sender: TObject);
begin
  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
