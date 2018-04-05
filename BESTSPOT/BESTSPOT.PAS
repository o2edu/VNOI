{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program BESTSPOT;
Const
  maxN =500;
  maxM =16000;
  maxC =15000000;
Type
  TAdj =Array[1..maxM] of LongInt;
  TAdjCost =Array[1..maxM] of LongInt;
  THeader =Array[1..maxN+1] of LongInt;
Var
  Adj :TAdj;
  AdjCost :TAdjCost;
  Head :THeader;
  D :Array[1..maxN] of LongInt;
  Free :Array[1..maxN] of Boolean;
  Heap,Loc,F,Best :Array[1..maxN] of LongInt;
  n,nHeap,k,res :LongInt;

  procedure Enter;
  var
    Ds :Array[1..maxM] of Record u,v,c :SmallInt end;
    i,u,v,c,m :LongInt;
  begin
    Read(n,k,m);
    for i:=1 to k do Read(F[i]);
    FillChar(Head,SizeOf(Head),0);
    for i:=1 to m do
      with (Ds[i]) do
        begin
          Read(u,v,c);
          Inc(Head[u]);
          Inc(Head[v]);
        end;
    for u:=2 to n do Inc(Head[u],Head[u-1]);
    for i:=1 to m do
      with (Ds[i]) do
        begin
          Adj[Head[u]]:=v;
          Adj[Head[v]]:=u;
          AdjCost[Head[u]]:=c;
          AdjCost[Head[v]]:=c;
          Dec(Head[u]);
          Dec(Head[v]);
        end;
    Head[n+1]:=2*m;
  end;

  procedure UpHeap(u :LongInt);
  var
    parent,child :LongInt;
  begin
    child:=Loc[u];
    if (child=0) then
      begin
        Inc(nHeap); child:=nHeap;
      end;
    parent:=child div 2;
    while (parent>0) and (D[Heap[parent]]>D[u]) do
      begin
        Heap[child]:=Heap[parent];
        Loc[Heap[child]]:=child;
        child:=parent;
        parent:=child div 2;
     end;
    Heap[child]:=u;
    Loc[u]:=child;
  end;

  procedure DownHeap;
  var
    u,parent,child :LongInt;
  begin
    Heap[1]:=Heap[nHeap]; Dec(nHeap);
    u:=Heap[1]; parent:=1;
    while (parent*2<=nHeap) do
      begin
        child:=2*parent;
        if (child<nHeap) and (D[Heap[child+1]]<D[Heap[child]]) then Inc(child);
        if (D[u]<=D[Heap[child]]) then Break;
        Heap[parent]:=Heap[child];
        Loc[Heap[parent]]:=parent;
        parent:=child;
      end;
    Heap[parent]:=u;
    Loc[u]:=child;
  end;

  procedure Greedy(s :LongInt);
  var
    u,v,i :LongInt;
  begin
    FillChar(Free,SizeOf(Free),true);
    FillChar(Loc,SizeOf(Loc),0);
    for u:=1 to n do D[u]:=maxC;
    D[s]:=0; nHeap:=0; UpHeap(s);
    repeat
      u:=Heap[1]; Free[u]:=false; DownHeap;
      for i:=Head[u]+1 to Head[u+1] do
        begin
          v:=Adj[i];
          if (Free[v]) and (D[v]>D[u]+AdjCost[i]) then
            begin
              D[v]:=D[u]+AdjCost[i];
              UpHeap(v);
            end;
        end;
    until (nHeap=0);
    for u:=1 to n do Inc(Best[u],D[u]);
  end;

  procedure Solve;
  var
    i,u :LongInt;
  begin
    FillChar(Best,SizeOf(Best),0);
    for i:=1 to k do Greedy(F[i]);
    res:=1;
    for u:=2 to n do
      if (Best[u]<Best[res]) then res:=u;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.