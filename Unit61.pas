unit Unit61;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, ComCtrls, Math;

type
  TForm61 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    PaintBox1: TPaintBox;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Edit1: TEdit;
    Label1: TLabel;
    N1: TMenuItem;
    N2: TMenuItem;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form61: TForm61;
  rezhim_nmr: string='EXP';
  Xstart_nmr,Ystart_nmr,Lsh: integer;
  press_nmr: boolean=false;
  R_nmr: TRect;
  ZoomX1_nmr,ZoomX2_nmr,ZoomY1_nmr,ZoomY2_nmr: real;
  shield_min,shield_max,degener_max: real;
  BMP_nmr: TBitmap;
  sh,sh1,sh2: array of double;
  de: array of double;
  Ref: real;
  Pn_line: integer;
  el_dc,val_dc: array of string;

implementation

uses Unit62, Unit1, Unit58, Unit24, Unit63;

{$R *.dfm}


procedure spline_nmr(Y: array of integer; Beg: integer; S: String);
var i,n,j: integer;
    Z: array of integer;
    W: array of integer;
begin
Z:=nil;
setlength(Z,length(Y));

if UpperCase(S)='LIN' then begin   //////////////////////////Линейная аппроксимация

Z[0]:=Round((Y[0]+Y[1])/2);
for i:=1 to  length(Y)-2 do  begin

Z[i]:=Round((Z[i-1]+Y[i]+Y[i+1])/3);

end;
Z[length(Y)-1]:=Round((Z[length(Y)-2]+Y[length(Y)-1])/2);
end;

if UpperCase(S)='EXP' then begin   //////////////////////////Экспоненциальная аппроксимация
SetLength(W,length(Y));
for i:=0 to length(Y)-1 do
W[i]:=MaxIntValue(Y)-Y[i];    // Нормированный массив


for i:=0 to length(Y)-1 do begin
Z[i]:=0;
for j:=0 to length(Y)-1 do
if W[j]<>0 then Z[i]:=Round(Z[i]+W[j]*exp(-(Form62.TrackBar2.Position/1000)*power(ABS(i-j),(Form62.TrackBar1.Position/1000))));
end;

for i:=0 to length(Z)-1 do
Z[i]:=MaxIntValue(Y)-Z[i]+6;      // +7 для того чтобы нулевая линия огибающей не так далеко отходила вверх от оси абсцисс

for i:=0 to length(Z)-1 do
if Z[i]<MinIntValue(Y)-5 then Z[i]:=MinIntValue(Y)-10;




end;

with Form61.PaintBox1.Canvas do begin
for i:=Beg-10 to length(Z)+Beg-2-10 do begin
MoveTo(i,Z[i-Beg+10]);
LineTo(i+1,Z[i-Beg+11]);


If Form62.CheckBox4.Checked=True then begin    ///// Заливка

If Form62.Radiobutton1.Checked=True then begin
for n:=0 to (Form61.PaintBox1.Height-80)-Z[i-Beg+10]-10 do
Form61.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form62.ColorBox2.Selected;
end;

If Form62.Radiobutton2.Checked=True then begin
for n:=0 to (Form61.PaintBox1.Height-80)-Z[i-Beg+10] do
Form61.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form62.ColorBox2.Selected;
end;
end;  /// конец заливки
end;
end;
end;






procedure TForm61.FormCreate(Sender: TObject);
begin
Form61.DoubleBuffered:=True;
end;







procedure TForm61.PaintBox1Paint(Sender: TObject);
var a,b: string;
    n,m,i,j,bbb,tickx,ticky,dobavka: integer;
    nmr_all: array of integer; // весь спектр значений для рисования огибающей
    fr_tick,ir_tick,Head,str1,str2,str: string;
    dispropor: integer;
    shield,len_cy: integer;
    label 102,103;
begin
Lsh:=0;
nmr_all:=nil;
sh:=nil;
de:=nil;
with Form61.PaintBox1.Canvas do begin

case ColorToRGB(Form62.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;

MoveTo(60,60);                      // Oy
LineTo(60,Form61.PaintBox1.Height-80);
MoveTo(60,Form61.PaintBox1.Height-80);                      // Ox
LineTo(Form61.ClientWidth-30,Form61.PaintBox1.Height-80);
a:='Химический сдвиг, ppm';
b:= 'Сигнал, о.е.';
Font.Name:='Tahoma';
Font.Size:=11;
case ColorToRGB(Form62.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
TextOut(Form61.ClientWidth-60-Form61.PaintBox1.Canvas.TextWidth(a)-20,Form61.PaintBox1.Height-80+30,a);   // на 30 отступ оси Ох подписи
Font.Size:=11;
TextOut(60-Round(Form61.PaintBox1.Canvas.TextWidth(b)/2),60-20,b);   // на 20 отступ оси Оу подписи
Head:='ЯМР-спектр для системы '+Form58.ComboBox1.Text;
Font.Size:=13;
case ColorToRGB(Form62.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlue;
end;
TextOut(Round(Form61.ClientWidth/2)-Round(TextWidth(Head)/2),10,Head);   // на 20 отступ оси Оу подписи
Font.Size:=11;
Font.Color:=clBlack;
////////////// теперь  рисуем спектр



setlength(nmr_all,Form61.ClientWidth+2000);



if Form58.ComboBox2.Text='GIAO' then begin
for i:=0 to length(degener_giao)-1 do begin
if degener_giao[i]='' then FreeAndNil(degener_giao[i]);
end;
end;
if Form58.ComboBox2.Text='CSGT' then begin
for i:=0 to length(degener_csgt)-1 do begin
if degener_csgt[i]='' then FreeAndNil(degener_csgt[i]);
end;
end;
if Form58.ComboBox2.Text='IGAIM' then begin
for i:=0 to length(degener_igaim)-1 do begin
if degener_igaim[i]='' then FreeAndNil(degener_igaim[i]);
end;
end;
if Form58.ComboBox2.Text='Single Origin' then begin
for i:=0 to length(degener_so)-1 do begin
if degener_so[i]='' then FreeAndNil(degener_so[i]);
end;
end;




if Combobox1.ItemIndex=0 then begin /////////////////////////////////////////////////////////////////////////////////
if Form58.ComboBox2.Text='GIAO' then begin
SetLength(sh,length(degener_giao));
SetLength(sh1,length(degener_giao));
SetLength(de,length(degener_giao));
end;
if Form58.ComboBox2.Text='CSGT' then begin
SetLength(sh,length(degener_csgt));
SetLength(sh1,length(degener_giao));
SetLength(de,length(degener_csgt));
end;
if Form58.ComboBox2.Text='IGAIM' then begin
SetLength(sh,length(degener_igaim));
SetLength(sh1,length(degener_giao));
SetLength(de,length(degener_igaim));
end;
if Form58.ComboBox2.Text='Single Origin' then begin
SetLength(sh,length(degener_so));
SetLength(sh1,length(degener_giao));
SetLength(de,length(degener_so));
end;


if Form58.ComboBox2.Text='GIAO' then begin
for i:=0 to length(degener_giao)-1 do begin
sh[i]:=StrToFloat(Copy(degener_giao[i],1,pos('=',degener_giao[i])-1));
sh1[i]:=StrToFloat(Copy(degener_giao[i],1,pos('=',degener_giao[i])-1));
end;
end;
if Form58.ComboBox2.Text='CSGT' then begin
for i:=0 to length(degener_csgt)-1 do begin
sh[i]:=StrToFloat(Copy(degener_csgt[i],1,pos('=',degener_csgt[i])-1));
sh1[i]:=StrToFloat(Copy(degener_csgt[i],1,pos('=',degener_csgt[i])-1));
end;
end;
if Form58.ComboBox2.Text='IGAIM' then begin
for i:=0 to length(degener_igaim)-1 do
sh[i]:=StrToFloat(Copy(degener_igaim[i],1,pos('=',degener_igaim[i])-1));
sh1[i]:=StrToFloat(Copy(degener_igaim[i],1,pos('=',degener_igaim[i])-1));
end;
if Form58.ComboBox2.Text='Single Origin' then begin
for i:=0 to length(degener_so)-1 do  begin
sh[i]:=StrToFloat(Copy(degener_so[i],1,pos('=',degener_so[i])-1));
sh1[i]:=StrToFloat(Copy(degener_so[i],1,pos('=',degener_so[i])-1));
end;
end;

if Form58.ComboBox2.Text='GIAO' then begin
for i:=0 to length(degener_giao)-1 do
de[i]:=StrToFloat(Copy(degener_giao[i],pos('=',degener_giao[i])+1,length(degener_giao[i])));
end;
if Form58.ComboBox2.Text='CSGT' then begin
for i:=0 to length(degener_csgt)-1 do
de[i]:=StrToFloat(Copy(degener_csgt[i],pos('=',degener_csgt[i])+1,length(degener_csgt[i])));
end;
if Form58.ComboBox2.Text='IGAIM' then begin
for i:=0 to length(degener_igaim)-1 do
de[i]:=StrToFloat(Copy(degener_igaim[i],pos('=',degener_igaim[i])+1,length(degener_igaim[i])));
end;
if Form58.ComboBox2.Text='Single Origin' then begin
for i:=0 to length(degener_so)-1 do
de[i]:=StrToFloat(Copy(degener_so[i],pos('=',degener_so[i])+1,length(degener_so[i])));
end;
end         ////////////////////////////////////////////////////////////////////////////////////////////

else begin

if Form58.ComboBox2.Text='GIAO' then begin
for i:=0 to length(degener_compos_giao)-1 do begin
str1:=Copy(degener_compos_giao[i,0],pos('=',degener_compos_giao[i,0])+1,length(degener_compos_giao[i,0]));
str2:=Copy(str1,pos('=',str1)+1, length(str1));
if str2=Combobox1.Text then  begin
SetLength(sh,length(sh)+1);
SetLength(de,length(de)+1);
sh[length(sh)-1]:=StrToFloat(Copy(degener_giao[i],1,pos('=',degener_giao[i])-1));
de[length(de)-1]:=StrToFloat(Copy(degener_giao[i],pos('=',degener_giao[i])+1,length(degener_giao[i])));
end;
end;
end;

if Form58.ComboBox2.Text='CSGT' then begin
for i:=0 to length(degener_compos_csgt)-1 do begin
str1:=Copy(degener_compos_csgt[i,0],pos('=',degener_compos_csgt[i,0])+1,length(degener_compos_csgt[i,0]));
str2:=Copy(str1,pos('=',str1)+1, length(str1));
if str2=Combobox1.Text then begin
SetLength(sh,length(sh)+1);
SetLength(de,length(de)+1);
sh[length(sh)-1]:=StrToFloat(Copy(degener_csgt[i],1,pos('=',degener_csgt[i])-1));
de[length(de)-1]:=StrToFloat(Copy(degener_csgt[i],pos('=',degener_csgt[i])+1,length(degener_csgt[i])));
end;
end;
end;

if Form58.ComboBox2.Text='IGAIM' then begin
for i:=0 to length(degener_compos_igaim)-1 do begin
str1:=Copy(degener_compos_igaim[i,0],pos('=',degener_compos_igaim[i,0])+1,length(degener_compos_igaim[i,0]));
str2:=Copy(str1,pos('=',str1)+1, length(str1));
if str2=Combobox1.Text then  begin
SetLength(sh,length(sh)+1);
SetLength(de,length(de)+1);
sh[length(sh)-1]:=StrToFloat(Copy(degener_igaim[i],1,pos('=',degener_igaim[i])-1));
de[length(de)-1]:=StrToFloat(Copy(degener_igaim[i],pos('=',degener_igaim[i])+1,length(degener_igaim[i])));
end;
end;
end;

if Form58.ComboBox2.Text='Single Origin' then begin
for i:=0 to length(degener_compos_so)-1 do begin
str1:=Copy(degener_compos_so[i,0],pos('=',degener_compos_so[i,0])+1,length(degener_compos_so[i,0]));
str2:=Copy(str1,pos('=',str1)+1, length(str1));
if str2=Combobox1.Text then  begin
SetLength(sh,length(sh)+1);
SetLength(de,length(de)+1);
sh[length(sh)-1]:=StrToFloat(Copy(degener_so[i],1,pos('=',degener_so[i])-1));
de[length(de)-1]:=StrToFloat(Copy(degener_so[i],pos('=',degener_so[i])+1,length(degener_so[i])));
end;
end;
end;


end;














Ref:=StrToFloatDef(Edit1.Text,0.0);
if Ref<>0 then begin
SetLength(sh,length(sh)+1);
SetLength(de,length(de)+1);
sh[length(sh)-1]:=0.0;
de[length(de)-1]:=1.0;
for i:=0 to length(sh)-2 do
sh[i]:=Ref-sh[i];

SetLength(sh2,length(sh1));
for i:=0 to length(sh1)-1 do
sh2[i]:=Ref-sh1[i];

end;










////////////поиск наименьшего и наибольшего значения частоты
shield_min:=100000000;
shield_max:=-100000000;
for i:=0 to length(sh)-1 do begin
if shield_min>=sh[i] then shield_min:=sh[i];   // минимум
if shield_max<=sh[i] then shield_max:=sh[i];   // максимум
end;


if ZoomX1_nmr<>0 then shield_min:=ZoomX1_nmr;
if ZoomX2_nmr<>0 then shield_max:=ZoomX2_nmr;      //

////////////поиск наибольшего значения интенсивности
degener_max:=-1000000000;
for i:=0 to length(de)-1 do begin
if de[i]<>0 then begin
if degener_max<=de[i] then degener_max:=de[i];   // максимум
end;
end;


if (ZoomX1_nmr<>0) or (ZoomX2_nmr<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
degener_max:=-1000000000;
for i:=0 to length(de)-1 do begin
if (sh[i]>=shield_min) and (sh[i]<=shield_max) then begin
if degener_max<=de[i] then degener_max:=de[i];   // максимум
end;
end;
end;



////////////////отрисовка линий
Pen.Color:=Form62.ColorBox1.Selected;
Pen.Width:=strtoint(Form62.ComboBox1.Text);



for i:=0 to  length(sh)-1 do begin
if (sh[i]<shield_min-0.00001) or (sh[i]>shield_max+0.00001) then goto 102;
if Form62.CheckBox1.Checked=True then begin
if (Ref<>0) and (sh[i]=0) then begin
Pen.Color:=clGreen;
Pen.Width:=3;
end;
MoveTo( 60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)), Form61.PaintBox1.Height-80  );
LineTo( 60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)), Form61.PaintBox1.Height-80  -  Round((( Form61.PaintBox1.Height-60-20 - 60-20)*de[i])/ degener_max)  );
end;
if nmr_all[Round(((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)))+10]=0 then
nmr_all[Round(((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)))+10]:=   Round((( Form61.PaintBox1.Height-80-20 - 60-20)*de[i])/ degener_max )
else begin
if (nmr_all[Round(((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)))+10]<>0) and
   (nmr_all[Round(((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)))+10-1]=0) then
nmr_all[Round(((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)))+10-1]:=   Round((( Form61.PaintBox1.Height-80-20 - 60-20)*de[i])/ degener_max );
end;
102: end;





for i:=0 to length(nmr_all)-1  do begin
nmr_all[i]:= Form61.PaintBox1.Height-88-nmr_all[i];
end;

// теперь надо создать массив точек для прорисовки сплайна (огибающей)

if Form61.ClientWidth>120 then setlength(nmr_all,Form61.ClientWidth-140)
else setlength(nmr_all,Form61.ClientWidth-60);
//showmessage(inttostr(length(ir_all)));
Pen.Color:=Form62.ColorBox2.Selected;
Pen.Width:=strtoint(Form62.ComboBox2.Text);
if Form62.CheckBox2.Checked=True then  spline_nmr(nmr_all,80,rezhim_nmr);

case ColorToRGB(Form62.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
Pen.Width:=1;


//надо сделать шкалы значений по осям
for i:=0 to 9 do  begin
if (Round((Form61.ClientWidth-80-80)*0.1)+i)/10=Round((Round((Form61.ClientWidth-80-80)*0.1)+i)/10) then begin
tickx:=Round((Form61.ClientWidth-80-80)*0.1)+i;
Break;
end;
end;

ticky:=Round((Form61.PaintBox1.Height-80-80)*0.1);
for i:=0 to Round((Form61.ClientWidth-80-80)/Tickx) do  begin
MoveTo(80+i*tickx,Form61.PaintBox1.Height-80);
LineTo(80+i*tickx,Form61.PaintBox1.Height-80+9);                  // 9 - длина тика
Font.Size:=10;
case ColorToRGB(Form62.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
fr_tick:=floattostrf((shield_min+ i*Tickx*(shield_max-shield_min)/(Form61.ClientWidth-160)),ffFixed,4,1);
TextOut(80+i*tickx-Round(Canvas.TextWidth(fr_tick)/2),Form61.PaintBox1.Height-80+9+2,fr_tick);       // 2 -расстояние от тика до цифры
end;

//////Здесь по оси Y конкретные значения - 0.5, 1.0, 1.5, 2.0 ...   !!!!##$$$%%^^^&&&&*****
if degener_max<=8 then begin     // Это условие для того, что если много тиков - не рисовать промужуточные
for i:=0 to Round(2*degener_max) do  begin
if i/2=Round(i/2) then MoveTo(53,Form61.PaintBox1.Height-80 -  Round((( Form61.PaintBox1.Height-60-20 - 60-20)*(i/2))/ degener_max));
if i/2<>Round(i/2) then MoveTo(55,Form61.PaintBox1.Height-80 -  Round((( Form61.PaintBox1.Height-60-20 - 60-20)*(i/2))/ degener_max));
LineTo(60,Form61.PaintBox1.Height-80 -  Round((( Form61.PaintBox1.Height-60-20 - 60-20)*(i/2))/ degener_max));
ir_tick:=floattostrf((i/2),ffFixed,4,1);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form61.PaintBox1.Height-80 -  Round((( Form61.PaintBox1.Height-60-20 - 60-20)*(i/2))/ degener_max)-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);
end;
end;
if degener_max>8 then begin     // Это условие для того, что если много тиков - не рисовать промужуточные
for i:=0 to Round(degener_max) do  begin
MoveTo(53,Form61.PaintBox1.Height-80 -  Round((( Form61.PaintBox1.Height-60-20 - 60-20)*i)/ degener_max));
LineTo(60,Form61.PaintBox1.Height-80 -  Round((( Form61.PaintBox1.Height-60-20 - 60-20)*i)/ degener_max));
ir_tick:=floattostrf(i,ffFixed,4,1);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form61.PaintBox1.Height-80 -  Round((( Form61.PaintBox1.Height-60-20 - 60-20)*i)/ degener_max)-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);
end;
end;












{
for i:=0 to Round((Form61.PaintBox1.Height-80-80)/Ticky) do  begin
MoveTo(51,Form61.PaintBox1.Height-80-i*Ticky);
LineTo(60,Form61.PaintBox1.Height-80-i*Ticky);
ir_tick:=floattostrf(((0+ i*Ticky*degener_max)/(Form61.PaintBox1.Height-170)),ffFixed,6,3);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form61.PaintBox1.Height-80-i*ticky-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);       // 2 -расстояние от тика до цифры
end;
}


//микротики (тики между основными тиками)
//микротик - 1/10 тика
for j:=0 to Round((Form61.ClientWidth-80-80)/Tickx)-1 do  begin
dobavka:=0;
for i:=1 to 9 do  begin
dispropor:=tickx-10*Round(Tickx/10);
MoveTo(80+i*Round(Tickx/10)+j*Tickx,Form61.PaintBox1.Height-80);


if i<>5 then begin
LineTo(80+i*Round(Tickx/10)+j*Tickx,Form61.PaintBox1.Height-80+5);
end
else  begin
LineTo(80+i*Round(Tickx/10)+j*Tickx,Form61.PaintBox1.Height-80+7);
end;
end;
end;

{



for j:=0 to Round((Form61.PaintBox1.Height-80-80)/Ticky)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(60,Form61.PaintBox1.Height-80-j*Ticky-i*Round(Ticky/10));
if i<>5 then LineTo(55,Form61.PaintBox1.Height-80-j*Ticky-i*Round(Ticky/10))
else LineTo(53,Form61.PaintBox1.Height-80-j*Ticky-i*Round(Ticky/10))
end;
end;
}

//теперь идентификация пиков  - цифровая разметка  ,  ir_inten[i]>=0.8*ir_inten_max - условие того, что отмечаются пики на высоте 80 % от максимума и выше
if Form62.CheckBox3.Checked=True then begin

Font.Size:=strtoint(Form62.ComboBox3.Text);
Font.Color:=Form62.ColorBox4.Selected;


for i:=0 to length(sh)-1 do begin
if (de[i]<>0) and (sh[i]<>0) then begin
if  de[i]>=0.01*strtoint(Form62.ComboBox4.Text)*degener_max  then TextOut(60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)) - Round(TextWidth(floattostrf(sh[i],ffFixed,8,2))/2), Form61.PaintBox1.Height-80  -  Round(( Form61.PaintBox1.Height-60-20 - 60-20)*de[i]/ degener_max )-15, floattostrf(sh[i],ffFixed,4,1));
end
else begin
if Ref<>0 then begin
Font.Style:=[fsBold];
Font.Color:=clGreen;
TextOut(60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh[i]-shield_min)/ (shield_max-shield_min)) - Round(TextWidth(floattostrf(sh[i],ffFixed,8,2))/2), Form61.PaintBox1.Height-80  -  Round(( Form61.PaintBox1.Height-60-20 - 60-20)*de[i]/ degener_max )-15, 'Ref');
Canvas.Font.Style:=[];
end;
end;
end;
end;


end;



if Assigned(BMP_nmr)=false then BMP_nmr := TBitmap.Create;
BMP_nmr.Height:=PaintBox1.ClientHeight;
BMP_nmr.Width:=PaintBox1.ClientWidth;


BMP_nmr.Canvas.CopyRect(Rect(0,0,BMP_nmr.Width,BMP_nmr.Height),PaintBox1.Canvas,PaintBox1.ClientRect);

if sh[length(sh)-1]=0 then SetLength(sh,length(sh)-1);

end;  // конец with Form25.PaintBox1.Canvas do begin


procedure TForm61.N1Click(Sender: TObject);
begin
Form62.Show;
end;

procedure TForm61.N2Click(Sender: TObject);
var a: widestring;
i: integer;
begin
if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
BMP_nmr.SaveToFile(a);
end;
FreeAndNil(BMP_nmr);
SaveDialog1.FreeOnRelease;
end;

procedure TForm61.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Xstart_nmr:=X;
Ystart_nmr:=Y;
R_nmr.TopLeft := Point(X, Y);
R_nmr.BottomRight := Point(X, Y);
Form61.PaintBox1.Canvas.DrawFocusRect(R_nmr);
if (Button=mbLeft) then press_nmr:=true;
end;

procedure TForm61.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var n,i: integer;
begin
PaintBox1.Cursor:=crDefault;
if length(sh1)>1 then begin
if ref=0 then begin
for Pn_line:=0 to length(sh1)-1 do
if (X<=60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh1[Pn_line]-shield_min)/ (shield_max-shield_min))+1)  and
   (X>=60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh1[Pn_line]-shield_min)/ (shield_max-shield_min))-1)
    then begin
    PaintBox1.Cursor:=crHandPoint;
    Break;
    end;
end
else begin

for Pn_line:=0 to length(sh2)-1 do
if (X<=60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh2[Pn_line]-shield_min)/ (shield_max-shield_min))+1)  and
   (X>=60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh2[Pn_line]-shield_min)/ (shield_max-shield_min))-1)
    then begin
    PaintBox1.Cursor:=crHandPoint;
    Break;
    end;

end;
end;
if length(sh)=1 then begin
if Ref<>0 then begin
if Ref<Ref-sh[0]  then if (X>78) and (X<82) then PaintBox1.Cursor:=crHandPoint;
if Ref>=Ref-sh[0] then if (X>PaintBox1.Width-82) and (X<PaintBox1.Width-78) then PaintBox1.Cursor:=crHandPoint;
for i:=0 to length(sh1)-1 do
if abs(sh1[i]-(Ref-sh[0]))<0.0001 then Break;
Pn_line:=i;
end
else begin
if (X>78) and (X<82) then PaintBox1.Cursor:=crHandPoint;
for i:=0 to length(sh1)-1 do
if sh1[i]=sh[0] then Break;
Pn_line:=i;
end;
end;






with Form61.PaintBox1.Canvas do  begin
if press_nmr=true then begin
DrawFocusRect(R_nmr);
if Xstart_nmr < X then
begin
  R_nmr.Left := Xstart_nmr;
  R_nmr.Right := X;
end
else
begin
  R_nmr.Left := X;
  R_nmr.Right := Xstart_nmr;
end; // R.Top<R.Buttom
if Ystart_nmr < Y then
begin
  R_nmr.Top := Ystart_nmr;
  R_nmr.Bottom := Y
end
else
begin
  R_nmr.Top := Y;
  R_nmr.Bottom := Ystart_nmr
end;

DrawFocusRect(R_nmr);

end;
end;
Form61.StatusBar1.Panels[0].Text:='Shielding = '+  floattostrf(shield_max - (Form61.ClientWidth-80-X)*(shield_max-shield_min)/(Form61.ClientWidth-60-20-60-20),ffFixed,4,1) +'   Degeneracy = ' + floattostrf(0 +(Form61.PaintBox1.Height-80-Y)*degener_max/(Form61.PaintBox1.Height-60-60-40),ffFixed,4,1);
end;

procedure TForm61.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
press_nmr:=false;
if (abs(Ystart_nmr-Y)>4) and (abs(Xstart_nmr-X)>4) then begin

if X>Xstart_nmr then begin ZoomX1_nmr:= shield_min + (Xstart_nmr-80)*(shield_max-shield_min)/(Form61.ClientWidth-60-20-60-20);
                       ZoomX2_nmr:=  shield_max - (Form61.ClientWidth-80-X)*(shield_max-shield_min)/(Form61.ClientWidth-60-20-60-20);
                 end
            else begin
                       ZoomX1_nmr:=  shield_min + (X-80)*(shield_max-shield_min)/(Form61.ClientWidth-60-20-60-20);
                       ZoomX2_nmr:=  shield_max - (Form61.ClientWidth-80-Xstart_nmr)*(shield_max-shield_min)/(Form61.ClientWidth-60-20-60-20);
                 end;

end;
Form61.PaintBox1.Invalidate;
end;

procedure TForm61.PaintBox1DblClick(Sender: TObject);
begin
ZoomX1_nmr:=0;
ZoomX2_nmr:=0;
Form61.PaintBox1.Invalidate;
end;



procedure TForm61.Edit1Change(Sender: TObject);
begin
PaintBox1.Invalidate;
end;






procedure TForm61.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9','.','-': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

procedure TForm61.FormShow(Sender: TObject);
var ch: boolean;
i,j: integer;
begin
ch:=false;
Combobox1.Clear;
if dial=true then begin
Combobox1.Items.Add('Все');
Combobox1.Items.Add(atomoutel[1,1]);
for i:=2 to nomer_atoma do begin
ch:=false;
for j:=0 to Combobox1.Items.Count-1 do
if atomoutel[1,i]=Combobox1.Items[j] then ch:=true;
if ch=false then Combobox1.Items.Add(atomoutel[1,i]);
end;
end
else begin
Combobox1.Items.Add('Все');
Combobox1.Items.Add(atomoutel_mult[basket[Form58.ComboBox1.ItemIndex],1,1]);
for i:=2 to nomer_atoma_mult[basket[Form58.ComboBox1.ItemIndex]] do begin
ch:=false;
for j:=0 to Combobox1.Items.Count-1 do
if atomoutel_mult[basket[Form58.ComboBox1.ItemIndex],1,i]=Combobox1.Items[j] then ch:=true;
if ch=false then Combobox1.Items.Add(atomoutel_mult[basket[Form58.ComboBox1.ItemIndex],1,i]);
end;



end;

Combobox1.ItemIndex:=0;
sh1:=nil;
sh2:=nil;


end;

procedure TForm61.ComboBox1Change(Sender: TObject);
begin
PaintBox1.Invalidate;
end;

procedure TForm61.PaintBox1Click(Sender: TObject);
var pt: TPoint;
lbx1: TLabel;
i,j,n,m: integer;
str,str1,str2: string;
dc: array of array of string;
begin
dc:=nil;
el_dc:=nil;
val_dc:=nil;
if Form61.FindComponent('Lbx1')<>nil then begin
Form61.FindComponent('Lbx1').Free;
lbx1:=nil;
end;


//GetCursorPos(pt);
//pt := ScreenToClient(pt);
//for n:=0 to length(sh)-1 do
//if pt.X=60+20+ Round((Form61.ClientWidth-60-20-60-20)*(sh[n]-shield_min)/ (shield_max-shield_min)) then begin
if PaintBox1.Cursor=crHandPoint then begin
if lbx1=nil then lbx1:=Tlabel.Create(self);
lbx1.Parent:=Panel1;
lbx1.Name:='Lbx1';
lbx1.Font.Color:=clPurple;
lbx1.Font.Size:=9;
lbx1.Top:=Label2.Top;
lbx1.Font.Name:='Arial';
lbx1.Left:=Label2.Left+label2.Width+25;
lbx1.Visible:=True;

//if lbx2=nil then lbx2:=Tlabel.Create(self);
//lbx2.Parent:=Panel1;
//lbx2.Name:='Lbx2';
//lbx2.Font.Color:=clFuchsia;
//lbx2.Font.Size:=8;
//lbx1.Font.Name:='Courier New';
//lbx2.Top:=Label2.Top+10;
//lbx2.Left:=Label2.Left+label2.Width+20;
//lbx2.Visible:=True;

if Form58.ComboBox2.Text='GIAO' then  begin
SetLength(dc,length(degener_compos_giao),length(degener_compos_giao[0]));
for i:=0 to length(degener_compos_giao)-1 do
for j:=0 to length(degener_compos_giao[0])-1 do
dc[i,j]:=degener_compos_giao[i,j];
end;
if Form58.ComboBox2.Text='CSGT' then  begin
SetLength(dc,length(degener_compos_csgt),length(degener_compos_csgt[0]));
for i:=0 to length(degener_compos_csgt)-1 do
for j:=0 to length(degener_compos_csgt[0])-1 do
dc[i,j]:=degener_compos_csgt[i,j];
end;
if Form58.ComboBox2.Text='IGAIM' then  begin
SetLength(dc,length(degener_compos_igaim),length(degener_compos_igaim[0]));
for i:=0 to length(degener_compos_igaim)-1 do
for j:=0 to length(degener_compos_igaim[0])-1 do
dc[i,j]:=degener_compos_igaim[i,j];
end;
if Form58.ComboBox2.Text='Single Origin' then  begin
SetLength(dc,length(degener_compos_so),length(degener_compos_so[0]));
for i:=0 to length(degener_compos_so)-1 do
for j:=0 to length(degener_compos_so[0])-1 do
dc[i,j]:=degener_compos_so[i,j];
end;


lbx1.Caption:='';
//lbx2.Caption:='';
if Pn_line>=length(dc) then Pn_line:=Pn_line-1;

//if Combobox1.ItemIndex=1 then begin
for m:=0 to length(dc[Pn_line])-1 do  begin
str:=Copy(dc[Pn_line,m],pos('=',dc[Pn_line,m])+1,length(dc[Pn_line,m]));
str1:=Copy(str,1,pos('=',str)-1);
str2:=Copy(str,pos('=',str)+1, length(str));

if m=0 then lbx1.Caption:=lbx1.Caption+str1+'-'+str2;
if (m>0) and (dc[Pn_line,m]<>'') then lbx1.Caption:=lbx1.Caption+'<<'+str1+'-'+str2 ;
lbx1.Visible:=True;

SetLength(el_dc,length(el_dc)+1);
SetLength(val_dc,length(val_dc)+1);
el_dc[length(el_dc)-1]:=str1+'-'+str2;
val_dc[length(val_dc)-1]:=Copy(dc[Pn_line,m],1,pos('=',dc[Pn_line,m])-1);


//if m=0 then lbx2.Caption:=lbx2.Caption+Copy(dc[Pn_line,m],1,pos('=',dc[Pn_line,m])-1);
//if (m>0) and (dc[Pn_line,m]<>'') then lbx2.Caption:=lbx2.Caption+' << '+Copy(dc[Pn_line,m],1,pos('=',dc[Pn_line,m])-1);
//lbx1.Visible:=True;

end;
//end;




















Form63.Show;
end;
end;



end.
