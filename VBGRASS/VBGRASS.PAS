{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VBGRASS;
Const
  k =4;
  X :Array[1..4] of ShortInt=(1,-1,0,0);
  Y :Array[1..4] of ShortInt=(0,0,1,-1);

Var
  n,m :Byte;
  A :Array[1..101,1..101] of Char;
  Free :Array[1..101,1..101] of Boolean;
  res :Integer;

  procedure Enter;
  var
    i,j :Byte;
  begin
    ReadLn(n,m);
    for i:=1 to n do
      begin
        for j:=1 to m do Read(A[i,j]);
        ReadLn;
      end;
    FillChar(Free,SizeOf(Free),true);
    res:=0;
  end;

  procedure DFS(u,v :Byte);
  var
    i,xx,yy :Byte;
  begin
    Free[u,v]:=false;
    for i:=1 to k do
      begin
        xx:=u+X[i]; yy:=v+Y[i];
        if (Free[xx,yy]) and (A[xx,yy]='#') then DFS(xx,yy);
      end;
  end;

  procedure Process;
  var
    i,j :Byte;
  begin
    for i:=1 to n do
      for j:=1 to m do
        if (Free[i,j]) and (A[i,j]='#') then
          begin
            Inc(res); DFS(i,j);
          end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Process; 
  Write(res);
  Close(Input); Close(Output);
End.