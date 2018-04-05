{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program PBCSEQ;
Const
  maxN =100000;
Type
  TSegment =Record x,y :LongInt end;
Var
  n,res :LongInt;
  A :Array[1..maxN] of TSegment;
  F :Array[1..maxN] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do with (A[i]) do Read(x,y);
  end;

  procedure QSort(l,r :LongInt);
  var
   i,j :LongInt;
   Key,Tmp :TSegment;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; Key:=A[(l+r) div 2];
    repeat
      while (A[i].x>Key.x) or ((A[i].x=Key.x) and (A[i].y<Key.y)) do Inc(i);
      while (A[j].x<Key.x) or ((A[j].x=Key.x) and (A[j].y>Key.y)) do Dec(j);
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

  function BSearch(i :LongInt) :LongInt;
  var
    left,right,mid :LongInt;
  begin
    left:=1; right:=res;
    while (left<right) do
      begin
        mid:=(left+right) div 2;
        if (A[i].y>=A[F[mid]].y) then left:=mid+1 else right:=mid;
      end;
    Exit(left);
  end;

  procedure Optimize;
  var
    i :LongInt;
  begin
    F[1]:=1; res:=1;
    for i:=2 to n do
      if (A[i].y>=A[F[res]].y) then
        begin
          Inc(res); F[res]:=i;
        end
      else
        F[BSearch(i)]:=i;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  QSort(1,n);
  Optimize;
  Write(res);
  Close(Input); Close(Output);
End.