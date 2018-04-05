{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKLETTER;
Var
  A,B :String;
  n,m,k :Integer;

  procedure Enter;
  begin
    ReadLn(a); n:=Length(A);
	ReadLn(b); m:=Length(B);
    while (Length(A)>Length(B)) do Delete(A,1,1);
    while (Length(B)>Length(A)) do Delete(B,Length(B),1);
  end;

  procedure Process;
  begin
    while (a<>b) do
      begin
        Delete(A,1,1); 
		Delete(B,Length(B),1);
      end;
    k:=Length(A);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Enter; 
  Process; 
  Write(n+m-k);
  Close(Input); Close(Output);
End.