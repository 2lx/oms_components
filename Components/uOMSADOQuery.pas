unit uOMSADOQuery;

interface

uses Classes, Data.Win.ADODB, Data.DB, Windows;

type
  TOMSADOQuery = class(TADOQuery)
  private
    FBookmark: TBookmark;
    FFormHandle : HWND;
    FEnableMessage : Boolean;

    procedure DeleteErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure EditErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure PostErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);

    function SafeOpen : Boolean;
    function  SafeOpenBase : Boolean;

  protected
    procedure Loaded; override;

  public
    constructor Create(AOwner: TComponent); override;

    function isEdited : Boolean;
    procedure SafeEdit;

    procedure SafePost;
    procedure SafeCancel;

    procedure SafeClose( const doPost: Boolean = True );
    function SafeResync : Boolean;

    procedure SafeSetParam(const parName : String; const AValue : Variant );

  end;

implementation

uses uDialogs, uLogging, Forms, SysUtils, uAppMessages, uOMSForm, uUtils;

constructor TOMSADOQuery.Create(AOwner: TComponent);
var
  frm : TComponent;
begin
  inherited Create(AOwner);

  frm := getOwnerForm(Owner);
  FEnableMessage := (frm is TOMSForm);

  if FEnableMessage then begin
    FFormHandle := (frm as TForm).Handle;
//    ExecuteOptions := [ eoAsyncExecute, eoAsyncFetchNonBlocking ];
  end;

  CommandTimeOut := 90;              // for dynamically created ADOqueries
  CursorType := ctStatic;
  CursorLocation := clUseClient;

  OnEditError := EditErrorHandler;
  OnDeleteError := DeleteErrorHandler;
  OnPostError := PostErrorHandler;
end;

function TOMSADOQuery.isEdited : Boolean;
begin
  Result := Active {AND (not Eof)} AND (State in [ dsInsert, dsEdit ]);
end;

procedure TOMSADOQuery.Loaded;
begin
  inherited;

  CommandTimeOut := 90;              // for form-based ADOqueries
  CursorType := ctStatic;
  CursorLocation := clUseClient;
end;

procedure TOMSADOQuery.SafeEdit;
begin
  if not ( State in [ dsEdit, dsInsert ] )
    then Edit;
end;

procedure TOMSADOQuery.SafePost;
begin
  if ( State = dsOpening ) then Exit;

  if isEdited then Post;
end;

procedure TOMSADOQuery.SafeCancel;
begin
  if ( State = dsOpening ) then Exit;

  if isEdited then Cancel;
end;

procedure TOMSADOQuery.SafeClose( const doPost: Boolean );
begin
  FBookmark := Nil;

  while ( State = dsOpening ) do begin
    Cancel;
    Application.ProcessMessages;
  end;

  if Active AND (not Eof)
    then FBookmark := GetBookmark;

  if doPost then SafePost;
  if Active then Close;
end;

function TOMSADOQuery.SafeOpenBase : Boolean;
begin
  Result := False;

  try
    if (not Active) then Open;

    while ( State = dsOpening ) do
      Application.ProcessMessages;

    Result := True;
  except
    on E: Exception do begin
      Result := False;

      ShowError('Ошибка открытия запроса. ' + E.ToString );
      logQueryError( Name, SQL.Text, 'OpenError', E.ToString );
    end;
  end;
end;

function TOMSADOQuery.SafeOpen : Boolean;
begin
  Result := False;

  try
    if FEnableMessage
      then SendMessage( FFormHandle, WM_ADOQ_BEGIN_MESSAGE, 0, 0 );

    if not SafeOpenBase then Exit;

    if ( FBookmark <> Nil ) AND BookmarkValid( FBookmark )
      then GotoBookmark( FBookmark );

    Result := True;
//    DataEvent(deLayoutChange, 0);
  finally
    if FEnableMessage
      then SendMessage( FFormHandle, WM_ADOQ_END_MESSAGE, 0, 0 );
  end;
end;

function TOMSADOQuery.SafeResync : Boolean;
begin
  Result := False;

  DisableControls;
  while ( State = dsOpening ) do
    Application.ProcessMessages;

  SafeClose( True );
  Result := SafeOpen;

  EnableControls;
end;

procedure TOMSADOQuery.SafeSetParam(const parName: String; const AValue: Variant);
begin
  while ( State = dsOpening ) do
    Application.ProcessMessages;

  Parameters.ParamByName( parName ).Value := AValue;
end;

procedure TOMSADOQuery.DeleteErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
  strError : String;
begin
  Action := daAbort;

  strError := 'Ошибка удаления записи. ';
  if Pos( 'denied',  E.ToString ) > 0
    then strError := strError + 'Запрещено удалять эту запись'
    else strError := strError + E.ToString;

  ShowError( strError );
  logQueryError( Name, SQL.Text, 'DeleteError', E.ToString );
end;

procedure TOMSADOQuery.EditErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
  strError : String;
begin
  Action := daAbort;

  strError := 'Ошибка редактирования записи. ';
  strError := strError + E.ToString;

  logQueryError( Name, SQL.Text, 'EditError', E.ToString );
  ShowError( strError );
end;

procedure TOMSADOQuery.PostErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
  strError : String;
begin
  Action := daAbort;

  strError := 'Данные введены неверно. ';
  if ( Pos( 'allow nulls',  E.ToString ) > 0 )
    then strError := strError + 'Заполнены не все обязательные поля.'
  else if ( Pos( 'unique',  E.ToString ) > 0 )
    then strError := strError + 'Запись с такими данными уже существует.'
  else if ( Pos( 'denied',  E.ToString ) > 0 )
    then strError := strError + 'Изменение этих данных запрещено.'
    else strError := strError + E.ToString;

  logQueryError( Name, SQL.Text, 'PostError', E.ToString );
  ShowError(strError);
end;

end.
