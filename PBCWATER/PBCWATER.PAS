{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program PBCWATER;
Uses Math;
Const
  maxNM =100;
  maxMove =4;
  X :Array[1..maxMove] of ShortInt=(0,1,0,-1);
  Y :Array[1..maxMove] of ShortInt=(1,0,-1,0);
Var
  n,m :ShortInt;
  A :Array[0..maxNM+1,0..maxNM+1] of SmallInt;
  hMax :SmallInt;
  res :LongInt;

  procedure Enter;
  var
    u,v :ShortInt;
  begin
    Read(n,m); hMax:=0;
    FillChar(A,SizeOf(A),255);
    for u:=1 to n do
      for v:=1 to m do
        begin
          Read(A[u,v]);
          hMax:=Max(hMax,A[u,v]);
        end;
  end;

  procedure Visit(u,v :ShortInt; h :SmallInt);
  var
    i :ShortInt;
  begin
    if (A[u,v]<>h) then Exit;
    A[u,v]:=h+1;
    for i:=1 to maxMove do Visit(u+X[i],v+Y[i],h);
  end;

  procedure Solve;
  var
    h :SmallInt;
    u,v :ShortInt;
  begin
    res:=0;
    for h:=1 to hMax-1 do
      begin
        for u:=1 to m do
          begin
            Visit(1,u,h); Visit(n,u,h);
          end;
        for u:=2 to n-1 do
          begin
            Visit(u,1,h); Visit(u,m,h);
          end;
        for u:=2 to n-1 do
          for v:=2 to m-1 do
            if (A[u,v]=h) then
              begin
                A[u,v]:=h+1; Inc(res);
              end;
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