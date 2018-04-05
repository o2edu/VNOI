{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program COUNTCBG;
Var
  n,res :LongInt;

  procedure Solve;
  var
    i :LongInt;  
  begin
    res:=0;
    for i:=2 to Trunc(Sqrt(2*n)) do
      if (2*n mod i=0) then
        if ((i+2*n div i-1) mod 2=0) then Inc(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  while not EoF do
    begin
      ReadLn(n);
      Solve;
      WriteLn(res);
    end;
  Close(Input); Close(Output);
End.