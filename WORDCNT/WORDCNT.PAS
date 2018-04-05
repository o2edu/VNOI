{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program WORDCNT;
Uses Math;
Const
  maxN =1000;
Var
  test :ShortInt;
  S :String;
  A :Array[0..maxN] of ShortInt;
  n,res :SmallInt;

  procedure Init;
  var
    i :SmallInt;
  begin
    FillChar(A,SizeOf(A),0);
    i:=0; A[0]:=0;
    while (S[1]=' ') and (S<>'') do Delete(S,1,1);
    while (S[Length(S)]=' ') and (S<>'') do Delete(S,Length(S),1);
    while (S<>'') do
      begin
        while (S[1]=' ') and (S<>'') do Delete(S,1,1);
        Inc(i);
        while (S[1]<>' ') and (S<>'') do
          begin
            Inc(A[i]); Delete(S,1,1);
          end;
      end;
    n:=i;
  end;

  procedure Solve; 
  var
    count,i :SmallInt;
  begin
    res:=0; count:=0;
    for i:=1 to n do
      if (A[i]=A[i-1]) then Inc(count)
      else
        begin
          res:=Max(res,count); count:=1;
        end;
    res:=Max(res,count);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  ReadLn(test);
  while (test>0) do
    begin
      Dec(test);
      ReadLn(S);
      Init;
      Solve;
      WriteLn(res);
    end;
  Close(Input); Close(Output);
End.