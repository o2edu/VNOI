{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program NKTRIO;
Const
  maxN =1000;
Type
  PNode =^TNode;
  TNode =Record
    info :SmallInt;
    Link :PNode;
  end;
Var
  n,x,y,z :SmallInt;
  A :Array[1..maxN] of PNode;
  T,D :Array[1..maxN] of SmallInt;
  ok :Boolean;

  procedure Install(u,v :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    u,v :SmallInt;
    k :Byte;
  begin
    Read(n);
    for u:=1 to n do A[u]:=nil;
    for u:=1 to n do
      for v:=1 to n do
        begin
          Read(k);
          if (k=1) then Install(u,v);
        end;
  end;

  procedure Visit(u :SmallInt);  
  var
    P :PNode;
    v :SmallInt;
  begin
    if (ok) then Exit;
    P:=A[u];
    while (P<>nil) do
      begin
        v:=P^.info;
        if (T[v]=0) then
          begin
            D[v]:=D[u]+1;
            T[v]:=u;
            Visit(v);
          end
        else
          if (D[u]-D[v]=2) then
            begin
              ok:=true;
              x:=v; y:=T[u]; z:=u;
              Exit;
            end;
        P:=P^.Link;
      end;
  end;

  procedure Solve;
  var
    u :SmallInt;
  begin
    FillChar(T,n,0);
    x:=-1; y:=-1; z:=-1;
    ok:=false;
    for u:=1 to n do
      if (T[u]=0) then
        begin
          D[u]:=1;
          T[u]:=n+1;
          Visit(u);
          if (ok) then Exit;
        end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(x,' ',y,' ',z);
  Close(Input); Close(Output);
End.