{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program COLOREC;
Uses Math;
Const
  minXY =-200; 
  maxXY =200;
Var
  res :LongInt;
  A :Array[minXY..maxXY,minXY..maxXY] of Byte;
  C :Array[1..4,1..4] of SmallInt;

  procedure Enter;
  var
    i,n :LongInt;
    x,y :SmallInt;
  begin
    Read(n);
    FillChar(A,SizeOf(A),0);
    for i:=1 to n do Read(x,y,A[x,y]);
  end;

  procedure Solve;
  var
    x1,x2,y :SmallInt;
  begin
    res:=0;
    for x1:=minXY to maxXY-1 do
      for x2:=x1+1 to maxXY do
        begin
          FillChar(C,SizeOf(C),0);
          for y:=minXY to maxXY do
            if (A[x1,y]*A[x2,y]>0) then
              Inc(C[Min(A[x1,y],A[x2,y]),Max(A[x1,y],A[x2,y])]);
          Inc(res,C[1,2]*C[3,4]+C[1,3]*C[2,4]+C[1,4]*C[2,3]);
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