{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NUMCON;
Type
  Note =Record va :String[100]; lo :Byte; end;
Var
  n,m :Byte;
  A :Array[1..101] of Note;

  procedure Enter;
  begin
    n:=0; m:=0;
    while not EoF do
      begin
        Inc(n); 
		ReadLn(A[n].va);
        A[n].lo:=Length(A[n].va);
        if (m<A[n].lo) then m:=A[n].lo;
      end;
  end;

 procedure Init;
 var
   i :Byte;
  begin
    for i:=1 to n do
      while (Length(A[i].va)<m) do
        A[i].va:=A[i].va+A[i].va[1];
  end;

  procedure QSort(l,r :Byte);
  var
    i,j :Byte;
    k :String[100];
    tmp :Note;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; k:=A[(l+r) div 2].va;
    repeat
      while (A[i].va>k) do Inc(i);
      while (A[j].va<k) do Dec(j);
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
    i :Byte;
  begin
    for i:=1 to n do Write(Copy(A[i].va,1,A[i].lo));
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Init;
  QSort(1,n);
  Greedy;
  Close(Input); Close(Output);
End.