{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program ETF;
Const
  maxM =100;
Var
  t :SmallInt;
  n,res :LongInt;

  procedure Solve;
  var
    i :SmallInt;
  begin
    res:=n;
    for i:=2 to Trunc(Sqrt(n)) do
      if (n mod i=0) then
        begin
          while (n mod i=0) do n:=n div i;
          Dec(res,res div i);
        end;
    if (n>1) then Dec(res,res div n);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(t);
  while (t>0) do
    begin
      Dec(t);
      Read(n);
      Solve;
      WriteLn(res);
    end;
  Close(Input); Close(Output);
End.