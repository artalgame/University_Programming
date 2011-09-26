unit Unit4;

interface

 uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit2;

type
 psel=^tsel;

 tsel=record
   a1,a2:psel;
   inf:string;
 end;

 tlisto2=class(tobject)
   sp,sp1,spk:psel;
   constructor create;
   procedure reads(var inf:shortstring);
   procedure addk(inf:shortstring);
   procedure print(var mem:tmemo);
   procedure ciklspisok;
 end;

implementation

procedure tlisto2.ciklspisok;
begin
  spk^.a2:=sp1;
  sp1^.a1:=spk;
  sp:=sp1;
end;

procedure tlisto2.print;
 var spi:psel;
begin
  spi:=sp;
  repeat
    mem.Lines.Add(spi^.inf);
    spi:=spi^.a2;
  until spi=sp;
  sp:=sp^.a1
end;

constructor tlisto2.create;
begin
  inherited create;
  sp:=nil;
  sp1:=nil;
  spk:=nil;
end;

procedure tlisto2.reads;
begin
  sp:=sp1;
  inf:=sp1^.inf;
  if sp1=spk then
  begin
    dispose(sp);
    sp1:=nil;
    spk:=nil;
  end
  else
  begin
    sp1:=sp^.a2;
    sp1^.a1:=nil;
    dispose(sp);
  end;
end;

procedure tlisto2.addk;
begin
  if spk=nil then
  begin
    new(sp);
    sp^.a1:=nil;
    sp^.a2:=nil;
    sp^.inf:=inf;
    sp1:=sp;
    spk:=sp;
  end
  else
  begin
    new(sp);
    sp^.inf:=inf;
    spk^.a2:=sp;
    sp^.a1:=spk;
    sp^.a2:=nil;
    spk:=sp;
  end;
end;

end.
