{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program FLOYD;
Const
  maxValue =1000001;
Var
  A,T :Array[1..100,1..100] of Word;
  n,m,p :Word;

  procedure Enter;
  var
    i,u,v :word;
  begin
    Fillchar(A,SizeOf(A),0);
    ReadLn(n,m,p);
    for u:=1 to n do
      for v:=1 to n do
        begin
          T[u,v]:=v;
          if (u<>v) then A[u,v]:=maxValue;
        end;
    for i:=1 to m do
      begin
        ReadLn(u,v,A[u,v]); A[v,u]:=A[u,v];
      end;
  end;

  procedure Optimize;
  var
    i,j,k :Word;
  begin
    for k:=1 to n do
      for i:=1 to n do
        for j:=1 to n do
          if (A[i,j]>A[i,k]+A[k,j]) then
            begin
              A[i,j]:=A[i,k]+A[k,j];
              T[i,j]:=T[i,k];
            end;
  end;

  procedure Trace;
  var
    i,u,v,x,count :Word;
    S,Sx :String;
  begin
    for i:=1 to p do
      begin
        ReadLn(x,u,v);
        if (x=0) then WriteLn(A[u,v])
        else
          begin
            S:=''; count:=1;
            repeat
              Str(u,sx);
			  S:=S+Sx+' ';
              u:=T[u,v];
			  Inc(count);
            until (u=v);
            Str(v,Sx);
			S:=S+Sx;
            Write(count,' ');
			WriteLn(S);
          end;
      end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter;
  Optimize;
  Trace;
  Close(Input); Close(Output);
End.