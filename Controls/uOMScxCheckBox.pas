unit uOMScxCheckBox;

interface

uses Classes, cxCheckBox, Windows;

type
  TProcPropertiesHandler = procedure( Sender: TObject ) of object;

  TOMScxCheckBox = class(TcxCheckBox)
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

constructor TOMScxCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxCheckBox.Loaded;
begin
  inherited;

  AutoSize := True;

  if Assigned( Properties.OnPropertiesChanged )
    then FUserProcPropertiesHandler := Properties.OnPropertiesChanged;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxCheckBox.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxCheckBox.PropertiesChangeHandler(Sender: TObject);
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
