unit uStrToFloatLocal;

interface
uses System.SysUtils, WinApi.Windows;

function TryStrToFloatAny(const Value: string; out FValue: single): boolean;

implementation

function DotSettings: TFormatSettings;
begin
  GetLocaleFormatSettings (GetThreadLocale, Result);
  Result.DecimalSeparator := '.';
end;

function CommaSettings: TFormatSettings;
begin
  GetLocaleFormatSettings (GetThreadLocale, Result);
  Result.DecimalSeparator := ',';
end;

{
function StrToFloatDot(const Value: string): single;
begin
  Result := StrToFloat (Value, DotSettings);
end;


function StrToFloatComma(const Value: string): single;
begin
  Result := StrToFloat (Value, CommaSettings);
end;

function StrToFloatAny (const Value: string): single;
begin
  if not TryStrToFloat (Value, Result, CommaSettings) then
    Result := StrToFloat (Value, DotSettings);
end;

function TryStrToFloatDot (const Value: string; out FValue: single): boolean;
begin
  Result := TryStrToFloat (Value, FValue, DotSettings);
end;

function TryStrToFloatComma (const Value: string; out FValue: single): boolean;
begin
  Result := TryStrToFloat (Value, FValue, CommaSettings);
end;
}
function TryStrToFloatAny(const Value: string; out FValue: single): boolean;
begin
{  Result:=TryStrToFloatComma(Value, FValue);  // пробуем перевести используя запятую
  if not Result then                  // если не прошло пробуем точку
    Result:=TryStrToFloatDot(Value, FValue);
}
  Result := TryStrToFloat(Value, FValue, CommaSettings);
  if not Result then
    Result := TryStrToFloat(Value, FValue, DotSettings);
end;

end.
