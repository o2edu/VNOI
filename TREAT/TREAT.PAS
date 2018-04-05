{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program TREAT;
Uses Math;
Const
  maxN =100000;
Type
  PNode =^TNode;
  TNode =Record
    info :LongInt;
    Link :PNode;
  end;
Var
  n,res,count,top :LongInt;
  A :Array[1..maxN] of PNode;
  Free :Array[1..maxN] of Boolean;
  Num,Low,Stack,B,D,F :Array[1..maxN] of LongInt;

  procedure Install(u,v :LongInt);
  var
    P :PNode;
  begin
    if (u=v) then Exit;
    New(P); P^.info:=v; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    u,v :LongInt;
  begin
    Read(n);
    for u:=1 to n do A[u]:=nil;
    for u:=1 to n do
      begin
        Read(v); Install(u,v);
      end;
  end;

  procedure Push(u :LongInt);  
  begin
    Inc(top); Stack[top]:=u;
  end;

  function Pop :LongInt;
  begin
    Pop:=Stack[top]; Dec(top);
  end;

  procedure Visit(u :LongInt);
  var
    P :PNode;
    v :LongInt;
  begin
    Push(u); Inc(count); Num[u]:=count; Low[u]:=count; P:=A[u];
    while (P<>nil) do
      begin
        v:=P^.info;
        if (Free[v]) then
          begin
            if (Num[v]>0) then
              Low[u]:=Min(Low[u],Num[v])
            else
              begin
                Visit(v);
                Low[u]:=Min(Low[u],Low[v]);
              end;
          end;
        P:=P^.Link;
      end;
    if (Low[u]=Num[u]) then
      begin
        Inc(res); D[res]:=0;
        repeat
          v:=Pop;
          B[v]:=res;
          Inc(D[res]);
          Free[v]:=false;
        until (v=u);
      end;
  end;

  procedure Solve;
  var
    u :LongInt;
  begin
    FillChar(Free,n,true);
    FillChar(Num,n,0);
    res:=0; count:=0; top:=0;
    for u:=1 to n do
      if (Num[u]=0) then Visit(u);
  end;

  function GetResult(u :LongInt) :LongInt;
  begin
    if (F[u]=0) then
	  begin
        if (D[B[u]]>1) or ((D[B[u]]=1) and (A[u]=nil)) then F[u]:=D[B[u]]
        else
          F[u]:=GetResult(A[u]^.info)+1;
	  end;
    Exit(F[u]);
  end;

  procedure Escape;
  var
    u :LongInt;
  begin
    FillChar(F,n,0);
    for u:=1 to n do WriteLn(GetResult(u));
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Escape;
  Close(Input); Close(Output);
End.