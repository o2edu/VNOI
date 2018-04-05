{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program GONDOR;
Const
  maxN =100;
  maxXY =1000;
  maxValue =100000001;
Type
  PNode =^TNode;
  TNode =Record
    info :ShortInt;
    Link :PNode;
  end;
Var
  n :ShortInt;
  A,B :Array[1..maxN] of PNode;
  C :Array[1..maxXY,1..maxXY] of Real;
  D :Array[0..maxN] of Real;
  S :Array[1..maxN] of SmallInt;
  X,Y :Array[1..maxN] of SmallInt;
  Free :Array[1..maxN] of Boolean;

  procedure Install(u,v :ShortInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.Link:=nil;
    if (A[u]=nil) then A[u]:=P else B[u]^.Link:=P;
    B[u]:=P;
  end;

  procedure Enter;
  var
    P :PNode;
    u,v,i :ShortInt;
  begin
    Read(n);
    for u:=1 to n do A[u]:=nil;
    for u:=1 to n do
      begin
        Read(X[u],Y[u],S[u]);
        for i:=1 to n-1 do
          begin
            Read(v); Install(u,v);
          end;
      end;
    for u:=1 to n do
      begin
        P:=A[u];
        while (P<>nil) do
          begin
            v:=P^.info;
            C[u,v]:=Sqrt(Sqr(X[u]-X[v])+Sqr(Y[u]-Y[v]));
            P:=P^.Link;
          end;
      end;
    for u:=0 to n do D[u]:=maxValue; D[1]:=0;
    FillChar(Free,n,true);
  end;

  procedure Greedy;
  var
    P :PNode;
    u,v :ShortInt;
  begin
    repeat
      u:=0;
      for v:=1 to n do
        if (Free[v]) and (D[u]>D[v]) then u:=v;
      if (u=0) then Break;
      Free[u]:=false; 
	  P:=A[u];
      while (P<>nil) and (S[u]>0) do
        begin
          v:=P^.info;
          if (D[u]<D[v]) then Dec(S[u]);
          if (Free[v]) and (D[v]>D[u]+C[u,v]) then D[v]:=D[u]+C[u,v];
          P:=P^.Link;
        end;
    until false;
  end;

  procedure Escape;
  var
    u :ShortInt;
  begin
    for u:=1 to n do WriteLn(D[u]:0:6);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Greedy;
  Escape;
  Close(Input); Close(Output);
End.