unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, unit2;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    RadioGroup1: TRadioGroup;
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Edit3: TEdit;
    Label2: TLabel;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:tvib;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
 var i:integer;
begin
  a:=tvib.create;
  radiogroup1.ItemIndex:=0;
  a.n:=strtoint(edit1.Text);
  stringgrid1.ColCount:=a.n+1;
  memo1.Clear;
  stringgrid1.Cells[1,1]:='10';
  stringgrid1.Cells[1,2]:='18';
  stringgrid1.Cells[2,1]:='11';
  stringgrid1.Cells[2,2]:='20';
  stringgrid1.Cells[3,1]:='12';
  stringgrid1.Cells[3,2]:='17';
  stringgrid1.Cells[4,1]:='13';
  stringgrid1.Cells[4,2]:='19';
  stringgrid1.Cells[5,1]:='14';
  stringgrid1.Cells[5,2]:='19';
  stringgrid1.Cells[0,2]:='Цена';
  stringgrid1.Cells[0,1]:='Вес';
  for i:=1 to a.n do stringgrid1.Cells[i,0]:='i='+inttostr(i);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  a.Free;
  form1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
 var i:integer;
begin
  a.n:=strtoint(edit1.Text);
  stringgrid1.ColCount:=a.n+1;
  for i:=1 to a.n do stringgrid1.Cells[i,0]:='i='+inttostr(i);
end;

procedure TForm1.Button2Click(Sender: TObject);
 var i,n:integer;
begin
  a.clear;
  a.input(stringgrid1);
  a.wmax:=strtofloat(edit3.Text);
  case radiogroup1.ItemIndex of
    0: a.vg(1,0,a.oct);
    1: a.pp(1);
    2: a.mc;
    3: a.minw;
    4: a.cbc;
    5: a.cp(3);
  end;
  a.output(memo1);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Clear;
end;

end.
