{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program KMBUS;
Uses Math;
Const
  maxN =100;
  maxM =10000;
  maxValue =1000000;
Var
  n :Byte;
  m :Integer;
  A :Array[1..maxN] of Byte;
  F :Array[0..maxM] of LongInt;

  procedure Enter;
  var
   i :Byte;
  begin
    Read(n,m);
    for i:=1 to n do Read(A[i]);
  end;

  procedure Optimize;
  var
    i :Integer;
    j :Byte;
  begin
    F[0]:=0;
    for i:=1 to m do
      begin
        F[i]:=maxValue;
        for j:=1 to Min(i,n) do
          F[i]:=Min(F[i],F[i-j]+A[j]);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[m]);
  Close(Input); Close(Output);
End.