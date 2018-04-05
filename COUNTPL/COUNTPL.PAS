{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program COUNTPL;
Const
  maxN =255;
Var
  n :Byte;
  S :String;
  Free :Array[1..maxN,1..maxN] of Boolean;
  F :Array[0..maxN] of Byte;

  procedure Init;
  var
    i,j,k :Byte;
  begin
    n:=Length(S);
    for i:=1 to n do
      for j:=1 to n do
        if (j=i) or (j=i-1) then
          Free[i,j]:=true
        else
          Free[i,j]:=false;
    for k:=1 to n-1 do
      for i:=1 to n-k do
        begin
          j:=i+k;
          Free[i,j]:=(S[i]=S[j]) and (Free[i+1,j-1]);
        end;
  end;

  procedure Optimize;
  var
    i,j :Byte;
  begin
    F[0]:=0;
    for i:=1 to n do
      begin
        F[i]:=i;
        for j:=1 to i do
          if (Free[j,i]) and (F[i]>F[j-1]+1) then F[i]:=F[j-1]+1;
      end; 
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Read(S);
  Init;
  Optimize;
  Write(F[n]);
  Close(Input); Close(Output);
End.