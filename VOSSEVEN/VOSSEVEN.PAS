{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VOSSEVEN;
Uses Math;
Var
  m :LongInt;
  Ct :Array[1..1000000] of LongInt;

  procedure Process(T :AnsiString);
  var     
    i,n :LongInt;
  begin
    if (T='') then Exit;
    n:=Length(T); 
    m:=Max(m,n);
    for i:=1 to n do Ct[i]:=Ct[i]+(n-i+1);
  end;

  procedure Enter;
  var     
    ch :Char;
    S :AnsiString;
  begin
    FillChar(Ct,SizeOf(Ct),0);
    S:=''; m:=0;
    while not EoF do
      begin
        while not EoLn do
          begin
            Read(ch);
            if (ch<>'7') then
              begin
                Process(S); S:='';
              end
            else S:=S+ch;
          end;
        ReadLn;
      end;
    Process(S);
  end;

  procedure Escape;
  var     
    i :LongInt;
  begin
    for i:=1 to m do WriteLn(i,' ',Ct[i]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Escape;
  Close(Input); Close(Output);
End.