{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program QBROBOT;
Const
  maxN =500;
  maxValue =1000000001;
Type
  PNode =^TNode;
  TNode =Record
    info,energy,time :SmallInt;
    Link :PNode;
  end;
Var
  n :SmallInt;
  mid,res :LongInt;
  A :Array[1..maxN] of PNode;
  Mark :Array[1..maxN] of Byte;
  Free :Array[1..maxN] of Boolean;
  D :Array[1..maxN] of LongInt;

  procedure Install(u,v,c,t :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.energy:=c; P^.time:=t; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,u,v,c,t,m :SmallInt;
  begin
    Read(n);
    for u:=1 to n do Read(Mark[u]);
    Read(m);
    mid:=0;
    for i:=1 to m do
      begin
        Read(u,v,t,c);
        Inc(mid,c);
        Install(u,v,c,t);
        Install(v,u,c,t);
      end;
  end;

  procedure Greedy;
  var
    u,v,t,c :SmallInt;
    P :PNode;
  begin
    FillChar(Free,n,true);
    for u:=0 to n do D[u]:=maxValue; D[n]:=0;
    repeat
      u:=0;
      for v:=1 to n do
        if (Free[v]) and (D[u]>D[v]) then u:=v;
      if (u=0) then Break;
      Free[u]:=false; 
	  P:=A[u];
      while (P<>nil) do
        begin
          v:=P^.info;
          if (Free[v]) then
            begin
              t:=P^.time;
              if (D[v]>D[u]+t) then D[v]:=D[u]+t;
            end;
          P:=P^.Link;
        end;
    until false;
  end;

  function Visit(u :SmallInt; w :LongInt) :Boolean;
  var
    P :PNode;
    v,t :SmallInt;
    c :LongInt;
  begin
    if (u=n) then Exit(true);
    Visit:=false;
    if (Mark[u]=1) then w:=mid;
    P:=A[u];
    while (P<>nil) do
      begin
        v:=P^.info; t:=P^.time; c:=w-P^.energy;
        if (t+D[v]=D[u]) and (c>=0) then Visit:=(Visit) or (Visit(v,c));
        P:=P^.Link;
      end;
  end;

  procedure Solve;
  var
    left,right :LongInt;
  begin
    left:=1; right:=mid;
    while (left<right) do
      begin
        mid:=(left+right) div 2;
        if (Visit(1,mid)) then right:=mid else left:=mid+1;
      end;
    res:=left;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Greedy;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.