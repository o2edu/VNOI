{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MSTICK;
Const
  maxN =5000;
Type
  Note =Record l,w :SmallInt end;
Var
  t,n,res :SmallInt;
  A :Array[1..maxN] of Note;
  F :Array[1..maxN] of SmallInt;

  procedure Enter;
  var
    i :SmallInt;  
  begin
    Read(n);
    for i:=1 to n do Read(A[i].l,A[i].w);
  end;

  procedure QSort(l,r :SmallInt);
  var
    i,j :SmallInt;
    Key,Tmp :Note;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; Key:=A[(l+r) div 2];
    repeat
      while (A[i].l<Key.l) or ((A[i].l=Key.l) and (A[i].w<Key.w)) do Inc(i);
      while (A[j].l>Key.l) or ((A[j].l=Key.l) and (A[j].w>Key.w)) do Dec(j);
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

  function BS(i :SmallInt) :SmallInt;
  var
    left,right,mid :SmallInt;
  begin
    left:=1; right:=res;
    while (left<right) do
      begin
        mid:=(left+right) div 2;
        if (A[F[mid]].w>A[i].w) then left:=mid+1 else right:=mid;
      end;
    Exit(left);
  end;

  procedure Optimize;
  var
    i :SmallInt;
  begin
    F[1]:=1; res:=1;
    for i:=2 to n do
      if (A[i].w<A[F[res]].w) then
        begin
          Inc(res); F[res]:=i;
        end
      else F[BS(i)]:=i;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(t);
  repeat
    Dec(t);
    Enter;
    QSort(1,n);
    Optimize;
    WriteLn(res);
  until (t=0);
  Close(Input); Close(Output);
End.