{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program LCS2X;
Uses Math;
Const
  maxNM =1500;
Var
  n,m,res,t :SmallInt;
  A,B :Array[1..maxNM] of LongInt;
  D :Array[0..maxNM] of SmallInt;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n,m);
    for i:=1 to n do Read(A[i]);
    for i:=1 to m do Read(B[i]);
  end;

  procedure Optimize;
  var
    i,j :LongInt;
    count,tmp :SmallInt;
  begin
    res:=0;
    for i:=0 to m do D[i]:=0;
    for i:=1 to n do
      begin
        count:=0; tmp:=0;
        for j:=1 to m do
          begin
            if (A[i]=B[j]) then count:=tmp+1;
            if (A[i]>=2*B[j]) then tmp:=Max(tmp,D[j]);
            if (A[i]=B[j]) then
              begin
                res:=Max(res,count);
                D[j]:=Max(D[j],count);
              end;
          end;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(t);
  repeat
    Dec(t);
    Enter;
    Optimize;
    WriteLn(res);
  until (t=0);
  Close(Input); Close(Output);
End.