{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program TTRIP;
Uses Math;
Const
  maxN =100;
  maxValue =100000001;
Var
  n :ShortInt;
  A :Array[1..maxN,1..maxN] of LongInt;
  Free :Array[1..maxN] of Boolean;
  res :Int64;

  procedure Enter;
  var
    u,v :ShortInt;
    c :LongInt;
  begin
    Read(n);
    for u:=1 to n do
      for v:=1 to n do
        begin
          Read(c);
          if (c=0) then A[u,v]:=maxValue else A[u,v]:=c;
        end;
  end;

  procedure Optimize;
  var
    u,v,k :ShortInt;
    minV :LongInt;
  begin
    for k:=1 to n do
      for u:=1 to n do
        for v:=1 to n do
          A[u,v]:=Min(A[u,v],A[u,k]+A[k,v]);
    FillChar(Free,n,true); Free[1]:=false;
    res:=0; u:=1;
    repeat
      k:=0; minV:=maxValue;
      for v:=2 to n-1 do
        if (Free[v]) and (minV>A[u,v]) then
          begin
            minV:=A[u,v]; k:=v;
          end;
      if (k=0) then Break;
      Inc(res,minV);
      u:=k;
      Free[u]:=false;
    until false;
    Inc(res,A[u,n]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(res);
  Close(Input); Close(Output);
End.