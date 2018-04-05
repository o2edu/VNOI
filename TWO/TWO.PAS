{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program TWO;
Uses Math;
Const
  maxN =10000;
Var
  n,first,last :SmallInt;
  A :Array[1..2,1..maxN] of SmallInt;
  F :Array[1..maxN] of SmallInt;

  procedure Enter;
  var
    i :SmallInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[1,i]);
    for i:=1 to n do Read(A[2,i]);
  end;

  procedure QSort(l,r :SmallInt; k :Byte);
  var
    i,j,key,tmp :SmallInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; key:=(l+r) div 2;
    repeat
      while (A[k,F[i]]<A[k,F[key]]) do Inc(i);
      while (A[k,F[j]]>A[k,F[key]]) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              tmp:=F[i]; F[i]:=F[j]; F[j]:=Tmp;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    QSort(l,j,k); QSort(i,r,k);
  end;

  procedure Johnson;
  var
    i :SmallInt;
    t1,t2 :LongInt;
  begin
    first:=0; last:=n+1;
    for i:=1 to n do
      if (A[1,i]<=A[2,i]) then
        begin
          Inc(first); F[first]:=i;
        end
      else
        begin
          Dec(last); F[last]:=i;
        end;
    QSort(1,first,1); QSort(last,n,2);
  end;

  procedure Escape;
  var
    t1,t2 :LongInt;
    i :SmallInt;
  begin
    t1:=0; t2:=0;
    for i:=1 to first do
      begin
        Inc(t1,A[1,F[i]]);
        t2:=Max(t1,t2)+A[2,F[i]];
      end;
    for i:=n downto last do
      begin
        Inc(t1,A[1,F[i]]);
        t2:=Max(t1,t2)+A[2,F[i]];
      end;
    WriteLn(t2);
    for i:=1 to first do Write(F[i],' ');
    for i:=n downto last do Write(F[i],' ');
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Johnson;
  Escape;
  Close(Input); Close(Output);
End.