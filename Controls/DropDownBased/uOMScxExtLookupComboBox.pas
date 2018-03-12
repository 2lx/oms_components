unit uOMScxExtLookupComboBox;

interface

uses Classes, cxDBExtLookupComboBox, Windows;

type
  TOMScxExtLookupComboBox = class(TcxExtLookupComboBox)
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

constructor TOMScxExtLookupComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxExtLookupComboBox.Loaded;
begin
  inherited;

  Properties.DropDownListStyle := lsEditFixedList;

  if Properties.DropDownRows < 20
    then Properties.DropDownRows := 20;
  if Properties.DropDownWidth < 600
    then Properties.DropDownWidth := 600;

  OnMouseWheel := MouseWheelHandler;
end;

procedure TOMScxExtLookupComboBox.MouseWheelHandler(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TOMScxExtLookupComboBox.DropDownDisableHandler(Sender: TObject);
begin
  (Sender as TcxCustomDropDownEdit).DroppedDown := False;
end;

procedure TOMScxExtLookupComboBox.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxExtLookupComboBox.PropertiesChangeHandler(Sender: TObject);
begin
  if Properties.ReadOnly
    then begin
      Style.Color := clWindow;
      Properties.OnPopup := DropDownDisableHandler;
    end
    else begin
      Style.Color := clOMSEditableHighlight;
      Properties.OnPopup := Nil;
    end;
end;

end.
