unit uOMSADOQuery;

interface

uses Classes, Data.Win.ADODB, Data.DB;

type
  TOMSADOQuery = class(TADOQuery)
  private
    FBookmark: TBookmark;

    procedure DeleteErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure EditErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure PostErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;

    function isEdited : Boolean;
    procedure SafePost( const isReopen: Boolean = True );
    procedure SafeCancel;

    procedure CloseWithBookmark( const doPost: Boolean = True );
    procedure OpenWithBookmark;

    function  SafeOpen : Boolean;
    procedure SafeResync;
  end;

implementation

uses uOMSDialogs, uLogging, Forms, SysUtils, uAppMessages, Windows, Main;

constructor TOMSADOQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

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

procedure TOMSADOQuery.SafePost( const isReopen: Boolean );
begin
  if isEdited then Post;
end;

procedure TOMSADOQuery.SafeCancel;
begin
  if isEdited then Cancel;
end;

procedure TOMSADOQuery.OpenWithBookmark;
begin
  try
    if SafeOpen AND ( FBookmark <> Nil ) AND BookmarkValid( FBookmark )
      then GotoBookmark( FBookmark );
  finally
    EnableControls;
  end;
end;

procedure TOMSADOQuery.CloseWithBookmark( const doPost: Boolean );
begin
  DisableControls;

  if doPost then SafePost;

  FBookmark := Nil;
  if Active AND (not Eof)
    then FBookmark := GetBookmark;

  if Active then Close;
end;

function TOMSADOQuery.SafeOpen : Boolean;
begin
  try
    SendMessage( OMSMainForm.Handle, WM_ADOQ_BEGIN_MESSAGE, 0, 0 );
    if (not Active) then Open;

    while ( State = dsOpening ) do 
      Application.ProcessMessages;

    SendMessage( OMSMainForm.Handle, WM_ADOQ_END_MESSAGE, 0, 0 );

    Result := True;      
  except
    on E: Exception do begin
      Result := False;
      
      ShowError('Ошибка открытия запроса. ' + E.ToString );
      logQueryError( Name, SQL.Text, 'OpenError', E.ToString );
    end;
  end;
end;

procedure TOMSADOQuery.SafeResync;
begin
  CloseWithBookmark( True );
  OpenWithBookmark;
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
