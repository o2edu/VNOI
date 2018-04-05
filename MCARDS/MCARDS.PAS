{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MCARDS;
Uses Math;
Const
  maxN =4;
  maxM =100;
Var
  n,m :Byte;
  A,F :Array[1..maxN*maxM] of SmallInt;
  B,C :Array[1..maxN*maxM] of Byte;
  D :Array[1..maxN] of Byte;
  Free :Array[1..maxN] of Boolean;
  res,count :SmallInt;

  procedure Enter;
  var
    i :SmallInt;
  begin
    Read(n,m);
    for i:=1 to n*m do Read(B[i],C[i]);
    FillChar(Free,maxN,true);
    res:=0;
  end;

  procedure Init;
  var
    i :SmallInt;
  begin
    for i:=1 to n*m do A[i]:=D[B[i]]*1000+C[i];
  end;

  function BS(i :SmallInt) :SmallInt;
  var
    left,right,mid :SmallInt;
  begin
    left:=1; right:=count;
    while (left<right) do
      begin
        mid:=(left+right) div 2;
        if (A[F[mid]]<A[i]) then left:=mid+1 else right:=mid;
      end;
    Exit(left);
  end;

  procedure Optimize;
  var
    i :SmallInt;
  begin
    F[1]:=1; count:=1;
    for i:=2 to n*m do
      if (A[i]>A[F[count]]) then
        begin
          Inc(count); F[count]:=i;
        end
      else F[BS(i)]:=i;
    res:=Max(res,count);
  end;

  procedure Back(i :Byte);
  var
    j :Byte;
  begin
    for j:=1 to n do
      if (Free[j]) then
        begin
		  D[i]:=j;
		  Free[j]:=false;
          if (i=n) then
            begin
              Init; Optimize;
            end
          else Back(i+1);
          Free[j]:=true;
        end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Back(1);
  Write(n*m-res);
  Close(Input); Close(Output);
End.