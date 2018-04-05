{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program MMASS;
Const
  maxL =100;
Var
  res :SmallInt;
  S :String;
  Stack :Array[1..maxL] of SmallInt;
  top :ShortInt;

procedure Push(i :ShortInt);
begin
  Inc(top); Stack[top]:=i;
end;

function Pop :SmallInt;
begin
  Pop:=Stack[top]; Dec(top);
end;

procedure Solve;
var
  i :ShortInt;
  j :SmallInt;
begin
  top:=0;
  for i:=1 to Length(S) do
    case (S[i]) of
      '(': Push(0);
      'C': Push(12);
      'H': Push(1);
      'O': Push(16);
      '2'..'9': Stack[top]:=Stack[top]*(Ord(S[i])-48);
      ')': repeat
             j:=Pop;
             Inc(Stack[top],j);
           until (Stack[top]=Stack[top+1]);
    end;
  res:=0;
  for i:=1 to top do Inc(res,Stack[i]);
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  ReadLn(S);
  Solve;
  Write(res);
  Close(Input); Close(Output);
End.