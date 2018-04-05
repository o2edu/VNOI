{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program PBCDIV;
Var
  t :LongInt;
  a,b :Int64;

  function Cal :Int64;
  var
    i,j,k :Int64;
  begin
    i:=(b div 12)-((a-1) div 12);
    j:=(b div 30)-((a-1) div 30);
    k:=(b div 60)-((a-1) div 60);
    Exit(i+j-2*k);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(t);
  while (t>0) do
    begin
      Dec(t);
      Read(a,b);
      WriteLn(Cal);
    end;
  Close(Input); Close(Output);
End.