{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBHV;
Const
  maxN =9;
  maxSL =362880;
Var
  n,m :LongInt;
  S,X :String[9];
  D :Array['A'..'Z'] of ShortInt;
  A :Array[0..maxSL] of String[9];
  Free :Array[1..maxN] of Boolean;

  procedure QSort(l,r :LongInt);
  var
    i,j :LongInt;
    Key,Tmp :Char;
  begin
    if (l>=r) then Exit;
    i:=l; j:=r; Key:=S[(l+r) div 2];
    repeat
      while (S[i]<Key) do Inc(i);
      while (S[j]>Key) do Dec(j);
      if (i<=j) then
        begin
          if (i<j) then
            begin
              Tmp:=S[i]; S[i]:=S[j]; S[j]:=Tmp;
            end;
          Inc(i); Dec(j);
        end;
    until (i>j);
    QSort(l,j); QSort(i,r);
  end;

  function Factorial(i :LongInt) :LongInt;
  var
    j,tmp :LongInt;
  begin
    if (i=0) then Exit(1);
    tmp:=1;
    for j:=2 to i do tmp:=tmp*j;
    Exit(tmp);
  end;

  procedure Enter;
  var
    i,tmp :LongInt;
    ch :Char;
  begin
    ReadLn(S); n:=Length(S); QSort(1,n);
    FillChar(D,SizeOf(D),0);
    FillChar(Free,SizeOf(Free),true);
    for i:=1 to n do Inc(D[S[i]]);
    X:='';
    for i:=1 to n do X:=X+' ';
    tmp:=1;
    for ch:='A' to 'Z' do tmp:=tmp*Factorial(D[ch]);
    WriteLn(Factorial(n) div tmp);
    A[0]:='';
    m:=0;
  end;

  procedure Back(i :LongInt);
  var
    j :LongInt;
  begin
    for j:=1 to n do
      if (Free[j]) then
        begin
          X[i]:=S[j];
          Free[j]:=false;
          if (i=n) and (X>A[m]) then
            begin
              WriteLn(X); Inc(m); A[m]:=X;
            end
          else Back(i+1);
          Free[j]:=true;
        end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Back(1);
  Close(Input); Close(Output);
End.