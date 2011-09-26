unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, unit2;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    Memo1: TMemo;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Button8: TButton;
    Edit4: TEdit;
    Label5: TLabel;
    Button9: TButton;
    Edit5: TEdit;
    Button10: TButton;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:tree;
  n:integer;
  mas:masinf;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  a:=tree.create;
  stringgrid1.ColCount:=strtoint(edit4.Text)+1;
  stringgrid1.Cells[0,0]:='фамилия';
  stringgrid1.Cells[0,1]:='номер';
  n:=0;
  memo1.Clear;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 a.free;
 form1.close;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  stringgrid1.ColCount:=strtoint(edit4.Text)+1;
end;

procedure TForm1.Button1Click(Sender: TObject);
 var i,p:integer;
begin
  p:=n;
  n:=n+stringgrid1.ColCount-1;
  for i:=1 to stringgrid1.ColCount-1 do begin mas[i+p].k:=strtoint(stringgrid1.Cells[i,1]);
  mas[i+p].fio:=stringgrid1.Cells[i,0]; end;
  a.mastotree(stringgrid1);
  a.view(treeview1);
end;


procedure TForm1.Button3Click(Sender: TObject);
 var buff:tinf;
begin
  n:=n+1;
  mas[n].k:=strtoint(edit2.Text);
  mas[n].fio:=edit1.Text;
  a.add(mas[n]);
  a.view(treeview1);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 memo1.clear;
 memo1.Lines.add(a.poisk(strtoint(edit3.Text)));
end;

procedure TForm1.Button5Click(Sender: TObject);
 var i,j:integer;
begin
  i:=1;
  while (i<>n+1) and (mas[i].k<>strtoint(edit3.Text)) do i:=i+1;
  if i<>n+1 then
  begin
    for j:=i to n-1 do mas[j]:=mas[j+1];
    n:=n-1;
  end;
  a.delk(strtoint(edit3.Text));
  a.view(treeview1);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  memo1.Clear;
  a.print(memo1);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  memo1.Clear;
  a.printobr(memo1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  a.free;
  a:=tree.create;
  a.balance(mas,n);
  a.view(treeview1);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  edit5.Text:=a.kol;
end;

end.
