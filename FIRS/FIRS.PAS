{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program FIRS;
Type
  Note =Record id,va :LongInt end;
Var
  n,res :LongInt;
  A :Array[0..100001] of Note;
  Free :Array[0..100001] of Boolean;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(n);
    for i:=1 to n do
      begin
        A[i].id:=i; Read(A[i].va);
      end;
  end;

  procedure QSort(l,r :LongInt);
  var
    i,j :LongInt;
    Key,Tmp :Note;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; Key:=A[(l+r) div 2];
    repeat
      while (A[i].va<Key.va) do Inc(i);
      while (A[j].va>Key.va) do Dec(j);
      if (i<=j) then
        begin
          if (A[i].va<>A[j].va) then
            begin
              Tmp:=A[i]; A[i]:=A[j]; A[j]:=Tmp;
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
    FillChar(Free,SizeOf(Free),true);
    Free[0]:=false; Free[n+1]:=false;
    res:=0;
    for i:=1 to n do
      if (Free[A[i].id]) then
        begin
		      Inc(res);
          Free[A[i].id]:=false; 
          if (Free[A[i].id-1]) then Free[A[i].id-1]:=false;
          if (Free[A[i].id+1]) then Free[A[i].id+1]:=false;
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