unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit3, unit2;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    ListBox2: TListBox;
    Edit4: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:slstek;
  n,l:integer;
  buff:tinf;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  a:=slstek.create;
  button2.Visible:=false;
  memo1.Clear;
end;

procedure TForm1.Button1Click(Sender: TObject);
 var i:integer;
begin
  listbox1.Clear;
  n:=strtoint(edit1.Text);
  randomize;
  for i:=1 to n do
  begin
    buff.k:=random(100);
    a.add1(buff);
    randomize;
  end;
  a.print(listbox1);
  button1.Visible:=false;
  button2.Visible:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  a.minmax;
  l:=a.rasst;
  memo1.Lines.add(inttostr(l));
  memo1.Lines.add('min- '+inttostr(a.min)+' max- '+inttostr(a.max));
  button1.Visible:=true;
  button2.visible:=false;
end;

procedure TForm1.Button4Click(Sender: TObject);
 var buff:tinf;
begin
  listbox1.clear;
  buff.k:=strtoint(edit3.Text);
  a.add1(buff);
  a.print(listbox1);
end;

procedure TForm1.Button3Click(Sender: TObject);
 var buff:tinf;
begin
  if a.sp1<>nil then
  begin
    a.read1(buff);
    edit3.Text:=inttostr(buff.k);
    listbox1.Items.Delete(0);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  buff.k:=strtoint(edit3.Text);
  a.addafter(a.poisk(strtoint(edit4.Text)),buff);
  listbox1.Clear;
  a.print(listbox1);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  a.readafter(a.poisk(strtoint(edit4.Text)),buff);
  edit3.Text:=inttostr(buff.k);
  listbox1.Clear;
  a.print(listbox1);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  a.sortbublinf;
  listbox1.Clear;
  a.print(listbox1);
end;

procedure TForm1.Button8Click(Sender: TObject);
 var buff:tinf;
begin
  buff.k:=0;
  a.add1(buff);
  a.sortbubleafter;
  a.read1(buff);
  listbox1.Clear;
  a.print(listbox1);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  listbox2.Clear;
  a.print(listbox2);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
listbox2.Clear;
if a.poisk(strtoint(edit2.Text))<> nil then listbox2.Items.Add('данный элемент есть в стеке')
  else listbox2.Items.Add('Данного элемента нету в стеке');
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  listbox2.Clear;
  if a.poiskafter(strtoint(edit2.Text))<> nil then
    listbox2.Items.Add('данный элемент есть в стеке')
  else listbox2.Items.Add('Данного элемента нету в стеке');
end;

end.
