{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program BLGEN;
Uses Math;
Const
  maxNM =1000; maxPrime =2154434;
Var
  n,m :SmallInt;
  x,y :Byte;
  A,B :Array[1..maxNM] of QWord;
  F :Array[0..1,0..maxNM] of SmallInt;
  Free :Array[0..maxPrime] of Boolean;

  procedure Eratosthenes;
  var
    i,j :LongInt;
  begin
    FillChar(Free,SizeOf(Free),true); Free[1]:=false;
    for i:=2 to Trunc(Sqrt(maxPrime)) do
      if (Free[i]) then
        begin
          j:=i*i;
          while (j<=maxPrime) do
            begin
              Free[j]:=false; Inc(j,i);
            end;
        end;
  end;

  function Check(i :QWord) :Boolean;
  var
   j :QWord;
  begin
    j:=Trunc(Sqrt(i));
    if (j*j=i) then Exit(true);
    j:=Round(Exp(Ln(i)/3));
    if (j*j*j=i) and (Free[j]) then Exit(true);
    Exit(false);
  end;

  procedure Enter;
  var
    i :QWord;
  begin
    n:=0;
    while not SeekEoLn do
      begin
        Read(i);
        if (Check(i)) then
          begin
            Inc(n); A[n]:=i;
          end;
     end;
    ReadLn;
    m:=0;
    while not SeekEoLn do
      begin
        Read(i);
        if (Check(i)) then
          begin
            Inc(m); B[m]:=i;
          end;
      end;
  end;

  procedure Optimize;
  var
    i,j :SmallInt;
  begin
    x:=0; y:=1;
    FillChar(F[x],SizeOf(F[x]),0); F[y]:=F[x];
    for i:=1 to n do
      begin
        for j:=1 to m do
          if (A[i]=B[j]) then F[y,j]:=F[x,j-1]+1
          else
            F[y,j]:=Max(F[y,j-1],F[x,j]);
        x:=1-x; y:=1-y;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Eratosthenes;
  Enter;
  Optimize;
  Write(F[x,m]);
  Close(Input); Close(Output);
End.
