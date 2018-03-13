unit uOMScxComboBox;

interface

uses Classes, cxDropDownEdit, Windows;

type
  TProcPropertiesHandler = procedure( Sender: TObject ) of object;

  TOMScxComboBox = class(TcxComboBox)
  private
    FUserProcPropertiesHandler : TProcPropertiesHandler;

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

uses uOMSStyle, Graphics;

constructor TOMScxComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxComboBox.Loaded;
begin
  inherited;

  Properties.DropDownListStyle := lsEditFixedList;

  if Properties.DropDownRows < 20
    then Properties.DropDownRows := 20;
  if Properties.DropDownWidth < 600
    then Properties.DropDownWidth := 600;

  OnMouseWheel := MouseWheelHandler;

  if Assigned( Properties.OnPropertiesChanged )
    then FUserProcPropertiesHandler := Properties.OnPropertiesChanged;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxComboBox.MouseWheelHandler(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TOMScxComboBox.DropDownDisableHandler(Sender: TObject);
begin
  (Sender as TcxCustomDropDownEdit).DroppedDown := False;
end;

procedure TOMScxComboBox.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxComboBox.PropertiesChangeHandler(Sender: TObject);
begin
  if Assigned( FUserProcPropertiesHandler )
    then FUserProcPropertiesHandler(Sender);

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
