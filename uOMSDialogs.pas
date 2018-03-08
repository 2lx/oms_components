unit uOMSDialogs;

interface

procedure ShowInformation(const str : String );
procedure ShowWarning(const str : String );
procedure ShowError(const str : String );
function ShowQuestionYesNo( const str : String ) : Boolean;

implementation

uses Dialogs, Controls;

procedure ShowInformation(const str : String );
begin
  MessageDlg( str, mtInformation, [ mbOK ], 0, mbOk );
end;

procedure ShowWarning(const str : String );
begin
  MessageDlg( str, mtWarning, [ mbOK ], 0, mbOk );
end;

procedure ShowError(const str : String );
begin
  MessageDlg( str, mtError, [ mbOK ], 0, mbOk );
end;

function ShowQuestionYesNo( const str : String ) : Boolean;
begin
  Result := mrYes = MessageDlg( str, mtConfirmation, [ mbYes, mbNo ], 0 );
end;

end.
