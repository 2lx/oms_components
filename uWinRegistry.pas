unit uWinRegistry;

interface

function WinRegistryGet( const RKey, FieldName: String; const DefValue: Variant ) : Variant;
procedure WinRegistrySet( const RKey, FieldName: String; AValue: Variant );

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

    if Registry.OpenKey( RKey, True ) AND Registry.ValueExists( FieldName ) then
    begin
      rdt := Registry.GetDataType( FieldName );

      case rdt of
        rdString : Result := Registry.ReadString( FieldName );
        rdInteger : Result := Registry.ReadInteger( FieldName );
      end;
    end;

  finally
    Registry.Free;
  end;
end;

procedure WinRegistrySet( const RKey, FieldName: String; AValue: Variant );
var
  Registry : TRegistry;
  baseType : Integer;
begin
  try
    Registry:= TRegistry.Create;
    Registry.RootKey := HKEY_CURRENT_USER;

    if Registry.OpenKey( RKey, True ) then
    begin
      baseType := VarType( AValue ) and VarTypeMask;

      case baseType of
        varInteger : Registry.WriteInteger( FieldName, Integer( AValue ) );
        varBoolean : Registry.WriteBool( FieldName, Boolean( AValue ) );
        varString  : Registry.WriteString( FieldName, String( AValue ) );
        varDouble  : Registry.WriteFloat( FieldName, Real( AValue ) );
      end;
    end;

   finally
     Registry.Free;
   end;
end;

end.

