{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKNUMFRE;
Var
  a,b,count  :LongInt;

  function Divisor(x,y :LongInt):LongInt;
  var
    t :LongInt;
  begin
    while (y>0) do
      begin
        t:=x mod y; x:=y; y:=t;
      end;
    Divisor:=x;
  end;

  function Inve(i :LongInt) :LongInt;
  begin
    Inve:=0;
    while (i>0) do
      begin
        Inve:=Inve*10+(i mod 10);
        i:=i div 10;
      end;
  end;

  procedure Process;
  var
    i :LongInt;
  begin
    count:=0;
    for i:=a to b do
      if (Divisor(i,Inve(i))=1) then Inc(count);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  ReadLn(a,b); 
  Process; 
  Write(count);
  Close(Input); Close(Output);
End.