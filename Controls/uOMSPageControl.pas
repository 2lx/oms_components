unit uOMSPageControl;

interface

uses Classes, ComCtrls;

type
  TProcChangeHandler = procedure( Sender: TObject ) of object;

  TOMSPageControl = class(TPageControl)
  private
    FUserChangeHandler: TProcChangeHandler;

    procedure ChangeHandler( Sender: TObject );

  protected
    procedure Loaded; override;

  published
  public
    constructor Create(AOwner: TComponent); override;

    procedure OpenFirstVisibleTab;
  end;

implementation

uses uOMSStyle, Graphics, Controls;

constructor TOMSPageControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TOMSPageControl.Loaded;
begin
  inherited;

  if Assigned(OnChange)
    then FUserChangeHandler := OnChange;
  OnChange := Nil;

  OpenFirstVisibleTab;

  OnChange := ChangeHandler;
end;

procedure TOMSPageControl.ChangeHandler(Sender: TObject);
begin
  if ActivePageIndex = -1 then Exit;

  if Assigned( FUserChangeHandler )
    then FUserChangeHandler( Sender );
end;

procedure TOMSPageControl.OpenFirstVisibleTab;
var
  i : Integer;
  wasFound : Boolean;
  page : TTabSheet;
begin
  wasFound := False;

  for i := 0 to PageCount - 1 do
    if Pages[ i ].TabVisible then
    begin
      ActivePageIndex := i;
      wasFound := True;
      Break;
    end;

  if not wasFound
    then ActivePageIndex := -1;
end;

end.
