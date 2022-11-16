unit Unit25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Math, Menus, ComCtrls;

type
  TForm25 = class(TForm)
    PaintBox1: TPaintBox;
    PopupMenu1: TPopupMenu;
    LIN1: TMenuItem;
    SQ1: TMenuItem;
    StatusBar1: TStatusBar;
    SaveDialog1: TSaveDialog;
    procedure PaintBox1Paint(Sender: TObject);
    procedure LIN1Click(Sender: TObject);
    procedure SQ1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  Form25: TForm25;
  rezhim: string='LIN';
  Xstart,Ystart: integer;
  press: boolean=false;
  R: TRect;
  ZoomX1,ZoomX2,ZoomY1,ZoomY2: real;
  freq_min,freq_max,ir_inten_max: real;
  BMP: TBitmap;

implementation

uses Unit24, Unit1, Unit26;

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
with Form25.PaintBox1.Canvas do begin
for i:=Beg-10 to length(Z)+Beg-2-10 do begin
MoveTo(i,Z[i-Beg+10]);
LineTo(i+1,Z[i-Beg+11]);


If Form26.CheckBox4.Checked=True then begin    ///// Заливка

If Form26.Radiobutton1.Checked=True then begin
for n:=0 to (Form25.ClientHeight-80)-Z[i-Beg+10]-10 do
Form25.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form26.ColorBox2.Selected;
end;

If Form26.Radiobutton2.Checked=True then begin
for n:=0 to (Form25.ClientHeight-80)-Z[i-Beg+10] do
Form25.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form26.ColorBox2.Selected;
end;

end;  /// конец заливки


end;
end;
end;










procedure TForm25.PaintBox1Paint(Sender: TObject);
var a,b: string;
    n,m,i,j,bbb,tickx,ticky: integer;
    ir_all: array of integer; // весь спектр значений для рисования огибающей
    fr_tick,ir_tick,Head: string;
    label 102,103;
begin
ir_all:=nil;
with Form25.PaintBox1.Canvas do begin

case ColorToRGB(Form26.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;

MoveTo(60,60);                      // Oy
LineTo(60,Form25.ClientHeight-80);
MoveTo(60,Form25.ClientHeight-80);                      // Ox
LineTo(Form25.ClientWidth-60,Form25.ClientHeight-80);
a:='Частота, см';
b:= 'I, км/моль';
Font.Name:='Tahoma';
Font.Size:=11;
case ColorToRGB(Form26.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
TextOut(Form25.ClientWidth-60-Form25.PaintBox1.Canvas.TextWidth(a)-20,Form25.ClientHeight-80+30,a);   // на 30 отступ оси Ох подписи
Font.Size:=8;
TextOut(Form25.ClientWidth-60-20,Form25.ClientHeight-80+27,'-1');
Font.Size:=11;
TextOut(60-Round(Form25.PaintBox1.Canvas.TextWidth(b)/2),60-20,b);   // на 20 отступ оси Оу подписи
Head:='ИК-спектр для системы '+Form24.ComboBox1.Text;
Font.Size:=13;
case ColorToRGB(Form26.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlue;
end;
TextOut(Round(Form25.ClientWidth/2)-Round(TextWidth(Head)/2),10,Head);   // на 20 отступ оси Оу подписи
Font.Size:=11;
Font.Color:=clBlack;
////////////// теперь  рисуем спектр



setlength(ir_all,Form25.ClientWidth+2000);

for i:=0 to length(freq)-1 do begin
if freq[i]='' then FreeAndNil(Freq[i]);
if ir_inten[i]='' then FreeAndNil(ir_inten[i]);
end;




if dial=true then begin

////////////поиск наименьшего и наибольшего значения частоты
freq_min:=100000000;
freq_max:=-100000000;
for i:=0 to length(freq)-1 do begin
if freq[i]<>'' then begin
if freq_min>=strtofloat(freq[i]) then freq_min:=strtofloat(freq[i]);   // минимум
if freq_max<=strtofloat(freq[i]) then freq_max:=strtofloat(freq[i]);   // максимум
end;
end;

if ZoomX1<>0 then freq_min:=ZoomX1;
if ZoomX2<>0 then freq_max:=ZoomX2;

////////////поиск наибольшего значения интенсивности
ir_inten_max:=-1000000000;
for i:=0 to length(ir_inten)-1 do begin
if ir_inten[i]<>'' then begin
if ir_inten_max<=strtofloat(ir_inten[i]) then ir_inten_max:=strtofloat(ir_inten[i]);   // максимум
end;
end;


if (ZoomX1<>0) or (ZoomX2<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
ir_inten_max:=-1000000000;
for i:=0 to length(ir_inten)-1 do begin
if (strtofloat(freq[i])>=freq_min) and (strtofloat(freq[i])<=freq_max) then begin
if ir_inten_max<=strtofloat(ir_inten[i]) then ir_inten_max:=strtofloat(ir_inten[i]);   // максимум
end;
end;
end;



////////////////отрисовка линий
Pen.Color:=Form26.ColorBox1.Selected;
Pen.Width:=strtoint(Form26.ComboBox1.Text);



for i:=0 to  length(freq)-1 do begin
if (strtofloat(freq[i])<freq_min-0.00001) or (strtofloat(freq[i])>freq_max+0.00001) then goto 102;
if Form26.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form25.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min)/ (freq_max-freq_min)), Form25.ClientHeight-80  );
LineTo( 60+20+ Round((Form25.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min)/ (freq_max-freq_min)), Form25.ClientHeight-80  -  Round(( Form25.ClientHeight-60-20 - 60-20)*strtofloat(ir_inten[i])/ ir_inten_max ) );
end;
ir_all[Round((Form25.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min)/ (freq_max-freq_min))+10]:=   Round(( Form25.ClientHeight-80-20 - 60-20)*strtofloat(ir_inten[i])/ ir_inten_max );
102: end;



end   // конец if dial=true then begin


else begin    // если открыт диалог нескольких файлов

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





freq_min:=100000000;
freq_max:=-100000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_min>=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_min:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // минимум
if freq_max<=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_max:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;

if ZoomX1<>0 then freq_min:=ZoomX1;
if ZoomX2<>0 then freq_max:=ZoomX2;

////////////поиск наибольшего значения интенсивности
ir_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do
if ir_inten_max<=strtofloat(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i]) then ir_inten_max:=strtofloat(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум



if (ZoomX1<>0) or (ZoomX2<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
ir_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>=freq_min) and (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<=freq_max) then begin
if ir_inten_max<=strtofloat(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i]) then ir_inten_max:=strtofloat(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;
end;
end;





Pen.Color:=Form26.ColorBox1.Selected;
Pen.Width:=strtoint(Form26.ComboBox1.Text);

////////////////отрисовка линий
for i:=0 to  ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<freq_min-0.00001) or (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>freq_max+0.00001) then goto 103;
if Form26.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form25.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min)/ (freq_max-freq_min)), Form25.ClientHeight-80  );
LineTo( 60+20+ Round((Form25.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min)/ (freq_max-freq_min)), Form25.ClientHeight-80  -  Round(( Form25.ClientHeight-60-20 - 60-20)*strtofloat(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i])/ ir_inten_max ) );
end;
ir_all[Round((Form25.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min)/ (freq_max-freq_min))+10]:=   Round(( Form25.ClientHeight-80-20 - 60-20)*strtofloat(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i])/ ir_inten_max );
103: end;



end;  // конец открытия диалога нескольких файлов



for i:=0 to length(ir_all)-1  do begin
ir_all[i]:= Form25.ClientHeight-90-ir_all[i];
end;

// теперь надо создать массив точек для прорисовки сплайна (огибающей)

if Form25.ClientWidth>120 then setlength(ir_all,Form25.ClientWidth-140)
else setlength(ir_all,Form25.ClientWidth-60);
//showmessage(inttostr(length(ir_all)));
Pen.Color:=Form26.ColorBox2.Selected;
Pen.Width:=strtoint(Form26.ComboBox2.Text);
if Form26.CheckBox2.Checked=True then  spline_freq(ir_all,80,rezhim);

case ColorToRGB(Form26.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
Pen.Width:=1;


//надо сделать шкалы значений по осям
tickx:=Round((Form25.ClientWidth-80-80)*0.1);
ticky:=Round((Form25.ClientHeight-80-80)*0.1);
for i:=0 to Round((Form25.ClientWidth-80-80)/Tickx) do  begin
MoveTo(80+i*tickx,Form25.ClientHeight-80);
LineTo(80+i*tickx,Form25.ClientHeight-80+9);                  // 9 - длина тика
Font.Size:=10;
case ColorToRGB(Form26.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
fr_tick:=floattostrf((freq_min+ i*Tickx*(freq_max-freq_min)/(Form25.ClientWidth-160)),ffFixed,4,1);
TextOut(80+i*tickx-Round(Canvas.TextWidth(fr_tick)/2),Form25.ClientHeight-80+9+2,fr_tick);       // 2 -расстояние от тика до цифры
end;
for i:=0 to Round((Form25.ClientHeight-80-80)/Ticky) do  begin
MoveTo(51,Form25.ClientHeight-80-i*Ticky);
LineTo(60,Form25.ClientHeight-80-i*Ticky);
ir_tick:=floattostrf(((0+ i*Ticky*ir_inten_max)/(Form25.ClientHeight-140)),ffFixed,4,1);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form25.ClientHeight-80-i*ticky-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);       // 2 -расстояние от тика до цифры
end;

//микротики (тики между основными тиками)
//микротик - 1/10 тика
for j:=0 to Round((Form25.ClientWidth-80-80)/Tickx)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(80+i*Round(Tickx/10)+j*Tickx,Form25.ClientHeight-80);
if i<>5 then LineTo(80+i*Round(Tickx/10)+j*Tickx,Form25.ClientHeight-80+5)
else LineTo(80+i*Round(Tickx/10)+j*Tickx,Form25.ClientHeight-80+7)
end;
end;

for j:=0 to Round((Form25.ClientHeight-80-80)/Ticky)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(60,Form25.ClientHeight-80-j*Ticky-i*Round(Ticky/10));
if i<>5 then LineTo(55,Form25.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
else LineTo(53,Form25.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
end;
end;


//теперь идентификация пиков  - цифровая разметка  ,  ir_inten[i]>=0.8*ir_inten_max - условие того, что отмечаются пики на высоте 80 % от максимума и выше
if Form26.CheckBox3.Checked=True then begin

Font.Size:=strtoint(Form26.ComboBox3.Text);
Font.Color:=Form26.ColorBox4.Selected;
if dial=true then begin
for i:=0 to length(freq)-1 do
if  strtofloat(ir_inten[i])>=0.01*strtoint(Form26.ComboBox4.Text)*ir_inten_max then  TextOut(60+20+ Round((Form25.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min)/ (freq_max-freq_min)) - Round(TextWidth(floattostrf(strtofloat(freq[i]),ffFixed,4,1))/2), Form25.ClientHeight-80  -  Round(( Form25.ClientHeight-60-20 - 60-20)*strtofloat(ir_inten[i])/ ir_inten_max )-15, floattostrf(strtofloat(freq[i]),ffFixed,4,1));
end
else begin
for i:=0 to length(freq_mult[basket[Form24.ComboBox1.ItemIndex]])-1 do begin
if (ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') and  (freq_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') then begin
if  strtofloat(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i])>=0.01*strtoint(Form26.ComboBox4.Text)*ir_inten_max then TextOut(60+20+ Round((Form25.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min)/ (freq_max-freq_min)) - Round(TextWidth(floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1))/2), Form25.ClientHeight-80  -  Round(( Form25.ClientHeight-60-20 - 60-20)*strtofloat(ir_inten_mult[basket[Form24.ComboBox1.ItemIndex],i])/ ir_inten_max )-15, floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1));
end;
end;
end;


end;
//ZoomX1:=0;
//ZoomX2:=0;


//Заливка цветом из настроек под огибающей
//Form25.PaintBox1.Canvas.FloodFill();

if Assigned(BMP)=false then BMP := TBitmap.Create;
BMP.Height:=PaintBox1.ClientHeight;
BMP.Width:=PaintBox1.ClientWidth;


BMP.Canvas.CopyRect(Rect(0,0,BMP.Width,BMP.Height),PaintBox1.Canvas,PaintBox1.ClientRect);


end;  // конец with Form25.PaintBox1.Canvas do begin


end;

procedure TForm25.LIN1Click(Sender: TObject);
begin
Form26.Show;

end;

procedure TForm25.SQ1Click(Sender: TObject);
var a: widestring;
i: integer;
begin


if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
BMP.SaveToFile(a);
end;
FreeAndNil(BMP);
SaveDialog1.FreeOnRelease;

end;

procedure TForm25.FormCreate(Sender: TObject);
begin
Form25.DoubleBuffered:=True;
end;

procedure TForm25.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Xstart:=X;
Ystart:=Y;
R.TopLeft := Point(X, Y);
R.BottomRight := Point(X, Y);
Form25.PaintBox1.Canvas.DrawFocusRect(R);
if (Button=mbLeft) then press:=true;
end;

procedure TForm25.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);

begin

//Form25.Canvas.MoveTo(Xstart,Ystart);
//Form25.Canvas.LineTo(X,Y);
with Form25.PaintBox1.Canvas do  begin
if press=true then begin
DrawFocusRect(R);
if Xstart < X then
begin
  R.Left := Xstart;
  R.Right := X;
end
else
begin
  R.Left := X;
  R.Right := Xstart;
end; // R.Top<R.Buttom
if Ystart < Y then
begin
  R.Top := Ystart;
  R.Bottom := Y
end
else
begin
  R.Top := Y;
  R.Bottom := Ystart
end;

DrawFocusRect(R);

end;
end;
Form25.StatusBar1.Panels[0].Text:='Freq = '+  floattostrf(freq_max - (Form25.ClientWidth-80-X)*(freq_max-freq_min)/(Form25.ClientWidth-60-20-60-20),ffFixed,4,1) +'   Inten = ' + floattostrf(0 +(Form25.ClientHeight-80-Y)*ir_inten_max/(Form25.ClientHeight-60-60-20),ffFixed,4,1);
end;

procedure TForm25.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
press:=false;
if (abs(Ystart-Y)>4) and (abs(Xstart-X)>4) then begin

if X>Xstart then begin ZoomX1:= freq_min + (Xstart-80)*(freq_max-freq_min)/(Form25.ClientWidth-60-20-60-20);
                       ZoomX2:=  freq_max - (Form25.ClientWidth-80-X)*(freq_max-freq_min)/(Form25.ClientWidth-60-20-60-20);
                 end
            else begin
                       ZoomX1:=  freq_min + (X-80)*(freq_max-freq_min)/(Form25.ClientWidth-60-20-60-20);
                       ZoomX2:=  freq_max - (Form25.ClientWidth-80-Xstart)*(freq_max-freq_min)/(Form25.ClientWidth-60-20-60-20);
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

procedure TForm25.PaintBox1DblClick(Sender: TObject);
begin
ZoomX1:=0;
ZoomX2:=0;
Invalidate;
end;

end.
