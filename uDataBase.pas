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

function DBFunction( funcName: String; const params: array of Variant; out RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;

function DBUserSettingsSet(const SName : String; const SValue : Variant) : Boolean;
function DBUserSettingsGet(const SName : String ) : Variant;

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
  Result := False;
  RValue := Null;

{  if not DataForm.adoconnOrdersForSch.Connected then
  begin
    ShowError( 'Ошибка. Вы не подключены к БД.' );
    Exit;
  end;
}
  try
    adoq := TOMSADOQuery.Create(Nil);
    adoq.Connection := DataForm.adoconnOrdersForSch;
    adoq.LockType := ltReadOnly;

    strSQL := 'EXEC [' + getCatalog( dbCatalog ) + '].' + dbScheme + '.[' + procName + '] ';
    strSQL := strSQL + parseParameters( adoq, params );
    adoq.SQL.Text := strSQL;

    if ( not adoq.SafeOpen ) OR ( adoq.FindField('Result') = Nil ) then
    begin
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

function DBFunction( funcName: String; const params: array of Variant; out RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;
var
  strResult: String;
  adoq : TOMSADOQuery;
  strSQL : String;
begin
  Result := False;

  try
    adoq := TOMSADOQuery.Create(Nil);
    adoq.Connection := DataForm.adoconnOrdersForSch;
    adoq.LockType := ltReadOnly;

    strSQL := 'SELECT [' + getCatalog( dbCatalog ) + '].' + dbScheme + '.[' + funcName + '] ( ';
    strSQL := strSQL + parseParameters( adoq, params );
    strSQL := strSQL + ' ) AS Result';
    adoq.SQL.Text := strSQL;

    if (adoq.SafeOpen ) AND ( not adoq.Eof ) then
    begin
      RValue := adoq.FieldByName( 'Result' ).Value;
      Result := True;
    end;
  finally
    adoq.Free;
  end;
end;

function DBUserSettingsSet(const SName : String; const SValue : Variant) : Boolean;
var
  baseType : Integer;
begin
  baseType := VarType( SValue ) and VarTypeMask;

  case baseType of
    varDate :     Result := DBProcedure( 'OMS_USERSETTINGS_SetDateTime', [ SName, TDateTime( SValue ) ] );
    varBoolean :  Result := DBProcedure( 'OMS_USERSETTINGS_SetBoolean', [ SName, Boolean( SValue ) ] );
    varInteger :  Result := DBProcedure( 'OMS_USERSETTINGS_SetInteger', [ SName, Integer( SValue ) ] );
    varString  :  begin
      if (String( SValue )[1] = '{') AND (Length(String( SValue) ) = 38)
        then Result := DBProcedure( 'OMS_USERSETTINGS_SetGUID', [ SName, SValue ] )
        else Result := DBProcedure( 'OMS_USERSETTINGS_SetString', [ SName, String( SValue ) ] );
    end
  end;
end;

function DBUserSettingsGet(const SName : String ) : Variant;
var
  adoq : TOMSADOQuery;
begin
  try
    adoq := TOMSADOQuery.Create(Nil);
    adoq.Connection := DataForm.adoconnOrdersForSch;
    adoq.LockType := ltReadOnly;

    adoq.SQL.Text := 'EXEC [ORDERS].dbo.[OMS_USERSETTINGS_GET]';

    if ( not adoq.SafeOpen ) OR ( adoq.Eof )
      then Result := Null
      else Result := adoq.FieldByName( SName ).Value;
  finally
    adoq.Free;
  end;
end;

end.
