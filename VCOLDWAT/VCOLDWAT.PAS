{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VCOLDWAT;
Type 
  Note =Record info :Boolean; left,right :LongInt end;
Var 
  n,m,first,last :LongInt;
  A :Array[1..100000] of Note;
  F,Queue :Array[1..100000] of LongInt;

  procedure Enter;
  var     
    i,x,y,z :LongInt;
  begin
    ReadLn(n,m);
    for i:=1 to n do
      begin
        A[i].info:=true;
        A[i].right:=0;
        A[i].left:=0;
      end;
    for i:=1 to m do
      begin
        ReadLn(x,y,z);
        A[x].right:=y; A[x].left:=z;
        A[y].info:=false; A[z].info:=false;
     end;
  end; 

  procedure Push(i :LongInt);
  begin
    Inc(last); Queue[last]:=i;
  end;

  function Pop :LongInt;
  begin
    Pop:=Queue[first]; Inc(first);
  end;

  procedure BFS;
  var     
    i :LongInt;
  begin
    FillChar(F,SizeOf(F),0);
    last:=0; first:=1;
    for i:=1 to n do
      if (A[i].info) then
        begin
          Push(i); F[i]:=1;
        end;
    repeat
      i:=Pop;
      if (A[i].right<>0) then
        begin
          Push(A[i].right); F[A[i].right]:=F[i]+1;
        end;
      if (A[i].left<>0) then
        begin
          Push(A[i].left); F[A[i].left]:=F[i]+1;
        end;
    until (first>last);
  end;

  procedure Escape;
  var     
    i :LongInt;
  begin
    for i:=1 to n do WriteLn(F[i]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  BFS; 
  Escape;
  Close(Input); Close(Output);
End.