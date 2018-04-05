{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKPATH;
Uses Math;
Const
  base =1000000000;
Var
  n,m :Byte;
  A,F :Array[1..100,1..100] of LongInt;

  procedure Enter;
  var
    i,j :Byte;
  begin
    ReadLn(n,m);
    for i:=1 to n do
      for j:=1 to m do read(A[i,j]);
  end;

  function GCD(x,y :LongInt) :LongInt;
  var
    tmp :LongInt;
  begin
    while (y>0) do
      begin
        tmp:=x mod y; x:=y; y:=tmp;
      end;
    GCD:=x;
  end;

  procedure Optimize;
  var
    i,j,x,y :Byte;
  begin
    for i:=1 to n do F[i,1]:=1;
    for i:=1 to n do
      for j:=1 to m-1 do
        begin
          for x:=1 to i do
            for y:=1 to j-1 do
              if (GCD(A[i,j],A[x,y])>1) then
                F[i,j]:=(F[i,j]+F[x,y]) mod base;
          for x:=1 to i-1 do
            if (GCD(A[i,j],A[x,j])>1) then
              F[i,j]:=(F[i,j]+F[x,j]) mod base;
        end;
    for i:=1 to n do
      for x:=1 to i do
        for y:=1 to m-1 do
          if (GCD(A[i,m],A[x,y])>1) then
            F[i,m]:=(F[i,m]+F[x,y]) mod base;
  end;

  procedure Escape;
  var
    i :Byte;
    res :LongInt;
  begin
    res:=0;
    for i:=1 to n do res:=(res+F[i,m]) mod base;
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