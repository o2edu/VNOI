{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program C11BEAU;
Uses Math;
Var
  countA,countB,maxA,maxB,res :Int64;
  t :ShortInt;

  procedure Enter;
  begin
    Read(countA,countB,maxA,maxB);
  end;

  procedure Swap(var i,j :Int64);
  var
    tmp :Int64;
  begin
    tmp:=i; i:=j; j:=tmp;
  end;

  procedure Greedy;
  begin
    if (maxA=0) then countA:=0;
    if (maxB=0) then countB:=0;
    if (countA>countB) then
      begin
        Swap(countA,countB);
        Swap(maxA,maxB);
      end;
    res:=countA+Min(countB,(countA+1)*maxB);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(t);
  repeat
    Dec(t);
    Enter;
    Greedy;
    WriteLn(res);
  until (t=0);
  Close(Input); Close(Output);
End.