{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBSEQ;
Uses Math;
Const
  maxN =1000;
  maxK =50; 
Var
  n :Integer;
  k,x,y :Byte;
  A :Array[1..maxN] of Integer;
  F :Array[0..1,0..maxK] of Integer;

  procedure Enter;
  var
    i :Integer;
  begin
    Read(n,k);
    for i:=1 to n do
      begin
        Read(A[i]); A[i]:=A[i] mod k;
      end;
  end;

  function Sub(i,j :Integer) :Integer;  
  var
    tmp :Integer; 
  begin
    tmp:=i-j;
    if (tmp<0) then Inc(tmp,k);
    Sub:=tmp;
  end;

  procedure Optimize;
  var
    i :Integer;
    j :Byte;
  begin
    for i:=1 to k-1 do F[0,i]:=-n-1;
    F[0,0]:=0;
    x:=0; y:=1;
    for i:=1 to n do
      begin
        for j:=0 to k-1 do
          F[y,j]:=Max(F[x,j],F[x,Sub(j,A[i])]+1);
        x:=1-x; y:=1-y;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[x,0]);
  Close(Input); Close(Output);
End.