{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program RIDDLE;
Const
  maxN =100000;
Var
  n,k,res,t :LongInt;
  A,B :Array[1..maxN] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n,k);
    for i:=1 to n do Read(A[i]);
  end;

  procedure Sort(l,r :LongInt);
  var
    i,j,key,tmp :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; key:=B[(l+r) div 2];
    repeat
      while (B[i]<key) do Inc(i);
      while (B[j]>key) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              tmp:=B[i]; B[i]:=B[j]; B[j]:=tmp;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    Sort(l,j); Sort(i,r);
  end;

  function Check(i :LongInt) :Boolean;
  var
    j :LongInt;
    sum :Int64;
  begin
    for j:=1 to i do B[j]:=A[j];
    Sort(1,i);
    sum:=0;
    for j:=1 to i do
      begin
        if (B[j]>sum+1) then Exit(false);
        Inc(sum,B[j]);
        if (sum>=k) then Exit(true);
      end;
    Exit(false);
  end;

  procedure BS;  
  var
    left,right,mid :LongInt;
  begin
    res:=-1; left:=1; right:=n;
    while (left<=right) do
      begin
        mid:=(left+right) div 2;
        if (Check(mid)) then
          begin
            right:=mid-1; res:=mid;
          end
        else left:=mid+1;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(t);
  repeat
    Dec(t);
    Enter;
    BS;
    Writeln(res);
  until (t=0);
  Close(Input); Close(Output);
End.