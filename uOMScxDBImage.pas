unit uOMScxDBImage;

interface

uses Classes, cxDBEdit, Messages, Graphics;

type
  TOMScxDBImage = class(TcxDBImage)
  private
    FPictureMaxSize : Integer;

    procedure DblClickHandled(Sender: TObject);
    procedure PropertiesAssignPictureHandler(Sender: TObject; const Picture: TPicture);
    procedure PropertiesChangedHandled(Sender: TObject);
  protected
    procedure WMDropFiles(var Msg: TMessage); message wm_DropFiles;

    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure SetEnabled(Value : Boolean); override;

  published
    property PictureMaxSize : Integer read FPictureMaxSize  write FPictureMaxSize default 0;

  public
    constructor Create(AOwner: TComponent); override;

  end;

implementation

uses uOMSDialogs, Controls, ShellAPI, SysUtils, Windows, UnitFileRoutines, DB, UnitDifFuncs,
  uOMSStyle;

// Порядок создания\инициализации:
// 1. создается экземпляр класса TComponent (Enabled = True)
// 2. создается экземпляр TProperties (ReadOnly = False)
// 3. инициализируются значения TComponent значениями не по-умолчанию из дизайнера (Enabled)
// 4. инициализируются значения TProperties значениями не по-умолчанию из дизайнера (ReadOnly)

constructor TOMScxDBImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  OnDblClick := DblClickHandled;
  Properties.OnAssignPicture := PropertiesAssignPictureHandler;
  Properties.OnChange := PropertiesChangedHandled;

  Style.Color := clOMSEditableHighlight;
end;

procedure TOMScxDBImage.CreateWnd;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
end;

procedure TOMScxDBImage.DestroyWnd;
begin
  DragAcceptFiles(Self.Handle, False);
  inherited;
end;

procedure TOMScxDBImage.SetEnabled(Value : Boolean);
begin
  inherited SetEnabled(True);

  Properties.ReadOnly := not Value;  // call PropertiesChanged
end;

procedure TOMScxDBImage.PropertiesChangedHandled(Sender: TObject);
begin
  if Properties.ReadOnly
    then Style.Color := clWindow
    else Style.Color := clOMSEditableHighlight;
end;

procedure TOMScxDBImage.WMDropFiles(var Msg: TMessage);
var
  fileName: array[0 .. 256] of Char;
  strFileName: String;
  strFileExt: String;

  ADisplayValue: variant;
  AErrorText: TCaption;
  AError: Boolean;
begin
  DragQueryFile( THandle(Msg.WParam), 0, fileName, sizeof(fileName) ) ;
  strFileName := LowerCase(StrPas(fileName));
  DragFinish(THandle(Msg.WParam));

  strFileExt := UpperCase(ExtractFileExt(strFileName));
  if (strFileExt <> '.JPEG') AND (strFileExt <> '.JPG') then
  begin
    ShowError( 'Ошибка. Файл должен быть в формате JPG/JPEG' );
    Exit;
  end;

  try
    Self.DoEditing;
    Self.Picture.LoadFromFile(strFileName);

    // check picture size and format
    ADisplayValue := Self.EditValue;
    Self.Properties.ValidateDisplayValue(ADisplayValue, AErrorText, AError, Self);

    Self.PostEditValue;
  except
    on EInvalidGraphic do ShowError('Ошибка при загрузке изображения, проверьте формат файла') ;
  end
end;

procedure TOMScxDBImage.DblClickHandled(Sender: TObject);
var
  tmpFName: WideString;
begin
  tmpFName := GetTempDirectory + StringReplace(TimeToStr(Now), ':', '_',
    [rfReplaceAll, rfIgnoreCase]) + '.jpg';

  Self.Picture.SaveToFile(tmpFName);
  ShellExecute(Handle, 'open', PWideChar(tmpFName), nil, nil, SW_SHOWNORMAL);
end;

procedure TOMScxDBImage.PropertiesAssignPictureHandler(Sender: TObject; const Picture: TPicture);
begin
  if (not DataBinding.DataSource.DataSet.Active) OR ( DataBinding.DataSource.DataSet.Eof) then Exit;

  if not ( ( Picture.Width = 0 ) OR ( Picture.Height = 0 ) ) then
  begin
    if FPictureMaxSize = 0
      then Self.Picture.Assign( Picture )
      else Self.Picture.Assign( ResizePicture( Picture, FPictureMaxSize ) );
  end;
end;

end.
