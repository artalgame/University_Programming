unit Unit2;

interface

 uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids;

type

  tinf=record
    k:integer;
    fio:shortstring;
  end;

  psel=^tsel;

  tsel=record
    inf:tinf;
    a1,a2:psel;
  end;

  masinf=array[1..100] of tinf;

  tree=class(tobject)
    p,q,root,w,v:psel;
    constructor create;
    destructor free;
    function poisk(k:integer):shortstring;
    procedure delk(k:integer);
    procedure print(mem:tmemo);
    procedure printobr(mem:tmemo);
    procedure balance(mas:masinf; n:integer);
    procedure add(inf:tinf);
    procedure mastotree(strg:tstringgrid);
    procedure view(tr:ttreeview);
    function kol:shortstring;
  end;

implementation

function tree.kol;
 var k:integer;
 Procedure kolvo(p:psel);
 begin
   if p<>nil then
   begin
     kolvo(p^.a1);
     if (p^.a1=nil) xor (p^.a2=nil) then k:=k+1;
     kolvo(p^.a2);
   end;
 end;
begin
  k:=0;
  p:=root;
  kolvo(p);
  result:=inttostr(k);
end;

Procedure tree.View;
 var kl:integer;
 Procedure VW(p:psel;Var kl:Integer);
 Begin
   if  p <> Nil then with tr.Items do
   begin
     if kl=-1 then AddFirst(Nil, p^.Inf.fio+' '+IntToStr(p^.Inf.k))
     else AddChildFirst(tr.Items[kl],p^.Inf.fio+' '+IntToStr(p^.Inf.k));
     Inc(kl);
     VW(p^.A1,kl);
     VW(p^.A2,kl);
     Dec(kl);
   end;
 end;
begin
  tr.items.Clear;
  p:=root;
  kl:=-1;
  VW(p,kl);
  tr.FullExpand;
end;


procedure tree.mastotree;
 var i:integer;
  buff:tinf;
begin
  for i:=1 to strg.colcount-1 do
  begin
    buff.fio:=strg.Cells[i,0];
    buff.k:=strtoint(strg.Cells[i,1]);
    add(buff);
  end;
end;

procedure tree.add;
 Var bl:Boolean;
begin
  New(w);
  w^.Inf:=Inf;
  w^.A1:=Nil;
  w^.A2:=Nil;
  if root=Nil then root:=w
  else
  begin
    p:=root;
    repeat
      q:=p;
      bl:=Inf.k<p^.Inf.k;
      if bl then p:=p^.A1
        else p:=p^.A2;
    until p=Nil;
    if bl then q^.A1:=w
      else q^.A2:=w;
  end;
end;

procedure tree.balance;
 Procedure BL(i,j:Word);
  Var m:Word;
 begin
   if i<=j then
   begin
     m:=(i+j) div 2;
	   Add(mas[m]);
	   BL(i,m-1);
	   BL(m+1,j);
   end;
 end;
begin
  BL(1,n);
end;


function tree.poisk;
begin
  p:=root;
  While(p<>nil) and (p^.Inf.k<>k) do
    If k<p^.Inf.k then p:=p^.A1
      else p:=p^.A2;
  if p<>Nil then Result:=p^.inf.fio
    else Result:='“акой записи не существует';
end;

procedure tree.delk;
begin
  p:=root;
  While (p<>Nil) and (p^.Inf.k<>k) do
  begin
    q:=p;
    if p^.Inf.k>k then p:=p^.A1 else p:=p^.A2;
  end;
  if p<>Nil then //исключение найденного узла p:
  begin
    if p=root then
    begin
      new(q);
      q^.A1:=p
    end;
    if (P^.A1=Nil) and (P^.A2=Nil) then // лист
      if q^.A1=P then q^.A1:=Nil
      else q^.A2:=Nil
    else
      if (p^.a1=nil) or (p^.a2=nil) then  // 1 дочь
        if P^.A1=Nil then
          if q^.A1=P then q^.A1:=p^.A2
          else q^.A2:=p^.A2
        else
          if q^.A1=P then q^.A1:=p^.A1
          else q^.A2:=p^.A1
      else   //две дочери
      begin
        w:=p^.A1;
        if w^.A2=Nil then w^.A2:=p^.A2
        else
        begin
          Repeat
            v:=w;
            w:=w^.A2;
          until w^.A2=Nil;
          v^.A2:=w^.A1;
          w^.A1:=p^.A1;
          w^.A2:=p^.A2;
        end;
        if q^.A1=P then q^.A1:=w
        else q^.A2:=w;
      end;
  if p=root then begin root:=q^.A1; dispose(q) end;
  Dispose(p);
end;

end;

Destructor tree.Free;
 Procedure Delett(p:Psel);
 Begin
   If p=nil then Exit;
   Delett(p^.A1);
   Delett(p^.A2);
   Dispose(p);
   p:=Nil;
 end;
begin
  Delett(root);
  Inherited  Destroy;
end;


constructor tree.create;
begin
  inherited create;
  root:=nil;
end;

procedure tree.print;
 Procedure Wr(p:psel);
 begin
   if p<>nil then
   begin
     Wr(p^.a1);
     mem.Lines.add(p^.Inf.fio);
     Wr(p^.a2);
   end;
 end;
begin
  p:=root;
  wr(p);
end;

procedure tree.printobr;
 Procedure Wr(p:psel);
 begin
   if p<>nil then
   begin
     Wr(p^.a2);
     mem.Lines.add(p^.Inf.fio);
     Wr(p^.a1);
   end;
 end;
begin
  p:=root;
  wr(p);
end;

end.
