{----------------------------------------------------------------------------}
{                       Written by Nguyen Le Quang Duy                       }
{                  Nguyen Quang Dieu High School, An Giang                   }
{----------------------------------------------------------------------------}

Program NKTREE;
Const
  minValue =Low(LongInt)-1;
  maxValue =High(LongInt)+2;

function Solve :String;
var
  parent,children,maxV,minV :Int64;
begin
  minV:=minValue; maxV:=maxValue;
  Read(parent);
  while not SeekEoLn do
    begin
      Read(children);
      if (children<=minV) or
         (children>=maxV) or
         (children=parent) then Exit('NO');
      if (children>parent) then minV:=parent else maxV:=parent;
      parent:=children;
    end;
  Exit('YES');
end;

Begin
  Assign(Input,''); Reset(Input);
  Assign(Output,''); Rewrite(Output);
  Write(Solve);
  Close(Input); Close(Output);
End.