{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBPAL;
Const
  maxN =120; zero =48;
Var
  n :ShortInt;
  S :String;
  F :Array[1..maxN,1..maxN] of String;

  function Add(A,B :String) :String;
  var
    T :String;
    x,y,sum,carry,i :ShortInt;
  begin
    while (Length(A)<Length(B)) do A:='0'+A;
    while (Length(B)<Length(A)) do B:='0'+B;
    T:=''; carry:=0;
    for i:=Length(A) downto 1 do
      begin
        x:=Ord(A[i])-zero; y:=Ord(B[i])-zero;
        sum:=x+y+carry;
        carry:=sum div 10;
        T:=Chr(sum mod 10+zero)+T;
      end;
    if (carry>0) then T:='1'+T;
    Exit(T);
  end;

  function Sub(A,B :String) :String;
  var
   T :String;
     x,y,diff,borrow,i :ShortInt;
  begin
    while (Length(A)<Length(B)) do A:='0'+A;
    while (Length(B)<Length(A)) do B:='0'+B;
    T:=''; borrow:=0;
    for i:=Length(A) downto 1 do
      begin
        x:=Ord(A[i])-zero; y:=Ord(B[i])-zero;
        diff:=x-y-borrow;
        if (diff<0) then
          begin
            Inc(diff,10); borrow:=1;
          end
        else borrow:=0;
        T:=Chr(diff+zero)+T;
      end;
    Exit(T);
  end;

  procedure Optimize;
  var
    i,j,k :ShortInt;
  begin
    n:=Length(S);
    for i:=1 to n do F[i,i]:='1';
    for i:=2 to n do F[i,i-1]:='0';
    for k:=1 to n-1 do
      for i:=1 to n-k do
        begin
          j:=i+k;
          if (S[i]=S[j]) then
            F[i,j]:=Add(Add(F[i+1,j],F[i,j-1]),'1')
          else
            F[i,j]:=Sub(Add(F[i+1,j],F[i,j-1]),F[i+1,j-1]);
       end;
    while (F[1,n][1]='0') and (Length(F[1,n])>1) do Delete(F[1,n],1,1);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  ReadLn(S);
  Optimize;
  Write(F[1,n]);
  Close(Input); Close(Output);
End.