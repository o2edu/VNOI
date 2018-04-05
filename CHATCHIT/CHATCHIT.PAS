{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program CHATCHIT;
Const
  maxWords =13;
  A :Array[1..maxWords] of String[5]=(' k ',' ko ',' ng ',' n ',' dc ',
  ' hok ',' ntn ',' kq ','j','w','f','dz','z');
  B :Array[1..maxWords] of String[13]=(' khong ',' khong ',' nguoi ',
  ' nhieu ',' duoc ',' khong ',' nhu the nao ',' ket qua ','gi','qu',
  'ph','d','d');
Var
  S :String;

  procedure Solve;
  var
    i :ShortInt;
    loc :Byte;
  begin
    S:=' '+S+' ';
    for i:=1 to maxWords do
      repeat
        loc:=Pos(A[i],S);
        if (loc>0) then
          begin
            Delete(S,loc,Length(A[i]));
            Insert(B[i],S,loc);
          end;
      until (loc=0);
    S:=Copy(S,2,Length(S)-1);
  end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  ReadLn(S);
  Solve;
  Write(S);
  Close(Input); Close(Output);
End.