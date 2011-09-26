unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

tzap=record
  k:integer;
  nm:shortstring;
  numc:byte;
end;

mas=array[1..1000] of tzap;

tdbpis=class(tobject)
  a:mas;
  n,numb:integer;
  fl:file of tzap;
  procedure readfromfile(opnd:topendialog);
  procedure writefromfile(save:tsavedialog);
  procedure addzap(p:tzap);
  procedure linp(k:integer);
  procedure dublep(k:integer);
  procedure slipsort(l,r:integer);
  procedure quicksort(l,r:integer);
  procedure remove(i:integer);
  procedure flclose;
  procedure vivodceh(numc:integer; mem:tmemo);
end;

implementation

procedure tdbpis.vivodceh; //вывод по номеру цеха
 var i:integer;
begin
  quicksort(1,n);
  for i:=n downto 1 do if a[i].numc=numc then mem.Lines.Add(a[i].nm+'  '+
    floattostr(a[i].k));
end;

procedure tdbpis.flclose;   //закрывтие файла
begin
  try
    closefile(fl)
  except
  end;
end;

procedure tdbpis.readfromfile;  //чтение из файла
begin
  if opnd.Execute then
  begin
    assignfile(fl,opnd.FileName);
    try
      reset(fl)
    except
      rewrite(fl)
    end;
    n:=0;
    while not eof(fl) do
    begin
      read(fl,a[n+1]);
      n:=n+1;
    end;
  end;
end;

procedure tdbpis.writefromfile;  //запись в файл
 var i:integer;
  fl1:file of tzap;
begin
  if save.Execute then
  begin
    assignfile(fl1,save.FileName);
    rewrite(fl1);
    for i:=1 to n do write(fl1,a[i]);
    closefile(fl1);
  end;
end;

procedure tdbpis.addzap;  // добавление записи в файл и в массив
begin
  write(fl,p);
  if n<>0 then
  begin
    n:=n+1;
    a[n]:=p;
  end
  else
  begin
    a[n]:=p;
    n:=n+1;
  end;
end;

procedure tdbpis.linp;    // линейный поиск
 var i:integer;
begin
  a[n+1].k:=k;
  i:=1;
  while a[i].k<>k do i:=i+1;
  if i<>n+1 then numb:=i else numb:=0;
end;

procedure tdbpis.dublep;     // двоичный поиск
 procedure dblp(l,r:integer);
  var ser:integer;
 begin
   if l<r then
   begin
     ser:=(l+r) div 2;
     if k<=a[ser].k then dblp(l,ser) else dblp(ser+1,r);
   end
   else if a[l].k=k then numb:=l else numb:=0;
 end;
begin
  dblp(1,n);
end;

procedure tdbpis.slipsort;      // сорт слиянием
 Procedure Slip(L,R,m:word);
  Var c: mas; i,j,k:word;
 begin
	 i:=L; k:=1; j:=m+1;
	 while (i<=m) and (j<=R) do
	   if a[i].k<a[j].k then
     begin
       c[k]:=a[i];
       Inc(i);
       Inc(k);
     end
	   else
     begin
       c[k]:=a[j];
       Inc(j);
       Inc(k);
     end;
	 while i<=m do
   begin
     c[k]:=a[i];
     Inc(i);
     inc(k);
   end;
	 while j<=R do
   begin
     c[k]:=a[j];
     Inc(j);
     Inc(k)
   end;
	 k:=0;
	 for i:=L to R do
   begin
     Inc(k);
     a[i]:=c[k];
   end;
 end;
 var m:integer;
begin
  if l<>r then
  begin
    m:=(l+r) div 2;
    slipsort(l,m);
    slipsort(m+1,r);
    slip(l,r,m);
  end;
end;

procedure tdbpis.quicksort;     // qs
 var k,i,j:integer;
  el:tzap;
begin
  if l<>r then
  begin
    i:=l; j:=r;
    k:=a[(l+r) div 2].k;
    while i<j do
    begin
      while a[i].k<k do i:=i+1;
      while a[j].k>k do j:=j-1;
      if i<=j then
      begin
        el:=a[i];
        a[i]:=a[j];
        a[j]:=el;
        i:=i+1;
        j:=j-1;
      end;
    end;
    if j>l then quicksort(l,j);
    if i<r then quicksort(i,r);
  end;
end;

procedure tdbpis.remove;        // исключение эл-та из массива
begin
  quicksort(1,n);
  dublep(i);
  if numb<>0 then
  begin
    n:=n-1;
    for i:=numb to n do a[i]:=a[i+1];
  end;
end;

end.
