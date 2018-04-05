{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NOIXICH;
Var
  n,m :Integer;
  A :Array[1..20000] of Integer;

  procedure Enter;
  var
    i :Integer;
  begin
    ReadLn(n); i:=0;
    while not EoF do
      while not EoLn do
        begin
          Inc(i); Read(A[i]);
        end;
  end;

  procedure Swap(i,j :Integer);
  var
    tmp :Integer;
  begin
    tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
  end;

  procedure QSort(l,r :Integer);
  var
    i,j,k :Integer;
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

  procedure Solve;
  var
   i :Integer;
  begin
    i:=1; m:=0;
    while (n>1) do
      begin
        if (A[i]>n-1) then Break;
		Dec(n,A[i]+1);
        Inc(m,A[i]);
        Inc(i);
      end;
    Inc(m,n-1);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  QSort(1,n); 
  Solve; 
  Write(m);
  Close(Input); Close(Output);
End.