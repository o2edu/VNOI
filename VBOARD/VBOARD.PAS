{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program VBOARD;
Var
  Aw,Ab :Array[0..500,0..500] of Integer;
  Fw,Fb :Array[0..500,0..500] of LongInt;

  procedure Enter;
  var     
    i,j,n :Integer;
    okx,oky :Boolean;
  begin
    ReadLn(n); okx:=true;
    FillChar(Aw,SizeOf(Aw),0);
    FillChar(Ab,SizeOf(Ab),0);
    FillChar(Fw,SizeOf(Fw),0);
    FillChar(Fb,SizeOf(Fb),0);
    for i:=1 to n do
      begin
        oky:=okx;
        for j:=1 to n do
          begin
            if (oky) then Read(Aw[i,j]) else Read(Ab[i,j]);
            Fw[i,j]:=Aw[i,j]+Fw[i-1,j]+Fw[i,j-1]-Fw[i-1,j-1];
            Fb[i,j]:=Ab[i,j]+Fb[i-1,j]+Fb[i,j-1]-Fb[i-1,j-1];
            oky:=not oky;
          end;
        okx:=not okx;
        ReadLn;
      end;
  end;

  procedure Optimize;
  var     
    i,m,x1,x2,y1,y2 :Integer;
    white,black :LongInt;
  begin
    ReadLn(m);
    for i:=1 to m do
      begin
        ReadLn(x1,y1,x2,y2);
        white:=Fw[x2,y2]-Fw[x1-1,y2]-Fw[x2,y1-1]+Fw[x1-1,y1-1];
        black:=Fb[x2,y2]-Fb[x1-1,y2]-Fb[x2,y1-1]+Fb[x1-1,y1-1];
        WriteLn(Abs(white-black));
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize;
  Close(Input); Close(Output);
End.