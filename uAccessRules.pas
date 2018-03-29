unit uAccessRules;

interface

uses Classes, Forms, uOMSForm,

 {$I OMSComponentsInclude.inc}

procedure AddGridAccessRules( gridView: TOMScxGridDBTableView );

procedure AddAccessRule( cmpn: TComponent; const arrCmpns : array of TComponent;
    const commentBase : WideString = '' );

procedure ApplyAccessRules(var frm: TOMSForm);

implementation

uses uDataBase, System.TypInfo, Controls, uUtils, uDialogs, cxGrid, cxGridDBTableView, cxPC,
  ComCtrls, SysUtils, DataModule, dxBar, cxButtons, cxBarEditItem, cxGridTableView;

procedure AddGridAccessRules( gridView: TOMScxGridDBTableView );
var
  i : Integer;
begin
  AddAccessRule( gridView, []);

  for i := 0 to gridView.ColumnCount - 1 do
    if ( gridView.Columns[ i ].Width <> 0 ) AND ( gridView.Columns[ i ].Options.Editing )
      then AddAccessRule( gridView.Columns[ i ], [] );
end;

function AddOneAccessRule( cmpn : TComponent; const CompGUID : Variant ): Boolean;
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

procedure AddAccessRule( cmpn: TComponent; const arrCmpns : array of TComponent;
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

  if (cmpn is TcxGridDBColumn)
    then ruleLabel := 'Столбец "' + (cmpn as TcxGridDBColumn).Caption
        + '" таблицы "' + (cmpn as TcxGridDBColumn).GridView.Name + '"'
  else if Assigned(PropInfo)
    then ruleLabel := GetPropValue( cmpn, PropInfo )
  else if (cmpn is TOMScxGridDBTableView) OR (cmpn is TOMScxGridDBBandedTableView)
    then ruleLabel := 'Tаблица "' + cmpn.Name + '"'
  else ruleLabel := '';

  isVisible := True; // всегда видимый по умолчанию, у колонок не влияет видимость т.к. будет сохранение вида
  isEditable := False; // по умолчанию все не редактируется чтобы сразу настроить права
  isInsertable := False;
  isDeletable := False;

  // генерация комментария
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
    ShowError( 'Ошибка добавления правила. Не найдена форма владелец компонента "' + cmpn.Name + '"' );
    Exit;
  end;

  // в базовое правило фрейм больше не передаем!! оно только у componentone
  DBProcedureResultNil( 'OMS_USERFORM_Insert', [ sOwner.ClassName ], FormGUID );
  DBProcedureResultNil( 'OMS_USERCOMPONENT_Insert',
      [ FormGUID, cmpn.Name, ruleLabel, commentFull, isVisible, isEditable, isInsertable, isDeletable ],
        CompGUID );

  AddOneAccessRule( cmpn, CompGUID );

  for icmpn in arrCmpns do
    AddOneAccessRule( icmpn, CompGUID );
end;

procedure ApplyAccessRules(var frm: TOMSForm);
var
  adoq: TOMSADOQuery;
  strComponentName, strFrameName, lastFrameName : String;
  Control: TControl;
  cmpn, cmpnFrame: TComponent;
  isVisible, isEditable, isInsertable, isDeletable: Boolean;
begin
  lastFrameName := '-';
  try
    adoq := TOMSADOQuery.Create( frm );
    adoq.Connection := DataForm.adoconnOrders;
    adoq.SQL.Text := 'OMS_USERFORM_SelectRules :formName';
    adoq.Parameters.ParamByName( 'formName' ).Value := frm.ClassName;
    if not adoq.SafeResync then Exit;

    while not adoq.Eof do
    begin
      strComponentName := adoq.FieldByName( 'ComponentName' ).AsWideString;
      strFrameName := adoq.FieldByName( 'FrameName' ).AsWideString;
      isVisible := adoq.FieldByName( 'IsVisible' ).AsBoolean;
      isEditable := adoq.FieldByName( 'IsEditable' ).AsBoolean;
      isInsertable := adoq.FieldByName( 'IsInsertable' ).AsBoolean;
      isDeletable := adoq.FieldByName( 'IsDeletable' ).AsBoolean;

      cmpn := Nil;
      if strFrameName <> '' then
      begin
        if ( lastFrameName <> strFrameName ) then
        begin
          lastFrameName := strFrameName;
          cmpnFrame := frm.FindComponent( strFrameName );
        end;

        if Assigned(cmpnFrame)
          then cmpn := cmpnFrame.FindComponent( strComponentName );
      end
      else cmpn := frm.FindComponent( strComponentName );

      if not Assigned( cmpn ) then
      begin
{$IFDEF DEBUG}
        if DBProcedureNil( 'OMS_USERCOMPONENTONE_Delete', [ adoq.FieldByName( 'OUCO_GUID' ).AsVariant ] )
          then ShowInformation( 'Был удален компонент: "' +  strComponentName + '", фрейм: "' + strFrameName + '"' );
{$ENDIF}
        adoq.Next;
        Continue;
      end;

      if ( cmpn is TdxBarItem ) then
        with cmpn as TdxBarItem do
        begin
          if isVisible
              then Visible := ivAlways
              else Visible := ivNever;

          Enabled := isEditable;
        end
      else if (cmpn is TcxGridTableView) then
        with cmpn as TcxGridTableView do
        begin
          getParentControl(cmpn).Visible := isVisible;

          OptionsData.Editing := isEditable;
//          OptionsData.Appending := False;
          OptionsData.Inserting := isEditable;
          OptionsData.Deleting := isEditable;
        end
      else  if ( cmpn is TcxGridDBColumn ) then
        with cmpn as TcxGridDBColumn do
        begin
          Visible := isVisible;
          VisibleForCustomization := isVisible;

          Options.Editing := isEditable;
        end
      else if cmpn is TControl then
      begin
        if cmpn is TTabSheet
          then (cmpn as TTabSheet).TabVisible := isVisible
        else if cmpn is TcxTabSheet
          then (cmpn as TcxTabSheet).TabVisible := isVisible
        else begin
          (cmpn as TControl).Visible := True;
          (cmpn as TControl).Enabled := isEditable;
        end;
      end
      else ShowError( 'Для компонента типа "' + cmpn.ClassName + '" не сработали права доступа.' );

      adoq.Next;
    end;

  finally
    adoq.Free;
  end;
end;

end.
