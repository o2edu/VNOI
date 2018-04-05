{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program CBUYING;
Var
  b :QWord;
  n :LongInt;
  P,C :Array[1..100000] of QWord;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(n,b); i:=1;
    while (i<=n) do
      begin
        ReadLn(P[i],C[i]); Inc(i);
      end;
  end;

  procedure Swap(i,j :LongInt);
  var
    tmp :QWord;
  begin
    tmp:=P[i]; P[i]:=P[j]; P[j]:=tmp;
    tmp:=C[i]; C[i]:=C[j]; C[j]:=tmp;
  end;

  procedure QSort(l,r :LongInt);
  var
    i,j :Longint;
    k :QWord;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; k:=P[(l+r) div 2];
    repeat
      while (P[i]<k) do Inc(i);
      while (P[j]>k) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then Swap(i,j);
          Inc(i); Dec(j);
        end;
    until (i>j);
    QSort(l,j); QSort(i,r);
  end;

  procedure Greedy;
  var
    i :LongInt;
    j,count :QWord;
  begin
    i:=1; count:=0;
    for i:=1 to n do
      if (b div P[i]>=C[i]) then
        begin
          Dec(b,P[i]*C[i]); Inc(count,C[i]);
        end
      else
        begin
          Inc(count,b div P[i]); Break;
        end;
    Write(count);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  QSort(1,n); 
  Greedy;
  Close(Input); Close(Output);
End.