unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Kamaz;

type
  TForm1 = class(TForm)
    Image1: TImage;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    TrackBar2: TTrackBar;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Button5: TButton;
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:tcar;
  b:tkuz;
  c:tkol;
  q:boolean;


implementation

{$R *.dfm}

procedure TForm1.Button5Click(Sender: TObject);
begin
  form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  image1.Canvas.Brush.Color:=clwhite;
  a:=tcar.create(1,(image1.Height div 2),trackbar2.Position,clgreen,form1.Image1.Canvas);
  b:=tkuz.create(1,(image1.Height div 2),trackbar2.Position,clgreen,form1.Image1.Canvas);
  c:=tkol.create(1,(image1.Height div 2),trackbar2.Position,clgreen,form1.Image1.Canvas);
  a.show;
  c.show;
  q:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (a.x+20*a.k) <= (image1.Width - 3*trackbar1.Position) then
  begin
    c.movto(3*trackbar1.Position,0,trackbar2.Position);
    a.movto(3*trackbar1.Position,0,trackbar2.Position);
    if q then b.movto(3*trackbar1.Position,0,trackbar2.Position);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if a.x >= 3*trackbar1.Position then
  begin
    c.movto(-3*trackbar1.Position,0,trackbar2.Position);
    a.movto(-3*trackbar1.Position,0,trackbar2.Position);
    if q then b.movto(-3*trackbar1.Position,0,trackbar2.Position);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  b.k:=a.k;
  b.x:=a.x;
  b.show;
  q:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  b.hint;
  q:=false;
end;

end.
