{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program V11WATER;
Uses Math;
Var
  n :LongInt;
  A,L,R :Array[0..100000] of LongInt;
  sum :Int64;

  procedure Enter;
  var     
    i :LongInt;
  begin
    ReadLn(n);
    FillChar(A,SizeOf(A),0);
    FillChar(L,SizeOf(L),0);
    FillChar(R,SizeOf(R),0);
    for i:=1 to n do
      begin
        Read(A[i]);
        L[i]:=Max(L[i-1],A[i-1]);
      end;
    for i:=n downto 1 do R[i]:=Max(R[i+1],A[i+1]);
    sum:=0;
  end;

  procedure Optimize;
  var     
    i,minV  :LongInt;
  begin
    for i:=1 to n do
      begin
        minV:=Min(L[i],R[i]);
        if (minV>A[i]) then sum:=sum+minV-A[i];
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Write(sum);
  Close(Input); Close(Output);
End.