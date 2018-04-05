{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NUMCON;
Var
  n :Byte;
  A :Array[1..101] of String[100];

  procedure Enter;
  begin
    n:=0;
    while not EoF do
      begin
        Inc(n); ReadLn(A[n]);
      end;
  end;

  procedure Swap(i,j :Byte);
  var
    tmp :String[100];
  begin
    tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
  end;

 procedure Greedy;
 var
   i,j :Byte;
  begin
    for i:=1 to n-1 do
      for j:=i+1 to n do
        if (A[i]+A[j]<A[j]+A[i]) then Swap(i,j);
  end;

  procedure Escape;
  var
    i :Byte;
  begin
    for i:=1 to n do Write(A[i]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Greedy;
  Escape;
  Close(Input); Close(Output);
End.