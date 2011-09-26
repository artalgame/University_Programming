unit stec;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type

tinf=record
 k:byte;
 inf:shortstring;
end;

Psel=^tsel;

tsel=record
 a:psel;
 inf:tinf;
end;

tlist=class(tobject)
 sp,sp1:psel;
 constructor create();  //+
 procedure add1(inf:tinf); //+
 procedure read1(var inf:tinf); //+
 procedure print(lb:tlistbox); //+
 procedure readafter(spi:psel; var inf:tinf);  //+
 procedure addafter(spi:psel; inf:tinf);  //+
 function poisk(k:byte):psel;   //+
 function poiskafter(k:byte):psel; //+
 procedure sortbublinf;  //+
 procedure sortbubleafter; //+
end;

implementation

procedure tlist.print; //распечатка в тлистбокс
var i:integer;
begin
 sp:=sp1;
 i:=1;
 while sp<> nil do
 begin
  lb.Items.Add(inttostr(i)+' '+inttostr(sp.inf.k));
  sp:=sp^.a;
  inc(i);
 end;
 sp:=nil;
end;

procedure tlist.sortbublinf;  //сорт пузырь пересылкой инфы
 Procedure RevInf(spi:psel);
 var inf:tinf;
 begin
  inf:=spi^.inf;
  spi^.inf:=spi^.a^.inf;
  spi^.a^.inf:=inf;
 end;
Var spt:psel;
begin
 spt:=Nil;
 Repeat
  sp:=sp1;
  While sp^.A<>spt do begin
	 if sp^.Inf.k>sp^.A^.Inf.k then RevInf(sp);
   sp:=sp^.A;
  end;
  spt:=sp;
 Until sp1^.A=spt;
end;

procedure tlist.sortbubleafter; //пузырь пересылкой адреса
 procedure revadd(spi:psel);
 var sp:psel;
 begin
  sp:=spi^.a;
  spi^.a:=spi^.a^.a;
  sp^.a:=spi^.a^.a;
  spi^.a^.a:=sp;
 end;
var spt:psel;
begin
 spt:=nil;
 repeat
  sp:=sp1;
  while sp^.a^.a<>spt do
  begin
   if sp^.a^.inf.k>sp^.a^.a^.inf.k then revadd(sp);
   sp:=sp^.a;
  end;
  spt:=sp^.a;
 until sp1^.a^.a=spt;
end;

function tlist.poisk;      //поиск эл-та
begin
 if sp1=nil then result:=nil else
 begin
  sp:=sp1;
  while (sp^.a <> nil) and (sp^.inf.k<>k) do sp:=sp^.a;
  if sp^.inf.k=k then result:=sp else result:=nil;
 end;
end;

function tlist.poiskafter;    //поиск эл-та, после которого нах-ся эл-т
begin
 if sp1^.a=nil then result:=nil else
 begin
  sp:=sp1;
  while (sp^.a^.a<>nil) and (sp^.a^.inf.k<>k) do sp:=sp^.a;
  if sp^.a^.inf.k=k then result:=sp else result:=nil;
 end;
end;

constructor tlist.create; //создание класса
begin
 inherited create;
 sp1:=nil;
end;

procedure tlist.add1;    // добавка эл-та в начало стека
begin
 new(sp);
 sp^.a:=sp1;
 sp^.inf:=inf;
 sp1:=sp;
end;

procedure tlist.read1;   //чтение эл-та из начала стека и удаление его
begin
 inf:=sp1^.inf;
 sp:=sp1;
 sp1:=sp1^.a;
 dispose(sp);
end;

procedure tlist.addafter;  // добавка эл-та в стек после определенного эл-та
begin
 new(sp);
 sp^.inf:=inf;
 sp^.a:=spi^.a;
 spi^.a:=sp;
end;

procedure tlist.readafter; //чтение и удаление эл-та из стека после данного эл-та
begin
 sp:=spi^.a;
 inf:=sp^.inf;
 spi^.a:=sp^.a;
 dispose(sp);
end;

end.
