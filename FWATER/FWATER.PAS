{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                   Nguyen Quang Dieu High School, An Giang                  }
{----------------------------------------------------------------------------}

Program FWATER;
Const
  oo =1000000001;
Var
  n :Integer;
  D :Array[0..300] of LongInt;
  Free :Array[0..300] of Boolean;
  C :Array[0..300,0..300] of LongInt;

  procedure Enter;
  var
    i,j :Integer;
  begin
    Read(n);
    FillChar(Free,SizeOf(Free),true);
    for i:=1 to n do Read(C[0,i]);
    for i:=1 to n do
      for j:=1 to n do Read(C[i,j]);
    for i:=1 to n do D[i]:=oo; D[0]:=0;
  end;

  procedure Optimize;
  var
    i,u,v :Integer;
    min :LongInt;
  begin
    for i:=0 to n do
      begin
        min:=High(LongInt); u:=-1;
        for v:=0 to n do
          if (min>D[v]) and (Free[v]) then
            begin
              min:=D[v]; u:=v;
            end;
        if (u=-1) then Break;
        Free[u]:=false;
        for v:=1 to n do
          if (Free[v]) and (D[v]>C[u,v]) then D[v]:=C[u,v];
      end;
  end;

  procedure Escape;
  var
    i :Integer;
    res :LongInt; 
  begin
    res:=0;
    for i:=1 to n do Inc(res,D[i]);
    Write(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize; 
  Escape;
  Close(Input); Close(Output);
End.