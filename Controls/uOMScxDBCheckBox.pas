unit uOMScxDBCheckBox;

interface

uses Classes, cxDBEdit, Windows;

type
  TProcPropertiesHandler = procedure( Sender: TObject ) of object;

  TOMScxDBCheckBox = class(TcxDBCheckBox)
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

constructor TOMScxDBCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBCheckBox.Loaded;
begin
  inherited;

  AutoSize := True;
  Properties.ImmediatePost := True;

  if Assigned( Properties.OnPropertiesChanged )
    then FUserProcPropertiesHandler := Properties.OnPropertiesChanged;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBCheckBox.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxDBCheckBox.PropertiesChangeHandler(Sender: TObject);
begin
  if Assigned( FUserProcPropertiesHandler )
    then FUserProcPropertiesHandler(Sender);

  if Properties.ReadOnly then
  begin
    ParentBackground := True;
  end
  else
  begin
    ParentBackground := False;
    Style.Color := clOMSEditableHighlight;
  end;
end;

end.
