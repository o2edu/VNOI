{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LINEGAME;
Uses Math;
Const
  maxN =1000000;
Var
  n :LongInt;
  A :Array[1..maxN] of SmallInt;
  fp1,fs1 :Int64;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  procedure Optimize;
  var
    i :LongInt;
    fp2,fs2 :Int64;
  begin
    fp1:=A[1]; fs1:=0;
    for i:=2 to n do
      begin
        fp2:=Max(fs1+A[i],fp1);
        fs2:=Max(fp1-A[i],fs1);
        fp1:=fp2; fs1:=fs2;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(Max(fp1,fs1));
  Close(Input); Close(Output);
End.