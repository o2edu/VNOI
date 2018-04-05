{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program SAFENET2;
Uses Math;
Const
  maxN =30000;
  maxM =100000;
Type
  PNode =^TNode;
  TNode =Record
    info :LongInt;
    id :LongInt;
    Link :PNode;
  end;
Var
  n,count,res :LongInt;
  A :Array[1..maxN] of PNode;
  Mark :Array[-maxM..maxM] of Boolean;
  Num,Low :Array[1..maxN] of LongInt;
  Head :PNode;

  procedure Install(u,v,id :LongInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=v; P^.id:=id; P^.Link:=A[u]; A[u]:=P;
  end;

  procedure Enter;
  var
    i,m :LongInt;
    u,v :LongInt;
  begin
    Read(n,m);
    for i:=1 to m do
      begin
        Read(u,v);
        Install(u,v,i);
        Install(v,u,-i);
      end;
  end;

  procedure Push(u :LongInt);
  var
    P :PNode;
  begin
    New(P); P^.info:=u; P^.Link:=Head; Head:=P;
  end;

  function Pop :LongInt; 
  var
    P :PNode;
  begin
    Pop:=Head^.info; P:=Head^.Link; Dispose(Head); Head:=P;
  end;

  procedure Visit(u :LongInt);
  var
    P :PNode;
    v,tmp,x,y :LongInt;
    id :LongInt;
  begin
    Inc(count); Num[u]:=count; Low[u]:=count; P:=A[u];
    while (P<>nil) do
      begin
        id:=P^.id;
        if (Mark[id]) then
          begin
            Mark[-id]:=false;
            v:=P^.info;
            if (Num[v]>0) then
              Low[u]:=Min(Low[u],Num[v])
            else
              begin
                Push(u); Push(v);
                Visit(v);
                Low[u]:=Min(Low[u],Low[v]);
                if (Low[v]>=Num[u]) then
                  begin
                    tmp:=0;
                    repeat
                      y:=Pop; x:=Pop;
                      Inc(tmp);
                    until (x=u) and (y=v);
                    res:=Max(res,tmp+1);
                  end;
              end;
          end;
        P:=P^.Link;
      end;
  end;

  procedure Solve;
  var
    u,frevCount :LongInt;
  begin
    FillChar(Num,n,0);
    FillChar(Mark,SizeOf(Mark),true);
    count:=0; res:=0; Head:=nil;
    for u:=1 to n do
      if (Num[u]=0) then
        begin
          frevCount:=count;
          Visit(u);
          if (res=0) and (frevCount+1=count) then res:=1;
        end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.