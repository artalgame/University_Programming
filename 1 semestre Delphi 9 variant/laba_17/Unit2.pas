unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, stec, math;

type
 Tpz=class(TObject)
   mszn : array['a'..'я'] of extended;
   stec:TList;
   Function OBP(stri:string): string;
   Function AV(strp:string) : extended;
 End;

implementation

  var i:byte;

Function Tpz.OBP; // Перевод из инфиксной формы в польскую запись
 Var pc:0..3;
   ch,ch1 : char;
 Function prior(ch:char):byte;  // Определение приоритета операции
 begin
   case ch of
     '(',')': Result:=0;
     '+','-': Result:=1;
     '*','/': Result:=2;
     '^': Result:=3;
   end;
 end;
begin
  Result:='';
  stec:=TList.create;
  for i:=1 to length(stri) do
  begin
    ch:=stri[i];
    if not (ch in ['+','-','*','/','(',')','^']) then
      Result:=Result+ch //записываем операнды
      else
        if stec.sp1=Nil then stec.Add1(ch) else
          if ch='(' then stec.Add1(ch) else
            if ch=')' then
            begin
              stec.Read1(ch); // Выталкивание всех операций
              While ch<>'(' do
              begin
                Result:=Result+ch;
                stec.Read1(ch);
              end;
            end
            else
            begin // Выталкивание более приоритетных
              pc:=prior(ch);
              While (stec.sp1<>Nil) and (pc<= prior(stec.sp1.Inf)) do
              begin
                stec.Read1(ch1);
                Result:=Result+ch1;
              end;
              stec.Add1(ch); // Добавить после выталкивания
            end;
  end;
  While stec.sp1<>nil do
  begin
    stec.Read1(ch);
    Result:=Result+ch;
  end;
  stec.Free;
end;

Function Tpz.AV;  // Вычисление польской записи
 Var ch,ch1,ch2,chr : char;
   op1,op2 : extended;
begin
  stec:=TList.create;
  chr:=Succ('z');
  for i:=1 to length(strp) do
  begin
    ch:=strp[i];
    if not (ch in ['*','/','+','-','^']) then
      stec.Add1(ch) else
      begin
        stec.Read1(ch2);
        stec.Read1(ch1);
        op1:=mszn[ch1];
        op2:=mszn[ch2];
        case ch of
          '+': Result:=op1+op2;
          '-': Result:=op1-op2;
          '*': Result:=op1*op2;
          '/': Result:=op1/op2;
          '^': Result:=power(op1,op2);
        end;
        mszn[chr]:= Result;
        stec.Add1(chr);
        Inc(chr);
      end;
  end;
  stec.Free;
end;

end.
