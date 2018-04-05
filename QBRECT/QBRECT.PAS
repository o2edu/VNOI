{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program QBRECT;
Uses Math;
Var 
  n,m :Integer;
  A :Array[1..1001,1..1001] of Byte;
  H,R,L :Array[0..1000] of Integer;

  procedure Enter;
  var     
    i,j :Integer;
  begin
    ReadLn(n,m);
    for i:=1 to n do
      for j:=1 to m do Read(A[i,j]);
    H[0]:=-1; H[m+1]:=-1;
    for i:=1 to m do H[i]:=0;
  end;

  procedure Optimize;
  var     
    i,j :Integer;
    res :LongInt;
  begin
    res:=0;
    for i:=1 to n do
      begin
        for j:=1 to m do H[j]:=(H[j]+1)*A[i,j];
        for j:=1 to m do
          begin
            L[j]:=j;
            while (H[j]<=H[L[j]-1]) do L[j]:=L[L[j]-1];
          end;
        for j:=m downto 1 do
          begin
            R[j]:=j;
            while (H[j]<=H[R[j]+1]) do R[j]:=R[R[j]+1];
          end;
        for j:=1 to m do res:=Max(res,H[j]*(R[j]-L[j]+1));
      end;
    Write(res);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Optimize;
  Close(Input); Close(Output);
End.