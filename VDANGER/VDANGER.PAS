{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VDANGER;
Var     
  A :Array[1..10000] of Byte;
  C :Array[1..100,1..100] of LongInt;
  T :Array[1..100,1..100] of Byte;
  n :Byte;
  m :Word;

  procedure Enter;
  var     
    i,j :Word;
  begin
    ReadLn(n,m);
    for i:=1 to m do ReadLn(A[i]);
    for i:=1 to n do
      for j:=1 to n do
        begin 
	      Read(C[i,j]); T[i,j]:=j; 
	    end;
  end;

  procedure Optimize;
  var     
    i,j,k :Byte;
  begin
    for k:=1 to n do
      for i:=1 to n do
        for j:=1 to n do
          if (C[i,j]>C[i,k]+C[k,j]) then
            begin
              C[i,j]:=C[i,k]+C[k,j];
              T[i,j]:=T[i,k];
            end;
  end;

  procedure Escape;
  var     
    i :Word;
    sum :LongInt;
  begin
    sum:=C[1,A[1]]+C[A[m],n];
    for i:=2 to m do sum:=sum+C[A[i-1],A[i]];
    Write(sum);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Escape;
  Close(Input); close(Output);
End.