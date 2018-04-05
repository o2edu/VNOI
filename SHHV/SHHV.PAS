{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program SHHV;
Const
  maxN =12;
Var
  n :ShortInt;
  A,B :Array[1..maxN] of ShortInt;
  F :Array[1..maxN] of LongInt;
  p,res :LongInt;

procedure Enter;
begin
  while not SeekEoln do
    begin
      Inc(n); Read(A[n]);
    end;
  Read(p);
end;

function Get(i :ShortInt) :ShortInt;
var
  j :ShortInt;
begin
  for j:=1 to n do
    if (B[j]=i) then Exit(j);
end;

procedure Remove(i :ShortInt);
var
  j :ShortInt;
begin
  for j:=i to n do B[j]:=B[j+1];
end;

procedure Optimize;
var
  i,loc :ShortInt;
begin
  res:=1; F[0]:=1;
  for i:=1 to n do F[i]:=F[i-1]*i;
  for i:=1 to n do B[i]:=i;
  for i:=1 to n do
    begin
      loc:=Get(A[i]);
      Inc(res,F[n-i]*(loc-1));
      Remove(loc);
    end;
  for i:=1 to n do B[i]:=i;
  for i:=1 to n do
    begin
      loc:=(p-1) div F[n-i]+1;
      A[i]:=B[loc];
      Dec(p,F[n-i]*(loc-1));
      Remove(loc);
    end;
end;

procedure Escape;
var
  i :ShortInt;
begin
  Writeln(res);
  for i:=1 to n do Write(A[i],' ');
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Escape;
  Close(Input); Close(Output);
End.
