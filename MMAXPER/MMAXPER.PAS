Program MMAXPER;
Uses Math;
Const
  maxN =1000;
Var
  n :Integer;
  f1,g1  :LongInt;
  A,B :Array[1..maxN] of Integer;

procedure Enter;
var
  i :Integer;
begin
  Readln(n);
  for i:=1 to n do Readln(A[i],B[i]);
end;

procedure Optimize;
var
  i :Integer;
  fTmp :LongInt;
begin
  f1:=A[1]; g1:=B[1]; fTmp:=f1;
  for i:=2 to n do
    begin
      f1:=Max(f1+Abs(B[i]-B[i-1]),g1+Abs(B[i]-A[i-1]))+A[i];
      g1:=Max(g1+Abs(A[i]-A[i-1]),fTmp+Abs(A[i]-B[i-1]))+B[i];
      fTmp:=f1;
    end;
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(Max(f1,g1));
  Close(Input); Close(Output);
End.
