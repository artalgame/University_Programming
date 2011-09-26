unit stec;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type

tinf=char;

Psel=^tsel;

tsel=record
 a:psel;
 inf:tinf;
end;

tlist=class(tobject)
 sp,sp1:psel;
 constructor create();  
 procedure add1(inf:tinf);
 procedure read1(var inf:tinf);
end;

implementation

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

end.
