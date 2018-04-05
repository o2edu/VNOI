{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBSTR;
Uses Math;
Const
  maxN =255;
Var
  A,B :String;
  n,m,x,y :Byte;
  F :Array[0..1,0..maxN] of Byte;

  procedure Enter;
  begin
    ReadLn(A); n:=Length(A);
    ReadLn(B); m:=Length(B);
  end;

  procedure Optimize;
  var
    i,j :Byte; 
  begin
    x:=0; y:=1;
    for i:=0 to m do F[x,i]:=0;
    F[y,0]:=0;
    for i:=1 to n do
      begin
        for j:=1 to m do
          if (A[i]=B[j]) then F[y,j]:=F[x,j-1]+1
          else
            F[y,j]:=Max(F[y,j-1],F[x,j]);
        x:=1-x; y:=1-y;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[x,m]);
  Close(Input); Close(Output);
End.