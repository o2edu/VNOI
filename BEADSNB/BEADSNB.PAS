{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program BEADSNB;
Uses Math;
Const
  maxN =100000;
Var
  n,res,ans :LongInt;
  A,F,L1,L2 :Array[1..maxN] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  function BS1(i :LongInt) :LongInt;
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

  function BS2(i :LongInt) :LongInt;
  var
    left,right,mid :LongInt;
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
    i,j :LongInt;
  begin
    F[1]:=n; L1[n]:=1; res:=1;
    for i:=n-1 downto 1 do
      if (A[i]<A[F[res]]) then
        begin
          Inc(res); F[res]:=i; L1[i]:=res;
        end
      else
        begin
          j:=BS1(i); F[j]:=i; L1[i]:=j;
        end;
    F[1]:=n; L2[n]:=1; res:=1;
    for i:=n-1 downto 1 do
      if (A[i]>A[F[res]]) then
        begin
          Inc(res); F[res]:=i; L2[i]:=res;
        end
      else
        begin
          j:=BS2(i); F[j]:=i; L2[i]:=j;
        end;
  end;

  procedure Escape;
  var
    i :LongInt;
  begin
    ans:=0;
    for i:=1 to n do ans:=Max(ans,L1[i]+L2[i]-1);
    Write(ans);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Escape;
  Close(Input); Close(Output);
End.