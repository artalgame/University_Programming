unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, unit2;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo2: TMemo;
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:th;

implementation

{$R *.dfm}

procedure TForm1.Button5Click(Sender: TObject);
begin
  a:=th.create(strtoint(edit3.text));
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  a.Free(stringgrid1);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  a.print(memo2);
end;

procedure TForm1.Button1Click(Sender: TObject);
 var buff:tinf;
begin
  buff.Fio:=edit1.Text;
  buff.key:=strtoint(edit2.Text);
  a.Add(buff);
  a.print(memo1);
end;

procedure TForm1.Button2Click(Sender: TObject);
 var buff:tinf;
begin
  a.Red(strtoint(edit2.Text),buff);
  edit1.Text:=buff.Fio;
  a.print(memo1);
end;

procedure TForm1.Button3Click(Sender: TObject);
 var buff:tinf;
begin
  a.Read(strtoint(edit2.Text),buff);
  edit1.Text:=buff.Fio;
  a.print(memo1);
end;

end.
