unit uLogging;

interface

procedure logQueryError(const AQName, AQSQLText, QEType, QError : String);

implementation

uses DataModule;

procedure logQueryError(const AQName, AQSQLText, QEType, QError : String);
begin
  try
    DataForm.OMSQueryOrdersProc( 'OMS_PROGRAMERRORLOG_Insert', [ AQName, AQSQLText, QEType, QError ] )
  except
  end;
end;

end.

