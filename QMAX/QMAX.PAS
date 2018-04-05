{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QMAX;
Uses Math;
Const
  maxN =50000;
Var
  n,p,res,first,last :LongInt;
  A :Array[1..maxN] of LongInt;
  ITMax :Array[1..4*maxN] of LongInt;

  procedure Enter;
  var
    m,i,u,v,k :LongInt;
  begin
    Read(n,m);
    FillChar(A,SizeOf(A),0);
    for i:=1 to m do
      begin
        Read(u,v,k);
        Inc(A[u],k);
        Dec(A[v+1],k);
      end;
    for i:=1 to n do Inc(A[i],A[i-1]);
    Read(p);
  end;

  procedure BuildIT(key,left,right :LongInt);
  var
    mid :LongInt;
  begin
    if (left=right) then ITMax[key]:=A[left]
    else
      begin
        mid:=(left+right) div 2;
        BuildIT(key*2,left,mid);
        BuildIT(key*2+1,mid+1,right);
        ITMax[key]:=Max(ITMax[key*2],ITMax[key*2+1]);
      end;
  end;

  procedure SearchIT(key,left,right :LongInt);
  var
    mid :LongInt;
  begin
    if (left>last) or (right<first) then Exit;
    if (left>=first) and (right<=last) then res:=Max(res,ITMax[key])
    else
      begin
        mid:=(left+right) div 2;
        SearchIT(key*2,left,mid);
        SearchIT(key*2+1,mid+1,right);
      end;
  end;

  procedure SolveIT;
  var
    i :LongInt;
  begin
    for i:=1 to p do
      begin
        Read(first,last);
        res:=0;
        SearchIT(1,1,n);
        WriteLn(res);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  BuildIT(1,1,n);
  SolveIT;
  Close(Input); Close(Output);
End.