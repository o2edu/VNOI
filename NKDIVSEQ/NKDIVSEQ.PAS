{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKDIVSEQ;
Var
  n :LongInt;
  res :Int64;

  procedure Solve;
  var
    i,k :LongInt;
    j :Int64;
  begin
    i:=1; j:=1; res:=1;
    while (i<n) do
      begin
        Inc(j);
        Inc(res,j-res mod j);
        Inc(i);
        if (j-1<=n-i) then k:=j-1 else k:=n-i;
        Inc(res,k*j);
        Inc(i,k);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(n);
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.