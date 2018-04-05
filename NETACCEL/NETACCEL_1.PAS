{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NETACCEL;
Const
  maxN =1000;
  maxK =10;
  oo =10e9+9;
Type
  PNode =^TNode;
  TNode =Record
    info :SmallInt;
    value :Real;
    Link :PNode;
  end;
Var
  n,k :LongInt;
  A :Array[1..maxN] of PNode;
  D :Array[1..maxN,0..maxK] of Real;
  Free :Array[1..maxN,0..maxK] of Boolean;

  procedure Install(u,v :SmallInt; c :Real);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.value:=c; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    u,v :SmallInt;
    i,m :LongInt;
    c :Real;
  begin
    Read(n,m,k);
    for u:=1 to n do A[u]:=nil;
    for i:=1 to m do
      begin
        Read(u,v,c);
        Install(u,v,c);
        Install(v,u,c);
      end;
    for u:=2 to n do
      for i:=0 to k do D[u,i]:=oo;
    FillChar(Free,SizeOf(Free),true);
  end;

  procedure Greedy;
  var
    u,v,i,j :SmallInt;
    P :PNode;
    minV,c :Real;
  begin
    repeat
      u:=0; i:=-1; minV:=oo;
      for v:=1 to n do
        for j:=0 to k do
          if (Free[v,j]) and (D[v,j]<minV) then
            begin
              minV:=D[v,j]; u:=v; i:=j;
            end;
      if ((u=0) and (i=-1)) or ((u=n) and (i=k)) then Break;
      Free[u,i]:=false;
      P:=A[u];
      while (P<>nil) do
        begin
          v:=P^.info; c:=P^.value;
          for j:=i to k do
            begin
              if (Free[v,j]) and (D[v,j]>D[u,i]+c) then D[v,j]:=D[u,i]+c;
              c:=c/2;
            end;
          P:=P^.Link;
        end;
    until false;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Greedy;
  Write(D[n,k]:0:2);
  Close(Input); Close(Output);
End.