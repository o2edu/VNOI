Program NKSEQ;
Uses Math;
Const
  maxN =100000; 
  maxValue =1000000001;
Var
  n,res :LongInt;
  A,F :Array[1..maxN+1] of LongInt;

procedure Enter;
var
  i :LongInt;
begin
  Read(n);
  for i:=1 to n do Read(A[i]);
end;

procedure Init;
var
  s,i :LongInt;
begin
  s:=0; F[n+1]:=maxValue;
  for i:=1 to n do
    begin
      Inc(s,A[i]); F[n+1]:=Min(F[n+1],s);
    end;
  if (s<=0) then
    begin
      Write(0); Close(Output); Halt;
    end;
end;

procedure Optimize;
var
  i :LongInt;
begin
  res:=0;
  for i:=n downto 2 do
    begin
      F[i]:=Min(F[i+1]+A[i],A[i]);
      if (F[i]>0) then Inc(res);
    end;
  if (F[n+1]>0) then Inc(res);
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Init;
  Optimize;
  Write(res);
  Close(Input); Close(Output);
End.