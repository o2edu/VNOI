{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBMSEQ;
Uses Math;
Const
  maxN =10000;
Var
  n,res :Integer;
  A :Array[1..maxN] of LongInt;

  procedure Enter;
  var
    i :Integer;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  function Check(x :LongInt) :Boolean;
  var
    tmp1,tmp2 :LongInt;
  begin
    tmp1:=1+8*x; tmp2:=Round(Sqrt(tmp1));
    if (tmp2*tmp2=tmp1) and ((-1+tmp2) mod 2=0) and (tmp2<>1) then
      Exit(true) else Exit(false);
  end;

  procedure Optimize;
  var
    tmp :LongInt;
    i :Integer;
  begin
    res:=0; tmp:=0;
    for i:=1 to n do
      if (A[i]>0) and (Check(A[i])) then
        begin
          if (tmp=0) or (A[i]>=A[i-1]) then Inc(tmp)
          else
            begin
              res:=Max(res,tmp); tmp:=1;
            end;
        end
      else
        begin
          res:=Max(res,tmp); tmp:=0;
        end;
    res:=Max(res,tmp);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Write(res);
  Close(Input); Close(Output);
End.