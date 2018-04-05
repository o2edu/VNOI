{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program HAM12;
Uses Math;
Const
  oo =maxLongInt;
Var
  m,n,k,ans :LongInt;
  S :AnsiString;

  procedure Enter;
  begin
    ReadLn(n,m,k);
    ReadLn(S);
  end;

  procedure Solve;
  var
    i,j,p,res :LongInt;
    T :AnsiString;
  begin
    ans:=oo;
    for i:=1 to m-1 do S:=S+S[i];
    Inc(n,m-1);
    for i:=1 to k do
      begin
        ReadLn(T);
        for j:=1 to n-m+1 do
          begin
            res:=0;
            for p:=1 to m do
              if (T[p]<>S[j+p-1]) then Inc(res);
            ans:=Min(ans,res);
          end;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(ans);
  Close(Input); Close(Output);
End.