unit uUtils;

interface

uses Classes;

function getOwnerForm(cmpn : TComponent): TComponent;

implementation

uses Forms;

function getOwnerForm(cmpn : TComponent): TComponent;
begin
  if (cmpn is TForm)
    then Result := cmpn
    else if (cmpn is TComponent) AND (cmpn.Owner <> Nil )
      then Result := getOwnerForm(cmpn.Owner)
      else Result := Nil;
end;

end.
