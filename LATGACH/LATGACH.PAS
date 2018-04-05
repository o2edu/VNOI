{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LATGACH;
Const
  maxT =100; 
  maxN =100; 
  zero =48;
Var
  t,n :ShortInt;
  Test :Array[1..maxT] of ShortInt;
  F :Array[1..maxN] of String;

  procedure Enter;
  var
    i :ShortInt;
  begin
    Read(t); n:=0;
    for i:=1 to t do
      begin
        Read(Test[i]);
        if (n<Test[i]) then n:=Test[i];
      end;
  end;

  function Add(X,Y :String) :String;
  var
    S :String;
    carry,sum,i :Byte;
  begin
    while (Length(X)<Length(Y)) do X:='0'+X;
    while (Length(Y)<Length(X)) do Y:='0'+Y;
    S:=''; carry:=0;
    for i:=Length(X) downto 1 do
      begin
        sum:=(Ord(X[i])-zero)+(Ord(Y[i])-zero)+carry;
        carry:=sum div 10;
        S:=Chr(sum mod 10+zero)+S;
      end;
    if (carry>0) then S:='1'+S;
    Add:=S;
  end;

  procedure Optimize;
  var
    i :ShortInt;
  begin
    F[1]:='1'; F[2]:='2';
    for i:=3 to n do F[i]:=Add(F[i-1],F[i-2]);
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