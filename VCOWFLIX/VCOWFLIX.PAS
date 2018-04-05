{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VCOWFLIX;
Const
  maxN =16;
  maxM =5000;
Var
  n :Byte;
  m :Integer;
  A :Array[1..maxN] of Integer;
  F :Array[0..maxM] of Boolean;

  procedure Enter;
  var
    i :Byte;
  begin
    Read(m,n);
    for i:=1 to n do Read(A[i]);
  end;

  procedure Optimize;
  var
    i :Byte;
    j :Integer;
  begin
    FillChar(F,m+1,false);
    F[0]:=true;
    for i:=1 to n do
      for j:=m downto A[i] do
        F[j]:=F[j] or F[j-A[i]];
  end;

  procedure Trace;
  var
    i :Integer;
  begin
    for i:=m downto 0 do
      if (F[i]) then Break;
    Write(i);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Trace;
  Close(Input); Close(Output);
End.