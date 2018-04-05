{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBDIVSEQ;
Const
  maxN =100000;
Var
  n,res :LongInt;
  A,F:Array[1..maxN] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  function BS(i :LongInt): LongInt;
  var
    left,right,mid :LongInt; 
  begin
    left:=1; right:=res;
    while (left<right) do
      begin
        mid:=(left+right) div 2;
        if (A[F[mid]]>A[i]) then left:=mid+1 else right:=mid;
      end;
    Exit(left);
  end;

  procedure Optimize;
  var
    i,j,jMax :LongInt;
  begin
    F[1]:=1; res:=1;
    for i:=2 to n do
      if (A[i]<A[F[res]]) then
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