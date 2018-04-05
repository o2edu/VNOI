{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program V8SCORE;
Var
  n,s,k,sum :Byte;
  A :Array[1..21,1..21] of Byte;
  X :Array[1..21] of Byte;

  procedure Enter;
  var
    i,j :Byte;
  begin
    ReadLn(s,k,n);
    for i:=1 to n do
      begin
        for j:=1 to k do Read(A[i,j]);
        ReadLn;
      end;
    FillChar(X,SizeOf(X),0);
    sum:=0;
  end;

  procedure Escape;
  var
    i :Byte;
  begin
    WriteLn('YES');
    for i:=1 to k do Write(X[i],' ');
    Close(Output); 
	Halt;
  end;

  procedure Back(i :Byte);
  var
    j :Byte;
  begin
    for j:=1 to n do
      if (A[j,i]>=X[i-1]) and ((s-sum) div (k-i+1)>=A[j,i]) then
        begin
          X[i]:=A[j,i];
          sum:=sum+X[i];
          if (i=k) and (sum=s) then Escape else Back(i+1);
          sum:=sum-X[i];
        end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Back(1);
  Writeln('NO');
  Close(Input); Close(Output);
End.
