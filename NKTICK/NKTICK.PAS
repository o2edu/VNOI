{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKTICK;
Uses Math;
Var
  n :LongInt;
  F,T,R :Array[1..60000] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(n);
    for i:=1 to n do Read(T[i]);
    for i:=1 to n-1 do Read(R[i]);
    Fillchar(F,SizeOf(F),0);
  end;

  procedure Optimize;
  var
    i :LongInt;
  begin
    F[1]:=T[1];
    for i:=2 to n do F[i]:=Min(F[i-2]+R[i-1],F[i-1]+T[i]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Write(F[n]);
  Close(Input); Close(Output);
End.