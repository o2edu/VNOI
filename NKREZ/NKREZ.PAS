{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKREZ;
Uses Math;
Var
  n,res :LongInt;
  A,B,C,F :Array[1..10000] of LongInt;

  procedure Enter;
  var
   i :LongInt;
  begin
    ReadLn(n);
    for i:=1 to n do
      begin
        ReadLn(A[i],B[i]); C[i]:=B[i]-A[i];
      end;
    res:=0;
  end;

  procedure Swap(i,j:LongInt);
  var
    tmp :LongInt;
  begin
    tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
    tmp:=B[i]; B[i]:=B[j]; B[j]:=tmp;
    tmp:=C[i]; C[i]:=C[j]; C[j]:=tmp;
  end;

  procedure QSort(l,r :LongInt);
  var
    key,i,j :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; key:=A[(l+r) div 2];
    repeat
      while (A[i]<key) do Inc(i);
      while (A[j]>key) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then Swap(i,j);
          Inc(i); Dec(j);
        end;
    until (i>j);
    QSort(l,j); QSort(i,r);
  end;

  procedure Optimize;
  var
    i,j :LongInt;
  begin
    for i:=1 to n do
      begin
        F[i]:=C[i];
        for j:=1 to i-1 do
          if (A[i]>=B[j]) and (F[i]<F[j]+C[i]) then F[i]:=F[j]+C[i];
        res:=Max(res,F[i]);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  QSort(1,n); 
  Optimize; 
  Write(res);
  Close(Input); Close(Output);
End.