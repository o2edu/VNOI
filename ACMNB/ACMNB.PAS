{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program ACMNB;
Uses Math;
Const
  maxN =4*100000;
Type
  TData =Record u,v :LongInt end;
Var
  n,ans :LongInt;
  A :Array[1..2*maxN] of TData;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to 2*n do with (A[i]) do Read(u,v);
  end;

  procedure QSort(l,r :LongInt);
  var
    i,j :LongInt;
    Key,Tmp :TData;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; Key:=A[(l+r) div 2];
    repeat
      while (A[i].u-A[i].v<Key.u-Key.v) do Inc(i);
      while (A[j].u-A[j].v>Key.u-Key.v) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              Tmp:=A[i]; A[i]:=A[j]; A[j]:=Tmp;
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
    for i:=1 to n do Inc(ans,A[i].u);
    for i:=n+1 to 2*n do Inc(ans,A[i].v);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  QSort(1,2*n);
  Solve;
  Write(ans);
  Close(Input); Close(Output);
End.