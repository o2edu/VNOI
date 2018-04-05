{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NOTE;
Var
  f :ShortInt;
  p :LongInt;

function Find(i :ShortInt; j :LongInt) :Boolean;
var
  k :LongInt;
begin
  k:=Round(Exp(Ln(2)*(i-1)));
  if (j=k) then Exit(false);
  if (j>k) then
    Exit(Find(i-1,j-k))
  else
    Exit(not Find(i-1,k-j));
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  repeat
    Read(f,p);
    if (f=0) and (p=0) then Break;
    if (Find(f,p)) then WriteLn('U') else WriteLn('D');
  until (f=0) and (p=0);
  Close(Input); Close(Output);
End.