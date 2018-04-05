{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MTWALK;
Uses Math;
Const
  maxMove =4;
  X :Array[1..maxMove] of ShortInt=(0,0,-1,1);
  Y :Array[1..maxMove] of ShortInt=(1,-1,0,0);
  maxN =100;
Var
  n,minV,maxV,res :ShortInt;
  A :Array[1..maxN,1..maxN] of ShortInt;

  procedure Enter; 
  var
    i,j :ShortInt;
  begin
    Read(n); minV:=110; maxV:=0;
    for i:=1 to n do
      for j:=1 to n do
        begin
          Read(A[i,j]);
          minV:=Min(minV,A[i,j]);
          maxV:=Max(maxV,A[i,j]);
        end;
  end;

  function Check(l,r :ShortInt) :Boolean;
  var
    ok :Boolean;
    Free :Array[1..maxN,1..maxN] of Boolean;
	
    procedure Visit(u,v :ShortInt);
    var
      i,xx,yy :ShortInt;
    begin
      if (u=n) and (v=n) then
        begin
          ok:=true; Exit;
        end;
      Free[u,v]:=false;
      for i:=1 to maxMove do
        begin
          xx:=u+X[i]; yy:=v+Y[i];
          if (xx>0) and (xx<=n) and
             (yy>0) and (yy<=n) and
             (A[xx,yy]>=l) and (A[xx,yy]<=r) and
             (Free[xx,yy]) then Visit(xx,yy);
          if (ok) then Exit;
        end;
    end;
	
  begin
    FillChar(Free,SizeOf(Free),true);
    ok:=false;
    Visit(1,1);
    Exit(ok);
  end;

  procedure Solve;
  var
    i,left,right,mid :ShortInt;
  begin
    res:=maxV-minV;
    for i:=minV to A[1,1] do
      begin
        left:=0; right:=res;
        while (left<right) do
          begin
            mid:=(left+right) div 2;
            if (Check(i,i+mid)) then right:=mid else left:=mid+1;
          end;
        res:=left;
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