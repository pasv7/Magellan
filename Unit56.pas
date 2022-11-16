unit Unit56;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, Math;

type
  TForm56 = class(TForm)
    StatusBar1: TStatusBar;
    PaintBox1: TPaintBox;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    N1: TMenuItem;
    N2: TMenuItem;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form56: TForm56;
  rezhim_uvvis: string='EXP';
  Xstart_uvvis,Ystart_uvvis: integer;
  press_uvvis: boolean=false;
  R_uvvis: TRect;
  ZoomX1_uvvis,ZoomX2_uvvis,ZoomY1_uvvis,ZoomY2_uvvis: real;
  wave_min,wave_max,forc_max: real;
  BMP_uvvis: TBitmap;

implementation

uses Unit57, Unit25, Unit26, Unit52, Unit1, Unit24;

{$R *.dfm}



procedure spline_uvvis(Y: array of integer; Beg: integer; S: String);
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
if W[j]<>0 then Z[i]:=Round(Z[i]+W[j]*exp(-(Form57.TrackBar2.Position/1000)*power(ABS(i-j),(Form57.TrackBar1.Position/1000))));
end;

for i:=0 to length(Z)-1 do
Z[i]:=MaxIntValue(Y)-Z[i]+7;      // +7 для того чтобы нулевая линия огибающей не так далеко отходила вверх от оси абсцисс

for i:=0 to length(Z)-1 do
if Z[i]<MinIntValue(Y)-5 then Z[i]:=MinIntValue(Y)-10;






end;

with Form56.PaintBox1.Canvas do begin
for i:=Beg-10 to length(Z)+Beg-2-10 do begin
MoveTo(i,Z[i-Beg+10]);
LineTo(i+1,Z[i-Beg+11]);


If Form57.CheckBox4.Checked=True then begin    ///// Заливка

If Form57.Radiobutton1.Checked=True then begin
for n:=0 to (Form56.ClientHeight-80)-Z[i-Beg+10]-10 do
Form56.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form57.ColorBox2.Selected;
end;

If Form57.Radiobutton2.Checked=True then begin
for n:=0 to (Form56.ClientHeight-80)-Z[i-Beg+10] do
Form56.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form57.ColorBox2.Selected;
end;

end;  /// конец заливки


end;
end;
end;











procedure TForm56.FormCreate(Sender: TObject);
begin
Form56.DoubleBuffered:=True;
end;

procedure TForm56.PaintBox1Paint(Sender: TObject);
var a,b: string;
    n,m,i,j,bbb,tickx,ticky,dobavka: integer;
    uvvis_all: array of integer; // весь спектр значений для рисования огибающей
    fr_tick,ir_tick,Head: string;
    dispropor: integer;
    len_wave,len_cy: integer;
    label 102,103;
begin
uvvis_all:=nil;
with Form56.PaintBox1.Canvas do begin

case ColorToRGB(Form57.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;

MoveTo(60,60);                      // Oy
LineTo(60,Form56.ClientHeight-80);
MoveTo(60,Form56.ClientHeight-80);                      // Ox
LineTo(Form56.ClientWidth-60,Form56.ClientHeight-80);
a:='Длина волны, нм';
b:= 'I, о.е.';
Font.Name:='Tahoma';
Font.Size:=11;
case ColorToRGB(Form57.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
TextOut(Form56.ClientWidth-60-Form56.PaintBox1.Canvas.TextWidth(a)-20,Form56.ClientHeight-80+30,a);   // на 30 отступ оси Ох подписи
Font.Size:=11;
TextOut(60-Round(Form56.PaintBox1.Canvas.TextWidth(b)/2),60-20,b);   // на 20 отступ оси Оу подписи
Head:='UV/Vis-спектр для системы '+Form52.ComboBox1.Text;
Font.Size:=13;
case ColorToRGB(Form57.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlue;
end;
TextOut(Round(Form56.ClientWidth/2)-Round(TextWidth(Head)/2),10,Head);   // на 20 отступ оси Оу подписи
Font.Size:=11;
Font.Color:=clBlack;
////////////// теперь  рисуем спектр



setlength(uvvis_all,Form56.ClientWidth+2000);


if dial=true then begin
for i:=0 to length(wave[length(wave)-1])-1 do begin
if wave[length(wave)-1,i]='' then FreeAndNil(wave[length(wave)-1,i]);
if forc[length(forc)-1,i]='' then FreeAndNil(forc[length(forc)-1,i]);
end;
end
else begin
for i:=0 to length(wave_mult[basket[Form52.ComboBox1.ItemIndex],length(wave_mult[basket[Form52.ComboBox1.ItemIndex]])-1])-1 do begin
if wave_mult[basket[Form52.ComboBox1.ItemIndex],length(wave_mult[basket[Form52.ComboBox1.ItemIndex]])-1,i]='' then FreeAndNil(wave_mult[basket[Form52.ComboBox1.ItemIndex],length(wave_mult[basket[Form52.ComboBox1.ItemIndex]])-1,i]);
if forc_mult[basket[Form52.ComboBox1.ItemIndex],length(forc_mult[basket[Form52.ComboBox1.ItemIndex]])-1,i]='' then FreeAndNil(forc_mult[basket[Form52.ComboBox1.ItemIndex],length(forc_mult[basket[Form52.ComboBox1.ItemIndex]])-1,i]);
end;
end;











if dial=true then begin

////////////поиск наименьшего и наибольшего значения частоты
wave_min:=100000000;
wave_max:=-100000000;
for i:=0 to length(wave[length(wave)-1])-1 do begin
if wave[length(wave)-1,i]<>'' then begin
if wave_min>=strtofloat(wave[length(wave)-1,i]) then wave_min:=strtofloat(wave[length(wave)-1,i]);   // минимум
if wave_max<=strtofloat(wave[length(wave)-1,i]) then wave_max:=strtofloat(wave[length(wave)-1,i]);   // максимум
end;
end;

if ZoomX1_uvvis<>0 then wave_min:=ZoomX1_uvvis;
if ZoomX2_uvvis<>0 then wave_max:=ZoomX2_uvvis;      //

////////////поиск наибольшего значения интенсивности
forc_max:=-1000000000;
for i:=0 to length(forc[length(forc)-1])-1 do begin
if forc[length(forc)-1,i]<>'' then begin
if forc[length(forc)-1,i]<>'G.S.' then if forc_max<=strtofloat(forc[length(forc)-1,i]) then forc_max:=strtofloat(forc[length(forc)-1,i]);   // максимум
end;
end;


if (ZoomX1_uvvis<>0) or (ZoomX2_uvvis<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
forc_max:=-1000000000;
for i:=0 to length(forc[length(forc)-1])-1 do begin
if (strtofloat(wave[length(wave)-1,i])>=wave_min) and (strtofloat(wave[length(wave)-1,i])<=wave_max) then begin
if forc[length(forc)-1,i]<>'G.S.' then if forc_max<=strtofloat(forc[length(forc)-1,i]) then forc_max:=strtofloat(forc[length(forc)-1,i]);   // максимум
end;
end;
end;



////////////////отрисовка линий
Pen.Color:=Form57.ColorBox1.Selected;
Pen.Width:=strtoint(Form57.ComboBox1.Text);



for i:=0 to  length(wave[length(wave)-1])-1 do begin
if (strtofloat(wave[length(wave)-1,i])<wave_min-0.00001) or (strtofloat(wave[length(wave)-1,i])>wave_max+0.00001) then goto 102;
if Form57.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form56.ClientWidth-60-20-60-20)*(strtofloat(wave[length(wave)-1,i])-wave_min)/ (wave_max-wave_min)), Form56.ClientHeight-80  );
if forc[length(forc)-1,i]<>'G.S.' then LineTo( 60+20+ Round((Form56.ClientWidth-60-20-60-20)*(strtofloat(wave[length(wave)-1,i])-wave_min)/ (wave_max-wave_min)), Form56.ClientHeight-80  -  Round(( Form56.ClientHeight-60-20 - 60-20)*strtofloat(forc[length(forc)-1,i])/ forc_max ) );
end;
if forc[length(forc)-1,i]<>'G.S.' then uvvis_all[Round((Form56.ClientWidth-60-20-60-20)*(strtofloat(wave[length(wave)-1,i])-wave_min)/ (wave_max-wave_min))+10]:=   Round(( Form56.ClientHeight-80-20 - 60-20)*strtofloat(forc[length(forc)-1,i])/ forc_max );
102: end;



end   // конец if dial=true then begin


else begin    // если открыт диалог нескольких файлов

{
//надо убрать элементы '' для того, чтобы все работало
for  i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_mult[basket[Form24.ComboBox1.ItemIndex],i]='' then begin
setlength(freq_mult[basket[Form24.ComboBox1.ItemIndex]],i);
setlength(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex]],i);
break;
end;
end;
ch_mult[basket[Form24.Combobox1.ItemIndex]]:=i;
///////////////////////////////////////////////////////
}


for i:=0 to length(wave_mult[basket[Form52.ComboBox1.ItemIndex]])-1 do
if wave_mult[basket[Form52.ComboBox1.ItemIndex],i,0]='' then Break;
len_cy:=i;  // Количество циклов с непустыми элементами


for i:=0 to length(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1])-1 do
if wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]='' then Break;
len_wave:=i;  // Количество элементов в цикле  len_cy







wave_min:=100000000;
wave_max:=-100000000;
for i:=0 to len_wave-1 do begin
if wave_min>=strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]) then wave_min:=strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]);   // минимум
if wave_max<=strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]) then wave_max:=strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]);   // максимум
end;

if ZoomX1_uvvis<>0 then wave_min:=ZoomX1_uvvis;
if ZoomX2_uvvis<>0 then wave_max:=ZoomX2_uvvis;

////////////поиск наибольшего значения интенсивности
forc_max:=-1000000000;
for i:=0 to len_wave-1 do
if forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]<>'G.S.' then  if forc_max<=strtofloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]) then forc_max:=strtofloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]);   // максимум



if (ZoomX1_uvvis<>0) or (ZoomX2_uvvis<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
forc_max:=-1000000000;
for i:=0 to len_wave-1 do begin
if (strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])>=wave_min) and (strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])<=wave_max) then begin
if forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]<>'G.S.' then  if forc_max<=strtofloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]) then forc_max:=strtofloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]);   // максимум
end;
end;
end;





Pen.Color:=Form57.ColorBox1.Selected;
Pen.Width:=strtoint(Form57.ComboBox1.Text);

////////////////отрисовка линий
for i:=0 to  len_wave-1 do begin
if (strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])<wave_min-0.00001) or (strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])>wave_max+0.00001) then goto 103;
if Form57.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form56.ClientWidth-60-20-60-20)*(strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])-wave_min)/ (wave_max-wave_min)), Form56.ClientHeight-80  );
if forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]<>'G.S.' then LineTo( 60+20+ Round((Form56.ClientWidth-60-20-60-20)*(strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])-wave_min)/ (wave_max-wave_min)), Form56.ClientHeight-80  -  Round(( Form56.ClientHeight-60-20 - 60-20)*strtofloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])/ forc_max ) );
end;
if forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]<>'G.S.' then  uvvis_all[Round((Form56.ClientWidth-60-20-60-20)*(strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])-wave_min)/ (wave_max-wave_min))+10]:=   Round(( Form56.ClientHeight-80-20 - 60-20)*strtofloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])/ forc_max );
103: end;



end;  // конец открытия диалога нескольких файлов


















for i:=0 to length(uvvis_all)-1  do begin
uvvis_all[i]:= Form56.ClientHeight-90-uvvis_all[i];
end;

// теперь надо создать массив точек для прорисовки сплайна (огибающей)

if Form56.ClientWidth>120 then setlength(uvvis_all,Form56.ClientWidth-140)
else setlength(uvvis_all,Form56.ClientWidth-60);
//showmessage(inttostr(length(ir_all)));
Pen.Color:=Form57.ColorBox2.Selected;
Pen.Width:=strtoint(Form57.ComboBox2.Text);
if Form57.CheckBox2.Checked=True then  spline_uvvis(uvvis_all,80,rezhim_uvvis);

case ColorToRGB(Form57.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
Pen.Width:=1;


//надо сделать шкалы значений по осям
tickx:=Round((Form56.ClientWidth-80-80)*0.1);
ticky:=Round((Form56.ClientHeight-80-80)*0.1);
for i:=0 to Round((Form56.ClientWidth-80-80)/Tickx) do  begin
MoveTo(80+i*tickx,Form56.ClientHeight-80);
LineTo(80+i*tickx,Form56.ClientHeight-80+9);                  // 9 - длина тика
Font.Size:=10;
case ColorToRGB(Form57.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
fr_tick:=floattostrf((wave_min+ i*Tickx*(wave_max-wave_min)/(Form56.ClientWidth-160)),ffFixed,4,1);
TextOut(80+i*tickx-Round(Canvas.TextWidth(fr_tick)/2),Form56.ClientHeight-80+9+2,fr_tick);       // 2 -расстояние от тика до цифры
end;
for i:=0 to Round((Form56.ClientHeight-80-80)/Ticky) do  begin
MoveTo(51,Form56.ClientHeight-80-i*Ticky);
LineTo(60,Form56.ClientHeight-80-i*Ticky);
ir_tick:=floattostrf(((0+ i*Ticky*forc_max)/(Form56.ClientHeight-140)),ffFixed,6,3);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form56.ClientHeight-80-i*ticky-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);       // 2 -расстояние от тика до цифры
end;

//микротики (тики между основными тиками)
//микротик - 1/10 тика
for j:=0 to Round((Form56.ClientWidth-80-80)/Tickx)-1 do  begin
dobavka:=0;
for i:=1 to 9 do  begin
dispropor:=tickx-10*Round(Tickx/10);
MoveTo(80+i*Round(Tickx/10)+j*Tickx,Form56.ClientHeight-80);


if i<>5 then begin
LineTo(80+i*Round(Tickx/10)+j*Tickx,Form56.ClientHeight-80+5);
end
else  begin
LineTo(80+i*Round(Tickx/10)+j*Tickx,Form56.ClientHeight-80+7);
end;
end;
end;





for j:=0 to Round((Form56.ClientHeight-80-80)/Ticky)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(60,Form56.ClientHeight-80-j*Ticky-i*Round(Ticky/10));
if i<>5 then LineTo(55,Form56.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
else LineTo(53,Form56.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
end;
end;


//теперь идентификация пиков  - цифровая разметка  ,  ir_inten[i]>=0.8*ir_inten_max - условие того, что отмечаются пики на высоте 80 % от максимума и выше
if Form57.CheckBox3.Checked=True then begin

Font.Size:=strtoint(Form57.ComboBox3.Text);
Font.Color:=Form57.ColorBox4.Selected;
if dial=true then begin
for i:=0 to length(wave[length(wave)-1])-1 do
if (forc[length(forc)-1,i]<>'G.S.') and  (wave[length(wave)-1,i]<>'') and (forc[length(forc)-1,i]<>'')  then if  strtofloat(forc[length(forc)-1,i])>=0.01*strtoint(Form57.ComboBox4.Text)*forc_max then  TextOut(60+20+ Round((Form56.ClientWidth-60-20-60-20)*(strtofloat(wave[length(wave)-1,i])-wave_min)/ (wave_max-wave_min)) - Round(TextWidth(floattostrf(strtofloat(wave[length(wave)-1,i]),ffFixed,4,1))/2), Form56.ClientHeight-80  -  Round(( Form56.ClientHeight-60-20 - 60-20)*strtofloat(forc[length(forc)-1,i])/ forc_max )-15, floattostrf(strtofloat(wave[length(wave)-1,i]),ffFixed,4,1));
end
else begin
for i:=0 to len_wave-1 do begin
if (forc_mult[basket[Form24.ComboBox1.ItemIndex],len_cy-1,i]<>'') and (forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]<>'G.S.') and (wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]<>'') then begin
if  strtofloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])>=0.01*strtoint(Form57.ComboBox4.Text)*forc_max  then TextOut(60+20+ Round((Form56.ClientWidth-60-20-60-20)*(strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])-wave_min)/ (wave_max-wave_min)) - Round(TextWidth(floattostrf(strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]),ffFixed,4,1))/2), Form56.ClientHeight-80  -  Round(( Form56.ClientHeight-60-20 - 60-20)*strtofloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i])/ forc_max )-15, floattostrf(strtofloat(wave_mult[basket[Form52.ComboBox1.ItemIndex],len_cy-1,i]),ffFixed,4,1));
end;
end;
end;


end;
//ZoomX1:=0;
//ZoomX2:=0;


//Заливка цветом из настроек под огибающей
//Form25.PaintBox1.Canvas.FloodFill();

if Assigned(BMP_uvvis)=false then BMP_uvvis := TBitmap.Create;
BMP_uvvis.Height:=PaintBox1.ClientHeight;
BMP_uvvis.Width:=PaintBox1.ClientWidth;


BMP_uvvis.Canvas.CopyRect(Rect(0,0,BMP_uvvis.Width,BMP_uvvis.Height),PaintBox1.Canvas,PaintBox1.ClientRect);


end;  // конец with Form25.PaintBox1.Canvas do begin
end;

procedure TForm56.N1Click(Sender: TObject);
begin
Form57.Show;
end;

procedure TForm56.N2Click(Sender: TObject);
var a: widestring;
i: integer;
begin
if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
BMP_uvvis.SaveToFile(a);
end;
FreeAndNil(BMP_uvvis);
SaveDialog1.FreeOnRelease;
end;

procedure TForm56.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Xstart_uvvis:=X;
Ystart_uvvis:=Y;
R_uvvis.TopLeft := Point(X, Y);
R_uvvis.BottomRight := Point(X, Y);
Form56.PaintBox1.Canvas.DrawFocusRect(R_uvvis);
if (Button=mbLeft) then press_uvvis:=true;
end;

procedure TForm56.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
with Form56.PaintBox1.Canvas do  begin
if press_uvvis=true then begin
DrawFocusRect(R_uvvis);
if Xstart_uvvis < X then
begin
  R_uvvis.Left := Xstart_uvvis;
  R_uvvis.Right := X;
end
else
begin
  R_uvvis.Left := X;
  R_uvvis.Right := Xstart_uvvis;
end; // R.Top<R.Buttom
if Ystart_uvvis < Y then
begin
  R_uvvis.Top := Ystart_uvvis;
  R_uvvis.Bottom := Y
end
else
begin
  R_uvvis.Top := Y;
  R_uvvis.Bottom := Ystart_uvvis
end;

DrawFocusRect(R_uvvis);

end;
end;
Form56.StatusBar1.Panels[0].Text:='Wave length = '+  floattostrf(wave_max - (Form56.ClientWidth-80-X)*(wave_max-wave_min)/(Form56.ClientWidth-60-20-60-20),ffFixed,4,1) +'   Intensity = ' + floattostrf(0 +(Form56.ClientHeight-80-Y)*forc_max/(Form56.ClientHeight-60-60-20),ffFixed,4,1);
end;

procedure TForm56.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
press_uvvis:=false;
if (abs(Ystart_uvvis-Y)>4) and (abs(Xstart_uvvis-X)>4) then begin

if X>Xstart_uvvis then begin ZoomX1_uvvis:= wave_min + (Xstart_uvvis-80)*(wave_max-wave_min)/(Form56.ClientWidth-60-20-60-20);
                       ZoomX2_uvvis:=  wave_max - (Form56.ClientWidth-80-X)*(wave_max-wave_min)/(Form56.ClientWidth-60-20-60-20);
                 end
            else begin
                       ZoomX1_uvvis:=  wave_min + (X-80)*(wave_max-wave_min)/(Form56.ClientWidth-60-20-60-20);
                       ZoomX2_uvvis:=  wave_max - (Form56.ClientWidth-80-Xstart_uvvis)*(wave_max-wave_min)/(Form56.ClientWidth-60-20-60-20);
                 end;

{if Y<Ystart then begin ZoomY1:= 0 + (Ystart-80)*ir_inten_max/(Form25.ClientHeight-60-60-20);
                       ZoomY2:=  ir_inten_max - (Form25.ClientHeight-60-Y)*ir_inten_max/(Form25.ClientHeight-60-60-20);
                 end
            else begin
                       ZoomY1:= 0 + (Y-80)*ir_inten_max/(Form25.ClientHeight-60-60-20);
                       ZoomY2:=  ir_inten_max - (Form25.ClientHeight-60-Ystart)*ir_inten_max/(Form25.ClientHeight-60-60-20);
                 end; }




end;  //  if (Ystart-Y>4) and (Xstart-X>4) then begin
Invalidate;
end;

procedure TForm56.PaintBox1DblClick(Sender: TObject);
begin
ZoomX1_uvvis:=0;
ZoomX2_uvvis:=0;
Invalidate;
end;

end.
