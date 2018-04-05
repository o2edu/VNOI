{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program CAR;
Const
  maxN =10000;
Type
  Note =Record id,v :SmallInt; t :ShortInt end;
Var
  n :SmallInt;
  A :Array[1..maxN] of Note;
  res :Int64;

  procedure Enter;
  var
    i :SmallInt;
  begin
    Read(n);
    for i:=1 to n do A[i].id:=i;
    for i:=1 to n do Read(A[i].v);
    for i:=1 to n do Read(A[i].t);
  end;

  function Compare(x,y :Real) :Boolean;
  begin
    Exit(x>y);
  end;

  procedure Sort(l,r :SmallInt);
  var
    i,j,k :SmallInt;
    key :Real;
    Tmp :Note;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; k:=Random(r-l+1)+l; key:=A[k].t/A[k].v;
    repeat
      while (Compare(key,A[i].t/A[i].v)) do Inc(i);
      while (Compare(A[j].t/A[j].v,key)) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              Tmp:=A[i]; A[i]:=A[j]; A[j]:=Tmp;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    Sort(l,j); Sort(i,r);
  end;

  procedure Greedy;
  var
    i :SmallInt;
    time :Int64;
  begin
    res:=0; time:=0;
    for i:=1 to n do
      begin
        Inc(time,A[i].t); 
		Inc(res,A[i].v*time);
      end;
  end;

  procedure Escape;
  var
    i :SmallInt;
  begin
    WriteLn(res);
    for i:=1 to n do Write(A[i].id,' ');
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Sort(1,n);
  Greedy;
  Escape;
  Close(Input); Close(Output);
End.