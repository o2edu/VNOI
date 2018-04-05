{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VSTEPS;
Var
  n :LongInt;
  F :Array[1..100000] of LongInt;
  Free :Array[1..100000] of Boolean;

  procedure Enter;
  var     
    i,j,k :LongInt;
  begin
    ReadLn(n,k);
    FillChar(Free,SizeOf(Free),false);
    for i:=1 to k do
      begin 
	    Read(j); Free[j]:=true; 
	  end;
    FillChar(F,SizeOf(F),0);
  end;

  procedure Optimize;
  var     
    i :LongInt;
  begin
    if not(Free[n]) then F[n]:=1 else Exit;
    for i:=n-1 downto 1 do
      if (Free[i]) then F[i]:=0
      else 
	    F[i]:=(F[i+1]+F[i+2]) mod 14062008;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Write(F[1]);
  Close(Input); Close(Output);
End.