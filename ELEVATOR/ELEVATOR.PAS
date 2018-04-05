{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program ELEVATOR;
Const
  maxN =400;
  maxM =40000;
Type
  Note =Record he,qa :Integer; li :LongInt end;
Var
  n :Integer;
  A :Array[1..maxN] of Note;
  F :Array[0..1,1..maxM] of Boolean;
  x,y :Byte;

  procedure Enter;
  var
    i :Integer;
  begin
    Read(n);
    for i:=1 to n do Read(A[i].he,A[i].li,A[i].qa);
  end;

  procedure QSort(l,r :Integer);
  var
    i,j :Integer;
    k :LongInt;
    tmp :Note;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; k:=A[(l+r) div 2].li;
    repeat
      while (A[i].li<k) do Inc(i);
      while (A[j].li>k) do Dec(j);
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

  procedure Optimize;
  var
    i :Integer;
    j :Byte;
    k,tmp :LongInt;
  begin
    FillChar(F,SizeOf(F),false);
    x:=0; y:=1;
    for i:=1 to n do
      begin
        for j:=1 to A[i].qa do
          for k:=1 to A[i].li do
            begin
              tmp:=k-A[i].he*j;
              F[y,k]:=(F[y,k]) or (F[x,k]) or
                      (tmp=0) or ((tmp>0) and (F[x,tmp]));
            end;
        x:=1-x; y:=1-y;
      end;
  end;

  procedure Trace;
  var
    i :LongInt;
  begin
    i:=A[n].li;
    while (not (F[x,i])) and (i>0) do Dec(i);
    Write(i);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  QSort(1,n);
  Optimize;
  Trace;
  Close(Input); Close(Output);
End.