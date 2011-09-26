unit Unit2;
interface
uses StdCtrls, SysUtils;
type func = function(x:extended):extended;
procedure sm(xn,xk:extended; m:integer; mem1:Tmemo; f:func);
implementation
procedure sm;
     var x,y,h: extended;
         i : integer;
    begin
    x:=xn;  h:=(xk-xn)/m;
 for i:=1 to m+1 do begin
     y:=f(x);
    Mem1.Lines.Add(' x='+FloatToStrf(x,fffixed,8,3)+
                                ' y='+FloatToStrf(y,fffixed,8,3));
        x:=x+h;
        end;
     end;

end.
 