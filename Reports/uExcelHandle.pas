unit uExcelHandle;

interface

uses System.Win.ComObj, Variants, Types, Data.DB, System.Classes, Data.Win.ADODB, Graphics;

const
  clOMSReportGray     = TColor( $CCCCCC );
  clOMSReportGreen    = TColor( $99FFCC );
  clOMSReportYellow   = TColor( $99FFFF ); // 2
  clOMSReportRed      = TColor( $CC99FF ); // 3

  clOMSReport1        = TColor( $FFCC99 );
  clOMSReport2        = TColor( $99FFFF );
  clOMSReport3        = TColor( $CC99FF );
  clOMSReport4        = TColor( $FFFF99 );
  clOMSReport5        = TColor( $FF99CC );
  clOMSReport6        = TColor( $FF99FF );
  clOMSReport7        = TColor( $CCFF99 );
  clOMSReport8        = TColor( $99FFCC );
  clOMSReport9        = TColor( $CC99CC );
  clOMSReport10       = TColor( $99CCFF );
  clOMSReport11       = TColor( $99CCCC );
  clOMSReport12       = TColor( $CCFFFF );
  clOMSReport13       = TColor( $CCCC99 );
  clOMSReport14       = TColor( $CCCCCC );

  clOMSReportDark1    = TColor( $FFAA44 );
  clOMSReportDark2    = TColor( $40E3E3 );
  clOMSReportDark3    = TColor( $AA44FF );
  clOMSReportDark4    = TColor( $E0E036 );
  clOMSReportDark5    = TColor( $ED4097 );
  clOMSReportDark6    = TColor( $ED45ED );
  clOMSReportDark7    = TColor( $93E640 );
  clOMSReportDark14   = TColor( $AAAAAA );

  clOMSArrayReportColors: array[1..13] of TColor = ( clOMSReport1, clOMSReport2, clOMSReport3,
      clOMSReport4,  clOMSReport5, clOMSReport6, clOMSReport7, clOMSReport8,
      clOMSReport9, clOMSReport10, clOMSReport11, clOMSReport12, clOMSReport13 );

const
  xlHALeft = 2;
  xlHACenter = 3;
  xlHARight = 4;
  xlVATop = 1;
  xlVACenter = 2;
  xlVABottom = 3;

{ XlPattern }
  xlPatternAutomatic = -4105;
  xlPatternChecker = 9;
  xlPatternCrissCross = 16;
  xlPatternDown = -4121;
  xlPatternGray16 = 17;
  xlPatternGray25 = -4124;
  xlPatternGray50 = -4125;
  xlPatternGray75 = -4126;
  xlPatternGray8 = 18;
  xlPatternGrid = 15;
  xlPatternHorizontal = -4128;
  xlPatternLightDown = 13;
  xlPatternLightHorizontal = 11;
  xlPatternLightUp = 14;
  xlPatternLightVertical = 12;
  xlPatternNone = -4142;
  xlPatternSemiGray75 = 10;
  xlPatternSolid = 1;
  xlPatternUp = -4162;

  xlFreeFloating = $00000003;
  xlMove = $00000002;
  xlMoveAndSize = $00000001;

function ExcelCreateObject( SheetName: String ): Variant;
function ExcelOpenObject( FileName: String ): Variant;
procedure ExcelSetupPrintShrinkFields( ExcelApp: Variant );
procedure ExcelSetupPrintMediumFields( ExcelApp: Variant );
procedure ExcelCloseAll( var ExcelApp : Variant );
procedure ExcelSaveToFile( ExcelApp : Variant; const FileName: String );

procedure ExcelFreezeLeft( ExcelApp: Variant; ColCount : Integer );
procedure ExcelFreezeTop( ExcelApp: Variant; LineCount : Integer );
procedure ExcelFreezeRect( ExcelApp: Variant; X, Y : Integer );

function ExcelInsertImageFromFile( FExcel : Variant; fileName : WideString; imgWidth, imgHeight : Integer;
      showError : Boolean = True ): Boolean;

function ExcelInsertImageFromBlob( FExcel : Variant; blobField: TBlobField; showError : Boolean = True ): Boolean;
function ExcelInsertImageFromBlobToCell( FExcel : Variant; X1, Y1: Integer; blobField: TBlobField; showError : Boolean = True ): Boolean;

function ExcelInsertImageFromBitmap( FExcel : Variant; bmp: Graphics.TBitmap; showError : Boolean = True ): Boolean;
function ExcelInsertImageFromBitmapToCell( FExcel : Variant; X1, Y1: Integer; bmp: Graphics.TBitmap; showError : Boolean = True ): Boolean;

function ExcelValidFormatString( const strOld : String ): String;
function ExcelGetColumnSymbol( const Y : Integer ): String;
function ExcelGetFormulaSumString( const X1, Y1, X2, Y2 : Integer ): String;
function ExcelGetFormulaMaxString( const X1, Y1, X2, Y2 : Integer ): String;

procedure WSSetupPrintPageSettings( WorkSheet : Variant; const PagesWide: Integer = 1;
    PagesTall: Integer = 11; tOrientation: Integer = 2 );

procedure WSSetupRowHeight( WorkSheet : Variant; RowNum, RHeight: Integer );
procedure WSSetupColumnWidth( WorkSheet : Variant; ColNum, ColWidth: Integer );
function WSSetupArrColumnsWidth( WorkSheet : Variant; arr: array of Integer ): Integer;

function WSDrawSimpleHeader( WorkSheet : Variant; rowN: Integer; arrS: array of WideString;
      arrW: array of Integer; firstCol : Integer = 1 ): Integer;
procedure WSDrawTableRect( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer; LineWeight: Integer = 2 );
procedure WSDrawBorderRect( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer; const LineWeight: Integer = 3 );

procedure WSSetupCellFormatDate( WorkSheet : Variant; X1, Y1: Integer; sSign: String = '' );
procedure WSSetupRectFormatDate( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; sSign: String = '' );
procedure WSSetupRectFormatCurrency( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; sSign: String = '' );
procedure WSSetupCellFormatCurrency( WorkSheet : Variant; X, Y: Integer; sSign: String = '' );
procedure WSSetupRectFormatInteger( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; sSign: String = '' );
procedure WSSetupCellFormatInteger( WorkSheet : Variant; X, Y: Integer; sSign: String = '' );
procedure WSSetupRectFormatFloat1( WorkSheet : Variant; X1, Y1, X2, Y2: Integer );
procedure WSSetupRectFormatFloat3( WorkSheet : Variant; X1, Y1, X2, Y2: Integer );
procedure WSSetupRectFormatFloat4( WorkSheet : Variant; X1, Y1, X2, Y2: Integer );
procedure WSSetupCellFormatFloat1( WorkSheet : Variant; X, Y: Integer; const DecimalPlaces : Integer = 1 );
procedure WSSetupRectFormatText( WorkSheet : Variant; X1, Y1, X2, Y2: Integer );

procedure WSSetupRectBGColor( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; col: TColor );
procedure WSSetupRectBGPattern( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; xlPat : Integer );
procedure WSSetupCellBGColor( WorkSheet : Variant; X1, Y1: Integer; col: TColor );
procedure WSSetupRectTextColor( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; col: TColor );

procedure WSSetupRectFontName( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer; FontName: String);
procedure WSSetupRectWrapText( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer );

procedure WSMergeRect( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer );
procedure WSUnMergeRect( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer );
procedure WSMergeDownN( WorkSheet : Variant; const CellR: Integer; const CellC: Integer; const cnt: Integer );
procedure WSMergeRightN( WorkSheet : Variant; const CellR: Integer; const CellC: Integer; const cnt: Integer );

procedure WSSetupGroupRowsBehind( WorkSheet : Variant );
procedure WSGroupRows( WorkSheet : Variant; const firstRow, secondRow: Integer );
procedure WSGroupLevelTrigger( WorkSheet : Variant; LevelN : Integer );

procedure WSSetupRectFilter( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer );

procedure WSSetupCellFont( WorkSheet : Variant; const CellR, CellC: Integer;
      const isBold, isItalic, isUnderiline: Boolean;
      const hAlign : Integer = -1; const vAlign : Integer = -1;
      const FontSize : Integer = -1 );
procedure WSSetupRectFont( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer;
      const isBold, isItalic, isUnderiline: Boolean;
      const hAlign : Integer = -1; const vAlign : Integer = -1;
      const FontSize : Integer = -1 );

procedure WSSetupCellBold( WorkSheet : Variant; const CellR, CellC: Integer; const isBold: Boolean = True );

procedure WSSetupRectOrientation( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer;
      const Angle: Integer );
procedure WSSetupCellTextColorPosition( WorkSheet : Variant; const Cell1R, Cell1C : Integer; PosB, CharsCount : Integer; NewColor: TColor );
procedure WSSetupCellTextBoldPosition( WorkSheet : Variant; const Cell1R, Cell1C : Integer; PosB, CharsCount : Integer );

//------------------------------------------------------------------------------

implementation

uses Windows, Forms, uStrToFloatLocal, UnitFileRoutines, SysUtils, JPEG, ActiveX;

procedure ExcelCloseAll( var ExcelApp : Variant );
begin
  ExcelApp.ActiveWorkBook.Close;

  Sleep( 1000 );
  if not VarIsEmpty( ExcelApp ) then
  begin
    ExcelApp.Quit;
    ExcelApp := Unassigned;
  end;
end;

procedure ExcelSaveToFile( ExcelApp : Variant; const FileName: String );
begin
  ExcelApp.DisplayAlerts := False;
  ExcelApp.ActiveWorkBook.SaveAs( FileName, 54 );
end;

procedure ExcelFreezeLeft( ExcelApp: Variant; ColCount : Integer );
begin
  ExcelApp.ActiveSheet.Columns[ ColCount + 1 ].Select;
  ExcelApp.ActiveWindow.FreezePanes := True;

  Application.ProcessMessages;
end;

procedure ExcelFreezeTop( ExcelApp: Variant; LineCount : Integer );
begin
  ExcelApp.ActiveSheet.Rows[ LineCount + 1 ].Select;
  ExcelApp.ActiveWindow.FreezePanes := True;

  Application.ProcessMessages;
end;

procedure ExcelFreezeRect( ExcelApp: Variant; X, Y : Integer );
begin
  ExcelApp.ActiveSheet.Cells[ X + 1, Y + 1 ].Select;
  ExcelApp.ActiveWindow.FreezePanes := True;

  Application.ProcessMessages;
end;

procedure ExcelSetupPrintShrinkFields( ExcelApp: Variant );
begin
  ExcelApp.ActiveSheet.PageSetup.LeftMargin := ExcelApp.ActiveWorkBook.Application.InchesToPoints( 0.196850393700787 );
  ExcelApp.ActiveSheet.PageSetup.RightMargin := ExcelApp.ActiveWorkBook.Application.InchesToPoints( 0.196850393700787 );
  ExcelApp.ActiveSheet.PageSetup.TopMargin := ExcelApp.ActiveWorkBook.Application.InchesToPoints( 0.196850393700787 );
  ExcelApp.ActiveSheet.PageSetup.BottomMargin := ExcelApp.ActiveWorkBook.Application.InchesToPoints( 0.196850393700787 );

  Application.ProcessMessages;
end;

procedure ExcelSetupPrintMediumFields( ExcelApp: Variant );
begin
  ExcelApp.ActiveSheet.PageSetup.LeftMargin := ExcelApp.ActiveWorkBook.Application.InchesToPoints( 0.25 );
  ExcelApp.ActiveSheet.PageSetup.RightMargin := ExcelApp.ActiveWorkBook.Application.InchesToPoints( 0.25 );
  ExcelApp.ActiveSheet.PageSetup.TopMargin := ExcelApp.ActiveWorkBook.Application.InchesToPoints( 0.25 );
  ExcelApp.ActiveSheet.PageSetup.BottomMargin := ExcelApp.ActiveWorkBook.Application.InchesToPoints( 0.25 );

  Application.ProcessMessages;
end;

function ExcelGetColumnSymbol( const Y : Integer ): String;
const
  strMatr: String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
  if Y > ( 26*26*26 - 1 )
    then Result := 'A'
    else begin
      if Y <= 26
        then Result := strMatr[ Y ]
        else if Y <= 26 * 26
          then Result := strMatr[ ( y - 1 ) Div 26 ] + strMatr[ ( y Mod 26 ) + 26 ]
          else Result := strMatr[ ( y - 1 ) Div ( 26*26 ) ] + strMatr[  ( ( y Mod ( 26*26 ) ) + 26 ) Div 26 ] + strMatr[ ( y Mod 26 ) + 26 ];
    end;

  Application.ProcessMessages;
end;

function ExcelGetFormulaSumString( const X1, Y1, X2, Y2 : Integer ): String;
begin
  Result := '=SUM(' + ExcelGetColumnSymbol( Y1 ) +  IntToStr( X1 ) + ':'
      + ExcelGetColumnSymbol( Y2 ) +  IntToStr( X2 ) + ')';

  Application.ProcessMessages;
end;

function ExcelGetFormulaMaxString( const X1, Y1, X2, Y2 : Integer ): String;
begin
  Result := '=MAX(' + ExcelGetColumnSymbol( Y1 ) +  IntToStr( X1 ) + ':'
      + ExcelGetColumnSymbol( Y2 ) +  IntToStr( X2 ) + ')';

  Application.ProcessMessages;
end;

function ExcelValidFormatString( const strOld : String ): String;
var
  strResult : AnsiString;
  i : Integer;
begin
  strResult := strOld;
  for i := 1 to Length( strResult ) do
  begin
    if NOT (
        ( ( Ord( strResult[ i ] ) >= 48 ) AND ( Ord( strResult[ i ] ) <= 57 ) )
        OR
        ( ( Ord( strResult[ i ] ) >= 65 ) AND ( Ord( strResult[ i ] ) <= 90 ) )
        OR
        ( ( Ord( strResult[ i ] ) >= 97 ) AND ( Ord( strResult[ i ] ) <= 122 ) )
      )
      then strResult[ i ] := '_';
  end;
  if strResult = '' then strResult := '_';

  Result := strResult;

  Application.ProcessMessages;
end;

procedure WSSetupGroupRowsBehind( WorkSheet : Variant );
begin
  WorkSheet.Outline.SummaryRow := 0;

  Application.ProcessMessages;
end;

procedure WSGroupRows( WorkSheet : Variant; const firstRow, secondRow: Integer );
begin
  WorkSheet.Range[ ExcelGetColumnSymbol( 1 ) + IntToStr( firstRow ),
        ExcelGetColumnSymbol( 1 ) + IntToStr( secondRow ) ].Rows.Group;

  Application.ProcessMessages;
end;

procedure WSGroupLevelTrigger( WorkSheet : Variant; LevelN : Integer );
begin
  WorkSheet.Outline.ShowLevels( LevelN );

  Application.ProcessMessages;
end;

procedure WSSetupRectFilter( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer );
begin
  WorkSheet.Range[ WorkSheet.Cells[ Cell1R, Cell1C ], WorkSheet.Cells[ Cell2R, Cell2C ] ].AutoFilter(1, EmptyParam, 1, EmptyParam, True);

  Application.ProcessMessages;
end;

procedure WSSetupCellFont( WorkSheet : Variant; const CellR, CellC: Integer;
      const isBold, isItalic, isUnderiline: Boolean;
      const hAlign : Integer = -1; const vAlign : Integer = -1;
      const FontSize : Integer = -1 );
begin
  WorkSheet.Cells[ CellR, CellC ].Font.Bold := isBold;
  WorkSheet.Cells[ CellR, CellC ].Font.Italic := isItalic;
  WorkSheet.Cells[ CellR, CellC ].Font.Underline := isUnderiline;
  if ( FontSize > 0 )
    then WorkSheet.Cells[ CellR, CellC ].Font.Size := FontSize;
  if ( hAlign > 0 )
    then WorkSheet.Cells[ CellR, CellC ].HorizontalAlignment := hAlign;
  if ( vAlign > 0 )
    then WorkSheet.Cells[ CellR, CellC ].VerticalAlignment := vAlign;

  Application.ProcessMessages;
end;

procedure WSSetupCellBold( WorkSheet : Variant; const CellR, CellC: Integer; const isBold: Boolean = True );
begin
  WorkSheet.Cells[ CellR, CellC ].Font.Bold := isBold;
end;

procedure WSSetupRectFont( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer;
      const isBold, isItalic, isUnderiline: Boolean;
      const hAlign : Integer = -1; const vAlign : Integer = -1;
      const FontSize : Integer = -1 );
var
  Cell1, Cell2, Range: Variant;
begin
  Cell1 := WorkSheet.Cells[ Cell1R, Cell1C ];
  Cell2 := WorkSheet.Cells[ Cell2R, Cell2C ];
  Range := WorkSheet.Range[ Cell1, Cell2 ];

  Range.Font.Bold := isBold;
  Range.Font.Italic := isItalic;
  Range.Font.Underline := isUnderiline;
  if ( FontSize > 0 )
    then Range.Font.Size := FontSize;
  if ( hAlign > 0 )
    then Range.HorizontalAlignment := hAlign;
  if ( vAlign > 0 )
    then Range.VerticalAlignment := vAlign;

  Application.ProcessMessages;
end;

procedure WSSetupRectBGColor( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; col: TColor );
var
  Cell1, Cell2, Range: Variant;
begin
  Cell1 := WorkSheet.Cells[ X1, Y1 ];
  Cell2 := WorkSheet.Cells[ X2, Y2 ];
  Range := WorkSheet.Range[ Cell1, Cell2 ];
  Range.Interior.Color := col;

  Application.ProcessMessages;
end;

procedure WSSetupRectBGPattern( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; xlPat : Integer );
var
  Cell1, Cell2, Range: Variant;
begin
  Cell1 := WorkSheet.Cells[ X1, Y1 ];
  Cell2 := WorkSheet.Cells[ X2, Y2 ];
  Range := WorkSheet.Range[ Cell1, Cell2 ];
  Range.Interior.Pattern := xlPat;

  Application.ProcessMessages;
end;

procedure WSSetupRectTextColor( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; col: TColor );
var
  Cell1, Cell2, Range: Variant;
begin
  Cell1 := WorkSheet.Cells[ X1, Y1 ];
  Cell2 := WorkSheet.Cells[ X2, Y2 ];
  Range := WorkSheet.Range[ Cell1, Cell2 ];
  Range.Font.Color := col;

  Application.ProcessMessages;
end;

procedure WSSetupCellBGColor( WorkSheet : Variant; X1, Y1: Integer; col: TColor );
begin
  WorkSheet.Cells[ X1, Y1 ].Interior.Color := col;

  Application.ProcessMessages;
end;

function ExcelCreateObject( SheetName: String ): Variant;
begin
  Result := CreateOleObject( 'Excel.Application' );
  Result.Application.EnableEvents := false;
  Result.WorkBooks.Add;

  while Result.ActiveWorkbook.Sheets.Count > 1 do
      Result.ActiveWorkbook.Sheets[ 1 ].Delete;
  Result.WorkSheets[ 1 ].Name := SheetName;

  Application.ProcessMessages;
end;

function ExcelOpenObject( FileName: String ): Variant;
begin
  Result := CreateOleObject( 'Excel.Application' );
  Result.Workbooks.Open( FileName );

  Application.ProcessMessages;
end;

procedure WSSetupPrintPageSettings( WorkSheet : Variant; const PagesWide: Integer;
    PagesTall: Integer; tOrientation: Integer );
begin
  WorkSheet.PageSetup.Orientation := tOrientation;
  WorkSheet.PageSetup.Zoom := False;
  WorkSheet.PageSetup.FitToPagesWide := PagesWide;
  WorkSheet.PageSetup.FitToPagesTall := PagesTall;

  Application.ProcessMessages;
end;

procedure WSSetupRowHeight( WorkSheet : Variant; RowNum, RHeight: Integer );
begin
  if RHeight > 400
    then WorkSheet.Rows.Rows[ RowNum ].RowHeight := 400
    else WorkSheet.Rows.Rows[ RowNum ].RowHeight := RHeight;

  Application.ProcessMessages;
end;

procedure WSSetupColumnWidth( WorkSheet : Variant; ColNum, ColWidth: Integer );
begin
  WorkSheet.Columns.Columns[ ColNum ].ColumnWidth := ColWidth;

  Application.ProcessMessages;
end;

function WSSetupArrColumnsWidth( WorkSheet : Variant; arr: array of Integer ): Integer;
var
  i : Integer;
begin
  for i := 0 to High( arr ) do
  begin
    WSSetupColumnWidth( WorkSheet, i + 1, arr[ i ] );

 //   Application.ProcessMessages;
  end;

  Result := High( arr ) + 1;
end;

procedure WSDrawTableRect( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C : Integer;
     LineWeight: Integer );
var
  Cell1, Cell2, Range: Variant;
begin
  Cell1 := WorkSheet.Cells[ Cell1R, Cell1C ];
  Cell2 := WorkSheet.Cells[ Cell2R, Cell2C ];
  Range := WorkSheet.Range[ Cell1, Cell2 ];
  Range.Borders.LineStyle := 1;
  Range.Borders.Weight := LineWeight;
  Range.WrapText := True;

  Application.ProcessMessages;
end;

procedure WSDrawBorderRect( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C : Integer; const LineWeight: Integer );
var
  Cell1, Cell2, Range: Variant;
begin
  Cell1 := WorkSheet.Cells[ Cell1R, Cell1C ];
  Cell2 := WorkSheet.Cells[ Cell2R, Cell2C ];
  Range := WorkSheet.Range[ Cell1, Cell2 ];
  Range.Borders[ 7 ].LineStyle := 1; //ñëåâà
  Range.Borders[ 7 ].Weight := LineWeight;
  Range.Borders[ 8 ].LineStyle := 1; //âåðõíÿÿ
  Range.Borders[ 8 ].Weight := LineWeight;
  Range.Borders[ 9 ].LineStyle := 1; //íèæíÿÿ
  Range.Borders[ 9 ].Weight := LineWeight;
  Range.Borders[ 10 ].LineStyle := 1; //ïðàâàÿ
  Range.Borders[ 10 ].Weight := LineWeight;

  Application.ProcessMessages;
end;

procedure WSSetupRectWrapText( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer );
var
  Cell1, Cell2, Range: Variant;
begin
  Cell1 := WorkSheet.Cells[ Cell1R, Cell1C ];
  Cell2 := WorkSheet.Cells[ Cell2R, Cell2C ];
  Range := WorkSheet.Range[ Cell1, Cell2 ];
  Range.WrapText := True;

  Application.ProcessMessages;
end;

function WSDrawSimpleHeader( WorkSheet : Variant; rowN: Integer; arrS: array of WideString;
      arrW: array of Integer; firstCol : Integer = 1 ): Integer;
var
  i, curCol : Integer;
begin
  Result := 0;
  if High( arrS ) <> High( arrW ) then Exit;

  curCol := firstCol;
  for i := 0 to High( arrS ) do
  begin
    if ( arrW[ i ] <> 1 )
      then WSMergeRightN( WorkSheet, rowN, curCol, arrW[ i ] );
    WorkSheet.Cells[ rowN, curCol ] := arrS[ i ];

    curCol := curCol + arrW[ i ];
    Application.ProcessMessages;
  end;

  WSSetupRectFont( WorkSheet, rowN, 1, rowN, curCol, True, False, False, xlHACenter, xlVACenter, 10 );

  Result := High( arrS ) + 1;

  Application.ProcessMessages;
end;

procedure WSSetupRectFontName( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer; FontName: String);
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ Cell1R, Cell1C ],
      WorkSheet.Cells[ Cell2R, Cell2C ] ].Font.Name := FontName;

  Application.ProcessMessages;
end;

procedure WSMergeRect( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer);
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ Cell1R, Cell1C ],
      WorkSheet.Cells[ Cell2R, Cell2C ] ].Merge;

  Application.ProcessMessages;
end;

procedure WSUnMergeRect( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer);
begin
  if (cell1R < 0) OR (cell1C < 0) OR (cell2R < 0) OR (cell2C < 0)
      OR ((cell1R = cell2R) AND (cell1C = cell2C))
    then Exit;

  WorkSheet.Cells.Range[ WorkSheet.Cells[ Cell1R, Cell1C ],
      WorkSheet.Cells[ Cell2R, Cell2C ] ].UnMerge;

  Application.ProcessMessages;
end;

procedure WSMergeDownN( WorkSheet : Variant; const CellR: Integer; const CellC: Integer; const cnt: Integer );
begin
  WSMergeRect( WorkSheet, CellR, CellC, CellR + cnt - 1, CellC );

  Application.ProcessMessages;
end;

procedure WSMergeRightN( WorkSheet : Variant; const CellR: Integer; const CellC: Integer; const cnt: Integer );
begin
  WSMergeRect( WorkSheet, CellR, CellC, CellR, CellC + cnt - 1 );

  Application.ProcessMessages;
end;

procedure WSSetupCellFormatDate( WorkSheet : Variant; X1, Y1: Integer; sSign: String = '' );
begin
  WorkSheet.Cells[ X1, Y1 ].NumberFormat := 'ÄÄ.ÌÌ.ÃÃÃÃ';

  Application.ProcessMessages;
end;

procedure WSSetupRectFormatDate( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; sSign: String = '' );
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ X1, Y1 ],
      WorkSheet.Cells[ X2, Y2 ] ].NumberFormat := 'ÄÄ.ÌÌ.ÃÃÃÃ';

  Application.ProcessMessages;
end;

procedure WSSetupRectFormatCurrency( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; sSign: String = '' );
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ X1, Y1 ],
      WorkSheet.Cells[ X2, Y2 ] ].NumberFormat := '# ##0' + FormatSettings.DecimalSeparator + '00' + sSign;

  Application.ProcessMessages;
end;

procedure WSSetupCellFormatCurrency( WorkSheet : Variant; X, Y: Integer; sSign: String = '' );
begin
  WorkSheet.Cells[ X, Y ].NumberFormat := '# ##0' + FormatSettings.DecimalSeparator + '00' + sSign;

  Application.ProcessMessages;
end;

procedure WSSetupRectFormatInteger( WorkSheet : Variant; X1, Y1, X2, Y2: Integer; sSign: String = '' );
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ X1, Y1 ],
      WorkSheet.Cells[ X2, Y2 ] ].NumberFormat := '# 0' + sSign;

  Application.ProcessMessages;
end;

procedure WSSetupCellFormatInteger( WorkSheet : Variant; X, Y: Integer; sSign: String = '' );
begin
  WorkSheet.Cells[ X, Y ].NumberFormat := '# 0' + sSign;

  Application.ProcessMessages;
end;

procedure WSSetupRectFormatFloat1( WorkSheet : Variant; X1, Y1, X2, Y2: Integer );
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ X1, Y1 ],
      WorkSheet.Cells[ X2, Y2 ] ].NumberFormat := '# # 0' + FormatSettings.DecimalSeparator + '0';

  Application.ProcessMessages;
end;

procedure WSSetupRectFormatFloat3( WorkSheet : Variant; X1, Y1, X2, Y2: Integer );
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ X1, Y1 ],
      WorkSheet.Cells[ X2, Y2 ] ].NumberFormat := '# ### 0' + FormatSettings.DecimalSeparator + '000';

  Application.ProcessMessages;
end;

procedure WSSetupRectFormatFloat4( WorkSheet : Variant; X1, Y1, X2, Y2: Integer );
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ X1, Y1 ],
      WorkSheet.Cells[ X2, Y2 ] ].NumberFormat := '# #### 0' + FormatSettings.DecimalSeparator + '0000';

  Application.ProcessMessages;
end;

procedure WSSetupCellFormatFloat1( WorkSheet : Variant; X, Y: Integer; const DecimalPlaces : Integer );
begin
  WorkSheet.Cells[ X, Y ].NumberFormat := '# # 0' + FormatSettings.DecimalSeparator + '0';

  Application.ProcessMessages;
end;

procedure WSSetupRectFormatText( WorkSheet : Variant; X1, Y1, X2, Y2: Integer );
begin
  WorkSheet.Cells.Range[ WorkSheet.Cells[ X1, Y1 ],
      WorkSheet.Cells[ X2, Y2 ] ].NumberFormat := AnsiChar( '@' );

  Application.ProcessMessages;
end;

function ExcelInsertImageFromFile( FExcel : Variant; fileName : WideString;
      imgWidth, imgHeight : Integer; showError : Boolean = True ): Boolean;
var
  jpg: TJPEGImage;
  imgTop, imgLeft, selWidth, selHeight : Integer;
  imgKoeff: Real;
  FExcelVersion : Single;
begin
  Result := True;

  TryStrToFloatAny( String( FExcel.Version ), FExcelVersion );
  Application.ProcessMessages;

  if FileExists( fileName ) AND ( GetFileSize( fileName ) > 0 ) then begin
    imgTop := FExcel.Selection.Top + 1;
    imgLeft := FExcel.Selection.Left + 1;
    selHeight := FExcel.Selection.Height - 2;
    selWidth := FExcel.Selection.Width - 2;

    if FExcelVersion > 11
      then FExcel.ActiveSheet.Shapes.AddPicture( fileName,
              False{!}, True{!}, imgLeft, imgTop, imgWidth, imgHeight ).Select
      else FExcel.ActiveSheet.Pictures.Insert( fileName ).Select;

    FExcel.Selection.Placement := xlMoveAndSize;

    if FExcelVersion > 11
    then begin
      if ( selHeight <> 0 ) AND ( imgHeight <> 0 )
      then begin
        imgKoeff := imgWidth / imgHeight;
        if imgKoeff > ( selWidth / selHeight )
        then begin
          FExcel.Selection.ShapeRange.Width := selWidth;
          FExcel.Selection.ShapeRange.Height := selWidth / imgKoeff;
          FExcel.Selection.ShapeRange.Top := imgTop + ( selHeight - ( selWidth / imgKoeff ) ) / 2;
        end else begin
          FExcel.Selection.ShapeRange.Height := selHeight;
          FExcel.Selection.ShapeRange.Width := selHeight * imgKoeff;
          FExcel.Selection.ShapeRange.Left := imgLeft + ( selWidth - ( selHeight * imgKoeff ) ) / 2;
        end;
      end;
    end // if FExcelVersion > 11
    else begin
      FExcel.Selection.ShapeRange.Height := selHeight - 1;
      if FExcel.Selection.ShapeRange.Width > selWidth then
      begin
        FExcel.Selection.ShapeRange.Width := selWidth - 1;
        imgKoeff := FExcel.Selection.ShapeRange.Width / FExcel.Selection.ShapeRange.Height;
        FExcel.Selection.ShapeRange.Top := imgTop + ( selHeight - ( selWidth / imgKoeff ) ) / 2;
        FExcel.Selection.ShapeRange.Left := FExcel.Selection.ShapeRange.Left + 1;
      end
      else
      begin
        imgKoeff := FExcel.Selection.ShapeRange.Width / FExcel.Selection.ShapeRange.Height;
        FExcel.Selection.ShapeRange.Left := imgLeft + ( selWidth - ( selHeight * imgKoeff ) ) / 2;
        FExcel.Selection.ShapeRange.Top := FExcel.Selection.ShapeRange.Top + 1;
      end;
    end;

    Application.ProcessMessages;
  end // if FileExists( strTempFileName )
  else begin
    if showError
      then FExcel.Selection := 'ÈÇÎÁÐÀÆÅÍÈÅ ÎÒÑÓÒÑÒÂÓÅÒ';

    Result := False;
  end;
end;

function ExcelInsertImageFromBlob( FExcel : Variant; blobField: TBlobField; showError : Boolean = True ): Boolean;
var
  strTempFileName: String;
  Blob: TMemoryStream;
  jpg: TJPEGImage;
  imgWidth, imgHeight : Integer;
begin
  Result := True;

  strTempFileName := GetAppSpecialFolder + 'temp_' +
    StringReplace( VarToStr( TimeToStr( Now ) ), ':', '_', [rfReplaceAll] ) + '.jpg';
  jpg := TJPEGImage.Create;
  Blob := TADOBlobStream.Create( blobField, bmRead );
  try
    jpg.LoadFromStream( Blob );
    imgWidth := jpg.Width;
    imgHeight := jpg.Height;
    jpg.SaveToFile( strTempFileName );
  finally
    jpg.Free;
    Blob.Free;
  end;
  Application.ProcessMessages;

  ExcelInsertImageFromFile( FExcel, strTempFileName, imgWidth, imgHeight, showError );

  if FileExists( strTempFileName )
    then DeleteFile( PWideChar( strTempFileName ) );
end;

function ExcelInsertImageFromBlobToCell( FExcel : Variant; X1, Y1: Integer; blobField: TBlobField; showError : Boolean = True ): Boolean;
begin
  FExcel.ActiveSheet.Cells[ X1, Y1 ].Select;

  FExcel.Selection.Font.Color := clRed;
  WSSetupCellFont( FExcel.ActiveSheet, X1, Y1,True, False, False, xlHACenter, xlVACenter, 10 );

  Result := ExcelInsertImageFromBlob( FExcel, blobField, showError );
end;

function ExcelInsertImageFromBitmap( FExcel : Variant; bmp: Graphics.TBitmap; showError : Boolean = True ): Boolean;
var
  strTempFileName: String;
  imgWidth, imgHeight : Integer;
begin
  Result := True;

  strTempFileName := GetAppSpecialFolder + 'temp_' +
      StringReplace( VarToStr( TimeToStr( Now ) ), ':', '_', [rfReplaceAll] ) + '.bmp';

  try
    imgWidth := bmp.Width;
    imgHeight := bmp.Height;
    bmp.SaveToFile( strTempFileName );
  finally
  end;
  Application.ProcessMessages;

  ExcelInsertImageFromFile( FExcel, strTempFileName, imgWidth, imgHeight, showError );

  if FileExists( strTempFileName )
    then DeleteFile( PWideChar( strTempFileName ) );
end;

function ExcelInsertImageFromBitmapToCell( FExcel : Variant; X1, Y1: Integer; bmp: Graphics.TBitmap; showError : Boolean = True ): Boolean;
begin
  FExcel.ActiveSheet.Cells[ X1, Y1 ].Select;

  FExcel.Selection.Font.Color := clRed;
  WSSetupCellFont( FExcel.ActiveSheet, X1, Y1,True, False, False, xlHACenter, xlVACenter, 10 );

  Result := ExcelInsertImageFromBitmap( FExcel, bmp, showError );
end;

procedure WSSetupRectOrientation( WorkSheet : Variant; const Cell1R, Cell1C, Cell2R, Cell2C: Integer;
    const Angle: Integer );
var
  Cell1, Cell2, Range: Variant;
begin
  Cell1 := WorkSheet.Cells[ Cell1R, Cell1C ];
  Cell2 := WorkSheet.Cells[ Cell2R, Cell2C ];
  Range := WorkSheet.Range[ Cell1, Cell2 ];

  Range.Orientation := Angle;

  Application.ProcessMessages;
end;

procedure WSSetupCellTextColorPosition( WorkSheet : Variant; const Cell1R, Cell1C : Integer; PosB, CharsCount : Integer; NewColor: TColor );
begin
  WorkSheet.Cells[ Cell1R, Cell1C ].Characters[ posB, CharsCount ].Font.Color := NewColor;
end;

procedure WSSetupCellTextBoldPosition( WorkSheet : Variant; const Cell1R, Cell1C : Integer; PosB, CharsCount : Integer );
begin
  WorkSheet.Cells[ Cell1R, Cell1C ].Characters[ posB, CharsCount ].Font.Bold := True;
end;

end.
