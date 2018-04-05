{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program SPSEQ;
Uses Math;
Const
  maxN =100000;
Type
  Matrix =Array[1..maxN] of LongInt;
Var
  n :LongInt;
  A,F1,F2,L1,L2 :Matrix;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  function BS(i,j :LongInt; var F :Matrix) :LongInt;
  var
    left,right,mid :LongInt;
  begin
    left:=1; right:=j;
    while (left<right) do
      begin
        mid:=(left+right) div 2;
        if (A[F[mid]]<A[i]) then left:=mid+1 else right:=mid;
      end;
    Exit(left);
  end;

  procedure Optimize;
  var
    i,j,res :LongInt;
  begin
    F1[1]:=1; L1[1]:=1; res:=1;
    for i:=2 to n do
      if (A[i]>A[F1[res]]) then
        begin
          Inc(res); F1[res]:=i; L1[i]:=res;
        end
      else
        begin
          j:=BS(i,res,F1); F1[j]:=i; L1[i]:=j;
        end;
    F2[1]:=n; L2[n]:=1; res:=1;
    for i:=n-1 downto 1 do
      if (A[i]>A[F2[res]]) then
        begin
          Inc(res); F2[res]:=i; L2[i]:=res;
        end
      else
        begin
          j:=BS(i,res,F2); F2[j]:=i; L2[i]:=j;
        end;
  end;

  procedure Escape;
  var
    i,res :LongInt;
  begin
    res:=0;
    for i:=1 to n do res:=Max(res,2*Min(L1[i],L2[i])-1);
    Write(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Escape;
  Close(Input); Close(Output);
End.