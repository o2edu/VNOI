{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program PWALK;
Uses Math;
Const
  maxN =1000;
  maxValue =10000001;
Type
  PNode =^TNode;
  TNode =Record
    info,value :SmallInt;
    Link :PNode;
  end;
Var
  n,q,s,f :SmallInt;
  A :Array[1..maxN] of PNode;
  D :Array[1..maxN] of LongInt;
  Free :Array[1..maxN] of Boolean;
  Front,Rear :PNode;

  procedure Install(u,v,c :SmallInt);
  var
    P :PNode; 
  begin
    New(P); P^.info:=v; P^.value:=c; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,u,v,c :SmallInt; 
  begin
    Read(n,q);
    for i:=1 to n do A[i]:=nil;
    for i:=1 to n-1 do
      begin
        Read(u,v,c); 
		Install(u,v,c);
		Install(v,u,c);
      end;
  end;

  procedure Init;
  var
    i :SmallInt;
  begin
    Read(s,f);
    FillChar(Free,n,true); Free[s]:=false;
    for i:=1 to n do D[i]:=maxValue; D[s]:=0;
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
    u,v,c :SmallInt;
  begin
    Front:=nil; Push(s);
    repeat
      u:=Pop; P:=A[u];
      while (P<>nil) do
        begin
          v:=P^.info; c:=P^.value;
          D[v]:=Min(D[v],D[u]+c);
          if (v<>f) and (Free[v]) then
            begin
              Push(v); Free[v]:=false;
            end;
          P:=P^.Link;
        end;
    until (Front=nil);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  repeat
    Dec(q);
    Init;
    Solve;
    WriteLn(D[f]);
  until (q=0);
  Close(Input); Close(Output);
End.