{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program MATCH1;
Var
  n,m,count :Byte;
  A :Array[1..100,1..100] of Boolean;
  LinkX,LinkY,Trace,Queue :Array[1..100] of Byte;

  procedure Enter;
  var
    u,v :Byte;
  begin
    FillChar(A,SizeOf(A),false);
    ReadLn(n,m);
    while not Eof do
      begin
        ReadLn(u,v); A[u,v]:=true;
      end;
    FillChar(LinkX,SizeOf(LinkX),0);
    FillChar(LinkY,SizeOf(LinkY),0);
    count:=0;
  end;

  function BFSVisit :Integer;
  var
    i,j,first,last :Byte;
  begin
    Fillchar(Trace,SizeOf(Trace),0);
    last:=0;
    for i:=1 to n do
      if (LinkX[i]=0) then
        begin
          Inc(last); Queue[last]:=i;
        end;
    first:=1;
    while (first<=last) do
      begin
        i:=Queue[first]; Inc(first);
        for j:=1 to m do
          if (Trace[j]=0) and (A[i,j]) then
            begin
              Trace[j]:=i;
              if (LinkY[j]=0) then
                begin
                  Inc(count); Exit(j);
                end;
              Inc(last); Queue[last]:=LinkY[j];
            end;
      end;
    BFSVisit:=0;
  end;

  procedure Update(i :Byte);
  var
    j,cont  :Byte;
  begin
    repeat
      j:=Trace[i];
      cont:=LinkX[j];
      LinkX[j]:=i;
      LinkY[i]:=j;
      i:=cont;
    until (i=0);
  end;
  
  procedure Solve;
  var
    take :Byte;
  begin
    repeat
      take:=BFSVisit;
      if (take<>0) then Update(take);
    until (take=0);
  end;

  procedure Escape;
  var
    i :Byte;
  begin
    WriteLn(count);
    for i:=1 to n do
      if (LinkX[i]<>0) then WriteLn(i,' ',LinkX[i]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Solve; 
  Escape;
  Close(Input); Close(Output);
End.