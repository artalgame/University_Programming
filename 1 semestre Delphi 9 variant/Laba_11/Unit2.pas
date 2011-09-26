unit Unit2;

interface
 uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Grids;
 type
   mas=array[1..100] of extended;
 var a:mas;
 function go(b:mas; n:integer):extended;
 function r(n,k:integer):extended;

implementation

function go;
begin
  a:=b;
  result:=r(1,n);
end;

function r;
var rs,ls,m:extended;
 s:integer;
begin
  if n<>k then
  begin
    s:=(n+k) div 2;
    ls:=r(n,s);
    rs:=r(s+1,k);
    if ls>rs then r:=ls else r:=rs;
  end
  else
  begin
    r:=a[k];
  end;
end;

end.
