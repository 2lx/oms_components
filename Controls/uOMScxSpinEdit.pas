unit uOMScxSpinEdit;

interface

uses Classes, cxSpinEdit, Windows;

type
  TOMScxSpinEdit = class(TcxSpinEdit)
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

constructor TOMScxSpinEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxSpinEdit.Loaded;
begin
  inherited;

  OnMouseWheel := MouseWheelHandler;
end;

procedure TOMScxSpinEdit.MouseWheelHandler(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TOMScxSpinEdit.DropDownDisableHandler(Sender: TObject);
begin
  (Sender as TcxCustomDropDownEdit).DroppedDown := False;
end;

procedure TOMScxSpinEdit.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxSpinEdit.PropertiesChangeHandler(Sender: TObject);
begin
  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
