unit uDataExport;

interface

uses cxGrid;

  procedure cxGridToExcelWithImages( const strDocument: string; cxGrid: TcxGrid; AExpand: boolean );

implementation

uses cxGridExportLink, ComObj, UnitFileRoutines, Windows, uOMSDialogs;

procedure cxGridToExcelWithImages( const strDocument: string; cxGrid: TcxGrid; AExpand: boolean );
var
  ExcelApp, Workbook: Variant;
  FileName: String;
//  FileTemplate: String;
begin
  ExcelApp := CreateOleObject('Excel.Application');

  FileName := GetTempDirectory + strDocument + '.xlsx';
  DeleteFile(PWideChar(WideString(FileName)));
//  FileTemplate := GetTempDirectory + strDocument + '.xltx';
//  DeleteFile(PWideChar(WideString(FileTemplate)));

  ExcelApp.Application.EnableEvents := False;

  try
    ExportGridToXLSX(FileName, cxGrid, AExpand, True, False, 'xlsx');
    Workbook := ExcelApp.WorkBooks.Add( FileName );
  except
    ShowError('Произошла ошибка при выгрузке в формат XLSX. Обратитесь к программисту.');
  end;

{
  Workbook.SaveAs(FileTemplate, 54);
  Workbook.Close(0);
  Workbook := ExcelApp.WorkBooks.Add( FileTemplate );
}
  ExcelApp.Application.EnableEvents := True;
  ExcelApp.Visible := True;
end;

end.
