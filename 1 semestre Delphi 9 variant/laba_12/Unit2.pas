unit unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids;

type
  predm=record
  c,w:extended;
end;

masel=array[1..100] of predm;

tvib=class(tobject)
  a:masel;
  n:byte;
  s,sp:set of byte;
  cmax,wmax,wt,ct,oct:extended;
  procedure vg(i:byte; wl,osc:extended);
  procedure pp(i:byte);
  procedure mc;
  procedure minw;
  procedure cbc;
  procedure cp(raz:integer);
  procedure input(st:tstringgrid);
  procedure output(var mem:tmemo);
  procedure clear;
end;

implementation

procedure tvib.output;
 var i:integer;
begin
  mem.Lines.Add('ќптимальный вариант');
  mem.Lines.Add(' i       w      c');
  for i:=1 to n do
    if i in Sp then
      Mem.Lines.Add(IntToStr(i)+'  '+FloatToStrF(a[i].w,ffFixed,8,3)+'  '+
        FloatToStrF(a[i].c,ffFixed,8,3));
  Mem.Lines.Add('Cmax='+FloatToStrF(Cmax,ffFixed,8,3)+'  Wmax='+
    FloatToStrF(Wmax,ffFixed,8,3));
end;

procedure tvib.input;
 var i:integer;
begin
  for i:=1 to n do
  begin
    a[i].c:=strtofloat(st.Cells[i,2]);
    a[i].w:=strtofloat(st.Cells[i,1]);
    oct:=oct+a[i].c;
  end;
end;

procedure tvib.clear;
begin
  oct:=0;
  s:=[];
  sp:=[];
  cmax:=0;
  wt:=0;
  ct:=0;
end;

procedure tvib.pp;      // полный перебор
begin
  include(s,i);
  ct:=ct+a[i].c;
  wt:=wt+a[i].w;
  if i<n then pp(i+1) else if (wt<=wmax) and (cmax<ct) then
    begin
      sp:=s;
      cmax:=ct;
    end;
  exclude(s,i);
  ct:=ct-a[i].c;
  wt:=wt-a[i].w;
  if i<n then pp(i+1) else if (wt<=wmax) and (cmax<ct) then
    begin
      sp:=s;
      cmax:=ct;
    end;
end;

procedure tvib.vg;       // ветви и границы
begin
  if (wl+a[i].w)<=wmax then
  begin
    include(s,i);
    if i<n then vg(i+1,wl+a[i].w,osc) else
      if osc>cmax then begin sp:=s; cmax:=osc; end;
    exclude(s,i);
  end;
  ct:=osc-a[i].c;
  if ct>cmax then if i<n then vg(i+1,wl,ct) else
  begin
    cmax:=ct;
    sp:=s;
  end;
end;

procedure tvib.cbc;        // сбалансированна€ стоимость
 var k:integer;
  el:extended;
 function mi():byte;
  var mc:extended;
   i,num:integer;
 begin
   mc:=0;
   num:=1;
   for i:=1 to n do if not(i in sp) and ((a[i].c/a[i].w)>mc) then
   begin
     mc:=a[i].c/a[i].w;
     num:=i;
   end;
   result:=num;
 end;
begin
  wt:=0;
  k:=mi;
  while (wt+a[k].w)<=wmax do
  begin
    include(sp,k);
    wt:=wt+a[k].w;
    cmax:=cmax+a[k].c;
    k:=mi;
  end;
end;

procedure tvib.cp;         //случайный поиск
 var i,k:integer;
  ct:extended;
begin
  for i:=1 to raz do
  begin
    ct:=0;
    wt:=0;
    s:=[];
    k:=random(n-1);
    while wt+a[k+1].w<=wmax do
    begin
      if not((k+1) in s) then
      begin
        include(s,k+1);
        wt:=wt+a[k+1].w;
        ct:=ct+a[k+1].c;
      end;
      randomize;
      k:=random(n-1);
    end;
    if ct>cmax then begin
      cmax:=ct;
      sp:=s;
    end;
  end;
end;

procedure tvib.minw;        // минимальный вес
 var k:integer;
  el:extended;
 function mw():byte;
  var mc:extended;
   i,num:integer;
 begin
   mc:=a[n].w;
   num:=n;
   for i:=1 to n do
     if not(i in sp) and (a[i].w<mc) then
     begin
       mc:=a[i].w;
       num:=i;
     end;
   result:=num;
 end;
begin
  wt:=0;
  k:=mw;
  while (wt+a[k].w)<=wmax do
  begin
    include(sp,k);
    wt:=wt+a[k].w;
    cmax:=cmax+a[k].c;
    k:=mw;
  end;
end;

procedure tvib.mc;  //максимальна€ стоимость
 var k:integer;
  el:extended;
 function mi():byte;
  var mc:extended;
   i,num:integer;
 begin
   mc:=0;
   num:=1;
   for i:=1 to n do
     if not(i in sp) and (a[i].c>mc) then
     begin
       mc:=a[i].c;
       num:=i;
     end;
   result:=num;
 end;
begin
  wt:=0;
  k:=mi;
  while (wt+a[k].w)<=wmax do
  begin
    include(sp,k);
    wt:=wt+a[k].w;
    cmax:=cmax+a[k].c;
    k:=mi;
  end;
end;

end.
