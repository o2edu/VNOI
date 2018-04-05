{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MAXARR1;
Var
  n,t :LongInt;
  F,M,A :Array[0..1000000] of LongInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    ReadLn(t); n:=0;
    for i:=1 to t do
      begin
        ReadLn(A[i]);
        if (A[i]>n) then n:=A[i];
      end;
  end;

  procedure Optimize;
  var
    i :LongInt;
  begin
    FillChar(F,SizeOf(F),0);
    FillChar(M,SizeOf(M),0);
    F[1]:=1; M[1]:=F[1];
    for i:=2 to n do
      begin
        if (i mod 2=0) then F[i]:=F[i div 2]
        else 
	      F[i]:=F[(i-1) div 2]+F[((i-1) div 2)+1];
        M[i]:=F[i];
        if (M[i-1]>M[i]) then M[i]:=M[i-1];
      end;
  end;

  procedure Escape;
  var
    i :LongInt;
  begin
    for i:=1 to t do WriteLn(M[A[i]]);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Escape;
  Close(Input); Close(Output);
End.