{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program QBSCHOOL;
Const
  maxN =5000;
  maxC =200000000;
Type
  PNode =^TNode;
  TNode =Record
    info,value :SmallInt;
    Link :PNode;
  end;
Var
  n :SmallInt;
  A :Array[1..maxN] of PNode;
  D :Array[0..maxN] of LongInt;
  T :Array[1..maxN] of Int64;
  Free :Array[1..maxN] of Boolean;

  procedure Install(u,v,c :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.value:=c; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,m :LongInt;
    u,v,c :SmallInt;
    k :Byte;
  begin
    Read(n,m);
    for u:=1 to n do A[u]:=nil;
    for i:=1 to m do
      begin
        Read(k,u,v,c);
        Install(u,v,c);
        if (k=2) then Install(v,u,c);
      end;
  end;

  procedure Greedy;
  var
    P :PNode;
    u,v,c :SmallInt;
  begin
    FillChar(Free,n,true);
    for u:=0 to n do D[u]:=maxC;
    D[1]:=0; T[1]:=1;
    repeat
      u:=0;
      for v:=1 to n do
        if (Free[v]) and (D[u]>D[v]) then u:=v;
      if (u=n) then Break;
      Free[u]:=false;
      P:=A[u];
      while (P<>nil) do
        begin
          v:=P^.info;
          if (Free[v]) then
            begin
              c:=P^.value;
              if (D[v]>D[u]+c) then
                begin
                  D[v]:=D[u]+c;
                  T[v]:=T[u];
                end
              else
                if (D[v]=D[u]+c) then Inc(T[v],T[u]);
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
  Write(D[n],' ',T[n]);
  Close(Input); Close(Output);
End.