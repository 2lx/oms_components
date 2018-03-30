unit uUtils;

interface

uses Classes, Controls;

type
  TFinder = class
    class function getParent< CmpnType : TComponent >( cmpn : TControl ) : TComponent;
    class function getOwner< CmpnType : TComponent >( cmpn : TComponent ) : TComponent;

    class function getParentControl(cmpn : TComponent): TControl;
  end;

implementation

uses Forms, uDialogs, cxGridDBTableView, cxGrid, dxBar, cxGridDBCardView,

{$I OMSComponentsInclude.inc}

class function TFinder.getParent< CmpnType >( cmpn : TControl ) : TComponent;
begin
  if (cmpn is CmpnType)
    then Result := cmpn
    else if (cmpn is TControl) AND (cmpn.Parent <> Nil )
      then Result := getParent< CmpnType >( cmpn.Parent )
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

end.
