unit uOtherUtils;

interface

function getDateWithZeroTime( const dt: TDateTime ) : TDateTime;
function getTextLineCount( const strText : String ) : Integer;
function getRussianMonthName( const mID : Integer ) : WideString;
function getMonthYear( const dt : TDateTime ) : WideString;

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

function getRussianMonthName( const mID : Integer ) : WideString;
const
  RusLongMonthNames : array[1..12] of string = ( 'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
        'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь' );
begin
  Result := RusLongMonthNames[ mID ];
end;

function getMonthYear( const dt : TDateTime ) : WideString;
var
  wYear, wMonth, wDay: Word;
begin
  DecodeDate(dt, wYear, wMonth, wDay);

  Result := getRussianMonthName( wMonth ) + ' ' + IntToStr( wYear );
end;

end.
