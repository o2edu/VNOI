{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program CTNBULLS;
Const
  maxN =100000; base =2111992;
Var
  n,k :LongInt;
  F :Array[1..maxN] of LongInt;

procedure Optimize;
var
  i :LongInt;
begin
  for i:=1 to k+1 do F[i]:=(i+1) mod base;
  for i:=k+2 to n do
    F[i]:=((F[i-k-1] mod base)+(F[i-1] mod base)) mod base;
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(n,k);
  Optimize;
  Write(F[n]);
  Close(Input); Close(Output);
End.