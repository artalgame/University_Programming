unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, unit2;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    StringGrid2: TStringGrid;
    Button2: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:tlistsmpmaxij;
  bl:boolean;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  with stringgrid1 do
  begin
    cells[0,0]:='I';
    cells[1,0]:='J';
    cells[2,0]:='Inf';
  end;
  memo1.Clear;
  stringgrid2.colcount:=strtoint(edit1.text);
  stringgrid2.rowcount:=strtoint(edit1.text);
  bl:=true;
  button2.Visible:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  stringgrid2.colcount:=strtoint(edit2.text);
  stringgrid2.rowcount:=strtoint(edit1.text);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if bl then
  begin
    bl:=not bl;
    button1.Visible:=false;
    button2.Visible:=true;
    label1.Visible:=false;
    label3.visible:=false;
    edit1.Visible:=false;
    edit2.Visible:=false;
    a:=tlistsmpmaxij.create(strtoint(edit2.text),strtoint(edit1.text));
  end;
  with stringgrid1 do
    a.addj(strtoint(cells[0,1]),strtoint(cells[1,1]),strtoint(cells[2,1]));
  a.Print(stringgrid2);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  a.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
 var i,j:integer;
begin
  a.maxij(i,j);
  memo1.lines.Add('I и J максимального элемента');
  memo1.Lines.Add('I= '+inttostr(i)+' J= '+inttostr(j));
end;

end.
