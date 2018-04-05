{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program DHEXP;
Const
  maxN =100000;
Var
  n,k :LongInt;
  A :Array[1..maxN] of LongInt;
  res :Int64;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n,k);
    for i:=1 to n do Read(A[i]);
  end;

  procedure QSort(l,r :LongInt);
  var
    i,j,key,tmp :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; key:=A[(l+r) div 2];
    repeat
      while (A[i]>key) do Inc(i);
      while (A[j]<key) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    QSort(l,j); QSort(i,r);
  end;

  procedure Greedy;
  var
    i :LongInt;
  begin
    res:=A[1];
    for i:=2 to k+1 do Inc(res,A[i]);
    for i:=k+2 to n do Dec(res,A[i]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  QSort(2,n);
  Greedy;
  Write(res);
  Close(Input); Close(Output);
End.