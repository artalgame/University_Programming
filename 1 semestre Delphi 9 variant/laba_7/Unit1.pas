unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function kl(const s1:string):string;
 var i,m,n:integer;
begin
  m:=0;
  n:=0;
  for i:=1 to length(s1) do if s1[i]='0' then m:=m+1 else n:=n+1;
  result:='0-'+inttostr(m)+' 1-'+inttostr(n);
end;

function obst(const st:string):string;
 var l,i:integer;
  sr,s:string;
begin
  s:='';
  sr:='';
  l:=length(st);
  for i:=1 to l do
    if st[i]<>' ' then s:=s+st[i] else
      if (s<>'') and ((length(s) mod 2)=1) then
      begin
        sr:=sr+s+' ('+(kl(s)+') ');
        s:='';
      end
      else
      begin
        sr:=sr+s+' ';
        s:='';
      end;
  result:=sr;
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  form1.Close;
end;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then edit2.Text:=obst(edit1.Text+' ');
end;

end.
