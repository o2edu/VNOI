{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program ROBOCON;
Const
  maxN =500;
  X :Array[1..6] of ShortInt=(0,1,1,0,1,1);
  Y :Array[1..6] of ShortInt=(1,1,0,-1,-1,0);
Type
  PNode =^TNode;
  TNode =Record
    u,v :SmallInt;
    Link :PNode;
  end;
Var
  n :SmallInt;
  A :Array[0..maxN+1,0..maxN+1] of LongInt;
  B :Array[0..maxN+1,0..maxN+1] of LongInt;
  Front,Rear :PNode;
  res :LongInt;

  procedure Enter;
  var
    i,k,u,v :SmallInt;
  begin
    Read(n,k);
    for u:=1 to n do
      for v:=1 to n do
        begin
          A[u,v]:=0; B[u,v]:=0;
        end;
    for u:=1 to n+1 do
      begin
        A[u,n+1]:=-1; B[u,0]:=-1;
      end;
    for v:=1 to n do
      begin
        A[n+1,v]:=-1; B[n+1,v]:=-1;
      end;
    for i:=1 to k do
      begin
        Read(u,v); A[u,v]:=-1; B[u,v]:=-1;
      end;
  end;

  procedure Push(u,v :SmallInt);
  var
    P :PNode;
  begin
    New(P); P^.u:=u; P^.v:=v; P^.Link:=nil;
    if (Front=nil) then Front:=P else Rear^.Link:=P;
    Rear:=P;
  end;

  function Pop :PNode;  
  begin
    Pop:=Front; Front:=Front^.Link;
  end;

  procedure Solve;
  var
    P :PNode;
    i,j,tmp,d1,d2,u,v,ux,vy :SmallInt;
  begin
    Front:=nil; Push(1,1); Push(1,n); res:=0; d1:=1; d2:=1;
    repeat
      Inc(res); tmp:=0;
      for i:=1 to d1 do
        begin
          P:=Pop; u:=P^.u; v:=P^.v; Dispose(P);
          for j:=1 to 3 do
            begin
              ux:=u+X[j]; vy:=v+Y[j];
              if (A[ux,vy]>=0) and (A[ux,vy]<>res) then
                begin
                  A[ux,vy]:=res;
                  Push(ux,vy);
                  Inc(tmp);
                end;
            end;
        end;
      d1:=tmp; tmp:=0;
      for i:=1 to d2 do
        begin
          P:=Pop; u:=P^.u; v:=P^.v; Dispose(P);
          for j:=4 to 6 do
            begin
              ux:=u+X[j]; vy:=v+Y[j];
              if (B[ux,vy]>=0) then
                begin
                  if (A[ux,vy]=res) then Exit;
                  if (B[ux,vy]<>res) then
                    begin
                      B[ux,vy]:=res;
                      Push(ux,vy);
                      Inc(tmp);
                    end;
                end;
            end;
        end;
      d2:=tmp;
    until (Front=nil);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.