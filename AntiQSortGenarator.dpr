program AntiQSortGenerator;

{$APPTYPE CONSOLE}

uses
  SysUtils;
var
  r: array [1 .. 100000] of integer;
  n, i: integer;
procedure trytoadd(a, b: integer);
begin
  if r[b] = 0 then
    r[b] := a
  else
    trytoadd(a, r[b]);
end;
begin
  assign(input, 'kol');
  reset(input);
  assign(output, 'input');
  rewrite(output);

  read(n);
  randseed:=665;
  for i := 1 to n do
    trytoadd(i, (i + random(n - i + 1)));
    //trytoadd(i, (i + n) div 2);

  writeln(n);
  for i := 1 to n do write(r[i],' ');
end.
