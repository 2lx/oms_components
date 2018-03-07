unit uDataExport;

interface

uses cxGrid, cxGridExportLink, ComObj, Excel2000, Windows,
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ShellAPI, JPEG, cxExportPivotGridLink, cxCustomPivotGrid, cxPivotGrid,
  cxPivotGridOLAPDataSource, UnitFileRoutines;

  procedure cxGridToExcelWithImages( const strDocument: string; cxGrid: TcxGrid; AExpand: boolean );

implementation

uses DataModule, UnitExcelHandle;

procedure cxGridToExcelWithImages( const strDocument: string; cxGrid: TcxGrid; AExpand: boolean );
var
  ExcelApp, Workbook: Variant;
  FileName: string;
  FileTemplate: string;
  SettingsFile: string;
begin
  SettingsFile := GetAppSpecialFolder + 'TempFiles\';

  ExcelApp := CreateOleObject('Excel.Application');

  FileName := SettingsFile + strDocument + '.xlsx';
  FileTemplate := SettingsFile + strDocument + '.xltx';
  DeleteFile(FileName);
  DeleteFile(FileTemplate);
  FileName := SettingsFile + strDocument + '.xlsx';
  try
    ExportGridToXLSX(FileName, cxGrid, AExpand, True, False, 'xlsx');
  except
  end;
  ExcelApp.Application.EnableEvents := false;

  Workbook := ExcelApp.WorkBooks.Add(FileName);
  Workbook.SaveAs(FileTemplate, 54);
  Workbook.Close(0);
  Workbook := ExcelApp.WorkBooks.Add(FileTemplate);
  ExcelApp.Application.EnableEvents := True;

  ExcelApp.Visible := true;
end;

end.
