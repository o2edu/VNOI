{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKCABLE;
Uses Math;
Const
  maxN =25000;
  maxValue =1000000;
Var
  n :Integer;
  A :Array[1..maxN] of LongInt;
  F :Array[1..maxN] of LongInt;

  procedure Enter;
  var
    i :Integer;
  begin
    Read(n);
    for i:=1 to n-1 do Read(A[i]);
  end;

  procedure Optimize;
  var
    i :Integer;
  begin
    F[1]:=0; F[2]:=A[1]; F[3]:=A[1]+A[2];
    for i:=4 to n do F[i]:=Min(F[i-1],F[i-2])+A[i-1];
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[n]);
  Close(Input); Close(Output);
End.