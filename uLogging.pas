unit uLogging;

interface

procedure logQueryError(const AQName, AQSQLText, QEType, QError : String);
function formatNoteText( const strText : String ): String;

implementation

uses uDataBase, SysUtils, uUserSettings;

procedure logQueryError(const AQName, AQSQLText, QEType, QError : String);
begin
  try
    DBProcedureNil( 'OMS_PROGRAMERRORLOG_Insert', [ AQName, AQSQLText, QEType, QError ] )
  except
  end;
end;

function formatNoteText( const strText : String ): String;
begin
  Result := #13#10 + FormatDateTime('dd/mm/yy hh:mm', Now ) + ' ' + US.DBUserRusName + ': ' + Trim( strText ) + '.'
end;

end.

