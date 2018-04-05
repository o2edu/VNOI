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
Var
  n,m :SmallInt;
  A :Array[1..maxN,1..maxN] of SmallInt;
  Free :Array[1..maxN,1..maxN] of Boolean;
  res :LongInt;
  ok :Boolean;

  procedure Enter;
  var
    i,j :SmallInt;
  begin
    Read(n,m);
    for i:=1 to n do
      for j:=1 to m do Read(A[i,j]);
  end;

  procedure Visit(u,v :SmallInt);
  var
    i :Byte;
    ui,vi :SmallInt;
  begin
    Free[u,v]:=false;
    for i:=1 to maxMove do
      begin
        ui:=u+X[i]; vi:=v+Y[i];
        if (ui>0) and (ui<=n) and (vi>0) and (vi<=m) then
           begin
            if (ok) and (A[ui,vi]>A[u,v]) then ok:=false;
            if (Free[ui,vi]) and (A[ui,vi]=A[u,v]) then Visit(ui,vi);
          end;
      end; 
  end;

  procedure Solve;
  var
    i,j :SmallInt;
  begin
    FillChar(Free,SizeOf(Free),true);
    res:=0;
    for i:=1 to n do
      for j:=1 to m do
        if (Free[i,j]) then
          begin
            ok:=true;
            Visit(i,j);
            if (ok) then Inc(res);
          end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.