{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program M3TILE;
Const
  maxT =100; 
  maxN =30;
Var
  t,n :ShortInt;
  Test :Array[1..maxT] of ShortInt;
  F :Array[0..maxN] of Int64;

  procedure Enter;
  begin
    t:=0; n:=0;
    repeat
      Inc(t); 
	  Read(Test[t]);
      if (n<Test[t]) then n:=Test[t];
    until (Test[t]=-1);
    Dec(t);
  end;

  procedure Optimize;
  var
    i :ShortInt;
  begin
    F[0]:=1; F[1]:=0; F[2]:=3;
    for i:=3 to n do
      if (i mod 2<>0) then F[i]:=0
      else
        F[i]:=4*F[i-2]-F[i-4];
  end;

  procedure Escape;
  var
    i :ShortInt;
  begin
    for i:=1 to t do WriteLn(F[Test[i]]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Escape;
  Close(Input); Close(Output);
End.