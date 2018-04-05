{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program STABLE;
Const
  maxN =10000;
Type
  PNode =^TNode;
  TNode =Record
    info :SmallInt;
    Link :PNode;
  end;
Var
  n,s,res :SmallInt;
  A :Array[1..maxN] of PNode;
  Free,Mark :Array[1..maxN] of Boolean;
  D :Array[1..maxN] of SmallInt;
  Front,Rear :PNode;

  procedure Install(u,v :SmallInt);
  var
    P,Q,R :PNode;
  begin
    New(P); P^.info:=v; P^.Link:=nil;
    if (A[u]=nil) then A[u]:=P
    else
      begin
        Q:=A[u];
        if (Q^.info=P^.info) then Exit;
        while (Q^.Link<>nil) do
          begin
           Q:=Q^.Link;
           if (Q^.info=P^.info) then Exit;
          end;
        Q^.Link:=P;
     end;
  end; 

  procedure Enter;
  var
    m,i :LongInt;
    u,v :SmallInt;
  begin
    Read(n,m,s);
    for i:=1 to n do A[i]:=nil;
    for i:=1 to m do
      begin
        Read(u,v); Install(u,v);
      end;
  end;

  procedure Push(u :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=u; P^.Link:=nil;
    if (Front=nil) then Front:=P else Rear^.Link:=P;
    Rear:=P;
  end;

  function Pop :SmallInt;
  var
    P :PNode;
  begin
    Pop:=Front^.info; P:=Front^.Link; Dispose(Front); Front:=P;
  end;

  procedure Solve;
  var
    P :PNode;
    u,v :SmallInt;
  begin
    FillChar(Free,n,true); Mark:=Free;
    res:=0; Front:=nil; Push(s); D[s]:=0; Free[s]:=false;
    repeat
      u:=Pop; P:=A[u];
      while (P<>nil) do
        begin
          v:=P^.info;
          if (Free[v]) then
            begin
              Free[v]:=false;
              D[v]:=D[u]+1;
              Push(v);
              if (Mark[v]) and (not Mark[u]) then
                begin
                  Inc(res); Mark[v]:=false;
                end;
            end
          else
            if (Mark[v]) and (D[v]=D[u]+1) then
              begin
                Inc(res); Mark[v]:=false;
              end;
          P:=P^.Link;
        end;
    until (Front=nil);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.