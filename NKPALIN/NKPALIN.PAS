{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKPALIN;
Const
  maxN =2000;
Var
  n :Integer;
  A,B :AnsiString;
  F :Array[0..1,0..maxN] of AnsiString;
  x,y :Byte;

  procedure Enter;
  var
    i :Integer;
  begin
    ReadLn(A); n:=Length(A); B:='';
    for i:=n downto 1 do B:=B+A[i];
  end;

  function Max(X,Y :AnsiString) :AnsiString;
  begin
    if (Length(Y)>Length(X)) then Max:=Y else Max:=X;
  end;

  procedure Optimize;
  var
    i,j :Integer;
  begin
    x:=0; y:=1;
    FillChar(F[x],SizeOf(F[x]),0);
    for i:=1 to n do
      begin
        for j:=1 to n do
          if (A[i]=B[j]) then F[y,j]:=F[x,j-1]+B[j]
          else
            F[y,j]:=Max(F[x,j],F[y,j-1]);
        x:=1-x; y:=1-y;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[x,n]);
  Close(Input); Close(Output);
End.