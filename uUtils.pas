unit uUtils;

interface

uses Classes, Controls;

function getOwnerForm(cmpn : TComponent): TComponent;

{type
  Getter = class

  end;
 }
function getParentForm(cmpn : TControl): TComponent;
function getParentFrame(cmpn : TControl): TComponent;
function getParentTabSheet(cmpn : TControl): TComponent;
function getParentcxTabSheet(cmpn : TControl): TComponent;

function getParentControl(cmpn : TComponent): TControl;

implementation

uses Forms, ComCtrls, cxPC, uDialogs, cxGridDBTableView, cxGrid, cxBarEditItem, dxBar, cxGridDBCardView,

{$I OMSComponentsInclude.inc}

function getOwnerForm(cmpn : TComponent): TComponent;
begin
  if (cmpn is TForm)
    then Result := cmpn
    else if (cmpn is TComponent) AND (cmpn.Owner <> Nil )
      then Result := getOwnerForm(cmpn.Owner)
      else Result := Nil;
end;

function getParentForm(cmpn : TControl): TComponent;
begin
  if (cmpn is TForm)
    then Result := cmpn
    else if (cmpn is TControl) AND (cmpn.Parent <> Nil )
      then Result := getParentForm(cmpn.Parent)
      else Result := Nil;
end;

function getParentFrame(cmpn : TControl): TComponent;
begin
  if (cmpn is TFrame)
    then Result := cmpn
    else if (cmpn is TControl) AND (cmpn.Parent <> Nil )
      then Result := getParentFrame(cmpn.Parent)
      else Result := Nil;
end;

function getParentTabSheet(cmpn : TControl): TComponent;
begin
  if (cmpn is TTabSheet)
    then Result := cmpn
    else if (cmpn is TControl) AND (cmpn.Parent <> Nil )
      then Result := getParentTabSheet(cmpn.Parent)
      else Result := Nil;
end;

function getParentcxTabSheet(cmpn : TControl): TComponent;
begin
  if (cmpn is TcxTabSheet)
    then Result := cmpn
    else if (cmpn is TControl) AND (cmpn.Parent <> Nil )
      then Result := getParentcxTabSheet(cmpn.Parent)
      else Result := Nil;
end;

function getParentControl(cmpn : TComponent): TControl;
begin
  if (cmpn is TOMScxGridDBTableView)
    then Result := (cmpn as TOMScxGridDBTableView).Site.Container
  else if (cmpn is TOMScxGridDBBandedTableView)
    then Result := (cmpn as TOMScxGridDBBandedTableView).Site.Container
  else if (cmpn is TcxGridDBCardView)
    then Result := (cmpn as TcxGridDBCardView).Site.Container
  else if cmpn is TcxGridDBColumn
    then Result := (cmpn as TcxGridDBColumn).GridView.Site.Container
  else if cmpn is TControl
    then Result := cmpn as TControl
  else if (cmpn is TcxBarEditItem)
    then Result := ((cmpn as TcxBarEditItem).Owner as TControl) // базовая форма
  else if (cmpn is TdxBarLargeButton)
    then Result := ((cmpn as TdxBarLargeButton).Owner as TControl) // базовая форма
  else ShowError('Ошибка. Не определен родительский TControl для класса компонентов "' + cmpn.ClassName + '"');
end;

end.
