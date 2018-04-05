{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBMAX;
Uses Math;
Const
  minValue =-maxInt;
Var
  n,m :Byte;
  A :Array[1..100,1..100] of SmallInt;
  F :Array[0..101,1..100] of SmallInt;

  procedure Enter;
  var
    i,j :Byte;
  begin
    Read(n,m);
    for i:=1 to n do
      for j:=1 to m do Read(A[i,j]);
  end;

  procedure Optimize;
  var
    i,j :Byte;
  begin
    for i:=1 to n do F[i,1]:=A[i,1];
    for i:=1 to m-1 do
      begin
        F[0,i]:=minValue; F[n+1,i]:=minValue;
      end;
    for j:=2 to m do
      for i:=1 to n do
        F[i,j]:=Max(F[i+1,j-1],Max(F[i,j-1],F[i-1,j-1]))+A[i,j];
  end;

  procedure Escape;
  var
    i :Byte;
    res :Integer;
  begin
    res:=F[1,m];
    for i:=2 to n do
      if (F[i,m]>res) then res:=F[i,m];
    Write(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Escape;
  Close(Input); Close(Output);
End.