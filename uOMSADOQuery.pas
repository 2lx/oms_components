unit uOMSADOQuery;

interface

uses Classes, Data.Win.ADODB, Data.DB;

type
  TOMSADOQuery = class(TADOQuery)
  private
    procedure DeleteErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure EditErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure PostErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
  protected
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses uOMSDialogs, uLogging;

constructor TOMSADOQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  OnEditError := EditErrorHandler;
  OnDeleteError := DeleteErrorHandler;
  OnPostError := PostErrorHandler;
end;

procedure TOMSADOQuery.DeleteErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
  strError : String;
begin
  Action := daAbort;

  strError := 'Ошибка удаления записи. ';
  if Pos( 'denied',  E.ToString ) > 0
    then strError := strError + 'В базе данных запрещено удалять эту запись';

  ShowError( strError );
  logQueryError( Name, SQL.Text, 'DeleteError', E.ToString );
end;

procedure TOMSADOQuery.EditErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
var
  strError : String;
begin
  Action := daAbort;
//  DataSet.Cancel;

  strError := 'Ошибка редактирования записи. ';

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
    then strError := strError + 'Запись с такими данными уже существует (не уникальна).'
  else if ( Pos( 'denied',  E.ToString ) > 0 )
    then strError := strError + 'Изменение этих данных запрещено.';

  logQueryError( Name, SQL.Text, 'PostError', E.ToString );
  ShowError(strError);
end;

end.
