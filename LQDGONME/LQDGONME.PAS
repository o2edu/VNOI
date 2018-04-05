{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LQDGONME;
Uses Math;
Const
  maxM =10;
  maxN =1000;
Var
  m :ShortInt;
  n,res :SmallInt;
  A,D :Array[1..maxM,1..maxN] of SmallInt;
  F :Array[1..maxN] of SmallInt;

  procedure Enter;
  var
    i :ShortInt;
    j :SmallInt;
  begin
    Read(n,m);
    for i:=1 to m do
      for j:=1 to n do
        begin
          Read(A[i,j]); D[i,A[i,j]]:=j;
        end;
  end;

  function Check(i,j :SmallInt) :Boolean;
  var
    k :ShortInt;
  begin
    for k:=2 to m do
      if (D[k,A[1,j]]>D[k,A[1,i]]) then Exit(false);
    Exit(true);
  end;

  procedure Optimize;
  var
    i,j :SmallInt;
  begin
    res:=0;
    for i:=1 to n do
      begin
        F[A[1,i]]:=1;
        for j:=1 to i-1 do
          if (Check(i,j)) then
            F[A[1,i]]:=Max(F[A[1,i]],F[A[1,j]]+1);
        res:=Max(res,F[A[1,i]]);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(res);
  Close(Input); Close(Output);
End.