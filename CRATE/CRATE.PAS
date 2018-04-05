{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program CRATE;
Uses Math;
Const
  maxN =300000;
  maxV =100000;
Type
  TData =Record id,x,y :LongInt end;
Var
  n :LongInt;
  A :Array[1..maxN] of TData;
  Ans :Array[1..maxN] of LongInt;
  BIT :Array[1..maxV] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do
      with (A[i]) do
        begin
          Read(x,y); id:=i;
        end;
    A[0].x:=0; A[0].y:=0; A[0].id:=0;
  end;

  function Compare(U,V :TData) :Boolean;
  begin
    Exit((U.x<V.x) or ((U.x=V.x) and (U.y<V.y)));
  end;

  procedure QSort(l,r :LongInt);
  var
    i,j :LongInt;
    Key,Tmp :TData;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; Key:=A[(l+r) div 2];
    repeat
      while (Compare(A[i],Key)) do Inc(i);
      while (Compare(Key,A[j])) do Dec(j);
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

  procedure UpdateBIT(i :LongInt);
  begin
    while (i<=maxV) do
      begin
        Inc(BIT[i]);
        Inc(i,i and (-i));
      end;
  end;

  function SearchBIT(i :LongInt) :LongInt;
  var
    res :LongInt;
  begin
    res:=0;
    while (i>0) do
      begin
        Inc(res,BIT[i]);
        Dec(i,i and (-i));
      end;
    Exit(res);
  end;

  procedure SolveBIT;
  var
    i,j,k :LongInt;
  begin
    FillChar(BIT,SizeOf(BIT),0);
    i:=1;
    repeat
      j:=i;
      while (j<n) and (A[j+1].x=A[i].x) and (A[j+1].y=A[i].y) do Inc(j);
      Ans[A[i].id]:=SearchBIT(A[i].y);
      for k:=i+1 to j do Ans[A[k].id]:=Ans[A[i].id];
      for k:=i to j do UpdateBIT(A[k].y);
      i:=j+1;
    until (i>n);
  end;

  procedure PrintResult;
  var
    i :LongInt;
  begin
    for i:=1 to n do WriteLn(Ans[i]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  QSort(1,n);
  SolveBIT;
  PrintResult;
  Close(Input); Close(Output);
End.