unit unit2;

Interface

 uses Grids,SysUtils;

Type

 TInf=Record
   aj:extended;
   j:word;
 end;

 TSel=^sel;

 Sel=Record
   inf:tinf;
   A:TSel;
 end;

TLists=class(TObject)
  sp1,sp:TSel;
  Procedure adds(inf:Tinf);
  Procedure addsj(inf:tinf);
  Function readsj(j:word):extended;
  Procedure dels;
end;

Tmslists= array[1..1] of TLists;

TListms=class(TLists)
  ms:^Tmslists;
  m,n:word;
  constructor create(m0,n0:word);
  destructor free;
  Procedure add(i,j:word;a:extended);
  Procedure addj(i,j:word;a:extended);
  Function read(i,j:word):extended;
  Procedure Print(StG:TStringGrid);
end;

tlistsmpmaxij=class(TListms)
  maxa:extended;
  procedure maxij(var maxi,maxj:integer);
end;

Implementation

procedure tlistsmpmaxij.maxij;
 var i,j:integer;
begin
  maxa:=ms[1].readsj(1);
  maxi:=1;
  maxj:=1;
  for i:=1 to m do
    for j:=1 to n do
      if  ms[i].readsj(j)>maxa then
      begin
        maxa:=ms[i].readsj(j);
        maxi:=i;
        maxj:=j;
      end;
end;

Function Tlists.readsj;
begin
  sp:=sp1;
  while (sp<>Nil) and (sp^.inf.j<>j) do sp:=sp.A;
  if sp=nil then result:=0
    else result:=sp^.Inf.aj;
end;

Procedure TLists.Adds;
begin
  New(sp);
  sp^.Inf:=Inf;
  sp^.A:=sp1;
  sp1:=sp;
end;

Procedure TLists.addsj;
 var spt:Tsel;
begin
  New(sp);
  sp^.Inf:=inf;
  if sp1=nil then
  begin
    sp1:=sp;
    sp1^.A:=nil
  end
  else if sp1^.inf.j>=inf.j then
    begin
      sp^.A:=sp1;
      sp1:=sp
    end
    else
    begin
      spt:=sp1;
      while(spt^.A<>nil) and (spt^.A^.inf.j<inf.j) do spt:=spt^.A;
      sp^.A:=spt^.A; spt^.A:=sp;
    end;
end;

Procedure TLists.dels;
begin
  sp:=sp1;
  sp1:=sp1^.A;
  Dispose(sp);
end;

constructor TListms.create;
 Var i:word;
begin
  m:=m0;
  n:=n0;
  inherited create;
  GetMem(ms,4*m);
  for i:=1 to m do
  begin
    ms[i]:=Tlists.create;
    ms[i].sp1:=nil
  end;
end;


destructor TListms.free;
 Var i:word;
begin
  for i:=1 to m do
  while ms[i].sp1<>nil do ms[i].dels;
  FreeMem(ms,4*m);
end;



Procedure TListms.Print;
 Var i,j:word;
begin
  for i:=1 to m do
    for j:=1 to n do StG.Cells[j-1,i-1]:=FloatToStr(ms[i].readsj(j));
end;

Procedure TListms.add;
 Var inf:Tinf;
begin
  inf.aj:=a;
  inf.j:=j;
  ms[i].adds(inf);
end;

Procedure TListms.addj;
 var inf:Tinf;
begin
  inf.aj:=a;
  inf.j:=j;
  ms[i].addsj(inf);
end;

Function TListms.read;
begin
  result:=ms[i].readsj(j);
end;

end.


