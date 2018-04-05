Program NKBUS;
Uses Math;
Var
  n,m,p :LongInt;
  A,F :Array[1..250000] of LongInt;

procedure Sort(l,h :LongInt);
var
  i,j,tmp,k :LongInt;
begin
  if (l>=h) then Exit;
  i:=l; j:=h; k:=a[(l+h) div 2];
  repeat
    while (A[i]<k) do Inc(i);
    while (A[j]>k) do Dec(j);
    if (i<=j) then
      begin
        if (i<j) then
          begin
            tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
          end;
        Inc(i); Dec(j);
      end;
  until (i>j);
  Sort(l,j); Sort(i,h);
end;

procedure Enter;
var
  i,j,k,x :LongInt;
begin
  ReadLn(n,m);
  p:=0; F[1]:=0;
  for i:=2 to n+1 do
    begin
      Read(x,k);
      F[i]:=F[i-1]+x;
      for j:=p+1 to p+k do
        begin
          Read(x); A[j]:=Max(0,x-F[i-1]);
        end;
      Inc(p,k);
      ReadLn;
    end;
  Sort(1,p);
  Write(F[n+1]+A[m]);
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Close(Input); Close(Output);
End.
