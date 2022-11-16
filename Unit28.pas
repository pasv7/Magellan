unit Unit28;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls;

type
  TForm28 = class(TForm)
    PaintBox1: TPaintBox;
    StatusBar1: TStatusBar;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    N0: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N0Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;
  rezhim_p: string='LIN';
  Xstart_P,Ystart_P: integer;
  press_P: boolean=false;
  R_P: TRect;
  ZoomX1_P,ZoomX2_P,ZoomY1_P,ZoomY2_P: real;
  freq_min_P,freq_max_P,p_inten_max: real;
  BMP2: TBitMap;

implementation

uses Unit24, Unit1, Unit31;

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
with Form28.PaintBox1.Canvas do begin
for i:=Beg-10 to length(Z)+Beg-2-10 do begin
MoveTo(i,Z[i-Beg+10]);
LineTo(i+1,Z[i-Beg+11]);


If Form31.CheckBox4.Checked=True then begin    ///// Заливка

If Form31.Radiobutton1.Checked=True then begin
for n:=0 to (Form28.ClientHeight-80)-Z[i-Beg+10]-10 do
Form28.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form31.ColorBox2.Selected;
end;

If Form31.Radiobutton2.Checked=True then begin
for n:=0 to (Form28.ClientHeight-80)-Z[i-Beg+10] do
Form28.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form31.ColorBox2.Selected;
end;

end;  /// конец заливки



end;


end;

end;
















procedure TForm28.FormCreate(Sender: TObject);
begin
Form28.DoubleBuffered:=True;
end;

procedure TForm28.PaintBox1Paint(Sender: TObject);
var a,b: string;
    n,m,i,j,bbb,tickx,ticky: integer;
    ir_all: array of integer; // весь спектр значений для рисования огибающей
    fr_tick,ir_tick,Head: string;
    label 102,103;
begin
ir_all:=nil;
with Form28.PaintBox1.Canvas do begin
case ColorToRGB(Form31.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
MoveTo(60,60);                      // Oy
LineTo(60,Form28.ClientHeight-80);
MoveTo(60,Form28.ClientHeight-80);                      // Ox
LineTo(Form28.ClientWidth-60,Form28.ClientHeight-80);
a:='Частота, см';
b:= 'Р-деполяризация, о.е.';
Font.Name:='Tahoma';
Font.Size:=11;
case ColorToRGB(Form31.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
TextOut(Form28.ClientWidth-60-Form28.PaintBox1.Canvas.TextWidth(a)-20,Form28.ClientHeight-80+30,a);   // на 30 отступ оси Ох подписи
Font.Size:=8;
TextOut(Form28.ClientWidth-60-20,Form28.ClientHeight-80+27,'-1');
Font.Size:=11;
TextOut(60-Round(Form28.PaintBox1.Canvas.TextWidth(b)/2)+30,60-20,b);   // на 20 отступ оси Оу подписи
Head:='Спектр Р-деполяризации для системы '+Form24.ComboBox1.Text;
Font.Size:=13;
case ColorToRGB(Form31.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlue;
end;
TextOut(Round(Form28.ClientWidth/2)-Round(TextWidth(Head)/2),10,Head);   // на 20 отступ оси Оу подписи
Font.Size:=11;
Font.Color:=clBlack;
////////////// теперь  рисуем спектр



setlength(ir_all,Form28.ClientWidth+2000);


if dial=true then begin

////////////поиск наименьшего и наибольшего значения частоты
freq_min_p:=100000000;
freq_max_p:=-100000000;
for i:=0 to length(freq)-1 do begin
if freq_min_p>=strtofloat(freq[i]) then freq_min_p:=strtofloat(freq[i]);   // минимум
if freq_max_p<=strtofloat(freq[i]) then freq_max_p:=strtofloat(freq[i]);   // максимум
end;

if ZoomX1_p<>0 then freq_min_p:=ZoomX1_p;
if ZoomX2_p<>0 then freq_max_p:=ZoomX2_p;

////////////поиск наибольшего значения интенсивности
p_inten_max:=-1000000000;
for i:=0 to length(depolar_p)-1 do
if p_inten_max<=strtofloat(depolar_p[i]) then p_inten_max:=strtofloat(depolar_p[i]);   // максимум


if (ZoomX1_p<>0) or (ZoomX2_p<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
p_inten_max:=-1000000000;
for i:=0 to length(depolar_p)-1 do begin
if (strtofloat(freq[i])>=freq_min_p) and (strtofloat(freq[i])<=freq_max_p) then begin
if p_inten_max<=strtofloat(depolar_p[i]) then p_inten_max:=strtofloat(depolar_p[i]);   // максимум
end;
end;
end;



////////////////отрисовка линий
Pen.Color:=Form31.ColorBox1.Selected;
Pen.Width:=strtoint(Form31.ComboBox1.Text);
for i:=0 to  length(freq)-1 do begin
if (strtofloat(freq[i])<freq_min_p-0.00001) or (strtofloat(freq[i])>freq_max_p+0.00001) then goto 102;

if Form31.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_p)/ (freq_max_p-freq_min_p)), Form28.ClientHeight-80  );
LineTo( 60+20+ Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_p)/ (freq_max_p-freq_min_p)), Form28.ClientHeight-80  -  Round(( Form28.ClientHeight-60-20 - 60-20)*strtofloat(depolar_p[i])/ p_inten_max ) );
end;


if i>0 then begin
if (abs(strtofloat(freq[i])-strtofloat(freq[i-1]))<0.001) and (abs(strtofloat(depolar_p[i]))<0.001) then goto 102;
if (abs(strtofloat(freq[i])-strtofloat(freq[i-1]))<0.001) and (abs(strtofloat(depolar_p[i])-strtofloat(depolar_p[i-1]))<0.001) then goto 102;
end;

if  (ir_all[Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_p)/ (freq_max_p-freq_min_p))+10]<>0) and  (strtofloat(depolar_p[i])<strtofloat(depolar_p[i-1]))  then  goto 102;
ir_all[Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_p)/ (freq_max_p-freq_min_p))+10]:=   Round(( Form28.ClientHeight-80-20 - 60-20)*strtofloat(depolar_p[i])/ p_inten_max );
102: end;



end   // конец if dial=true then begin


else begin    // если открыт диалог нескольких файлов

//надо убрать элементы '' для того, чтобы все работало
for  i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_mult[basket[Form24.ComboBox1.ItemIndex],i]='' then begin
setlength(freq_mult[basket[Form24.ComboBox1.ItemIndex]],i);
setlength(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex]],i);
break;
end;
end;
ch_mult[basket[Form24.Combobox1.ItemIndex]]:=i;
///////////////////////////////////////////////////////


freq_min_p:=100000000;
freq_max_p:=-100000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_min_p>=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_min_p:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // минимум
if freq_max_p<=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_max_p:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;

if ZoomX1_p<>0 then freq_min_p:=ZoomX1_p;
if ZoomX2_p<>0 then freq_max_p:=ZoomX2_p;

////////////поиск наибольшего значения интенсивности
p_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do
if p_inten_max<=strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i]) then p_inten_max:=strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум



if (ZoomX1_p<>0) or (ZoomX2_p<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
p_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>=freq_min_p) and (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<=freq_max_p) then begin
if p_inten_max<=strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i]) then p_inten_max:=strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;
end;
end;






Pen.Color:=Form31.ColorBox1.Selected;
Pen.Width:=strtoint(Form31.ComboBox1.Text);
////////////////отрисовка линий
for i:=0 to  ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<freq_min_p) or (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>freq_max_p) then goto 103;
if Form31.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_p)/ (freq_max_p-freq_min_p)), Form28.ClientHeight-80  );
LineTo( 60+20+ Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_p)/ (freq_max_p-freq_min_p)), Form28.ClientHeight-80  -  Round(( Form28.ClientHeight-60-20 - 60-20)*strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i])/ p_inten_max ) );
end;


if i>0 then begin
if (abs(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) and (abs(strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i]))<0.001) then goto 103;
if (abs(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) and (abs(strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) then goto 103;
end;
if  (ir_all[Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_p)/ (freq_max_p-freq_min_p))+10]<>0) and  (strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i])<strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))  then  goto 103;



ir_all[Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_p)/ (freq_max_p-freq_min_p))+10]:=   Round(( Form28.ClientHeight-80-20 - 60-20)*strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i])/ p_inten_max );
103: end;



end;  // конец открытия диалога нескольких файлов



for i:=0 to length(ir_all)-1  do begin
ir_all[i]:= Form28.ClientHeight-90-ir_all[i];
end;

// теперь надо создать массив точек для прорисовки сплайна (огибающей)

if Form28.ClientWidth>120 then setlength(ir_all,Form28.ClientWidth-140)
else setlength(ir_all,Form28.ClientWidth-60);
//showmessage(inttostr(length(ir_all)));
Pen.Color:=Form31.ColorBox2.Selected;
Pen.Width:=strtoint(Form31.ComboBox2.Text);
if Form31.CheckBox2.Checked=True then spline_freq(ir_all,80,rezhim_p);

case ColorToRGB(Form31.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
Pen.Width:=1;

//надо сделать шкалы значений по осям
tickx:=Round((Form28.ClientWidth-80-80)*0.1);
ticky:=Round((Form28.ClientHeight-80-80)*0.1);
for i:=0 to Round((Form28.ClientWidth-80-80)/Tickx) do  begin
MoveTo(80+i*tickx,Form28.ClientHeight-80);
LineTo(80+i*tickx,Form28.ClientHeight-80+9);                  // 9 - длина тика
Font.Size:=10;
case ColorToRGB(Form31.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
fr_tick:=floattostrf((freq_min_p+ i*Tickx*(freq_max_p-freq_min_p)/(Form28.ClientWidth-160)),ffFixed,4,1);
TextOut(80+i*tickx-Round(Canvas.TextWidth(fr_tick)/2),Form28.ClientHeight-80+9+2,fr_tick);       // 2 -расстояние от тика до цифры
end;
for i:=0 to Round((Form28.ClientHeight-80-80)/Ticky) do  begin
MoveTo(51,Form28.ClientHeight-80-i*Ticky);
LineTo(60,Form28.ClientHeight-80-i*Ticky);
ir_tick:=floattostrf(((0+ i*Ticky*p_inten_max)/(Form28.ClientHeight-140)),ffFixed,4,1);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form28.ClientHeight-80-i*ticky-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);       // 2 -расстояние от тика до цифры
end;

//микротики (тики между основными тиками)
//микротик - 1/10 тика
for j:=0 to Round((Form28.ClientWidth-80-80)/Tickx)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(80+i*Round(Tickx/10)+j*Tickx,Form28.ClientHeight-80);
if i<>5 then LineTo(80+i*Round(Tickx/10)+j*Tickx,Form28.ClientHeight-80+5)
else LineTo(80+i*Round(Tickx/10)+j*Tickx,Form28.ClientHeight-80+7)
end;
end;

for j:=0 to Round((Form28.ClientHeight-80-80)/Ticky)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(60,Form28.ClientHeight-80-j*Ticky-i*Round(Ticky/10));
if i<>5 then LineTo(55,Form28.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
else LineTo(53,Form28.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
end;
end;


//теперь идентификация пиков  - цифровая разметка  ,  ir_inten[i]>=0.8*ir_inten_max - условие того, что отмечаются пики на высоте 80 % от максимума и выше
if Form31.CheckBox3.Checked=True then begin
Font.Size:=strtoint(Form31.ComboBox3.Text);
Font.Color:=Form31.ColorBox4.Selected;
if dial=true then begin
for i:=0 to length(freq)-1 do
if  strtofloat(depolar_p[i])>=0.01*strtoint(Form31.ComboBox4.Text)*p_inten_max then  TextOut(60+20+ Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_p)/ (freq_max_p-freq_min_p)) - Round(TextWidth(floattostrf(strtofloat(freq[i]),ffFixed,4,1))/2), Form28.ClientHeight-80  -  Round(( Form28.ClientHeight-60-20 - 60-20)*strtofloat(depolar_p[i])/ p_inten_max )-15, floattostrf(strtofloat(freq[i]),ffFixed,4,1));
end
else begin
for i:=0 to length(freq_mult[basket[Form24.ComboBox1.ItemIndex]])-1 do begin
if (depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') and  (freq_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') then begin
if  strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i])>=0.01*strtoint(Form31.ComboBox4.Text)*p_inten_max then TextOut(60+20+ Round((Form28.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_p)/ (freq_max_p-freq_min_p)) - Round(TextWidth(floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1))/2), Form28.ClientHeight-80  -  Round(( Form28.ClientHeight-60-20 - 60-20)*strtofloat(depolar_p_mult[basket[Form24.ComboBox1.ItemIndex],i])/ p_inten_max )-15, floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1));
end;
end;
end;
end;

//ZoomX1:=0;
//ZoomX2:=0;

if Assigned(BMP2)=false then BMP2 := TBitmap.Create;
BMP2.Height:=PaintBox1.ClientHeight;
BMP2.Width:=PaintBox1.ClientWidth;


BMP2.Canvas.CopyRect(Rect(0,0,BMP2.Width,BMP2.Height),PaintBox1.Canvas,PaintBox1.ClientRect);

end;  // конец with Form28.PaintBox1.Canvas do begin

end;

procedure TForm28.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Xstart_p:=X;
Ystart_p:=Y;
R_p.TopLeft := Point(X, Y);
R_p.BottomRight := Point(X, Y);
Form28.PaintBox1.Canvas.DrawFocusRect(R_p);
if (Button=mbLeft) then press_p:=true;
end;

procedure TForm28.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
with Form28.PaintBox1.Canvas do  begin
if press_p=true then begin
DrawFocusRect(R_p);
if Xstart_p < X then
begin
  R_p.Left := Xstart_p;
  R_p.Right := X;
end
else
begin
  R_p.Left := X;
  R_p.Right := Xstart_p;
end; // R.Top<R.Buttom
if Ystart_p < Y then
begin
  R_p.Top := Ystart_p;
  R_p.Bottom := Y
end
else
begin
  R_p.Top := Y;
  R_p.Bottom := Ystart_p;
end;

DrawFocusRect(R_p);

end;
end;
Form28.StatusBar1.Panels[0].Text:='Freq = '+  floattostrf(freq_max_p - (Form28.ClientWidth-80-X)*(freq_max_p-freq_min_p)/(Form28.ClientWidth-60-20-60-20),ffFixed,4,1) +'   P-Depolar. = ' + floattostrf(0 +(Form28.ClientHeight-80-Y)*p_inten_max/(Form28.ClientHeight-60-60-20),ffFixed,4,1);
end;

procedure TForm28.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
press_p:=false;
if (abs(Ystart_p-Y)>4) and (abs(Xstart_p-X)>4) then begin

if X>Xstart_p then begin ZoomX1_p:= freq_min_p + (Xstart_p-80)*(freq_max_p-freq_min_p)/(Form28.ClientWidth-60-20-60-20);
                       ZoomX2_p:=  freq_max_p - (Form28.ClientWidth-80-X)*(freq_max_p-freq_min_p)/(Form28.ClientWidth-60-20-60-20);
                 end
            else begin
                       ZoomX1_p:=  freq_min_p + (X-80)*(freq_max_p-freq_min_p)/(Form28.ClientWidth-60-20-60-20);
                       ZoomX2_p:=  freq_max_p - (Form28.ClientWidth-80-Xstart_p)*(freq_max_p-freq_min_p)/(Form28.ClientWidth-60-20-60-20);
                 end;

end;
Invalidate;
end;

procedure TForm28.PaintBox1DblClick(Sender: TObject);
begin
ZoomX1_p:=0;
ZoomX2_p:=0;
Invalidate;
end;

procedure TForm28.N1Click(Sender: TObject);
var a: widestring;
i: integer;
begin

if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
BMP2.SaveToFile(a);
end;
FreeAndNil(BMP2);
SaveDialog1.FreeOnRelease;

end;

procedure TForm28.N0Click(Sender: TObject);
begin
Form31.Show;
end;

end.
