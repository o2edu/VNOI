{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program AUCTION;
Var
  A :Array[1..2000] of Int64;
  n,m :Integer;

  procedure Enter;
  var
    i :Integer;
  begin
    ReadLn(n,m);
    if (n>m) then n:=m;
    for i:=1 to m do ReadLn(A[i]);
  end;

  procedure QSort(l,r :Integer);
  var
    i,j,k,tmp :Int64;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; k:=A[(l+r) div 2];
    repeat
      while (A[i]>k) do Inc(i);
      while (A[j]<k) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
	          tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
	        end;
          Inc(i); Dec(j);
       end;
    until (i>j);
    Sort(l,j); Sort(i,r);
  end;

  procedure Greedy;
  var
    sum,res :Int64;
    i :Integer;
  begin
    sum:=0; res:=0;
    for i:=1 to n do
      if (sum<A[i]*i) then
        begin
	      res:=A[i]; sum:=A[i]*i;
        end;
    Write(res,' ',sum);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  QSort(1,m); 
  Greedy;
  Close(Input); Close(Output);
End.