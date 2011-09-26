unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit2, Unit3, Unit4, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ListBox2: TListBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Button9: TButton;
    Button11: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:tlisto2;
  b:tlisto;

implementation

{$R *.dfm}

procedure TForm1.Button9Click(Sender: TObject);
 var buff:string;
begin
  memo1.Clear;
  if opendialog1.Execute then
  begin
    assignfile(input,opendialog1.FileName);
    reset(input);
    while not eof do
    begin
      readln(buff);
      a.addk(buff);
    end;
    a.ciklspisok;
    a.print(memo1);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  a:=tlisto2.create;
  b:=tlisto.create;
  memo1.Clear;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  memo1.Clear;
  a.print(memo1);
end;

procedure TForm1.Button1Click(Sender: TObject);
 var buff:tinf;
begin
  listbox1.Clear;
  b.reads(buff);
  edit1.Text:=inttostr(buff.k);
  b.print(listbox1);
end;

procedure TForm1.Button2Click(Sender: TObject);
var buff:tinf;
begin
  listbox1.Clear;
  buff.k:=strtoint(edit1.Text);
  b.Addk(buff);
  b.print(listbox1);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  b.sortslip;
  listbox1.Clear;
  b.print(listbox1);
end;

procedure TForm1.Button4Click(Sender: TObject);
 var buff:tinf;
begin
  listbox1.Clear;
  buff.k:=strtoint(edit1.Text);
  b.addafter(b.poisk(strtoint(edit2.text)),buff);
  b.print(listbox1);
end;

procedure TForm1.Button3Click(Sender: TObject);
 var buff:tinf;
begin
  listbox1.Clear;
  b.readafter(b.poisk(strtoint(edit2.text)),buff);
  edit1.Text:=inttostr(buff.k);
  b.print(listbox1);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  listbox2.Clear;
  if b.poisk(strtoint(edit2.Text))<> nil then
    listbox2.Items.Add('данный элемент есть в этом стеке')
  else listbox2.Items.Add('даного элемента нет в этом стеке');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  listbox2.Clear;
  if b.poiskafter(strtoint(edit2.Text))<> nil then
    listbox2.Items.Add('данный элемент есть в этом стеке')
  else listbox2.Items.Add('даного элемента нет в этом стеке');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  listbox2.clear;
  b.print(listbox2);
end;

end.
