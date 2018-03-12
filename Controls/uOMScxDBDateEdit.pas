unit uOMScxDBDateEdit;

interface

uses Classes, cxDBEdit, Windows;

type
  TOMScxDBDateEdit = class(TcxDBDateEdit)
  private
    procedure PropertiesChangeHandler(Sender: TObject);
    procedure DropDownDisableHandler(Sender: TObject);

  protected
    procedure Loaded; override;
    procedure SetEnabled(Value : Boolean); override;

  public
    constructor Create(AOwner: TComponent); override;

  end;

implementation

uses uOMSStyle, Graphics, cxDropDownEdit;

constructor TOMScxDBDateEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBDateEdit.Loaded;
begin
  inherited;

  Properties.DisplayFormat := 'dd.mm.yyyy';
  Properties.EditFormat := 'dd.mm.yyyy';
  Properties.SaveTime := False;
  Properties.ShowTime := False;

  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBDateEdit.DropDownDisableHandler(Sender: TObject);
begin
  (Sender as TcxCustomDropDownEdit).DroppedDown := False;
end;

procedure TOMScxDBDateEdit.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxDBDateEdit.PropertiesChangeHandler(Sender: TObject);
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
