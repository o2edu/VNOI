{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program V8ORG;
Const
  maxN =10000;
Type
  PNode =^TNode;
  TNode =Record
    info :LongInt;
    Link :PNode;
  end;
Var
  n,k,res :LongInt;
  A :Array[1..maxN] of PNode;

  procedure Install(u,v :LongInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    u,v :LongInt;
  begin
    Read(k); Read(n);
    for u:=1 to n do A[u]:=nil;
    for v:=2 to n do
      begin
        Read(u); Install(u,v);
      end;
    res:=0;
  end;

  function Visit(u :LongInt) :LongInt;
  var
    P :PNode;
    v,tmp :LongInt;
  begin
    tmp:=1; P:=A[u];
    while (P<>nil) do
      begin
        v:=P^.info;
        Inc(tmp,Visit(v));
        P:=P^.Link;
      end;
    if (tmp>=k) then
      begin
        Inc(res); tmp:=0;
      end;
    Exit(tmp);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Visit(1);
  Write(res);
  Close(Input); Close(Output);
End.