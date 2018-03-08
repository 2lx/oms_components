unit uOMSStyle;

interface

uses VCL.Graphics, System.SysUtils, cxStyles, cxGrid, cxGridCustomTableView;

const
  // Base: https://flatuicolors.com/palette/de
  // Base: R: #fc5c65 O: #fd9644 Y: #fed330 G: #26de81 GB: #2bcbba
  // Base: SB:#45aaf2 B: #4b7bec P: #a55eea W: #d1d8e0 Gr: #778ca3
  // Base: Pi:#ff7bbd

  // Darken: http://pinetools.com/darken-color
  // 50%
  clOMSSpecialDarkRed         = TColor( $0c03a8 );
  clOMSSpecialDarkOrange      = TColor( $01479e );
  clOMSSpecialDarkYellow      = TColor( $007796 );
  clOMSSpecialDarkGreen       = TColor( $407011 );
  clOMSSpecialDarkSkyBlue     = TColor( $91590a );
  clOMSSpecialDarkBlue        = TColor( $8c340e );
  clOMSSpecialDarkPurple      = TColor( $911252 );
  clOMSSpecialDarkBlueGreen   = TColor( $5c6515 );
  clOMSSpecialDarkPink        = TColor( $5e00bd );


  // Lighten: http://pinetools.com/lighten-color
  // 20%
  clOMSSpecialRed         = TColor( $837cfc );
  clOMSSpecialOrange      = TColor( $69abfd );
  clOMSSpecialYellow      = TColor( $59dbfe );
  clOMSSpecialGreen       = TColor( $9ae451 );
  clOMSSpecialSkyBlue     = TColor( $f4bb6a );
  clOMSSpecialBlue        = TColor( $ef956f );
  clOMSSpecialPurple      = TColor( $ea5ea5 );
  clOMSSpecialBlueGreen   = TColor( $cbda50 );
  clOMSSpecialPink        = TColor( $ca95ff );

  // 80%
  clOMSSpecialLightRed         = TColor( $e0defe );
  clOMSSpecialLightOrange      = TColor( $d9eafe );
  clOMSSpecialLightYellow      = TColor( $d5f6fe );
  clOMSSpecialLightGreen       = TColor( $e5f8d3 );
  clOMSSpecialLightSkyBlue     = TColor( $fceed9 );
  clOMSSpecialLightBlue        = TColor( $fbe4db );
  clOMSSpecialLightPurple      = TColor( $fadeed );
  clOMSSpecialLightBlueGreen   = TColor( $f2f5d3 );
  clOMSSpecialLightPink        = TColor( $f1e4ff );

	clOMSSpecialLightGray        = TColor( $DFDFDF );

  clOMSEditableHighlight  = clOMSSpecialLightBlue;
var
  cxStyleContentError : TcxStyle;
  cxStyleContentDefault : TcxStyle;
  cxStyleContentDefaultBold : TcxStyle;
  cxStyleContentOdd : TcxStyle;
  cxStyleContentOddBold : TcxStyle;
  cxStyleContentCursor : TcxStyle;
  cxStyleContentCursorBold : TcxStyle;
  cxStyleContentEditable : TcxStyle;

  cxStyleRed : TcxStyle;
  cxStyleOrange : TcxStyle;
  cxStyleYellow : TcxStyle;
  cxStyleGreen : TcxStyle;
  cxStyleSkyBlue : TcxStyle;
  cxStyleBlue : TcxStyle;
  cxStylePurple : TcxStyle;
  cxStyleBlueGreen : TcxStyle;
  cxStylePink : TcxStyle;

  cxStyleRedBold : TcxStyle;
  cxStyleYellowBold : TcxStyle;
  cxStyleOrangeBold : TcxStyle;
  cxStyleGreenBold : TcxStyle;
  cxStyleSkyBlueBold : TcxStyle;
  cxStyleBlueBold : TcxStyle;
  cxStylePurpleBold : TcxStyle;
  cxStyleBlueGreenBold : TcxStyle;
  cxStylePinkBold : TcxStyle;

  procedure InitializeStyles;
  procedure FreeAndNilStyles;

type OMSColorName = (
    colnDefault = 1,
    colnRed,
    colnOrange,
    colnYellow,
    colnGreen,
    colnSkyBlue,
    colnBlue,
    colnPurple,
    colnBlueGreen,
    colnPink
  );

type OMSColorType = (
  coltNormal = 1,
  coltLight,
  coltDark,
  coltText
);

  function getColorNameForDBObjectType( const ObjTypeID : Integer ): OMSColorName;
  function getColorNameForDBArticleType( const ArtTypeID : Integer ): OMSColorName;
  function getColorForColorName( const coln: OMSColorName; const colt: OMSColorType = coltNormal): TColor;

  procedure setupGridStyleDefaultBold(var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle : TcxStyle; const isBold : Boolean );
  procedure setupGridStyleDefaultColorBold(var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle : TcxStyle; const coln: OMSColorName; const isBold : Boolean = False );

  procedure setupStyleColorBold(var AStyle : TcxStyle; const coln: OMSColorName; const isBold : Boolean = False);

implementation

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

  InitOneStyle( cxStyleContentError,       clOMSSpecialRed );
  InitOneStyle( cxStyleContentOdd,         clOMSSpecialLightGray );
  InitOneStyle( cxStyleContentOddBold,     clOMSSpecialLightGray, [ fsBold ] );
  InitOneStyle( cxStyleContentCursor,      clOMSSpecialPink );
  InitOneStyle( cxStyleContentCursorBold,  clOMSSpecialPink, [ fsBold ] );
  InitOneStyle( cxStyleContentEditable,    clOMSSpecialLightBlue );

  InitOneStyle( cxStyleRed,                clOMSSpecialRed );
  InitOneStyle( cxStyleOrange,             clOMSSpecialOrange );
  InitOneStyle( cxStyleYellow,             clOMSSpecialYellow );
  InitOneStyle( cxStyleGreen,              clOMSSpecialGreen );
  InitOneStyle( cxStyleSkyBlue,            clOMSSpecialSkyBlue );
  InitOneStyle( cxStyleBlue,               clOMSSpecialBlue );
  InitOneStyle( cxStylePurple,             clOMSSpecialPurple );
  InitOneStyle( cxStyleBlueGreen,          clOMSSpecialBlueGreen );
  InitOneStyle( cxStylePink,               clOMSSpecialPink );

  InitOneStyle( cxStyleRedBold,            clOMSSpecialRed, [ fsBold ] );
  InitOneStyle( cxStyleYellowBold,         clOMSSpecialYellow, [ fsBold ] );
  InitOneStyle( cxStyleOrangeBold,         clOMSSpecialOrange, [ fsBold ] );
  InitOneStyle( cxStyleGreenBold,          clOMSSpecialGreen, [ fsBold ]  );
  InitOneStyle( cxStyleSkyBlueBold,        clOMSSpecialSkyBlue, [ fsBold ]  );
  InitOneStyle( cxStyleBlueBold,           clOMSSpecialBlue, [ fsBold ]  );
  InitOneStyle( cxStylePurpleBold,         clOMSSpecialPurple, [ fsBold ]  );
  InitOneStyle( cxStyleBlueGreenBold,      clOMSSpecialBlueGreen, [ fsBold ]  );
  InitOneStyle( cxStylePinkBold,           clOMSSpecialPink, [ fsBold ]  );
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

  FreeAndNil(cxStyleRed);
  FreeAndNil(cxStyleOrange);
  FreeAndNil(cxStyleYellow);
  FreeAndNil(cxStyleGreen);
  FreeAndNil(cxStyleSkyBlue);
  FreeAndNil(cxStyleBlue);
  FreeAndNil(cxStylePurple);

  FreeAndNil(cxStyleRedBold);
  FreeAndNil(cxStyleYellowBold);
  FreeAndNil(cxStyleGreenBold);
  FreeAndNil(cxStyleSkyBlueBold);
  FreeAndNil(cxStyleBlueBold);

  FreeAndNil(cxStyleContentDefaultBold);
end;

function getColorNameForDBObjectType( const ObjTypeID : Integer ): OMSColorName;
begin
  case ObjTypeID of
    1  : Result := colnBlue;
    6  : Result := colnPurple;
    9  : Result := colnYellow;
    10 : Result := colnGreen;
  else Result := colnDefault;
  end;
end;

function getColorNameForDBArticleType( const ArtTypeID : Integer ): OMSColorName;
begin
  case ArtTypeID of
    1  : Result := colnYellow;
    2  : Result := colnGreen;
    3  : Result := colnBlue;
    4  : Result := colnPurple;
  else Result := colnDefault;
  end;
end;

function getColorForColorName( const coln: OMSColorName; const colt: OMSColorType): TColor;
begin
  if colt = coltNormal then
    case coln of
      colnDefault       : Result := clWhite;
      colnRed           : Result := clOMSSpecialRed;
      colnOrange        : Result := clOMSSpecialOrange;
      colnYellow        : Result := clOMSSpecialYellow;
      colnGreen         : Result := clOMSSpecialGreen;
      colnSkyBlue       : Result := clOMSSpecialSkyBlue;
      colnBlue          : Result := clOMSSpecialBlue;
      colnPurple        : Result := clOMSSpecialPurple;
      colnBlueGreen     : Result := clOMSSpecialBlueGreen;
      colnPink          : Result := clOMSSpecialPink;
    else Result := clWhite;
    end
  else  if colt = coltLight then
    case coln of
      colnDefault       : Result := clWhite;
      colnRed           : Result := clOMSSpecialLightRed;
      colnOrange        : Result := clOMSSpecialLightOrange;
      colnYellow        : Result := clOMSSpecialLightYellow;
      colnGreen         : Result := clOMSSpecialLightGreen;
      colnSkyBlue       : Result := clOMSSpecialLightSkyBlue;
      colnBlue          : Result := clOMSSpecialLightBlue;
      colnPurple        : Result := clOMSSpecialLightPurple;
      colnBlueGreen     : Result := clOMSSpecialLightBlueGreen;
      colnPink          : Result := clOMSSpecialLightPink;
    else Result := clWhite;
    end
  else Result := clWhite;
end;


procedure setupGridStyleDefaultBold(var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle : TcxStyle; const isBold : Boolean );
begin
  if (not isBold)
//    then setupStyleGridDefault(Sender, ARecord, AItem, AStyle)
    then AStyle := cxStyleContentDefault
    else AStyle := cxStyleContentDefaultBold;
    {begin
      if ( Sender.DataController.FocusedRowIndex = ARecord.Index )
        then
        else if Odd( ARecord.Index )
          then AStyle := cxStyleContentDefaultBold
          else AStyle := cxStyleContentOddBold;
    end;}
end;

procedure setupGridStyleDefaultColorBold(var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle : TcxStyle; const coln: OMSColorName; const isBold : Boolean);
begin
  if coln = colnDefault
    then setupGridStyleDefaultBold(Sender, ARecord, AItem, AStyle, isBold)
    else setupStyleColorBold(AStyle, coln, isBold);
end;

procedure setupStyleColorBold(var AStyle : TcxStyle; const coln: OMSColorName; const isBold : Boolean = False);
begin
  if isBold
    then case coln of
      colnDefault:  AStyle := cxStyleContentDefaultBold;
      colnRed:      AStyle := cxStyleRedBold;
      colnOrange:   AStyle := cxStyleOrangeBold;
      colnYellow:   AStyle := cxStyleYellowBold;
      colnGreen:    AStyle := cxStyleGreenBold;
      colnSkyBlue:  AStyle := cxStyleSkyBlueBold;
      colnBlue:     AStyle := cxStyleBlueBold;
      colnPurple:   AStyle := cxStylePurpleBold;
      colnBlueGreen:AStyle := cxStyleBlueGreenBold;
      colnPink:     AStyle := cxStylePinkBold;
    end
    else case coln of
      colnDefault:  AStyle := cxStyleContentDefault;
      colnRed:      AStyle := cxStyleRed;
      colnOrange:   AStyle := cxStyleOrange;
      colnYellow:   AStyle := cxStyleYellow;
      colnGreen:    AStyle := cxStyleGreen;
      colnSkyBlue:  AStyle := cxStyleSkyBlue;
      colnBlue:     AStyle := cxStyleBlue;
      colnPurple:   AStyle := cxStylePurple;
      colnBlueGreen:AStyle := cxStyleBlueGreen;
      colnPink:     AStyle := cxStylePink;
    end;
end;

end.
