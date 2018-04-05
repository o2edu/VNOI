{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program VNEMPIRE;
Const
  maxN =100001;
  maxM =3*maxN;
Type
  TEdge =Record
    u,v,c :LongInt;
  end;
  Plate =Array[1..maxN] of LongInt;
Var
  n,m,count,res :LongInt;
  E :Array[1..maxM] of TEdge;
  X,Y,Z,Lab,Id :Plate;

  procedure Enter;
  var
    u :LongInt;
  begin
    Read(n);
    for u:=1 to n do
      begin
        Id[u]:=u;
        Read(X[u],Y[u],Z[u]);
     end;
  end; 

  procedure Swap(i,j :LongInt; var XX,YY,ZZ :Plate);
  var
    tmp :LongInt;
  begin
    tmp:=Id[i]; Id[i]:=Id[j]; Id[j]:=tmp;
    tmp:=XX[i]; XX[i]:=XX[j]; XX[j]:=tmp;
    tmp:=YY[i]; YY[i]:=YY[j]; YY[j]:=tmp;
    tmp:=ZZ[i]; ZZ[i]:=ZZ[j]; ZZ[j]:=tmp;
  end;

  procedure QSort(k :Byte; l,r :LongInt; var A :Plate);
  var
    i,j,key :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; key:=A[(l+r) div 2];
    repeat
      while (A[i]<key) do Inc(i);
      while (A[j]>key) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              case (k) of
                1: Swap(i,j,A,Y,Z);
                2: Swap(i,j,X,A,Z);
                3: Swap(i,j,X,Y,A);
              end;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    QSort(k,l,j,A); QSort(k,i,r,A);
  end;

  procedure Ready(k :Byte; var A :Plate);
  var
    u :LongInt;
  begin
    QSort(k,1,n,A);
    for u:=1 to n-1 do
      begin
        Inc(m);
        E[m].u:=Id[u]; E[m].v:=Id[u+1]; E[m].c:=Abs(A[u]-A[u+1]);
      end;
  end;

  procedure Init;
  var
    u :LongInt;
  begin
    m:=0;
    Ready(1,X); Ready(2,Y); Ready(3,Z);
    for u:=1 to n do Lab[u]:=-1;
  end;

  function GetRoot(u :LongInt) :LongInt;
  begin
    while (Lab[u]>0) do u:=Lab[u];
    Exit(u);
  end;

  procedure Union(r1,r2 :LongInt);
  var
    tmp :LongInt; 
  begin
    tmp:=Lab[r1]+Lab[r2];
    if (Lab[r1]>Lab[r2]) then
      begin
        Lab[r1]:=r2; Lab[r2]:=tmp;
      end
    else
      begin
        Lab[r1]:=tmp; Lab[r2]:=r1;
      end;
  end;

  procedure DownHeap(root,leaf :LongInt);
  var
    Key :TEdge;
    child :LongInt;
  begin
    Key:=E[root];
    while (root*2<=leaf) do
      begin
        child:=root*2;
        if (child<leaf) and (E[child].c>E[child+1].c) then Inc(child);
        if (Key.c<=E[child].c) then Break;
        E[root]:=E[child];
        root:=child;
      end;
    E[root]:=Key;
  end;

  procedure Solve;
  var
    i,r1,r2,count :LongInt;
    Tmp :TEdge;
  begin
    res:=0; count:=0;
    for i:=m div 2 downto 1 do DownHeap(i,m);
    for i:=m-1 downto 0 do
      begin
        Tmp:=E[1]; E[1]:=E[i+1]; E[i+1]:=Tmp;
        DownHeap(1,i);
        r1:=GetRoot(E[i+1].u); r2:=GetRoot(E[i+1].v);
        if (r1<>r2) then
          begin
            Inc(count);
            Inc(res,E[i+1].c);
            if (count=n-1) then Exit;
            Union(r1,r2);
         end;
      end; 
 end;
 
Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Init;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.