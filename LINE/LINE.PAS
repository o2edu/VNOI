{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LINE;
Const
  k =4;
  R :Array[1..k] of Integer=(0,0,1,-1);
  C :Array[1..k] of Integer=(1,-1,0,0);

Var 
  n,x1,x2,y1,y2 :Byte;
  A :Array[0..10,0..10] of Boolean;

  procedure Enter;
  var     
    i,j,x :Byte;
  begin
    ReadLn(n,x1,y1,x2,y2);
    for i:=1 to n do
      begin
        A[0,i]:=false; A[i,0]:=false;
        A[n+1,i]:=false; A[i,n+1]:=false;
     end;
    for i:=1 to n do
      begin
        for j:=1 to n do
          begin
            Read(x);
            if (x=1) then A[i,j]:=false else A[i,j]:=true;
         end;
        ReadLn;
     end;
  end; 

  procedure DFS(x,y :Byte);
  var     
    i :Byte; 
  begin
    A[x,y]:=false;
    if (x=x2) and (y=y2) then
      begin
        Write('YES'); Halt;
     end;
    for i:=1 to k do
      if (A[x+R[i],y+C[i]]) then DFS(x+R[i],y+C[i]);
    A[x,y]:=true;
  end;

Begin
  Enter; 
  DFS(x1,y1); 
  Write('NO');
End.