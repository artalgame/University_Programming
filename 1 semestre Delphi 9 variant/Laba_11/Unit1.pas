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
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n:integer;
  a:mas;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  n:=strtoint(edit1.Text);
  stringgrid1.ColCount:=n;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  n:=strtoint(edit1.Text);
  stringgrid1.ColCount:=n;
end;

procedure TForm1.Button1Click(Sender: TObject);
 var i:integer;
begin
  for i:=1 to n do a[i]:=strtofloat(stringgrid1.cells[i-1,0]);
  edit2.Text:=floattostr(go(a,n));
end;

end.
