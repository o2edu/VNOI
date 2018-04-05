{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program TJALG;
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
  n,res,count,top :SmallInt;
  A :Array[1..maxN] of PNode;
  Num,Low,Stack :Array[1..maxN] of SmallInt;
  Free :Array[1..maxN] of Boolean;

  procedure Install(u,v :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,m :LongInt;
    u,v :SmallInt;
  begin
    Read(n,m);
    for u:=1 to n do A[u]:=nil;
    for i:=1 to m do
      begin
        Read(u,v); Install(u,v);
      end;
  end;

  procedure Push(u :SmallInt);
  begin
    Inc(top); Stack[top]:=u;
  end;

  function Pop :SmallInt;
  begin
    Pop:=Stack[top]; Dec(top);
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
        if (Free[v]) then
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
          Free[v]:=false;
        until (v=u);
      end;
  end;

  procedure Solve;
  var
    u :SmallInt;
  begin
    FillChar(Free,n,true);
    FillChar(Num,SizeOf(Num),0);
    res:=0; count:=0; top:=0;
    for u:=1 to n do
      if (Num[u]=0) then Visit(u);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.