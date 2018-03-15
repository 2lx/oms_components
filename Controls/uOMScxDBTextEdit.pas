unit uOMScxDBTextEdit;

interface

uses Classes, cxDBEdit, Windows;

type
  TProcPropertiesHandler = procedure( Sender: TObject ) of object;

  TOMScxDBTextEdit = class(TcxDBTextEdit)
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

constructor TOMScxDBTextEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Style.Color := clOMSEditableHighlight;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBTextEdit.Loaded;
begin
  inherited;

  Properties.ImmediatePost := True;

  if Assigned( Properties.OnPropertiesChanged )
    then FUserProcPropertiesHandler := Properties.OnPropertiesChanged;
  Properties.OnPropertiesChanged := PropertiesChangeHandler;
end;

procedure TOMScxDBTextEdit.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;   // call PropertiesChanged
end;

procedure TOMScxDBTextEdit.PropertiesChangeHandler(Sender: TObject);
begin
  if Assigned( FUserProcPropertiesHandler )
    then FUserProcPropertiesHandler(Sender);

  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

end.
