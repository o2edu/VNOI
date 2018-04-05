{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKINV;
Const
  maxN =60000;
  maxV =60000;
Var
  n,ans :LongInt;
  A :Array[0..maxN] of LongInt;
  BIT :Array[0..maxV] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  procedure UpdateBIT(i :LongInt);
  begin
    while (i<=maxV) do
      begin
        Inc(BIT[i]);
        Inc(i,i and (-i));
      end;
  end;

  function SearchBIT(i :LongInt) :LongInt;
  var
    res :LongInt;
  begin
    res:=0;
    while (i>0) do
      begin
        Inc(res,BIT[i]);
        Dec(i,i and (-i));
      end;
    Exit(res);
  end;

  procedure SolveBIT;
  var
    i :LongInt;
  begin
    FillChar(BIT,SizeOf(BIT),0);
    ans:=0;
    for i:=n downto 1 do
      begin
        Inc(ans,SearchBIT(A[i]-1));
        UpdateBIT(A[i]);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  SolveBIT;
  Write(ans);
  Close(Input); Close(Output);
End.