{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MINCUT;
Uses Math;
Const
  maxN =1000;
  maxM =1000;
  oo =10000000000000000;
Var
  n,m,k,x1,y1,x2,y2 :LongInt;
  S :Array[0..maxN,0..maxM] of Int64;

  procedure Enter;
  var
    i,j :LongInt;
  begin
    Read(n,m,k);
    FillChar(S,SizeOf(S),0);
    for i:=1 to n do
      for j:=1 to m do
        begin
          Read(S[i,j]);
          S[i,j]:=S[i,j]+S[i-1,j]+S[i,j-1]-S[i-1,j-1];
        end;
  end;

  function Cal(u1,v1,u2,v2 :LongInt) :Int64;
  begin
   Exit(S[u2,v2]-S[u2,v1-1]-S[u1-1,v2]+S[u1-1,v1-1]);
  end;

  function BSearch1 :Int64;
  var
    left,right,mid :LongInt;
    v,res :Int64;
  begin
    left:=x1; right:=x2; res:=oo;
    while (left<=right) do
      begin
        mid:=(left+right) div 2;
        v:=Cal(mid+1,y1,x2,y2)-Cal(x1,y1,mid,y2);
        if (v=0) then Exit(v);
        if (v>0) then
          begin
            res:=Min(res,v);
            left:=mid+1;
          end;
        if (v<0) then right:=mid-1;
      end;
    Exit(res);
  end;

  function BSearch2 :Int64;
  var
    left,right,mid :LongInt;
    v,res :Int64;
  begin
    left:=x1; right:=x2; res:=oo;
    while (left<=right) do
      begin
        mid:=(left+right) div 2;
        v:=Cal(x1,y1,mid,y2)-Cal(mid+1,y1,x2,y2);
        if (v=0) then Exit(v);
        if (v>0) then
          begin
            res:=Min(res,v);
            right:=mid-1;
          end;;
        if (v<0) then left:=mid+1;
      end;
    Exit(res);
  end;

  function BSearch3 :Int64;
  var
   left,right,mid :LongInt;
   v,res :Int64;
  begin
    left:=y1; right:=y2; res:=oo;
    while (left<=right) do
      begin
        mid:=(left+right) div 2;
        v:=Cal(x1,mid+1,x2,y2)-Cal(x1,y1,x2,mid);
        if (v=0) then Exit(v);
        if (v>0) then
          begin
            res:=Min(res,v);
            left:=mid+1;
          end;;
        if (v<0) then right:=mid-1;
      end;
    Exit(res);
  end;

  function BSearch4 :Int64;
  var
   left,right,mid :LongInt;
   v,res :Int64;
  begin
    left:=y1; right:=y2; res:=oo;
    while (left<=right) do
      begin
        mid:=(left+right) div 2;
        v:=Cal(x1,y1,x2,mid)-Cal(x1,mid+1,x2,y2);
        if (v=0) then Exit(v);
        if (v>0) then
          begin
            res:=Min(res,v);
            right:=mid-1;
          end;;
        if (v<0) then left:=mid+1;
      end;
    Exit(res);
  end;

  procedure Solve;
  var
    i :LongInt;
  begin
    for i:=1 to k do
      begin
        Read(x1,y1,x2,y2);
        WriteLn(Min(BSearch1,Min(BSearch2,Min(BSearch3,BSearch4))));
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Solve;
  Close(Input); Close(Output);
End.