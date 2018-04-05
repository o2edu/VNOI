{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NETACCEL;
Const
  maxN =1001;
  maxK =11;
  maxValue =10e9+9;
Type
  PNode1 =^TNode1;
  TNode1 =Record
    info :LongInt;
    value :Double;
    Link :PNode1;
  end;
  PNode2 =^TNode2;
  TNode2 =Record
    u,i :LongInt;
    c :Double;
    Link :PNode2;
  end;
Var
  n,k :LongInt;
  A :Array[1..maxN] of PNode1;
  D :Array[1..maxN,0..maxK] of Double;
  Front,Rear :PNode2;

  procedure Install(u,v :LongInt; c :Double);
  var
    P :PNode1;
  begin
    New(P); P^.info:=v; P^.value:=c; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    u,v,i,m :LongInt;
    c :Double;
  begin
    Read(n,m,k);
    for u:=1 to n do A[u]:=nil;
    for i:=1 to m do
      begin
        Read(u,v,c);
        Install(u,v,c);
        Install(v,u,c);
      end;
  end;

  procedure Push(u,i :LongInt; c :Double);
  var
    P :PNode2;
  begin
    New(P); P^.u:=u; P^.i:=i; P^.c:=c; P^.Link:=nil;
    if (Front=nil) then Front:=P else Rear^.Link:=P;
    Rear:=P;
  end;

  function Pop :PNode2;
  begin
    Pop:=Front; Front:=Front^.Link;
  end;

  procedure Greedy;
  var
    P :PNode1;
    Q :PNode2;
    u,v,i,j :LongInt;
    c :Double;
  begin
    for u:=1 to n do
      for i:=0 to k do D[u,i]:=maxValue;
    D[1,0]:=0; Front:=nil; Push(1,0,D[1,0]);
    repeat
      Q:=Pop; u:=Q^.u; i:=Q^.i; c:=Q^.c; Dispose(Q);
      if (c<=D[u,i]) then
        begin
          P:=A[u];
          while (P<>nil) do
            begin
              v:=P^.info; c:=P^.value;
              for j:=i to k do
                begin
                  if (D[v,j]>D[u,i]+c) then
                    begin
                      D[v,j]:=D[u,i]+c;
                      Push(v,j,D[v,j]);
                    end;
                  c:=c/2;
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
  Greedy;
  Write(D[n,k]:0:2);
  Close(Input); Close(Output);
End.