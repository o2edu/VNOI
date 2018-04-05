{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program ADS;
Const
  maxN =2000;
Var
  n,m,res :SmallInt;
  A :Array[1..maxN,1..maxN] of Boolean;
  Free :Array[1..maxN] of Boolean;

  procedure Enter;
  var
    i,u,v :SmallInt;
  begin
    Read(n,m);
    for u:=1 to n do
      for v:=1 to n do A[u,v]:=false;
    for i:=1 to m do
      begin
        Read(u,v); A[u,v]:=true; A[v,u]:=true;
      end;
  end;

  procedure Visit(i :SmallInt);
  var
    j :SmallInt;
  begin
    Free[i]:=false;
    for j:=1 to n do
      if (Free[j]) and (A[i,j]) then Visit(j);
  end;

  procedure Solve;
  var
    i :SmallInt;
  begin
    FillChar(Free,n,true);
    res:=m-n;
    for i:=1 to n do
      if (Free[i]) then
        begin
          Inc(res); Visit(i);
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