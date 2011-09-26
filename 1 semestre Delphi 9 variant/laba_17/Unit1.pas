unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, unit2;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:tpz;

implementation

{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
  form1.close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='nazv';
  stringgrid1.Cells[1,0]:='zna4';
  a:=tpz.Create;
  stringgrid1.Cells[0,1]:='a';
  stringgrid1.Cells[1,1]:='1';
  stringgrid1.Cells[0,2]:='c';
  stringgrid1.Cells[1,2]:='2';
  stringgrid1.Cells[0,3]:='e';
  stringgrid1.Cells[1,3]:='3';
  stringgrid1.Cells[0,4]:='x';
  stringgrid1.Cells[1,4]:='4';
  stringgrid1.Cells[0,5]:='y';
  stringgrid1.Cells[1,5]:='5';
  stringgrid1.Cells[0,6]:='z';
  stringgrid1.Cells[1,6]:='6';
  stringgrid1.Cells[0,7]:='s';
  stringgrid1.Cells[1,7]:='7';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  edit2.Text:=a.OBP(edit1.Text);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  edit2.Clear;
  edit3.clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
 var i:integer;
begin
  for i:=1 to stringgrid1.rowcount-1 do
    a.mszn[stringgrid1.Cells[0,i][1]]:=strtofloat(stringgrid1.Cells[1,i]);
  edit3.Text:=floattostr(a.AV(edit2.Text));
end;

end.
