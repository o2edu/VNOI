{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program AMSSEQ;
Uses Math;
Var
  n,k,maxV :LongInt;
  A,F :Array[0..10000] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(n,k);
    for i:=1 to n do Read(A[i]);
  end;

  procedure Optimize;
  var 
    i,j :LongInt;
  begin
    F[0]:=0; maxV:=0;
    for i:=1 to n do
      begin
        F[i]:=F[i-1]+A[i];
        for j:=i-2 downto i-k do
          if (j>=0) then F[i]:=Max(F[i],F[j]+A[i]) else Break;
        if (F[i]>maxV) then maxV:=F[i];
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Write(maxV);
  Close(Input); Close(Output);
End.