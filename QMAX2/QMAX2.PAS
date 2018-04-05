{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QMAX2;
Uses Math;
Const
  maxN =50000;
Var
  n,m,first,last,value,res :LongInt;
  A,ITMax :Array[1..8*maxN] of LongInt;

  procedure BuildIT(key,left,right :LongInt);
  var
    mid :LongInt;
  begin
    Inc(ITMax[key],A[key]);
    Inc(A[key*2],A[key]);
    Inc(A[key*2+1],A[key]);
    A[key]:=0;
    if (right<first) or (left>last) then Exit;
    if (first<=left) and (right<=last) then
      begin
        Inc(ITMax[key],value);
        Inc(A[key*2],value);
        Inc(A[key*2+1],value);
      end
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
    Inc(ITMax[key],A[key]);
    Inc(A[key*2],A[key]);
    Inc(A[key*2+1],A[key]);
    A[key]:=0;
    if (right<first) or (left>last) then Exit;
    if (first<=left) and (right<=last) then res:=Max(res,ITMax[key])
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
    k :Byte;
  begin
    FillChar(ITMax,SizeOf(ITMax),0);
    FillChar(A,SizeOf(A),0);
    Read(n,m);
    for i:=1 to m do
      begin
        Read(k);
        if (k=0) then
          begin
            Read(first,last,value);
            BuildIT(1,1,n);
          end
        else
          begin
            Read(first,last);
            res:=0;
            SearchIT(1,1,n);
            WriteLn(res);
          end;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  SolveIT;
  Close(Input); Close(Output);
End.