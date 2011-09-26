unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Label5: TLabel;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
memo1.Clear;
edit1.Text:='get data';
edit2.Text:='get data';
edit3.Text:='get data';
edit4.Text:='get data';
end;

procedure TForm1.Button1Click(Sender: TObject);
var n:integer;
 x,xn,xk,s,y,e,h,a,b:extended;
begin
 xn:=strtofloat(edit1.Text);
 xk:=strtofloat(edit2.Text);
 h:=strtofloat(edit3.Text);
 e:=strtofloat(edit4.Text);
 memo1.Lines.Add('¬веденные данные видны слева, результаты:');
 x:=xn;
 repeat
  a:=1; s:=1; n:=0;
  while a*(sqr(n)+1)>e do begin
   n:=n+1;
   a:=a*x/(2*n);
   s:=s+a*(sqr(n)+1);
  end;
  b:=sqr(x/2)+x/2+1;
  y:=exp(x/2)*b;
  x:=x+h;
  memo1.Lines.add('X='+floattostrf(x,fffixed,6,2)+' S='
   +floattostrf(s,fffixed,8,4)+' Y='+floattostrf(y,fffixed,8,4)+' N='
    +inttostr(n));
 until x>(xk+h/2);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 form1.Close;
end;

end.
