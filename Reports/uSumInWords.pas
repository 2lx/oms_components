unit uSumInWords;

interface

function SumInWordsLanguage( const Sum: Real; const valutaID: Integer; const TransType : Integer ): WideString;

implementation

uses uUserSettings, SysUtils;

function RusGetSumInWords(Value: int64; LangID: Integer ): string;
var
  Rend: boolean;
  ValueTemp : int64;

  procedure Num(Value: byte);
  begin
    if ( LangID = 1 ) then
    begin
      case Value of
        1: if ( Rend = true )
            then Result := Result + '���� '
            else Result := Result + '���� ';
        2: if Rend = true then Result := Result + '��� ' else Result := Result + '��� ';
        3: Result := Result + '��� ';
        4: Result := Result + '������ ';
        5: Result := Result + '���� ';
        6: Result := Result + '����� ';
        7: Result := Result + '���� ';
        8: Result := Result + '������ ';
        9: Result := Result + '������ ';
        10: Result := Result + '������ ';
        11: Result := Result + '����������� ';
        12: Result := Result + '���������� ';
        13: Result := Result + '���������� ';
        14: Result := Result + '������������ ';
        15: Result := Result + '���������� ';
        16: Result := Result + '����������� ';
        17: Result := Result + '���������� ';
        18: Result := Result + '������������ ';
        19: Result := Result + '������������ ';
      end
    end;

    if ( LangID = 2 ) then
    begin
      case Value of
        1: Result := Result + 'one ';
        2: Result := Result + 'two ';
        3: Result := Result + 'three ';
        4: Result := Result + 'four ';
        5: Result := Result + 'five ';
        6: Result := Result + 'six ';
        7: Result := Result + 'seven ';
        8: Result := Result + 'eight ';
        9: Result := Result + 'nine ';
        10: Result := Result + 'ten ';
        11: Result := Result + 'eleven ';
        12: Result := Result + 'twelve ';
        13: Result := Result + 'thirteen ';
        14: Result := Result + 'fourteen ';
        15: Result := Result + 'fifteen ';
        16: Result := Result + 'sixteen ';
        17: Result := Result + 'seventeen ';
        18: Result := Result + 'eighteen ';
        19: Result := Result + 'nineteen ';
      end
    end;

  end;

  procedure Num10(Value: byte);
  begin
    if ( LangID = 1 ) then
    begin
      case Value of
        2: Result := Result + '�������� ';
        3: Result := Result + '�������� ';
        4: Result := Result + '����� ';
        5: Result := Result + '��������� ';
        6: Result := Result + '���������� ';
        7: Result := Result + '��������� ';
        8: Result := Result + '����������� ';
        9: Result := Result + '��������� ';
      end
    end;

    if ( LangID = 2 ) then
    begin
      case Value of
        2: Result := Result + 'twenty ';
        3: Result := Result + 'thirty ';
        4: Result := Result + 'forty ';
        5: Result := Result + 'fifty ';
        6: Result := Result + 'sixty ';
        7: Result := Result + 'seventy ';
        8: Result := Result + 'eighty ';
        9: Result := Result + 'ninety ';
      end
    end;
  end;

  procedure Num100(Value: byte);
  begin
    if ( LangID = 1 ) then
    begin
      case Value of
        1: Result := Result + '��� ';
        2: Result := Result + '������ ';
        3: Result := Result + '������ ';
        4: Result := Result + '��������� ';
        5: Result := Result + '������� ';
        6: Result := Result + '�������� ';
        7: Result := Result + '������� ';
        8: Result := Result + '��������� ';
        9: Result := Result + '��������� ';
      end
    end;

    if ( LangID = 2 ) then
    begin
      case Value of
        1: Result := Result + 'one hundred ';
        2: Result := Result + 'two hundred ';
        3: Result := Result + 'three hundred ';
        4: Result := Result + 'four hundred ';
        5: Result := Result + 'five hundred ';
        6: Result := Result + 'six hundred ';
        7: Result := Result + 'seven hundred ';
        8: Result := Result + 'eight hundred ';
        9: Result := Result + 'nine hundred ';
      end
    end;

  end;

  procedure Num00;
  begin
    Num100(ValueTemp div 100);
    ValueTemp := ValueTemp mod 100;
    if ValueTemp < 20 then Num(ValueTemp)
    else
    begin
      Num10(ValueTemp div 10);
      ValueTemp := ValueTemp mod 10;
      Num(ValueTemp);
    end;
  end;

  procedure NumMult(Mult: int64; s1, s2, s3: string);
  var ValueRes: int64;
  begin
    if Value >= Mult then
    begin
      ValueTemp := Value div Mult;
      ValueRes := ValueTemp;
      Num00;
      if ValueTemp = 1 then Result := Result + s1
      else if (ValueTemp > 1) and (ValueTemp < 5) then Result := Result + s2
      else Result := Result + s3;
      Value := Value - Mult * ValueRes;
    end;
  end;

begin
  if ( LangID = 1 ) then
  begin
    if (Value = 0) then Result := '����'
    else
    begin
      Result := '';
      Rend := true;
      NumMult( 1000000000000, '�������� ', '��������� ', '���������� ' );
      NumMult( 1000000000, '�������� ', '��������� ', '���������� ' );
      NumMult( 1000000, '������� ', '�������� ', '��������� ' );
      Rend := false;
      NumMult( 1000, '������ ', '������ ', '����� ' );
      Rend := true;
      ValueTemp := Value;
      Num00;
    end;
  end;

  if ( LangID = 2 ) then
  begin
    if (Value = 0) then Result := 'zero'
    else
    begin
      Result := '';
      Rend := true;
      NumMult( 1000000000000, 'trillion ', 'trillion ', 'trillion ' );
      NumMult( 1000000000, 'billion ', 'billion ', 'billion ' );
      NumMult( 1000000, 'million ', 'million ', 'million ' );
      Rend := false;
      NumMult( 1000, 'thousand ', 'thousand ', 'thousand ' );
      Rend := true;
      ValueTemp := Value;
      Num00;
    end;
  end;
end;

procedure RusSeparateToStrings(S: string; Var  S1: string; Var  S2: string; Var  S3: string);
var
  pos: integer;
begin
  S1 := '';
  S2 := '';
  S3 := '';

  pos := 1;

  while ((pos <= Length(S))and(S[pos] <> ';'))do
  begin
    S1 := S1 + S[pos];
    inc(pos);
  end;
  inc(pos);

  while ((pos <= Length(S))and(S[pos] <> ';'))do
  begin
    S2 := S2 + S[pos];
    inc(pos);
  end;
  inc(pos);

  while ((pos <= Length(S))and(S[pos] <> ';'))do
  begin
    S3 := S3 + S[pos];
    inc(pos);
  end;
end;

function RusCalcInRubles(Value: int64; Skl: string): string;
var
  hk10, hk20: integer;
  Skl1,Skl2,Skl3: string;
begin
  RusSeparateToStrings(Skl,Skl1,Skl2,Skl3);
  hk10 := Value mod 10;
  hk20 := Value mod 100;
  if (hk20 > 10) and (hk20 < 20) then result := result + Skl3
  else if (hk10 = 1) then result := result + Skl1
  else if (hk10 > 1) and (hk10 < 5) then result := result + Skl2
  else result := result + Skl3;
end;

function RusCalcInKopecks(Value: integer; Skp: string): string;
var
  hk10, hk20: integer;
  Skp1,Skp2,Skp3: string;
begin
  RusSeparateToStrings(Skp,Skp1,Skp2,Skp3);
  hk10 := Value mod 10;
  hk20 := Value mod 100;
  if (hk20 > 10) and (hk20 < 20) then result := result + Skp3
  else if (hk10 = 1) then result := result + Skp1
  else if (hk10 > 1) and (hk10 < 5) then result := result + Skp2
  else result := result + Skp3;
end;

function SumInWordsLanguage( const Sum: Real;
    const valutaID: Integer; const TransType : Integer ) : WideString;
var
  strValNames, strCentNames: WideString;
  langId : Integer;
begin
  if TransType = 1
    then langId := 1
    else langId := 2;

  if ( langID = 1 ) then
  begin
    if ( valutaID = 0 ) then
    begin
      strValNames := ';;';
      strCentNames := ';;';
    end
    else if ( valutaID = 643 ) then
    begin
      strValNames := '�����;�����;������';
      strCentNames := '�������;�������;������';
    end
    else if ( valutaID = 840 ) then
    begin
      strValNames := '������ ���;������� ���;�������� ���';
      strCentNames := '����;�����;������';
    end
    else if ( valutaID = 156 ) then
    begin
      strValNames := '����;����;�����';
      strCentNames := '����;����;�����';
    end;
  end;

  if ( langID = 2 ) then
  begin
    if ( valutaID = 643 ) then
    begin
      strValNames := 'ruble;rubles;rubles';
      strCentNames := 'kopek;kopeks;kopeks';
    end
    else if ( valutaID = 840 ) then
    begin
      strValNames := 'dollar USA;dollars USA;dollars USA';
      strCentNames := 'cent;cents;cents';
    end
    else if ( valutaID = 156 ) then
    begin
      strValNames := 'yuan;yuans;yuans';
      strCentNames := 'fen;fens;fens';
    end;
  end;

  Result :=
      RusGetSumInWords( Trunc( Sum ), langId ) + //' ' +
      RusCalcInRubles( Trunc( Sum ), strValNames ) + ' ' +
    //  RusGetSumInWords( Trunc( ( Sum - Trunc( Sum ) ) * 100 ), langId ) + ' ' +
      Format( '%.2d', [ Round( ( Sum - Trunc( Sum ) ) * 100 ) ] ) + ' ' +
      RusCalcInKopecks( Round( ( Sum - Trunc( Sum ) ) * 100 ), strCentNames );

  Result := WideUpperCase( Copy( Result, 1, 1 ) ) + Copy( Result, 2, Length( Result ) );
end;

end.

