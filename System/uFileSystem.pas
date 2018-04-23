unit uFileSystem;

interface

function GetTempDirectory : String;
procedure OpenFileDefApp( const fileName : String; ReadOnly: Boolean = False );

implementation

uses Windows, SysUtils, ShellAPI, Forms;

function GetTempDirectory : String;
var
  tempFolder: array [0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

procedure OpenFileDefApp( const fileName : String; ReadOnly: Boolean );
begin
  if ReadOnly
    then SetFileAttributes( PChar(FileName), FILE_ATTRIBUTE_READONLY );

  ShellExecute(Application.Handle, 'open', PWideChar(fileName), nil, nil, SW_SHOWNORMAL);

{  if ReadOnly
    then SetFileAttributes( PChar(FileName), FILE_ATTRIBUTE_NORMAL );}
end;

end.
