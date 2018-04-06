unit uOtherUtils;

interface

function getDateWithZeroTime( const dt: TDateTime ) : TDateTime;

implementation

uses DateUtils, SysUtils;

function getDateWithZeroTime( const dt: TDateTime ) : TDateTime;
var
  deadline : TDateTime;
  zeroTime : TDateTime;
begin
  deadline := dt;
  zeroTime := EncodeTime(0, 0, 0, 0);
  ReplaceTime( deadline, zeroTime);
end;

end.
