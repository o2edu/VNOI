{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBBISHOP;
Const
  maxN =200;
  maxMove =4;
  X :Array[1..4] of ShortInt=(1,1,-1,-1);
  Y :Array[1..4] of ShortInt=(1,-1,1,-1);
Type
  PNode =^TNode;
  TNode =Record
    xx,yy :Byte;
    Link :PNode;
  end;
Var
  m,n,x1,y1,x2,y2 :Byte;
  A :Array[0..maxN+1,0..maxN+1] of Byte;
  F :Array[1..maxN,1..maxN] of SmallInt;
  Front,Rear :PNode;

  procedure Enter;
  var
    i,u,v :Byte;
  begin
    Read(n,m,x1,y1,x2,y2);
    for i:=0 to n+1 do
      begin
        A[0,i]:=2; A[n+1,i]:=2;
        A[i,0]:=2; A[i,n+1]:=2;
      end;
    for i:=1 to m do
      begin
        Read(u,v); A[u,v]:=2;
      end;
    for u:=1 to n do
      for v:=1 to n do F[u,v]:=0;
  end;

  function Empty :Boolean;
  begin
    Exit(Front=nil);
  end;

  procedure Push(i,j :Byte);
  var
    P :PNode;
  begin
    New(P); P^.xx:=i; P^.yy:=j; P^.Link:=nil;
    if (Front=nil) then Front:=P else Rear^.Link:=P;
    Rear:=P;
  end;

  function Pop :PNode;
  begin
    Pop:=Front; Front:=Front^.Link;
  end;

  procedure Visit(u,v,i :Byte);
  var
    ui,vi :Byte;
  begin
    ui:=u; vi:=v;
    while (A[ui,vi]<2) do
      begin
        if (A[ui,vi]=0) then
          begin
            Push(ui,vi);
            F[ui,vi]:=F[u,v]+1;
            A[ui,vi]:=1;
          end;
        if (ui=x2) and (vi=y2) then
          begin
            Write(F[ui,vi]);
            Close(Output);
            Halt;
          end;
        Inc(ui,X[i]); Inc(vi,Y[i]);
      end;
  end;

  procedure Solve;
  var
    P :PNode;
    i,u,v :Byte;
  begin
    Front:=nil; Push(x1,y1); A[x1,y1]:=1;
    repeat
      P:=Pop; u:=P^.xx; v:=P^.yy; Dispose(P);
      for i:=1 to maxMove do Visit(u,v,i);
    until (Empty);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(-1);
  Close(Input); Close(Output);
End.