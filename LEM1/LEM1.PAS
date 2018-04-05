{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program LEM1;
Uses Math;
Const
  maxN =10000;
Var
  n :SmallInt;
  R :Array[1..maxN] of Real;
  res :Real;

  procedure Enter;
  var
    i :SmallInt;
  begin
    Read(n);
    for i:=1 to n do Read(R[i]);
  end;

  function Cal(a,b,c :Real) :Real;
  begin
    Exit(Arccos((a*a+b*b-c*c)/(2*a*b)));
  end;

  function Check(k :Real) :Real;
  var
    i :SmallInt;
    corner :Real;
  begin
    corner:=Cal(R[n]+k,R[1]+k,R[n]+R[1]);
    for i:=2 to n do
      corner:=corner+Cal(R[i-1]+k,R[i]+k,R[i-1]+R[i]);
    Exit(corner);
  end;

  procedure Solve;
  var
    i :SmallInt;
    left,right,mid,corner :Real;
  begin
    left:=0; right:=0;
    for i:=1 to n do right:=right+R[i];
    mid:=(left+right)/2;
    while (left<>mid) and (right<>mid) do
      begin
        corner:=Check(mid);
        if (corner=2*pi) then Break;
        if (corner>2*pi) then left:=mid else right:=mid;
        mid:=(left+right)/2;
      end;
    res:=mid;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res:0:3);
  Close(Input); Close(Output);
End.