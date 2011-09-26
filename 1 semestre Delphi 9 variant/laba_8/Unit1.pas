unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  kdr = record
    fio,dlj:string[40];
    otd,stj:extended;
  end;
var
  rab:array[1..100] of kdr;
  frab:file of kdr;
  trab:textfile;
  fn1,fn2:string;
  nz,i,j:integer;
  b:kdr;

var
  Form1: TForm1;



implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.clear;
  stringgrid1.Cells[0,0]:='ФИО';
  stringgrid1.Cells[1,0]:='Отдел';
  stringgrid1.Cells[2,0]:='Долж-ть';
  stringgrid1.Cells[3,0]:='Стаж';
  button5.Hide;
  button3.hide;
  bitbtn1.Hide;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  closefile(frab);
  form1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject); //создание нового файла
begin
  if opendialog1.Execute then
  begin
    Fn1:= OpenDialog1.FileName;
    AssignFile(Frab, Fn1);
    rewrite(frab);
    button5.Show;
    button3.Show;
    nz:=0;
    stringgrid1.RowCount:=nz+1;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);   // открытие файла
begin
  if opendialog1.Execute then
  begin
    Fn1:= OpenDialog1.FileName;
    AssignFile(Frab, Fn1);
    Reset(Frab);
    nz:=0;
    while not eof(frab) do
    begin
      nz:=nz+1;
      read(frab,rab[nz]);
    end;
    stringgrid1.RowCount:=nz+1;
    for i:=1 to nz do
    begin
      stringgrid1.Cells[0,i]:=rab[i].fio;
      stringgrid1.Cells[1,i]:=floattostr(rab[i].otd);
      stringgrid1.Cells[2,i]:=rab[i].dlj;
      stringgrid1.Cells[3,i]:=floattostr(rab[i].stj);
    end;
    button5.Show;
    button3.Show;
    bitbtn1.Show;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);  // сохранение файла
begin
  if savedialog1.Execute then
  begin
    fn2:=savedialog1.FileName;
    assignfile(trab,fn2);
    rewrite(trab);
    writeln(trab,'Фамилия_','Отдел_','Должность_','Стаж');
    for i:=1 to nz do writeln(trab,rab[i].fio,'_',rab[i].otd:4:0,'_',
     rab[i].dlj,'_',rab[i].stj:4:0);
    closefile(trab);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject); //ввод данных
begin
  nz:=nz+1;
  stringgrid1.RowCount:=nz+1;
  rab[nz].fio:=edit1.Text;
  rab[nz].otd:=strtofloat(edit2.Text);
  rab[nz].dlj:=edit3.Text;
  rab[nz].stj:=strtofloat(edit4.Text);
  write(frab,rab[nz]);
  stringgrid1.Cells[0,nz]:=rab[nz].fio;
  stringgrid1.Cells[1,nz]:=floattostr(rab[nz].otd);
  stringgrid1.Cells[2,nz]:=rab[nz].dlj;
  stringgrid1.Cells[3,nz
  ]:=floattostr(rab[nz].stj);
  bitbtn1.Show;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);  //сотрировочка
begin
  for i:=2 to nz do
    for j:=nz downto i do
      if (rab[j].otd<rab[j-1].otd) or
      ((rab[j].otd=rab[j-1].otd) and (rab[j].stj<rab[j-1].stj))  then
      begin
        b:=rab[j];
        rab[j]:=rab[j-1];
        rab[j-1]:=b;
      end;
  for i:=1 to nz do
  begin
    stringgrid1.Cells[0,i]:=rab[i].fio;
    stringgrid1.Cells[1,i]:=floattostr(rab[i].otd);
    stringgrid1.Cells[2,i]:=rab[i].dlj;
    stringgrid1.Cells[3,i]:=floattostr(rab[i].stj);
  end;
end;

end.
