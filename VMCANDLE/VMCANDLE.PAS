{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VMCANDLE;
Const
  maxK =1000000000000000000;
Var
  k :Int64;

  function BSearch :Int64;
  var
    left,right,mid :Int64;
  begin
    left:=1; right:=maxK; mid:=(left+right) div 2;
    while (left<right) do
      begin
        if (mid-Trunc(Sqrt(mid))<k) then left:=mid+1 else right:=mid;
        mid:=(left+right) div 2;
      end;
    Exit(left);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(k);
  Write(BSearch);
  Close(Input); Close(Output);
End.