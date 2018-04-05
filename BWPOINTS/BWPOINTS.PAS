{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program BWPOINTS;
Uses Math;
Var
  n :LongInt;
  A :Array[1..200000] of LongInt;
  Kind :Array[1..200000] of Byte;
  Free :Array[1..200000] of Boolean;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(n);
    for i:=1 to n do
      begin
        Read(A[i]); Kind[i]:=1;
      end;
    for i:=n+1 to 2*n do
      begin
        Read(A[i]); Kind[i]:=2;
      end;
  end;

  procedure Swap(i,j :LongInt);
  var
    tmp :LongInt;
  begin
    tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
    tmp:=Kind[i]; Kind[i]:=Kind[j]; Kind[j]:=tmp;
   end;

  procedure QSort(l,r :LongInt);
  var
    i,j,k :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; k:=A[(l+r) div 2];
    repeat
      while (A[i]<k) do Inc(i);
      while (A[j]>k) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then Swap(i,j);
          Inc(i); Dec(j);
        end;
    until (i>j);
    QSort(l,j); QSort(i,r);
  end;

  procedure Optimize;
  var
    i,res :LongInt;
  begin
    FillChar(Free,2*n,true); res:=0;
    for i:=2 to 2*n do
      if (Kind[i]<>Kind[i-1]) and (Free[i-1]) then
        begin
          Inc(res); Free[i]:=false;
        end;
    Write(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  QSort(1,2*n); 
  Optimize;
  Close(Input); Close(Output);
End.