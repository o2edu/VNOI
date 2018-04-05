{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MYSTERY;
Const
  base =20122007;
Var
  a :LongInt;
  res :Int64;

  function Power(i :Int64) :Int64;
  var
    tmp :Int64;
  begin
    if (i=1) then Exit(3);
    tmp:=Power(i div 2);
    tmp:=tmp*tmp mod base;
    if (i mod 2=1) then tmp:=3*tmp mod base;
    Exit(tmp);
  end;

  procedure Solve;
  var
    i :LongInt;
  begin
    res:=1;
    for i:=1 to Trunc(Sqrt(a)) do
      if (a mod i=0) then
        begin
          res:=res*(Power(i)-1) mod base;
          if (i*i<>a) then
            res:=res*(Power(a div i)-1) mod base;
        end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(a);
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.