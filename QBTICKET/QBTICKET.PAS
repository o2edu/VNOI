{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBTICKET;
Uses Math;
Const
  maxN =100000;
  maxValue =10000000000000;
Var
  n,s,t,l1,l2,l3,c1,c2,c3 :LongInt;
  A :Array[1..maxN] of Int64;
  F :Array[1..maxN] of Int64;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(l1,l2,l3,c1,c2,c3);
    Read(n);
    Read(s,t);
    A[1]:=0;
    for i:=2 to n do Read(A[i]);
  end;

  procedure Optimize;
  var
    i,j,k,v :LongInt;  
  begin
    for i:=s+1 to t do
      begin
        F[i]:=maxValue;
        for j:=i-1 downto s do
          begin
            k:=A[i]-A[j];
            if (k>l3) then Break;
            if (k>l2) then v:=c3
            else
              if (k>l1) then v:=c2 else v:=c1;
            F[i]:=Min(F[i],F[j]+v);
          end;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(F[t]);
  Close(Input); Close(Output);
End.