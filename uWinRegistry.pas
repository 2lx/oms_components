unit uWinRegistry;

interface

function WinRegistryGet( const RKey, FieldName: String; const DefValue: Variant ) : Variant;
function WinRegistrySet( const RKey, FieldName: String; AValue: Variant ) : Boolean;
procedure WinRegistryDelete( const RKey, FieldName: String );

implementation

uses Registry, Windows, Variants;

function WinRegistryGet( const RKey, FieldName: String; const DefValue: Variant ) : Variant;
var
  Registry : TRegistry;
  rdt : TRegDataType;
begin
  Result := DefValue;

  try
    Registry:= TRegistry.Create;
    Registry.RootKey := HKEY_CURRENT_USER;
    Registry.LazyWrite := False;

    if Registry.OpenKey( RKey, True ) AND Registry.ValueExists( FieldName ) then
    begin
      rdt := Registry.GetDataType( FieldName );

      case rdt of
        rdString : Result := Registry.ReadString( FieldName );
        rdInteger : Result := Registry.ReadInteger( FieldName );
      end;

      Registry.CloseKey;
    end;

  finally
    Registry.Free;
  end;
end;

function WinRegistrySet( const RKey, FieldName: String; AValue: Variant ) : Boolean;
var
  Registry : TRegistry;
  baseType : Integer;
begin
  Result := False;
  try
    Registry:= TRegistry.Create;
    Registry.RootKey := HKEY_CURRENT_USER;
    Registry.LazyWrite := False;

    if Registry.OpenKey( RKey, True ) then
    begin
      baseType := VarType( AValue ) and VarTypeMask;

      case baseType of
        varInteger : Registry.WriteInteger( FieldName, Integer( AValue ) );
        varBoolean : Registry.WriteBool( FieldName, Boolean( AValue ) );
        varString  : Registry.WriteString( FieldName, String( AValue ) );
        varDouble  : Registry.WriteFloat( FieldName, Real( AValue ) );
      end;

      Registry.CloseKey;
    end;

    Result := True;
   finally
     Registry.Free;
   end;
end;

procedure WinRegistryDelete( const RKey, FieldName: String );
var
  Registry : TRegistry;
begin
  try
    Registry:= TRegistry.Create;
    Registry.RootKey := HKEY_CURRENT_USER;
    Registry.LazyWrite := False;

    if Registry.OpenKey( RKey, False ) then
    begin
      Registry.DeleteValue( RKey );
      Registry.CloseKey;
    end;

   finally
     Registry.Free;
   end;
end;

end.

