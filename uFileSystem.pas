unit uFileSystem;

interface

function GetTempDirectory : String;

implementation

uses Windows, SysUtils;

function GetTempDirectory : String;
var
  tempFolder: array [0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

end.
