{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKLINEUP;
Uses Math;
Const
  maxN =50000;
  oo =1000000;
Var
  n,q,hMax,hMin,first,last :LongInt;
  A :Array[1..maxN] of LongInt;
  ITMax,ITMin :Array[1..4*maxN] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n,q);
    for i:=1 to n do Read(A[i]);
  end;

  procedure BuildIT(key,left,right :LongInt);
  var
    mid :LongInt;
  begin
    if (left=right) then
      begin
        ITMax[key]:=A[left];
        ITMin[key]:=A[left];
      end
    else
      begin
        mid:=(left+right) div 2;
        BuildIT(key*2,left,mid);
        BuildIT(key*2+1,mid+1,right);
        ITMax[key]:=Max(ITMax[key*2],ITMax[key*2+1]);
        ITMin[key]:=Min(ITMin[key*2],ITMin[key*2+1]);
      end;
  end;

  procedure SearchIT(key,left,right :LongInt);
  var
    mid :LongInt;
  begin
    if (left>last) or (right<first) then Exit;
    if (left>=first) and (right<=last) then
      begin
        hMax:=Max(hMax,ITMax[key]);
        hMin:=Min(hMin,ITMin[key]);
      end
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
    for i:=1 to q do
      begin
        Read(first,last);
        hMax:=0; hMin:=oo;
        SearchIT(1,1,n);
        WriteLn(hMax-hMin);
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