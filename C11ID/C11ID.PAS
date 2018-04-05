{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program C11ID;
Const
  maxN =100000;
Var
  n :LongInt;
  ans :Int64;
  A :Array[1..maxN] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  procedure QSort(l,r :LongInt);
  var
    i,j,key,tmp :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; key:=A[(l+r) div 2];
    repeat
      while (A[i]<key) do Inc(i);
      while (A[j]>key) do Dec(j);
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

  procedure Solve;
  var
    i :LongInt;
  begin
    ans:=0;
    for i:=1 to n do Inc(ans,A[i]-i+1);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  QSort(1,n);
  Solve;
  Write(ans);
  Close(Input); Close(Output);
End.