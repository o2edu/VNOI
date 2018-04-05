{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKSGAME;
Type
  Table =Array[1..100001] of LongInt;
Var
  n :LongInt;
  A,B :Table;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(n);
    for i:=1 to n do Read(A[i]);
    for i:=1 to n do Read(B[i]);
  end;

  procedure QSort(var x :Table; l,r :LongInt);
  var
    i,j,k,tmp :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; k:=X[(l+r) div 2];
    repeat
      while (X[i]<k) do Inc(i);
      while (X[j]>k) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              tmp:=X[i]; X[i]:=X[j]; X[j]:=tmp;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    Sort(X,l,j); Sort(X,i,r);
  end;

  function Min :LongInt;
  var
    i,j,k :LongInt;
  begin
    Min:=High(LongInt);
    i:=1; j:=n;
    repeat
      k:=A[i]+B[j];
      if (k=0) then Exit(k);
      if (Min>Abs(k)) then Min:=Abs(k);
      if (k<0) then Inc(i) else Dec(j);
    until (i>n) or (j<1);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  QSort(A,1,n); 
  QSort(B,1,n); 
  Write(Min);
  Close(Input); Close(Output);
End.