{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VECTOR;
Const
  maxN =30;
Type
  TVector =Record x,y :ShortInt end;
Var
  n :ShortInt;
  u,v :LongInt;
  A :Array[1..maxN] of TVector;
  X :Array[1..maxN] of ShortInt;
  D :Array[-3000..3000,-3000..3000] of LongInt;
  ans :LongInt;

  procedure Enter;
  var
    i :ShortInt;
  begin
    Read(n);
    for i:=1 to n do with (A[i]) do Read(x,y);
    Read(u,v);
  end;

  procedure Back(t,m,k,i,uu,vv :LongInt);
  var
    j :ShortInt;
  begin
    for j:=X[i-1]+1 to m-k+i do
      begin
        X[i]:=j;
        Inc(uu,A[j].x);
        Inc(vv,A[j].y);
        if (i=k) then
          begin
            case (t) of
              1: Inc(D[uu,vv]);
              2: Inc(ans,D[u-uu,v-vv]);
            end;
          end
        else Back(t,m,k,i+1,uu,vv);
        Dec(uu,A[j].x);
        Dec(vv,A[j].y);
      end;
  end;

  procedure Solve;
  var
    i :ShortInt;
  begin
    FillChar(D,SizeOf(D),0); D[0,0]:=1;
    X[0]:=0;
    for i:=1 to n div 2 do Back(1,n div 2,i,1,0,0);
    ans:=D[u,v];
    X[0]:=n div 2;
    for i:=1 to n-n div 2 do Back(2,n,i,1,0,0);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(ans);
  Close(Input); Close(Output);
End.