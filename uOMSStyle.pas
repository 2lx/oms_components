unit uOMSStyle;

interface

uses VCL.Graphics, cxStyles, cxGrid, cxGridCustomTableView;

var
  cxStyleDefaultBold : TcxStyle;

  cxStyleRed : TcxStyle;
  cxStyleOrange : TcxStyle;
  cxStyleYellow : TcxStyle;
  cxStyleGreen : TcxStyle;
  cxStyleSkyBlue : TcxStyle;
  cxStyleBlue : TcxStyle;
  cxStylePurple : TcxStyle;
  cxStyleBlueGreen : TcxStyle;
  cxStylePink : TcxStyle;

  cxStyleLightRed : TcxStyle;
  cxStyleLightOrange : TcxStyle;
  cxStyleLightYellow : TcxStyle;
  cxStyleLightGreen : TcxStyle;
  cxStyleLightSkyBlue : TcxStyle;
  cxStyleLightBlue : TcxStyle;
  cxStyleLightPurple : TcxStyle;
  cxStyleLightBlueGreen : TcxStyle;
  cxStyleLightPink : TcxStyle;

  cxStyleRedBold : TcxStyle;
  cxStyleYellowBold : TcxStyle;
  cxStyleOrangeBold : TcxStyle;
  cxStyleGreenBold : TcxStyle;
  cxStyleSkyBlueBold : TcxStyle;
  cxStyleBlueBold : TcxStyle;
  cxStylePurpleBold : TcxStyle;
  cxStyleBlueGreenBold : TcxStyle;
  cxStylePinkBold : TcxStyle;

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

  function getOMSColor( const coln: OMSColorName; const colt: OMSColorType = coltNormal): TColor;
  function getOMSStyle(const coln: OMSColorName; const isBold : Boolean = False) : TcxStyle;

implementation

uses uOMSColors, System.SysUtils;

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
  InitFontStyle( cxStyleDefaultBold, [ fsBold ]);

  InitOneStyle( cxStyleRed,                clOMSSpecialRed );
  InitOneStyle( cxStyleOrange,             clOMSSpecialOrange );
  InitOneStyle( cxStyleYellow,             clOMSSpecialYellow );
  InitOneStyle( cxStyleGreen,              clOMSSpecialGreen );
  InitOneStyle( cxStyleSkyBlue,            clOMSSpecialSkyBlue );
  InitOneStyle( cxStyleBlue,               clOMSSpecialBlue );
  InitOneStyle( cxStylePurple,             clOMSSpecialPurple );
  InitOneStyle( cxStyleBlueGreen,          clOMSSpecialBlueGreen );
  InitOneStyle( cxStylePink,               clOMSSpecialPink );

  InitOneStyle( cxStyleLightRed,           clOMSSpecialLightRed );
  InitOneStyle( cxStyleLightOrange,        clOMSSpecialLightOrange );
  InitOneStyle( cxStyleLightYellow,        clOMSSpecialLightYellow );
  InitOneStyle( cxStyleLightGreen,         clOMSSpecialLightGreen );
  InitOneStyle( cxStyleLightSkyBlue,       clOMSSpecialLightSkyBlue );
  InitOneStyle( cxStyleLightBlue,          clOMSSpecialLightBlue );
  InitOneStyle( cxStyleLightPurple,        clOMSSpecialLightPurple );
  InitOneStyle( cxStyleLightBlueGreen,     clOMSSpecialLightBlueGreen );
  InitOneStyle( cxStyleLightPink,          clOMSSpecialLightPink );

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
  FreeAndNil(cxStyleDefaultBold);

  FreeAndNil(cxStyleRed);
  FreeAndNil(cxStyleOrange);
  FreeAndNil(cxStyleYellow);
  FreeAndNil(cxStyleGreen);
  FreeAndNil(cxStyleSkyBlue);
  FreeAndNil(cxStyleBlue);
  FreeAndNil(cxStylePurple);

  FreeAndNil(cxStyleLightRed);
  FreeAndNil(cxStyleLightOrange);
  FreeAndNil(cxStyleLightYellow);
  FreeAndNil(cxStyleLightGreen);
  FreeAndNil(cxStyleLightSkyBlue);
  FreeAndNil(cxStyleLightBlue);
  FreeAndNil(cxStyleLightPurple);

  FreeAndNil(cxStyleRedBold);
  FreeAndNil(cxStyleYellowBold);
  FreeAndNil(cxStyleGreenBold);
  FreeAndNil(cxStyleSkyBlueBold);
  FreeAndNil(cxStyleBlueBold);
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

function getOMSColor( const coln: OMSColorName; const colt: OMSColorType): TColor;
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

function getOMSStyle(const coln: OMSColorName; const isBold : Boolean = False) : TcxStyle;
begin
  if isBold
    then case coln of
      colnDefault:  Result := cxStyleDefaultBold;
      colnRed:      Result := cxStyleRedBold;
      colnOrange:   Result := cxStyleOrangeBold;
      colnYellow:   Result := cxStyleYellowBold;
      colnGreen:    Result := cxStyleGreenBold;
      colnSkyBlue:  Result := cxStyleSkyBlueBold;
      colnBlue:     Result := cxStyleBlueBold;
      colnPurple:   Result := cxStylePurpleBold;
      colnBlueGreen:Result := cxStyleBlueGreenBold;
      colnPink:     Result := cxStylePinkBold;
    end
    else case coln of
//      colnDefault:  Result := cxStyleContentDefault;
      colnRed:      Result := cxStyleRed;
      colnOrange:   Result := cxStyleOrange;
      colnYellow:   Result := cxStyleYellow;
      colnGreen:    Result := cxStyleGreen;
      colnSkyBlue:  Result := cxStyleSkyBlue;
      colnBlue:     Result := cxStyleBlue;
      colnPurple:   Result := cxStylePurple;
      colnBlueGreen:Result := cxStyleBlueGreen;
      colnPink:     Result := cxStylePink;
    end;
end;

initialization
  InitializeStyles;

finalization
  FreeAndNilStyles;

end.
