{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program AREA;
Uses Math;
Const
  maxN =10000;
Type
  TData =Record x,t,d,kind :LongInt end;
  TNode =Record count,leng :LongInt end;
Var
  n,k,res :LongInt;
  A :Array[1..maxN] of TData;
  IT :Array[1..4*maxN] of TNode;

  procedure Enter;
  var
    i,m,x1,y1,x2,y2 :LongInt;
  begin
    Read(n);
    m:=0; k:=0;
    for i:=1 to n do
      begin
        Read(x1,y1,x2,y2);
        Inc(m);
        with (A[m]) do
          begin
            x:=x1; t:=y1+1; d:=y2; kind:=1;
          end;
        Inc(m);
        with (A[m]) do
          begin
            x:=x2; t:=y1+1; d:=y2; kind:=-1;
          end;
        k:=Max(k,y2);
      end;
  end;

  function Compare(U,V :TData) :Boolean;
  begin
    Exit((U.x<V.x) or ((U.x=V.x) and (U.kind<V.kind)));
  end;

  procedure QSort(l,r :LongInt);
  var
    i,j :LongInt;
    Key,Tmp :TData;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; Key:=A[(l+r) div 2];
    repeat
      while (Compare(A[i],Key)) do Inc(i);
      while (Compare(Key,A[j])) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              Tmp:=A[i]; A[i]:=A[j]; A[j]:=Tmp;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    QSort(l,j); QSort(i,r);
  end;

  procedure UpdateIT(key,left,right,first,last,style :LongInt);
  var
    mid :LongInt;
  begin
    if (right<first) or (last<left) then Exit;
    if (first<=left) and (right<=last) then
      with (IT[key]) do
        begin
          Inc(count,style);
          if (style=1) then leng:=right-left+1
          else
            if (count=0) then
              begin
                if (left<right) then
                  leng:=IT[key*2].leng+IT[key*2+1].leng
                else
                  leng:=0;
              end;
          Exit;
        end;
    mid:=(left+right) div 2;
    UpdateIT(key*2,left,mid,first,last,style);
    UpdateIT(key*2+1,mid+1,right,first,last,style);
    if (IT[key].count=0) then
      IT[key].leng:=IT[key*2].leng+IT[key*2+1].leng;
  end;

  procedure SolveIT;
  var
    i :LongInt;
  begin
    res:=0;
    for i:=1 to 2*n do
      begin
        Inc(res,IT[1].leng*(A[i].x-A[i-1].x));
        UpdateIT(1,1,k,A[i].t,A[i].d,A[i].kind);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  QSort(1,2*n);
  SolveIT;
  WriteLn(res);
  Close(Input); Close(Output);
End.