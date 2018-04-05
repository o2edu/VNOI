{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program QBBUILD;
Const
  maxN =100;
  maxC =1000000001;
Var
  n :Byte;
  A :Array[1..maxN,1..maxN] of LongInt;
  F :Array[1..4] of Byte;
  res :LongInt;

  procedure Enter;
  var
    i,u,v :Byte;
  begin
    Read(n);
    for i:=1 to 4 do Read(F[i]);
    for u:=1 to n do
      for v:=1 to n do
        if (u=v) then A[u,v]:=0 else A[u,v]:=maxC;
    while not EoF do
      begin
        ReadLn(u,v,A[u,v]);
        A[v,u]:=A[u,v];
      end;
  end;

  procedure Optimize;
  var
    k,u,v :Byte;
  begin
    for k:=1 to n do
      for u:=1 to n do
        for v:=1 to n do
          if (A[u,v]>A[u,k]+A[k,v]) then A[u,v]:=A[u,k]+A[k,v];
  end;

  procedure Solve;
  var
    u,v,i,j,k :Byte;
    tmp :LongInt;
  begin
    res:=maxC;
    for u:=1 to n do
      for v:=u to n do
        for i:=1 to 3 do
          for j:=i+1 to 4 do
            begin
              tmp:=A[F[i],u]+A[F[j],u]+A[u,v];
              for k:=1 to 4 do
                if (k<>i) and (k<>j) then Inc(tmp,A[F[k],v]);
              if (res>tmp) then res:=tmp;
            end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.