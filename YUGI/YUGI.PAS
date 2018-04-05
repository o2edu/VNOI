{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program YUGI;
Const
  maxN =200;
  maxV =32767;
Var
  n,k :Byte;
  A :Array[1..maxN,1..maxN] of SmallInt;
  Free :Array[1..maxN] of Boolean;
  ans :SmallInt;

  procedure Enter;
  var
    i,j :Byte;
  begin
    Read(n,k);
    for i:=1 to n do
      for j:=1 to n do Read(A[i,j]);
  end;

  procedure DFSVisit(u :Byte; m :SmallInt);
  var
    v :Byte;
  begin
    Free[u]:=false;
    for v:=1 to n do
      if (A[u,v]<m) and (Free[v]) then DFSVisit(v,m);
  end;

  function Check(m :SmallInt) :Boolean;
  var
    d,u :Byte;
  begin
    d:=0;
    FillChar(Free,SizeOf(Free),true);
    for u:=1 to n do
      if (Free[u]) then
        begin
          Inc(d); DFSVisit(u,m);
        end;
    Exit(d>=k);
  end;

  procedure BS;
  var
    left,right,mid :SmallInt;
  begin
    ans:=0; left:=0; right:=maxV;
    while (left<=right) do
      begin
        mid:=(left+right) div 2;
        if (Check(mid)) then
          begin
            ans:=mid; left:=mid+1;
          end
        else right:=mid-1;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  BS;
  Write(ans);
  Close(Input); Close(Output);
End.