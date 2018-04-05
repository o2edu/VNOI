{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program NUMBER;
Uses Math;
Const
  maxN =10000;
Type
  PNode =^TNode;
  TNode =Record
    info :SmallInt;
    Link :PNode;
  end;
Var
  n,t,count,res :SmallInt;
  A :Array[1..maxN] of PNode;
  Num,Low,Free,Deg :Array[1..maxN] of SmallInt;
  Head :PNode;

  procedure Install(u,v :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,m,u,v :SmallInt;
  begin
    Read(n,m,t);
    for i:=1 to m do
      begin
        Read(u,v);
        Install(u,v);
      end;
 end;
 
  procedure Push(u :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=u; P^.Link:=Head; Head:=P;
  end;

  function Pop :SmallInt;
  var
    P :PNode;
  begin
    Pop:=Head^.info; P:=Head^.Link; Dispose(Head); Head:=P;
  end;

  procedure Visit(u :SmallInt);
  var
    P :PNode;
    v :SmallInt;
  begin
    Push(u); Inc(count); Num[u]:=count; Low[u]:=count; P:=A[u];
    while (P<>nil) do
      begin
        v:=P^.info;
        if (Free[v]=0) then
          begin
            if (Num[v]>0) then
              Low[u]:=Min(Low[u],Num[v])
            else
              begin
                Visit(v);
                Low[u]:=Min(Low[u],Low[v]);
              end;
          end;
        P:=P^.Link;
      end;
    if (Low[u]=Num[u]) then
      begin
        Inc(res);
        repeat
          v:=Pop;
          Free[v]:=res;
        until (v=u);
      end;
  end;

  procedure Solve;
  var
    P :PNode;
    u,v :SmallInt;
  begin
    FillChar(Free,n,0);
    FillChar(Num,n,0);
    res:=0; count:=0; Head:=nil;
    for u:=1 to n do
      if (Num[u]=0) then Visit(u);
    FillChar(Deg,res,0);
    for u:=1 to n do
      begin
        P:=A[u];
        while (P<>nil) do
          begin
            v:=P^.info;
            if (Free[v]<>Free[u]) then Inc(Deg[Free[u]]);
            P:=P^.Link;
          end;
      end;
    Deg[Free[t]]:=-1;
    count:=0;
    for u:=1 to res do
      if (Deg[u]=0) then Inc(count);
    res:=count;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.