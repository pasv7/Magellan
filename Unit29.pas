unit Unit29;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls;

type
  TForm29 = class(TForm)
    PaintBox1: TPaintBox;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    N1: TMenuItem;
    N2: TMenuItem;
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
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form29: TForm29;
  rezhim_u: string='LIN';
  Xstart_u,Ystart_u: integer;
  press_u: boolean=false;
  R_u: TRect;
  ZoomX1_u,ZoomX2_u,ZoomY1_u,ZoomY2_u: real;
  freq_min_u,freq_max_u,u_inten_max: real;
  BMP3: TBitMap;

implementation

uses Unit24, Unit1, Unit32, Unit31;

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
with Form29.PaintBox1.Canvas do begin
for i:=Beg-10 to length(Z)+Beg-2-10 do begin
MoveTo(i,Z[i-Beg+10]);
LineTo(i+1,Z[i-Beg+11]);


If Form32.CheckBox4.Checked=True then begin    ///// «аливка

If Form32.Radiobutton1.Checked=True then begin
for n:=0 to (Form29.ClientHeight-80)-Z[i-Beg+10]-10 do
Form29.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form32.ColorBox2.Selected;
end;

If Form32.Radiobutton2.Checked=True then begin
for n:=0 to (Form29.ClientHeight-80)-Z[i-Beg+10] do
Form29.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form32.ColorBox2.Selected;
end;

end;  /// конец заливки







end;

end;
end;









procedure TForm29.FormCreate(Sender: TObject);
begin
Form29.DoubleBuffered:=True;
end;

procedure TForm29.PaintBox1Paint(Sender: TObject);
var a,b: string;
    n,m,i,j,bbb,tickx,ticky: integer;
    ir_all: array of integer; // весь спектр значений дл€ рисовани€ огибающей
    fr_tick,ir_tick,Head: string;
    label 102,103;
begin
ir_all:=nil;
with Form29.PaintBox1.Canvas do begin
case ColorToRGB(Form32.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
MoveTo(60,60);                      // Oy
LineTo(60,Form29.ClientHeight-80);
MoveTo(60,Form29.ClientHeight-80);                      // Ox
LineTo(Form29.ClientWidth-60,Form29.ClientHeight-80);
a:='„астота, см';
b:= 'U-депол€ризаци€, о.е.';
Font.Name:='Tahoma';
Font.Size:=11;
case ColorToRGB(Form32.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
TextOut(Form29.ClientWidth-60-Form29.PaintBox1.Canvas.TextWidth(a)-20,Form29.ClientHeight-80+30,a);   // на 30 отступ оси ќх подписи
Font.Size:=8;
TextOut(Form29.ClientWidth-60-20,Form29.ClientHeight-80+27,'-1');
Font.Size:=11;
TextOut(60-Round(Form29.PaintBox1.Canvas.TextWidth(b)/2)+30,60-20,b);   // на 20 отступ оси ќу подписи
Head:='—пектр U-депол€ризации дл€ системы '+Form24.ComboBox1.Text;
Font.Size:=13;
case ColorToRGB(Form32.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlue;
end;
TextOut(Round(Form29.ClientWidth/2)-Round(TextWidth(Head)/2),10,Head);   // на 20 отступ оси ќу подписи
Font.Size:=11;
Font.Color:=clBlack;
////////////// теперь  рисуем спектр



setlength(ir_all,Form29.ClientWidth+2000);


if dial=true then begin

////////////поиск наименьшего и наибольшего значени€ частоты
freq_min_u:=100000000;
freq_max_u:=-100000000;
for i:=0 to length(freq)-1 do begin
if freq_min_u>=strtofloat(freq[i]) then freq_min_u:=strtofloat(freq[i]);   // минимум
if freq_max_u<=strtofloat(freq[i]) then freq_max_u:=strtofloat(freq[i]);   // максимум
end;

if ZoomX1_u<>0 then freq_min_u:=ZoomX1_u;
if ZoomX2_u<>0 then freq_max_u:=ZoomX2_u;

////////////поиск наибольшего значени€ интенсивности
u_inten_max:=-1000000000;
for i:=0 to length(depolar_u)-1 do
if u_inten_max<=strtofloat(depolar_u[i]) then u_inten_max:=strtofloat(depolar_u[i]);   // максимум


if (ZoomX1_u<>0) or (ZoomX2_u<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
u_inten_max:=-1000000000;
for i:=0 to length(depolar_u)-1 do begin
if (strtofloat(freq[i])>=freq_min_u) and (strtofloat(freq[i])<=freq_max_u) then begin
if u_inten_max<=strtofloat(depolar_u[i]) then u_inten_max:=strtofloat(depolar_u[i]);   // максимум
end;
end;
end;



////////////////отрисовка линий
Pen.Color:=Form32.ColorBox1.Selected;
Pen.Width:=strtoint(Form32.ComboBox1.Text);
for i:=0 to  length(freq)-1 do begin
if (strtofloat(freq[i])<freq_min_u-0.00001) or (strtofloat(freq[i])>freq_max_u+0.00001) then goto 102;

if Form32.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_u)/ (freq_max_u-freq_min_u)), Form29.ClientHeight-80  );
LineTo( 60+20+ Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_u)/ (freq_max_u-freq_min_u)), Form29.ClientHeight-80  -  Round(( Form29.ClientHeight-60-20 - 60-20)*strtofloat(depolar_u[i])/ u_inten_max ) );
end;

if i>0 then begin
if (abs(strtofloat(freq[i])-strtofloat(freq[i-1]))<0.001) and (abs(strtofloat(depolar_u[i]))<0.001) then goto 102;
if (abs(strtofloat(freq[i])-strtofloat(freq[i-1]))<0.001) and (abs(strtofloat(depolar_u[i])-strtofloat(depolar_u[i-1]))<0.001) then goto 102;
end;

if  (ir_all[Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_u)/ (freq_max_u-freq_min_u))+10]<>0) and  (strtofloat(depolar_u[i])<strtofloat(depolar_u[i-1]))  then  goto 102;
ir_all[Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_u)/ (freq_max_u-freq_min_u))+10]:=   Round(( Form29.ClientHeight-80-20 - 60-20)*strtofloat(depolar_u[i])/ u_inten_max );
102: end;



end   // конец if dial=true then begin


else begin    // если открыт диалог нескольких файлов

//надо убрать элементы '' дл€ того, чтобы все работало
for  i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_mult[basket[Form24.ComboBox1.ItemIndex],i]='' then begin
setlength(freq_mult[basket[Form24.ComboBox1.ItemIndex]],i);
setlength(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex]],i);
break;
end;
end;
ch_mult[basket[Form24.Combobox1.ItemIndex]]:=i;
///////////////////////////////////////////////////////

freq_min_u:=100000000;
freq_max_u:=-100000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_min_u>=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_min_u:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // минимум
if freq_max_u<=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_max_u:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;

if ZoomX1_u<>0 then freq_min_u:=ZoomX1_u;
if ZoomX2_u<>0 then freq_max_u:=ZoomX2_u;

////////////поиск наибольшего значени€ интенсивности
u_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do
if u_inten_max<=strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i]) then u_inten_max:=strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум



if (ZoomX1_u<>0) or (ZoomX2_u<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
u_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>=freq_min_u) and (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<=freq_max_u) then begin
if u_inten_max<=strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i]) then u_inten_max:=strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;
end;
end;






Pen.Color:=Form32.ColorBox1.Selected;
Pen.Width:=strtoint(Form32.ComboBox1.Text);
////////////////отрисовка линий
for i:=0 to  ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<freq_min_u) or (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>freq_max_u) then goto 103;

if Form32.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_u)/ (freq_max_u-freq_min_u)), Form29.ClientHeight-80  );
LineTo( 60+20+ Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_u)/ (freq_max_u-freq_min_u)), Form29.ClientHeight-80  -  Round(( Form29.ClientHeight-60-20 - 60-20)*strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i])/ u_inten_max ) );
end;


if i>0 then begin
if (abs(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) and (abs(strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i]))<0.001) then goto 103;
if (abs(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) and (abs(strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) then goto 103;
end;
if  (ir_all[Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_u)/ (freq_max_u-freq_min_u))+10]<>0) and  (strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i])<strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))  then  goto 103;



ir_all[Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_u)/ (freq_max_u-freq_min_u))+10]:=   Round(( Form29.ClientHeight-80-20 - 60-20)*strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i])/ u_inten_max );
103: end;



end;  // конец открыти€ диалога нескольких файлов



for i:=0 to length(ir_all)-1  do begin
ir_all[i]:= Form29.ClientHeight-90-ir_all[i];
end;

// теперь надо создать массив точек дл€ прорисовки сплайна (огибающей)

if Form29.ClientWidth>120 then setlength(ir_all,Form29.ClientWidth-140)
else setlength(ir_all,Form29.ClientWidth-60);
//showmessage(inttostr(length(ir_all)));
Pen.Color:=Form32.ColorBox2.Selected;
Pen.Width:=strtoint(Form32.ComboBox2.Text);
if Form32.CheckBox2.Checked=True then spline_freq(ir_all,80,rezhim_u);

case ColorToRGB(Form32.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
Pen.Width:=1;
//надо сделать шкалы значений по ос€м
tickx:=Round((Form29.ClientWidth-80-80)*0.1);
ticky:=Round((Form29.ClientHeight-80-80)*0.1);
for i:=0 to Round((Form29.ClientWidth-80-80)/Tickx) do  begin
MoveTo(80+i*tickx,Form29.ClientHeight-80);
LineTo(80+i*tickx,Form29.ClientHeight-80+9);                  // 9 - длина тика
Font.Size:=10;
case ColorToRGB(Form32.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
fr_tick:=floattostrf((freq_min_u+ i*Tickx*(freq_max_u-freq_min_u)/(Form29.ClientWidth-160)),ffFixed,4,1);
TextOut(80+i*tickx-Round(Canvas.TextWidth(fr_tick)/2),Form29.ClientHeight-80+9+2,fr_tick);       // 2 -рассто€ние от тика до цифры
end;
for i:=0 to Round((Form29.ClientHeight-80-80)/Ticky) do  begin
MoveTo(51,Form29.ClientHeight-80-i*Ticky);
LineTo(60,Form29.ClientHeight-80-i*Ticky);
ir_tick:=floattostrf(((0+ i*Ticky*u_inten_max)/(Form29.ClientHeight-140)),ffFixed,4,1);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form29.ClientHeight-80-i*ticky-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);       // 2 -рассто€ние от тика до цифры
end;

//микротики (тики между основными тиками)
//микротик - 1/10 тика
for j:=0 to Round((Form29.ClientWidth-80-80)/Tickx)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(80+i*Round(Tickx/10)+j*Tickx,Form29.ClientHeight-80);
if i<>5 then LineTo(80+i*Round(Tickx/10)+j*Tickx,Form29.ClientHeight-80+5)
else LineTo(80+i*Round(Tickx/10)+j*Tickx,Form29.ClientHeight-80+7)
end;
end;

for j:=0 to Round((Form29.ClientHeight-80-80)/Ticky)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(60,Form29.ClientHeight-80-j*Ticky-i*Round(Ticky/10));
if i<>5 then LineTo(55,Form29.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
else LineTo(53,Form29.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
end;
end;


//теперь идентификаци€ пиков  - цифрова€ разметка  ,  ir_inten[i]>=0.8*ir_inten_max - условие того, что отмечаютс€ пики на высоте 80 % от максимума и выше
if Form32.CheckBox3.Checked=True then begin
Font.Size:=strtoint(Form32.ComboBox3.Text);
Font.Color:=Form32.ColorBox4.Selected;
if dial=true then begin
for i:=0 to length(freq)-1 do
if  strtofloat(depolar_u[i])>=0.01*strtoint(Form32.ComboBox4.Text)*u_inten_max then  TextOut(60+20+ Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_u)/ (freq_max_u-freq_min_u)) - Round(TextWidth(floattostrf(strtofloat(freq[i]),ffFixed,4,1))/2), Form29.ClientHeight-80  -  Round(( Form29.ClientHeight-60-20 - 60-20)*strtofloat(depolar_u[i])/ u_inten_max )-15, floattostrf(strtofloat(freq[i]),ffFixed,4,1));
end
else begin
for i:=0 to length(freq_mult[basket[Form24.ComboBox1.ItemIndex]])-1 do begin
if (depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') and  (freq_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') then begin
if  strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i])>=0.01*strtoint(Form32.ComboBox4.Text)*u_inten_max then TextOut(60+20+ Round((Form29.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_u)/ (freq_max_u-freq_min_u)) - Round(TextWidth(floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1))/2), Form29.ClientHeight-80  -  Round(( Form29.ClientHeight-60-20 - 60-20)*strtofloat(depolar_u_mult[basket[Form24.ComboBox1.ItemIndex],i])/ u_inten_max )-15, floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1));
end;
end;
end;
end;


//ZoomX1:=0;
//ZoomX2:=0;


if Assigned(BMP3)=false then BMP3 := TBitmap.Create;
BMP3.Height:=PaintBox1.ClientHeight;
BMP3.Width:=PaintBox1.ClientWidth;


BMP3.Canvas.CopyRect(Rect(0,0,BMP3.Width,BMP3.Height),PaintBox1.Canvas,PaintBox1.ClientRect);


end;  // конец with Form28.PaintBox1.Canvas do begin


end;

procedure TForm29.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Xstart_u:=X;
Ystart_u:=Y;
R_u.TopLeft := Point(X, Y);
R_u.BottomRight := Point(X, Y);
Form29.PaintBox1.Canvas.DrawFocusRect(R_u);
if (Button=mbLeft) then press_u:=true;
end;

procedure TForm29.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
with Form29.PaintBox1.Canvas do  begin
if press_u=true then begin
DrawFocusRect(R_u);
if Xstart_u < X then
begin
  R_u.Left := Xstart_u;
  R_u.Right := X;
end
else
begin
  R_u.Left := X;
  R_u.Right := Xstart_u;
end; // R.Top<R.Buttom
if Ystart_u < Y then
begin
  R_u.Top := Ystart_u;
  R_u.Bottom := Y
end
else
begin
  R_u.Top := Y;
  R_u.Bottom := Ystart_u;
end;

DrawFocusRect(R_u);

end;
end;
Form29.StatusBar1.Panels[0].Text:='Freq = '+  floattostrf(freq_max_u - (Form29.ClientWidth-80-X)*(freq_max_u-freq_min_u)/(Form29.ClientWidth-60-20-60-20),ffFixed,4,1) +'   U-Depolar. = ' + floattostrf(0 +(Form29.ClientHeight-80-Y)*u_inten_max/(Form29.ClientHeight-60-60-20),ffFixed,4,1);
end;

procedure TForm29.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
press_u:=false;
if (abs(Ystart_u-Y)>4) and (abs(Xstart_u-X)>4) then begin

if X>Xstart_u then begin ZoomX1_u:= freq_min_u + (Xstart_u-80)*(freq_max_u-freq_min_u)/(Form29.ClientWidth-60-20-60-20);
                       ZoomX2_u:=  freq_max_u - (Form29.ClientWidth-80-X)*(freq_max_u-freq_min_u)/(Form29.ClientWidth-60-20-60-20);
                 end
            else begin
                       ZoomX1_u:=  freq_min_u + (X-80)*(freq_max_u-freq_min_u)/(Form29.ClientWidth-60-20-60-20);
                       ZoomX2_u:=  freq_max_u - (Form29.ClientWidth-80-Xstart_u)*(freq_max_u-freq_min_u)/(Form29.ClientWidth-60-20-60-20);
                 end;

end;
Invalidate;
end;

procedure TForm29.PaintBox1DblClick(Sender: TObject);
begin
ZoomX1_u:=0;
ZoomX2_u:=0;
Invalidate;
end;

procedure TForm29.N1Click(Sender: TObject);
begin
Form32.Show;
end;

procedure TForm29.N2Click(Sender: TObject);
var a: widestring;
i: integer;
begin

if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
BMP3.SaveToFile(a);
end;
FreeAndNil(BMP3);
SaveDialog1.FreeOnRelease;
end;

end.
