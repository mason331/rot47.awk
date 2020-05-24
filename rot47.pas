// https://helloacm.com
// http://codingforspeed.com
// http://rot47.net 
function Rot47(const s: string): string;
var
  i, j: integer;
begin
  Result := s;
  for i := 1 to Length(s) do
  begin
    j := Ord(s[i]);
    if (j in [33..126]) then
    begin
      Result[i] := Chr(33 + ((j + 14) mod 94));
    end;
  end;
end;