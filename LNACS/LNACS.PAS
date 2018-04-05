{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LNACS;
Uses Math;
Type
  Plate =Array[0..1000] of Integer;
Var
  n,m :Integer;
  x,y,z :Byte;
  A,B :Plate;
  F :Array[0..2] of Plate;

  procedure Enter; 
  var
    i :Integer;
  begin
    ReadLn(n,m);
    for i:=1 to n do ReadLn(A[i]);
    for i:=1 to m do ReadLn(B[i]);
  end;

  procedure Optimize;
  var
    i,j :Integer;
    v,tmp :Byte;
  begin
    x:=0; y:=1; z:=2;
    for i:=1 to m do F[x,i]:=0;
    F[y,0]:=0; v:=0;
    for i:=1 to m do
      begin
        if (A[1]=B[i]) then v:=1;
        F[y,i]:=v;
      end;
    v:=0;
    for i:=2 to n do
      begin
        F[z,0]:=0;
        if (A[i]=B[1]) then v:=1;
        F[z,1]:=v;
        for j:=2 to m do
          if (A[i]=B[j]) then F[z,j]:=F[x,j-2]+1
          else
            F[z,j]:=Max(F[y,j],F[z,j-1]);
        tmp:=x; x:=y; y:=z; z:=tmp;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[y,m]);
  Close(Input); Close(Output);
End.