unit Kamaz;

interface

 uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ComCtrls, ExtCtrls;

 type
  tcar= class(tobject)
    x,y,k:integer;
    canv:tcanvas;
    constructor create(x0,y0,k0:integer;cl:tcolor;canv0:tcanvas);
    procedure ris(cl1:tcolor); virtual;
    procedure hint;
    procedure show; virtual;
    procedure movto(dx,dy,dk:integer);
  end;

  tkol = class(tcar)
    procedure show; override;
    procedure ris(cl1:tcolor); override;
  end;

  tkuz = class(tcar)
    point : array[1..3] of TPoint;
    procedure show; override;
    procedure ris(cl1:tcolor); override;
  end;

 implementation

procedure tkuz.ris;
begin
  canv.Brush.Color:=cl1;
  canv.Pen.Color:=cl1;
  point[1].x:=x; point[1].y:=y-1;
  point[2].x:=x+(10*k); point[2].y:=y-1;
  point[3].x:=x+(10*k); point[3].y:=y-(10*k)-1;
  canv.Polygon(point);
end;

procedure tcar.movto;
begin
  hint;
  x:=x+dx;
  k:=dk;
  y:=y+dy;
  show;
end;

procedure tkol.ris;
begin
  canv.Brush.color:=cl1;
  canv.Pen.Color:=cl1;
  canv.Ellipse(x,y+10*k,x+5*k,y+10*k+5*k);
  canv.Ellipse(x+(20*k)-5*k,y+10*k,x+(20*k),y+10*k+5*k);
end;

constructor tcar.create;
begin
  x:=x0;
  y:=y0;
  k:=k0;
  canv:=canv0;
end;

procedure tcar.ris;
begin
  canv.Brush.color:=cl1;
  canv.Pen.Color:=cl1;
  canv.Rectangle(x,y,x+(20*k),y+(10*k));
end;

procedure tcar.show;
begin
  ris(clgreen);
end;

procedure tkuz.show;
begin
  ris(clblue);
end;

procedure tkol.show;
begin
  ris(clblack);
end;

procedure tcar.hint;
begin
  ris(clwhite);
end;

end.
