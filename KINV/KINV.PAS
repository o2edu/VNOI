{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program KINV;
Const
  maxN =10000;
  maxV =10000;
  maxK =10;
  base =1000000000;
Var
  n,k :LongInt;
  A :Array[1..maxN] of LongInt;
  BIT :Array[1..maxV] of LongInt;
  F :Array[1..maxK,1..maxN] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(n,k);
    for i:=1 to n do Read(A[i]);
  end;

  function SearchBIT(i :LongInt) :LongInt;
  var
    res :LongInt;
  begin
    res:=0;
    while (i>0) do
      begin
        res:=(res+BIT[i]) mod base;
        Dec(i,i and (-i));
      end;
    Exit(res);
  end;

  procedure UpdateBIT(i,v :LongInt);
  begin
    while (i<=maxV) do
      begin
        BIT[i]:=(BIT[i]+v) mod base;
        Inc(i,i and (-i));
      end;
  end;

  procedure Optimize;
  var
    i,j :LongInt;
  begin
    for j:=1 to n do F[1,j]:=1;
    for i:=2 to k do
      begin
        for j:=1 to n do BIT[j]:=0;
        for j:=n downto 1 do
          begin
            F[i,j]:=SearchBIT(A[j]-1);
            UpdateBIT(A[j],F[i-1,j]);
          end;
      end;
  end;

  procedure PrintResult;
  var
    i,ans :LongInt;
  begin
    ans:=0;
    for i:=1 to n do ans:=(ans+F[k,i]) mod base;
    Write(ans);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  PrintResult;
  Close(Input); Close(Output);
End.