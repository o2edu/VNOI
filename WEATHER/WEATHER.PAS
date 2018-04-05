{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program WEATHER;
Uses Math;
Const
  maxN =100;
  maxM =5000;
Type
  PNode =^TNode;
  TNode =Record
    info :ShortInt;
    id :SmallInt;
    Link :PNode;
  end;
Var
  n,count,top :ShortInt;
  A :Array[1..maxN] of PNode;
  Num,Low,Element :Array[1..maxN] of ShortInt;
  Stack :Array[1..maxM] of ShortInt;
  Mark :Array[-maxM..maxM] of Boolean;

  procedure Install(u,v :ShortInt; i :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.id:=i; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,m :SmallInt;
    u,v :ShortInt;
  begin
    Read(n); Read(m);
    for i:=1 to m do
      begin
        Read(u,v);
        Install(u,v,i);
        Install(v,u,-i);
     end;
  end; 

  procedure Push(u :ShortInt);
  begin
    Inc(top); Stack[top]:=u;
  end;

  function Pop :ShortInt;
  begin
    Pop:=Stack[top]; Dec(top);
  end;

  procedure Visit(u :ShortInt);
  var
    P :PNode;
    i :SmallInt;
    v :ShortInt;
  begin
    Element[u]:=1; Inc(count); Num[u]:=count; Low[u]:=count; P:=A[u];
    while (P<>nil) do
      begin
        i:=P^.id;
        if (Mark[i]) then
          begin
            Mark[-i]:=false;
            v:=P^.info;
            if (Num[v]>0) then
              Low[u]:=Min(Low[u],Num[v])
            else
              begin
                Visit(v);
                Inc(Element[u],Element[v]);
                if (Low[v]>Num[u]) then Push(v);
                Low[u]:=Min(Low[u],Low[v]);
              end;
          end;
        P:=P^.Link;
      end;
  end;

  procedure Solve; 
  var
    u :ShortInt;
  begin
    FillChar(Mark,SizeOf(Mark),true);
    FillChar(Num,n,0);
    count:=0; top:=0;
    for u:=1 to n do
      if (Num[u]=0) then Visit(u);
  end;

  procedure Escape;
  var
    res :SmallInt;
    u :ShortInt;
  begin
    res:=0;
    while (top>0) do
      begin
        u:=Pop;
        Inc(res,Element[u]*(n-Element[u]));
      end;
    Write(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Escape;
  Close(Input); Close(Output);
End.