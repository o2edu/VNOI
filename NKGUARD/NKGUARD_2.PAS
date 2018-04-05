{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program NKGUARD;
Const
  maxN =700;
  maxMove =8;
  X :Array[1..maxMove] of ShortInt=(-1,-1,0,1,1,1,0,-1);
  Y :Array[1..maxMove] of ShortInt=(0,1,1,1,0,-1,-1,-1);
Type
  PNode =^TNode;
  TNode =Record
    xx,yy :SmallInt;
    Link :PNode;
  end;
Var
  n,m :SmallInt;
  A :Array[0..maxN+1,0..maxN+1] of SmallInt;
  Free :Array[1..maxN,1..maxN] of Boolean;
  res :LongInt;
  Front,Rear :PNode;

  procedure Enter;
  var
    i,j :SmallInt;
  begin
    Read(n,m);
    for i:=0 to n+1 do
      begin
        A[i,0]:=-1; A[i,m+1]:=-1;
      end;
    for i:=0 to m+1 do
      begin
        A[0,i]:=-1; A[n+1,i]:=-1;
      end;
    for i:=1 to n do
      for j:=1 to m do Read(A[i,j]);
  end;

  procedure Push(u,v :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.xx:=u; P^.yy:=v; P^.Link:=nil;
    if (Front=nil) then Front:=P else Rear^.Link:=P;
    Rear:=P;
  end;

  function Pop :PNode; 
  begin
    Pop:=Front; Front:=Front^.Link;
  end;

  procedure Visit(u,v :SmallInt);
  var
    P :PNode;
    ok :Boolean;
    uu,vv,ui,vi :SmallInt;
    i :Byte;
  begin
    Push(u,v); ok:=true; Free[u,v]:=false;
    repeat
      P:=Pop; uu:=P^.xx; vv:=P^.yy; Dispose(P);
      for i:=1 to maxMove do
        begin
          ui:=uu+X[i]; vi:=vv+Y[i];
          if (A[ui,vi]>A[u,v]) then ok:=false;
          if (A[ui,vi]=A[u,v]) and (Free[ui,vi]) then
            begin
              Free[ui,vi]:=false; Push(ui,vi);
            end;
        end;
    until (Front=nil);
    if (ok) then Inc(res);
  end;

  procedure Solve;
  var
    i,j :SmallInt;
  begin
    FillChar(Free,SizeOf(Free),true);
    Front:=nil; res:=0;
    for i:=1 to n do
      for j:=1 to m do
        if (Free[i,j]) then Visit(i,j);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.