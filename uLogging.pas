unit uLogging;

interface

procedure logQueryError(const AQName, AQSQLText, QEType, QError : String);

implementation

uses uDataBase;

procedure logQueryError(const AQName, AQSQLText, QEType, QError : String);
begin
  try
    DBProcedure( 'OMS_PROGRAMERRORLOG_Insert', [ AQName, AQSQLText, QEType, QError ] )
  except
  end;
end;

end.

