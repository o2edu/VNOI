{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VMUNCH;
Const
  maxN =100;
  maxMove =4;
  X :Array[1..maxMove] of ShortInt=(-1,0,0,1);
  Y :Array[1..maxMove] of ShortInt=(0,1,-1,0);
Type
  PNode =^TNode;
  TNode =Record
    xx,yy :ShortInt;
    Link :PNode;
  end;
Var
  n,m,s,f :ShortInt;
  A :Array[1..maxN,1..maxN] of Boolean;
  D :Array[1..maxN,1..maxN] of SmallInt;
  Front,Rear :PNode;

  procedure Enter;
  var
    i,j :ShortInt;
    ch :Char;
  begin
    FillChar(A,SizeOf(A),true);
    ReadLn(n,m);
    for i:=1 to n do
      begin
        for j:=1 to m do
          begin
            Read(ch);
            if (ch='C') then
              begin
                s:=i; f:=j; A[s,f]:=false;
              end;
            if (ch='*') then A[i,j]:=false;
          end;
        ReadLn;
      end;
  end;

  function Check(u,v :ShortInt) :Boolean;
  begin
    Exit((u>0) and (u<=n) and (v>0) and (v<=m));
  end;

  function Empty :Boolean;
  begin
    Exit(Front=nil);
  end;

  procedure Push(u,v :ShortInt);
  var
    P :PNode;
  begin
    New(P); P^.xx:=u; P^.yy:=v; P^.Link:=nil;
    if (Front=nil) then Front:=P else Rear^.Link:=P;
    Rear:=P;
  end;

  function Pop :PNode;
  begin
    Pop:=Front; Front:=Front^.Link;
  end;

  procedure Solve;
  var
    i,u,v,ui,vi :ShortInt;
    P :PNode;
  begin
    D[s,f]:=0; D[1,1]:=0; Front:=nil; Push(s,f);
    repeat
      P:=Pop; u:=P^.xx; v:=P^.yy; Dispose(P);
      for i:=1 to maxMove do
        begin
          ui:=u+X[i]; vi:=v+Y[i];
          if (A[ui,vi]) and (Check(ui,vi)) then
            begin
              D[ui,vi]:=D[u,v]+1;
              if (ui=1) and (vi=1) then Exit;
              A[ui,vi]:=false;
              Push(ui,vi);
            end;
        end;
    until (Empty);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(D[1,1]);
  Close(Input); Close(Output);
End.