{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program GRAPH_;
Uses Math;
Const
  maxN =10000; maxM =50000;
Type
  PNode =^TNode;
  TNode =Record
    info :SmallInt;
    id :LongInt;
    Link :PNode;
  end;
Var
  n,count,articulations :SmallInt;
  bridges :LongInt;
  A :Array[1..maxN] of PNode;
  Children,Num,Low :Array[1..maxN] of SmallInt;
  IsArticulation :Array[1..maxN] of Boolean;
  Mark :Array[-maxM..maxM] of Boolean;

  procedure Install(u,v :SmallInt; i :LongInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.id:=i; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,m :LongInt;
    u,v :SmallInt;
  begin
    Read(n,m);
    for u:=1 to n do A[u]:=nil;
    FillChar(Mark,SizeOf(Mark),true);
    for i:=1 to m do
      begin
        Read(u,v);
        Install(u,v,i);
        Install(v,u,-i);
      end;
  end;

  procedure Visit(u :SmallInt);
  var
    P :PNode;
    v :SmallInt;
    i :LongInt;
  begin
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
                if (Low[v]>=Num[u]) and (not IsArticulation[u]) then
                  begin
                    IsArticulation[u]:=true;
                    Inc(articulations);
                  end;
                if (Low[v]>Num[u]) then Inc(bridges);
                Low[u]:=Min(Low[u],Low[v]);
              end;
	      end;
        P:=P^.Link;
      end;
  end;

  procedure Solve;
  var
    u :SmallInt;
  begin
    FillChar(IsArticulation,n,false);
    FillChar(Children,n,0);
    FillChar(Num,n,0);
    count:=0; articulations:=0; bridges:=0;
    for u:=1 to n do
      if (Num[u]=0) then
        begin
          Visit(u);
          if (IsArticulation[u]) and (Children[u]<2) then
            begin
              Dec(articulations);
              IsArticulation[u]:=false;
            end;
        end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(articulations,' ',bridges);
  Close(Input); Close(Output);
End.