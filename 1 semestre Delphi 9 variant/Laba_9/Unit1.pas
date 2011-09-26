unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, ComCtrls, clipbrd, Menus,
  TeEngine, Series, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Chart1: TChart;
    Series1: TLineSeries;
    RadioGroup1: TRadioGroup;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    BitBtn2: TBitBtn;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
toch = record
  x,y:extended;
end;

var
  Form1: TForm1;
  x,y,i,j,m:integer;
  p,q:toch;
  k,e,xn,xk,x1,h:extended;
  t:array[1..4] of toch;

implementation

{$R *.dfm}
{$Q+ }
procedure TForm1.FormCreate(Sender: TObject);
begin
  LabeledEdit1.Text:=floattostr(image1.Height);
  LabeledEdit2.Text:=floattostr(image1.Width);
  image1.Canvas.brush.color:=clwhite;
  image1.Canvas.Font.Color:=clblack;
  image1.Canvas.TextOut(0,0,'Нажмите сюда для рисования прямоугольника');
  stringgrid1.Cells[0,0]:='x=';
  stringgrid1.Cells[0,1]:='y=';
  stringgrid1.Cells[1,0]:='8';
  stringgrid1.Cells[1,1]:='10';
  stringgrid1.Cells[2,0]:='5';
  stringgrid1.Cells[2,1]:='10';
  stringgrid1.Cells[3,0]:='8';
  stringgrid1.Cells[3,1]:='3';
  edit1.Clear;
  edit2.Clear;
  radiogroup1.ItemIndex:=0;
end;

function sx(x1:extended):extended;
 var a,n,s:extended;
  k:integer;
begin
  k:=-1;
  a:=1;
  n:=0;
  s:=1;
  try
    while a*(sqr(n)+1)>e do begin
      n:=n+1;
      a:=a*x1/(2*n);
      s:=s+a*(sqr(n)+1);
    end;
    result:=s;
  except
    on EInvalidOp do
      k:=MessageDlg('Неправильная операция с плавающей точкой. '+
        ' Продолжить вычисления?',mtError,[mbYes,mbNo],0);
    on EOverFlow do
      k:=MessageDlg('Переполнение при выполне-нии операции с'+
        ' плавающей точкой! Продолжить вычисления?',mtError,[mbYes,mbNo],0);
    else
      k:=MessageDlg('Возникла неизвестная исключительная ситуация!'+
        ' Продолжить вычисления?',mtError,[mbYes,mbNo],0);
  end;
  case k of
    mrYes : Result:=0;
    mrNo  : Halt(1);
  end;
end;

function yx(x1:extended):extended;
 var b:extended;
begin
  b:=sqr(x1/2)+x1/2+1;
  result:=exp(x1/2)*b;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  image1.Height:=strtoint(LabeledEdit1.Text);
  image1.width:=strtoint(LabeledEdit2.Text);
  image1.Canvas.brush.color:=clwhite;
  image1.Canvas.TextOut(0,0,'Нажмите сюда для рисования прямоугольника');
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  image1.picture:=nil;
  image1.Canvas.brush.color:=clwhite;
  for i:=1 to 3 do begin
    t[i].x:=strtofloat(stringgrid1.Cells[i,0]);
    t[i].y:=strtofloat(stringgrid1.Cells[i,1]);
  end;
  if t[1].x=t[2].x then t[4].x:=t[3].x else
    if t[1].x=t[3].x then t[4].x:=t[2].x else
      t[4].x:=t[1].x;
  if t[1].y=t[2].y then t[4].y:=t[3].y else
    if t[1].y=t[3].y then t[4].y:=t[2].y else
      t[4].y:=t[1].y;
  edit1.Text:=floattostr(t[4].x);
  edit2.Text:=floattostr(t[4].y);
  for i:=2 to 4 do
    for j:=4 downto i do
      if (t[j].x<t[j-1].x) or ((t[j].x=t[j-1].x) and (t[j].y>t[j-1].y)) then
      begin
        p:=t[j-1];
        t[j-1]:=t[j];
        t[j]:=p;
      end;
  if abs(t[4].x-t[1].x) > abs(t[1].y-t[4].y) then
  begin
    k:=(2*image1.Width)/(3*abs(t[4].x-t[1].x));
    x:=trunc((2*image1.Width)/3);
    y:=trunc(abs(t[1].y-t[4].y)*k);
  end
  else
  begin
    k:=(2*image1.Height)/(3*abs(t[1].y-t[4].y));
    y:=trunc((2*image1.Height) / 3);
    x:=trunc(abs(t[4].x-t[1].x)*k);
  end;
  image1.Canvas.Brush.Color:=clgreen;
  image1.Canvas.pen.Color:=clred;
  image1.Canvas.pen.Width:=3;
  image1.Canvas.Rectangle((image1.Width div 2)-(x div 2),
  (image1.Height div 2)-(y div 2),
  (image1.Width div 2)+(x div 2),
  (image1.Height div 2)+(y div 2));
end;


procedure TForm1.N1Click(Sender: TObject);
begin
  clipboard.assign(image1.picture);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  chart1.CopyToClipboardMetafile(true);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  e:=strtofloat(labelededit3.Text);
  xn:=strtofloat(labelededit4.Text);
  xk:=strtofloat(labelededit5.Text);
  m:=strtoint(labelededit6.Text);
  chart1.SeriesList[0].Clear;
  h:=(xk-xn)/m;
  case radiogroup1.ItemIndex of
    0: for i:=1 to m+1 do
       begin
         chart1.SeriesList[0].AddXY(xn,sx(xn));
         xn:=xn+h;
       end;
    1: for i:=1 to m+1 do
       begin
         chart1.SeriesList[0].AddXY(xn,yx(xn));
         xn:=xn+h;
       end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  form1.Close;
end;

end.
