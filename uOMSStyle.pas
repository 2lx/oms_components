unit uOMSStyle;

interface

uses VCL.Graphics, cxStyles;

var
  styleDefault : TcxStyle;
  styleRed : TcxStyle;
  styleOrange : TcxStyle;
  styleYellow : TcxStyle;
  styleGreen : TcxStyle;
  styleSkyBlue : TcxStyle;
  styleBlue : TcxStyle;
  stylePurple : TcxStyle;
  styleBlueGreen : TcxStyle;
  stylePink : TcxStyle;
  styleWhite : TcxStyle;

  styleLightGray : TcxStyle;
  styleLightRed : TcxStyle;
  styleLightOrange : TcxStyle;
  styleLightYellow : TcxStyle;
  styleLightGreen : TcxStyle;
  styleLightSkyBlue : TcxStyle;
  styleLightBlue : TcxStyle;
  styleLightPurple : TcxStyle;
  styleLightBlueGreen : TcxStyle;
  styleLightPink : TcxStyle;

  styleFontRed : TcxStyle;
  styleFontOrange : TcxStyle;
  styleFontYellow : TcxStyle;
  styleFontGreen : TcxStyle;
  styleFontSkyBlue : TcxStyle;
  styleFontBlue : TcxStyle;
  styleFontPurple : TcxStyle;
  styleFontBlueGreen : TcxStyle;
  styleFontPink : TcxStyle;

  styleOrangeFontRed : TcxStyle;
  styleYellowFontRed : TcxStyle;
  styleGreenFontRed : TcxStyle;
  styleSkyBlueFontRed : TcxStyle;
  styleBlueFontRed : TcxStyle;
  stylePurpleFontRed : TcxStyle;
  styleBlueGreenFontRed : TcxStyle;
  stylePinkFontRed : TcxStyle;

  styleDefaultBold : TcxStyle;
  styleRedBold : TcxStyle;
  styleYellowBold : TcxStyle;
  styleOrangeBold : TcxStyle;
  styleGreenBold : TcxStyle;
  styleSkyBlueBold : TcxStyle;
  styleBlueBold : TcxStyle;
  stylePurpleBold : TcxStyle;
  styleBlueGreenBold : TcxStyle;
  stylePinkBold : TcxStyle;

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
  function getOMSStyle(const coln: OMSColorName; const isBold : Boolean = False; const isError : Boolean = False ) : TcxStyle;

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
  styleDefault := TcxStyle.Create( Nil );
  InitFontStyle( styleDefaultBold, [ fsBold ]);

  InitOneStyle( styleRed,                clOMSRed );
  InitOneStyle( styleOrange,             clOMSOrange );
  InitOneStyle( styleYellow,             clOMSYellow );
  InitOneStyle( styleGreen,              clOMSGreen );
  InitOneStyle( styleSkyBlue,            clOMSSkyBlue );
  InitOneStyle( styleBlue,               clOMSBlue );
  InitOneStyle( stylePurple,             clOMSPurple );
  InitOneStyle( styleBlueGreen,          clOMSBlueGreen );
  InitOneStyle( stylePink,               clOMSPink );
  InitOneStyle( styleWhite,              clWhite );

  InitOneStyle( styleLightRed,           clOMSLightRed );
  InitOneStyle( styleLightOrange,        clOMSLightOrange );
  InitOneStyle( styleLightYellow,        clOMSLightYellow );
  InitOneStyle( styleLightGreen,         clOMSLightGreen );
  InitOneStyle( styleLightSkyBlue,       clOMSLightSkyBlue );
  InitOneStyle( styleLightBlue,          clOMSLightBlue );
  InitOneStyle( styleLightPurple,        clOMSLightPurple );
  InitOneStyle( styleLightBlueGreen,     clOMSLightBlueGreen );
  InitOneStyle( styleLightPink,          clOMSLightPink );
  InitOneStyle( styleLightGray,          clOMSLightGray );

  InitFontStyle( styleFontRed,           [ fsBold ], clOMSFontRed );
  InitFontStyle( styleFontOrange,        [ fsBold ], clOMSFontOrange );
  InitFontStyle( styleFontYellow,        [ fsBold ], clOMSFontYellow );
  InitFontStyle( styleFontGreen,         [ fsBold ], clOMSFontGreen );
  InitFontStyle( styleFontSkyBlue,       [ fsBold ], clOMSFontSkyBlue );
  InitFontStyle( styleFontPurple,        [ fsBold ], clOMSFontPurple );
  InitFontStyle( styleFontBlueGreen,     [ fsBold ], clOMSFontBlueGreen );
  InitFontStyle( styleFontPink,          [ fsBold ], clOMSFontPink );

  InitOneStyle( styleOrangeFontRed,      clOMSOrange, [ fsBold ], clOMSFontRed );
  InitOneStyle( styleYellowFontRed,      clOMSYellow, [ fsBold ], clOMSFontRed );
  InitOneStyle( styleGreenFontRed,       clOMSGreen, [ fsBold ], clOMSFontRed );
  InitOneStyle( styleSkyBlueFontRed,     clOMSSkyBlue, [ fsBold ], clOMSFontRed );
  InitOneStyle( styleBlueFontRed,        clOMSBlue, [ fsBold ], clOMSFontRed );
  InitOneStyle( stylePurpleFontRed,      clOMSPurple, [ fsBold ], clOMSFontRed );
  InitOneStyle( styleBlueGreenFontRed,   clOMSBlueGreen, [ fsBold ], clOMSFontRed );
  InitOneStyle( stylePinkFontRed,        clOMSPink, [ fsBold ], clOMSFontRed );

  InitOneStyle( styleRedBold,            clOMSRed, [ fsBold ] );
  InitOneStyle( styleOrangeBold,         clOMSOrange, [ fsBold ] );
  InitOneStyle( styleYellowBold,         clOMSYellow, [ fsBold ] );
  InitOneStyle( styleGreenBold,          clOMSGreen, [ fsBold ]  );
  InitOneStyle( styleSkyBlueBold,        clOMSSkyBlue, [ fsBold ]  );
  InitOneStyle( styleBlueBold,           clOMSBlue, [ fsBold ]  );
  InitOneStyle( stylePurpleBold,         clOMSPurple, [ fsBold ]  );
  InitOneStyle( styleBlueGreenBold,      clOMSBlueGreen, [ fsBold ]  );
  InitOneStyle( stylePinkBold,           clOMSPink, [ fsBold ]  );
end;

procedure FreeAndNilStyles;
begin
  FreeAndNil(styleDefault);
  FreeAndNil(styleDefaultBold);

  FreeAndNil(styleRed);
  FreeAndNil(styleOrange);
  FreeAndNil(styleYellow);
  FreeAndNil(styleGreen);
  FreeAndNil(styleSkyBlue);
  FreeAndNil(styleBlue);
  FreeAndNil(stylePurple);
  FreeAndNil(styleWhite);

  FreeAndNil(styleLightRed);
  FreeAndNil(styleLightOrange);
  FreeAndNil(styleLightYellow);
  FreeAndNil(styleLightGreen);
  FreeAndNil(styleLightSkyBlue);
  FreeAndNil(styleLightBlue);
  FreeAndNil(styleLightPurple);
  FreeAndNil(styleLightPink);
  FreeAndNil(styleLightGray);

  FreeAndNil(styleFontRed);
  FreeAndNil(styleFontOrange);
  FreeAndNil(styleFontYellow);
  FreeAndNil(styleFontGreen);
  FreeAndNil(styleFontSkyBlue);
  FreeAndNil(styleFontBlue);
  FreeAndNil(styleFontPurple);
  FreeAndNil(styleFontPink);

  FreeAndNil(styleOrangeFontRed);
  FreeAndNil(styleYellowFontRed);
  FreeAndNil(styleGreenFontRed);
  FreeAndNil(styleSkyBlueFontRed);
  FreeAndNil(styleBlueFontRed);
  FreeAndNil(stylePurpleFontRed);
  FreeAndNil(styleBlueGreenFontRed);
  FreeAndNil(stylePinkFontRed);

  FreeAndNil(styleRedBold);
  FreeAndNil(styleOrangeBold);
  FreeAndNil(styleYellowBold);
  FreeAndNil(styleGreenBold);
  FreeAndNil(styleSkyBlueBold);
  FreeAndNil(styleBlueBold);
  FreeAndNil(stylePurpleBold);
  FreeAndNil(styleBlueGreenBold);
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
      colnRed           : Result := clOMSRed;
      colnOrange        : Result := clOMSOrange;
      colnYellow        : Result := clOMSYellow;
      colnGreen         : Result := clOMSGreen;
      colnSkyBlue       : Result := clOMSSkyBlue;
      colnBlue          : Result := clOMSBlue;
      colnPurple        : Result := clOMSPurple;
      colnBlueGreen     : Result := clOMSBlueGreen;
      colnPink          : Result := clOMSPink;
    else Result := clWhite;
    end
  else  if colt = coltLight then
    case coln of
      colnDefault       : Result := clWhite;
      colnRed           : Result := clOMSLightRed;
      colnOrange        : Result := clOMSLightOrange;
      colnYellow        : Result := clOMSLightYellow;
      colnGreen         : Result := clOMSLightGreen;
      colnSkyBlue       : Result := clOMSLightSkyBlue;
      colnBlue          : Result := clOMSLightBlue;
      colnPurple        : Result := clOMSLightPurple;
      colnBlueGreen     : Result := clOMSLightBlueGreen;
      colnPink          : Result := clOMSLightPink;
    else Result := clWhite;
    end
  else Result := clWhite;
end;

function getOMSStyle(const coln: OMSColorName; const isBold : Boolean = False; const isError : Boolean = False ) : TcxStyle;
begin
  if isError
    then case coln of
      colnDefault:  Result := styleDefaultBold;
      colnRed:      Result := styleRedBold;
      colnOrange:   Result := styleOrangeBold;
      colnYellow:   Result := styleYellowBold;
      colnGreen:    Result := styleGreenBold;
      colnSkyBlue:  Result := styleSkyBlueBold;
      colnBlue:     Result := styleBlueBold;
      colnPurple:   Result := stylePurpleBold;
      colnBlueGreen:Result := styleBlueGreenBold;
      colnPink:     Result := stylePinkBold;
    end
  else if isBold
    then case coln of
      colnDefault:  Result := styleDefaultBold;
      colnRed:      Result := styleRedBold;
      colnOrange:   Result := styleOrangeBold;
      colnYellow:   Result := styleYellowBold;
      colnGreen:    Result := styleGreenBold;
      colnSkyBlue:  Result := styleSkyBlueBold;
      colnBlue:     Result := styleBlueBold;
      colnPurple:   Result := stylePurpleBold;
      colnBlueGreen:Result := styleBlueGreenBold;
      colnPink:     Result := stylePinkBold;
    end
    else case coln of
      colnDefault:  Result := styleDefault;
      colnRed:      Result := styleRed;
      colnOrange:   Result := styleOrange;
      colnYellow:   Result := styleYellow;
      colnGreen:    Result := styleGreen;
      colnSkyBlue:  Result := styleSkyBlue;
      colnBlue:     Result := styleBlue;
      colnPurple:   Result := stylePurple;
      colnBlueGreen:Result := styleBlueGreen;
      colnPink:     Result := stylePink;
    end;
end;

initialization
  InitializeStyles;

finalization
  FreeAndNilStyles;

end.
