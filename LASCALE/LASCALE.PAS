{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LASCALE;
Const
  maxExpo =17;
Var
  resR,resL :ShortInt;
  FR,FL :Array[0..maxExpo] of ShortInt;

  procedure Enter;
  var
    m :LongInt;
    i :ShortInt;
  begin
    Read(m);
    FillChar(FR,SizeOf(FR),0); FL:=FR;
    i:=0;
    while (m>0) do
      begin
        FR[i]:=m mod 3; m:=m div 3; Inc(i);
      end;
  end;

  procedure Solve;
  var
    i :ShortInt;
  begin
    resR:=0; resL:=0;
    for i:=0 to maxExpo do
      case (FR[i]) of
        1: Inc(resR);
        2: begin
             Inc(resL); FL[i]:=1; Inc(FR[i+1]);
           end;
        3: Inc(FR[i+1]);
      end;
  end;
 
  procedure Escape;
  var
    i :ShortInt;
  begin
    Write(resL,' ');
    for i:=0 to maxExpo do
      if (FL[i]=1) then Write(Round(Exp(Ln(3)*i)),' ');
    WriteLn;
    Write(resR,' ');
    for i:=0 to maxExpo do
      if (FR[i]=1) then Write(Round(Exp(Ln(3)*i)),' ');
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Escape;
  Close(Input); Close(Output);
End.