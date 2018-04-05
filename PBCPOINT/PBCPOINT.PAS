{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program PBCPOINT;
Const
  maxXY =1000;
Type
  PNode =^TNode;
  TNode =Record
    u,v :SmallInt;
    Link :PNode;
  end;
Var
  Front,Rear :PNode;
  FreeR,FreeC :Array[-maxXY..maxXY] of Boolean;
  MinR,MaxR,MinC,MaxC :Array[-maxXY..maxXY] of SmallInt;
  InQueue :Array[-maxXY..maxXY,-maxXY..maxXY] of Boolean;
  res :LongInt;

  procedure Push(u,v :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.u:=u; P^.v:=v; P^.Link:=nil;
    if (Front=nil) then Front:=P else Rear^.Link:=P;
    Rear:=P;
  end;

  function Pop :PNode;
  begin
    Pop:=Front; Front:=Front^.Link;
  end;

  procedure Enter; 
  var
    n,i :LongInt;
    u,v :SmallInt;
  begin
    FillChar(InQueue,SizeOf(InQueue),true);
    Read(n);
    Front:=nil;
    for i:=1 to n do
      begin
        Read(u,v);
        if (InQueue[u,v]) then
          begin
            InQueue[u,v]:=false; Push(u,v);
          end;
      end;
    FillChar(FreeR,SizeOf(FreeR),true); FreeC:=FreeR;
  end;

  procedure Solve;
  var
    P :PNode;
    u,v,x :SmallInt;
  begin
    res:=0;
    repeat
      Inc(res); P:=Pop; u:=P^.u; v:=P^.v; Dispose(P);
      if (FreeR[u]) then
        begin
          FreeR[u]:=false; MinR[u]:=v; MaxR[u]:=v;
        end
      else
        begin
          if (v<MinR[u]) then
            begin
              for x:=v+1 to MinR[u]-1 do
                if (InQueue[u,x]) then
                  begin
                    InQueue[u,x]:=false; Push(u,x);
                  end;
              MinR[u]:=v;
            end;
          if (v>MaxR[u]) then
            begin
              for x:=MaxR[u]+1 to v-1 do
                if (InQueue[u,x]) then
                  begin
                    InQueue[u,x]:=false; Push(u,x);
                  end;
              MaxR[u]:=v;
            end;
        end;
      if (FreeC[v]) then
        begin
          FreeC[v]:=false; MinC[v]:=u; MaxC[v]:=u;
        end
      else
        begin
          if (u<MinC[v]) then
            begin
              for x:=u+1 to MinC[v]-1 do
                if (InQueue[x,v]) then
                  begin
                    InQueue[x,v]:=false; Push(x,v);
                  end;
              MinC[v]:=u;
            end;
          if (u>MaxC[v]) then
            begin
              for x:=MaxC[v]+1 to u-1 do
                if (InQueue[x,v]) then
                  begin
                    InQueue[x,v]:=false; Push(x,v);
                  end;
              MaxC[v]:=u;
            end;
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