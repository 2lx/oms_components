unit uUtils;

interface

uses Classes, Controls;

type
  TFinder = class
    class function getParent< CmpnType : TComponent >( ctrl : TControl ) : TComponent;
    class function getOwner< CmpnType : TComponent >( cmpn : TComponent ) : TComponent;

    class function getParentControl(cmpn : TComponent): TControl;
    class function getHierarchyPCNames( ctrl : TControl ) : String;
  end;

implementation

uses Forms, uDialogs, SysUtils, cxGridDBTableView, cxGrid, dxBar, cxGridDBCardView, cxPC, ComCtrls,

{$I OMSComponentsInclude.inc}

class function TFinder.getParent< CmpnType >( ctrl : TControl ) : TComponent;
begin
  if (ctrl is CmpnType)
    then Result := ctrl
    else if (ctrl is TControl) AND (ctrl.Parent <> Nil )
      then Result := getParent< CmpnType >( ctrl.Parent )
      else Result := Nil;
end;

class function TFinder.getOwner< CmpnType >( cmpn : TComponent ) : TComponent;
begin
  if (cmpn is CmpnType)
    then Result := cmpn
    else if (cmpn is TComponent) AND (cmpn.Owner <> Nil )
      then Result := getOwner< CmpnType >(cmpn.Owner)
      else Result := Nil;
end;

class function TFinder.getParentControl(cmpn : TComponent): TControl;
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
  else if (cmpn is TOMScxBarEditItem)
    then Result := ((cmpn as TOMScxBarEditItem).Owner as TControl) // базовая форма
  else if (cmpn is TdxBarLargeButton)
    then Result := ((cmpn as TdxBarLargeButton).Owner as TControl) // базовая форма
  else ShowError('Ошибка. Не определен родительский TControl для класса компонентов "' + cmpn.ClassName + '"');
end;

class function TFinder.getHierarchyPCNames( ctrl : TControl ) : String;

  function getNames( ctrl : TControl ) : String;
  begin
    if (ctrl is TcxTabSheet )
      then Result := getNames((ctrl as TcxTabSheet).PageControl ) + ' -> "' + (ctrl as TcxTabSheet).Caption + '"'
    else if (ctrl is TTabSheet )
      then Result := getNames((ctrl as TTabSheet).PageControl ) + ' -> "' + (ctrl as TTabSheet).Caption + '"'
    else if (ctrl is TControl) AND (ctrl.Parent <> Nil )
      then Result := getNames( ctrl.Parent )
    else Result := '';
  end;

begin
  Result := Trim( getNames( ctrl ));
  if Result <> ''
    then Result := 'вкладка ' + Copy(Result, 4, Length(Result));
end;

end.
