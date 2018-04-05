{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program C11TRCNT;
Const
  maxN =200;
Var
  n,id :Integer;
  X,Y,D :Array[1..maxN] of LongInt;
  res :LongInt;

  procedure Enter;
  var
    i :Integer;
  begin
    Read(n);
    for i:=1 to n do Read(X[i],Y[i]);
  end;

  function Check(i,j,k :Integer) :Boolean;
  var
    abx,aby,acx,acy :Integer;
  begin
    abx:=X[j]-X[i];
    aby:=Y[j]-Y[i];
    acx:=X[k]-X[i];
    acy:=Y[k]-Y[i];
    Exit(abx*acy<>aby*acx);
  end;

  procedure Solve;
  var
    i,j,k :Integer;
  begin
    FillChar(D,SizeOf(D),0);
    res:=0;
    for i:=1 to n-2 do
      for j:=i+1 to n-1 do
        for k:=j+1 to n do
          if (Check(i,j,k)) then
            begin
              Inc(res); Inc(D[i]); Inc(D[j]); Inc(D[k]);
            end;
  end;

  procedure Escape;
  var
    i :Integer;
  begin
    id:=1;
    for i:=2 to n do
      if (D[id]>D[i]) then id:=i;
    WriteLn(res);
    Write(id);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Escape;
  Close(Input); Close(Output);
End.