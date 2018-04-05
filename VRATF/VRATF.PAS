{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VRATF;
Var
  n :LongInt;
  k :Integer;
  
  function Divide(x :LongInt) :LongInt;
  begin
    if ((x-k) mod 2=0) and (x>k) then
      Divide:=Divide((x-k) div 2)+Divide((x+k) div 2)
    else
      Divide:=1;
  end;

Begin
  Assign(input,''); Reset(input);
  Assign(output,''); Rewrite(output);
  ReadLn(n,k); 
  Write(Divide(n));
  Close(input); Close(output);
End.