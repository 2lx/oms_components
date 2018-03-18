unit uDataExport;

interface

uses cxGrid;

procedure cxGridToExcelWithImages( const strDocument: String; cxGrid: TcxGrid; AExpand: Boolean );
//    procedure StoreGridView( frm: TControl; view: TcxGridTableView );
//    procedure RestoreGridView( frm: TControl; view: TcxGridTableView );

implementation

uses cxGridExportLink, ComObj, uFileSystem, Windows, uDialogs;

procedure cxGridToExcelWithImages( const strDocument: String; cxGrid: TcxGrid; AExpand: Boolean );
var
  ExcelApp, Workbook: Variant;
  fileName: String;
begin
  ExcelApp := CreateOleObject('Excel.Application');

  fileName := GetTempDirectory + strDocument + '.xlsx';
  DeleteFile(PWideChar(WideString( fileName )));

  ExcelApp.Application.EnableEvents := False;

  try
    ExportGridToXLSX(fileName, cxGrid, AExpand, True, False, 'xlsx');
    Workbook := ExcelApp.WorkBooks.Add( fileName );
  except
    ShowError('Произошла ошибка при выгрузке в формат XLSX. Обратитесь к программисту.');
  end;

  ExcelApp.Application.EnableEvents := True;
  ExcelApp.Visible := True;
end;

{
procedure TDataForm.StoreGridView( frm: TControl;  view: TcxGridTableView);
var
  SettingsFile: string;
  WinCon: TWinControl;
  strPath: String;
begin
  if ( frm is TFrame ) then
  begin
    WinCon := frm.Parent;
    while ( not ( WinCon is TForm ) ) AND ( WinCon.Parent <> Nil ) do
      WinCon := WinCon.Parent;

    if ( frm.Parent = Nil )
      then StrPath := frm.ClassName
      else StrPath := WinCon.ClassName + '_' + frm.ClassName;
  end
  else StrPath := frm.ClassName;

  SettingsFile := GetAppSpecialFolder + 'GridSettingSave\' + strPath + '_' + view.ClassName + '.ini';

  view.StoreToIniFile( SettingsFile );
end;

procedure TDataForm.RestoreGridView(frm: TControl; view: TcxGridTableView );
var
  SettingsFile: string;
  i : Integer;
  WinCon: TWinControl;
  strPath: String;
begin
  if ( frm is TFrame ) then
  begin
    WinCon := frm.Parent;
    while ( not ( WinCon is TForm ) ) AND ( WinCon.Parent <> Nil ) do
      WinCon := WinCon.Parent;

    if ( frm.Parent = Nil )
      then StrPath := frm.ClassName
      else StrPath := WinCon.ClassName + '_' + frm.ClassName;
  end
  else StrPath := frm.ClassName;

  SettingsFile := GetAppSpecialFolder + 'GridSettingSave\' + strPath + '_' + view.ClassName + '.ini';
  view.RestoreFromIniFile( SettingsFile, False, False, [] );

  for i := 0 to view.ColumnCount - 1 do
  begin
    if ( not view.Columns[ i ].VisibleForCustomization ) AND ( view.Columns[ i ].Visible )
      then view.Columns[ i ].Visible := False;
  end;
end;
}

end.
