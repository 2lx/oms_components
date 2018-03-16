unit uDataBase;

interface

uses Classes;

type
  TDBCatalog = (
    dbOrders,
    dbPlaneta,
    dbBudget,
    dbManagement
  );

function DBProcedureNil( procName: String; const params: array of Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;

function DBProcedureOwner( AOwner: TComponent; procName: String; const params: array of Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;

function DBProcedureResultNil( procName: String; const params: array of Variant; var RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo'; isAsync : Boolean = False ) : Boolean;

function DBProcedureResultOwner( AOwner: TComponent; procName: String; const params: array of Variant; var RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo'; isAsync : Boolean = False ) : Boolean;

function DBFunctionNil( funcName: String; const params: array of Variant; var RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;

function DBFunctionOwner( AOwner: TComponent; funcName: String; const params: array of Variant; var RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;

function DBUserSettingsSet(const SName : String; const SValue : Variant) : Boolean;
function DBUserSettingsGet(const SName : String ) : Variant;

implementation

uses ADODB, DataModule, SysUtils, uOMSADOQuery, uOMSDialogs, uLogging, Variants, DB;

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
      if VarIsNull(params[ i ] ) then
      begin
         Attributes := [ paNullable ];
         DataType := ftGuid;
         Value := Null;
      end
      else Value := params[ i ];
    end;
  end;
end;

function DBProcedureNil( procName: String; const params: array of Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;
begin
  Result := DBProcedureOwner( Nil, procName, params, dbCatalog, dbScheme );
end;

function DBProcedureOwner( AOwner: TComponent; procName: String; const params: array of Variant;
    const dbCatalog : TDBCatalog; const dbScheme: String ) : Boolean;
var
  RValue : Variant;
begin
  Result := DBProcedureResultOwner( AOwner, procName, params, RValue, dbCatalog, dbScheme, True );
end;

function DBProcedureResultNil( procName: String; const params: array of Variant; var RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo'; isAsync : Boolean = False ) : Boolean;
begin
  Result := DBProcedureResultOwner( Nil, procName, params, RValue, dbCatalog, dbScheme, isAsync );
end;

function DBProcedureResultOwner( AOwner: TComponent; procName: String; const params: array of Variant; var RValue: Variant;
    const dbCatalog : TDBCatalog; const dbScheme: String; isAsync : Boolean ) : Boolean;
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
    adoq := TOMSADOQuery.Create( AOwner );
    adoq.Connection := DataForm.adoconnOrdersForSch;
    adoq.LockType := ltReadOnly;

    if not isAsync
      then adoq.ExecuteOptions := [ ];

    strSQL := 'EXEC [' + getCatalog( dbCatalog ) + '].' + dbScheme + '.[' + procName + '] ';
    strSQL := strSQL + parseParameters( adoq, params );
    adoq.SQL.Text := strSQL;

    adoq.SafeResync;
    if ( not adoq.Active ) OR ( adoq.Eof ) OR ( adoq.FindField('Result') = Nil ) then
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

function DBFunctionNil( funcName: String; const params: array of Variant; var RValue: Variant;
    const dbCatalog : TDBCatalog; const dbScheme: String ) : Boolean;
begin
  Result := DBFunctionOwner( Nil, funcName, params, RValue, dbCatalog, dbScheme );
end;

function DBFunctionOwner( AOwner: TComponent; funcName: String; const params: array of Variant; var RValue: Variant;
    const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;
var
  strResult: String;
  adoq : TOMSADOQuery;
  strSQL : String;
begin
  Result := False;

  try
    adoq := TOMSADOQuery.Create( AOwner );
    adoq.Connection := DataForm.adoconnOrdersForSch;
    adoq.LockType := ltReadOnly;
{    adoq.CommandTimeOut := 90;
}
    strSQL := 'SELECT [' + getCatalog( dbCatalog ) + '].' + dbScheme + '.[' + funcName + '] ( ';
    strSQL := strSQL + parseParameters( adoq, params );
    strSQL := strSQL + ' ) AS Result';
    adoq.SQL.Text := strSQL;

    adoq.SafeResync;
    if ( adoq.Active ) AND ( not adoq.Eof ) then
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
  Result := False;
  baseType := VarType( SValue ) and VarTypeMask;

  case baseType of
    varDate :     Result := DBProcedureNil( 'OMS_USERSETTINGS_SetDateTime', [ SName, TDateTime( SValue ) ] );
    varBoolean :  Result := DBProcedureNil( 'OMS_USERSETTINGS_SetBoolean', [ SName, Boolean( SValue ) ] );
    varInteger :  Result := DBProcedureNil( 'OMS_USERSETTINGS_SetInteger', [ SName, Integer( SValue ) ] );
    varString  :  begin
      if (String( SValue )[1] = '{') AND (Length(String( SValue) ) = 38)
        then Result := DBProcedureNil( 'OMS_USERSETTINGS_SetGUID', [ SName, SValue ] )
        else Result := DBProcedureNil( 'OMS_USERSETTINGS_SetString', [ SName, String( SValue ) ] );
    end;
    varNull : Result := DBProcedureNil( 'OMS_USERSETTINGS_SetGUID', [ SName, SValue ] );
  end;
end;

function DBUserSettingsGet(const SName : String ) : Variant;
var
  adoq : TOMSADOQuery;
begin
  Result := False;

  try
    adoq := TOMSADOQuery.Create(Nil);
    adoq.Connection := DataForm.adoconnOrdersForSch;
    adoq.LockType := ltReadOnly;

    adoq.SQL.Text := 'EXEC [ORDERS].dbo.[OMS_USERSETTINGS_GET]';

    adoq.SafeResync;
    if ( not adoq.Active ) OR ( adoq.Eof )
      then Result := Null
      else Result := adoq.FieldByName( SName ).Value;
  finally
    adoq.Free;
  end;
end;

end.
