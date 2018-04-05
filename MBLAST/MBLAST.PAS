{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MBLAST;
Uses Math;
Const
  maxNM =2000;
Var
  A,B :AnsiString;
  n,m :Integer;
  k :Byte;
  F :Array[0..maxNM,0..maxNM] of LongInt;

  procedure Enter;
  begin
    ReadLn(A); n:=Length(A);
    ReadLn(B); m:=Length(B);
    Read(k);
  end;

  procedure Optimize;
  var
    i,j :Integer;
  begin
    for i:=1 to n do F[i,0]:=k*i;
    for i:=1 to m do F[0,i]:=k*i;
    for i:=1 to n do
      for j:=1 to m do
        F[i,j]:=Min(Min(F[i-1,j]+k,F[i,j-1]+k),
                    F[i-1,j-1]+Abs(Ord(A[i])-Ord(B[j])));
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[n,m]);
  Close(Input); Close(Output);
End.