{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program INSUL;
Var
  n,res :LongInt;
  A :Array[1..100000] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(n); res:=0;
    for i:=1 to n do
      begin
        ReadLn(A[i]); res:=res+A[i];
      end;
  end;

  procedure Swap(i,j :LongInt);
  var
    tmp :Integer;
  begin
    tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
  end;

  procedure QSort(l,r :LongInt);
  var
    i,j,k :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; k:=A[(l+r) div 2];
    repeat
      while (A[i]<k) do Inc(i);
      while (A[j]>k) do Dec(j);
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
    i,j :LongInt;
  begin
    i:=1; j:=n;
    while (i<j) do
      begin
        res:=res+A[j]-A[i];
        Inc(i); Dec(j);
      end;
  end; 

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  QSort(1,n);
  Greedy;
  Write(res);
  Close(Input); Close(Output);
End.