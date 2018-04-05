{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program BONES;
Var
  s1,s2,s3 :Byte;
  gt,ct :Integer;
  C :Array[1..80] of Integer;

  procedure Process;
  var
    i,j,k :Byte;
  begin
    FillChar(C,SizeOf(C),0);
    gt:=0; ct:=0;
    for i:=1 to s1 do
      for j:=1 to s2 do
        for k:=1 to s3 do
          begin
            Inc(C[i+j+k]);
            if (C[i+j+k]>ct) then
              begin
                ct:=C[i+j+k]; gt:=i+j+k;
              end;
            if (C[i+j+k]=ct) and (i+j+k<gt) then gt:=i+j+k;
          end;
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  ReadLn(s1,s2,s3); 
  Process; 
  Write(gt);
  Close(Input); Close(Output);
End.