unit Unit3;

interface

uses unit2;

type

slstek=class(tlist)
  min,max:integer;
  k:integer;
  procedure minmax;
  function rasst:integer;
  constructor create;
end;

implementation

function slstek.rasst;
 var a:tinf;
  l:integer;
begin
  if min<>max then
  begin
    l:=0;
    k:=0;
    while sp1<>nil do
    begin
      read1(a);
      if k=1 then l:=l+1;
      if (a.k = min) or (a.k = max) then if k=0 then k:=1 else k:=0;
    end;
    result:=l-1;
  end
  else result:=0;
end;

procedure slstek.minmax;
begin
  sp:=sp1;
  min:=sp^.inf.k;
  max:=sp^.inf.k;
  while sp<>nil do
  begin
    if min>sp^.inf.k then min:=sp^.inf.k;
    if max<sp^.inf.k then max:=sp^.inf.k;
    sp:=sp^.a;
  end;
  sp:=nil;
end;

constructor slstek.create;
begin
  inherited create;
  k:=0;
end;

end.
