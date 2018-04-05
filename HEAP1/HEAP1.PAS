{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program HEAP1;
Const
  maxN =20000;
Var
  test,n,nHeap :LongInt;
  ans :Int64;
  Heap :Array[1..maxN] of Int64;

  procedure UpHeap(i :LongInt);
  var
    key :Int64;
    leaf,root :LongInt;
  begin
    key:=Heap[i]; leaf:=i;
    while (leaf>=2) do
      begin
        root:=leaf div 2;
        if (Heap[root]<=key) then Break;
        Heap[leaf]:=Heap[root];
        leaf:=root;
      end;
    Heap[leaf]:=key;
  end;

  procedure DownHeap(i :LongInt);
  var
    key :Int64;
    leaf,root :LongInt;
  begin
    key:=Heap[i]; root:=i;
    while (root*2<=nHeap) do
      begin
        leaf:=root*2;
        if (leaf<nHeap) and (Heap[leaf]>Heap[leaf+1]) then Inc(leaf);
        if (Heap[leaf]>=key) then Break;
        Heap[root]:=Heap[leaf];
        root:=leaf;
      end;
    Heap[root]:=key;
  end;

  procedure Push(x :Int64);
  begin
    Inc(nHeap);
    Heap[nHeap]:=x;
    UpHeap(nHeap);
  end;

  procedure Del(x :LongInt);
  begin
    Heap[x]:=Heap[nHeap];
    Dec(nHeap);
    DownHeap(x);
  end;

  procedure Enter;
  var
    i,x :LongInt;
  begin
    Read(n);
    nHeap:=0;
    for i:=1 to n do
      begin
        Read(x); Push(x);
      end;
    ans:=0;
  end;

  procedure Solve;
  var
    i :LongInt;
    x,y :Int64;
  begin
    for i:=1 to n-1 do
      begin
        x:=Heap[1]; Inc(ans,x); Del(1);
        y:=Heap[1]; Inc(ans,y); Del(1);
        Push(x+y);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(test);
  repeat
    Dec(test);
    Enter;
    Solve;
    WriteLn(ans);
  until (test=0);
  Close(Input); Close(Output);
End.