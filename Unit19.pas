unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Math;

type
  TForm19 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;
  pos2,bol: boolean;

implementation

uses Unit20, Unit21, Unit23;

{$R *.dfm}


function info(a: widestring) : widestring;
var i: word;
begin

if (pos('!',a)<>0) or (pos('//',a)<>0)  then begin
for i:=0 to length(a) do
if (copy(a,i,1)='!') or (copy(a,i,2)='//') then  begin
result:=copy(a,1,i-1);
break;
end;
end
else result:=a;

end;






procedure TForm19.BitBtn1Click(Sender: TObject);
var i: integer;
begin
pos2:=false;
Form20.Show;

if EDst1<>nil then begin
for i:=0 to length(EDst1)-1 do begin
FreeAndNil(EDst1[i]);
FreeAndNil(EDst2[i]);
FreeAndNil(EDst3[i]);
FreeAndNil(EDst4[i]);
FreeAndNil(CBst1[i]);
FreeAndNil(CBst2[i]);
FreeAndNil(CBst3[i]);
FreeAndNil(CBst4[i]);
FreeAndNil(ClBst1[i]);
end;
end;

if ChB3<>nil then begin
for i:=0 to length(ChB3)-1 do begin
FreeAndNil(EDst5[i]);
FreeAndNil(EDst6[i]);
FreeAndNil(CBst5[i]);
FreeAndNil(CBst6[i]);
FreeAndNil(ClBst2[i]);
FreeAndNil(LB[i]);
FreeAndNil(ChB3[i]);
end;
end;


if EDst7<>nil then begin
for i:=0 to length(EDst7)-1 do begin
FreeAndNil(EDst7[i]);
FreeAndNil(EDst8[i]);
FreeAndNil(CBst7[i]);
FreeAndNil(CBst8[i]);
FreeAndNil(CBst9[i]);
FreeAndNil(CBst10[i]);
FreeAndNil(ClBst3[i]);
FreeAndNil(EDx1[i]);
FreeAndNil(EDy1[i]);
end;
end;


if EDst9<>nil then begin
for i:=0 to length(EDst9)-1 do begin
FreeAndNil(EDst9[i]);
FreeAndNil(EDst10[i]);
FreeAndNil(CBst11[i]);
FreeAndNil(CBst12[i]);
FreeAndNil(CBst13[i]);
FreeAndNil(CBst14[i]);
FreeAndNil(ClBst4[i]);
FreeAndNil(EDx2[i]);
FreeAndNil(EDy2[i]);
end;
end;



if EDst11<>nil then begin
for i:=0 to length(EDst11)-1 do begin
FreeAndNil(EDst11[i]);
FreeAndNil(EDst12[i]);
FreeAndNil(CBst15[i]);
FreeAndNil(CBst16[i]);
FreeAndNil(CBst17[i]);
FreeAndNil(CBst18[i]);
FreeAndNil(ClBst5[i]);
FreeAndNil(EDx3[i]);
FreeAndNil(EDy3[i]);
end;
end;



if EDst13<>nil then begin
for i:=0 to length(EDst13)-1 do begin
FreeAndNil(EDst13[i]);
FreeAndNil(EDst14[i]);
FreeAndNil(EDst15[i]);
FreeAndNil(CBst19[i]);
FreeAndNil(CBst20[i]);
FreeAndNil(CBst21[i]);
FreeAndNil(CBst22[i]);
FreeAndNil(ClBst6[i]);
FreeAndNil(EDx4[i]);
FreeAndNil(EDy4[i]);
FreeAndNil(LB1[i]);
end;
end;














end;

procedure TForm19.BitBtn2Click(Sender: TObject);
var f: TextFile;
i,j,p,cn1,cn2,cn3,cn4,cn5,cn6,cn7,cn8,cn9,cn10,cn11,cn12,cn13,cn14,cn15,cn16,cn17,cn18,cn19,cn20,cn21,cn22,l,l1,l2,k: word;    // определение номеров позиций разделителей
str,strx: array of widestring;
p01,p02,p03: widestring;
prm1,prm2,prm3,prm4,prm5,prm6,prm7,prm8,prm9: widestring;  //переменные для присвоения значений строк направлений
prm01,prm02,prm03,prm04,prm05,prm06: widestring;  // Дополнительные переменные для присвоения значений Name=(),Energy=() и Num=()
sn_points,m,n,sn_ar,sn_titl: integer;
coff,reper: real;
label 0,1,2,14,33;
begin




for i:=0 to length(EDst2)-1 do begin
if EDst1<>nil then  FreeAndNil(EDst1[i]);
if EDst2<>nil then  FreeAndNil(EDst2[i]);
if EDst3<>nil then  FreeAndNil(EDst3[i]);
if EDst4<>nil then  FreeAndNil(EDst4[i]);
if CBst1<>nil then  FreeAndNil(CBst1[i]);
if CBst2<>nil then  FreeAndNil(CBst2[i]);
if CBst3<>nil then  FreeAndNil(CBst3[i]);
if CBst4<>nil then  FreeAndNil(CBst4[i]);
if ClBst1<>nil then  FreeAndNil(ClBst1[i]);
end;

for i:=0 to length(EDst5)-1 do begin
if EDst5<>nil then  FreeAndNil(EDst5[i]);
if EDst6<>nil then  FreeAndNil(EDst6[i]);
if CBst5<>nil then  FreeAndNil(CBst5[i]);
if CBst6<>nil then  FreeAndNil(CBst6[i]);
if ClBst2<>nil then  FreeAndNil(ClBst2[i]);
if LB<>nil then  FreeAndNil(LB[i]);
if ChB3<>nil then  FreeAndNil(ChB3[i]);
end;

for i:=0 to length(EDst7)-1 do begin
if EDst7<>nil then  FreeAndNil(EDst7[i]);
if EDst8<>nil then  FreeAndNil(EDst8[i]);
if CBst7<>nil then  FreeAndNil(CBst7[i]);
if CBst8<>nil then  FreeAndNil(CBst8[i]);
if CBst9<>nil then  FreeAndNil(CBst9[i]);
if CBst10<>nil then  FreeAndNil(CBst10[i]);
if ClBst3<>nil then  FreeAndNil(ClBst3[i]);
if EDx1<>nil then  FreeAndNil(EDx1[i]);
if EDy1<>nil then  FreeAndNil(EDy1[i]);
end;

for i:=0 to length(EDst9)-1 do begin
if EDst9<>nil then  FreeAndNil(EDst9[i]);
if EDst10<>nil then  FreeAndNil(EDst10[i]);
if CBst11<>nil then  FreeAndNil(CBst11[i]);
if CBst12<>nil then  FreeAndNil(CBst12[i]);
if CBst13<>nil then  FreeAndNil(CBst13[i]);
if CBst14<>nil then  FreeAndNil(CBst14[i]);
if ClBst4<>nil then  FreeAndNil(ClBst4[i]);
if EDx2<>nil then  FreeAndNil(EDx2[i]);
if EDy2<>nil then  FreeAndNil(EDy2[i]);
end;

for i:=0 to length(EDst11)-1 do begin
if EDst11<>nil then  FreeAndNil(EDst11[i]);
if EDst12<>nil then  FreeAndNil(EDst12[i]);
if CBst15<>nil then  FreeAndNil(CBst15[i]);
if CBst16<>nil then  FreeAndNil(CBst16[i]);
if CBst17<>nil then  FreeAndNil(CBst17[i]);
if CBst18<>nil then  FreeAndNil(CBst18[i]);
if ClBst5<>nil then  FreeAndNil(ClBst5[i]);
if EDx3<>nil then  FreeAndNil(EDx3[i]);
if EDy3<>nil then  FreeAndNil(EDy3[i]);
end;

for i:=0 to length(EDst13)-1 do begin
if EDst13<>nil then  FreeAndNil(EDst13[i]);
if EDst14<>nil then  FreeAndNil(EDst14[i]);
if EDst15<>nil then  FreeAndNil(EDst15[i]);
if CBst19<>nil then  FreeAndNil(CBst19[i]);
if CBst20<>nil then  FreeAndNil(CBst20[i]);
if CBst21<>nil then  FreeAndNil(CBst21[i]);
if CBst22<>nil then  FreeAndNil(CBst22[i]);
if ClBst6<>nil then  FreeAndNil(ClBst6[i]);
if EDx4<>nil then  FreeAndNil(EDx4[i]);
if EDy4<>nil then  FreeAndNil(EDy4[i]);
if LB1<>nil then  FreeAndNil(LB1[i]);
end;

//EDst11:=nil;
//EDst12:=nil;
//EDst13:=nil;


setlength(EDst1,0);
setlength(EDst2,0);
setlength(EDst3,0);
setlength(EDst4,0);
setlength(EDst5,0);
setlength(EDst6,0);
setlength(EDst7,0);
setlength(EDst8,0);
setlength(EDst9,0);
setlength(EDst10,0);
setlength(EDst11,0);
setlength(EDst12,0);
setlength(EDst13,0);
setlength(EDst14,0);
setlength(EDst15,0);

setlength(CBst1,0);
setlength(CBst2,0);
setlength(CBst3,0);
setlength(CBst4,0);
setlength(CBst5,0);
setlength(CBst6,0);
setlength(CBst7,0);
setlength(CBst8,0);
setlength(CBst9,0);
setlength(CBst10,0);
setlength(CBst11,0);
setlength(CBst12,0);
setlength(CBst13,0);
setlength(CBst14,0);
setlength(CBst15,0);
setlength(CBst16,0);
setlength(CBst17,0);
setlength(CBst18,0);
setlength(CBst19,0);
setlength(CBst20,0);
setlength(CBst21,0);
setlength(CBst22,0);

setlength(EDx1,0);
setlength(EDx2,0);
setlength(EDx3,0);
setlength(EDx4,0);
setlength(EDy1,0);
setlength(EDy2,0);
setlength(EDy3,0);
setlength(EDy4,0);


setlength(LB,0);
setlength(LB1,0);

setlength(ClBst1,0);
setlength(ClBst2,0);
setlength(ClBst3,0);
setlength(ClBst4,0);
setlength(ClBst5,0);
setlength(ClBst6,0);









i:=0;


pos2:=true;
sn_points:=1;   //число переменных
sn_ar:=1;  //число переменных для раздела AR
sn_titl:=1;  //число переменных для раздела SPT
bol:=false;

if pos33=true then begin
AssignFile(f,'__tmp.dgr');
Reset(f);
while not Eof(f) do begin
setlength(str,i+1);
ReadLn(f,str[i]);
i:=i+1;
end;
CloseFile(f);



goto 14;


end;  /////////////////////////////////////
//////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////




if OpenDialog1.Execute=true then begin
AssignFile(f,OpenDialog1.FileName);
Reset(f);
i:=0;
while not Eof(f) do begin
setlength(str,i+1);
ReadLn(f,str[i]);
i:=i+1;
end;
CloseFile(f);

//Параметры по умолчанию для диаграммы
14: Form21.CheckBox3.Checked:=True;
Form21.Edit3.Text:='Энергетическая диаграмма';
Form21.ComboBox15.ItemIndex:=2;
Form21.ComboBox16.ItemIndex:=0;
Form21.ColorBox4.ItemIndex:=Form21.ColorBox4.Items.IndexOf('Black');
Form21.ComboBox17.ItemIndex:=0;
Form21.RadioButton4.Checked:=True;
Form21.TrackBar1.Position:=1;
Form21.TrackBar2.Position:=1;
Form21.TrackBar3.Position:=5;
Form21.Edit4.Text:='100';
Form21.Edit5.Text:='80';
//Параметры по умолчанию для осей
Form21.CheckBox1.Checked:=True;
Form21.Edit1.Text:='Координата реакции';
Form21.ComboBox2.ItemIndex:=0;
Form21.ComboBox3.ItemIndex:=4;
Form21.ComboBox4.ItemIndex:=0;
Form21.ColorBox1.ItemIndex:=Form21.ColorBox1.Items.IndexOf('Black');
Form21.ComboBox5.ItemIndex:=0;
Form21.CheckBox2.Checked:=True;
Form21.Edit2.Text:='Энергия, ккал/моль';
Form21.ComboBox6.ItemIndex:=0;
Form21.ComboBox9.ItemIndex:=3;
Form21.ComboBox1.ItemIndex:=4;
Form21.ComboBox7.ItemIndex:=0;
Form21.RadioButton1.Checked:=True;
Form21.ComboBox8.ItemIndex:=5;
Form21.ComboBox10.ItemIndex:=0;
Form21.ColorBox2.ItemIndex:=Form21.ColorBox2.Items.IndexOf('Black');
Form21.ComboBox11.ItemIndex:=0;
Form21.ComboBox12.ItemIndex:=3;
Form21.ComboBox13.ItemIndex:=0;
Form21.ColorBox3.ItemIndex:=Form21.ColorBox3.Items.IndexOf('Black');
Form21.ComboBox14.ItemIndex:=0;
Form21.CheckBox4.Checked:=True;     //
Form21.ColorBox5.ItemIndex:=Form21.ColorBox5.Items.IndexOf('Blue');
Form21.ComboBox18.ItemIndex:=1;
Form21.ComboBox19.ItemIndex:=0;
Form21.CheckBox5.Checked:=False;
Form21.ColorBox6.ItemIndex:=Form21.ColorBox6.Items.IndexOf('Lime');
Form21.ComboBox20.ItemIndex:=1;
Form21.ComboBox21.ItemIndex:=0;
Form21.CheckBox6.Checked:=False;
Form21.ColorBox7.ItemIndex:=Form21.ColorBox7.Items.IndexOf('Red');
Form21.ComboBox22.ItemIndex:=1;
Form21.ComboBox23.ItemIndex:=0;
Form21.Edit6.Text:='100 %';
Form21.Edit7.Text:='100 %';




for i:=0 to length(str)-1 do  begin
if (pos('TD',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('YES',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('TD',uppercase(info(str[i])))) and  (pos('YES',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox3.Checked:=True;
if (pos('TD',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('NO',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('TD',uppercase(info(str[i])))) and  (pos('NO',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox3.Checked:=False;
if (pos('TD_PL',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('UP',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('TD_PL',uppercase(info(str[i])))) and  (pos('UP',uppercase(info(str[i])))> pos('=',uppercase(info(str[i])))) then Form21.RadioButton4.Checked:=True;
if (pos('TD_PL',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('DOWN',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('TD_PL',uppercase(info(str[i])))) and  (pos('DOWN',uppercase(info(str[i])))> pos('=',uppercase(info(str[i])))) then Form21.RadioButton5.Checked:=True;
if (pos('TD',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and   (pos('"',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('TD',uppercase(info(str[i])))) then
begin    // Название диаграммы
p01:=copy(info(str[i]),pos('"',info(str[i]))+1,1000);
p02:=copy(p01,0,pos('"',p01)-1);
Form21.Edit3.Text:=p02;
end;
if (pos('TD(FS)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('TD(FS)',uppercase(info(str[i])))) then
begin  //размер шрифта диаграммы
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox15.ItemIndex:=Form21.Combobox15.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3)+' пт');
end;
if (pos('TD(FN)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('TD(FN)',uppercase(info(str[i])))) then
begin  //имя шрифта диаграммы
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox16.ItemIndex:=Form21.Combobox16.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;
if (pos('TD(FC)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('TD(FC)',uppercase(info(str[i])))) then
begin  //цвет шрифта  диаграммы
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Colorbox4.ItemIndex:=Form21.Colorbox4.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

if (pos('TD(FST)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('TD(FST)',uppercase(info(str[i])))) then
begin  //стиль шрифта диаграммы
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox17.ItemIndex:=Form21.Combobox17.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


if (pos('IPX',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('IPX',uppercase(info(str[i])))) then
begin  //начальная точка
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Edit4.Text:=copy(info(str[i]),cn1+cn2+2,cn3);
end;


if (pos('IPY',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('IPY',uppercase(info(str[i])))) then
begin  //начальная точка
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Edit5.Text:=copy(info(str[i]),cn1+cn2+2,cn3);
end;



if (pos('SCX',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('SCX',uppercase(info(str[i])))) then
begin  //масштабирование по Х
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.TrackBar1.Position:=strtoint(copy(info(str[i]),cn1+cn2+2,cn3));
end;

if (pos('SCY',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('SCY',uppercase(info(str[i])))) then
begin  //масштабирование по Y
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.TrackBar2.Position:=strtoint(copy(info(str[i]),cn1+cn2+2,cn3));
end;

if (pos('SCIS',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('SCIS',uppercase(info(str[i])))) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.TrackBar3.Position:=strtoint(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//наличие или отсутствие оси Х
if (pos('AX',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('YES',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('AX',uppercase(info(str[i])))) and  (pos('YES',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) and (pos('LMAX',uppercase(info(str[i])))=0)   then Form21.CheckBox1.Checked:=True;
if (pos('AX',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('NO',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('AX',uppercase(info(str[i])))) and  (pos('NO',uppercase(info(str[i])))> pos(':',uppercase(info(str[i]))))  and (pos('LMAX',uppercase(info(str[i])))=0)   then Form21.CheckBox1.Checked:=False;

//Заголовок оси Х
if (pos('AX',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and   (pos('"',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AX',uppercase(info(str[i])))) then
begin    // Название диаграммы
p01:=copy(info(str[i]),pos('"',info(str[i]))+1,1000);
p02:=copy(p01,0,pos('"',p01)-1);
Form21.Edit1.Text:=p02;
end;

//Толщина оси Х
if (pos('AX(W)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AX(W)',uppercase(info(str[i])))) and (pos('LMAX(W)',uppercase(info(str[i])))=0) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox2.ItemIndex:=Form21.Combobox2.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//размер шрифта оси Х
if (pos('AX(FS)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AX(FS)',uppercase(info(str[i])))) then
begin  
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox3.ItemIndex:=Form21.Combobox3.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3)+' пт');
end;

//имя шрифта оси Х
if (pos('AX(FN)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AX(FN)',uppercase(info(str[i])))) then
begin  
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox4.ItemIndex:=Form21.Combobox4.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//цвет шрифта оси Х
if (pos('AX(FC)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AX(FC)',uppercase(info(str[i])))) then
begin  
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Colorbox1.ItemIndex:=Form21.Colorbox1.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//стиль шрифта оси Х
if (pos('AX(FST)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AX(FST)',uppercase(info(str[i])))) then
begin  
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox5.ItemIndex:=Form21.Combobox5.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//ОСЬ Y

//наличие или отсутствие оси Y
if (pos('AY',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('YES',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('AY',uppercase(info(str[i])))) and  (pos('YES',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox2.Checked:=True;
if (pos('AY',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('NO',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('AY',uppercase(info(str[i])))) and  (pos('NO',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox2.Checked:=False;

//Заголовок оси Y
if (pos('AY',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and   (pos('"',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AY',uppercase(info(str[i])))) then
begin    // Название диаграммы
p01:=copy(info(str[i]),pos('"',info(str[i]))+1,1000);
p02:=copy(p01,0,pos('"',p01)-1);
Form21.Edit2.Text:=p02;
end;

//Толщина оси Y
if (pos('AY(W)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AY(W)',uppercase(info(str[i])))) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox6.ItemIndex:=Form21.Combobox6.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//размер шрифта оси Y
if (pos('AY(FS)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AY(FS)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox8.ItemIndex:=Form21.Combobox8.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3)+' пт');
end;

//имя шрифта оси Y
if (pos('AY(FN)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AY(FN)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox10.ItemIndex:=Form21.Combobox10.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//цвет шрифта оси Y
if (pos('AY(FC)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AY(FC)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Colorbox2.ItemIndex:=Form21.Colorbox2.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//стиль шрифта оси Y
if (pos('AY(FST)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AY(FST)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox11.ItemIndex:=Form21.Combobox11.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//Деления на шкале Y

//Толщина тиков
if (pos('AYT(W)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT(W)',uppercase(info(str[i])))) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox7.ItemIndex:=Form21.Combobox7.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//Длина тиков
if (pos('AYT(L)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT(L)',uppercase(info(str[i])))) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox1.ItemIndex:=Form21.Combobox1.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//Частота тиков
if (pos('AYT(F)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT(F)',uppercase(info(str[i])))) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox9.ItemIndex:=Form21.Combobox9.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//Место расположения тиков на оси
if (pos('AYT_PL',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('OUT',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT_PL',uppercase(info(str[i])))) and  (pos('OUT',uppercase(info(str[i])))> pos('=',uppercase(info(str[i])))) then Form21.RadioButton1.Checked:=True;
if (pos('AYT_PL',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('IN',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT_PL',uppercase(info(str[i])))) and  (pos('IN',uppercase(info(str[i])))> pos('=',uppercase(info(str[i])))) then Form21.RadioButton2.Checked:=True;
if (pos('AYT_PL',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('CENTRE',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT_PL',uppercase(info(str[i])))) and  (pos('CENTRE',uppercase(info(str[i])))> pos('=',uppercase(info(str[i])))) then Form21.RadioButton3.Checked:=True;


//размер шрифта у тика
if (pos('AYT(FS)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT(FS)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox12.ItemIndex:=Form21.Combobox12.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3)+' пт');
end;

//имя шрифта у тика
if (pos('AYT(FN)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT(FN)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox13.ItemIndex:=Form21.Combobox13.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//цвет шрифта у тика
if (pos('AYT(FC)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT(FC)',uppercase(info(str[i])))) then
begin  
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Colorbox3.ItemIndex:=Form21.Colorbox3.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//стиль шрифта у тика
if (pos('AYT(FST)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('AYT(FST)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox14.ItemIndex:=Form21.Combobox14.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;




//Нулевая линия - наличие
if (pos('LZ',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('YES',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('LZ',uppercase(info(str[i])))) and  (pos('YES',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox4.Checked:=True;
if (pos('LZ',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('NO',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('LZ',uppercase(info(str[i])))) and  (pos('NO',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox4.Checked:=False;
if (pos('LMIN',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('YES',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('LMIN',uppercase(info(str[i])))) and  (pos('YES',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox5.Checked:=True;
if (pos('LMIN',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('NO',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('LMIN',uppercase(info(str[i])))) and  (pos('NO',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox5.Checked:=False;
if (pos('LMAX',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('YES',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('LMAX',uppercase(info(str[i])))) and  (pos('YES',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox6.Checked:=True;
if (pos('LMAX',uppercase(info(str[i])))<>0) and  (pos(':',uppercase(info(str[i])))<>0) and (pos('NO',uppercase(info(str[i])))<>0) and (pos(':',uppercase(info(str[i])))> pos('LMAX',uppercase(info(str[i])))) and  (pos('NO',uppercase(info(str[i])))> pos(':',uppercase(info(str[i])))) then Form21.CheckBox6.Checked:=False;


//Цвет нулевой линии
if (pos('LZ(C)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LZ(C)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Colorbox5.ItemIndex:=Form21.Colorbox5.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//Цвет линии минимума
if (pos('LMIN(C)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LMIN(C)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Colorbox6.ItemIndex:=Form21.Colorbox6.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//Цвет линии максимума
if (pos('LMAX(C)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LMAX(C)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Colorbox7.ItemIndex:=Form21.Colorbox7.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//стиль нулевой линии
if (pos('LZ(ST)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LZ(ST)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox18.ItemIndex:=Form21.Combobox18.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;



//стиль LMIN
if (pos('LMIN(ST)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LMIN(ST)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox20.ItemIndex:=Form21.Combobox20.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;

//стиль LMAX
if (pos('LMAX(ST)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LMAX(ST)',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox22.ItemIndex:=Form21.Combobox22.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//Толщина нулевой линии
if (pos('LZ(W)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LZ(W)',uppercase(info(str[i])))) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox19.ItemIndex:=Form21.Combobox19.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//Толщина LMIN
if (pos('LMIN(W)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LMIN(W)',uppercase(info(str[i])))) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox21.ItemIndex:=Form21.Combobox21.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;


//Толщина LMAX
if (pos('LMAX(W)',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LMAX(W)',uppercase(info(str[i])))) then
begin  //масштабирование внутреннего пространства
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Combobox23.ItemIndex:=Form21.Combobox23.Items.IndexOf(copy(info(str[i]),cn1+cn2+2,cn3));
end;



//Значение LMIN
if (pos('LMIN',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LMIN',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Edit6.Text:=copy(info(str[i]),cn1+cn2+2,200);
end;



//Значение LMAX
if (pos('LMAX',uppercase(info(str[i])))<>0) and  (pos('=',uppercase(info(str[i])))<>0) and (pos('=',uppercase(info(str[i])))> pos('LMAX',uppercase(info(str[i])))) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)<>'=') then cn1:=cn1+1
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+p+1,1)=' ') then cn2:=cn2+1       //элемент
else break;
end;
for p:=1 to length(info(str[i])) do  begin
if (copy(info(str[i]),cn1+cn2+p+1,1)<>' ') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>'') and  (copy(info(str[i]),cn1+cn2+p+1,1)<>#13) then cn3:=cn3+1      //пробелы элемент-порядковый номер
else break;
end;
Form21.Edit7.Text:=copy(info(str[i]),cn1+cn2+2,200);
end;





























if (pos('#ABSE',uppercase(info(str[i])))<>0) or (pos('ABSE',uppercase(info(str[i])))<>0) or (pos('REL',uppercase(info(str[i])))<>0)  then begin
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)=' ') then cn1:=cn1+1    //пробелы до Идентификатора
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+p,1)<>' ') then cn2:=cn2+1    //идентификатор
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+p,1)=' ') then cn3:=cn3+1    //пробелы до коэффициента
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+p,1)<>' ') and (copy(info(str[i]),cn1+cn2+cn3+p,1)<>'') and (copy(info(str[i]),cn1+cn2+cn3+p,1)<>#13) then cn4:=cn4+1    //коэффициент
else break;
end;

coff:=strtofloat(copy(info(str[i]),cn1+cn2+cn3+1,cn4));
bol:=true;



end;


if bol=true then begin
for k:=0 to length(str)-1 do begin
if pos('*',info(str[k]))<>0 then begin
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
for p:=1 to length(info(str[k])) do begin
if (copy(info(str[k]),p,1)=' ') then cn1:=cn1+1    //пробелы до переменной
else break;
end;
for p:=1 to length(info(str[k])) do begin
if (copy(info(str[k]),cn1+p,1)<>' ') then cn2:=cn2+1    //переменная
else break;
end;
for p:=1 to length(info(str[k])) do begin
if (copy(info(str[k]),cn1+cn2+p,1)=' ') then cn3:=cn3+1    //пробелы до энергии
else break;
end;
for p:=1 to length(info(str[k])) do begin
if (copy(info(str[k]),cn1+cn2+cn3+p,1)<>' ') then cn4:=cn4+1    //энергия
else break;
end;
reper:=strtofloat(copy(info(str[k]),cn1+cn2+cn3+1,cn4));
end;
end;
end;





//Считывание переменных --- 18 элементов включая пробелы
if ((pos('[',info(str[i]))<>0) and (pos(']',info(str[i]))<>0)) or ((pos(' LM',UpperCase(info(str[i])))<>0) or (pos(' TS',UpperCase(info(str[i])))<>0) or (pos(' CI',UpperCase(info(str[i])))<>0) or (pos(' MEXP',UpperCase(info(str[i])))<>0)) and (pos('LMIN',UpperCase(info(str[i])))=0) and (pos('LMAX',UpperCase(info(str[i])))=0) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;
cn13:=0;
cn14:=0;
cn15:=0;
cn16:=0;
cn17:=0;
cn18:=0;
cn19:=0;
cn20:=0;

for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)=' ') then cn1:=cn1+1    //пробелы до переменной
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+p,1)<>' ') then cn2:=cn2+1    //переменная
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+p,1)=' ') then cn3:=cn3+1    //пробелы до энергии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+p,1)<>' ') then cn4:=cn4+1    //энергия
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+p,1)=' ') then cn5:=cn5+1    //пробелы до типа
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+p,1)<>' ') then cn6:=cn6+1    //тип
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+p,1)=' ') then cn7:=cn7+1    //пробелы до имени
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+1,1)<>'"') then cn8:=cn8+1    //имя
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+1,1)=' ') then cn9:=cn9+1    //пробелы до "
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+1,1)<>' ') then cn10:=cn10+1    //"
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+1,1)=' ') then cn11:=cn11+1    //пробелы до позиции
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+1,1)<>' ') then cn12:=cn12+1    //позиция
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+p+1,1)=' ') then cn13:=cn13+1    //пробелы до Типа линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+p+1,1)<>' ') then cn14:=cn14+1    //тип линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+p+1,1)=' ') then cn15:=cn15+1    //пробелы до цвета линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+p+1,1)<>' ') then cn16:=cn16+1    //цвет линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+p+1,1)=' ') then cn17:=cn17+1    //пробелы до толщины линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+p+1,1)<>' ') then cn18:=cn18+1    //толщина линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+p+1,1)=' ') then cn19:=cn19+1    //пробелы до длины линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+p+1,1)<>' ') and (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+p+1,1)<>'')  and (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+p+1,1)<>#13) then cn20:=cn20+1    //толщина линии
else break;
end;



prm1:=copy(info(str[i]),cn1+1,cn2);   // переменная
prm2:=copy(info(str[i]),cn1+cn2+cn3+1,cn4);    //энергия
prm3:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+1,cn6);        //тип
prm4:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+2,cn8);        //имя
prm5:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+3,cn12-2);        //позиция
prm6:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+2,cn14);        //тип линии
prm7:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+2,cn16);        //цвет линии
prm8:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+2,cn18);   //толщина линии
prm9:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+2,cn20);   //длина линии



setlength(EDst1,sn_points);
setlength(EDst2,sn_points);
setlength(EDst3,sn_points);
setlength(EDst4,sn_points);
setlength(CBst1,sn_points);
setlength(CBst2,sn_points);
setlength(CBst3,sn_points);
setlength(CBst4,sn_points);
setlength(ClBst1,sn_points);

EDst1[sn_points-1]:=TEdit.Create(self);
EDst2[sn_points-1]:=TEdit.Create(self);
EDst3[sn_points-1]:=TEdit.Create(self);
EDst4[sn_points-1]:=TEdit.Create(self);
CBst1[sn_points-1]:=TCombobox.Create(self);
CBst2[sn_points-1]:=TCombobox.Create(self);
CBst3[sn_points-1]:=TCombobox.Create(self);
CBst4[sn_points-1]:=TCombobox.Create(self);
ClBst1[sn_points-1]:=TColorbox.Create(self);
EDst1[sn_points-1].Parent:=Form21.ScrollBox1;
EDst2[sn_points-1].Parent:=Form21.ScrollBox1;
EDst3[sn_points-1].Parent:=Form21.ScrollBox1;
EDst4[sn_points-1].Parent:=Form21.ScrollBox1;
CBst1[sn_points-1].Parent:=Form21.ScrollBox1;
CBst2[sn_points-1].Parent:=Form21.ScrollBox1;
CBst3[sn_points-1].Parent:=Form21.ScrollBox1;
CBst4[sn_points-1].Parent:=Form21.ScrollBox1;
ClBst1[sn_points-1].Parent:=Form21.ScrollBox1;


EDst1[sn_points-1].Left:=5;
EDst1[sn_points-1].Width:=30;
EDst1[sn_points-1].Top:=5+(sn_points-1)*20;
EDst1[sn_points-1].Text:=prm5;         //позиция на канве (расположение)

EDst2[sn_points-1].Left:=EDst1[sn_points-1].Left+EDst1[sn_points-1].Width+25;
EDst2[sn_points-1].Width:=30;
EDst2[sn_points-1].Top:=5+(sn_points-1)*20;
if pos('*',prm1)<>0 then  EDst2[sn_points-1].Text:=copy(prm1,1,length(prm1)-1)       // Если есть звезлочка относительн.
else EDst2[sn_points-1].Text:=prm1;         //порядковый номер для идентификации

EDst3[sn_points-1].Left:=EDst2[sn_points-1].Left+EDst2[sn_points-1].Width;
EDst3[sn_points-1].Width:=140;
EDst3[sn_points-1].Top:=5+(sn_points-1)*20;
EDst3[sn_points-1].Text:=prm4;           //имя

EDst4[sn_points-1].Left:=EDst3[sn_points-1].Left+EDst3[sn_points-1].Width;
EDst4[sn_points-1].Width:=60;
EDst4[sn_points-1].Top:=5+(sn_points-1)*20;
if bol=true then EDst4[sn_points-1].Text:=floattostr(RoundTo((strtofloat(prm2)-reper)*coff,-1))           //энергия   !!!!!!!!!!!!!!!
else EDst4[sn_points-1].Text:=prm2;

CBst1[sn_points-1].Left:=EDst4[sn_points-1].Left+EDst4[sn_points-1].Width;
CBst1[sn_points-1].Width:=65;
CBst1[sn_points-1].Top:=5+(sn_points-1)*20;
CBst1[sn_points-1].Items.Add('LM');
CBst1[sn_points-1].Items.Add('TS');
CBst1[sn_points-1].Items.Add('CI');
CBst1[sn_points-1].Items.Add('Mexp');
CBst1[sn_points-1].ItemIndex:=CBst1[sn_points-1].Items.IndexOf(prm3);

CBst2[sn_points-1].Left:=CBst1[sn_points-1].Left+CBst1[sn_points-1].Width;
CBst2[sn_points-1].Width:=65;
CBst2[sn_points-1].Top:=5+(sn_points-1)*20;
CBst2[sn_points-1].Items.Add('Solid');
CBst2[sn_points-1].Items.Add('Dash');
CBst2[sn_points-1].Items.Add('Dot');
CBst2[sn_points-1].ItemIndex:=CBst2[sn_points-1].Items.IndexOf(prm6);

ClBst1[sn_points-1].Left:=CBst2[sn_points-1].Left+CBst2[sn_points-1].Width;
ClBst1[sn_points-1].Width:=95;
ClBst1[sn_points-1].Top:=5+(sn_points-1)*20;
ClBst1[sn_points-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst1[sn_points-1].ItemIndex:= ClBst1[sn_points-1].Items.IndexOf(prm7);

///////////////////////////////////////

CBst3[sn_points-1].Left:=ClBst1[sn_points-1].Left+ClBst1[sn_points-1].Width;
CBst3[sn_points-1].Width:=50;
CBst3[sn_points-1].Top:=5+(sn_points-1)*20;
CBst3[sn_points-1].Items.Add('1');
CBst3[sn_points-1].Items.Add('2');
CBst3[sn_points-1].Items.Add('3');
CBst3[sn_points-1].Items.Add('4');
CBst3[sn_points-1].Items.Add('5');
CBst3[sn_points-1].Text:=prm8;

CBst4[sn_points-1].Left:=CBst3[sn_points-1].Left+CBst3[sn_points-1].Width;
CBst4[sn_points-1].Width:=50;
CBst4[sn_points-1].Top:=5+(sn_points-1)*20;
CBst4[sn_points-1].Items.Add('15');
CBst4[sn_points-1].Items.Add('20');
CBst4[sn_points-1].Items.Add('25');
CBst4[sn_points-1].Items.Add('30');
CBst4[sn_points-1].Items.Add('40');
CBst4[sn_points-1].Items.Add('50');
CBst4[sn_points-1].Text:=prm9;

sn_points:=sn_points+1;
end;                           // конец чтения стационарных точек

////////// Теперь надо читать переходы - маркер - AR



if (pos('AR',info(str[i]))<>0) and (pos('->',info(str[i]))<>0) then
begin
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;
cn13:=0;
cn14:=0;
cn15:=0;
cn16:=0;
cn17:=0;
cn18:=0;

for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)=' ') then cn1:=cn1+1    //пробелы до AR
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+p,1)<>' ') then cn2:=cn2+1    //AR
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+p,1)=' ') then cn3:=cn3+1    //пробелы до P1
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+p,1)<>' ') and (copy(info(str[i]),cn1+cn2+cn3+p,1)<>'-')    then cn4:=cn4+1    //точка P1
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+p,1)=' ') or  (copy(info(str[i]),cn1+cn2+cn3+cn4+p,1)='>') or  (copy(info(str[i]),cn1+cn2+cn3+cn4+p,1)='-') then cn5:=cn5+1    //разрыв между P1 и P2
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+p,1)<>' ') then cn6:=cn6+1    //точка P2
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+p,1)=' ') then cn7:=cn7+1    //пробелы до толщины линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+p,1)<>' ') then cn8:=cn8+1    //толщина линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p,1)=' ') then cn9:=cn9+1    //пробелы до стиля линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p,1)<>' ') then cn10:=cn10+1    //стиль линии (Solid, Dash и проч.)
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p,1)=' ') then cn11:=cn11+1    //пробелы до цвета линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p,1)<>' ') then cn12:=cn12+1    //цвет линии
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+p,1)=' ') then cn13:=cn13+1    //пробелы до имени (надписи)
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+p,1)<>':') then cn14:=cn14+1    //Имя (Надпись)
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+p,1)=' ') then cn15:=cn15+1    //пробелы между именем и двоеточием
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+p,1)<>' ')  then cn16:=cn16+1    //двоеточие
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+p,1)=' ') then cn17:=cn17+1    //пробелы между : и флагом Yes/No
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+p,1)<>' ') and (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+p,1)<>'')  and (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+p,1)<>#13) then cn18:=cn18+1    //флаг Yes/No
else break;
end;


prm1:=copy(info(str[i]),cn1+cn2+cn3+1,cn4);    //точка P1
prm2:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+1,cn6);        //точка P2
prm3:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+1,cn8);        //толщина линии
prm4:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+1,cn10);        //стиль линии
prm5:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+1,cn12);        //цвет линии
prm6:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+1,cn14);        //имя
prm7:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+1,cn18);        //флаг


setlength(ChB3,sn_ar);       //***
setlength(EDst5,sn_ar);
setlength(EDst6,sn_ar);
setlength(CBst5,sn_ar);
setlength(CBst6,sn_ar);
setlength(ClBst2,sn_ar);
setlength(LB,sn_ar);

ChB3[sn_ar-1]:=TCheckBox.Create(self);      //****
EDst5[sn_ar-1]:=TEdit.Create(self);
EDst6[sn_ar-1]:=TEdit.Create(self);
LB[sn_ar-1]:=TLabel.Create(self);
CBst5[sn_ar-1]:=TCombobox.Create(self);
CBst6[sn_ar-1]:=TCombobox.Create(self);
ClBst2[sn_ar-1]:=TColorbox.Create(self);
ChB3[sn_ar-1].Parent:=Form21.ScrollBox2;       //****
EDst5[sn_ar-1].Parent:=Form21.ScrollBox2;
EDst6[sn_ar-1].Parent:=Form21.ScrollBox2;
CBst5[sn_ar-1].Parent:=Form21.ScrollBox2;
CBst6[sn_ar-1].Parent:=Form21.ScrollBox2;
LB[sn_ar-1].Parent:=Form21.ScrollBox2;
ClBst2[sn_ar-1].Parent:=Form21.ScrollBox2;


ChB3[sn_ar-1].Left:=5;          //****
ChB3[sn_ar-1].Width:=15;        //****
ChB3[sn_ar-1].Top:=5+(sn_ar-1)*20+Round(EDst5[sn_ar-1].Height/2)-Round(ChB3[sn_ar-1].Height/2);    //****
EDst5[sn_ar-1].Left:=ChB3[sn_ar-1].Left+ChB3[sn_ar-1].Width+3;     //****
EDst5[sn_ar-1].Width:=30;
EDst5[sn_ar-1].Top:=5+(sn_ar-1)*20;
EDst5[sn_ar-1].Text:=prm1;
LB[sn_ar-1].Left:=EDst5[sn_ar-1].Left+EDst5[sn_ar-1].Width+5;
LB[sn_ar-1].Top:=EDst5[sn_ar-1].Top+Round(EDst5[sn_ar-1].Height/2)-Round(LB[sn_ar-1].Height/2);
LB[sn_ar-1].Caption:='---->';
EDst6[sn_ar-1].Left:=LB[sn_ar-1].Left+LB[sn_ar-1].Width+5;
EDst6[sn_ar-1].Width:=30;
EDst6[sn_ar-1].Top:=5+(sn_ar-1)*20;
EDst6[sn_ar-1].Text:=prm2;

CBst5[sn_ar-1].Left:=EDst6[sn_ar-1].Left+EDst6[sn_ar-1].Width+35;
CBst5[sn_ar-1].Width:=50;
CBst5[sn_ar-1].Top:=5+(sn_ar-1)*20;
CBst5[sn_ar-1].Items.Add('none');
CBst5[sn_ar-1].Items.Add('1');
CBst5[sn_ar-1].Items.Add('2');
CBst5[sn_ar-1].Items.Add('3');
CBst5[sn_ar-1].Text:=prm3;          ///////////////////////////////////////////////////////////////////////

CBst6[sn_ar-1].Left:=CBst5[sn_ar-1].Left+CBst5[sn_ar-1].Width;
CBst6[sn_ar-1].Width:=70;
CBst6[sn_ar-1].Top:=5+(sn_ar-1)*20;
CBst6[sn_ar-1].Items.Add('Solid');
CBst6[sn_ar-1].Items.Add('Dash');
CBst6[sn_ar-1].Items.Add('Dot');
CBst6[sn_ar-1].ItemIndex:=CBst6[sn_ar-1].Items.IndexOf(prm4);

ClBst2[sn_ar-1].Left:=CBst6[sn_ar-1].Left+CBst6[sn_ar-1].Width;
ClBst2[sn_ar-1].Width:=100;
ClBst2[sn_ar-1].Top:=5+(sn_ar-1)*20;
ClBst2[sn_ar-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst2[sn_ar-1].ItemIndex:=ClBst2[sn_ar-1].Items.IndexOf(prm5);



// теперь имя надо разложить на компоненты аналогично используя  cn и prm - Имя это prm6

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;


for p:=1 to length(prm6) do begin
if (copy(prm6,p+length('Name'),1)=' ') or (copy(prm6,p+length('Name'),1)='=') or (copy(prm6,p+length('Name'),1)='(') then cn1:=cn1+1    //разделение до аргументов
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+p+4,1)<>',') and (copy(prm6,cn1+p+4,1)<>';') then cn2:=cn2+1    //Шрифт
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+p+4,1)=' ') or (copy(prm6,cn1+cn2+p+4,1)=',') or (copy(prm6,cn1+cn2+p+4,1)=';') then cn3:=cn3+1    //пробелы до размера шрифта
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+cn2+cn3+p+4,1)<>',') and (copy(prm6,cn1+cn2+cn3+p+4,1)<>';') then cn4:=cn4+1    //размер шрифта
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+p+4,1)=' ') or (copy(prm6,cn1+cn2+cn3+cn4+p+4,1)=',')  or (copy(prm6,cn1+cn2+cn3+cn4+p+4,1)=';')  then cn5:=cn5+1    //пробелы до цвета шрифта
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+cn2+cn3+cn4+cn5+p+4,1)<>',') and (copy(prm6,cn1+cn2+cn3+cn4+cn5+p+4,1)<>';') then cn6:=cn6+1    //цвет шрифта
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+p+4,1)=' ') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+p+4,1)=',') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+p+4,1)=';') then cn7:=cn7+1    //пробелы до стиля (Bold, Italic И проч.)
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+4,1)<>',') and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+4,1)<>';') then cn8:=cn8+1    //стиль (Bold, Italic И проч.)
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+4,1)=' ') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+4,1)=',') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+4,1)=';') then cn9:=cn9+1    //пробелы до X-коррекции
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+4,1)<>',') and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+4,1)<>';')  then cn10:=cn10+1    //X-коррекция
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+4,1)=' ') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+4,1)=',') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+4,1)=';')   then cn11:=cn11+1    //пробелы Y-коррекции
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+4,1)<>'')  and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+4,1)<>')')  and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+4,1)<>',')  and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+4,1)<>';') then cn12:=cn12+1    //Y-коррекция
else break;
end;

prm01:= copy(prm6,cn1+1+4,cn2);  //шрифт
prm02:= copy(prm6,cn1+cn2+cn3+1+4,cn4);  //размер шрифта
prm03:= copy(prm6,cn1+cn2+cn3+cn4+cn5+1+4,cn6);  //цвет шрифта
prm04:= copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+1+4,cn8);  //стиль шрифта
prm05:= copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+1+4,cn10);  //X-corr.
prm06:= copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+1+4,cn12);  //Y-corr.








////// Надписи направлений
setlength(EDst13,sn_ar);
setlength(EDst14,sn_ar);
setlength(EDst15,sn_ar);
setlength(CBst19,sn_ar);
setlength(CBst20,sn_ar);
setlength(CBst21,sn_ar);
setlength(CBst22,sn_ar);
setlength(ClBst6,sn_ar);
setlength(LB1,sn_ar);
setlength(EDx4,sn_ar);
setlength(EDy4,sn_ar);

EDst13[sn_ar-1]:=TEdit.Create(self);
EDst14[sn_ar-1]:=TEdit.Create(self);
EDst15[sn_ar-1]:=TEdit.Create(self);
CBst19[sn_ar-1]:=TCombobox.Create(self);
CBst20[sn_ar-1]:=TCombobox.Create(self);
CBst21[sn_ar-1]:=TCombobox.Create(self);
CBst22[sn_ar-1]:=TCombobox.Create(self);
ClBst6[sn_ar-1]:=TColorbox.Create(self);
LB1[sn_ar-1]:=TLabel.Create(self);
EDx4[sn_ar-1]:=TEdit.Create(self);
EDy4[sn_ar-1]:=TEdit.Create(self);
EDst13[sn_ar-1].Parent:=Form21.ScrollBox6;
EDst14[sn_ar-1].Parent:=Form21.ScrollBox6;
EDst15[sn_ar-1].Parent:=Form21.ScrollBox6;
CBst19[sn_ar-1].Parent:=Form21.ScrollBox6;
CBst20[sn_ar-1].Parent:=Form21.ScrollBox6;
CBst21[sn_ar-1].Parent:=Form21.ScrollBox6;
CBst22[sn_ar-1].Parent:=Form21.ScrollBox6;
ClBst6[sn_ar-1].Parent:=Form21.ScrollBox6;
LB1[sn_ar-1].Parent:=Form21.ScrollBox6;
EDx4[sn_ar-1].Parent:=Form21.ScrollBox6;
EDy4[sn_ar-1].Parent:=Form21.ScrollBox6;



CBst19[sn_ar-1].Left:=5;
CBst19[sn_ar-1].Width:=70;
CBst19[sn_ar-1].Top:=5+(sn_ar-1)*20;
CBst19[sn_ar-1].Items.Add('None');
CBst19[sn_ar-1].Items.Add('Text');
if UpperCase(copy(prm7,1,1))='Y'  then CBst19[sn_ar-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm7,1,1))='N'  then CBst19[sn_ar-1].ItemIndex:=0;              //текст или ничего



EDst13[sn_ar-1].Left:=CBst19[sn_ar-1].Left+CBst19[sn_ar-1].Width+20;
EDst13[sn_ar-1].Width:=30;
EDst13[sn_ar-1].Top:=5+(sn_ar-1)*20;
EDst13[sn_ar-1].Text:=prm1;         // реагент

LB1[sn_ar-1].Left:=EDst13[sn_ar-1].Left+EDst13[sn_ar-1].Width+5;
LB1[sn_ar-1].Top:=EDst13[sn_ar-1].Top+Round(EDst13[sn_ar-1].Height/2)-Round(LB1[sn_ar-1].Height/2);
LB1[sn_ar-1].Caption:='---->';

EDst14[sn_ar-1].Left:=LB1[sn_ar-1].Left+LB1[sn_ar-1].Width+5;
EDst14[sn_ar-1].Width:=30;
EDst14[sn_ar-1].Top:=5+(sn_ar-1)*20;
EDst14[sn_ar-1].Text:=prm2;           //продукт

EDst15[sn_ar-1].Left:=EDst14[sn_ar-1].Left+EDst14[sn_ar-1].Width+5;
EDst15[sn_ar-1].Width:=60;
EDst15[sn_ar-1].Top:=5+(sn_ar-1)*20;


for m:=0 to length(EDst2)-1 do begin
if prm1=EDSt2[m].Text then begin
for n:=0 to length(EDst2)-1 do begin
if prm2=EDSt2[n].Text then
EDst15[sn_ar-1].Text:=floattostr(strtofloat(EDst4[n].Text)-strtofloat(EDst4[m].Text));  /////////////////////////////СЮДА ЭНЕРГИЮ ПЕРЕХОДА!!!!!
end;
end;
end;








CBst20[sn_ar-1].Left:=EDst15[sn_ar-1].Left+EDst15[sn_ar-1].Width;
CBst20[sn_ar-1].Width:=140;
CBst20[sn_ar-1].Top:=5+(sn_ar-1)*20;
CBst20[sn_ar-1].Items.Add('Arial');
CBst20[sn_ar-1].Items.Add('Tahoma');
CBst20[sn_ar-1].Items.Add('Times New Roman');
CBst20[sn_ar-1].Items.Add('Courier New');
CBst20[sn_ar-1].Text:=prm01;           // шрифт

CBst21[sn_ar-1].Left:=CBst20[sn_ar-1].Left+CBst20[sn_ar-1].Width;
CBst21[sn_ar-1].Width:=65;
CBst21[sn_ar-1].Top:=5+(sn_ar-1)*20;
CBst21[sn_ar-1].Items.Add('8 пт');
CBst21[sn_ar-1].Items.Add('9 пт');
CBst21[sn_ar-1].Items.Add('10 пт');
CBst21[sn_ar-1].Items.Add('11 пт');
CBst21[sn_ar-1].Items.Add('12 пт');
CBst21[sn_ar-1].Items.Add('13 пт');
CBst21[sn_ar-1].Items.Add('14 пт');
CBst21[sn_ar-1].Text:=prm02+ ' пт';

ClBst6[sn_ar-1].Left:=CBst21[sn_ar-1].Left+CBst21[sn_ar-1].Width;
ClBst6[sn_ar-1].Width:=95;
ClBst6[sn_ar-1].Top:=5+(sn_ar-1)*20;
ClBst6[sn_ar-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst6[sn_ar-1].ItemIndex:=ClBst6[sn_ar-1].Items.IndexOf(prm03);

CBst22[sn_ar-1].Left:=ClBst6[sn_ar-1].Left+ClBst6[sn_ar-1].Width;
CBst22[sn_ar-1].Width:=130;
CBst22[sn_ar-1].Top:=5+(sn_ar-1)*20;
CBst22[sn_ar-1].Items.Add('Normal');
CBst22[sn_ar-1].Items.Add('Bold');
CBst22[sn_ar-1].Items.Add('Italic');
CBst22[sn_ar-1].Items.Add('Bold+Italic');
CBst22[sn_ar-1].Items.Add('Underline');
CBst22[sn_ar-1].Items.Add('Bold+Underline');
CBst22[sn_ar-1].Items.Add('Italic+Underline');
CBst22[sn_ar-1].Items.Add('Bold+Italic+Underline');
CBst22[sn_ar-1].Itemindex:=CBst22[sn_ar-1].Items.IndexOf(prm04);


EDx4[sn_ar-1].Left:=CBst22[sn_ar-1].Left+CBst22[sn_ar-1].Width+3;
EDx4[sn_ar-1].Width:=40;
EDx4[sn_ar-1].Top:=5+(sn_ar-1)*20;
EDx4[sn_ar-1].Text:=prm05;

EDy4[sn_ar-1].Left:=EDx4[sn_ar-1].Left+EDx4[sn_ar-1].Width;
EDy4[sn_ar-1].Width:=40;
EDy4[sn_ar-1].Top:=5+(sn_ar-1)*20;
EDy4[sn_ar-1].Text:=prm06;

sn_ar:=sn_ar+1;


end;


// читаем строки секции имен  //////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
if pos('SPT',info(str[i]))<>0 then
begin
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;
cn13:=0;
cn14:=0;
cn15:=0;
cn16:=0;
cn17:=0;
cn18:=0;
cn19:=0;
cn20:=0;
cn21:=0;
cn22:=0;



for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),p,1)=' ') then cn1:=cn1+1    //пробелы до SPT
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+p,1)<>' ') then cn2:=cn2+1    //SPT
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+p,1)=' ') then cn3:=cn3+1    //пробелы до точек (номеров, имен, идентификаторов)
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+p,1)<>' ')  then cn4:=cn4+1    //точка (имя), идентификатор
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+p,1)=' ')  then cn5:=cn5+1    //пробел до имени
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+p,1)<>':') then cn6:=cn6+1    //имя (Name=)...
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+p,1)=' ') then cn7:=cn7+1    //пробелы между именем и двоеточием
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+p,1)<>' ') then cn8:=cn8+1    //двоеточие
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p,1)=' ') then cn9:=cn9+1    //пробелы между двоеточием и Yes/No
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p,1)<>' ') then cn10:=cn10+1    //Yes/No
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p,1)=' ') then cn11:=cn11+1    //пробелы до второго имени (Energy=)
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p,1)<>':') then cn12:=cn12+1    //имя №2 (Energy=...)
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+p,1)=' ') then cn13:=cn13+1    //пробелы медлу именем и двоеточием
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+p,1)<>' ') then cn14:=cn14+1    //двоеточие
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+p,1)=' ') then cn15:=cn15+1    //пробелы между двоеточием и флагом Yes/No
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+p,1)<>' ')  then cn16:=cn16+1    //флаг Yes/No
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+p,1)=' ') then cn17:=cn17+1    //пробелы до третьего имени
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+p,1)<>':') then cn18:=cn18+1    //третье имя
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+p,1)=' ') then cn19:=cn19+1    //пробелы между именем и двоеточием
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+p,1)<>' ') then cn20:=cn20+1    //двоеточие
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+p,1)=' ') then cn21:=cn21+1    //пробелы между двоеточием и флагом Yes/No
else break;
end;
for p:=1 to length(info(str[i])) do begin
if (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>' ') and (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>'') and (copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>#13)  then cn22:=cn22+1    //флаг Yes/No
else break;
end;


prm1:=copy(info(str[i]),cn1+cn2+cn3+1,cn4);    //точка
prm2:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+1,cn6);        //имя 1
prm3:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+1,cn10);        //флаг имени 1
prm4:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+1,cn12);        //имя 2
prm5:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+1,cn16);        //флаг имени 2
prm6:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+1,cn18);        //имя 3
prm7:=copy(info(str[i]),cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+1,cn22);        //флаг имени 3



//Теперь надо разложить каждое из трех имен на части

// имя 1
l:=0;
if pos('NAME',UpperCase(prm2))<>0 then l:=4;
if pos('ENERGY',UpperCase(prm2))<>0 then l:=6;
if pos('NUM',UpperCase(prm2))<>0 then l:=3;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;


for p:=1 to length(prm2) do begin
if (copy(prm2,p+l,1)=' ') or (copy(prm2,p+l,1)='=') or (copy(prm2,p+l,1)='(') then cn1:=cn1+1    //разделение до аргументов
else break;
end;
for p:=1 to length(prm2) do begin
if  (copy(prm2,cn1+p+l,1)<>',') and (copy(prm2,cn1+p+l,1)<>';') then cn2:=cn2+1    //Шрифт
else break;
end;
for p:=1 to length(prm2) do begin
if (copy(prm2,cn1+cn2+p+l,1)=' ') or (copy(prm2,cn1+cn2+p+l,1)=',') or (copy(prm2,cn1+cn2+p+l,1)=';') then cn3:=cn3+1    //пробелы до размера шрифта
else break;
end;
for p:=1 to length(prm2) do begin
if  (copy(prm2,cn1+cn2+cn3+p+l,1)<>',') and (copy(prm2,cn1+cn2+cn3+p+l,1)<>';') then cn4:=cn4+1    //размер шрифта
else break;
end;
for p:=1 to length(prm2) do begin
if (copy(prm2,cn1+cn2+cn3+cn4+p+l,1)=' ') or (copy(prm2,cn1+cn2+cn3+cn4+p+l,1)=',')  or (copy(prm2,cn1+cn2+cn3+cn4+p+l,1)=';')  then cn5:=cn5+1    //пробелы до цвета шрифта
else break;
end;
for p:=1 to length(prm2) do begin
if  (copy(prm2,cn1+cn2+cn3+cn4+cn5+p+l,1)<>',') and (copy(prm2,cn1+cn2+cn3+cn4+cn5+p+l,1)<>';') then cn6:=cn6+1    //цвет шрифта
else break;
end;
for p:=1 to length(prm2) do begin
if (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=' ') or (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=',') or (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=';') then cn7:=cn7+1    //пробелы до стиля (Bold, Italic И проч.)
else break;
end;
for p:=1 to length(prm2) do begin
if  (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+l,1)<>',') and (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+l,1)<>';') then cn8:=cn8+1    //стиль (Bold, Italic И проч.)
else break;
end;
for p:=1 to length(prm2) do begin
if (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=' ') or (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=',') or (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=';') then cn9:=cn9+1    //пробелы до X-коррекции
else break;
end;
for p:=1 to length(prm2) do begin
if  (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+l,1)<>',') and (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+l,1)<>';')  then cn10:=cn10+1    //X-коррекция
else break;
end;
for p:=1 to length(prm2) do begin
if (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=' ') or (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=',') or (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=';')   then cn11:=cn11+1    //пробелы Y-коррекции
else break;
end;
for p:=1 to length(prm2) do begin
if  (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>'')  and (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>')')  and (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>',')  and (copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>';') then cn12:=cn12+1    //Y-коррекция
else break;
end;

prm01:= copy(prm2,cn1+1+l,cn2);  //шрифт
prm02:= copy(prm2,cn1+cn2+cn3+1+l,cn4);  //размер шрифта
prm03:= copy(prm2,cn1+cn2+cn3+cn4+cn5+1+l,cn6);  //цвет шрифта
prm04:= copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+1+l,cn8);  //стиль шрифта
prm05:= copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+1+l,cn10);  //X-corr.
prm06:= copy(prm2,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+1+l,cn12);  //Y-corr.




if (l=4) or (l=0) then begin
setlength(EDst7,sn_titl);
setlength(EDst8,sn_titl);
setlength(CBst7,sn_titl);
setlength(CBst8,sn_titl);
setlength(CBst9,sn_titl);
setlength(CBst10,sn_titl);
setlength(ClBst3,sn_titl);
setlength(EDx1,sn_titl);
setlength(EDy1,sn_titl);

EDst7[sn_titl-1]:=TEdit.Create(self);
EDst8[sn_titl-1]:=TEdit.Create(self);
CBst7[sn_titl-1]:=TCombobox.Create(self);
CBst8[sn_titl-1]:=TCombobox.Create(self);
CBst9[sn_titl-1]:=TCombobox.Create(self);
CBst10[sn_titl-1]:=TCombobox.Create(self);
ClBst3[sn_titl-1]:=TColorbox.Create(self);
EDx1[sn_titl-1]:=TEdit.Create(self);
EDy1[sn_titl-1]:=TEdit.Create(self);
EDst7[sn_titl-1].Parent:=Form21.ScrollBox3;
EDst8[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst7[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst8[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst9[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst10[sn_titl-1].Parent:=Form21.ScrollBox3;
ClBst3[sn_titl-1].Parent:=Form21.ScrollBox3;
EDx1[sn_titl-1].Parent:=Form21.ScrollBox3;
EDy1[sn_titl-1].Parent:=Form21.ScrollBox3;


CBst7[sn_titl-1].Left:=5;
CBst7[sn_titl-1].Width:=70;
CBst7[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst7[sn_titl-1].Items.Add('None');
CBst7[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm3,1,1))='Y'  then CBst7[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm3,1,1))='N'  then CBst7[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst7[sn_titl-1].Left:=CBst7[sn_titl-1].Left+CBst7[sn_titl-1].Width+20;
EDst7[sn_titl-1].Width:=30;
EDst7[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst7[sn_titl-1].Text:=prm1;         //номер  точки

EDst8[sn_titl-1].Left:=EDst7[sn_titl-1].Left+EDst7[sn_titl-1].Width;
EDst8[sn_titl-1].Width:=140;
EDst8[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
for m:=0 to length(EDst2)-1 do begin
if prm1=EDSt2[m].Text then begin
EDst8[sn_titl-1].Text:=EDst3[m].Text;  /////////////////////////////
end;
end;

CBst8[sn_titl-1].Left:=EDst8[sn_titl-1].Left+EDst8[sn_titl-1].Width;
CBst8[sn_titl-1].Width:=130;
CBst8[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst8[sn_titl-1].Items.Add('Arial');
CBst8[sn_titl-1].Items.Add('Tahoma');
CBst8[sn_titl-1].Items.Add('Times New Roman');
CBst8[sn_titl-1].Items.Add('Courier New');
CBst8[sn_titl-1].Text:=prm01;           // шрифт

CBst9[sn_titl-1].Left:=CBst8[sn_titl-1].Left+CBst8[sn_titl-1].Width;
CBst9[sn_titl-1].Width:=65;
CBst9[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst9[sn_titl-1].Items.Add('8 пт');
CBst9[sn_titl-1].Items.Add('9 пт');
CBst9[sn_titl-1].Items.Add('10 пт');
CBst9[sn_titl-1].Items.Add('11 пт');
CBst9[sn_titl-1].Items.Add('12 пт');
CBst9[sn_titl-1].Items.Add('13 пт');
CBst9[sn_titl-1].Items.Add('14 пт');
CBst9[sn_titl-1].Text:=prm02+ ' пт';

ClBst3[sn_titl-1].Left:=CBst9[sn_titl-1].Left+CBst9[sn_titl-1].Width;
ClBst3[sn_titl-1].Width:=95;
ClBst3[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst3[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst3[sn_titl-1].ItemIndex:=ClBst3[sn_titl-1].Items.IndexOf(prm03);

CBst10[sn_titl-1].Left:=ClBst3[sn_titl-1].Left+ClBst3[sn_titl-1].Width;
CBst10[sn_titl-1].Width:=130;
CBst10[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst10[sn_titl-1].Items.Add('Normal');
CBst10[sn_titl-1].Items.Add('Bold');
CBst10[sn_titl-1].Items.Add('Italic');
CBst10[sn_titl-1].Items.Add('Bold+Italic');
CBst10[sn_titl-1].Items.Add('Underline');
CBst10[sn_titl-1].Items.Add('Bold+Underline');
CBst10[sn_titl-1].Items.Add('Italic+Underline');
CBst10[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst10[sn_titl-1].ItemIndex:=CBst10[sn_titl-1].Items.IndexOf(prm04);

EDx1[sn_titl-1].Left:=CBst10[sn_titl-1].Left+CBst10[sn_titl-1].Width+3;
EDx1[sn_titl-1].Width:=40;
EDx1[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx1[sn_titl-1].Text:=prm05;

EDy1[sn_titl-1].Left:=EDx1[sn_titl-1].Left+EDx1[sn_titl-1].Width;
EDy1[sn_titl-1].Width:=40;
EDy1[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy1[sn_titl-1].Text:=prm06;
l1:=4;
end;


if l=6 then begin
setlength(EDst9,sn_titl);
setlength(EDst10,sn_titl);
setlength(CBst11,sn_titl);
setlength(CBst12,sn_titl);
setlength(CBst13,sn_titl);
setlength(CBst14,sn_titl);
setlength(ClBst4,sn_titl);
setlength(EDx2,sn_titl);
setlength(EDy2,sn_titl);

EDst9[sn_titl-1]:=TEdit.Create(self);
EDst10[sn_titl-1]:=TEdit.Create(self);
CBst11[sn_titl-1]:=TCombobox.Create(self);
CBst12[sn_titl-1]:=TCombobox.Create(self);
CBst13[sn_titl-1]:=TCombobox.Create(self);
CBst14[sn_titl-1]:=TCombobox.Create(self);
ClBst4[sn_titl-1]:=TColorbox.Create(self);
EDx2[sn_titl-1]:=TEdit.Create(self);
EDy2[sn_titl-1]:=TEdit.Create(self);
EDst9[sn_titl-1].Parent:=Form21.ScrollBox4;
EDst10[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst11[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst12[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst13[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst14[sn_titl-1].Parent:=Form21.ScrollBox4;
ClBst4[sn_titl-1].Parent:=Form21.ScrollBox4;
EDx2[sn_titl-1].Parent:=Form21.ScrollBox4;
EDy2[sn_titl-1].Parent:=Form21.ScrollBox4;


CBst11[sn_titl-1].Left:=5;
CBst11[sn_titl-1].Width:=70;
CBst11[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst11[sn_titl-1].Items.Add('None');
CBst11[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm3,1,1))='Y'  then CBst11[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm3,1,1))='N'  then CBst11[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst9[sn_titl-1].Left:=CBst11[sn_titl-1].Left+CBst11[sn_titl-1].Width+20;
EDst9[sn_titl-1].Width:=30;
EDst9[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst9[sn_titl-1].Text:=prm1;         //номер  точки

EDst10[sn_titl-1].Left:=EDst9[sn_titl-1].Left+EDst9[sn_titl-1].Width;
EDst10[sn_titl-1].Width:=140;
EDst10[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
for m:=0 to length(EDst2)-1 do begin
if prm1=EDSt2[m].Text then begin
EDst10[sn_titl-1].Text:=EDst4[m].Text;  /////////////////////////////
end;
end;

CBst12[sn_titl-1].Left:=EDst10[sn_titl-1].Left+EDst10[sn_titl-1].Width;
CBst12[sn_titl-1].Width:=130;
CBst12[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst12[sn_titl-1].Items.Add('Arial');
CBst12[sn_titl-1].Items.Add('Tahoma');
CBst12[sn_titl-1].Items.Add('Times New Roman');
CBst12[sn_titl-1].Items.Add('Courier New');
CBst12[sn_titl-1].Text:=prm01;           // шрифт

CBst13[sn_titl-1].Left:=CBst12[sn_titl-1].Left+CBst12[sn_titl-1].Width;
CBst13[sn_titl-1].Width:=65;
CBst13[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst13[sn_titl-1].Items.Add('8 пт');
CBst13[sn_titl-1].Items.Add('9 пт');
CBst13[sn_titl-1].Items.Add('10 пт');
CBst13[sn_titl-1].Items.Add('11 пт');
CBst13[sn_titl-1].Items.Add('12 пт');
CBst13[sn_titl-1].Items.Add('13 пт');
CBst13[sn_titl-1].Items.Add('14 пт');
CBst13[sn_titl-1].Text:=prm02+ ' пт';

ClBst4[sn_titl-1].Left:=CBst13[sn_titl-1].Left+CBst13[sn_titl-1].Width;
ClBst4[sn_titl-1].Width:=95;
ClBst4[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst4[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst4[sn_titl-1].ItemIndex:=ClBst4[sn_titl-1].Items.IndexOf(prm03);

CBst14[sn_titl-1].Left:=ClBst4[sn_titl-1].Left+ClBst4[sn_titl-1].Width;
CBst14[sn_titl-1].Width:=130;
CBst14[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst14[sn_titl-1].Items.Add('Normal');
CBst14[sn_titl-1].Items.Add('Bold');
CBst14[sn_titl-1].Items.Add('Italic');
CBst14[sn_titl-1].Items.Add('Bold+Italic');
CBst14[sn_titl-1].Items.Add('Underline');
CBst14[sn_titl-1].Items.Add('Bold+Underline');
CBst14[sn_titl-1].Items.Add('Italic+Underline');
CBst14[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst14[sn_titl-1].ItemIndex:=CBst14[sn_titl-1].Items.IndexOf(prm04);

EDx2[sn_titl-1].Left:=CBst14[sn_titl-1].Left+CBst14[sn_titl-1].Width+3;
EDx2[sn_titl-1].Width:=40;
EDx2[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx2[sn_titl-1].Text:=prm05;

EDy2[sn_titl-1].Left:=EDx2[sn_titl-1].Left+EDx2[sn_titl-1].Width;
EDy2[sn_titl-1].Width:=40;
EDy2[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy2[sn_titl-1].Text:=prm06;
l1:=6;
end;


if l=3 then begin
setlength(EDst11,sn_titl);
setlength(EDst12,sn_titl);
setlength(CBst15,sn_titl);
setlength(CBst16,sn_titl);
setlength(CBst17,sn_titl);
setlength(CBst18,sn_titl);
setlength(ClBst5,sn_titl);
setlength(EDx3,sn_titl);
setlength(EDy3,sn_titl);

EDst11[sn_titl-1]:=TEdit.Create(self);
EDst12[sn_titl-1]:=TEdit.Create(self);
CBst15[sn_titl-1]:=TCombobox.Create(self);
CBst16[sn_titl-1]:=TCombobox.Create(self);
CBst17[sn_titl-1]:=TCombobox.Create(self);
CBst18[sn_titl-1]:=TCombobox.Create(self);
ClBst5[sn_titl-1]:=TColorbox.Create(self);
EDx3[sn_titl-1]:=TEdit.Create(self);
EDy3[sn_titl-1]:=TEdit.Create(self);
EDst11[sn_titl-1].Parent:=Form21.ScrollBox5;
EDst12[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst15[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst16[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst17[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst18[sn_titl-1].Parent:=Form21.ScrollBox5;
ClBst5[sn_titl-1].Parent:=Form21.ScrollBox5;
EDx3[sn_titl-1].Parent:=Form21.ScrollBox5;
EDy3[sn_titl-1].Parent:=Form21.ScrollBox5;


CBst15[sn_titl-1].Left:=5;
CBst15[sn_titl-1].Width:=70;
CBst15[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst15[sn_titl-1].Items.Add('None');
CBst15[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm3,1,1))='Y'  then CBst15[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm3,1,1))='N'  then CBst15[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst11[sn_titl-1].Left:=CBst15[sn_titl-1].Left+CBst15[sn_titl-1].Width+20;
EDst11[sn_titl-1].Width:=30;
EDst11[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst11[sn_titl-1].Text:=prm1;         //номер  точки

EDst12[sn_titl-1].Left:=EDst11[sn_titl-1].Left+EDst11[sn_titl-1].Width;
EDst12[sn_titl-1].Width:=140;
EDst12[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
EDst12[sn_titl-1].Text:=inttostr(sn_titl-1);  /////////////////////////////



CBst16[sn_titl-1].Left:=EDst12[sn_titl-1].Left+EDst12[sn_titl-1].Width;
CBst16[sn_titl-1].Width:=130;
CBst16[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst16[sn_titl-1].Items.Add('Arial');
CBst16[sn_titl-1].Items.Add('Tahoma');
CBst16[sn_titl-1].Items.Add('Times New Roman');
CBst16[sn_titl-1].Items.Add('Courier New');
CBst16[sn_titl-1].Text:=prm01;           // шрифт

CBst17[sn_titl-1].Left:=CBst16[sn_titl-1].Left+CBst16[sn_titl-1].Width;
CBst17[sn_titl-1].Width:=65;
CBst17[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst17[sn_titl-1].Items.Add('8 пт');
CBst17[sn_titl-1].Items.Add('9 пт');
CBst17[sn_titl-1].Items.Add('10 пт');
CBst17[sn_titl-1].Items.Add('11 пт');
CBst17[sn_titl-1].Items.Add('12 пт');
CBst17[sn_titl-1].Items.Add('13 пт');
CBst17[sn_titl-1].Items.Add('14 пт');
CBst17[sn_titl-1].Text:=prm02+ ' пт';

ClBst5[sn_titl-1].Left:=CBst17[sn_titl-1].Left+CBst17[sn_titl-1].Width;
ClBst5[sn_titl-1].Width:=95;
ClBst5[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst5[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst5[sn_titl-1].ItemIndex:=ClBst5[sn_titl-1].Items.IndexOf(prm03);

CBst18[sn_titl-1].Left:=ClBst5[sn_titl-1].Left+ClBst5[sn_titl-1].Width;
CBst18[sn_titl-1].Width:=130;
CBst18[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst18[sn_titl-1].Items.Add('Normal');
CBst18[sn_titl-1].Items.Add('Bold');
CBst18[sn_titl-1].Items.Add('Italic');
CBst18[sn_titl-1].Items.Add('Bold+Italic');
CBst18[sn_titl-1].Items.Add('Underline');
CBst18[sn_titl-1].Items.Add('Bold+Underline');
CBst18[sn_titl-1].Items.Add('Italic+Underline');
CBst18[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst18[sn_titl-1].ItemIndex:=CBst18[sn_titl-1].Items.IndexOf(prm04);

EDx3[sn_titl-1].Left:=CBst18[sn_titl-1].Left+CBst18[sn_titl-1].Width+3;
EDx3[sn_titl-1].Width:=40;
EDx3[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx3[sn_titl-1].Text:=prm05;

EDy3[sn_titl-1].Left:=EDx3[sn_titl-1].Left+EDx3[sn_titl-1].Width;
EDy3[sn_titl-1].Width:=40;
EDy3[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy3[sn_titl-1].Text:=prm06;
l1:=3;
end;





///////////////имя 2
// имя 2
l:=0;
if pos('NAME',UpperCase(prm4))<>0 then l:=4;
if pos('ENERGY',UpperCase(prm4))<>0 then l:=6;
if pos('NUM',UpperCase(prm4))<>0 then l:=3;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;


for p:=1 to length(prm4) do begin
if (copy(prm4,p+l,1)=' ') or (copy(prm4,p+l,1)='=') or (copy(prm4,p+l,1)='(') then cn1:=cn1+1    //разделение до аргументов
else break;
end;
for p:=1 to length(prm4) do begin
if  (copy(prm4,cn1+p+l,1)<>',') and (copy(prm4,cn1+p+l,1)<>';') then cn2:=cn2+1    //Шрифт
else break;
end;
for p:=1 to length(prm4) do begin
if (copy(prm4,cn1+cn2+p+l,1)=' ') or (copy(prm4,cn1+cn2+p+l,1)=',') or (copy(prm4,cn1+cn2+p+l,1)=';') then cn3:=cn3+1    //пробелы до размера шрифта
else break;
end;
for p:=1 to length(prm4) do begin
if  (copy(prm4,cn1+cn2+cn3+p+l,1)<>',') and (copy(prm4,cn1+cn2+cn3+p+l,1)<>';') then cn4:=cn4+1    //размер шрифта
else break;
end;
for p:=1 to length(prm4) do begin
if (copy(prm4,cn1+cn2+cn3+cn4+p+l,1)=' ') or (copy(prm4,cn1+cn2+cn3+cn4+p+l,1)=',')  or (copy(prm4,cn1+cn2+cn3+cn4+p+l,1)=';')  then cn5:=cn5+1    //пробелы до цвета шрифта
else break;
end;
for p:=1 to length(prm4) do begin
if  (copy(prm4,cn1+cn2+cn3+cn4+cn5+p+l,1)<>',') and (copy(prm4,cn1+cn2+cn3+cn4+cn5+p+l,1)<>';') then cn6:=cn6+1    //цвет шрифта
else break;
end;
for p:=1 to length(prm4) do begin
if (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=' ') or (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=',') or (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=';') then cn7:=cn7+1    //пробелы до стиля (Bold, Italic И проч.)
else break;
end;
for p:=1 to length(prm4) do begin
if  (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+l,1)<>',') and (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+l,1)<>';') then cn8:=cn8+1    //стиль (Bold, Italic И проч.)
else break;
end;
for p:=1 to length(prm4) do begin
if (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=' ') or (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=',') or (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=';') then cn9:=cn9+1    //пробелы до X-коррекции
else break;
end;
for p:=1 to length(prm4) do begin
if  (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+l,1)<>',') and (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+l,1)<>';')  then cn10:=cn10+1    //X-коррекция
else break;
end;
for p:=1 to length(prm4) do begin
if (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=' ') or (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=',') or (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=';')   then cn11:=cn11+1    //пробелы Y-коррекции
else break;
end;
for p:=1 to length(prm4) do begin
if   (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>'')  and (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>')')  and (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>',')  and (copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>';') then cn12:=cn12+1    //Y-коррекция
else break;
end;

prm01:= copy(prm4,cn1+1+l,cn2);  //шрифт
prm02:= copy(prm4,cn1+cn2+cn3+1+l,cn4);  //размер шрифта
prm03:= copy(prm4,cn1+cn2+cn3+cn4+cn5+1+l,cn6);  //цвет шрифта
prm04:= copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+1+l,cn8);  //стиль шрифта
prm05:= copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+1+l,cn10);  //X-corr.
prm06:= copy(prm4,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+1+l,cn12);  //Y-corr.




if (l=4) or ((l=0) and (l1<>4)) then begin
setlength(EDst7,sn_titl);
setlength(EDst8,sn_titl);
setlength(CBst7,sn_titl);
setlength(CBst8,sn_titl);
setlength(CBst9,sn_titl);
setlength(CBst10,sn_titl);
setlength(ClBst3,sn_titl);
setlength(EDx1,sn_titl);
setlength(EDy1,sn_titl);

EDst7[sn_titl-1]:=TEdit.Create(self);
EDst8[sn_titl-1]:=TEdit.Create(self);
CBst7[sn_titl-1]:=TCombobox.Create(self);
CBst8[sn_titl-1]:=TCombobox.Create(self);
CBst9[sn_titl-1]:=TCombobox.Create(self);
CBst10[sn_titl-1]:=TCombobox.Create(self);
ClBst3[sn_titl-1]:=TColorbox.Create(self);
EDx1[sn_titl-1]:=TEdit.Create(self);
EDy1[sn_titl-1]:=TEdit.Create(self);
EDst7[sn_titl-1].Parent:=Form21.ScrollBox3;
EDst8[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst7[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst8[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst9[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst10[sn_titl-1].Parent:=Form21.ScrollBox3;
ClBst3[sn_titl-1].Parent:=Form21.ScrollBox3;
EDx1[sn_titl-1].Parent:=Form21.ScrollBox3;
EDy1[sn_titl-1].Parent:=Form21.ScrollBox3;


CBst7[sn_titl-1].Left:=5;
CBst7[sn_titl-1].Width:=70;
CBst7[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst7[sn_titl-1].Items.Add('None');
CBst7[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm5,1,1))='Y'  then CBst7[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm5,1,1))='N'  then CBst7[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst7[sn_titl-1].Left:=CBst7[sn_titl-1].Left+CBst7[sn_titl-1].Width+20;
EDst7[sn_titl-1].Width:=30;
EDst7[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst7[sn_titl-1].Text:=prm1;         //номер  точки

EDst8[sn_titl-1].Left:=EDst7[sn_titl-1].Left+EDst7[sn_titl-1].Width;
EDst8[sn_titl-1].Width:=140;
EDst8[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
for m:=0 to length(EDst2)-1 do begin
if prm1=EDSt2[m].Text then begin
EDst8[sn_titl-1].Text:=EDst3[m].Text;  /////////////////////////////
end;
end;

CBst8[sn_titl-1].Left:=EDst8[sn_titl-1].Left+EDst8[sn_titl-1].Width;
CBst8[sn_titl-1].Width:=130;
CBst8[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst8[sn_titl-1].Items.Add('Arial');
CBst8[sn_titl-1].Items.Add('Tahoma');
CBst8[sn_titl-1].Items.Add('Times New Roman');
CBst8[sn_titl-1].Items.Add('Courier New');
CBst8[sn_titl-1].Text:=prm01;           // шрифт

CBst9[sn_titl-1].Left:=CBst8[sn_titl-1].Left+CBst8[sn_titl-1].Width;
CBst9[sn_titl-1].Width:=65;
CBst9[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst9[sn_titl-1].Items.Add('8 пт');
CBst9[sn_titl-1].Items.Add('9 пт');
CBst9[sn_titl-1].Items.Add('10 пт');
CBst9[sn_titl-1].Items.Add('11 пт');
CBst9[sn_titl-1].Items.Add('12 пт');
CBst9[sn_titl-1].Items.Add('13 пт');
CBst9[sn_titl-1].Items.Add('14 пт');
CBst9[sn_titl-1].Text:=prm02+ ' пт';

ClBst3[sn_titl-1].Left:=CBst9[sn_titl-1].Left+CBst9[sn_titl-1].Width;
ClBst3[sn_titl-1].Width:=95;
ClBst3[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst3[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst3[sn_titl-1].ItemIndex:=ClBst3[sn_titl-1].Items.IndexOf(prm03);

CBst10[sn_titl-1].Left:=ClBst3[sn_titl-1].Left+ClBst3[sn_titl-1].Width;
CBst10[sn_titl-1].Width:=130;
CBst10[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst10[sn_titl-1].Items.Add('Normal');
CBst10[sn_titl-1].Items.Add('Bold');
CBst10[sn_titl-1].Items.Add('Italic');
CBst10[sn_titl-1].Items.Add('Bold+Italic');
CBst10[sn_titl-1].Items.Add('Underline');
CBst10[sn_titl-1].Items.Add('Bold+Underline');
CBst10[sn_titl-1].Items.Add('Italic+Underline');
CBst10[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst10[sn_titl-1].ItemIndex:=CBst10[sn_titl-1].Items.IndexOf(prm04);

EDx1[sn_titl-1].Left:=CBst10[sn_titl-1].Left+CBst10[sn_titl-1].Width+3;
EDx1[sn_titl-1].Width:=40;
EDx1[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx1[sn_titl-1].Text:=prm05;

EDy1[sn_titl-1].Left:=EDx1[sn_titl-1].Left+EDx1[sn_titl-1].Width;
EDy1[sn_titl-1].Width:=40;
EDy1[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy1[sn_titl-1].Text:=prm06;
l2:=4;
end;


if (l=6) or ((l=0) and (l1<>6) and (l2<>4)) then begin
setlength(EDst9,sn_titl);
setlength(EDst10,sn_titl);
setlength(CBst11,sn_titl);
setlength(CBst12,sn_titl);
setlength(CBst13,sn_titl);
setlength(CBst14,sn_titl);
setlength(ClBst4,sn_titl);
setlength(EDx2,sn_titl);
setlength(EDy2,sn_titl);

EDst9[sn_titl-1]:=TEdit.Create(self);
EDst10[sn_titl-1]:=TEdit.Create(self);
CBst11[sn_titl-1]:=TCombobox.Create(self);
CBst12[sn_titl-1]:=TCombobox.Create(self);
CBst13[sn_titl-1]:=TCombobox.Create(self);
CBst14[sn_titl-1]:=TCombobox.Create(self);
ClBst4[sn_titl-1]:=TColorbox.Create(self);
EDx2[sn_titl-1]:=TEdit.Create(self);
EDy2[sn_titl-1]:=TEdit.Create(self);
EDst9[sn_titl-1].Parent:=Form21.ScrollBox4;
EDst10[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst11[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst12[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst13[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst14[sn_titl-1].Parent:=Form21.ScrollBox4;
ClBst4[sn_titl-1].Parent:=Form21.ScrollBox4;
EDx2[sn_titl-1].Parent:=Form21.ScrollBox4;
EDy2[sn_titl-1].Parent:=Form21.ScrollBox4;


CBst11[sn_titl-1].Left:=5;
CBst11[sn_titl-1].Width:=70;
CBst11[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst11[sn_titl-1].Items.Add('None');
CBst11[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm5,1,1))='Y'  then CBst11[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm5,1,1))='N'  then CBst11[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst9[sn_titl-1].Left:=CBst11[sn_titl-1].Left+CBst11[sn_titl-1].Width+20;
EDst9[sn_titl-1].Width:=30;
EDst9[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst9[sn_titl-1].Text:=prm1;         //номер  точки

EDst10[sn_titl-1].Left:=EDst9[sn_titl-1].Left+EDst9[sn_titl-1].Width;
EDst10[sn_titl-1].Width:=140;
EDst10[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
for m:=0 to length(EDst2)-1 do begin
if prm1=EDSt2[m].Text then begin
EDst10[sn_titl-1].Text:=EDst4[m].Text;  /////////////////////////////
end;
end;

CBst12[sn_titl-1].Left:=EDst10[sn_titl-1].Left+EDst10[sn_titl-1].Width;
CBst12[sn_titl-1].Width:=130;
CBst12[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst12[sn_titl-1].Items.Add('Arial');
CBst12[sn_titl-1].Items.Add('Tahoma');
CBst12[sn_titl-1].Items.Add('Times New Roman');
CBst12[sn_titl-1].Items.Add('Courier New');
CBst12[sn_titl-1].Text:=prm01;           // шрифт

CBst13[sn_titl-1].Left:=CBst12[sn_titl-1].Left+CBst12[sn_titl-1].Width;
CBst13[sn_titl-1].Width:=65;
CBst13[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst13[sn_titl-1].Items.Add('8 пт');
CBst13[sn_titl-1].Items.Add('9 пт');
CBst13[sn_titl-1].Items.Add('10 пт');
CBst13[sn_titl-1].Items.Add('11 пт');
CBst13[sn_titl-1].Items.Add('12 пт');
CBst13[sn_titl-1].Items.Add('13 пт');
CBst13[sn_titl-1].Items.Add('14 пт');
CBst13[sn_titl-1].Text:=prm02+ ' пт';

ClBst4[sn_titl-1].Left:=CBst13[sn_titl-1].Left+CBst13[sn_titl-1].Width;
ClBst4[sn_titl-1].Width:=95;
ClBst4[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst4[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst4[sn_titl-1].ItemIndex:=ClBst4[sn_titl-1].Items.IndexOf(prm03);

CBst14[sn_titl-1].Left:=ClBst4[sn_titl-1].Left+ClBst4[sn_titl-1].Width;
CBst14[sn_titl-1].Width:=130;
CBst14[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst14[sn_titl-1].Items.Add('Normal');
CBst14[sn_titl-1].Items.Add('Bold');
CBst14[sn_titl-1].Items.Add('Italic');
CBst14[sn_titl-1].Items.Add('Bold+Italic');
CBst14[sn_titl-1].Items.Add('Underline');
CBst14[sn_titl-1].Items.Add('Bold+Underline');
CBst14[sn_titl-1].Items.Add('Italic+Underline');
CBst14[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst14[sn_titl-1].ItemIndex:=CBst14[sn_titl-1].Items.IndexOf(prm04);

EDx2[sn_titl-1].Left:=CBst14[sn_titl-1].Left+CBst14[sn_titl-1].Width+3;
EDx2[sn_titl-1].Width:=40;
EDx2[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx2[sn_titl-1].Text:=prm05;

EDy2[sn_titl-1].Left:=EDx2[sn_titl-1].Left+EDx2[sn_titl-1].Width;
EDy2[sn_titl-1].Width:=40;
EDy2[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy2[sn_titl-1].Text:=prm06;
l2:=6;
end;


if (l=3) or ((l=0) and (l1<>3) and (l2<>6) and (l2<>4)) then begin
setlength(EDst11,sn_titl);
setlength(EDst12,sn_titl);
setlength(CBst15,sn_titl);
setlength(CBst16,sn_titl);
setlength(CBst17,sn_titl);
setlength(CBst18,sn_titl);
setlength(ClBst5,sn_titl);
setlength(EDx3,sn_titl);
setlength(EDy3,sn_titl);

EDst11[sn_titl-1]:=TEdit.Create(self);
EDst12[sn_titl-1]:=TEdit.Create(self);
CBst15[sn_titl-1]:=TCombobox.Create(self);
CBst16[sn_titl-1]:=TCombobox.Create(self);
CBst17[sn_titl-1]:=TCombobox.Create(self);
CBst18[sn_titl-1]:=TCombobox.Create(self);
ClBst5[sn_titl-1]:=TColorbox.Create(self);
EDx3[sn_titl-1]:=TEdit.Create(self);
EDy3[sn_titl-1]:=TEdit.Create(self);
EDst11[sn_titl-1].Parent:=Form21.ScrollBox5;
EDst12[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst15[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst16[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst17[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst18[sn_titl-1].Parent:=Form21.ScrollBox5;
ClBst5[sn_titl-1].Parent:=Form21.ScrollBox5;
EDx3[sn_titl-1].Parent:=Form21.ScrollBox5;
EDy3[sn_titl-1].Parent:=Form21.ScrollBox5;


CBst15[sn_titl-1].Left:=5;
CBst15[sn_titl-1].Width:=70;
CBst15[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst15[sn_titl-1].Items.Add('None');
CBst15[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm5,1,1))='Y'  then CBst15[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm5,1,1))='N'  then CBst15[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst11[sn_titl-1].Left:=CBst15[sn_titl-1].Left+CBst15[sn_titl-1].Width+20;
EDst11[sn_titl-1].Width:=30;
EDst11[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst11[sn_titl-1].Text:=prm1;         //номер  точки

EDst12[sn_titl-1].Left:=EDst11[sn_titl-1].Left+EDst11[sn_titl-1].Width;
EDst12[sn_titl-1].Width:=140;
EDst12[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
EDst12[sn_titl-1].Text:=inttostr(sn_titl-1);  /////////////////////////////


CBst16[sn_titl-1].Left:=EDst12[sn_titl-1].Left+EDst12[sn_titl-1].Width;
CBst16[sn_titl-1].Width:=130;
CBst16[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst16[sn_titl-1].Items.Add('Arial');
CBst16[sn_titl-1].Items.Add('Tahoma');
CBst16[sn_titl-1].Items.Add('Times New Roman');
CBst16[sn_titl-1].Items.Add('Courier New');
CBst16[sn_titl-1].Text:=prm01;           // шрифт

CBst17[sn_titl-1].Left:=CBst16[sn_titl-1].Left+CBst16[sn_titl-1].Width;
CBst17[sn_titl-1].Width:=65;
CBst17[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst17[sn_titl-1].Items.Add('8 пт');
CBst17[sn_titl-1].Items.Add('9 пт');
CBst17[sn_titl-1].Items.Add('10 пт');
CBst17[sn_titl-1].Items.Add('11 пт');
CBst17[sn_titl-1].Items.Add('12 пт');
CBst17[sn_titl-1].Items.Add('13 пт');
CBst17[sn_titl-1].Items.Add('14 пт');
CBst17[sn_titl-1].Text:=prm02+ ' пт';

ClBst5[sn_titl-1].Left:=CBst17[sn_titl-1].Left+CBst17[sn_titl-1].Width;
ClBst5[sn_titl-1].Width:=95;
ClBst5[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst5[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst5[sn_titl-1].ItemIndex:=ClBst5[sn_titl-1].Items.IndexOf(prm03);

CBst18[sn_titl-1].Left:=ClBst5[sn_titl-1].Left+ClBst5[sn_titl-1].Width;
CBst18[sn_titl-1].Width:=130;
CBst18[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst18[sn_titl-1].Items.Add('Normal');
CBst18[sn_titl-1].Items.Add('Bold');
CBst18[sn_titl-1].Items.Add('Italic');
CBst18[sn_titl-1].Items.Add('Bold+Italic');
CBst18[sn_titl-1].Items.Add('Underline');
CBst18[sn_titl-1].Items.Add('Bold+Underline');
CBst18[sn_titl-1].Items.Add('Italic+Underline');
CBst18[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst18[sn_titl-1].ItemIndex:=CBst18[sn_titl-1].Items.IndexOf(prm04);

EDx3[sn_titl-1].Left:=CBst18[sn_titl-1].Left+CBst18[sn_titl-1].Width+3;
EDx3[sn_titl-1].Width:=40;
EDx3[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx3[sn_titl-1].Text:=prm05;

EDy3[sn_titl-1].Left:=EDx3[sn_titl-1].Left+EDx3[sn_titl-1].Width;
EDy3[sn_titl-1].Width:=40;
EDy3[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy3[sn_titl-1].Text:=prm06;
l2:=3;
end;




///////////////имя 3
// имя 3
l:=0;
if pos('NAME',UpperCase(prm6))<>0 then l:=4;
if pos('ENERGY',UpperCase(prm6))<>0 then l:=6;
if pos('NUM',UpperCase(prm6))<>0 then l:=3;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;


for p:=1 to length(prm6) do begin
if (copy(prm6,p+l,1)=' ') or (copy(prm6,p+l,1)='=') or (copy(prm6,p+l,1)='(') then cn1:=cn1+1    //разделение до аргументов
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+p+l,1)<>',') and (copy(prm6,cn1+p+l,1)<>';') then cn2:=cn2+1    //Шрифт
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+p+l,1)=' ') or (copy(prm6,cn1+cn2+p+l,1)=',') or (copy(prm6,cn1+cn2+p+l,1)=';') then cn3:=cn3+1    //пробелы до размера шрифта
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+cn2+cn3+p+l,1)<>',') and (copy(prm6,cn1+cn2+cn3+p+l,1)<>';') then cn4:=cn4+1    //размер шрифта
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+p+l,1)=' ') or (copy(prm6,cn1+cn2+cn3+cn4+p+l,1)=',')  or (copy(prm6,cn1+cn2+cn3+cn4+p+l,1)=';')  then cn5:=cn5+1    //пробелы до цвета шрифта
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+cn2+cn3+cn4+cn5+p+l,1)<>',') and (copy(prm6,cn1+cn2+cn3+cn4+cn5+p+l,1)<>';') then cn6:=cn6+1    //цвет шрифта
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=' ') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=',') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+p+l,1)=';') then cn7:=cn7+1    //пробелы до стиля (Bold, Italic И проч.)
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+l,1)<>',') and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p+l,1)<>';') then cn8:=cn8+1    //стиль (Bold, Italic И проч.)
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=' ') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=',') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p+l,1)=';') then cn9:=cn9+1    //пробелы до X-коррекции
else break;
end;
for p:=1 to length(prm6) do begin
if  (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+l,1)<>',') and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p+l,1)<>';')  then cn10:=cn10+1    //X-коррекция
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=' ') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=',') or (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p+l,1)=';')   then cn11:=cn11+1    //пробелы Y-коррекции
else break;
end;
for p:=1 to length(prm6) do begin
if (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>'')  and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>')')  and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>',')  and (copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p+l,1)<>';') then cn12:=cn12+1    //Y-коррекция
else break;
end;

prm01:= copy(prm6,cn1+1+l,cn2);  //шрифт
prm02:= copy(prm6,cn1+cn2+cn3+1+l,cn4);  //размер шрифта
prm03:= copy(prm6,cn1+cn2+cn3+cn4+cn5+1+l,cn6);  //цвет шрифта
prm04:= copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+1+l,cn8);  //стиль шрифта
prm05:= copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+1+l,cn10);  //X-corr.
prm06:= copy(prm6,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+1+l,cn12);  //Y-corr.




if (l=4) or ((l=0) and (l1<>4) and (l2<>4)) then begin
setlength(EDst7,sn_titl);
setlength(EDst8,sn_titl);
setlength(CBst7,sn_titl);
setlength(CBst8,sn_titl);
setlength(CBst9,sn_titl);
setlength(CBst10,sn_titl);
setlength(ClBst3,sn_titl);
setlength(EDx1,sn_titl);
setlength(EDy1,sn_titl);

EDst7[sn_titl-1]:=TEdit.Create(self);
EDst8[sn_titl-1]:=TEdit.Create(self);
CBst7[sn_titl-1]:=TCombobox.Create(self);
CBst8[sn_titl-1]:=TCombobox.Create(self);
CBst9[sn_titl-1]:=TCombobox.Create(self);
CBst10[sn_titl-1]:=TCombobox.Create(self);
ClBst3[sn_titl-1]:=TColorbox.Create(self);
EDx1[sn_titl-1]:=TEdit.Create(self);
EDy1[sn_titl-1]:=TEdit.Create(self);
EDst7[sn_titl-1].Parent:=Form21.ScrollBox3;
EDst8[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst7[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst8[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst9[sn_titl-1].Parent:=Form21.ScrollBox3;
CBst10[sn_titl-1].Parent:=Form21.ScrollBox3;
ClBst3[sn_titl-1].Parent:=Form21.ScrollBox3;
EDx1[sn_titl-1].Parent:=Form21.ScrollBox3;
EDy1[sn_titl-1].Parent:=Form21.ScrollBox3;


CBst7[sn_titl-1].Left:=5;
CBst7[sn_titl-1].Width:=70;
CBst7[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst7[sn_titl-1].Items.Add('None');
CBst7[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm7,1,1))='Y'  then CBst7[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm7,1,1))='N'  then CBst7[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst7[sn_titl-1].Left:=CBst7[sn_titl-1].Left+CBst7[sn_titl-1].Width+20;
EDst7[sn_titl-1].Width:=30;
EDst7[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst7[sn_titl-1].Text:=prm1;         //номер  точки

EDst8[sn_titl-1].Left:=EDst7[sn_titl-1].Left+EDst7[sn_titl-1].Width;
EDst8[sn_titl-1].Width:=140;
EDst8[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
for m:=0 to length(EDst2)-1 do begin
if prm1=EDSt2[m].Text then begin
EDst8[sn_titl-1].Text:=EDst3[m].Text;  /////////////////////////////
end;
end;

CBst8[sn_titl-1].Left:=EDst8[sn_titl-1].Left+EDst8[sn_titl-1].Width;
CBst8[sn_titl-1].Width:=130;
CBst8[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst8[sn_titl-1].Items.Add('Arial');
CBst8[sn_titl-1].Items.Add('Tahoma');
CBst8[sn_titl-1].Items.Add('Times New Roman');
CBst8[sn_titl-1].Items.Add('Courier New');
CBst8[sn_titl-1].Text:=prm01;           // шрифт

CBst9[sn_titl-1].Left:=CBst8[sn_titl-1].Left+CBst8[sn_titl-1].Width;
CBst9[sn_titl-1].Width:=65;
CBst9[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst9[sn_titl-1].Items.Add('8 пт');
CBst9[sn_titl-1].Items.Add('9 пт');
CBst9[sn_titl-1].Items.Add('10 пт');
CBst9[sn_titl-1].Items.Add('11 пт');
CBst9[sn_titl-1].Items.Add('12 пт');
CBst9[sn_titl-1].Items.Add('13 пт');
CBst9[sn_titl-1].Items.Add('14 пт');
CBst9[sn_titl-1].Text:=prm02+ ' пт';

ClBst3[sn_titl-1].Left:=CBst9[sn_titl-1].Left+CBst9[sn_titl-1].Width;
ClBst3[sn_titl-1].Width:=95;
ClBst3[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst3[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst3[sn_titl-1].ItemIndex:=ClBst3[sn_titl-1].Items.IndexOf(prm03);

CBst10[sn_titl-1].Left:=ClBst3[sn_titl-1].Left+ClBst3[sn_titl-1].Width;
CBst10[sn_titl-1].Width:=130;
CBst10[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst10[sn_titl-1].Items.Add('Normal');
CBst10[sn_titl-1].Items.Add('Bold');
CBst10[sn_titl-1].Items.Add('Italic');
CBst10[sn_titl-1].Items.Add('Bold+Italic');
CBst10[sn_titl-1].Items.Add('Underline');
CBst10[sn_titl-1].Items.Add('Bold+Underline');
CBst10[sn_titl-1].Items.Add('Italic+Underline');
CBst10[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst10[sn_titl-1].ItemIndex:=CBst10[sn_titl-1].Items.IndexOf(prm04);

EDx1[sn_titl-1].Left:=CBst10[sn_titl-1].Left+CBst10[sn_titl-1].Width+3;
EDx1[sn_titl-1].Width:=40;
EDx1[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx1[sn_titl-1].Text:=prm05;

EDy1[sn_titl-1].Left:=EDx1[sn_titl-1].Left+EDx1[sn_titl-1].Width;
EDy1[sn_titl-1].Width:=40;
EDy1[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy1[sn_titl-1].Text:=prm06;
end;


if (l=6) or ((l=0) and (l1<>6) and (l2<>6)) then begin
setlength(EDst9,sn_titl);
setlength(EDst10,sn_titl);
setlength(CBst11,sn_titl);
setlength(CBst12,sn_titl);
setlength(CBst13,sn_titl);
setlength(CBst14,sn_titl);
setlength(ClBst4,sn_titl);
setlength(EDx2,sn_titl);
setlength(EDy2,sn_titl);

EDst9[sn_titl-1]:=TEdit.Create(self);
EDst10[sn_titl-1]:=TEdit.Create(self);
CBst11[sn_titl-1]:=TCombobox.Create(self);
CBst12[sn_titl-1]:=TCombobox.Create(self);
CBst13[sn_titl-1]:=TCombobox.Create(self);
CBst14[sn_titl-1]:=TCombobox.Create(self);
ClBst4[sn_titl-1]:=TColorbox.Create(self);
EDx2[sn_titl-1]:=TEdit.Create(self);
EDy2[sn_titl-1]:=TEdit.Create(self);
EDst9[sn_titl-1].Parent:=Form21.ScrollBox4;
EDst10[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst11[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst12[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst13[sn_titl-1].Parent:=Form21.ScrollBox4;
CBst14[sn_titl-1].Parent:=Form21.ScrollBox4;
ClBst4[sn_titl-1].Parent:=Form21.ScrollBox4;
EDx2[sn_titl-1].Parent:=Form21.ScrollBox4;
EDy2[sn_titl-1].Parent:=Form21.ScrollBox4;


CBst11[sn_titl-1].Left:=5;
CBst11[sn_titl-1].Width:=70;
CBst11[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst11[sn_titl-1].Items.Add('None');
CBst11[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm7,1,1))='Y'  then CBst11[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm7,1,1))='N'  then CBst11[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst9[sn_titl-1].Left:=CBst11[sn_titl-1].Left+CBst11[sn_titl-1].Width+20;
EDst9[sn_titl-1].Width:=30;
EDst9[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst9[sn_titl-1].Text:=prm1;         //номер  точки

EDst10[sn_titl-1].Left:=EDst9[sn_titl-1].Left+EDst9[sn_titl-1].Width;
EDst10[sn_titl-1].Width:=140;
EDst10[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
for m:=0 to length(EDst2)-1 do begin
if prm1=EDSt2[m].Text then begin
EDst10[sn_titl-1].Text:=EDst4[m].Text;  /////////////////////////////
end;
end;

CBst12[sn_titl-1].Left:=EDst10[sn_titl-1].Left+EDst10[sn_titl-1].Width;
CBst12[sn_titl-1].Width:=130;
CBst12[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst12[sn_titl-1].Items.Add('Arial');
CBst12[sn_titl-1].Items.Add('Tahoma');
CBst12[sn_titl-1].Items.Add('Times New Roman');
CBst12[sn_titl-1].Items.Add('Courier New');
CBst12[sn_titl-1].Text:=prm01;           // шрифт

CBst13[sn_titl-1].Left:=CBst12[sn_titl-1].Left+CBst12[sn_titl-1].Width;
CBst13[sn_titl-1].Width:=65;
CBst13[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst13[sn_titl-1].Items.Add('8 пт');
CBst13[sn_titl-1].Items.Add('9 пт');
CBst13[sn_titl-1].Items.Add('10 пт');
CBst13[sn_titl-1].Items.Add('11 пт');
CBst13[sn_titl-1].Items.Add('12 пт');
CBst13[sn_titl-1].Items.Add('13 пт');
CBst13[sn_titl-1].Items.Add('14 пт');
CBst13[sn_titl-1].Text:=prm02+ ' пт';

ClBst4[sn_titl-1].Left:=CBst13[sn_titl-1].Left+CBst13[sn_titl-1].Width;
ClBst4[sn_titl-1].Width:=95;
ClBst4[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst4[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst4[sn_titl-1].ItemIndex:=ClBst4[sn_titl-1].Items.IndexOf(prm03);

CBst14[sn_titl-1].Left:=ClBst4[sn_titl-1].Left+ClBst4[sn_titl-1].Width;
CBst14[sn_titl-1].Width:=130;
CBst14[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst14[sn_titl-1].Items.Add('Normal');
CBst14[sn_titl-1].Items.Add('Bold');
CBst14[sn_titl-1].Items.Add('Italic');
CBst14[sn_titl-1].Items.Add('Bold+Italic');
CBst14[sn_titl-1].Items.Add('Underline');
CBst14[sn_titl-1].Items.Add('Bold+Underline');
CBst14[sn_titl-1].Items.Add('Italic+Underline');
CBst14[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst14[sn_titl-1].ItemIndex:=CBst14[sn_titl-1].Items.IndexOf(prm04);

EDx2[sn_titl-1].Left:=CBst14[sn_titl-1].Left+CBst14[sn_titl-1].Width+3;
EDx2[sn_titl-1].Width:=40;
EDx2[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx2[sn_titl-1].Text:=prm05;

EDy2[sn_titl-1].Left:=EDx2[sn_titl-1].Left+EDx2[sn_titl-1].Width;
EDy2[sn_titl-1].Width:=40;
EDy2[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy2[sn_titl-1].Text:=prm06;
end;


if (l=3) or ((l=0) and (l1<>3) and (l2<>3)) then begin
setlength(EDst11,sn_titl);
setlength(EDst12,sn_titl);
setlength(CBst15,sn_titl);
setlength(CBst16,sn_titl);
setlength(CBst17,sn_titl);
setlength(CBst18,sn_titl);
setlength(ClBst5,sn_titl);
setlength(EDx3,sn_titl);
setlength(EDy3,sn_titl);

EDst11[sn_titl-1]:=TEdit.Create(self);
EDst12[sn_titl-1]:=TEdit.Create(self);
CBst15[sn_titl-1]:=TCombobox.Create(self);
CBst16[sn_titl-1]:=TCombobox.Create(self);
CBst17[sn_titl-1]:=TCombobox.Create(self);
CBst18[sn_titl-1]:=TCombobox.Create(self);
ClBst5[sn_titl-1]:=TColorbox.Create(self);
EDx3[sn_titl-1]:=TEdit.Create(self);
EDy3[sn_titl-1]:=TEdit.Create(self);
EDst11[sn_titl-1].Parent:=Form21.ScrollBox5;
EDst12[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst15[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst16[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst17[sn_titl-1].Parent:=Form21.ScrollBox5;
CBst18[sn_titl-1].Parent:=Form21.ScrollBox5;
ClBst5[sn_titl-1].Parent:=Form21.ScrollBox5;
EDx3[sn_titl-1].Parent:=Form21.ScrollBox5;
EDy3[sn_titl-1].Parent:=Form21.ScrollBox5;


CBst15[sn_titl-1].Left:=5;
CBst15[sn_titl-1].Width:=70;
CBst15[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst15[sn_titl-1].Items.Add('None');
CBst15[sn_titl-1].Items.Add('Text');
if UpperCase(copy(prm7,1,1))='Y'  then CBst15[sn_titl-1].ItemIndex:=1;              //текст или ничего
if UpperCase(copy(prm7,1,1))='N'  then CBst15[sn_titl-1].ItemIndex:=0;              //текст или ничего


EDst11[sn_titl-1].Left:=CBst15[sn_titl-1].Left+CBst15[sn_titl-1].Width+20;
EDst11[sn_titl-1].Width:=30;
EDst11[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDst11[sn_titl-1].Text:=prm1;         //номер  точки

EDst12[sn_titl-1].Left:=EDst11[sn_titl-1].Left+EDst11[sn_titl-1].Width;
EDst12[sn_titl-1].Width:=140;
EDst12[sn_titl-1].Top:=5+(sn_titl-1)*20;
/////служебно для определения имени   точки
EDst12[sn_titl-1].Text:=inttostr(sn_titl-1);  /////////////////////////////


CBst16[sn_titl-1].Left:=EDst12[sn_titl-1].Left+EDst12[sn_titl-1].Width;
CBst16[sn_titl-1].Width:=130;
CBst16[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst16[sn_titl-1].Items.Add('Arial');
CBst16[sn_titl-1].Items.Add('Tahoma');
CBst16[sn_titl-1].Items.Add('Times New Roman');
CBst16[sn_titl-1].Items.Add('Courier New');
CBst16[sn_titl-1].Text:=prm01;           // шрифт

CBst17[sn_titl-1].Left:=CBst16[sn_titl-1].Left+CBst16[sn_titl-1].Width;
CBst17[sn_titl-1].Width:=65;
CBst17[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst17[sn_titl-1].Items.Add('8 пт');
CBst17[sn_titl-1].Items.Add('9 пт');
CBst17[sn_titl-1].Items.Add('10 пт');
CBst17[sn_titl-1].Items.Add('11 пт');
CBst17[sn_titl-1].Items.Add('12 пт');
CBst17[sn_titl-1].Items.Add('13 пт');
CBst17[sn_titl-1].Items.Add('14 пт');
CBst17[sn_titl-1].Text:=prm02+ ' пт';

ClBst5[sn_titl-1].Left:=CBst17[sn_titl-1].Left+CBst17[sn_titl-1].Width;
ClBst5[sn_titl-1].Width:=95;
ClBst5[sn_titl-1].Top:=5+(sn_titl-1)*20;
ClBst5[sn_titl-1].Style:=[cbStandardColors,cbPrettyNames];
ClBst5[sn_titl-1].ItemIndex:=ClBst5[sn_titl-1].Items.IndexOf(prm03);

CBst18[sn_titl-1].Left:=ClBst5[sn_titl-1].Left+ClBst5[sn_titl-1].Width;
CBst18[sn_titl-1].Width:=130;
CBst18[sn_titl-1].Top:=5+(sn_titl-1)*20;
CBst18[sn_titl-1].Items.Add('Normal');
CBst18[sn_titl-1].Items.Add('Bold');
CBst18[sn_titl-1].Items.Add('Italic');
CBst18[sn_titl-1].Items.Add('Bold+Italic');
CBst18[sn_titl-1].Items.Add('Underline');
CBst18[sn_titl-1].Items.Add('Bold+Underline');
CBst18[sn_titl-1].Items.Add('Italic+Underline');
CBst18[sn_titl-1].Items.Add('Bold+Italic+Underline');
CBst18[sn_titl-1].ItemIndex:=CBst18[sn_titl-1].Items.IndexOf(prm04);

EDx3[sn_titl-1].Left:=CBst18[sn_titl-1].Left+CBst18[sn_titl-1].Width+3;
EDx3[sn_titl-1].Width:=40;
EDx3[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDx3[sn_titl-1].Text:=prm05;

EDy3[sn_titl-1].Left:=EDx3[sn_titl-1].Left+EDx3[sn_titl-1].Width;
EDy3[sn_titl-1].Width:=40;
EDy3[sn_titl-1].Top:=5+(sn_titl-1)*20;
EDy3[sn_titl-1].Text:=prm06;
end;

sn_titl:=sn_titl+1;





end;






end;










// Теперь вместо переменных пишем номера точек, т.к. функцмонирование завязано на индексы массивов = номера точек
setlength(strx,length(EDst2));

for i:=0 to length(EDst2)-1 do
strx[i]:=EDst2[i].Text;

for i:=0 to length(strx)-1 do begin
for j:=0 to length(EDst2)-1 do  begin
if EDst2[j].Text=strx[i] then EDst2[j].Text:=inttostr(i);
end;
end;

for i:=0 to length(strx)-1 do begin
for j:=0 to length(EDst7)-1 do  begin
if EDst7[j].Text=strx[i] then EDst7[j].Text:=inttostr(i);
end;
end;

for i:=0 to length(strx)-1 do begin
for j:=0 to length(EDst9)-1 do  begin
if EDst9[j].Text=strx[i] then EDst9[j].Text:=inttostr(i);
end;
end;

for i:=0 to length(strx)-1 do begin
for j:=0 to length(EDst11)-1 do  begin
if EDst11[j].Text=strx[i] then EDst11[j].Text:=inttostr(i);
end;
end;

if  length(EDst5)=0 then begin
showmessage('В файле DGR не найдено не одного направления реакции');
goto 1;
end;


for i:=0 to length(strx)-1 do begin
for j:=0 to length(EDst5)-1 do  begin
if EDst5[j].Text=strx[i] then EDst5[j].Text:=inttostr(i);
end;
end;

for i:=0 to length(strx)-1 do begin
for j:=0 to length(EDst6)-1 do  begin
if EDst6[j].Text=strx[i] then EDst6[j].Text:=inttostr(i);
end;
end;


for i:=0 to length(strx)-1 do begin
for j:=0 to length(EDst13)-1 do  begin
if EDst13[j].Text=strx[i] then EDst13[j].Text:=inttostr(i);
end;
end;

for i:=0 to length(strx)-1 do begin
for j:=0 to length(EDst14)-1 do  begin
if EDst14[j].Text=strx[i] then EDst14[j].Text:=inttostr(i);
end;
end;

// Этот блок нужен для дописывания значений тех элеменнтов, которые вообще не представлены в текстовом файле
1:
for i:=0 to length(EDst2)-1 do begin
if EDst1[i].Text='' then EDst1[i].Text:=inttostr(i);
if EDst3[i].Text='' then EDst3[i].Text:='Point'+inttostr(i);
if (CBst1[i].ItemIndex=-1)  then CBst1[i].ItemIndex:=0;
if (CBst2[i].ItemIndex=-1)   then CBst2[i].ItemIndex:=0;
if ClBst1[i].ItemIndex=-1 then ClBst1[i].ItemIndex:= ClBst1[i].Items.IndexOf('Black');
if (CBst3[i].ItemIndex=-1) and (CBst3[i].Text='') then CBst3[i].ItemIndex:=2;
if (CBst4[i].ItemIndex=-1) and (CBst4[i].Text='') then CBst4[i].ItemIndex:=3;

if (CBst7[i].ItemIndex=-1)  then CBst7[i].ItemIndex:=1;
if EDst7[i].Text='' then EDst7[i].Text:=inttostr(i);
if EDst8[i].Text='' then EDst8[i].Text:='Point'+inttostr(i);
if (CBst8[i].ItemIndex=-1) and (CBst8[i].Text='')  then CBst8[i].ItemIndex:=0;
if (CBst9[i].ItemIndex=-1) and (length(CBst9[i].Text)<4) then CBst9[i].ItemIndex:=2;
if ClBst3[i].ItemIndex=-1 then ClBst3[i].ItemIndex:= ClBst3[i].Items.IndexOf('Blue');
if (CBst10[i].ItemIndex=-1)  then CBst10[i].ItemIndex:=0;
if EDx1[i].Text='' then EDx1[i].Text:='0';
if EDy1[i].Text='' then EDy1[i].Text:='0';

if (CBst11[i].ItemIndex=-1)  then CBst11[i].ItemIndex:=1;
if EDst9[i].Text='' then EDst9[i].Text:=inttostr(i);
if EDst10[i].Text='' then EDst10[i].Text:=EDst4[i].Text;
if (CBst12[i].ItemIndex=-1) and (CBst12[i].Text='')  then CBst12[i].ItemIndex:=0;
if (CBst13[i].ItemIndex=-1) and (length(CBst13[i].Text)<4)  then CBst13[i].ItemIndex:=2;
if ClBst4[i].ItemIndex=-1 then ClBst4[i].ItemIndex:= ClBst4[i].Items.IndexOf('Black');
if (CBst14[i].ItemIndex=-1)  then CBst14[i].ItemIndex:=0;
if EDx2[i].Text='' then EDx2[i].Text:='0';
if EDy2[i].Text='' then EDy2[i].Text:='0';

if (CBst15[i].ItemIndex=-1)  then CBst15[i].ItemIndex:=0;
if EDst11[i].Text='' then EDst11[i].Text:=inttostr(i);
if EDst12[i].Text='' then EDst12[i].Text:=inttostr(i);
if (CBst16[i].ItemIndex=-1) and (CBst16[i].Text='')  then CBst16[i].ItemIndex:=0;
if (CBst17[i].ItemIndex=-1)  and (length(CBst17[i].Text)<4) then CBst17[i].ItemIndex:=2;
if ClBst5[i].ItemIndex=-1 then ClBst5[i].ItemIndex:= ClBst5[i].Items.IndexOf('Olive');
if (CBst18[i].ItemIndex=-1) then CBst18[i].ItemIndex:=0;
if EDx3[i].Text='' then EDx3[i].Text:='0';
if EDy3[i].Text='' then EDy3[i].Text:='0';
end;






if  length(EDst5)=0 then goto 2;




for i:=0 to length(EDst5)-1 do begin
if (CBst5[i].ItemIndex=-1) and (CBst5[i].Text='')  then CBst5[i].ItemIndex:=1;
if (CBst6[i].ItemIndex=-1)  then CBst6[i].ItemIndex:=0;
if ClBst2[i].ItemIndex=-1 then ClBst2[i].ItemIndex:= ClBst2[i].Items.IndexOf('Black');

if (CBst19[i].ItemIndex=-1)  then CBst19[i].ItemIndex:=1;
if EDst13[i].Text='' then EDst13[i].Text:=EDst5[i].Text;
if EDst14[i].Text='' then EDst14[i].Text:=EDst6[i].Text;
if EDst15[i].Text='' then EDst15[i].Text:=floattostr(strtofloat(EDst4[strtoint(EDst14[i].Text)].Text)-strtofloat(EDst4[strtoint(EDst13[i].Text)].Text));
if (CBst20[i].ItemIndex=-1) and (CBst20[i].Text='') then CBst20[i].ItemIndex:=0;
if (CBst21[i].ItemIndex=-1) and (length(CBst21[i].Text)<4) then CBst21[i].ItemIndex:=2;
if ClBst6[i].ItemIndex=-1 then ClBst6[i].ItemIndex:= ClBst6[i].Items.IndexOf('Red');
if (CBst22[i].ItemIndex=-1) then CBst22[i].ItemIndex:=1;
if EDx4[i].Text='' then EDx4[i].Text:='0';
if EDy4[i].Text='' then EDy4[i].Text:='0';
end;











2: bol:=false;
pos33:=false;
Form21.Show;
end;









0: end;

procedure TForm19.BitBtn3Click(Sender: TObject);
begin
Form23.Show;
end;

end.
