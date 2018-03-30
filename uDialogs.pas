unit uDialogs;

interface

procedure ShowInformation(const str : String );
procedure ShowWarning(const str : String );
procedure ShowError(const str : String );
function ShowQuestionYesNo( const str : String ) : Boolean;
function ShowInputString( const str : String ) : String;

implementation

uses ClipBrd, Windows, Forms, Dialogs;

procedure ShowInformation(const str : String );
begin
  Windows.MessageBox( Application.Handle, PChar(str), PChar('����������'), MB_OK or MB_ICONINFORMATION  );
end;

procedure ShowWarning(const str : String );
begin
  Windows.MessageBox( Application.Handle, PChar(str), PChar('��������������'), MB_OK or MB_ICONWARNING  );
end;

procedure ShowError(const str : String );
begin
  Clipboard.AsText := str;
  Windows.MessageBox( Application.Handle, PChar(str), PChar('������'), MB_OK or MB_ICONERROR  );
end;

function ShowQuestionYesNo( const str : String ) : Boolean;
begin
  Result := idYes = Windows.MessageBox( Application.Handle, PChar(str), PChar('�������������'), MB_YESNO or MB_ICONQUESTION  );
end;

function ShowInputString( const str : String ) : String;
begin
  Result := InputBox( '���� ��� ����� ������', str, '' );
end;

end.
