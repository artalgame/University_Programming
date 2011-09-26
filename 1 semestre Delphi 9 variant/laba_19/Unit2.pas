unit Unit2;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;
Type

 Tinf=Record
   Fio:string;
   key:integer;
 end;

 Psel=^sel;

 sel=Record
   inf:Tinf;
   A:Psel;
 end;

 Ms=array[0..1] of Psel;

 Pms=^Ms;

 TH=class(Tobject)
   M,n:Word;
   sp,sp1:psel;
   H:Pms;
   Constructor create(M0:word);
   Destructor Free(Var stringgrid:TStringGrid);
   Procedure Add(Inf:Tinf);
   Procedure Read(key:integer; Var Inf:Tinf);
   procedure print(var mem:tmemo);
   procedure red(key:integer; var inf:tinf);
 end;

Implementation

procedure th.print;
 var i:integer;
  str:string;
 function stecprint(sp:psel):string;
  var st:string;
 begin
   if sp<> nil then st:='| ';
     while sp<>nil do
     begin
       st:=st+sp^.inf.Fio+' '+inttostr(sp^.inf.key)+' | ';
       sp:=sp^.a;
     end;
   result:=st;
 end;
begin
  mem.Clear;
  for i:=0 to m-1 do
  begin
    str:=stecprint(h[i]);
    mem.Lines.Add(str);
  end;
end;

procedure th.red;
 var i:integer;
begin
  i:=key mod M;
  sp:=H[i]; sp1:=sp;
  While (sp<>Nil) and (sp^.inf.key<>key) do
  begin
    sp1:=sp;
    sp:=sp^.A;
  end;
  if sp<>Nil then
  begin
    inf:=sp^.inf;
    if sp1=sp then H[i]:=sp^.A
    else sp1^.A:=sp^.A;
    dispose(sp);
    Dec(n);
  end
  else ShowMessage('ключ не найден');
end;

Constructor TH.create(M0:word);
 Var i:word;
begin
  Inherited create;
  M:=M0; n:=0;
  Getmem(H,M*sizeof(ms));
  for i:=0 to M-1 do H[i]:=Nil;
end;

Destructor TH.Free; // очистка хэш-талблицы
 Var i,j:word;
begin
  j:=0;
  for i:=0 to M-1 do
    While H[i]<>Nil do
    begin
      Inc(j);
      sp:=H[i];
      StringGrid.Cells[j,0]:=sp^.inf.Fio;
      StringGrid.Cells[j,1]:=inttostr(sp^.inf.key);
      H[i]:= sp^.A;
      dispose(sp);
    end;
  FreeMem(H,4*M);
end;

Procedure TH.Add;// добавить новую запись
 var i: integer;
  p:Psel;
begin
  i:=inf.key Mod M;
  New(p);
  Inc(n);
  p^.Inf:=Inf;
  p^.a:=H[i];
  H[i]:=p;
end;


Procedure TH.Read;//чтение без удаления
 var i: integer;
begin
  i:=key mod M;
  sp:=H[i];
  While (sp<>Nil) and (sp^.inf.key<>key) do sp:=sp^.A;
  if sp<>Nil then inf:=sp^.inf
  else ShowMessage('ключ не найден');
end;

end.
