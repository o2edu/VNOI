{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program KGSS;
Uses Math;
Const
  maxN =100000;
Type
  TNode =Record id,ans: LongInt end;
Var
  n,m :LongInt;
  A :Array[1..maxN] of LongInt;
  IT :Array[1..4*maxN] of TNode;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  function CombineIT(ITLeft,ITRight :TNode) :TNode;
  begin
    if (ITLeft.ans>ITRight.ans) then Exit(ITLeft) else Exit(ITRight);
  end;

  procedure BuildIT(key,left,right :LongInt);
  var
    mid :LongInt;
  begin
    if (left=right) then
      with (IT[key]) do
        begin
          id:=left; ans:=A[left]; Exit;
        end;
    mid:=(left+right) div 2;
    BuildIT(key*2,left,mid);
    BuildIT(key*2+1,mid+1,right);
    IT[key]:=CombineIT(IT[key*2],IT[key*2+1]);
  end;

  procedure UpdateIT(key,left,right,i,v :LongInt);
  var
    mid :LongInt;
  begin
    if (right<i) or (i<left) then Exit;
    if (left=i) and (right=i) then
      with (IT[key]) do
        begin
          id:=i; ans:=v; Exit;
        end;
    mid:=(left+right) div 2;
    UpdateIT(key*2,left,mid,i,v);
    UpdateIT(key*2+1,mid+1,right,i,v);
    IT[key]:=CombineIT(IT[key*2],IT[key*2+1]);
  end;

  function SearchIT(key,left,right,first,last :LongInt) :TNode;
  var
    mid :LongInt;
  begin
    if (left>right) or (right<first) or (last<left) then
      with (SearchIT) do
        begin
          id:=0; ans:=0; Exit;
        end;
    if (first<=left) and (right<=last) then Exit(IT[key]);
    mid:=(left+right) div 2;
    Exit(CombineIT(SearchIT(key*2,left,mid,first,last),
                   SearchIT(key*2+1,mid+1,right,first,last)));
  end;

  procedure SolveIT;
  var
    i,x,y :LongInt;
    ch :Char;
    R1,R2,R3 :TNode;
  begin
    ReadLn(m);
    for i:=1 to m do
      begin
        ReadLn(ch,x,y);
        if (ch='U') then UpdateIT(1,1,n,x,y)
        else
          begin
            R1:=SearchIT(1,1,n,x,y);
            R2:=SearchIT(1,1,n,x,R1.id-1);
            R3:=SearchIT(1,1,n,R1.id+1,y);
            WriteLn(R1.ans+Max(R2.ans,R3.ans));
          end;
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