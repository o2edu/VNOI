{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program CRITICAL;
Uses Math;
Const
  maxN =20000;
  maxM =200000;
Type
  PNode =^TNode;
  TNode =Record
    id :LongInt;
    info :SmallInt;
    Link :PNode;
  end;
Var
  n,count,top :SmallInt;
  m :LongInt;
  A :Array[1..maxN] of PNode;
  Mark :Array[-maxM..maxM] of Boolean;
  Vertices,Num,Low,Element,Children :Array[1..maxN] of SmallInt;
  Sum :Array[1..maxN] of LongInt;
  IsArticulation :Array[1..maxN] of Boolean;
  res :Real;

  procedure Install(u,v :SmallInt; i :LongInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.id:=i; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i :LongInt;
    u,v :SmallInt;
  begin
    Read(n,m);
    for u:=1 to n do A[u]:=nil;
    for i:=1 to m do
      begin
        Read(u,v);
        Install(u,v,i);
        Install(v,u,-i);
      end;
  end;

  procedure Init(u :SmallInt);  
  var
    v :SmallInt;
    P :PNode;
  begin
    Num[u]:=1; Inc(Vertices[m]); P:=A[u];
    while (P<>nil) do
      begin
        v:=P^.info;
        if (Num[v]=0) then Init(v);
        P:=P^.Link;
      end;
  end;

  procedure Visit(u :SmallInt);
  var
    P :PNode;
    i :LongInt;
    v :SmallInt;
    tmp :LongInt;
  begin
    Children[u]:=0; Element[u]:=1; Sum[u]:=0; tmp:=0;
    Inc(count); Num[u]:=count; Low[u]:=count; P:=A[u];
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
                Inc(Children[u]);
                Visit(v);
                Inc(Element[u],Element[v]);
                if (Low[v]>=Num[u]) then
                  begin
                    IsArticulation[u]:=true;
                    Inc(Sum[u],tmp*Element[v]);
                    Inc(tmp,Element[v]);
                  end;
                Low[u]:=Min(Low[u],Low[v]);
              end;
          end;
        P:=P^.Link;
      end;
    Inc(Sum[u],tmp*(Vertices[m]-tmp-1));
  end;

  procedure Solve;
  var
    u,v :SmallInt;
  begin
    FillChar(Num,SizeOf(Num),0);
    m:=0;
    for u:=1 to n do
      if (Num[u]=0) then
        begin
          Inc(m); Vertices[m]:=0; Init(u);
        end;
    FillChar(IsArticulation,SizeOf(IsArticulation),false);
    FillChar(Mark,SizeOf(Mark),true);
    FillChar(Num,SizeOf(Num),0);
    top:=0; count:=0; m:=0;
    for u:=1 to n do
      if (Num[u]=0) then
        begin
          Inc(m); Visit(u);
          if (Children[u]<2) then IsArticulation[u]:=false;
        end;
  end;

  procedure Escape;
  var
    u :SmallInt;
  begin
    res:=0;
    for u:=1 to n do
      if (IsArticulation[u]) then res:=res+Sum[u];
    Write(res/n:0:2);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Escape;
  Close(Input); Close(Output);
End.