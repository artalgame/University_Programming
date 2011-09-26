unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, mxarrays;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
nm=20;

type
mas1=array[1..nm,1..nm] of extended;
var
  Form1: TForm1;
  a:mas1;
  n,q,i,j:word;


implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 N:=3;
 Edit1.Text:=FloatToStr(N);
 StringGrid1.RowCount:=N+1;
 StringGrid1.ColCount:=N+1;
 StringGrid1.Cells[0,0]:='Матрица:';
 for i:=1 to N do begin
  StringGrid1.Cells[0,i]:=' i= '+IntToStr(i);
  StringGrid1.Cells[i,0]:=' j= '+IntToStr(i);
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  N:=StrToInt(Edit1.Text);
  StringGrid1.RowCount:=N+1;
  StringGrid1.ColCount:=N+1;
  for i:=1 to N do begin
  StringGrid1.Cells[0,i]:=' i= '+IntToStr(i);
  StringGrid1.Cells[i,0]:=' j= '+IntToStr(i);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     try
  {Заполнение массива А элементами из таблицы StringGrid1}
  for i:=1 to N do
   for j:=1 to N do
     A[i,j]:=StrToFloat(StringGrid1.Cells[j,i]);
     except
      on ERangeError do begin ShowMessage('Выход за пределы массива. Уменьшите размер массива');
      Exit; end;
      on EConvertError do begin ShowMessage('В ячейке отсутствует значение, либо число введено не правильно');
      Exit; end;
      else begin ShowMessage('Возникла неизвестная исключительная ситуация!');
      Exit; end;
     end;
      q:=0;
      j:=0;
      try
      while (j<>n) do
      begin
      i:=0;
      j:=j+1;
       while (n-i+1)<>j do
       begin
        i:=i+1;
        if a[i,j]<>a[(n-j+1),(n-i+1)] then begin
        q:=q+1;
        break;
        end;
       end;
       if q<>0 then break;
      end;
      except
        on EInvalidOp do begin MessageDlg('Неправильная операция с плавающей точкой',mtError,[mbCancel],0);Exit; end;
        on EOverFlow do begin MessageDlg('Переполнение при выполнении операции с плавающей точкой',mtError,[mbCancel],0); Exit; end;
         else begin MessageDlg('Возникла неизвестная исключительная ситуация! ',mtError,[mbCancel],0); Exit; end;
       end;

      if q=0 then memo1.lines.add('Матрица симметрична') else memo1.lines.add('Матрица не симметрична');
end;

end.
