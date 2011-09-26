Unit Unit2;
 Interface
  uses  Graphics;
var  ColrBack :tcolor;
 Type
   Tviz=class(Tobject)
     ColrLine : Tcolor;
     Canvas : Tcanvas;
     x, y, r : word;
     Procedure Ris;virtual;abstract;
     Procedure Draw(bl:boolean);
     procedure Show;
     procedure Hide;
     procedure MovTo(dx,dy,dr:integer);
   end;

   TKrug=class(Tviz)
     x1,y1,x2,y2:word;
     Constructor Create(x0,y0,r0:word; colrLine0:Tcolor;canvas0:Tcanvas);
     Procedure Ris; override;
   end;

   TKvad=class(Tkrug)
     Procedure Ris; override;
   end;

   TKrPr=class(Tkrug)
     dy1:word;
     Constructor Create(x0,y0,r0,dy0:word; colrLine0:Tcolor;canvas0:Tcanvas);
     Procedure Ris; override;
   end;

Implementation

Procedure Tviz.Draw;
begin
  with Canvas do begin
    if bl then
    begin
      pen.color:=colrLine;
      brush.color:=colrLine
    end
    else
    begin
      pen.color:=colrBack;
      brush.color:=colrBack
    end;
    Ris;
  end;
end;

Procedure Tviz.Show;
begin
  Draw(true);
end;

Procedure Tviz.Hide;
begin
  Draw(false);
end;

procedure Tviz.MovTo;
begin
  Hide;
  x:=x+dx;
  y:=y+dy;
  r:=r+dr;
  Show;
end;

Constructor TKrug.Create;
begin
  colrLine:=colrLine0;
  canvas:=canvas0;
  x:=x0;
  y:=y0;
  r:=r0;
end;

Procedure Tkrug.Ris;
Begin
	x1:=x-r;
  x2:=x+r;
  y1:=y-r;
  y2:=y+r;
  Canvas.Ellipse(x1,y1,x2,y2);
end;

Procedure Tkvad.ris;
Begin
	x1:=x-r;
  x2:=x+r;
  y1:=y-r;
  y2:=y+r;
  Canvas.Rectangle(x1,y1,x2,y2);
end;

Constructor TKrpr.Create;
Begin
  dy1:=dy0;
  Inherited Create(x0,y0,r0,colrLine0,canvas0);
end;

Procedure TkrPr.Ris;
begin
  Inherited ris;
  canvas.Rectangle(x1,y2,x2,y2+dy1);
end;

end.

