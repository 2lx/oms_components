unit uOMSMainForm;

interface

uses Forms, Messages, uAppMessages, Classes, uOMSForm;

type
  TOMSMainForm = class abstract( TForm )
  private
    FIsCloseAllWindows : Boolean;
    FLastActiveMDIForm : THandle;

    procedure ActiveFormChangedHandler(Sender: TObject);

    procedure WMSysCommand( var Msg: TWMSysCommand ); message WM_SYSCOMMAND;
    procedure MDIFormAfterShow( var Msg: TWMSysCommand ); message WM_MDIFORM_AFTER_SHOW;

  protected
    procedure ActivateMDIForm; virtual; abstract;
    procedure ActivateNoMDIForms; virtual; abstract;
    procedure DoShow; override;

    procedure EditSingleInstancedOMSForm< TBaseForm : TOMSForm >( var frm : TBaseForm );
    procedure EditSingleInstancedOldForm< TBaseForm : TForm >( var frm : TBaseForm );
    procedure EditMultipleInstancedOMSForm< TBaseForm : TOMSForm >( const GUID: Variant;
          frmCaption : WideString; needCompareCaption : Boolean = False );

  public
    constructor Create(AOwner: TComponent); override;

    function CloseQuery : Boolean; override;

    procedure LockProgram; virtual;
    procedure UnlockProgram; virtual;

  end;

implementation

uses Controls, Windows, uDialogs;

constructor TOMSMainForm.Create(AOwner: TComponent);
begin
  inherited;

  FLastActiveMDIForm := 0;
  FIsCloseAllWindows := False;
  Screen.OnActiveFormChange := ActiveFormChangedHandler;
end;

procedure TOMSMainForm.DoShow;
begin
  inherited;

  FIsCloseAllWindows := False;
end;

procedure TOMSMainForm.WMSysCommand(var Msg: TWMSysCommand);
begin
  if Msg.CmdType = SC_MINIMIZE then
  begin
    Application.Minimize;
  end
  else inherited;
end;

procedure TOMSMainForm.MDIFormAfterShow( var Msg: TWMSysCommand );
begin
  ActivateMDIForm;
end;

procedure TOMSMainForm.ActiveFormChangedHandler(Sender: TObject);
begin
  if FIsCloseAllWindows then Exit;

  if ( MDIChildCount = 0 ) OR ( ActiveMDIChild = Nil ) then
  begin
    FLastActiveMDIForm := 0;
    ActivateNoMDIForms;
    Exit;
  end
  else if ( FLastActiveMDIForm = ActiveMDIChild.Handle )
    then Exit;

  FLastActiveMDIForm := ActiveMDIChild.Handle;

  ActivateMDIForm;
end;

function TOMSMainForm.CloseQuery: Boolean;
begin
  Result := ShowQuestionYesNo( 'Вы уверены, что хотите закрыть программму?' );

  if Result then begin
    FIsCloseAllWindows := True;
    Result := inherited CloseQuery; // close every MDIchild forms sequently
  end;
end;

//--------------------------------------------------------------------------------------------------

procedure TOMSMainForm.EditSingleInstancedOMSForm< TBaseForm >( var frm : TBaseForm );
begin
  try
    LockProgram;

    if frm = Nil then
    begin
      frm := TBaseForm.Create( Self );
      frm.Show;
    end
    else frm.BringToFront;
  finally
    UnlockProgram;
  end;
end;

procedure TOMSMainForm.EditSingleInstancedOldForm< TBaseForm >( var frm : TBaseForm );
begin
  try
    LockProgram;

    if frm = Nil then
    begin
      frm := TBaseForm.Create( Self );
      frm.Show;
    end
    else frm.BringToFront;
  finally
    UnlockProgram;
  end;
end;

procedure TOMSMainForm.EditMultipleInstancedOMSForm< TBaseForm >( const GUID: Variant; frmCaption : WideString;
      needCompareCaption : Boolean );
var
  frm: TOMSForm;
  i : Integer;
begin
  try
    LockProgram;

    for i := 0 to MDIChildCount - 1 do
      if ( MDIChildren[ i ] is TOMSForm ) AND ( ( MDIChildren[ i ] as TOMSForm ).ObjGUID = GUID )
          AND (( not needCompareCaption ) OR ( ( MDIChildren[ i ] as TOMSForm ).Caption = frmCaption ))
        then begin
          MDIChildren[ i ].BringToFront;
          Exit;
        end;

    frm := TBaseForm.Create( Self, GUID );
    frm.Caption := frmCaption;
    frm.Show;
  finally
    UnlockProgram;
  end;
end;

procedure TOMSMainForm.LockProgram;
begin
  ( Self as TControl ).Enabled := False;
end;

procedure TOMSMainForm.UnlockProgram;
begin
  ( Self as TControl ).Enabled := True;
end;

end.
