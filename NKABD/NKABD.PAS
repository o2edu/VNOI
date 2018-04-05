{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKABD;
Const
  maxN =100000;
Var
  l,r,res  :LongInt;
  F :Array[1..maxN] of LongInt;
  Free :Array[1..maxN] of Boolean;
 
  procedure Enter;
  begin
    ReadLn(l,r);
    FillChar(Free,SizeOf(Free),true);
    FillChar(F,SizeOf(F),0);  
  end;
 
  procedure Solve;
  var
    i,j :LongInt;
  begin
    res:=0;
    for i:=1 to r div 2 do
      begin
        j:=i*2;
        while (j<=r) do
          begin
            if (Free[j]) and (j>=l) then
              begin
                Inc(F[j],i);
                if (F[j]>j) then
                  begin
                    Inc(res); Free[j]:=false;
                  end;
              end;
            Inc(j,i);
          end;
      end;
  end;
 
Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.