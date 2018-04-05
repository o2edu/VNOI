{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program BONUS;
Var
  n,k :Integer;
  A :Array[0..1000,0..1000] of Integer;
  F :Array[0..1000,0..1000] of LongInt;
  res :LongInt;

  procedure Enter;
  var
    i,j :Integer;
  begin
    ReadLn(n,k);
    FillChar(F,SizeOf(F),0);
    for i:=1 to n do
      for j:=1 to n do
        begin
          Read(A[i,j]);
          F[i,j]:=F[i-1,j]+F[i,j-1]-F[i-1,j-1]+A[i,j];
        end;
  end;

  procedure Optimize;
  var
    i,j :Integer;
    tmp :LongInt;
  begin
    res:=0;
    for i:=k to n do
      for j:=k to n do
        begin
          tmp:=F[i,j]-F[i-k,j]-F[i,j-k]+F[i-k,j-k];
          if (tmp>res) then res:=tmp;
        end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Write(res);
  Close(Input); Close(Output);
End.