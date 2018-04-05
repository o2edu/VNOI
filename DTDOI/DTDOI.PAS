{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program DTDOI;
Uses Math;
Const
  maxN =100;
  maxValue =1000000000;
Var
  n,s,m,res :LongInt;
  A :Array[1..maxN] of LongInt;
  F :Array[1..1000000] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n,s); m:=0;
    for i:=1 to n do
      begin
        Read(A[i]);
        m:=Max(m,A[i]);
      end;
  end;

  procedure Greedy;
  begin
    res:=0;
    while (s>1000000) do
      begin
        Inc(res); Dec(s,m);
      end;
  end;

  procedure Optimize;
  var
    i,j :LongInt;
  begin
    F[0]:=0;
    for i:=1 to s do
      begin
        F[i]:=maxValue;
        for j:=1 to n do
          if (i>=A[j]) and ((F[i]>F[i-A[j]]+1)) then F[i]:=F[i-A[j]]+1;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Greedy;
  Optimize;
  Write(F[s]+res);
  Close(Input); Close(Output);
End.