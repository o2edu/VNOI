Program NKMAXSEQ;
Var
  p,n,k :LongInt;
  F :Array[0..50000] of LongInt;
  D :Array[0..50000] of Boolean;

procedure Enter;
var
  i,tg,min:LongInt;
begin
  Readln(n,p);
  Fillchar(F,SizeOf(F),0);
  Fillchar(D,SizeOf(D),false);
  min:=0; D[0]:=true;
  for i:=1 to n do
    begin
      Readln(tg);
      F[i]:=F[i-1]+tg;
      if (F[i]<min) then
        begin
          D[i]:=true; min:=F[i];
        end;
    end;
end;

procedure Optimize;
var
  i,pos :LongInt;
begin
  k:=-1; pos:=n;
  for i:=n downto 0 do
    if (D[i]) then
      while (pos>i) do
        begin
          if (F[pos]-F[i]>=p) then
            begin
              if (pos-i>k) then k:=pos-i;
              Break;
            end;
          Dec(pos);
        end;
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Write(k);
  Close(Input); Close(Output);
End.
