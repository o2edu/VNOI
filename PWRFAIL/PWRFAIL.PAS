{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program PWRFAIL;
Const
  maxN =1000;
  maxValue =1000000001;
Var
  n :SmallInt;
  X,Y :Array[1..maxN] of Int64;
  C :Array[1..maxN,1..maxN] of Real;
  Free :Array[1..maxN] of Boolean;
  D :Array[1..maxN] of Real;

  procedure Enter;
  var
    w,i,u,v :SmallInt;
    m,tmp :Real;
  begin
    Read(n,w);
    Read(m);
    for u:=1 to n do Read(X[u],Y[u]);
    for u:=1 to n do C[u,u]:=0;
    for u:=1 to n-1 do
      for v:=u+1 to n do
        begin
          tmp:=Sqrt(Sqr(X[u]-X[v])+Sqr(Y[u]-Y[v]));
          if (tmp<=m) then C[u,v]:=tmp else C[u,v]:=maxValue;
          C[v,u]:=C[u,v];
        end;
    for i:=1 to w do
      begin
        Read(u,v); C[u,v]:=0; C[v,u]:=0;
      end;
    FillChar(Free,n,true);
    for u:=0 to n do D[u]:=maxValue; D[1]:=0;
  end;

  procedure Greedy;
  var
    u,v :SmallInt;
  begin
    repeat
      u:=0;
      for v:=1 to n do
        if (Free[v]) and (D[u]>D[v]) then u:=v;
      if (u=0) or (u=n) then Break;
      Free[u]:=false;
      for v:=1 to n do
        if (Free[v]) and (D[v]>D[u]+C[u,v]) then D[v]:=D[u]+C[u,v];
    until false;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Greedy;
  if (D[n]<maxValue) then Write(Trunc(D[n]*1000)) else Write(-1);
  Close(Input); Close(Output);
End.