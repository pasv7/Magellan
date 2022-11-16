unit Unit27;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Math, ExtCtrls, Menus, ComCtrls;

type
  TForm27 = class(TForm)
    PaintBox1: TPaintBox;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    P1: TMenuItem;
    U1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;
  rezhim_raman: string='LIN';
  Xstart_raman,Ystart_raman: integer;
  press_raman: boolean=false;
  R_raman: TRect;
  ZoomX1_raman,ZoomX2_raman,ZoomY1_raman,ZoomY2_raman: real;
  freq_min_raman,freq_max_raman,ram_inten_max: real;
  BMP1: TBitmap;

implementation

uses Unit24, Unit1, Unit28, Unit29, Unit30, Unit26;

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
with Form27.PaintBox1.Canvas do begin
for i:=Beg-10 to length(Z)+Beg-2-10 do begin
MoveTo(i,Z[i-Beg+10]);
LineTo(i+1,Z[i-Beg+11]);


If Form30.CheckBox4.Checked=True then begin    ///// Заливка

If Form30.Radiobutton1.Checked=True then begin
for n:=0 to (Form27.ClientHeight-80)-Z[i-Beg+10]-10 do
Form27.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form30.ColorBox2.Selected;
end;

If Form30.Radiobutton2.Checked=True then begin
for n:=0 to (Form27.ClientHeight-80)-Z[i-Beg+10] do
Form27.PaintBox1.Canvas.Pixels[i,Z[i-Beg+10]+n]:=Form30.ColorBox2.Selected;
end;

end;  /// конец заливки





end;


end;

end;












procedure TForm27.FormCreate(Sender: TObject);
begin
Form27.DoubleBuffered:=True;
end;

procedure TForm27.PaintBox1Paint(Sender: TObject);
var a,b: string;
    n,m,i,j,bbb,tickx,ticky: integer;
    ir_all: array of integer; // весь спектр значений для рисования огибающей
    fr_tick,ir_tick,Head: string;
    label 102,103;
begin
ir_all:=nil;
with Form27.PaintBox1.Canvas do begin
case ColorToRGB(Form30.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;

MoveTo(60,60);                      // Oy
LineTo(60,Form27.ClientHeight-80);
MoveTo(60,Form27.ClientHeight-80);                      // Ox
LineTo(Form27.ClientWidth-60,Form27.ClientHeight-80);
a:='Частота, см';
b:= 'R, A  /a.e.';
Font.Name:='Tahoma';
Font.Size:=11;
case ColorToRGB(Form30.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
TextOut(Form27.ClientWidth-60-Form27.PaintBox1.Canvas.TextWidth(a)-20,Form27.ClientHeight-80+30,a);   // на 30 отступ оси Ох подписи
Font.Size:=8;
TextOut(Form27.ClientWidth-60-20,Form27.ClientHeight-80+27,'-1');
TextOut(60-Round(Form27.PaintBox1.Canvas.TextWidth(b)/2)+Form27.PaintBox1.Canvas.TextWidth('R, A')-3,60-30,'4');
Font.Size:=11;
TextOut(60-Round(Form27.PaintBox1.Canvas.TextWidth(b)/2),60-20,b);   // на 20 отступ оси Оу подписи
Head:='Рамановский спектр для системы '+Form24.ComboBox1.Text;
Font.Size:=13;
case ColorToRGB(Form30.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlue;
end;
TextOut(Round(Form27.ClientWidth/2)-Round(TextWidth(Head)/2),10,Head);   // на 20 отступ оси Оу подписи
Font.Size:=11;
Font.Color:=clBlack;
////////////// теперь  рисуем спектр



setlength(ir_all,Form27.ClientWidth+2000);


if dial=true then begin

////////////поиск наименьшего и наибольшего значения частоты
freq_min_raman:=100000000;
freq_max_raman:=-100000000;
for i:=0 to length(freq)-1 do begin
if freq_min_raman>=strtofloat(freq[i]) then freq_min_raman:=strtofloat(freq[i]);   // минимум
if freq_max_raman<=strtofloat(freq[i]) then freq_max_raman:=strtofloat(freq[i]);   // максимум
end;

if ZoomX1_raman<>0 then freq_min_raman:=ZoomX1_raman;
if ZoomX2_raman<>0 then freq_max_raman:=ZoomX2_raman;

////////////поиск наибольшего значения интенсивности
ram_inten_max:=-1000000000;
for i:=0 to length(raman)-1 do
if ram_inten_max<=strtofloat(raman[i]) then ram_inten_max:=strtofloat(raman[i]);   // максимум


if (ZoomX1_raman<>0) or (ZoomX2_raman<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
ram_inten_max:=-1000000000;
for i:=0 to length(raman)-1 do begin
if (strtofloat(freq[i])>=freq_min_raman) and (strtofloat(freq[i])<=freq_max_raman) then begin
if ram_inten_max<=strtofloat(raman[i]) then ram_inten_max:=strtofloat(raman[i]);   // максимум
end;
end;
end;



////////////////отрисовка линий
Pen.Color:=Form30.ColorBox1.Selected;
Pen.Width:=strtoint(Form30.ComboBox1.Text);

for i:=0 to  length(freq)-1 do begin
if (strtofloat(freq[i])<freq_min_raman-0.00001) or (strtofloat(freq[i])>freq_max_raman+0.00001) then goto 102;
if Form30.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_raman)/ (freq_max_raman-freq_min_raman)), Form27.ClientHeight-80  );
LineTo( 60+20+ Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_raman)/ (freq_max_raman-freq_min_raman)), Form27.ClientHeight-80  -  Round(( Form27.ClientHeight-60-20 - 60-20)*strtofloat(raman[i])/ ram_inten_max ) );
end;

if i>0 then begin
if (abs(strtofloat(freq[i])-strtofloat(freq[i-1]))<0.001) and (abs(strtofloat(raman[i]))<0.001) then goto 102;
if (abs(strtofloat(freq[i])-strtofloat(freq[i-1]))<0.001) and (abs(strtofloat(raman[i])-strtofloat(raman[i-1]))<0.001) then goto 102;
end;

if  (ir_all[Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_raman)/ (freq_max_raman-freq_min_raman))+10]<>0) and  (strtofloat(raman[i])<strtofloat(raman[i-1]))  then  goto 102;
ir_all[Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_raman)/ (freq_max_raman-freq_min_raman))+10]:=   Round(( Form27.ClientHeight-80-20 - 60-20)*strtofloat(raman[i])/ ram_inten_max );
102: end;



end   // конец if dial=true then begin


else begin    // если открыт диалог нескольких файлов

//надо убрать элементы '' для того, чтобы все работало
for  i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_mult[basket[Form24.ComboBox1.ItemIndex],i]='' then begin
setlength(freq_mult[basket[Form24.ComboBox1.ItemIndex]],i);
setlength(raman_mult[basket[Form24.ComboBox1.ItemIndex]],i);
break;
end;
end;
ch_mult[basket[Form24.Combobox1.ItemIndex]]:=i;
///////////////////////////////////////////////////////


freq_min_raman:=100000000;
freq_max_raman:=-100000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if freq_min_raman>=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_min_raman:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // минимум
if freq_max_raman<=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]) then freq_max_raman:=strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;

if ZoomX1_raman<>0 then freq_min_raman:=ZoomX1_raman;
if ZoomX2_raman<>0 then freq_max_raman:=ZoomX2_raman;

////////////поиск наибольшего значения интенсивности
ram_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do
if ram_inten_max<=strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i]) then ram_inten_max:=strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум



if (ZoomX1_raman<>0) or (ZoomX2_raman<>0)  then begin
//если ZOOM, то выбираем частоты попавшие в диапазон ZOOMа
ram_inten_max:=-1000000000;
for i:=0 to ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>=freq_min_raman) and (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<=freq_max_raman) then begin
if ram_inten_max<=strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i]) then ram_inten_max:=strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i]);   // максимум
end;
end;
end;





Pen.Color:=Form30.ColorBox1.Selected;
Pen.Width:=strtoint(Form30.ComboBox1.Text);

////////////////отрисовка линий
for i:=0 to  ch_mult[basket[Form24.Combobox1.ItemIndex]]-1 do begin
if (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])<freq_min_raman) or (strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])>freq_max_raman) then goto 103;
if Form30.CheckBox1.Checked=True then begin
MoveTo( 60+20+ Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_raman)/ (freq_max_raman-freq_min_raman)), Form27.ClientHeight-80  );
LineTo( 60+20+ Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_raman)/ (freq_max_raman-freq_min_raman)), Form27.ClientHeight-80  -  Round(( Form27.ClientHeight-60-20 - 60-20)*strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i])/ ram_inten_max ) );
end;


if i>0 then begin
if (abs(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) and (abs(strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i]))<0.001) then goto 103;
if (abs(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) and (abs(strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i])-strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))<0.001) then goto 103;
end;
if  (ir_all[Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_raman)/ (freq_max_raman-freq_min_raman))+10]<>0) and  (strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i])<strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i-1]))  then  goto 103;







ir_all[Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_raman)/ (freq_max_raman-freq_min_raman))+10]:=   Round(( Form27.ClientHeight-80-20 - 60-20)*strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i])/ ram_inten_max );
103: end;



end;  // конец открытия диалога нескольких файлов



for i:=0 to length(ir_all)-1  do begin
ir_all[i]:= Form27.ClientHeight-90-ir_all[i];
end;

// теперь надо создать массив точек для прорисовки сплайна (огибающей)

if Form27.ClientWidth>120 then setlength(ir_all,Form27.ClientWidth-140)
else setlength(ir_all,Form27.ClientWidth-60);
//showmessage(inttostr(length(ir_all)));
Pen.Color:=Form30.ColorBox2.Selected;
Pen.Width:=strtoint(Form30.ComboBox2.Text);
if Form30.CheckBox2.Checked=True then spline_freq(ir_all,80,rezhim_raman);

case ColorToRGB(Form30.ColorBox3.Selected) of
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Pen.Color:=clWhite;
else Pen.Color:=clBlack;
end;
Pen.Width:=1;

//надо сделать шкалы значений по осям
tickx:=Round((Form27.ClientWidth-80-80)*0.1);
ticky:=Round((Form27.ClientHeight-80-80)*0.1);
for i:=0 to Round((Form27.ClientWidth-80-80)/Tickx) do  begin
MoveTo(80+i*tickx,Form27.ClientHeight-80);
LineTo(80+i*tickx,Form27.ClientHeight-80+9);                  // 9 - длина тика
Font.Size:=10;
case ColorToRGB(Form30.ColorBox3.Selected) of    // если фон темный то шрифт надо делать белым
0,128,32768,32896,8388608,8388736,8421376,8421504,16711680,14898176,9981440,12937777,6582129: Font.Color:=clWhite;
else Font.Color:=clBlack;
end;
fr_tick:=floattostrf((freq_min_raman+ i*Tickx*(freq_max_raman-freq_min_raman)/(Form27.ClientWidth-160)),ffFixed,4,1);
TextOut(80+i*tickx-Round(Canvas.TextWidth(fr_tick)/2),Form27.ClientHeight-80+9+2,fr_tick);       // 2 -расстояние от тика до цифры
end;
for i:=0 to Round((Form27.ClientHeight-80-80)/Ticky) do  begin
MoveTo(51,Form27.ClientHeight-80-i*Ticky);
LineTo(60,Form27.ClientHeight-80-i*Ticky);
ir_tick:=floattostrf(((0+ i*Ticky*ram_inten_max)/(Form27.ClientHeight-140)),ffFixed,4,1);
TextOut(60-9-2-Round(Canvas.TextWidth(ir_tick)),Form27.ClientHeight-80-i*ticky-Round(Canvas.TextHeight(ir_tick)/2),ir_tick);       // 2 -расстояние от тика до цифры
end;

//микротики (тики между основными тиками)
//микротик - 1/10 тика
for j:=0 to Round((Form27.ClientWidth-80-80)/Tickx)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(80+i*Round(Tickx/10)+j*Tickx,Form27.ClientHeight-80);
if i<>5 then LineTo(80+i*Round(Tickx/10)+j*Tickx,Form27.ClientHeight-80+5)
else LineTo(80+i*Round(Tickx/10)+j*Tickx,Form27.ClientHeight-80+7)
end;
end;

for j:=0 to Round((Form27.ClientHeight-80-80)/Ticky)-1 do  begin
for i:=1 to 9 do  begin
MoveTo(60,Form27.ClientHeight-80-j*Ticky-i*Round(Ticky/10));
if i<>5 then LineTo(55,Form27.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
else LineTo(53,Form27.ClientHeight-80-j*Ticky-i*Round(Ticky/10))
end;
end;


//теперь идентификация пиков  - цифровая разметка  ,  ir_inten[i]>=0.8*ir_inten_max - условие того, что отмечаются пики на высоте 80 % от максимума и выше
if Form30.CheckBox3.Checked=True then begin
Font.Size:=strtoint(Form30.ComboBox3.Text);
Font.Color:=Form30.ColorBox4.Selected;
if dial=true then begin
for i:=0 to length(freq)-1 do
if  strtofloat(raman[i])>=0.01*strtoint(Form30.ComboBox4.Text)*ram_inten_max then  TextOut(60+20+ Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq[i])-freq_min_raman)/ (freq_max_raman-freq_min_raman)) - Round(TextWidth(floattostrf(strtofloat(freq[i]),ffFixed,4,1))/2), Form27.ClientHeight-80  -  Round(( Form27.ClientHeight-60-20 - 60-20)*strtofloat(raman[i])/ ram_inten_max )-15, floattostrf(strtofloat(freq[i]),ffFixed,4,1));
end
else begin
for i:=0 to length(freq_mult[basket[Form24.ComboBox1.ItemIndex]])-1 do begin
if (raman_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') and  (freq_mult[basket[Form24.ComboBox1.ItemIndex],i]<>'') then begin
if  strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i])>=0.01*strtoint(Form30.ComboBox4.Text)*ram_inten_max then TextOut(60+20+ Round((Form27.ClientWidth-60-20-60-20)*(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i])-freq_min_raman)/ (freq_max_raman-freq_min_raman)) - Round(TextWidth(floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1))/2), Form27.ClientHeight-80  -  Round(( Form27.ClientHeight-60-20 - 60-20)*strtofloat(raman_mult[basket[Form24.ComboBox1.ItemIndex],i])/ ram_inten_max )-15, floattostrf(strtofloat(freq_mult[basket[Form24.ComboBox1.ItemIndex],i]),ffFixed,4,1));
end;
end;
end;

end;
//ZoomX1:=0;
//ZoomX2:=0;

if Assigned(BMP1)=false then BMP1 := TBitmap.Create;
BMP1.Height:=PaintBox1.ClientHeight;
BMP1.Width:=PaintBox1.ClientWidth;


BMP1.Canvas.CopyRect(Rect(0,0,BMP1.Width,BMP1.Height),PaintBox1.Canvas,PaintBox1.ClientRect);

end;  // конец with Form25.PaintBox1.Canvas do begin

end;

procedure TForm27.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Xstart_raman:=X;
Ystart_raman:=Y;
R_raman.TopLeft := Point(X, Y);
R_raman.BottomRight := Point(X, Y);
Form27.PaintBox1.Canvas.DrawFocusRect(R_raman);
if (Button=mbLeft) then press_raman:=true;
end;

procedure TForm27.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
with Form27.PaintBox1.Canvas do  begin
if press_raman=true then begin
DrawFocusRect(R_raman);
if Xstart_raman < X then
begin
  R_raman.Left := Xstart_raman;
  R_raman.Right := X;
end
else
begin
  R_raman.Left := X;
  R_raman.Right := Xstart_raman;
end; // R.Top<R.Buttom
if Ystart_raman < Y then
begin
  R_raman.Top := Ystart_raman;
  R_raman.Bottom := Y
end
else
begin
  R_raman.Top := Y;
  R_raman.Bottom := Ystart_raman;
end;

DrawFocusRect(R_raman);

end;
end;
Form27.StatusBar1.Panels[0].Text:='Freq = '+  floattostrf(freq_max_raman - (Form27.ClientWidth-80-X)*(freq_max_raman-freq_min_raman)/(Form27.ClientWidth-60-20-60-20),ffFixed,4,1) +'   Ram. act. = ' + floattostrf(0 +(Form27.ClientHeight-80-Y)*ram_inten_max/(Form27.ClientHeight-60-60-20),ffFixed,4,1);
end;

procedure TForm27.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
press_raman:=false;
if (abs(Ystart_raman-Y)>4) and (abs(Xstart_raman-X)>4) then begin

if X>Xstart_raman then begin ZoomX1_raman:= freq_min_raman + (Xstart_raman-80)*(freq_max_raman-freq_min_raman)/(Form27.ClientWidth-60-20-60-20);
                       ZoomX2_raman:=  freq_max_raman - (Form27.ClientWidth-80-X)*(freq_max_raman-freq_min_raman)/(Form27.ClientWidth-60-20-60-20);
                 end
            else begin
                       ZoomX1_raman:=  freq_min_raman + (X-80)*(freq_max_raman-freq_min_raman)/(Form27.ClientWidth-60-20-60-20);
                       ZoomX2_raman:=  freq_max_raman - (Form27.ClientWidth-80-Xstart_raman)*(freq_max_raman-freq_min_raman)/(Form27.ClientWidth-60-20-60-20);
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

procedure TForm27.PaintBox1DblClick(Sender: TObject);
begin
ZoomX1_raman:=0;
ZoomX2_raman:=0;
Invalidate;
end;

procedure TForm27.P1Click(Sender: TObject);
begin
Form28.Show;
end;

procedure TForm27.U1Click(Sender: TObject);
begin
Form29.Show;
end;

procedure TForm27.N1Click(Sender: TObject);
begin
Form30.Show;
end;

procedure TForm27.N3Click(Sender: TObject);
var a: widestring;
i: integer;
begin


if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
BMP1.SaveToFile(a);
end;
FreeAndNil(BMP1);
SaveDialog1.FreeOnRelease;

end;

end.
