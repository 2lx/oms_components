unit uOtherUtils;

interface

function getDateWithZeroTime( const dt: TDateTime ) : TDateTime;
function getTextLineCount( const strText : String ) : Integer;

implementation

uses DateUtils, SysUtils, Classes;

function getDateWithZeroTime( const dt: TDateTime ) : TDateTime;
var
  deadline : TDateTime;
  zeroTime : TDateTime;
begin
  deadline := dt;
  zeroTime := EncodeTime(0, 0, 0, 0);
  ReplaceTime( deadline, zeroTime);
end;

function getTextLineCount( const strText : String ) : Integer;
var
  sl : TStringList;
begin
  sl := TStringList.Create;
  sl.SetText( PWideChar(strText) );

  Result := sl.Count;
  sl.Free;
end;

end.
