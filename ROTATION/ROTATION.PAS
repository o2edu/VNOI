{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program ROTATION;
Var
  n :Integer;
  C :Array[1..1000,1..1000] of Byte;

  procedure Enter;
  var     
    i,x,y :Integer;
  begin
    ReadLn(n);
    for i:=2 to n do ReadLn(x,y,C[x,y]);
  end;

  procedure Process;
  var     
    i :Integer;
    res :Byte;
  begin
    res:=0;
    for i:=2 to n do 
	  if (C[i-1,i]=1) then res:=1-res;
    Write(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Process;
  Close(Input); Close(Output);
End.