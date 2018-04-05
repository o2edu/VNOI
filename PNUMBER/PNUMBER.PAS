{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program PNUMBER;
Var
  a,b :LongInt;
  Free :Array[1..200000] of Boolean;
 
  procedure Eratosthenes;
  var
    i,j :LongInt;
  begin
    FillChar(Free,SizeOf(Free),true); Free[1]:=false;
    for i:=2 to Trunc(Sqrt(b)) do
      if (Free[i]) then
        begin
          j:=Sqr(i);
          while (j<=b) do
            begin
              Free[j]:=false;
              Inc(j,i);
            end;
        end;
  end;
 
  procedure Escape;
  var
    i :LongInt;
  begin
    for i:=a to b do 
      if (Free[i]) then WriteLn(i);
  end;
 
Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  ReadLn(a,b);
  Eratosthenes;
  Escape;
  Close(Input); Close(Output);
End.