{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program THEME;
Uses Math;
Const
  maxN =5000; 
  minL =5; 
  maxValue =1000000000;
Var
  n,res :Integer;
  A :Array[1..maxN] of Integer;
 
  procedure Enter;
  var
    i :Integer;
  begin
    Read(n);
    for i:=1 to n do Read(A[i]);
  end;

  procedure Solve;
  var
    i,j,count :Integer;
    tmp :LongInt;
  begin
    res:=0;
    for i:=minL to n-minL do
      begin
        tmp:=maxValue;
        for j:=1 to n-i do
          if (A[i+j]-A[j]=tmp) then
            begin
              if (count=i) then Break;
              Inc(count);
              res:=Max(res,count);
            end
          else
            begin
              count:=1; tmp:=A[i+j]-A[j];
            end;
      end;
    if (res<minL) then res:=0;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.