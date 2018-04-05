{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program NKPOS;
Const
  maxN =200;
Type
  PNode =^TNode;
  TNode =Record
    info :Byte;
    Link :PNode;
  end;
Var
  n :Byte;
  res :LongInt;
  A :Array[1..maxN] of PNode;
  C :Array[1..maxN,1..maxN] of LongInt;
  Head :PNode;
  S :AnsiString;

  procedure Install(u,v :Byte);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    u,v :Byte;
    i,m :LongInt;
  begin
    ReadLn(n,m);
    for u:=1 to n do A[u]:=nil;
    for u:=1 to n do ReadLn;
    FillChar(C,SizeOf(C),0);
    for i:=1 to m do
      begin
        Read(u,v);
        if (C[u,v]=0) then
          begin
            Install(u,v); Install(v,u);
          end;
        Inc(C[u,v]); Inc(C[v,u]);
      end;
  end;

  function Get :Byte;  
  begin
    Exit(Head^.info);
  end;

  procedure Push(u :Byte);
  var
    P :PNode;
  begin
    New(P); P^.info:=u; P^.Link:=Head; Head:=P;
  end;

  function Pop :Byte;
  var
    P :PNode;
  begin
    Pop:=Head^.info; P:=Head^.Link; Dispose(Head); Head:=P;
  end;

  procedure Solve;
  var
    u,v :Byte;
    P :PNode;
    Tmp :String;
    ok :Boolean;
  begin
    Head:=nil; Push(1); res:=0; S:='';
    repeat
      u:=Get; P:=A[u]; ok:=true;
      while (P<>nil) do
        begin
          v:=P^.info;
          if (C[u,v]>0) then
            begin
              Dec(C[u,v]); Dec(C[v,u]);
              ok:=false;
              Push(v);
              Break;
            end;
          P:=P^.Link;
        end;
      if (ok) then
        begin
          Inc(res);
          Str(Pop,Tmp);
          S:=S+Tmp+' ';
        end;
    until (Head=nil);
  end;

  procedure Escape;
  begin
    WriteLn(res-1); WriteLn(S);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Escape;
  Close(Input); Close(Output);
End.