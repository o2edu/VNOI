{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program MESSAGE;
Uses Math;
Const
  maxN =1000001;
Type
  PNode =^TNode;
  TNode =Record
    info :LongInt;
    Link :PNode;
  end;
  Plate =Array[1..maxN] of PNode;
Var
  n,res,scc,count,top :LongInt;
  A :Plate;
  Mark :Array[1..maxN] of Boolean;
  Free,Num,Low,Stack :Array[1..maxN] of LongInt;

  procedure Install(u,v :LongInt);
  var
    P,Q :PNode;
  begin
    New(P); P^.info:=v; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    m,i,u,v :LongInt;
  begin
    Read(n,m);
    for u:=1 to n do A[u]:=nil;
    for i:=1 to m do
      begin
        Read(u,v); Install(u,v);
      end;
  end;

  procedure Push(u :LongInt);
  begin
    Inc(top); Stack[top]:=u;
  end;

  function Pop :LongInt;
  begin
    Pop:=Stack[top]; Dec(top);
  end;

  procedure Visit(u :LongInt);
  var
    P :PNode;
    v,t :SmallInt;
    ok :Boolean;
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
    u,v :LongInt;
    P :PNode;
  begin
    FillChar(Free,n,0);
    FillChar(Num,n,0);
    FillChar(Mark,n,true);
    res:=0; count:=0; top:=0;
    for u:=1 to n do
      if (Num[u]=0) then Visit(u);
    for u:=1 to n do
      begin
        P:=A[u];
        while (P<>nil) do
          begin
            v:=P^.info;
            if (Free[u]<>Free[v]) then Mark[Free[v]]:=false;
            P:=P^.Link;
          end;
      end;
    count:=res; res:=0;
    for u:=1 to count do
      if (Mark[u]) then Inc(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.