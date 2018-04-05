{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LIQ;
Const
  maxN =1000; 
  minValue =0; 
  maxValue =10001;
Var
  n,maxV :SmallInt;
  A,F :Array[0..maxN+1] of SmallInt;

  procedure Enter;
  var
    i :SmallInt;
  begin
    ReadLn(n);
    for i:=1 to n do Read(A[i]);
    A[0]:=minValue; A[n+1]:=maxValue;
  end;

  procedure Optimize;
  var
    i,j,jMax :SmallInt;
  begin
    F[n+1]:=1;
    for i:=n downto 0 do
      begin
        jMax:=n+1;
        for j:=n downto i+1 do
          if (A[i]<A[j]) and (F[jMax]<F[j]) then jMax:=j;
        F[i]:=F[jMax]+1;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[0]-2);
  Close(Input); Close(Output);
End.