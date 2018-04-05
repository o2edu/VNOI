{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MDIGITS2;
Var
  n :Int64;

  function Solve :Int64;
  var
    S,T,X :AnsiString;
    i :Int64;
  begin
    S:=''; Str(n,X); i:=1;
    while i<=n do
      begin
        Str(i,T); S:=S+T; Inc(i);
      end;
    Solve:=Pos(X,S);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  ReadLn(n); 
  Write(Solve);
  Close(Input); Close(Output);
End.