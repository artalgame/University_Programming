unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit2;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button11: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:tdbpis;
  b:tzap;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);     // закрытие формы
begin
  form1.Close;
  a.flclose;
end;

procedure TForm1.Button3Click(Sender: TObject);     //Очистка мемо
begin
  memo1.Clear;
  memo1.lines.Add('Наименование'+'  '+'Номер цеха'+'  '+'Кол-во продукции');
end;

procedure TForm1.Button5Click(Sender: TObject);   //чтение из файла
 var i:integer;
begin
  a:=tdbpis.create;
  a.readfromfile(opendialog1);
  memo1.clear;
  memo1.lines.Add('Наименование'+'  '+'Номер цеха'+'  '+'Кол-во продукции');
  for i:=1 to a.n do memo1.Lines.Add(a.a[i].nm+'  '+floattostr(a.a[i].numc)+'  '+
    floattostr(a.a[i].k));
  button1.Visible:=true;
  button2.Visible:=true;
  button3.Visible:=true;
  button4.Visible:=true;
  button6.Visible:=true;
  button7.Visible:=true;
  button8.Visible:=true;
  button9.Visible:=true;
  button10.Visible:=true;
  button11.Visible:=true;
  edit1.Visible:=true;
  edit2.Visible:=true;
  edit3.Visible:=true;
  edit5.Visible:=true;
  edit4.Visible:=true;
  edit6.Visible:=true;
  label1.Visible:=true;
  label2.Visible:=true;
  label3.Visible:=true;
  memo1.Visible:=true;
end;

procedure TForm1.Button6Click(Sender: TObject); //запись в файл
begin
  a.writefromfile(savedialog1);
end;

procedure TForm1.FormCreate(Sender: TObject); //форм криэйт
begin
  memo1.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);   //Добавка записи
 var b:tzap;
begin
  b.k:=strtoint(edit2.Text);
  b.numc:=strtoint(edit3.Text);
  b.nm:=edit1.text;
  a.addzap(b);
  memo1.lines.Add(b.nm+'  '+floattostr(b.numc)+'  '+floattostr(b.k));
end;

procedure TForm1.Button4Click(Sender: TObject);  //удаление эл-та из массива
 var i:integer;
begin
  a.remove(strtoint(edit4.Text));
  memo1.Clear;
  memo1.lines.Add('Наименование'+'  '+'Номер цеха'+'  '+'Кол-во продукции');
  for i:=1 to a.n do memo1.Lines.Add(a.a[i].nm+'  '+floattostr(a.a[i].numc)+'  '+floattostr(a.a[i].k));
end;

procedure TForm1.Button7Click(Sender: TObject);  //сортировка методом слияния
 var i:integer;
begin
  a.slipsort(1,a.n);
  memo1.Clear;
  memo1.lines.Add('Наименование'+'  '+'Номер цеха'+'  '+'Кол-во продукции');
  for i:=1 to a.n do memo1.Lines.Add(a.a[i].nm+'  '+floattostr(a.a[i].numc)+'  '+floattostr(a.a[i].k));
end;

procedure TForm1.Button8Click(Sender: TObject);  //сортировка методои QuickSort
 var i:integer;
begin
  a.quicksort(1,a.n);
  memo1.Clear;
  memo1.lines.Add('Наименование'+'  '+'Номер цеха'+'  '+'Кол-во продукции');
  for i:=1 to a.n do memo1.Lines.Add(a.a[i].nm+'  '+floattostr(a.a[i].numc)+'  '+floattostr(a.a[i].k));
end;

procedure TForm1.Button9Click(Sender: TObject);    //Линейный поиск эл-та в массиве по ключу
begin
  a.linp(strtoint(edit5.Text));
  if a.numb<> 0 then memo1.Lines.add('данный эл-т есть в массиве на позиции '+inttostr(a.numb))
    else memo1.Lines.add('данного эл-та нет в массиве');
end;

procedure TForm1.Button10Click(Sender: TObject);  //Двоичный поиск эл-та по ключу
begin
  a.dublep(strtoint(edit5.Text));
  if a.numb<> 0 then memo1.Lines.add('данный эл-т есть в массиве на позиции '+inttostr(a.numb))
    else memo1.Lines.add('данного эл-та нет в массиве');
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  memo1.Lines.Add('Результаты поиска изделий для цеха номер '+edit6.Text);
  memo1.Lines.Add('Наименование'+'  '+'Кол-во продукции');
  a.vivodceh(strtoint(edit6.Text),memo1);
end;

end.
