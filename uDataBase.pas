unit uDataBase;

interface

type
  TDBCatalog = (
    dbOrders,
    dbPlaneta,
    dbBudget,
    dbManagement
  );

function DBProcedure( procName: String; const params: array of Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo') : Boolean;

function DBProcedureResult( procName: String; const params: array of Variant; out RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo') : Boolean;

function DBFunction( funcName: String; const params: array of Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Variant;

implementation

uses ADODB, DataModule, SysUtils, uOMSADOQuery, uOMSDialogs, uLogging, Variants;

function getCatalog( const dbc: TDBCatalog ) : String;
begin
  case dbc of
    dbOrders : Result := 'ORDERS';
    dbPlaneta : Result := 'PLANETA';
    dbBudget : Result := 'BUDGET';
    dbManagement : Result := 'MANAGEMENT';
    else Result := '';
  end;
end;

function parseParameters(var adoq : TOMSADOQuery; const params : array of Variant) : String;
var
  i: Integer;
  strResult, paramName : String;
begin
  for i := 0 to High(params) do
  begin
    if i > 0
      then Result := Result + ', ';

    paramName := 'param' + IntToStr( i );
    Result := Result + ' :' + paramName;

    with adoq.Parameters.AddParameter do
    begin
      Name := paramName;
      Value := params[ i ];
    end;
  end;
end;

function DBProcedure( procName: String; const params: array of Variant;
    const dbCatalog : TDBCatalog; const dbScheme: String ) : Boolean;
var
  RValue : Variant;
begin
  Result := DBProcedureResult( procName, params, RValue, dbCatalog, dbScheme );
end;

function DBProcedureResult( procName: String; const params: array of Variant; out RValue: Variant;
    const dbCatalog : TDBCatalog; const dbScheme: String ) : Boolean;
var
  strResult: String;
  adoq : TOMSADOQuery;
  strSQL : String;
begin
  Result := True;
  RValue := Null;

  try
    adoq := TOMSADOQuery.Create(Nil);
    adoq.Connection := DataForm.adoconnOrdersForSch;
    adoq.LockType := ltReadOnly;

    strSQL := 'EXEC [' + getCatalog( dbCatalog ) + '].' + dbScheme + '.[' + procName + '] ';
    strSQL := strSQL + parseParameters( adoq, params );
    adoq.SQL.Text := strSQL;

    if ( not adoq.SafeOpen ) OR ( adoq.FindField('Result') = Nil ) then
    begin
      Result := False;
      adoq.Free;
      Exit;
    end;

    strResult := adoq.FieldByName('Result').AsWideString;
    Result := strResult = 'Успешно';

    if not Result then
    begin
      if adoq.FindField('ErrorReport') <> Nil then
      begin
        strResult := adoq.FieldByName('ErrorReport').AsWideString;
        logQueryError( 'temp', adoq.SQL.Text, 'ProcOpenError', strResult );
      end;

      ShowError( strResult );
    end
    else if ( adoq.FindField('ResultValue') <> Nil )
      then RValue := adoq.FieldByName( 'ResultValue' ).Value;

  finally
    adoq.Free;
  end;
end;

function DBFunction( funcName: String; const params: array of Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Variant;
var
  strResult: String;
  adoq : TOMSADOQuery;
  strSQL : String;
begin
  Result := True;

  try
    adoq := TOMSADOQuery.Create(Nil);
    adoq.Connection := DataForm.adoconnOrdersForSch;
    adoq.LockType := ltReadOnly;

    strSQL := 'SELECT [' + getCatalog( dbCatalog ) + '].' + dbScheme + '.[' + funcName + '] ( ';
    strSQL := strSQL + parseParameters( adoq, params );
    strSQL := strSQL + ' ) AS Result';
    adoq.SQL.Text := strSQL;

    if ( not adoq.SafeOpen ) OR ( adoq.Eof ) then
    begin
      Result := Null;
      adoq.Free;
      Exit;
    end
    else Result := adoq.FieldByName( 'Result' ).Value;
  finally
    adoq.Free;
  end;
end;

end.
