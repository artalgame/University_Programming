unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Unit2;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    BitBtn1: TBitBtn;
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  xn,xk,e:extended;
  m:integer;

implementation

{$R *.dfm}

function sx(x:extended):extended;
var a,n,s:extended;
 k:integer;
begin
  k:=-1;  a:=1;  n:=0; s:=1;
  try
  while a*(sqr(n)+1)>e do begin
   n:=n+1;
   a:=a*x/(2*n);
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

function yx(x:extended):extended;
var b:extended;
begin
 b:=sqr(x/2)+x/2+1;
 result:=exp(x/2)*b;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
memo1.Clear;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
memo1.clear;
radiogroup1.ItemIndex:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
xn:=strtofloat(edit1.Text);
xk:=strtofloat(edit2.Text);
e:=strtofloat(edit3.Text);
m:=strtoint(edit4.Text);
case radiogroup1.ItemIndex of
0: begin
 Memo1.Lines.Add('S(x)');
 sm(xn,xk,m,Memo1,sx);
 end;
1: begin
 Memo1.Lines.Add('Y(x)');
 sm(xn,xk,m,memo1,yx);
 end;
 end;
end;

end.
