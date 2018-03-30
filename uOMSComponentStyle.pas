unit uOMSComponentStyle;

interface

uses uOMSColors, VCL.Graphics, cxStyles;

const
  clOMSEditableHighlight  = TColor( $FFF0E1 );      // clOMSSpecialLightBlue;
  clOMSAssignedDblClick   = TColor( $5c6515 );      // clOMSSpecialDarkBlueGreen

var
  cxStyleContentError : TcxStyle;
  cxStyleContentEditable : TcxStyle;
  cxStyleContentCursor : TcxStyle;
  cxStyleContentCursorBold : TcxStyle;
  cxStyleContentDefault : TcxStyle;
  cxStyleContentDefaultBold : TcxStyle;
  cxStyleContentOdd : TcxStyle;
  cxStyleContentOddBold : TcxStyle;

implementation

uses System.SysUtils;

procedure InitializeStyles;
  procedure InitOneStyle( var style: TcxStyle; bgcol : TColor; fs : TFontStyles = []; tcol : TColor = clBlack );
  begin
    style := TcxStyle.Create( Nil );
    style.Color := bgcol;
    style.Font.Style := fs;
    style.TextColor := tcol;
  end;

  procedure InitFontStyle( var style: TcxStyle; fs : TFontStyles = []; tcol : TColor = clBlack );
  begin
    style := TcxStyle.Create( Nil );
    style.Font.Style := fs;
    style.TextColor := tcol;
  end;

begin
  cxStyleContentDefault := TcxStyle.Create( Nil );
  InitFontStyle( cxStyleContentDefaultBold, [ fsBold ]);

  InitOneStyle( cxStyleContentError,       clOMSRed );
  InitOneStyle( cxStyleContentOdd,         clOMSLightGray );
  InitOneStyle( cxStyleContentOddBold,     clOMSLightGray, [ fsBold ] );
  InitOneStyle( cxStyleContentCursor,      clOMSPink );
  InitOneStyle( cxStyleContentCursorBold,  clOMSPink, [ fsBold ] );
  InitOneStyle( cxStyleContentEditable,    clOMSEditableHighlight );
end;

procedure FreeAndNilStyles;
begin
  FreeAndNil(cxStyleContentError);
  FreeAndNil(cxStyleContentDefault);
  FreeAndNil(cxStyleContentDefaultBold);
  FreeAndNil(cxStyleContentOdd);
  FreeAndNil(cxStyleContentOddBold);
  FreeAndNil(cxStyleContentCursor);
  FreeAndNil(cxStyleContentCursorBold);
  FreeAndNil(cxStyleContentEditable);
end;

initialization
  InitializeStyles;

finalization
  FreeAndNilStyles;

end.
