unit Unit33;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls;

type
  TForm33 = class(TForm)
    PaintBox1: TPaintBox;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form33: TForm33;
  rezhim_vcd: string='LIN';
  Xstart_vcd,Ystart_vcd: integer;
  press_vcd: boolean=false;
  R_vcd: TRect;
  ZoomX1_vcd,ZoomX2_vcd,ZoomY1_vcd,ZoomY2_vcd: real;
  freq_min_vcd,freq_max_vcd,vcd_inten_max,vcd_inten_min: real;
  BMP4: TBitmap;

implementation

uses Unit25, Unit26, Unit24, Unit34, Unit1;

{$R *.dfm}



procedure spline_freq(Y: array of integer; Beg: integer; S: String);
var i,n: integer;
    Z: array of integer;
begin
Z:=nil;
setlength(Z,length(Y));
Z[0]:=Round((Y[0]+Y[1])/2);
for i:=1 to  length(Y)-2 do  begin
if UpperCase(S)='LIN' then

Z[i]:=Round((Z[i-1]+Y[i]+Y[i+1])/3);

end;
Z[length(Y)-1]:=Round((Z[length(Y)-2]+Y[length(Y)-1])/2);
with Form33.PaintBox1.Canvas do begin
for i:=Beg-10 to length(Z)+Beg-2-10 do begin
MoveTo(i,Z[i-Beg+10]);
LineTo(i+1,Z[i-Beg+11]);



end;
end;
end;










procedure TForm33.PaintBox1Paint(Sender: TObject);
var a,b: string;
    n,m,i,j,bbb,tickx,ticky: integer;
    ir_all: array of integer; // весь спектр значений для рисования огибающей
    fr_tick,ir_tick,Head: string;
    label 102,103;
begin
ir_all:=nil;
with Form33.PaintBox1.Canvas do begin

case ColorToRGB(Form34.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;

MoveTo(60,60);                      // Oy
LineTo(60,Form33.ClientHeight-80);
MoveTo(60,Form33.ClientHeight-80);                      // Ox
LineTo(Form33.ClientWidth-60,Form33.ClientHeight-80);
a:='Частота, см';
b:= 'D, 10   а.е.  см';
Font.Name:='Tahoma';
Font.Size:=11;
case ColorToRGB(Form34.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
TextOut(Form33.ClientWidth-60-Form33.PaintBox1.Canvas.TextWidth(a)-20,Form33.ClientHeight-80+30,a);   // на 30 отступ оси Ох подписи
Font.Size:=8;
TextOut(Form33.ClientWidth-60-20,Form33.ClientHeight-80+27,'-1');
TextOut(60-Round(Form33.PaintBox1.Canvas.TextWidth(b)/2)+Form33.PaintBox1.Canvas.TextWidth('D, 10')-11,60-31,'-44');
TextOut(60-Round(Form33.PaintBox1.Canvas.TextWidth(b)/2)+Form33.PaintBox1.Canvas.TextWidth('D, 10   а.е.')+3,60-32,'2');
TextOut(60-Round(Form33.PaintBox1.Canvas.TextWidth(b)/2)+Form33.PaintBox1.Canvas.TextWidth('D, 10   а.е.  см')+16,60-31,'2');
Font.Size:=11;
TextOut(60-Round(Form33.PaintBox1.Canvas.TextWidth(b)/2),60-21,b);   // на 20 отступ оси Оу подписи
Head:='Спектр колебательного кругового дихроизма для системы '+Form24.ComboBox1.Text;
Font.Size:=13;
case ColorToRGB(Form34.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlue;
end;
TextOut(Round(Form33.ClientWidth/2)-Round(TextWidth(Head)/2),8,Head);   // на 20 отступ оси Оу подписи
Font.Size:=11;
Font.Color:=clBlack;
////////////// теперь  рисуем спектр



setlength(ir_all,Form33.ClientWidth+2000);

for i:=0 to length(freq)-1 do begin
if freq[i]='' then FreeAndNil(Freq[i]);
if rot_str[i]='' then FreeAndNil(rot_str[i]);
end;




if dial=true then begin

////////////поиск наименьшего и наибольшего значения частоты
freq_min_vcd:=100000000;
freq_max_vcd:=-100000000;
for i:=0 to length(freq)-1 do begin
if freq[i]<>'' then begin
if freq_min_vcd>=strtofloat(freq[i]) then freq_min_vcd:=strtofloat(freq[i]);   // минимум
if freq_max_vcd<=strtofloat(freq[i]) then freq_max_vcd:=strtofloat(freq[i]);   // максимум
end;
end;

if ZoomX1_vcd<>0 then freq_min_vcd:=ZoomX1_vcd;
if ZoomX2_vcd<>0 then freq_max_vcd:=ZoomX2_vcd;


////////////поиск наибольшего значения интенсивности
vcd_inten_min:=100000000;
vcd_inten_max:=-1000000000;
for i:=0 to length(rot_str)-1 do begin
if rot_str[i]<>'' then begin
if vcd_inten_min>=strtofloat(rot_str[i]) then vcd_inten_min:=strtofloat(rot_str[i]);   // максимум
if vcd_inten_max<=strtofloat(rot_str[i]) then vcd_inten_max:=strtofloat(rot_str[i]);   // максимум
end;
end;


if (ZoomX1_vcd<>0) or (ZoomX2_vcd<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
vcd_inten_max:=-1000000000;
for i:=0 to length(rot_str)-1 do begin
if (strtofloat(freq[i])>=freq_min_vcd) and (strtofloat(freq[i])<=freq_max_vcd) then begin
if vcd_inten_max<=strtofloat(rot_str[i]) then vcd_inten_max:=strtofloat(rot_str[i]);   // максимум
end;
end;
end;



////////////////отрисовка линий
Pen.Color:=Form34.ColorBox1.Selected;
Pen.Width:=strtoint(Form34.ComboBox1.Text);



for i:=0 to  length(freq)-1 do begin
if (strtofloat(freq[i])<freq_min_vcd-0.00001) or (strtofloat(freq[i])>freq_max_vcd+0.00001) then goto 102;
if Form34.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd)), Form33.ClientHeight-80  -  Round(( Form33.ClientHeight-60-20 - 60-20)*(0-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) ));
LineTo( 60+20+ Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd)), Form33.ClientHeight-80  -  Round(( Form33.ClientHeight-60-20 - 60-20)*(strtofloat(rot_str[i])-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) ) );
end;
ir_all[Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd))+10]:=   Round(( Form33.ClientHeight-80-20 - 60-20)*(strtofloat(rot_str[i])-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) ) -Round(( Form33.ClientHeight-60-20 - 60-20)*(0-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) ) ;
102: end;



end   // конец if dial=true then begin


else begin    // если открыт диалог нескольких файлов

//надо убрать элементы '' для того, чтобы все работало
for  i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_mult[basket[Form24.ComboBox1.ItemIndex],i]='' then begin
setlength(freq_mult[basket[Form24.ComboBox1.ItemIndex]],i);
setlength(rot_str_mult[basket[Form24.ComboBox1.ItemIndex]],i);
break;
end;
end;
ch_mult[basket[Form24.Combobox1.ItemIndex]]:=i;
///////////////////////////////////////////////////////





freq_min_vcd:=100000000;
freq_max_vcd:=-100000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_min_vcd>=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_min_vcd:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // минимум
if freq_max_vcd<=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_max_vcd:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;

if ZoomX1_vcd<>0 then freq_min_vcd:=ZoomX1_vcd;
if ZoomX2_vcd<>0 then freq_max_vcd:=ZoomX2_vcd;

////////////поиск наибольшего значения интенсивности
vcd_inten_min:=100000000;
vcd_inten_max:=-1000000000;
if rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'' then begin
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if vcd_inten_min>=strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]) then vcd_inten_min:=strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
if vcd_inten_max<=strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]) then vcd_inten_max:=strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;
end;




if (ZoomX1_vcd<>0) or (ZoomX2_vcd<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
vcd_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>=freq_min_vcd) and (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<=freq_max_vcd) then begin
if vcd_inten_max<=strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]) then vcd_inten_max:=strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;
end;
end;



//   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pen.Color:=Form34.ColorBox1.Selected;
Pen.Width:=strtoint(Form34.ComboBox1.Text);

////////////////отрисовка линий
for i:=0 to  ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<freq_min_vcd-0.00001) or (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>freq_max_vcd+0.00001) then goto 103;
if Form34.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd)), Form33.ClientHeight-80 - Round(( Form33.ClientHeight-60-20 - 60-20)*(0-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) ) );
LineTo( 60+20+ Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd)), Form33.ClientHeight-80  -  Round(( Form33.ClientHeight-60-20 - 60-20)*(strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i])-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) ) );
end;
ir_all[Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd))+10]:=   Round(( Form33.ClientHeight-60-20 - 60-20)*(strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i])-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) )  -  Round(( Form33.ClientHeight-60-20 - 60-20)*(0-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) );
103: end;



end;  // конец открытия диалога нескольких файлов




//нуль-линия
if  Form34.CheckBox5.Checked=true then begin
if Form34.ComboBoxEx1.ItemIndex=0 then Pen.Style:=psSolid;
if Form34.ComboBoxEx1.ItemIndex=1 then Pen.Style:=psDash;
if Form34.ComboBoxEx1.ItemIndex=2 then Pen.Style:=psDot;
Pen.Width:=strtoint(Form34.ComboBox5.Text);
Pen.Color:=Form34.ColorBox5.Selected;
MoveTo( 60, Form33.ClientHeight-80 - Round(( Form33.ClientHeight-60-20 - 60-20)*(0-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) ) );
LineTo( Form33.ClientWidth-70, Form33.ClientHeight-80 - Round(( Form33.ClientHeight-60-20 - 60-20)*(0-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) ) );
end;

Pen.Width:=1;
Pen.Color:=clBlack;
Pen.Style:=psSolid;










for i:=0 to length(ir_all)-1  do begin
ir_all[i]:= Form33.ClientHeight-80-  Round(( Form33.ClientHeight-60-20 - 60-20)*(0-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) )-ir_all[i];
end;

// теперь надо создать массив точек для прорисовки сплайна (огибающей)

if Form33.ClientWidth>120 then setlength(ir_all,Form33.ClientWidth-140)
else setlength(ir_all,Form33.ClientWidth-60);
//showmessage(inttostr(length(ir_all)));
Pen.Color:=Form34.ColorBox2.Selected;
Pen.Width:=strtoint(Form34.ComboBox2.Text);
if Form34.CheckBox2.Checked=True then  spline_freq(ir_all,80,rezhim_vcd);

case ColorToRGB(Form34.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
Pen.Width:=1;


//надо сделать шкалы значений по осям
tickx:=Round((Form33.ClientWidth-80-80)*0.1);
ticky:=Round((Form33.ClientHeight-80-80)*0.1);
for i:=0 to Round((Form33.ClientWidth-80-80)/Tickx) do  begin
MoveTo(80+i*tickx,Form33.ClientHeight-80);
LineTo(80+i*tickx,Form33.ClientHeight-80+9);                  // 9 - длина тика
Font.Size:=10;
case ColorToRGB(Form34.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
fr_tick:=floattostrf((freq_min_vcd+ i*Tickx*(freq_max_vcd-freq_min_vcd)/(Form33.ClientWidth-160)),ffFixed,4,1);
TextOut(80+i*tickx-Round(Canvas.TextWidth(fr_tick)/2),Form33.ClientHeight-80+9+2,fr_tick);       // 2 -расстояние от тика до цифры
end;
for i:=0 to Round((Form33.ClientHeight-80-80)/Ticky) do  begin
MoveTo(51,Form33.ClientHeight-80-i*Ticky);
LineTo(60,Form33.ClientHeight-80-i*Ticky);
ir_tick:=floattostrf((vcd_inten_min+ (i*Ticky*(vcd_inten_max-vcd_inten_min))/(Form33.ClientHeight-160)),ffFixed,4,1);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form33.ClientHeight-80-i*ticky-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);       // 2 -расстояние от тика до цифры
end;

//микротики (тики между основными тиками)
//микротик - 1/10 тика
for j:=0 to Round((Form33.ClientWidth-80-80)/Tickx)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(80+i*Round(Tickx/10)+j*Tickx,Form33.ClientHeight-80);
if i<>5 then LineTo(80+i*Round(Tickx/10)+j*Tickx,Form33.ClientHeight-80+5)
else LineTo(80+i*Round(Tickx/10)+j*Tickx,Form33.ClientHeight-80+7)
end;
end;

for j:=0 to Round((Form33.ClientHeight-80-80)/Ticky)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(60,Form33.ClientHeight-80-j*Ticky-i*Round(Ticky/10));
if i<>5 then LineTo(55,Form33.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
else LineTo(53,Form33.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
end;
end;


//теперь идентификация пиков  - цифровая разметка  ,  ir_inten[i]>=0.8*ir_inten_max - условие того, что отмечаются пики на высоте 80 % от максимума и выше
if Form34.CheckBox3.Checked=True then begin

Font.Size:=strtoint(Form34.ComboBox3.Text);
Font.Color:=Form34.ColorBox4.Selected;
if dial=true then begin
for i:=0 to length(freq)-1 do
if  abs(strtofloat(rot_str[i]))>=0.01*strtoint(Form34.ComboBox4.Text)*vcd_inten_max then begin
if strtofloat(rot_str[i])>=0 then TextOut(60+20+ Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd)) - Round(TextWidth(floattostrf(strtofloat(freq[i]),ffFixed,4,1))/2), Form33.ClientHeight-80  -  Round(( Form33.ClientHeight-60-20 - 60-20)*(strtofloat(rot_str[i])-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) )-15, floattostrf(strtofloat(freq[i]),ffFixed,4,1))
else  TextOut(60+20+ Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd)) - Round(TextWidth(floattostrf(strtofloat(freq[i]),ffFixed,4,1))/2), Form33.ClientHeight-80  -  Round(( Form33.ClientHeight-60-20 - 60-20)*(strtofloat(rot_str[i])-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) )+4, floattostrf(strtofloat(freq[i]),ffFixed,4,1));
end;
end
else begin
for i:=0 to length(freq_mult[basket[Form24.ComboBox1.ItemIndex]])-1 do begin
if (rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') and  (freq_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') then begin
if  abs(strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i]))>=0.01*strtoint(Form34.ComboBox4.Text)*vcd_inten_max then begin
if  strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i])>=0 then TextOut(60+20+ Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd)) - Round(TextWidth(floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1))/2), Form33.ClientHeight-80  -  Round(( Form33.ClientHeight-60-20 - 60-20)*(strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i])-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) )-15, floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1))
else  TextOut(60+20+ Round((Form33.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_vcd)/ (freq_max_vcd-freq_min_vcd)) - Round(TextWidth(floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1))/2), Form33.ClientHeight-80  -  Round(( Form33.ClientHeight-60-20 - 60-20)*(strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i])-vcd_inten_min)/ (vcd_inten_max-vcd_inten_min) )+4, floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1));
end;
end;
end;
end;


end;

//Прорисовка нуль-линии
//MoveTo(60,Form33.ClientHeight-80  -  Round(( Form33.ClientHeight-60-20 - 60-20)*strtofloat(rot_str_mult[basket[Form24.ComboBox1.ItemIndex],i])/ vcd_inten_max ));
//LineTo(60,Form33.ClientHeight-80-j*Ticky-i*Round(Ticky/10));





//ZoomX1:=0;
//ZoomX2:=0;


//Заливка цветом из настроек под огибающей
//Form25.PaintBox1.Canvas.FloodFill();

if Assigned(BMP4)=false then BMP4 := TBitmap.Create;
BMP4.Height:=PaintBox1.ClientHeight;
BMP4.Width:=PaintBox1.ClientWidth;


BMP4.Canvas.CopyRect(Rect(0,0,BMP4.Width,BMP4.Height),PaintBox1.Canvas,PaintBox1.ClientRect);


end;  // конец with Form25.PaintBox1.Canvas do begin

end;

procedure TForm33.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
with Form33.PaintBox1.Canvas do  begin
if press_vcd=true then begin
DrawFocusRect(R_vcd);
if Xstart_vcd < X then
begin
  R_vcd.Left := Xstart_vcd;
  R_vcd.Right := X;
end
else
begin
  R_vcd.Left := X;
  R_vcd.Right := Xstart_vcd;
end; // R.Top<R.Buttom
if Ystart_vcd < Y then
begin
  R_vcd.Top := Ystart_vcd;
  R_vcd.Bottom := Y
end
else
begin
  R_vcd.Top := Y;
  R_vcd.Bottom := Ystart_vcd;
end;

DrawFocusRect(R_vcd);

end;
end;
Form33.StatusBar1.Panels[0].Text:='Freq = '+  floattostrf(freq_max_vcd - (Form33.ClientWidth-80-X)*(freq_max_vcd-freq_min_vcd)/(Form33.ClientWidth-60-20-60-20),ffFixed,4,1) +'   Rot. str. = ' + floattostrf(vcd_inten_min +(Form33.ClientHeight-80-Y)*(vcd_inten_max-vcd_inten_min)/(Form33.ClientHeight-60-60-40),ffFixed,4,1);
end;

procedure TForm33.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Xstart_vcd:=X;
Ystart_vcd:=Y;
R_vcd.TopLeft := Point(X, Y);
R_vcd.BottomRight := Point(X, Y);
Form33.PaintBox1.Canvas.DrawFocusRect(R_vcd);
if (Button=mbLeft) then press_vcd:=true;
end;

procedure TForm33.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
press_vcd:=false;
if (abs(Ystart_vcd-Y)>4) and (abs(Xstart_vcd-X)>4) then begin

if X>Xstart_vcd then begin ZoomX1_vcd:= freq_min_vcd + (Xstart_vcd-80)*(freq_max_vcd-freq_min_vcd)/(Form33.ClientWidth-60-20-60-20);
                       ZoomX2_vcd:=  freq_max_vcd - (Form33.ClientWidth-80-X)*(freq_max_vcd-freq_min_vcd)/(Form33.ClientWidth-60-20-60-20);
                 end
            else begin
                       ZoomX1_vcd:=  freq_min_vcd + (X-80)*(freq_max_vcd-freq_min_vcd)/(Form33.ClientWidth-60-20-60-20);
                       ZoomX2_vcd:=  freq_max_vcd - (Form33.ClientWidth-80-Xstart_vcd)*(freq_max_vcd-freq_min_vcd)/(Form33.ClientWidth-60-20-60-20);
                 end;



end;  //  if (Ystart-Y>4) and (Xstart-X>4) then begin
Invalidate;
end;

procedure TForm33.PaintBox1DblClick(Sender: TObject);
begin
ZoomX1_vcd:=0;
ZoomX2_vcd:=0;
Invalidate;
end;

procedure TForm33.N2Click(Sender: TObject);
var a: widestring;
i: integer;
begin
if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
BMP4.SaveToFile(a);
end;
FreeAndNil(BMP4);
SaveDialog1.FreeOnRelease;

end;

procedure TForm33.N1Click(Sender: TObject);
begin
Form34.Show;
end;

end.
