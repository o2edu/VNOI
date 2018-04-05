Program BCDIV;
Const
  MaxN =25;
Var
  F :Array[0..25,0..25] of Int64;

procedure Optimize;
var
  i,j :Byte;
begin
  F[0,0]:=1;
  for i:=1 to MaxN do
    for j:=1 to MaxN do
      F[i,j]:=F[i-1,j-1]+F[i-1,j]*j;
end;

procedure Quit;
var
  i,n,k,t :Byte;
begin
  ReadLn(t);
  for i:=1 to t do
    begin
      ReadLn(n,k); WriteLn(F[n,k]);
    end;
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Optimize; 
  Quit;
  Close(Input); Close(Output);
End.
