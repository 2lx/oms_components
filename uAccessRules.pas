unit uAccessRules;

interface

uses Classes,

 {$I OMSComponentsInclude.inc}

procedure AddGridRules( gridView: TOMScxGridDBTableView; const Comment: WideString = '' );

procedure AddComponentRule( cmpn: TComponent; const arrCmpns : array of TComponent;
    const commentBase : WideString = '' );

//procedure InitializeRights;

implementation

uses uDataBase, System.TypInfo, Controls, uUtils, uDialogs, cxGrid, cxGridDBTableView, cxPC,
  ComCtrls, SysUtils;
{dxBar,  cxButtons,}

procedure AddGridRules( gridView: TOMScxGridDBTableView; const Comment: WideString = '' );
var
  i : Integer;
begin
  AddComponentRule( gridView, [], 'таблица ' + Comment );

  for i := 0 to gridView.ColumnCount - 1 do
    if ( gridView.Columns[ i ].Width <> 0 ) AND ( gridView.Columns[ i ].Options.Editing )
      then AddComponentRule( gridView.Columns[ i ], [], 'столбец таблицы ' + Comment );
end;

function AddComponentOneRule( cmpn : TComponent; const CompGUID : Variant ): Boolean;
var
  sOwner : TComponent;
  frameName : String;
  CompOneTGUID : Variant;
  parentCtrl : TControl;
begin
  parentCtrl := getParentControl(cmpn);

  sOwner := getParentFrame( parentCtrl );
  if Assigned( sOwner )
    then frameName := sOwner.Name
    else frameName := '';

  DBProcedureResultNil( 'OMS_USERCOMPONENTONE_TYPE_Insert', [ cmpn.ClassName ], CompOneTGUID );
  DBProcedureNil( 'OMS_USERCOMPONENTONE_Insert', [ CompGUID, frameName, cmpn.Name, CompOneTGUID ] );
end;

procedure AddComponentRule( cmpn: TComponent; const arrCmpns : array of TComponent;
    const commentBase : WideString = '' );
var
  ruleLabel, commentFull: WideString;
  PropInfo : PPropInfo;
  isVisible, isEditable, isInsertable, isDeletable : Boolean;
  sOwner, icmpn : TComponent;
  parentCtrl : TControl;
  FormGUID, CompGUID : Variant;
begin
  if ( cmpn is TcxGrid ) then Exit;

  ruleLabel := '';
  PropInfo := GetPropInfo( cmpn, 'Caption' );

  if Assigned(PropInfo)
    then ruleLabel := GetPropValue( cmpn, PropInfo )
  else if ( cmpn is TOMScxGridDBTableView ) OR ( cmpn is TOMScxGridDBBandedTableView )
    then ruleLabel := '“аблица'
  else ruleLabel := '';

  isVisible := True; // всегда видимый по умолчанию, у колонок не вли€ет видимость т.к. будет сохранение вида
  isEditable := False; // по умолчанию все не редактируетс€ чтобы сразу настроить права
  isInsertable := False;
  isDeletable := False;

  // генераци€ комментари€
  parentCtrl := getParentControl(cmpn);
  if Trim(commentBase) = ''
    then commentFull := ''
    else commentFull := Trim(commentBase) + ' ';

  sOwner := getParentTabSheet( parentCtrl );
  if Assigned( sOwner )
    then commentFull := commentFull + 'вкладка "' + (sOwner AS TTabSheet).Caption + '"';

  sOwner := getParentcxTabSheet( parentCtrl );
  if Assigned( sOwner )
    then commentFull := commentFull + 'вкладка "' + (sOwner AS TcxTabSheet).Caption + '"';

  // добавление правила
  sOwner := getParentForm( parentCtrl );
  if not Assigned( sOwner ) then begin
    ShowError( 'ќшибка добавлени€ правила. Ќе найдена форма владелец компонента "' + cmpn.Name + '"' );
    Exit;
  end;

  // в базовое правило фрейм больше не передаем!! оно только у componentone
  DBProcedureResultNil( 'OMS_USERFORM_Insert', [ sOwner.ClassName ], FormGUID );
  DBProcedureResultNil( 'OMS_USERCOMPONENT_Insert',
      [ FormGUID, cmpn.Name, ruleLabel, commentFull, isVisible, isEditable, isInsertable, isDeletable ],
        CompGUID );

  AddComponentOneRule( cmpn, CompGUID );

  for icmpn in arrCmpns do
    AddComponentOneRule( icmpn, CompGUID );
end;

end.
