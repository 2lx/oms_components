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
    procedure SafeOpen;

    procedure SafeSetParam(const parName : String; const AValue : Variant );

    procedure SafeResync;
  end;

implementation

uses uOMSDialogs, uLogging, Forms, SysUtils, uAppMessages, uOMSForm;

constructor TOMSADOQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FEnableMessage := (Owner is TOMSForm);
  if FEnableMessage then
  begin
    FFormHandle := (Owner as TForm).Handle;
//    ExecuteOptions := [ eoAsyncExecute, eoAsyncFetchNonBlocking ];
  end;

  OnEditError := EditErrorHandler;
  OnDeleteError := DeleteErrorHandler;
  OnPostError := PostErrorHandler;
end;

function TOMSADOQuery.isEdited : Boolean;
begin
  Result := Active AND (not Eof) AND (State in [ dsInsert, dsEdit ]);
end;

procedure TOMSADOQuery.Loaded;
begin
  inherited;

  CommandTimeOut := 90;
end;

procedure TOMSADOQuery.SafePost;
begin
  while ( State = dsOpening ) do Exit;
//    Application.ProcessMessages;

  if isEdited then Post;
end;

procedure TOMSADOQuery.SafeEdit;
begin
  if not ( State in [ dsEdit, dsInsert ] )
    then Edit;
end;

procedure TOMSADOQuery.SafeCancel;
begin
  while ( State = dsOpening ) do Exit;
//    Application.ProcessMessages;

  if isEdited then Cancel;
end;

procedure TOMSADOQuery.SafeClose( const doPost: Boolean );
begin
//  DisableControls;
  while ( State = dsOpening ) do
    Application.ProcessMessages;

  FBookmark := Nil;
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

procedure TOMSADOQuery.SafeOpen;
begin
  try
    if FEnableMessage
      then SendMessage( FFormHandle, WM_ADOQ_BEGIN_MESSAGE, 0, 0 );

    if SafeOpenBase AND ( FBookmark <> Nil ) AND BookmarkValid( FBookmark )
      then GotoBookmark( FBookmark );

    if FEnableMessage
      then SendMessage( FFormHandle, WM_ADOQ_END_MESSAGE, 0, 0 );

//    DataEvent(deLayoutChange, 0);
  finally
//    EnableControls;
  end;
end;

procedure TOMSADOQuery.SafeResync;
begin
  while ( State = dsOpening ) do
    Application.ProcessMessages;

  DisableControls;
  SafeClose( True );
  SafeOpen;
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
