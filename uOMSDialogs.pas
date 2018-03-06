unit uOMSDialogs;

interface

procedure ShowWarning(const str : String );
procedure ShowError(const str : String );
function ShowQuestionYesNo( const str : String ) : Boolean;

implementation

uses Dialogs, Controls;

procedure ShowWarning(const str : String );
begin
  MessageDlg( str, mtWarning, mbOKCancel, 0 );
end;

procedure ShowError(const str : String );
begin
  MessageDlg( str, mtError, mbOKCancel, 0 );
end;

function ShowQuestionYesNo( const str : String ) : Boolean;
begin
  Result := mrYes = MessageDlg( 'Ошибка при сохранении записи. Возможно, одно из полей имеет некорректное значение.'
          + ' Возможно, запись была изменена другим пользователем.'
          + ' Вы хотите обновить данные?', mtConfirmation, mbYesNo, 0 );
end;

end.
