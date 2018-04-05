{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program CRUELL2;
Uses Math;
Const
  maxN =500;
Var
  n :LongInt;
  A :Array[0..maxN] of Real;

  procedure Enter;
  var
    i :LongInt;
  begin
    Read(n);
    for i:=0 to n do Read(A[i]);
  end;

  function Cal(x :Real) :Real;
  var
    i :LongInt;
  begin
    Cal:=0;
    for i:=0 to n do Cal:=Cal+A[i]*Power(x,i);
  end;

  function BS :Real;
  var
    left,right,mid,cL,cR,cM :Real;
  begin
    left:=-1000000; right:=1000000; mid:=(left+right)/2;
    while (left<>mid) and (right<>mid) do
      begin
        cM:=Cal(mid); cL:=Cal(left); cR:=Cal(right);
        if (cL*cM<0) then right:=mid;
        if (cR*cM<0) then left:=mid;
        mid:=(left+right)/2;
      end;
    Exit(mid);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Write(Trunc(BS*1000));
  Close(Input); Close(Output);
End.