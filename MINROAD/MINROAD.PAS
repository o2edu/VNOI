{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MINROAD;
Uses Math;
Const
  maxN =300000;
  maxValue =1000000001;
Var
  n,res,a,b :LongInt;
  D :Array[1..maxN] of LongInt;
  SumA,SumB :Array[0..maxN] of LongInt;

  procedure Enter;
  var
    i :LongInt;
    j :Byte;
  begin
    Read(n,a,b);
    SumA[0]:=0; 
	SumB[0]:=0;
    for i:=1 to n do
      begin
        Read(D[i],j);
        SumA[i]:=0; 
		SumB[i]:=0;
        if (j=1) then SumA[i]:=1 else SumB[i]:=1;
      end;
  end;

  procedure Sort(l,r :LongInt);
  var
    i,j,key,tmp :LongInt;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; key:=D[(l+r) div 2];
    repeat
      while (D[i]<key) do Inc(i);
      while (D[j]>key) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              tmp:=D[i]; D[i]:=D[j]; D[j]:=tmp;
              tmp:=SumA[i]; SumA[i]:=SumA[j]; SumA[j]:=tmp;
              tmp:=SumB[i]; SumB[i]:=SumB[j]; SumB[j]:=tmp;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    Sort(l,j); Sort(i,r);
  end;

  procedure Init;
  var
    i :LongInt;
  begin
    for i:=1 to n do
      begin
        Inc(SumA[i],SumA[i-1]);
        Inc(SumB[i],SumB[i-1]);
      end;
  end;

  procedure Optimize;
  var
    i,j,loc :LongInt;
  begin
    res:=maxValue; loc:=0;
    for i:=a+b to n do
      for j:=loc+1 to i-(a+b)+1 do
        if (SumA[i]-SumA[j-1]>=a) and (SumB[i]-SumB[j-1]>=b) then
          begin
            res:=Min(res,D[i]-D[j]);
            loc:=j;
          end
        else Break;
    if (res=maxValue) then res:=-1;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Sort(1,n);
  Init;
  Optimize;
  Write(res);
  Close(Input); Close(Output);
End.