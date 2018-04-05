{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LITES;
Uses Math;
Const
  maxN =100000;
Var
  n,m,first,last :LongInt;
  A :Array[1..4*maxN] of Boolean;
  ITSum :Array[1..4*maxN] of LongInt;

  procedure BuildIT(key,left,right :LongInt);
  var
    mid :LongInt;
  begin
    if (A[key]) then
      begin
        ITSum[key]:=(right-left+1)-ITSum[key];
        A[key]:=false;
        A[key*2]:=not A[key*2];
        A[key*2+1]:=not A[key*2+1];
      end;
    if (left>last) or (right<first) then Exit;
    if (first<=left) and (right<=last) then
      begin
        ITSum[key]:=(right-left+1)-ITSum[key];
        A[key*2]:=not A[key*2];
        A[key*2+1]:=not A[key*2+1];
      end
    else
      begin
        mid:=(left+right) div 2;
        BuildIT(key*2,left,mid);
        BuildIT(key*2+1,mid+1,right);
        ITSum[key]:=ITSum[key*2]+ITSum[key*2+1];
      end;
  end;

  function SearchIT(key,left,right :LongInt) :LongInt;
  var
    mid :LongInt;
  begin
    if (A[key]) then
      begin
        ITSum[key]:=(right-left+1)-ITSum[key];
        A[key]:=false;
        A[key*2]:=not A[key*2];
        A[key*2+1]:=not A[key*2+1];
      end;
    if (left>last) or (right<first) then Exit(0);
    if (first<=left) and (right<=last) then Exit(ITSum[key])
    else
      begin
        mid:=(left+right) div 2;
        Exit(SearchIT(key*2,left,mid)+SearchIT(key*2+1,mid+1,right));
      end;
  end;

  procedure SolveIT;
  var
    i :LongInt;
    k :Byte;
  begin
    Read(n,m);
    FillChar(ITSum,SizeOf(ITSum),0);
    FillChar(A,SizeOf(A),false);
    for i:=1 to m do
      begin
        Read(k,first,last);
        if (k=0) then BuildIT(1,1,n)
        else
          WriteLn(SearchIT(1,1,n));
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  SolveIT;
  Close(Input); Close(Output);
End.