unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var x,y,z,s:extended;
begin
x:=strtofloat(edit1.Text);
y:=strtofloat(edit2.Text);
z:=strtofloat(edit3.Text);
s:=abs(power(x,y/x)-power(y/x,1/3))+(y-x)*(cos(y)-z/(y-x))/(1+sqr(y-x));
memo1.Lines.add('s= '+floattostr(s));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
memo1.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
memo1.Clear;
end;

end.
