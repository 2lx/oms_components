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

uses uOMSDialogs;

constructor TOMSADOQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  OnEditError := EditErrorHandler;
  OnDeleteError := DeleteErrorHandler;
  OnPostError := PostErrorHandler;
end;

procedure TOMSADOQuery.DeleteErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if Pos( 'denied',  E.ToString ) > 0
    then ShowError( '������ �������� ������. � ����� ������������ �� ���������� ������� ������ �� ���� �������' );

  Action := daAbort;
end;

procedure TOMSADOQuery.EditErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  ShowError( '������ �������������� ������. ���� �� ����� ����� ������������ ��������' );

  Action := daAbort;
  DataSet.Cancel;
end;

procedure TOMSADOQuery.PostErrorHandler(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if ( Pos( 'Access denied',  E.ToString ) > -1 )
    then
    begin
      Action := daAbort;
      ShowError( E.ToString );

      if DataSet.State in [ dsEdit ]
        then DataSet.Cancel;
    end
  else if ( Pos( 'column does not allow nulls',  E.ToString ) > -1 )
    then
    begin
      Action := daAbort;

      ShowError( '������ ��� ���������� ������. ��������� �� ��� ������������ ����' );
    end
  else if ( Pos( 'unique',  E.ToString ) > -1 )
    then
    begin
      Action := daAbort;

      ShowError( '������ ��� ���������� ������. ������ � ������� ������ ���� �����������' );

      if DataSet.State in [ dsEdit ]
        then DataSet.Cancel;
    end
    else
    begin
      Action := daAbort;

      if ShowQuestionYesNo( '������ ��� ���������� ������. ��������, ���� �� ����� ����� ������������ ��������.'
          + ' ��������, ������ ���� �������� ������ �������������. �� ������ �������� ������?' )
        then begin
          DataSet.Close;
          DataSet.Open;
        end;
    end;
end;

end.
