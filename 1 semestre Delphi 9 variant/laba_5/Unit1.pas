unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type
  tmas = array[1..1] of char;
  pmas=^tmas;
var
  Form1: TForm1;
  a:pmas;
  i,n,k:integer;

implementation

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
StringGrid1.ColCount:=strtoint(edit1.Text);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 n:=strtoint(edit1.Text);
 k:=0;
 getmem(a,n);
 For i:=1 to n do a[i]:=stringgrid1.Cells[i-1,0][1];
 for i:=1 to (n div 2) do if a[i]<>a[n-i+1] then
 begin
  k:=1;
  break;
 end;
 if k=0 then edit2.Text:='массив симметричен'
 else edit2.Text:='массив не симметричен';
 freemem(a,n*sizeof(char));

end;

end.
