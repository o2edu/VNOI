{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LIS;
Const
  maxN =30000;
Var
  n,res :SmallInt;
  A,F :Array[1..maxN] of SmallInt;

  procedure Enter;
  var
    i :SmallInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  function BS(i :SmallInt) :SmallInt;
  var
    left,right,mid :SmallInt;
  begin
    left:=1; right:=res;
    while (left<right) do
      begin
        mid:=(left+right) div 2;
        if (A[F[mid]]<A[i]) then left:=mid+1 else right:=mid;
      end;
    Exit(left);
  end;

  procedure Optimize;
  var
    i :SmallInt;
  begin
    F[1]:=1; res:=1;
    for i:=2 to n do
      if (A[i]>A[F[res]]) then
        begin
          Inc(res); F[res]:=i;
        end
      else F[BS(i)]:=i;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(res);
  Close(Input); Close(Output);
End.