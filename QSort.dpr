{$O-}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $01000000}
program Sort;

{$APPTYPE CONSOLE}


uses
  SysUtils;

var
  i, n: integer;
  r: array [1 .. 100000] of integer;
procedure swap(var a, b: integer);
begin
  a := a xor b;
  b := a xor b;
  a := a xor b;
end;
procedure qsort(left, right: integer);
var i, j, x: integer;
begin
  i := left;
  j := right;
  x := r[i + random(j - i + 1)];
  while i <= j do begin
    while r[i] < x do inc(i);
    while r[j] > x do dec(j);
    if i <= j then begin
      swap(r[i], r[j]);
      inc(i);
      dec(j);
    end;
  end;

  if i < right then qsort(i, right);
  if j > left then qsort(left, j);
end;
begin
  reset(input, 'input');
  rewrite(output, 'output');

  read(n);
  randseed := 665;
  for i := 1 to n do
    read(r[i]);
  qsort(1, n);
  for i := 1 to n do
    write(r[i], ' ');
end.
 