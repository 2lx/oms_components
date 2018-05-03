unit uOMScxDBDateEdit;

interface

uses Classes, cxDBEdit, Windows;

type
  TProcPropertiesHandler = procedure( Sender: TObject ) of object;

  TOMScxDBDateEdit = class(TcxDBDateEdit)
  private
    FUserProcPropertiesHandler : TProcPropertiesHandler;

    procedure PropertiesChangeHandler(Sender: TObject);
    procedure DropDownDisableHandler(Sender: TObject);

  protected
    procedure Loaded; override;
    procedure SetEnabled(Value : Boolean); override;

  public
    constructor Create(AOwner: TComponent); override;

  end;

implementation

uses uOMSComponentStyle, Graphics, cxDropDownEdit;

constructor TOMScxDBDateEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBDateEdit.Loaded;
begin
  inherited;

  Properties.ImmediatePost := True;

  if (Properties.DisplayFormat = '') OR (Properties.DisplayFormat = 'dd.mm.yyyy')
    then Properties.DisplayFormat := 'dd.mm.yy';

  Properties.EditFormat := 'dd.mm.yy';
  Properties.SaveTime := False;
  Properties.ShowTime := False;

  if Assigned( Properties.OnPropertiesChanged )
    then FUserProcPropertiesHandler := Properties.OnPropertiesChanged;
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
