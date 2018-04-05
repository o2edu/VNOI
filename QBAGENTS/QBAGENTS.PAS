{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program QBAGENTS;
Uses Math;
Const
  maxN =250;
  maxValue =1000000000;
Type
  PNode1 =^TNode1;
  TNode1 =Record
    info :Byte;
    Link :PNode1;
  end;
  PNode2 =^TNode2;
  TNode2 =Record
    u,v,k :Byte;
    Link :PNode2;
  end;
Var
  n,s,t :Byte;
  A :Array[1..maxN] of PNode1;
  F :Array[1..maxN,1..maxN,1..2] of LongInt;
  Front,Rear :PNode2;
  res :LongInt;

  procedure Install(u,v :Byte);
  var
    P :PNode1;
  begin
    New(P); P^.info:=v; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,m :LongInt;
    u,v :Byte;
  begin
    Read(n,m); Read(s,t);
    for u:=1 to n do A[u]:=nil;
    for i:=1 to m do
      begin
        Read(u,v); Install(u,v);
      end;
    for u:=1 to n do
      begin
        F[u,u,1]:=maxValue;
        F[u,u,2]:=maxValue;
      end;
    for u:=1 to n-1 do
      for v:=u+1 to n do
        begin
          F[u,v,1]:=maxValue;
          F[u,v,2]:=maxValue;
          F[v,u,1]:=maxValue;
          F[v,u,2]:=maxValue;
        end;
  end;

  procedure Push(u,v,k :Byte);
  var
    P :PNode2;
  begin
    New(P); P^.u:=u; P^.v:=v; P^.k:=k; P^.Link:=nil;
    if (Front=nil) then Front:=P else Rear^.Link:=P;
    Rear:=P;
  end;

  function Pop :PNode2;
  begin
    Pop:=Front; Front:=Front^.Link;
  end;

  procedure Solve;
  var
    P :PNode1;
    Q :PNode2;
    u,v,k,x :Byte;
  begin
    res:=maxValue; F[s,t,1]:=0; Front:=nil; Push(s,t,1);
    repeat
      Q:=Pop; u:=Q^.u; v:=Q^.v; k:=Q^.k; Dispose(Q);
      if (k=1) then
        begin
          P:=A[u];
          while (P<>nil) do
            begin
              x:=P^.info;
              if (F[x,v,2]=maxValue) then
                begin
                  F[x,v,2]:=F[u,v,1];
                  Push(x,v,2);
                end;
              P:=P^.Link;
            end;
        end
      else
        begin
          P:=A[v];
          while (P<>nil) do
            begin
              x:=P^.info;
              if (F[u,x,1]=maxValue) then
                begin
                  F[u,x,1]:=F[u,v,2]+1;
                  if (u=x) then
                    begin
                      res:=F[u,x,1]; Exit;
                    end;
                  Push(u,x,1);
                end;
              P:=P^.Link;
            end;
        end;
    until (Front=nil);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  if (res=maxValue) then Write(-1) else Write(res);
  Close(Input); Close(Output);
End.