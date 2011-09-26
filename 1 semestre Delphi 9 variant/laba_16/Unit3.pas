unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit2;

type

Tlisto=class(tlist)
  spk:psel;
  constructor create;
  Procedure Addk (Inf:TInf);
  procedure reads(var inf:tinf);
  procedure print(lb:tlistbox);
  procedure readafter(spi:psel; var inf:tinf);
  procedure addafter(spi:psel; inf:tinf);
  procedure sortslip;
end;

implementation

Procedure Tlisto.Sortslip;
 Procedure Slip(tq,tr,tp:Tlisto);
  Var Inf:TInf;
 Begin
   While(tq.sp1<>Nil) and (tr.sp1<>Nil) do
     if tq.sp1.Inf.k<tr.sp1.Inf.k then
     begin
       tq.Reads(Inf); tp.Addk(Inf)
     end
     else
     begin
       tr.Reads(Inf);
       tp.Addk(Inf)
     end;
     while tq.sp1<>nil do
     begin
       tq.Reads(Inf);
       tp.Addk(Inf);
     end;
     while tr.sp1<>nil do
     begin
       tr.Reads(Inf);
       tp.Addk(Inf);
     end;
   end;
 Procedure Div2sp(tp:TListo; var tq,tr:TListo);
  Var Inf:TInf;C:shortint;
 begin
   tq:=Tlisto.create;
   tr:=Tlisto.create;
   c:=-1;
   While tp.sp1<>Nil do
   begin
     c:=-c;
     tp.Reads(Inf);
     If C>0 then tq.Addk(Inf)
       else tr.Addk(Inf);
   end;
 end;
 Procedure Srsl(var tp:Tlisto);
  Var tq,tr:Tlisto;
 begin
   if tp.sp1<>tp.spk then
   begin
     Div2sp(tp,tq,tr);
     Srsl(tq);
	   Srsl(tr);
	   slip(tq,tr,tp);
   end;
 end;
begin
  Srsl(self);
end;


procedure tlisto.readafter;
begin
  inherited readafter(spi,inf);
  if spi^.a=spk then spk:=spi;
end;

procedure tlisto.addafter;
begin
  inherited addafter(spi,inf);
  if spi=spk then spk:=spi^.a;
end;

constructor tlisto.create;
begin
  inherited create;
  spk:=nil;
end;

procedure tlisto.addk;
begin
  if spk=nil then
  begin
    new(sp);
    sp^.inf:=inf;
    sp^.a:=nil;
    spk:=sp;
    sp1:=sp;
  end
  else
  begin
    new(sp);
    sp^.inf:=inf;
    sp^.a:=nil;
    spk^.a:=sp;
    spk:=sp;
  end;
end;

procedure tlisto.reads;
begin
  if sp1=spk then
  begin
    inf:=sp1.inf;
    sp1:=nil;
    spk:=nil;
  end
  else
  begin
    inf:=sp1.inf;
    sp:=sp1;
    sp1:=sp1^.a;
    dispose(sp);
  end;
end;

procedure tlisto.print;
begin
  if spk<>nil then begin inherited print(lb); end;
end;

end.
