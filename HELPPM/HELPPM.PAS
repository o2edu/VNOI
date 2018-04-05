{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program HELPPM;
Const
  maxNM =500;
Var
  n,m,x1,y1,x2,y2 :Integer;
  k,res :LongInt;
  F :Array[0..maxNM,0..maxNM] of LongInt;

  procedure Enter;
  var
    i,j :Integer;
  begin
    ReadLn(n,m,k);
    for i:=0 to n do F[i,0]:=0;
    for j:=1 to m do F[0,j]:=0;
    for i:=1 to n do
      for j:=1 to m do
        begin
          Read(F[i,j]);
          F[i,j]:=F[i,j]+F[i-1,j]+F[i,j-1]-F[i-1,j-1];
        end;
  end;

  procedure Optimize;
  var
    i,j,x,y :Integer;
    sum,area :LongInt;
  begin
    res:=n*m+1;
    if (F[n,m]<k) then Exit;
    for i:=1 to n do
      for x:=i to n do
        begin
          j:=1; y:=1;
          while (y<=m) and (j<=y) do
            begin
              sum:=F[x,y]-F[i-1,y]-F[x,j-1]+F[i-1,j-1];
              if (sum>=k) then
                begin
                  area:=(x-i+1)*(y-j+1);
                  if (res>area) then
                    begin
                      res:=area;
                      x1:=i; y1:=j; x2:=x; y2:=y;
                    end;
                  Inc(j);
                end
              else Inc(y);
            end;
        end;
  end;

  procedure Escape;
  begin
    if (res=n*m+1) then Write(-1)
    else
      begin
        WriteLn(res); 
		Write(x1,' ',y1,' ',x2,' ',y2);
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Escape;
  Close(Input); Close(Output);
End.