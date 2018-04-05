{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program PARIGAME;
Const
  maxN =500;
Var
  t,n :SmallInt;
  D,C :Array[0..maxN,0..maxN] of Byte;
  F :Array[0..maxN,0..maxN] of Boolean;

procedure Enter;
var
  i,j :SmallInt;
  k :LongInt;
begin
  Read(n);
  for i:=1 to n do
    begin
      D[i,0]:=0; C[0,i]:=0;
    end;
  for i:=1 to n do
    for j:=1 to n do
      begin
        Read(k);
        k:=k mod 2;
        D[i,j]:=(D[i,j-1]+k) mod 2;
        C[j,i]:=(C[j,i-1]+k) mod 2;
      end;
end;

procedure Optimize;
var
  i,j :SmallInt;
begin
  for i:=1 to n do
    begin
      F[i,0]:=false; F[0,i]:=false;
    end;
  for i:=1 to n do
    for j:=1 to n do
      F[i,j]:=((not F[i-1,j]) and (D[i,j]=0)) or
              ((not F[i,j-1]) and (C[j,i]=0));
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(t);
  repeat
    Dec(t);
    Enter;
    Optimize;
    if (F[n,n]) then
      WriteLn('YES')
    else
      WriteLn('NO');
  until (t=0);
  Close(Input); Close(Output);
End.