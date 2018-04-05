{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program PTRANG;
Uses Math;
Var
  n,l :Integer;
  f,s :Array[0..6000] of LongInt;

  procedure Enter;
  var     
    i,j :Integer;
  begin
    ReadLn(n,l);
    FillChar(F,SizeOf(F),0);
    for i:=1 to n do
      begin
        Readln(j);
        S[i]:=S[i-1]+j;
        F[i]:=maxInt;
      end;
  end;

  procedure Optimize;
  var     
    i,j :Integer;
  begin
    for i:=1 to n do
      for j:=0 to i-1 do
        if (S[i]-S[j]<=l) then
          F[i]:=Min(F[i],Max(F[j],l-S[i]+S[j]));
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Write(F[n]);
  Close(Input); Close(Output);
End.