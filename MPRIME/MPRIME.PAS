{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MPRIME;
Var
  k :SmallInt;

  function Check(i :Int64) :Boolean;
  var
    j :LongInt;
  begin
    for j:=2 to Trunc(Sqrt(i)) do
      if (i mod j=0) then Exit(false);
    Exit(true);
  end;

  procedure Solve;
  var
    i :LongInt;
    j :Int64;
    count,res :SmallInt;
    Sr,Sl :String;
  begin
    res:=0; i:=2; count:=0;
    while (res<k) do
      begin
        if (Check(i)) then
          begin
            Inc(count);
            Str(i,Sr);
            if (count mod 2=0) then
              begin
                Val(Sl+Sr,j);
                if (Check(j)) then Inc(res);
                count:=0;
              end
            else Sl:=Sr;
          end;
        Inc(i);
      end;
    Write(j);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(k);
  Solve;
  Close(Input); Close(Output);
End.