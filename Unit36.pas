unit Unit36;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Menus, Math, StdCtrls, pngimage;

type
  TForm36 = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    N2: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image16MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image17MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
  procedure CMDialogKey(var Msg: TWMKey);
  message CM_DIALOGKEY;
    { Public declarations }
  end;




var
  Form36: TForm36;
  anglex: real=0;
  angley: real=0;
  anglez: real=0;
  scr_x,scr_y,scr_z: array of integer;
  native_x,native_y,native_z,colour_atom,x_draw,y_draw,z_draw: array of string;
  x_draw_out,y_draw_out,z_draw_out: array of array of string;
  x_1,y_1,z_1,xdraw,ydraw,zdraw,dx,dy,dz: array of Double;  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  x_max,y_max,z_max,x_min,y_min,z_min,xinv,yinv,zinv,min_abs,max_abs,D1,scal: real;
  A,B,nc,ti: integer;
  opt: integer=0;
  translatx: integer=0;
  translaty: integer=0;
  scale_panorama: real=0.05;
  scale_atom: real=1.5;
  ux: integer = 0;
  uy: integer = 0;
  uz: integer = 0;
  ugolx: integer = 0;
  ugoly: integer = 0;
  ugolz: integer = 0;
  step1: integer=0;
  Evolut: boolean=false;
  trxyz: array of string;
  irc_nc: integer;
  order_z: array of integer;
  are_bonds,new_atom_store: array of string;
  bonds_painted: boolean=false;
  cli: boolean=false;
  Red,Green,Blue: array of byte;
  Rx_show_view: array of real;
  irc_fin_view: array of integer;
  new_atomoutel: array of array of string;

implementation
uses Unit1,Unit3,Unit24,Unit6,Unit42,Unit43,Unit37,Unit44,Unit49,Unit70;

{$R *.dfm}

procedure TForm36.CMDialogKey(var Msg: TWMKEY);
var Res1,Res2,Res3: integer;
key: Word;
Shift: TShiftState;
State: TKeyboardState;
begin
Form36.SetFocus;
Form36.SetFocusedControl(Form36);
GetKeyBoardState(State);
Res1:=(State[vk_control] and 128);
if Res1<>0 then Shift:=[ssCtrl];
Res2:=(State[vk_shift] and 128);
if Res2<>0 then Shift:=[ssShift];
Res3:=(State[vk_menu] and 128);
if Res3<>0 then Shift:=[ssAlt];
  if (ActiveControl is TCheckBox)  and  not (ssCtrl in Shift) and
    ((Msg.Charcode = 37) or (Msg.Charcode = 38) or (Msg.Charcode = 39) or (Msg.Charcode = 40)) then
  begin
 Form36.Focused;
 key:=Msg.Charcode;
 Form36.FormKeyDown(Self,key,shift);
  end;
  if (ActiveControl is TCheckBox)  and (ssCtrl in Shift) and
    ((Msg.Charcode = 37) or (Msg.Charcode = 38) or (Msg.Charcode = 39) or (Msg.Charcode = 40)) then
  begin
 Form36.Focused;
 key:=Msg.Charcode;
 Form36.FormKeyDown(Self,key,shift);
  end;
  inherited;
end;



procedure TForm36.PaintBox1Paint(Sender: TObject);
var i,j,scr_x_max,scr_y_max,scr_z_max,scr_x_min,scr_y_min,scr_z_min,s,p,el_count,l,v,m,t,y20,decart_show,i2,i3,rot_: integer;
rad1,rad2,x20,axis_length,mxn: real;
scr_x1,scr_y1,scr_z1,scr_z_tmp: array of integer;
X3dz,Y3dz,Z3dz,X_1_z,Y_1_z,Z_1_z: array of real;
cn: array[0..6] of integer;
E: array of string;
bond_find,center_find: boolean;
min: word;
X_tmp1,Y_tmp1,Z_tmp1,X_tmp1_out,Y_tmp1_out,Z_tmp1_out: array of Double;
label 1,2,8,9,10,3,25,26,40,50,100,101,102,103,104,1000,1010,1020,1030,1040,841,842;
// scr_x,scr_y,scr_z - экранные координаты, соответствующие атомным x(xout),y(yout) и z(zout)
// scr_x_max,scr_y_max,scr_z_max - экранные координаты крайних точек (для определения позиционирования)
// scr_x_min,scr_y_min,scr_z_min - экранные координаты крайних точек (для определения позиционирования)
// x_max,y_max,z_max - наибольшие и наименьшие значения координат для вычисления scr_x_max,scr_y_max,scr_z_max
// и scr_x_min,scr_y_min,scr_z_min


begin

  Rx_show_view:=nil;                                       //  ########################################
  irc_fin_view:=nil;
  Rx_show:=nil;                                       //  ########################################
  irc_fin:=nil;
  new_atom_store:=nil;

if dial=true then begin
if (x_tr<>nil) and (y_tr<>nil) and (z_tr<>nil) then begin
  if x_draw<>nil then if x_draw[length(x_draw)-1]='' then min:=2 else min:=1;
if trxyz=nil then setlength(trxyz,1);
ti:=0;
if (x<>nil) and (y<>nil) and (z<>nil) then  goto 40;
if (xout<>nil) and (yout<>nil) and (zout<>nil) then  goto 50;
end;
if (x<>nil) and (y<>nil) and (z<>nil) then begin


if trxyz=nil then setlength(trxyz,1);

if x[length(x)-1]='' then min:=2 else min:=1;

x_draw:=nil;
y_draw:=nil;
z_draw:=nil;
ti:=0;

40:
////*****************************************AXIS  *****   AXIS ****  AXIS ***************************************
////**************************************************************************************************************
////**************************************************************************************************************
////**************************************************************************************************************

///////////////////////////////////////////////////////////////////AXISES
decart_show:=4;
if atom_store[Length(atom_store)-1]='' then SetLength(new_atom_store,Length(atom_store)+4)
else SetLength(new_atom_store,Length(atom_store)+5);
for i2:=0 to Length(atom_store)-1  do
new_atom_store[i2]:=atom_store[i2];

new_atom_store[Length(new_atom_store)-5]:='Oaxis';
new_atom_store[Length(new_atom_store)-4]:='Xaxis';
new_atom_store[Length(new_atom_store)-3]:='Yaxis';
new_atom_store[Length(new_atom_store)-2]:='Zaxis';

////////////////////////////////////////////////////////////////////////
if (x_tr<>nil) and (y_tr<>nil) and (z_tr<>nil) then begin
//Присвоили координатам _draw молекулярные координаты, с ними и работаем
if x[length(x)-1]='' then begin
setlength(x_draw,length(x)*length(x_tr)*length(y_tr)*length(z_tr)-2*(length(x_tr)*length(y_tr)*length(z_tr)-1)+decart_show);   // AXISES adding
setlength(y_draw,length(y)*length(x_tr)*length(y_tr)*length(z_tr)-2*(length(x_tr)*length(y_tr)*length(z_tr)-1)+decart_show);   // AXISES adding
setlength(z_draw,length(z)*length(x_tr)*length(y_tr)*length(z_tr)-2*(length(x_tr)*length(y_tr)*length(z_tr)-1)+decart_show);   // AXISES adding
end
else begin
setlength(x_draw,(length(x)+1)*(length(x_tr))*(length(y_tr))*(length(z_tr))-2*((length(x_tr))*(length(y_tr))*(length(z_tr))-1)+decart_show);   // AXISES adding
setlength(y_draw,(length(y)+1)*(length(x_tr))*(length(y_tr))*(length(z_tr))-2*((length(x_tr))*(length(y_tr))*(length(z_tr))-1)+decart_show);   // AXISES adding
setlength(z_draw,(length(z)+1)*(length(x_tr))*(length(y_tr))*(length(z_tr))-2*((length(x_tr))*(length(y_tr))*(length(z_tr))-1)+decart_show);   // AXISES adding
end;


SetLength(X_tmp1,Length(x_draw));
SetLength(Y_tmp1,Length(y_draw));
SetLength(Z_tmp1,Length(z_draw));
for i2:=0 to Length(x_draw)-1 do
if x_draw[i2]<>'' then X_tmp1[i2]:=StrToFloat(x_draw[i2]);
for i2:=0 to Length(y_draw)-1 do
if y_draw[i2]<>'' then Y_tmp1[i2]:=StrToFloat(y_draw[i2]);
for i2:=0 to Length(z_draw)-1 do
if z_draw[i2]<>'' then Z_tmp1[i2]:=StrToFloat(z_draw[i2]);

mxn:=MaxValue(x_tmp1)-MinValue(x_tmp1);
if mxn<MaxValue(y_tmp1)-MinValue(y_tmp1) then mxn:=MaxValue(y_tmp1)-MinValue(y_tmp1);
if mxn<MaxValue(z_tmp1)-MinValue(z_tmp1) then mxn:=MaxValue(z_tmp1)-MinValue(z_tmp1);
Axis_length:=mxn*0.5;


//if ((MaxValue(x_tmp1)-MinValue(x_tmp1))>(MaxValue(y_tmp1)-MinValue(y_tmp1))) and ((MaxValue(x_tmp1)-MinValue(x_tmp1))>(MaxValue(z_tmp1)-MinValue(z_tmp1))) then Axis_length:=(MaxValue(x_tmp1)-MinValue(x_tmp1))*0.5;   //
//if ((MaxValue(y_tmp1)-MinValue(y_tmp1))>(MaxValue(x_tmp1)-MinValue(x_tmp1))) and ((MaxValue(y_tmp1)-MinValue(y_tmp1))>(MaxValue(z_tmp1)-MinValue(z_tmp1))) then Axis_length:=(MaxValue(y_tmp1)-MinValue(y_tmp1))*0.5;
//if ((MaxValue(z_tmp1)-MinValue(z_tmp1))>(MaxValue(y_tmp1)-MinValue(y_tmp1))) and ((MaxValue(z_tmp1)-MinValue(z_tmp1))>(MaxValue(x_tmp1)-MinValue(x_tmp1))) then Axis_length:=(MaxValue(z_tmp1)-MinValue(z_tmp1))*0.5;
goto 841;
end;



//Присвоили координатам _draw молекулярные координаты, с ними и работаем
setlength(x_draw,length(x)+decart_show);   // AXISES adding
setlength(y_draw,length(x)+decart_show);   // AXISES adding
setlength(z_draw,length(x)+decart_show);   // AXISES adding
for i:=1 to length(x)-min do begin
x_draw[i]:=x[i];
y_draw[i]:=y[i];
z_draw[i]:=z[i];
end;


SetLength(X_tmp1,Length(x));
SetLength(Y_tmp1,Length(y));
SetLength(Z_tmp1,Length(z));
for i2:=0 to Length(x)-1 do
if x[i2]<>'' then X_tmp1[i2]:=StrToFloat(x[i2]);
for i2:=0 to Length(y)-1 do
if y[i2]<>'' then Y_tmp1[i2]:=StrToFloat(y[i2]);
for i2:=0 to Length(z)-1 do
if z[i2]<>'' then Z_tmp1[i2]:=StrToFloat(z[i2]);


mxn:=MaxValue(x_tmp1)-MinValue(x_tmp1);
if mxn<MaxValue(y_tmp1)-MinValue(y_tmp1) then mxn:=MaxValue(y_tmp1)-MinValue(y_tmp1);
if mxn<MaxValue(z_tmp1)-MinValue(z_tmp1) then mxn:=MaxValue(z_tmp1)-MinValue(z_tmp1);
Axis_length:=mxn*0.5;


//if ((MaxValue(x_tmp1)-MinValue(x_tmp1))>(MaxValue(y_tmp1)-MinValue(y_tmp1))) and ((MaxValue(x_tmp1)-MinValue(x_tmp1))>(MaxValue(z_tmp1)-MinValue(z_tmp1))) then Axis_length:=(MaxValue(x_tmp1)-MinValue(x_tmp1))*0.5;   //
//if ((MaxValue(y_tmp1)-MinValue(y_tmp1))>(MaxValue(x_tmp1)-MinValue(x_tmp1))) and ((MaxValue(y_tmp1)-MinValue(y_tmp1))>(MaxValue(z_tmp1)-MinValue(z_tmp1))) then Axis_length:=(MaxValue(y_tmp1)-MinValue(y_tmp1))*0.5;
//if ((MaxValue(z_tmp1)-MinValue(z_tmp1))>(MaxValue(y_tmp1)-MinValue(y_tmp1))) and ((MaxValue(z_tmp1)-MinValue(z_tmp1))>(MaxValue(x_tmp1)-MinValue(x_tmp1))) then Axis_length:=(MaxValue(z_tmp1)-MinValue(z_tmp1))*0.5;

 //МОжно установить постоянную длину для осей координат, например при выборе полязователя...
 //Например axis_length:=1 или 2 ... можно слайдер сделать с длинами от 1 до 10, например


 841:
//p:=0;
//for s:=1 to 5 do
//if (x_draw[length(x_draw)-s]<>'') and  (y_draw[length(y_draw)-s]<>'')  then p:=p+1;
//SetLength(x_draw,Length(x_draw)+p);
//SetLength(y_draw,Length(y_draw)+p);
//SetLength(z_draw,Length(z_draw)+p);
//SetLength(new_atom_store,length(x_draw));
//end;
if (x_draw[length(x_draw)-5]<>'') and (x_draw[length(x_draw)-4]='') then SetLength(x_draw,Length(x_draw)+1);
if (y_draw[length(y_draw)-5]<>'') and (y_draw[length(y_draw)-4]='') then SetLength(y_draw,Length(y_draw)+1);
if (z_draw[length(z_draw)-5]<>'') and (y_draw[length(y_draw)-4]='') then SetLength(z_draw,Length(z_draw)+1);


if decart_show=4 then begin       ////////////////////////////////////// AXISES adding
x_draw[length(x_draw)-5]:='0';
y_draw[length(y_draw)-5]:='0';
z_draw[length(Z_draw)-5]:='0';
x_draw[length(x_draw)-4]:=FloatToStr(axis_length);           
y_draw[length(y_draw)-4]:='0';
z_draw[length(Z_draw)-4]:='0';
x_draw[length(x_draw)-3]:='0';
y_draw[length(y_draw)-3]:=FloatToStr(axis_length);
z_draw[length(Z_draw)-3]:='0';
x_draw[length(x_draw)-2]:='0';
y_draw[length(y_draw)-2]:='0';
z_draw[length(Z_draw)-2]:=FloatToStr(axis_length);
end;                             //////////////////////////////////////// AXISES adding

////**************************************************************************************************************
////**************************************************************************************************************
////**************************************************************************************************************
////**************************************************************************************************************






//40:
//Если координаты уже были вычислены после трансформации, то в качестве исходных берутся трансформированные
if (x_1<>nil) and (y_1<>nil) and (z_1<>nil) then begin      //координаты, исходные сохранены в переменных

for i:=1 to length(x_draw)-min do begin                            //native_x,native_y,...
x_draw[i]:=floattostr(x_1[i]);
y_draw[i]:=floattostr(y_1[i]);
z_draw[i]:=floattostr(z_1[i]);
end;
end;   //}






//end;






//1. Поиск наибольшего и наименьшего значения X,Y и Z:
x_min:=100000000;
x_max:=-100000000;
for i:=1 to length(x_draw)-min-4 do begin           // -4 чтобы не учитывать фиктивные координаты
if x_min>=strtofloat(x_draw[i]) then x_min:=strtofloat(x_draw[i]);   // минимум
if x_max<=strtofloat(x_draw[i]) then x_max:=strtofloat(x_draw[i]);   // максимум
end;
//Y:
y_min:=100000000;
y_max:=-100000000;
for i:=1 to length(y_draw)-min-4 do begin      // -4 чтобы не учитывать фиктивные координаты
if y_min>=strtofloat(y_draw[i]) then y_min:=strtofloat(y_draw[i]);   // минимум
if y_max<=strtofloat(y_draw[i]) then y_max:=strtofloat(y_draw[i]);   // максимум
end;
//Z:
z_min:=100000000;
z_max:=-100000000;
for i:=1 to length(z_draw)-min-4 do begin    // -4 чтобы не учитывать фиктивные координаты
if z_min>=strtofloat(z_draw[i]) then z_min:=strtofloat(z_draw[i]);   // минимум
if z_max<=strtofloat(z_draw[i]) then z_max:=strtofloat(z_draw[i]);   // максимум
end;


//Поиск наименьшего и наибольшего значения из трех координат
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
min_abs:=100000000;
if min_abs>x_min then min_abs:=x_min;
if min_abs>y_min then min_abs:=y_min;
if min_abs>z_min then min_abs:=z_min;
max_abs:=-100000000;
if max_abs<x_max then max_abs:=x_max;
if max_abs<y_max then max_abs:=y_max;
if max_abs<z_max then max_abs:=z_max;
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////


//теперь находим центр вращения молекулы - как середину между максимумом
//и минимумом
if (xinv=0) and (yinv=0) and (zinv=0) then begin     //если молекула уже была отображена, то центры вращения также были
xinv:=(x_min+x_max)/2;                               //рассчитаны. При вращении они могут немного сбиваться, поэтому
yinv:=(y_min+y_max)/2;                               //их надо запомнить после первого определения
zinv:=(z_min+z_max)/2;
end;


      //Находим масштабирующий множитель, отступив от краев экрана А и В
      //сами задали А и В, расстояние до краев формы
A:=round(PaintBox1.Width*scale_panorama);
B:=round(PaintBox1.Height*scale_panorama);
scr_x_min:=A;
scr_x_max:=PaintBox1.Width-A;
scr_y_max:=PaintBox1.Height-B;
scr_y_min:=B;
if D1=0 then D1:=max_abs-min_abs;
if scal<>0 then goto 1;
if abs((scr_x_max-scr_x_min)/(max_abs-min_abs))<=abs((scr_y_max-scr_y_min)/(max_abs-min_abs)) then
scal:=(scr_x_max-scr_x_min)/D1
else scal:=(scr_y_max-scr_y_min)/D1;

1:
for i:=1 to length(x_draw)-2 do begin
setlength(scr_x,i+2);
setlength(scr_y,i+2);
setlength(scr_z,i+2);
scr_x[i]:= PaintBox1.Width div 2 + round((strtofloat(x_draw[i])-xinv)*scal);
scr_y[i]:= PaintBox1.Height div 2  + round((strtofloat(y_draw[i])-yinv)*scal);
scr_z[i]:= round(strtofloat(z_draw[i])*scal);
end;















// Смещаем все координаты относительно оси инверсии, т.е. точки с координатами xinv, yinv и zinv
// т.е. переносим в начало координат окна
for i:=1 to length(y_draw)-2 do begin
setlength(scr_x1,i+2);
setlength(scr_y1,i+2);
setlength(scr_z1,i+2);
scr_x1[i]:=scr_x[i]-round(PaintBox1.Width/2);
scr_y1[i]:=scr_y[i]-round(PaintBox1.Height/2);
scr_z1[i]:=scr_z[i]-round(zinv*scal);
end;

//Аналогично для нативных координат: перенесли в центр OXY
//Это делается для того, чтобы манипулировать новыми нативными координатами.
for i:=1 to length(y_draw)-2 do begin
setlength(x_1,i+2);
setlength(y_1,i+2);
setlength(z_1,i+2);
x_1[i]:=strtofloat(x_draw[i])-xinv;
y_1[i]:=strtofloat(y_draw[i])-yinv;
z_1[i]:=strtofloat(z_draw[i])-zinv;
end;   //}




//Поворачиваем новую систему координат на угол angle
for i:=1 to length(z_draw)-2 do begin
setlength(X3dz,i+2);
setlength(Y3dz,i+2);
setlength(Z3dz,i+2);
//Инициализация массива нативных координат после преобразования
setlength(X_1_z,i+2);
setlength(Y_1_z,i+2);
setlength(Z_1_z,i+2);



//Поворот для экранных координат
X3dz[i]:=scr_x1[i]*cos(angley*pi/180)*cos(anglez*pi/180)+scr_y1[i]*sin(anglez*pi/180)*cos(angley*pi/180)- scr_z1[i]*sin(angley*pi/180) ;
Y3dz[i]:=scr_x1[i]*(sin(angley*pi/180)*sin((anglex+180)*pi/180)*cos(anglez*pi/180) - cos((anglex+180)*pi/180)*sin(anglez*pi/180))  +  scr_y1[i]*(sin((anglex+180)*pi/180)*sin(angley*pi/180)*sin(anglez*pi/180) + cos((anglex+180)*pi/180)*cos(anglez*pi/180)) + scr_z1[i]*sin((anglex+180)*pi/180)*cos(angley*pi/180) ;
Z3dz[i]:=scr_x1[i]*(cos(anglez*pi/180)*cos((anglex+180)*pi/180)*sin(angley*pi/180)+sin((anglex+180)*pi/180)*sin(anglez*pi/180)) + scr_y1[i]*(cos((anglex+180)*pi/180)*sin(angley*pi/180)*sin(anglez*pi/180) - sin((anglex+180)*pi/180)*cos(anglez*pi/180))  + scr_z1[i]*cos((anglex+180)*pi/180)*cos(angley*pi/180) ;

//Поворот для нативных координат
X_1_z[i]:=x_1[i]*cos(angley*pi/180)*cos(anglez*pi/180)+y_1[i]*sin(anglez*pi/180)*cos(angley*pi/180)- z_1[i]*sin(angley*pi/180) ;
Y_1_z[i]:=x_1[i]*(sin(angley*pi/180)*sin(anglex*pi/180)*cos(anglez*pi/180) - cos(anglex*pi/180)*sin(anglez*pi/180))  +  y_1[i]*(sin(anglex*pi/180)*sin(angley*pi/180)*sin(anglez*pi/180) + cos(anglex*pi/180)*cos(anglez*pi/180)) + z_1[i]*sin(anglex*pi/180)*cos(angley*pi/180) ;
Z_1_z[i]:=x_1[i]*(cos(anglez*pi/180)*cos(anglex*pi/180)*sin(angley*pi/180)+sin(anglex*pi/180)*sin(anglez*pi/180)) + y_1[i]*(cos(anglex*pi/180)*sin(angley*pi/180)*sin(anglez*pi/180) - sin(anglex*pi/180)*cos(anglez*pi/180))  + z_1[i]*cos(anglex*pi/180)*cos(angley*pi/180) ;











// Возвращаем систему координат - делаем обратное смещение
scr_x[i]:=round(X3dz[i])+round(PaintBox1.Width/2);
scr_y[i]:=round(Y3dz[i])+round(PaintBox1.Height/2);
scr_z[i]:=round(Z3dz[i])+round(zinv*scal);


//Также возвращаем нативные координаты на место:
x_1[i]:=X_1_z[i] + xinv;
y_1[i]:=Y_1_z[i] + yinv;
z_1[i]:=Z_1_z[i] + zinv;

end; // все повернули, теперь прорисовываем цвета и прочее.

//Определяем порядок прорисовки атомов - в порядке возрастания Z
//чтобы сымитировать глубину
setlength(scr_z_tmp,length(scr_z)-2);
for i:=1 to length(scr_z)-2 do
scr_z_tmp[i-1]:=scr_z[i];


//begin
for i:=0 to length(scr_z_tmp)-2 do begin
for j:=i+1 to length(scr_z_tmp)-1 do begin
if scr_z_tmp[i]>=scr_z_tmp[j] then begin
//showmessage(inttostr(length(scr_z_tmp)[i])+'>='+inttostr(a[j]));
l:=scr_z_tmp[j];
scr_z_tmp[j]:=scr_z_tmp[i];
scr_z_tmp[i]:=l;
end;
end;
end;





l:=0;
for i:=0 to length(scr_z_tmp)-1 do begin
for j:=1 to length(scr_z)-2 do  begin
if (scr_z_tmp[i]=scr_z[j])then begin
if (i>0) and (scr_z_tmp[i]=scr_z_tmp[i-1]) then break;
setlength(order_z,l+1);
order_z[l]:=j;
l:=l+1;
end;
end;
end;











setlength(E,length(order_z)+2);
setlength(colour_atom,length(order_z)+2);
setlength(Red,length(order_z)+2);
setlength(Green,length(order_z)+2);
setlength(Blue,length(order_z)+2);


 {if Length(center)>=2 then begin
 ShowMessage(center[1]);
 ShowMessage(center[2]);
 end; }


for i:=1 to length(scr_z)-2 do begin


E[order_z[i-1]]:='';
for p:=1 to length(new_atom_store[order_z[i-1]]) do begin
if new_atom_store[order_z[i-1]][p] in ['A'..'Z','a'..'z'] then E[order_z[i-1]]:=E[order_z[i-1]]+new_atom_store[order_z[i-1]][p] //центры могут быть типа Mg1, Br_1,...
else break;
end;
center_find:=false;
//Идентифицируем атомные центры (сравниваем прочитаные атомы с центрами из параметрического файла)
for s:=2 to length(center)-1 do begin
if E[order_z[i-1]]=center[s-1] then begin
center_find:=true;     //центр нашелся в параметрическом файле
break;  //как только нашли совпадение - обрываем цикл
end;
end;
if center_find=false then begin         //в молекуле найден такой центр, которого нет в параметрическом файле
colour[s-1]:='(20,20,20)';
radius[s-1]:='1.00';
end;



//цвет атома

if bonds_painted=false then begin
colour_atom[order_z[i-1]]:=copy(colour[s-1],2,length(colour[s-1])-2);   //цвет атома без скобок из параметрического файла
cn[1]:=0;
cn[2]:=0;
cn[3]:=0;
cn[4]:=0;
cn[5]:=0;
cn[6]:=0;
for p:=1 to length(colour_atom[order_z[i-1]]) do begin
if (copy(colour_atom[order_z[i-1]],p,1)=' ') or  (copy(colour_atom[order_z[i-1]],p,1)=',') then cn[1]:=cn[1]+1         //пробелы до элемента
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+p,1)<>' ') and  (copy(colour_atom[order_z[i-1]],cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //Red
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+p,1)=' ') or  (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы R-G
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //Green
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1   //пробелы G-B
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //Blue
else break;
end;
//Раскладываем R,G,B на составляющие
//setlength(Red,i+1);
//setlength(Green,i+1);
//setlength(Blue,i+1);
//if Qcolor=nil then begin   // заряды (цвета атомов в соответствии с зарядами - Unit64)
Red[order_z[i-1]]:= strtoint(copy(colour_atom[order_z[i-1]],cn[1]+1,cn[2]));   //Red
Green[order_z[i-1]]:= strtoint(copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+1,cn[4]));    //Green
Blue[order_z[i-1]]:= strtoint(copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]));   //Blue

end;



//Задаем цвет кисти - наполнения "шариков" (атомов)
//PaintBox1.Canvas.Brush.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);
//PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);
//PaintBox1.Canvas.Pen.Width:=1;

//PaintBox1.Canvas.Pen.Color:=RGB(Red[i],Green[i],Blue[i]);
//отрисовываем сами шарики с учетом радиуса
//PaintBox1.Canvas.Ellipse(scr_x[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translaty,scr_x[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translaty);




//PaintBox1.Canvas.Brush.Style := bsClear;



//Прорисовываем связи. Связи надо прорисовывать с учетом межатомных расстояний - порога
//который записан в параметрический файл
PaintBox1.Canvas.Pen.Width:=2;     //толщина связей
if i>=2 then begin    // начинаем анализировать связи в обратном порядке 2-1, 3-2, 3-1 и проч.
bond_find:=false;     // bond_find - флаг для определения нашлось ли что-то в параметрическом файле (связь)
for s:=1 to i-1 do begin
bond_find:=false;

if bonds_painted=true then begin
for t:=0 to length(are_bonds)-4 do  begin  //-4 - потому что последние 3 связи - фиктивные - это точки координатной системы
//Добавим модель слоев
if Layers<> nil then begin
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='high')   and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='high')   then  PaintBox1.Canvas.Pen.Width:=2;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='middle') and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='high')   and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='middle') and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='high')   then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='low')    and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='high')   then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='high')   and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='low')    and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='low')    and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='middle') then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='middle') and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='empty')  or  (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='empty')  then  goto 100;     //толщина связей
end;
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked)  then PaintBox1.Canvas.Pen.Color:=RGB(Red[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))],Green[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))],Blue[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]);       //Цвет связи
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked)  then PaintBox1.Canvas.MoveTo(scr_x[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+translatx,scr_y[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+translaty);
//showmessage(copy(are_bonds[t],pos('-',are_bonds[t]),4));
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked)  then PaintBox1.Canvas.LineTo( round((scr_x[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+ scr_x[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))])/2)+translatx ,   round((scr_y[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+scr_y[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))])/2)+translaty);
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked)  then PaintBox1.Canvas.Pen.Color:=RGB(Red[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))],Green[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))],Blue[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]);       //Цвет связи
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked)  then PaintBox1.Canvas.MoveTo( round((scr_x[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+ scr_x[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))])/2)+translatx ,   round((scr_y[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+scr_y[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))])/2)+translaty);
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked)  then PaintBox1.Canvas.LineTo(scr_x[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]+translatx,scr_y[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]+translaty);
100:
end;
if Form42.CheckBox5.Checked then begin   // убираем-добавляем "связи" между осями если оси не запрошены
for t:=length(are_bonds)-3 to length(are_bonds)-1 do  begin  // for AXIS painting
PaintBox1.Canvas.Pen.Color:=RGB(0,0,0);
PaintBox1.Canvas.Pen.Width:=2;
PaintBox1.Canvas.MoveTo(scr_x[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+translatx,scr_y[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+translaty);
PaintBox1.Canvas.LineTo(scr_x[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]+translatx,scr_y[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]+translaty);
end;
end;
goto 26;
end;









for p:=1 to length(bond_type)-1 do  begin
if ((E[order_z[i-1]]+'-'+E[order_z[i-1-s]]=bond_type[p]) or (E[order_z[i-1-s]]+'-'+E[order_z[i-1]]=bond_type[p])) and (Pos('axis',E[order_z[i-1-s]]+E[order_z[i-1]])=0) then begin
bond_find:=true;            //связь в параметрическом файле найдена
//Описание случая, когда связь есть в параметрическом файле (задан тип), а значение не стоит
rad1:=0;
rad2:=0;
if thresh1[p]='' then begin
for el_count:=1 to 100 do begin
if E[order_z[i-1-s]]=center[el_count] then rad1:=strtofloat(radius[el_count]);      //радиус первого элемента
if E[order_z[i-1]]=center[el_count] then rad2:=strtofloat(radius[el_count]);        //радиус второго элемента
if (rad1<>0) and (rad2<>0) then thresh1[p]:= floattostr(strtofloat(radius[el_count])*1.1+ strtofloat(radius[el_count+s-1])*1.1);  //формула для рассчета длины связи (порога)
if thresh1[p]<>'' then break;
end;
end;

if sqrt(sqr(strtofloat(x_draw[order_z[i-1]])-strtofloat(x_draw[order_z[i-1-s]]))+sqr(strtofloat(y_draw[order_z[i-1]])-strtofloat(y_draw[order_z[i-1-s]]))+sqr(strtofloat(z_draw[order_z[i-1]])-strtofloat(z_draw[order_z[i-1-s]])))<=strtofloat(thresh1[p]) then  begin
//слои...
if Layers<> nil then begin
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=2;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='empty')  or  (Layers[order_z[i-1-s]-1]='empty')  then  goto 101;     //толщина связей
end;

if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);       //Цвет связи
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo(scr_x[order_z[i-1]]+translatx,scr_y[order_z[i-1]]+translaty);
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo( round((scr_x[order_z[i-1]]+ scr_x[order_z[i-1-s]])/2)+translatx ,   round((scr_y[order_z[i-1]]+scr_y[order_z[i-1-s]])/2)+translaty);
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1-s]],Green[order_z[i-1-s]],Blue[order_z[i-1-s]]);       //Цвет связи
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo( round((scr_x[order_z[i-1]]+ scr_x[order_z[i-1-s]])/2)+translatx ,   round((scr_y[order_z[i-1]]+scr_y[order_z[i-1-s]])/2)+translaty);
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo(scr_x[order_z[i-1-s]]+translatx,scr_y[order_z[i-1-s]]+translaty);
101:
setlength(are_bonds,ti+1);
are_bonds[ti]:=inttostr(order_z[i-1])+'-'+inttostr(order_z[i-1-s]);
ti:=ti+1;
break;
end;
end;
end;

//Описание случая, когда связи (возможные) не описаны в параметрическом файле
if bond_find=false then begin        //если связь в параметрическом файле не найдена
rad1:=0;
rad2:=0;
if length(thresh1)<p+1 then setlength(thresh1,p+1);
thresh1[p]:='';
for el_count:=1 to 118 do begin
if E[order_z[i-1-s]]=center[el_count] then rad1:=strtofloat(radius[el_count]);      //радиус первого элемента
if E[order_z[i-1]]=center[el_count] then rad2:=strtofloat(radius[el_count]);        //радиус второго элемента
if (rad1<>0) and (rad2<>0) then  thresh1[p]:=FloatToStr((rad1+rad2)*1.1);                                                  //thresh1[p]:= floattostr(strtofloat(radius[el_count])*1.1+ strtofloat(radius[el_count+s-1])*1.1);  //формула для рассчета длины связи (порога) для атомов, которых нет в параметрическом файле
if thresh1[p]<>'' then break;    //как только какое-то значение получено выходим из цикла поиска
end;
end;
//Если центр - псевдоатом, то у него радиус неизвестен (берется не из параметрического файла), а принимается равным 1
if (thresh1[p]='') or (center_find=false) then begin
rad1:=0;
rad2:=1.00; //Радиус псевдо-атома условно приняли равным 1
for el_count:=1 to 118 do begin
if (E[order_z[i-1-s]]=center[el_count]) or (E[order_z[i-1]]=center[el_count]) then rad1:=strtofloat(radius[el_count]);      //радиус первого элемента
if (rad1<>0) and (rad2<>0) then thresh1[p]:= floattostr((strtofloat(radius[el_count])*1.2+ 1.0*1.2 )/2);  //формула для рассчета длины связи (порога) для атомов, которых нет в параметрическом файле
//  условие...   and (rad1<>0) берется для того, чтобы понять, что rad1 присвоилось какое-то значение, т.к. вначале мы его обнулили
if (thresh1[p]<>'') and (rad1<>0) then break;    //как только какое-то значение получено и rad1<>0 выходим из цикла поиска
end;
end;


if thresh1[p]='' then thresh1[p]:='2.00';   //редкий случай, когда несколько мнимых центров


if bond_find=false then begin   //теперь отрисовываем найденное
if Pos('axis',E[order_z[i-1-s]]+E[order_z[i-1]])=0 then begin
if sqrt(sqr(strtofloat(x_draw[order_z[i-1]])-strtofloat(x_draw[order_z[i-1-s]]))+sqr(strtofloat(y_draw[order_z[i-1]])-strtofloat(y_draw[order_z[i-1-s]]))+sqr(strtofloat(z_draw[order_z[i-1]])-strtofloat(z_draw[order_z[i-1-s]])))<=strtofloat(thresh1[p]) then  begin
//слои...
if Layers<> nil then begin
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=2;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='empty')  or  (Layers[order_z[i-1-s]-1]='empty')  then  goto 102;     //толщина связей
end;


if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);       //Цвет связи
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo(scr_x[order_z[i-1]]+translatx,scr_y[order_z[i-1]]+translaty);
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo( round((scr_x[order_z[i-1]]+ scr_x[order_z[i-1-s]])/2)+translatx ,   round((scr_y[order_z[i-1]]+scr_y[order_z[i-1-s]])/2)+translaty);
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1-s]],Green[order_z[i-1-s]],Blue[order_z[i-1-s]]);       //Цвет связи
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo( round((scr_x[order_z[i-1]]+ scr_x[order_z[i-1-s]])/2)+translatx ,   round((scr_y[order_z[i-1]]+scr_y[order_z[i-1-s]])/2)+translaty);
if (CheckBox2.Checked) or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo(scr_x[order_z[i-1-s]]+translatx,scr_y[order_z[i-1-s]]+translaty);
102:
setlength(are_bonds,ti+1);
are_bonds[ti]:=inttostr(order_z[i-1])+'-'+inttostr(order_z[i-1-s]);
ti:=ti+1;
end;
end;
end;
//bond_find:=true;


//if  are_bonds[i2]=IntToStr(Length(atom_store)-2)+






end;
//PaintBox1.Canvas.Brush.Style := bsSolid;

//PaintBox1.Canvas.Brush.Style := bsClear;
//PaintBox1.Canvas.TextOut(scr_x[i]-round(PaintBox1.Canvas.TextWidth(E[i])/2)+translatx,scr_y[i]-round(PaintBox1.Canvas.TextHeight(E[i])/2)+translaty,E[i]);


end;

//PaintBox1.Canvas.Font.Name:='Tahoma';
//PaintBox1.Canvas.Font.Size:=12;
//PaintBox1.Canvas.Brush.Style := bsClear;
//for i:=1 to nomer_atoma-1 do
//PaintBox1.Canvas.Brush.Color:=RGB(Red[i],Green[i],Blue[i]);
//PaintBox1.Canvas.TextOut(scr_x[i]-round(PaintBox1.Canvas.TextWidth(E[i])/2)+translatx,scr_y[i]-round(PaintBox1.Canvas.TextHeight(E[i])/2)+translaty,E[i]);
//PaintBox1.Canvas.Brush.Style := bsSolid;

//Символы и номера атомов в шариках
//PaintBox1.Canvas.Font.Name:='Tahoma';
//PaintBox1.Canvas.Font.Size:=15;
//PaintBox1.Canvas.TextOut(scr_x[i]-round(PaintBox1.Canvas.TextWidth(E[i])/2)+translatx,scr_y[i]-round(PaintBox1.Canvas.TextHeight(E[i])/2)+translaty,E[i]);



//отрисовываем сами шарики с учетом радиуса
//PaintBox1.Canvas.Pen.Color:=RGB(0,0,0);
//PaintBox1.Canvas.Ellipse(scr_x[i]-round(10*strtofloat(radius[s-1])),scr_y[i]-round(10*strtofloat(radius[s-1])),scr_x[i]+round(10*strtofloat(radius[s-1])),scr_y[i]+round(10*strtofloat(radius[s-1])));





end;


                           ///  инициализация (Первая прорисовка осей координат)
SetLength(are_bonds,Length(are_bonds)+3);
are_bonds[Length(are_bonds)-3]:=IntToStr(MaxIntValue(order_z)-2)+'-'+IntToStr(MaxIntValue(order_z)-3);
are_bonds[Length(are_bonds)-2]:=IntToStr(MaxIntValue(order_z)-1)+'-'+IntToStr(MaxIntValue(order_z)-3);
are_bonds[Length(are_bonds)-1]:=IntToStr(MaxIntValue(order_z))+'-'+IntToStr(MaxIntValue(order_z)-3);
if Form42.CheckBox5.Checked then begin
PaintBox1.Canvas.Pen.Color:=RGB(0,0,0);       //Цвет осей
PaintBox1.Canvas.Pen.Width:=2;
PaintBox1.Canvas.MoveTo(scr_x[MaxIntValue(order_z)-2]+translatx,scr_y[MaxIntValue(order_z)-2]+translaty);
PaintBox1.Canvas.LineTo(scr_x[MaxIntValue(order_z)-3]+translatx,scr_y[MaxIntValue(order_z)-3]+translaty);
PaintBox1.Canvas.MoveTo(scr_x[MaxIntValue(order_z)-1]+translatx,scr_y[MaxIntValue(order_z)-1]+translaty);
PaintBox1.Canvas.LineTo(scr_x[MaxIntValue(order_z)-3]+translatx,scr_y[MaxIntValue(order_z)-3]+translaty);
PaintBox1.Canvas.MoveTo(scr_x[MaxIntValue(order_z)]+translatx,scr_y[MaxIntValue(order_z)]+translaty);
PaintBox1.Canvas.LineTo(scr_x[MaxIntValue(order_z)-3]+translatx,scr_y[MaxIntValue(order_z)-3]+translaty);
end;



//end;
{

PaintBox1.Canvas.Font.Name:='Tahoma';
for i:=1 to nomer_atoma-1 do begin
for s:=1 to length(center)-1 do begin
if E[i]=center[s-1] then begin
center_find:=true;     //центр нашелся в параметрическом файле
break;  //как только нашли совпадение - обрываем цикл
end;
end;
if center_find=false then begin         //в молекуле найден такой центр, которого нет в параметрическом файле
colour[s-1]:='(200,200,200)';
radius[s-1]:='1.00';
end;                       }




{PaintBox1.Canvas.Font.Size:=round(6*strtofloat(radius[s-1])*scale_atom);
PaintBox1.Canvas.Brush.Color:=RGB(Red[i],Green[i],Blue[i]);
PaintBox1.Canvas.Brush.Style := bsClear;
PaintBox1.Canvas.TextOut(scr_x[i]-round(PaintBox1.Canvas.TextWidth(E[i])/2)+translatx,scr_y[i]-round(PaintBox1.Canvas.TextHeight(E[i])/2)+translaty,E[i]);
//PaintBox1.Canvas.Brush.Style := bsSolid;    }
//end;





//PaintBox1.Canvas.Brush.Style := bsClear;
//PaintBox1.Canvas.TextOut(scr_x[i]-round(PaintBox1.Canvas.TextWidth(E[i])/2)+translatx,scr_y[i]-round(PaintBox1.Canvas.TextHeight(E[i])/2)+translaty,E[i]);
//intBox1.Canvas.Brush.Style := bsSolid;
//end;
//PaintBox1.Canvas.Brush.Style := bsSolid;



//Теперь отрисовываем центры

26:

for i:=1 to length(scr_z)-2 do begin


E[order_z[i-1]]:='';
for p:=1 to length(new_atom_store[order_z[i-1]]) do begin
if new_atom_store[order_z[i-1]][p] in ['A'..'Z','a'..'z'] then E[order_z[i-1]]:=E[order_z[i-1]]+new_atom_store[order_z[i-1]][p] //центры могут быть типа Mg1, Br_1,...
else break;
end;
center_find:=false;
//Идентифицируем атомные центры (сравниваем прочитаные атомы с центрами из параметрического файла)
for s:=2 to length(center)-1 do begin
if E[order_z[i-1]]=center[s-1] then begin
center_find:=true;     //центр нашелся в параметрическом файле
break;  //как только нашли совпадение - обрываем цикл
end;
end;
if center_find=false then begin         //в молекуле найден такой центр, которого нет в параметрическом файле
colour[s-1]:='(20,20,20)';
radius[s-1]:='1.00';
end;
//Задаем цвет кисти - наполнения "шариков" (атомов)
PaintBox1.Canvas.Brush.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);
PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);
//PaintBox1.Canvas.Pen.Color:=RGB(0,0,0);
PaintBox1.Canvas.Pen.Width:=1;

//PaintBox1.Canvas.Pen.Color:=RGB(Red[i],Green[i],Blue[i]);
//отрисовываем сами шарики с учетом радиуса
if radius[s-1]='' then radius[s-1]:='0.0';


//слои...
if Layers<> nil then begin
  if order_z[i-1]<nomer_atoma then begin
if (Layers[order_z[i-1]-1]='empty')  or  (Layers[order_z[i-1]-1]='middle') or  (Layers[order_z[i-1]-1]='low') then  goto 103;
end;
end;




if ((CheckBox1.Checked) or (Form42.CheckBox1.Checked)) and ((pos('axis',E[order_z[i-1]])=0) and (E[order_z[i-1]]<>'')) then PaintBox1.Canvas.Ellipse(scr_x[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translaty,scr_x[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translaty);
103:
PaintBox1.Canvas.Font.Name:='Tahoma';



If ((Checkbox3.Checked) and (Checkbox4.Checked=False)) or ((Checkbox3.Checked=False) and (Checkbox4.Checked)) then begin
if (nomer_atoma<10) or ((length(z_tr))<10) then PaintBox1.Canvas.Font.Size:=round(7.0*strtofloat(radius[s-1])*scale_atom);
if ((nomer_atoma>=10) and (nomer_atoma<100)) or (((length(z_tr))>=10) and ((length(z_tr))<100)) then PaintBox1.Canvas.Font.Size:=round(6.5*strtofloat(radius[s-1])*scale_atom);
if ((nomer_atoma>=100) and (nomer_atoma<1000)) or (((length(z_tr))>=100) and ((length(z_tr))<1000)) then PaintBox1.Canvas.Font.Size:=round(6.0*strtofloat(radius[s-1])*scale_atom);
if (nomer_atoma>=1000) or ((length(z_tr))>=1000) then PaintBox1.Canvas.Font.Size:=round(5.5*strtofloat(radius[s-1])*scale_atom);
end;

If (Checkbox3.Checked) and (Checkbox4.Checked) then begin
if (nomer_atoma<10) or ((length(z_tr))<10) then PaintBox1.Canvas.Font.Size:=round(6.5*strtofloat(radius[s-1])*scale_atom);
if ((nomer_atoma>=10) and (nomer_atoma<100)) or (((length(z_tr))>=10) and ((length(z_tr))<100)) then PaintBox1.Canvas.Font.Size:=round(6.0*strtofloat(radius[s-1])*scale_atom);
if ((nomer_atoma>=100) and (nomer_atoma<1000)) or (((length(z_tr))>=100) and ((length(z_tr))<1000)) then PaintBox1.Canvas.Font.Size:=round(5.0*strtofloat(radius[s-1])*scale_atom);
if (nomer_atoma>=1000) or ((length(z_tr))>=1000) then PaintBox1.Canvas.Font.Size:=round(4.0*strtofloat(radius[s-1])*scale_atom);
end;



//if ((nomer_atoma-1)<10) or ((length(z_tr))<10) then PaintBox1.Canvas.Font.Size:=round(6.0*strtofloat(radius[s-1])*scale_atom);
//if (((nomer_atoma-1)>=10) and ((nomer_atoma-1)<100)) or (((length(z_tr))>=10) and ((length(z_tr))<100)) then PaintBox1.Canvas.Font.Size:=round(5.0*strtofloat(radius[s-1])*scale_atom);
//if (((nomer_atoma-1)>=100) and ((nomer_atoma-1)<1000)) or (((length(z_tr))>=100) and ((length(z_tr))<1000)) then PaintBox1.Canvas.Font.Size:=round(4.5*strtofloat(radius[s-1])*scale_atom);
//if ((nomer_atoma-1)>=1000) or ((length(z_tr))>=1000) then PaintBox1.Canvas.Font.Size:=round(3.5*strtofloat(radius[s-1])*scale_atom);

if CheckBox1.Checked  then begin  //подписи делаем, если включены атомы
if Layers<>nil then begin
if order_z[i-1]<nomer_atoma then begin
if (Layers[order_z[i-1]-1]='middle') or (Layers[order_z[i-1]-1]='low') or (Layers[order_z[i-1]-1]='empty') then goto 104;
end;
end;
if (((CheckBox3.Checked) and (CheckBox4.Checked=False)) or ((Form42.CheckBox3.Checked) and (Form42.CheckBox4.Checked=False)))  and (pos('axis',E[order_z[i-1]])=0)   then PaintBox1.Canvas.TextOut(scr_x[order_z[i-1]]-round(PaintBox1.Canvas.TextWidth(E[order_z[i-1]])/2)+translatx,scr_y[order_z[i-1]]-round(PaintBox1.Canvas.TextHeight(E[order_z[i-1]])/2)+translaty,E[order_z[i-1]]);
if (((CheckBox3.Checked=False) and (CheckBox4.Checked))  or ((Form42.CheckBox3.Checked=False) and (Form42.CheckBox4.Checked))) and (pos('axis',E[order_z[i-1]])=0)  then  PaintBox1.Canvas.TextOut(scr_x[order_z[i-1]]-round(PaintBox1.Canvas.TextWidth(inttostr(order_z[i-1]))/2)+translatx,scr_y[order_z[i-1]]-round(PaintBox1.Canvas.TextHeight(inttostr(order_z[i-1]))/2)+translaty,inttostr(order_z[i-1]));
if (((CheckBox3.Checked) and (CheckBox4.Checked))  or ((Form42.CheckBox3.Checked) and (Form42.CheckBox4.Checked))) and (pos('axis',E[order_z[i-1]])=0)  then PaintBox1.Canvas.TextOut(scr_x[order_z[i-1]]-round(PaintBox1.Canvas.TextWidth(inttostr(order_z[i-1])+E[order_z[i-1]])/2)+translatx,scr_y[order_z[i-1]]-round(PaintBox1.Canvas.TextHeight(inttostr(order_z[i-1])+E[order_z[i-1]])/2)+translaty,E[order_z[i-1]]+inttostr(order_z[i-1]));
104:
end;
//end;



 if Form42.CheckBox5.Checked then begin
 PaintBox1.Canvas.Brush.Style:=bsClear;    ///AXISES Adding
 //PaintBox1.Canvas.Brush.Color:=clBlack;
 PaintBox1.Canvas.Pen.Color:=clBlack;
 PaintBox1.Canvas.Font.Size:=12;
 PaintBox1.Canvas.Font.Name:='Tahoma';
PaintBox1.Canvas.TextOut(scr_x[MaxIntValue(order_z)-3]+translatx,scr_y[MaxIntValue(order_z)-3]+translaty,'O');
PaintBox1.Canvas.TextOut(scr_x[MaxIntValue(order_z)-2]+translatx,scr_y[MaxIntValue(order_z)-2]+translaty,'X');
PaintBox1.Canvas.TextOut(scr_x[MaxIntValue(order_z)-1]+translatx,scr_y[MaxIntValue(order_z)-1]+translaty,'Y');
PaintBox1.Canvas.TextOut(scr_x[MaxIntValue(order_z)-0]+translatx,scr_y[MaxIntValue(order_z)-0]+translaty,'Z');
end;



anglex:=0;
angley:=0;
anglez:=0;
bonds_painted:=true;
Form36.Caption:='Модель :: '+ Form1.OpenDialog1.FileName;
if identificator=1 then  Form36.StatusBar1.Panels[0].Text:='Cartesian';
if identificator=2 then  Form36.StatusBar1.Panels[0].Text:='Z-Matrix';
if identificator=3 then  Form36.StatusBar1.Panels[0].Text:='Cart/Z-Matrix';
Form36.StatusBar1.Panels[1].Text:='Цикл 0';
end;  //   if (x<>nil) and (y<>nil) and (z<>nil) then begin

end;

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////OUT//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////


if (xout<>nil) and (yout<>nil) and (zout<>nil)  then begin



if (Length(Rx)>1) and (Evolut=false) and (trxyz=nil)  then opt:=nomer_cycla-1;

if (escfreal<>nil) and (Evolut=False) and (trxyz=nil)  then begin
if (trj=0) and (trjn=0) then    opt:=nomer_cycla-1-constrain
else begin
opt:=nomer_cycla-start_of_new_trj[Form49.ComboBox2.ItemIndex]-1;
end;
x_1:=nil;
y_1:=nil;
z_1:=nil;                 //nc
scal:=0;
are_bonds:=nil;
bonds_painted:=false;
end;



if trxyz=nil then setlength(trxyz,1);

x_draw_out:=nil;
y_draw_out:=nil;
z_draw_out:=nil;
ti:=0;



50:

////*****************************************AXIS  *****   AXIS ****  AXIS ***************************************
////**************************************************************************************************************
////**************************************************************************************************************
////**************************************************************************************************************

///////////////////////////////////////////////////////////////////AXISES
decart_show:=4;
SetLength(new_atomoutel,Length(atomoutel),Length(atomoutel[0])+4);
for i2:=0 to Length(atomoutel)-1  do
for i3:=0 to Length(atomoutel[0])-1 do
new_atomoutel[i2,i3]:=atomoutel[i2,i3];

for i2:=0 to Length(new_atomoutel)-1 do begin
new_atomoutel[i2,Length(new_atomoutel[0])-5]:='Oaxis';
new_atomoutel[i2,Length(new_atomoutel[0])-4]:='Xaxis';
new_atomoutel[i2,Length(new_atomoutel[0])-3]:='Yaxis';
new_atomoutel[i2,Length(new_atomoutel[0])-2]:='Zaxis';
end;
////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////
if (x_tr<>nil) and (y_tr<>nil) and (z_tr<>nil) then begin
//Присвоили координатам _draw молекулярные координаты, с ними и работаем
setlength(x_draw_out,length(x_draw_out),length(xout[nc])*length(x_tr)*length(y_tr)*length(z_tr)-2*(length(x_tr)*length(y_tr)*length(z_tr)-1)+decart_show-1);   // AXISES adding
setlength(y_draw_out,length(y_draw_out),length(yout[nc])*length(x_tr)*length(y_tr)*length(z_tr)-2*(length(x_tr)*length(y_tr)*length(z_tr)-1)+decart_show-1);   // AXISES adding
setlength(z_draw_out,length(y_draw_out),length(zout[nc])*length(x_tr)*length(y_tr)*length(z_tr)-2*(length(x_tr)*length(y_tr)*length(z_tr)-1)+decart_show-1);   // AXISES adding
SetLength(X_tmp1,Length(x_draw_out[nc]));
SetLength(Y_tmp1,Length(y_draw_out[nc]));
SetLength(Z_tmp1,Length(z_draw_out[nc]));
for i2:=0 to Length(x_draw_out[nc])-1 do
if x_draw_out[nc,i2]<>'' then X_tmp1[i2]:=StrToFloat(x_draw_out[nc,i2]);
for i2:=0 to Length(y_draw_out[nc])-1 do
if y_draw_out[nc,i2]<>'' then Y_tmp1[i2]:=StrToFloat(y_draw_out[nc,i2]);
for i2:=0 to Length(z_draw_out[nc])-1 do
if z_draw_out[nc,i2]<>'' then Z_tmp1[i2]:=StrToFloat(z_draw_out[nc,i2]);


mxn:=MaxValue(x_tmp1)-MinValue(x_tmp1);
if mxn<MaxValue(y_tmp1)-MinValue(y_tmp1) then mxn:=MaxValue(y_tmp1)-MinValue(y_tmp1);
if mxn<MaxValue(z_tmp1)-MinValue(z_tmp1) then mxn:=MaxValue(z_tmp1)-MinValue(z_tmp1);
Axis_length:=mxn*0.5;

//if ((MaxValue(x_tmp1)-MinValue(x_tmp1))>(MaxValue(y_tmp1)-MinValue(y_tmp1))) and ((MaxValue(x_tmp1)-MinValue(x_tmp1))>(MaxValue(z_tmp1)-MinValue(z_tmp1))) then Axis_length:=(MaxValue(x_tmp1)-MinValue(x_tmp1))*0.5;   //
//if ((MaxValue(y_tmp1)-MinValue(y_tmp1))>(MaxValue(x_tmp1)-MinValue(x_tmp1))) and ((MaxValue(y_tmp1)-MinValue(y_tmp1))>(MaxValue(z_tmp1)-MinValue(z_tmp1))) then Axis_length:=(MaxValue(y_tmp1)-MinValue(y_tmp1))*0.5;
//if ((MaxValue(z_tmp1)-MinValue(z_tmp1))>(MaxValue(y_tmp1)-MinValue(y_tmp1))) and ((MaxValue(z_tmp1)-MinValue(z_tmp1))>(MaxValue(x_tmp1)-MinValue(x_tmp1))) then Axis_length:=(MaxValue(z_tmp1)-MinValue(z_tmp1))*0.5;
goto 842;
end;



SetLength(X_tmp1_out,Length(xout[0])*(nomer_cycla+1));
SetLength(Y_tmp1_out,Length(yout[0])*(nomer_cycla+1));
SetLength(Z_tmp1_out,Length(zout[0])*(nomer_cycla+1));
for i3:=0 to Length(xout)-1 do
for i2:=0 to Length(xout[0])-1 do
if xout[i3,i2]<>'' then X_tmp1_out[i2+i3*length(xout[0])]:=StrToFloat(xout[i3,i2]);

for i3:=0 to Length(yout)-1 do
for i2:=0 to Length(yout[0])-1 do
if yout[i3,i2]<>'' then Y_tmp1_out[i2+i3*length(yout[0])]:=StrToFloat(yout[i3,i2]);

for i3:=0 to Length(zout)-1 do
for i2:=0 to Length(zout[0])-1 do
if zout[i3,i2]<>'' then Z_tmp1_out[i2+i3*length(zout[0])]:=StrToFloat(zout[i3,i2]);

mxn:=MaxValue(x_tmp1_out)-MinValue(x_tmp1_out);
if mxn<MaxValue(y_tmp1_out)-MinValue(y_tmp1_out) then mxn:=MaxValue(y_tmp1_out)-MinValue(y_tmp1_out);
if mxn<MaxValue(z_tmp1_out)-MinValue(z_tmp1_out) then mxn:=MaxValue(z_tmp1_out)-MinValue(z_tmp1_out);
Axis_length:=mxn*0.5;



//if ((MaxValue(X_tmp1_out)-MinValue(X_tmp1_out))>(MaxValue(Y_tmp1_out)-MinValue(Y_tmp1_out))) and ((MaxValue(X_tmp1_out)-MinValue(X_tmp1_out))>(MaxValue(Z_tmp1_out)-MinValue(Z_tmp1_out))) then Axis_length:=(MaxValue(X_tmp1_out)-MinValue(X_tmp1_out))*0.5;   //
//if ((MaxValue(Y_tmp1_out)-MinValue(Y_tmp1_out))>(MaxValue(X_tmp1_out)-MinValue(X_tmp1_out))) and ((MaxValue(Y_tmp1_out)-MinValue(Y_tmp1_out))>(MaxValue(Z_tmp1_out)-MinValue(Z_tmp1_out))) then Axis_length:=(MaxValue(Y_tmp1_out)-MinValue(Y_tmp1_out))*0.5;
//if ((MaxValue(Z_tmp1_out)-MinValue(Z_tmp1_out))>(MaxValue(Y_tmp1_out)-MinValue(Y_tmp1_out))) and ((MaxValue(Z_tmp1_out)-MinValue(Z_tmp1_out))>(MaxValue(X_tmp1_out)-MinValue(X_tmp1_out))) then Axis_length:=(MaxValue(Z_tmp1_out)-MinValue(Z_tmp1_out))*0.5;





//842:

nc:=nomer_cycla-opt;

setlength(x_draw_out,nomer_cycla+1,nomer_atoma+1+decart_show);  //+decart_show - удлинение массива для фиктивных координат осей
setlength(y_draw_out,nomer_cycla+1,nomer_atoma+1+decart_show);
setlength(z_draw_out,nomer_cycla+1,nomer_atoma+1+decart_show);






if length(dx)=0 then setlength(dx,nomer_atoma+1+decart_show+1);
if length(dy)=0 then setlength(dy,nomer_atoma+1+decart_show+1);
if length(dz)=0 then setlength(dz,nomer_atoma+1+decart_show+1);
//for j:=1 to nomer_cycla do begin




for i:=1 to nomer_atoma do begin
if BBB=false then begin
dx[i]:=0;
dy[i]:=0;
dz[i]:=0;
end;
x_draw_out[nc][i]:=floattostr(strtofloat(xout[nc][i])+dx[i]);
y_draw_out[nc][i]:=floattostr(strtofloat(yout[nc][i])+dy[i]);
z_draw_out[nc][i]:=floattostr(strtofloat(zout[nc][i])+dz[i]);
end;
//end;

842:

if decart_show=4 then begin       ////////////////////////////////////// AXISES adding
x_draw_out[nc,length(x_draw_out[0])-4]:='0';
y_draw_out[nc,length(y_draw_out[0])-4]:='0';
z_draw_out[nc,length(z_draw_out[0])-4]:='0';
x_draw_out[nc,length(x_draw_out[0])-3]:=FloatToStr(axis_length);
y_draw_out[nc,length(y_draw_out[0])-3]:='0';
z_draw_out[nc,length(Z_draw_out[0])-3]:='0';
x_draw_out[nc,length(x_draw_out[0])-2]:='0';
y_draw_out[nc,length(y_draw_out[0])-2]:=FloatToStr(axis_length);
z_draw_out[nc,length(z_draw_out[0])-2]:='0';
x_draw_out[nc,length(x_draw_out[0])-1]:='0';
y_draw_out[nc,length(y_draw_out[0])-1]:='0';
z_draw_out[nc,length(z_draw_out[0])-1]:=FloatToStr(axis_length);
end;                             //////////////////////////////////////// AXISES adding

////**************************************************************************************************************
////**************************************************************************************************************
////**************************************************************************************************************
////**************************************************************************************************************





//50:
//Если координаты уже были вычислены после трансформации, то в качестве исходных берутся трансформированные
if (x_1<>nil) and (y_1<>nil) and (z_1<>nil) then begin
if length(dx)<>length(x_draw_out[nc]) then setlength(dx,length(x_draw_out[nc])+1);
if length(dy)<>length(y_draw_out[nc]) then setlength(dy,length(y_draw_out[nc])+1);
if length(dz)<>length(z_draw_out[nc]) then setlength(dz,length(z_draw_out[nc])+1);

      //координаты, исходные сохранены в переменных
for i:=1 to Length(x_draw_out[nc])-1 do begin                            //native_x,native_y,...
x_draw_out[nc][i]:=floattostr(x_1[i]+dx[i]);
y_draw_out[nc][i]:=floattostr(y_1[i]+dy[i]);
z_draw_out[nc][i]:=floattostr(z_1[i]+dz[i]);
end;
end;   //}




//1. Поиск наибольшего и наименьшего значения XOUT,YOUT и ZOUT:
x_min:=100000000;
x_max:=-100000000;
for i:=1 to Length(x_draw_out[nc])-1-4 do begin   // - 4 чтобы не учитывать фиктивные центры при позиционировании
if x_min>=strtofloat(x_draw_out[nc][i]) then x_min:=strtofloat(x_draw_out[nc][i]);   // минимум
if x_max<=strtofloat(x_draw_out[nc][i]) then x_max:=strtofloat(x_draw_out[nc][i]);   // максимум
end;
//Y:
y_min:=100000000;
y_max:=-100000000;
for i:=1 to Length(x_draw_out[nc])-1-4 do begin   // - 4 чтобы не учитывать фиктивные центры при позиционировании
if y_min>=strtofloat(y_draw_out[nc][i]) then y_min:=strtofloat(y_draw_out[nc][i]);   // минимум
if y_max<=strtofloat(y_draw_out[nc][i]) then y_max:=strtofloat(y_draw_out[nc][i]);   // максимум
end;
//Z:
z_min:=100000000;
z_max:=-100000000;
for i:=1 to Length(x_draw_out[nc])-1-4 do begin    // - 4 чтобы не учитывать фиктивные центры при позиционировании
if z_min>=strtofloat(z_draw_out[nc][i]) then z_min:=strtofloat(z_draw_out[nc][i]);   // минимум
if z_max<=strtofloat(z_draw_out[nc][i]) then z_max:=strtofloat(z_draw_out[nc][i]);   // максимум
end;


//Поиск наименьшего и наибольшего значения из трех координат
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
min_abs:=100000000;
if min_abs>x_min then min_abs:=x_min;
if min_abs>y_min then min_abs:=y_min;
if min_abs>z_min then min_abs:=z_min;
max_abs:=-100000000;
if max_abs<x_max then max_abs:=x_max;
if max_abs<y_max then max_abs:=y_max;
if max_abs<z_max then max_abs:=z_max;
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////


//теперь находим центр вращения молекулы - как середину между максимумом
//и минимумом
if (xinv=0) and (yinv=0) and (zinv=0) then begin     //если молекула уже была отображена, то центры вращения также были
xinv:=(x_min+x_max)/2;                               //рассчитаны. При вращении они могут немного сбиваться, поэтому
yinv:=(y_min+y_max)/2;                               //их надо запомнить после первого определения
zinv:=(z_min+z_max)/2;
end;






      //Находим масштабирующий множитель, отступив от краев экрана А и В
      //сами задали А и В, расстояние до краев формы
A:=round(PaintBox1.Width*scale_panorama);
B:=round(PaintBox1.Height*scale_panorama);
scr_x_min:=A;
scr_x_max:=PaintBox1.Width-A;
scr_y_max:=PaintBox1.Height-B;
scr_y_min:=B;
if D1=0 then
D1:=max_abs-min_abs;
if scal<>0 then goto 2;
if abs((scr_x_max-scr_x_min)/(max_abs-min_abs))<=abs((scr_y_max-scr_y_min)/(max_abs-min_abs)) then
scal:=(scr_x_max-scr_x_min)/D1
else scal:=(scr_y_max-scr_y_min)/D1;

2:
for i:=1 to Length(x_draw_out[nc])-1 do begin
setlength(scr_x,i+2);
setlength(scr_y,i+2);
setlength(scr_z,i+2);
scr_x[i]:= PaintBox1.Width div 2 + round((strtofloat(x_draw_out[nc][i])-xinv)*scal);
scr_y[i]:= PaintBox1.Height div 2  + round((strtofloat(y_draw_out[nc][i])-yinv)*scal);
scr_z[i]:= round(strtofloat(z_draw_out[nc][i])*scal);
end;




// Смещаем все координаты относительно оси инверсии, т.е. точки с координатами xinv, yinv и zinv
// т.е. переносим в начало координат окна
 for i:=1 to Length(x_draw_out[nc])-1 do begin
setlength(scr_x1,i+2);
setlength(scr_y1,i+2);
setlength(scr_z1,i+2);
scr_x1[i]:=scr_x[i]-round(PaintBox1.Width/2);
scr_y1[i]:=scr_y[i]-round(PaintBox1.Height/2);
scr_z1[i]:=scr_z[i]-round(zinv*scal);
end;

//Аналогично для нативных координат: перенесли в центр OXY
//Это делается для того, чтобы манипулировать новыми нативными координатами.
for i:=1 to Length(x_draw_out[nc])-1 do begin
setlength(x_1,i+2);
setlength(y_1,i+2);
setlength(z_1,i+2);
x_1[i]:=strtofloat(x_draw_out[nc][i])-xinv;
y_1[i]:=strtofloat(y_draw_out[nc][i])-yinv;
z_1[i]:=strtofloat(z_draw_out[nc][i])-zinv;
end;   //}



//Поворачиваем новую систему координат на угол angle
for i:=1 to Length(x_draw_out[nc])-1 do begin
setlength(X3dz,i+2);
setlength(Y3dz,i+2);
setlength(Z3dz,i+2);
//Инициализация массива нативных координат после преобразования
setlength(X_1_z,i+2);
setlength(Y_1_z,i+2);
setlength(Z_1_z,i+2);









if (Evolut=false) or (length(trxyz)<=1)  then goto 8;



for rot_:=1 to length(trxyz)-1 do begin
if Evolut=true then begin
if trxyz[rot_]<>'' then begin
if copy(trxyz[rot_],1,1)='X' then begin
ux:=strtoint(copy(trxyz[rot_],2,length(trxyz[rot_])-1));
uy:=0;
uz:=0;
end;
if copy(trxyz[rot_],1,1)='Y' then begin
ux:=0;
uy:=strtoint(copy(trxyz[rot_],2,length(trxyz[rot_])-1));
uz:=0;
end;
if copy(trxyz[rot_],1,1)='Z' then begin
ux:=0;
uy:=0;
uz:=strtoint(copy(trxyz[rot_],2,length(trxyz[rot_])-1));
end;
end
else begin
ux:=0;
uy:=0;
uz:=0;
end;
end;



//Поворот для экранных координат
8:
X3dz[i]:=scr_x1[i]*cos((angley+uy)*pi/180)*cos((anglez+uz)*pi/180)+scr_y1[i]*sin((anglez+uz)*pi/180)*cos((angley+uy)*pi/180)- scr_z1[i]*sin((angley+uy)*pi/180) ;
Y3dz[i]:=scr_x1[i]*(sin((angley+uy)*pi/180)*sin((anglex+180+ux)*pi/180)*cos((anglez+uz)*pi/180) - cos((anglex+180+ux)*pi/180)*sin((anglez+uz)*pi/180))  +  scr_y1[i]*(sin((anglex+180+ux)*pi/180)*sin((angley+uy)*pi/180)*sin((anglez+uz)*pi/180) + cos((anglex+180+ux)*pi/180)*cos((anglez+uz)*pi/180)) + scr_z1[i]*sin((anglex+180+ux)*pi/180)*cos((angley+uy)*pi/180) ;
Z3dz[i]:=scr_x1[i]*(cos((anglez+uz)*pi/180)*cos((anglex+180+ux)*pi/180)*sin((angley+uy)*pi/180)+sin((anglex+180+ux)*pi/180)*sin((anglez+uz)*pi/180)) + scr_y1[i]*(cos((anglex+180+ux)*pi/180)*sin((angley+uy)*pi/180)*sin((anglez+uz)*pi/180) - sin((anglex+180+ux)*pi/180)*cos((anglez+uz)*pi/180))  + scr_z1[i]*cos((anglex+180+ux)*pi/180)*cos((angley+uy)*pi/180) ;

//Поворот для нативных координат
X_1_z[i]:=x_1[i]*cos((angley+uy)*pi/180)*cos((anglez+uz)*pi/180)+y_1[i]*sin((anglez+uz)*pi/180)*cos((angley+uy)*pi/180)- z_1[i]*sin((angley+uy)*pi/180) ;
Y_1_z[i]:=x_1[i]*(sin((angley+uy)*pi/180)*sin((anglex+ux)*pi/180)*cos((anglez+uz)*pi/180) - cos((anglex+ux)*pi/180)*sin((anglez+uz)*pi/180))  +  y_1[i]*(sin((anglex+ux)*pi/180)*sin((angley+uy)*pi/180)*sin((anglez+uz)*pi/180) + cos((anglex+ux)*pi/180)*cos((anglez+uz)*pi/180)) + z_1[i]*sin((anglex+ux)*pi/180)*cos((angley+uy)*pi/180) ;
Z_1_z[i]:=x_1[i]*(cos((anglez+uz)*pi/180)*cos((anglex+ux)*pi/180)*sin((angley+uy)*pi/180)+sin((anglex+ux)*pi/180)*sin((anglez+uz)*pi/180)) + y_1[i]*(cos((anglex+ux)*pi/180)*sin((angley+uy)*pi/180)*sin((anglez+uz)*pi/180) - sin((anglex+ux)*pi/180)*cos((anglez+uz)*pi/180))  + z_1[i]*cos((anglex+ux)*pi/180)*cos((angley+uy)*pi/180) ;


{
if (ux<>0) or (uy<>0) or (uz<>0) then begin
if step1=1 then goto 9;
if step1=2 then goto 10;  }

{ux:=ugolx;
uy:=ugoly;
uz:=ugolz;    }

if Evolut=false then goto 10;
if rot_= length(trxyz)-1  then goto 10;
//надо запомнить координаты
scr_x1[i]:=Round(X3dz[i]);
scr_y1[i]:=Round(Y3dz[i]);
scr_z1[i]:=Round(Z3dz[i]);

x_1[i]:=X_1_z[i];
y_1[i]:=Y_1_z[i];
z_1[i]:=Z_1_z[i];




end;






10:
// Возвращаем систему координат - делаем обратное смещение
//scr_x[i]:=round(X3dz[i])+round(PaintBox1.Width/2);
//scr_y[i]:=round(Y3dz[i])+round(PaintBox1.Height/2);
//scr_z[i]:=round(Z3dz[i])+round(zinv*scal);


//Также возвращаем нативные координаты на место:
x_1[i]:=X_1_z[i] + xinv;
y_1[i]:=Y_1_z[i] + yinv;
z_1[i]:=Z_1_z[i] + zinv;




//if Evolut=true then begin
scr_x[i]:= PaintBox1.Width div 2 + round((x_1[i]-xinv)*scal);
scr_y[i]:= PaintBox1.Height div 2  - round((y_1[i]-yinv)*scal);
scr_z[i]:= round(z_1[i]*scal);


end;




//Определяем порядок прорисовки атомов - в порядке возрастания Z
//чтобы сымитировать глубину
setlength(scr_z_tmp,length(scr_z)-2);
for i:=1 to length(scr_z)-2 do
scr_z_tmp[i-1]:=scr_z[i];


//begin
for i:=0 to length(scr_z_tmp)-2 do begin
for j:=i+1 to length(scr_z_tmp)-1 do begin
if scr_z_tmp[i]>=scr_z_tmp[j] then begin
//showmessage(inttostr(length(scr_z_tmp)[i])+'>='+inttostr(a[j]));
l:=scr_z_tmp[j];
scr_z_tmp[j]:=scr_z_tmp[i];
scr_z_tmp[i]:=l;
end;
end;
end;





l:=0;
for i:=0 to length(scr_z_tmp) do begin
for j:=1 to length(scr_z)-2 do  begin
if (scr_z_tmp[i]=scr_z[j])then begin
if (i>0) and (scr_z_tmp[i]=scr_z_tmp[i-1]) then break;
setlength(order_z,l+1);
order_z[l]:=j;
l:=l+1;
end;
end;
end;


setlength(E,length(order_z)+2);
setlength(colour_atom,length(order_z)+2);
setlength(Red,length(order_z)+2);
setlength(Green,length(order_z)+2);
setlength(Blue,length(order_z)+2);


for i:=1 to length(scr_z)-2 do begin


E[order_z[i-1]]:='';
for p:=1 to length(new_atomoutel[nc][order_z[i-1]]) do
if new_atomoutel[nc][order_z[i-1]][p] in ['A'..'Z','a'..'z'] then E[order_z[i-1]]:=E[order_z[i-1]]+new_atomoutel[nc][order_z[i-1]][p]; //центры могут быть типа Mg1, Br_1,...

center_find:=false;
//Идентифицируем атомные центры (сравниваем прочитаные атомы с центрами из параметрического файла)
for s:=2 to length(center)-1 do begin
if E[order_z[i-1]]=center[s-1] then begin
center_find:=true;     //центр нашелся в параметрическом файле
break;  //как только нашли совпадение - обрываем цикл
end;
end;
if center_find=false then begin         //в молекуле найден такой центр, которого нет в параметрическом файле
colour[s-1]:='(20,20,20)';
radius[s-1]:='1.00';
end;




//цвет атома
//setlength(colour_atom,i+1);
if bonds_painted=false then begin
colour_atom[order_z[i-1]]:=copy(colour[s-1],2,length(colour[s-1])-2);   //цвет атома без скобок из параметрического файла
cn[1]:=0;
cn[2]:=0;
cn[3]:=0;
cn[4]:=0;
cn[5]:=0;
cn[6]:=0;
for p:=1 to length(colour_atom[order_z[i-1]]) do begin
if (copy(colour_atom[order_z[i-1]],p,1)=' ') or  (copy(colour_atom[order_z[i-1]],p,1)=',') then cn[1]:=cn[1]+1         //пробелы до элемента
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+p,1)<>' ') and  (copy(colour_atom[order_z[i-1]],cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //Red
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+p,1)=' ') or  (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы R-G
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //Green
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1   //пробелы G-B
else break;
end;
for p:=1 to length(colour_atom[order_z[i-1]]) do  begin
if (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //Blue
else break;
end;

//Раскладываем R,G,B на составляющие
//setlength(Red,i+1);
//setlength(Green,i+1);
//setlength(Blue,i+1);
if Qcolor = nil then begin // Цвета под величины зарядов
Red[order_z[i-1]]:= strtoint(copy(colour_atom[order_z[i-1]],cn[1]+1,cn[2]));   //Red
Green[order_z[i-1]]:= strtoint(copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+1,cn[4]));    //Green
Blue[order_z[i-1]]:= strtoint(copy(colour_atom[order_z[i-1]],cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]));   //Blue
end
else begin
Red[order_z[i-1]]:= Qcolor[order_z[i-1],0];      //Red
Green[order_z[i-1]]:= Qcolor[order_z[i-1],1];    //Green
Blue[order_z[i-1]]:= Qcolor[order_z[i-1],2];     //Blue
end;
end;
//Задаем цвет кисти - наполнения "шариков" (атомов)
//PaintBox1.Canvas.Brush.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);
//PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);
//отрисовываем сами шарики с учетом радиуса
//PaintBox1.Canvas.Ellipse(scr_x[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translaty,scr_x[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translaty);




//Прорисовываем связи. Связи надо прорисовывать с учетом межатомных расстояний - порога
//который записан в параметрический файл
PaintBox1.Canvas.Pen.Width:=2;
if i>=2 then begin     //начинаем анализировать связи в обратном порядке 2-1, 3-2, 3-1 и проч.
bond_find:=false;     // bond_find - флаг для определения нашлось ли что-то в параметрическом файле (связь)
for s:=1 to i-1 do begin
bond_find:=false;

if bonds_painted=true then begin
for t:=0 to length(are_bonds)-1-3 do  begin    // -4 так как последние 4 центра фиктивные - точки для построения осей
//Добавим модель слоев
if Layers<> nil then begin
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='high')   and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='high')   then  PaintBox1.Canvas.Pen.Width:=2;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='middle') and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='high')   and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='middle') and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='high')   then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='low')    and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='high')   then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='high')   and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='low')    and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='low')    and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='middle') then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='middle') and (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))-1]='empty')  or  (Layers[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))-1]='empty')  then  goto 1000;     //толщина связей
end;
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))],Green[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))],Blue[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]);       //Цвет связи
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo(scr_x[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+translatx,scr_y[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo( round((scr_x[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+ scr_x[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))])/2)+translatx ,   round((scr_y[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+scr_y[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))])/2)+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))],Green[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))],Blue[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]);       //Цвет связи
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo( round((scr_x[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+ scr_x[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))])/2)+translatx ,   round((scr_y[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+scr_y[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))])/2)+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo(scr_x[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]+translatx,scr_y[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]+translaty);
1000:
end;
if Form42.CheckBox5.Checked then begin   // убираем-добавляем "связи" между осями если оси не запрошены
for t:=length(are_bonds)-3 to length(are_bonds)-1 do  begin  // for AXIS painting
PaintBox1.Canvas.Pen.Color:=RGB(0,0,0);
PaintBox1.Canvas.Pen.Width:=2;
PaintBox1.Canvas.MoveTo(scr_x[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+translatx,scr_y[strtoint(copy(are_bonds[t],1,pos('-',are_bonds[t])-1))]+translaty);
PaintBox1.Canvas.LineTo(scr_x[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]+translatx,scr_y[strtoint(copy(are_bonds[t],pos('-',are_bonds[t])+1,4))]+translaty);
end;
end;
goto 25;
end;









for p:=1 to length(bond_type)-1 do  begin
if ((E[order_z[i-1]]+'-'+E[order_z[i-1-s]]=bond_type[p]) or (E[order_z[i-1-s]]+'-'+E[order_z[i-1]]=bond_type[p])) and (Pos('axis',E[order_z[i-1-s]]+E[order_z[i-1]])=0) then begin
bond_find:=true;            //связь в параметрическом файле найдена
//Описание случая, когда связь есть в параметрическом файле (задан тип), а значение не стоит
rad1:=0;
rad2:=0;
if thresh1[p]='' then begin
for el_count:=1 to 118 do begin
if E[order_z[i-1-s]]=center[el_count] then rad1:=strtofloat(radius[el_count]);      //радиус первого элемента
if E[order_z[i-1]]=center[el_count] then rad2:=strtofloat(radius[el_count]);        //радиус второго элемента
if (rad1<>0) and (rad2<>0) then thresh1[p]:= floattostr(strtofloat(radius[el_count])*1.1+ strtofloat(radius[el_count+s-1])*1.1);  //формула для рассчета длины связи (порога)
if thresh1[p]<>'' then break;
end;
end;


if sqrt(sqr(x_1[order_z[i-1]]-x_1[order_z[i-1-s]])+sqr(y_1[order_z[i-1]]-y_1[order_z[i-1-s]])+sqr(z_1[order_z[i-1]]-z_1[order_z[i-1-s]]))<=strtofloat(thresh1[p]) then begin //+sqrt(sqr(dx[order_z[i-1]])+sqr(dy[order_z[i-1]])+sqr(dz[order_z[i-1]]))+sqrt(sqr(dx[order_z[i-1-s]])+sqr(dy[order_z[i-1-s]])+sqr(dz[order_z[i-1-s]])) then  begin
//слои...
if Layers<> nil then begin
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=2;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='empty')  or  (Layers[order_z[i-1-s]-1]='empty')  then  goto 1010;     //толщина связей
end;
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);       //Цвет связи
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo(scr_x[order_z[i-1]]+translatx,scr_y[order_z[i-1]]+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo( round((scr_x[order_z[i-1]]+ scr_x[order_z[i-1-s]])/2)+translatx ,   round((scr_y[order_z[i-1]]+scr_y[order_z[i-1-s]])/2)+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1-s]],Green[order_z[i-1-s]],Blue[order_z[i-1-s]]);       //Цвет связи
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo( round((scr_x[order_z[i-1]]+ scr_x[order_z[i-1-s]])/2)+translatx ,   round((scr_y[order_z[i-1]]+scr_y[order_z[i-1-s]])/2)+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo(scr_x[order_z[i-1-s]]+translatx,scr_y[order_z[i-1-s]]+translaty);
1010:
setlength(are_bonds,ti+1);
are_bonds[ti]:=inttostr(order_z[i-1])+'-'+inttostr(order_z[i-1-s]);
ti:=ti+1;
break;
end;
end;
end;




//Описание случая, когда связи (возможные) не описаны в параметрическом файле

if bond_find=false then begin        //если связь в параметрическом файле не найдена
rad1:=0;
rad2:=0;
if length(thresh1)<p+1 then setlength(thresh1,p+1);
thresh1[p]:='';
for el_count:=1 to 118 do begin
if E[order_z[i-1-s]]=center[el_count] then rad1:=strtofloat(radius[el_count]);      //радиус первого элемента
if E[order_z[i-1]]=center[el_count] then rad2:=strtofloat(radius[el_count]);        //радиус второго элемента
if (rad1<>0) and (rad2<>0) then thresh1[p]:=FloatToStr((rad1+rad2)*1.1);                                                //floattostr(strtofloat(radius[el_count])*1.1+ strtofloat(radius[el_count+s-1])*1.1);  //формула для рассчета длины связи (порога) для атомов, которых нет в параметрическом файле
if thresh1[p]<>'' then break;    //как только какое-то значение получено выходим из цикла поиска
end;
end;
//Если центр - псевдоатом, то у него радиус неизвестен (берется не из параметрического файла), а принимается равным 1
if (thresh1[p]='') or (center_find=false) then begin
rad1:=0;
rad2:=1.00; //Радиус псевдо-атома условно приняли равным 1
for el_count:=1 to 118 do begin
if (E[order_z[i-1-s]]=center[el_count]) or (E[order_z[i-1]]=center[el_count]) then rad1:=strtofloat(radius[el_count]);      //радиус первого элемента
if (rad1<>0) and (rad2<>0) then thresh1[p]:= floattostr((strtofloat(radius[el_count])*1.2+ 1.0*1.2 )/2);  //формула для рассчета длины связи (порога) для атомов, которых нет в параметрическом файле
//  условие...   and (rad1<>0) берется для того, чтобы понять, что rad1 присвоилось какое-то значение, т.к. вначале мы его обнулили
if (thresh1[p]<>'') and (rad1<>0) then break;    //как только какое-то значение получено и rad1<>0 выходим из цикла поиска
end;
end;

if thresh1[p]='' then thresh1[p]:='2.00';   //редкий случай, когда несколько мнимых центров


if bond_find=false then begin   //теперь отрисовываем найденное
if Pos('axis',E[order_z[i-1-s]]+E[order_z[i-1]])=0 then begin
if sqrt(sqr(strtofloat(x_draw_out[nc][order_z[i-1]])-strtofloat(x_draw_out[nc][order_z[i-1-s]]))+sqr(strtofloat(y_draw_out[nc][order_z[i-1]])-strtofloat(y_draw_out[nc][order_z[i-1-s]]))+sqr(strtofloat(z_draw_out[nc][order_z[i-1]])-strtofloat(z_draw_out[nc][order_z[i-1-s]])))<=strtofloat(thresh1[p]) then  begin
//слои...
if Layers<> nil then begin
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=2;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=4;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='high')   then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='high')   and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='low')    and (Layers[order_z[i-1-s]-1]='middle') then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='middle') and (Layers[order_z[i-1-s]-1]='low')    then  PaintBox1.Canvas.Pen.Width:=1;     //толщина связей
if (Layers[order_z[i-1]-1]='empty')  or  (Layers[order_z[i-1-s]-1]='empty')  then  goto 1020;     //толщина связей
end;
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);       //Цвет связи
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo(scr_x[order_z[i-1]]+translatx,scr_y[order_z[i-1]]+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo( round((scr_x[order_z[i-1]]+ scr_x[order_z[i-1-s]])/2)+translatx ,   round((scr_y[order_z[i-1]]+scr_y[order_z[i-1-s]])/2)+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1-s]],Green[order_z[i-1-s]],Blue[order_z[i-1-s]]);       //Цвет связи
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.MoveTo( round((scr_x[order_z[i-1]]+ scr_x[order_z[i-1-s]])/2)+translatx ,   round((scr_y[order_z[i-1]]+scr_y[order_z[i-1-s]])/2)+translaty);
if (CheckBox2.Checked)  or (Form42.CheckBox2.Checked) then PaintBox1.Canvas.LineTo(scr_x[order_z[i-1-s]]+translatx,scr_y[order_z[i-1-s]]+translaty);
1020:
setlength(are_bonds,ti+1);
are_bonds[ti]:=inttostr(order_z[i-1])+'-'+inttostr(order_z[i-1-s]);
ti:=ti+1;
end;
end;
end;
//bond_find:=true;
//PaintBox1.Canvas.Ellipse(scr_x[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translaty,scr_x[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translaty);





end;
end;


end;



                           ///  инициализация (Первая прорисовка осей координат)
SetLength(are_bonds,Length(are_bonds)+3);
are_bonds[Length(are_bonds)-3]:=IntToStr(MaxIntValue(order_z)-2)+'-'+IntToStr(MaxIntValue(order_z)-3);
are_bonds[Length(are_bonds)-2]:=IntToStr(MaxIntValue(order_z)-1)+'-'+IntToStr(MaxIntValue(order_z)-3);
are_bonds[Length(are_bonds)-1]:=IntToStr(MaxIntValue(order_z)-0)+'-'+IntToStr(MaxIntValue(order_z)-3);
if Form42.CheckBox5.Checked then begin
PaintBox1.Canvas.Pen.Color:=RGB(0,0,0);       //Цвет связи
PaintBox1.Canvas.Pen.Width:=2;
PaintBox1.Canvas.MoveTo(scr_x[MaxIntValue(order_z)-2]+translatx,scr_y[MaxIntValue(order_z)-2]+translaty);
PaintBox1.Canvas.LineTo(scr_x[MaxIntValue(order_z)-3]+translatx,scr_y[MaxIntValue(order_z)-3]+translaty);
PaintBox1.Canvas.MoveTo(scr_x[MaxIntValue(order_z)-1]+translatx,scr_y[MaxIntValue(order_z)-1]+translaty);
PaintBox1.Canvas.LineTo(scr_x[MaxIntValue(order_z)-3]+translatx,scr_y[MaxIntValue(order_z)-3]+translaty);
PaintBox1.Canvas.MoveTo(scr_x[MaxIntValue(order_z)]+translatx,scr_y[MaxIntValue(order_z)]+translaty);
PaintBox1.Canvas.LineTo(scr_x[MaxIntValue(order_z)-3]+translatx,scr_y[MaxIntValue(order_z)-3]+translaty);
end;










25:

//Теперь отрисовываем центры
for i:=1 to length(scr_z)-2 do begin
E[order_z[i-1]]:='';
for p:=1 to length(new_atomoutel[nc][order_z[i-1]]) do
if new_atomoutel[nc][order_z[i-1]][p] in ['A'..'Z','a'..'z'] then E[order_z[i-1]]:=E[order_z[i-1]]+new_atomoutel[nc][order_z[i-1]][p]; //центры могут быть типа Mg1, Br_1,...
center_find:=false;
//Идентифицируем атомные центры (сравниваем прочитаные атомы с центрами из параметрического файла)
for s:=2 to length(center)-1 do begin
if E[order_z[i-1]]=center[s-1] then begin
center_find:=true;     //центр нашелся в параметрическом файле
break;  //как только нашли совпадение - обрываем цикл
end;
end;
if center_find=false then begin         //в молекуле найден такой центр, которого нет в параметрическом файле
colour[s-1]:='(20,20,20)';
radius[s-1]:='1.00';
end;
//Задаем цвет кисти - наполнения "шариков" (атомов)
PaintBox1.Canvas.Brush.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);
PaintBox1.Canvas.Pen.Color:=RGB(Red[order_z[i-1]],Green[order_z[i-1]],Blue[order_z[i-1]]);
//отрисовываем сами шарики с учетом радиуса
if radius[s-1]='' then radius[s-1]:='0.1';


//слои...
if Layers<> nil then begin
  if order_z[i-1]<=nomer_atoma then begin
if (Layers[order_z[i-1]-1]='empty')  or  (Layers[order_z[i-1]-1]='middle') or  (Layers[order_z[i-1]-1]='low') then  goto 1030;
end;
end;


if ((CheckBox1.Checked)  or (Form42.CheckBox1.Checked))  and (pos('axis',E[order_z[i-1]])=0)  then PaintBox1.Canvas.Ellipse(scr_x[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]-round(10*strtofloat(radius[s-1])*scale_atom)+translaty,scr_x[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translatx,scr_y[order_z[i-1]]+round(10*strtofloat(radius[s-1])*scale_atom)+translaty);
1030:
PaintBox1.Canvas.Font.Name:='Tahoma';

If ((Checkbox3.Checked) and (Checkbox4.Checked=False)) or ((Checkbox3.Checked=False) and (Checkbox4.Checked)) then begin
if nomer_atoma<10 then PaintBox1.Canvas.Font.Size:=round(7.0*strtofloat(radius[s-1])*scale_atom);
if (nomer_atoma>=10) and (nomer_atoma<100) then PaintBox1.Canvas.Font.Size:=round(6.5*strtofloat(radius[s-1])*scale_atom);
if (nomer_atoma>=100) and (nomer_atoma<1000) then PaintBox1.Canvas.Font.Size:=round(6.0*strtofloat(radius[s-1])*scale_atom);
if nomer_atoma>=1000 then PaintBox1.Canvas.Font.Size:=round(5.5*strtofloat(radius[s-1])*scale_atom);
end;

If (Checkbox3.Checked) and (Checkbox4.Checked) then begin
if nomer_atoma<10 then PaintBox1.Canvas.Font.Size:=round(6.5*strtofloat(radius[s-1])*scale_atom);
if (nomer_atoma>=10) and (nomer_atoma<100) then PaintBox1.Canvas.Font.Size:=round(6.0*strtofloat(radius[s-1])*scale_atom);
if (nomer_atoma>=100) and (nomer_atoma<1000) then PaintBox1.Canvas.Font.Size:=round(5.0*strtofloat(radius[s-1])*scale_atom);
if nomer_atoma>=1000 then PaintBox1.Canvas.Font.Size:=round(4.0*strtofloat(radius[s-1])*scale_atom);
end;


if CheckBox1.Checked  then begin  //подписи делаем, если включены атомы
if Layers<>nil then begin
if order_z[i-1]<=nomer_atoma then begin
if (Layers[order_z[i-1]-1]='middle') or (Layers[order_z[i-1]-1]='low') or (Layers[order_z[i-1]-1]='empty') then goto 1040;
end;
end;
if (((CheckBox3.Checked) and (CheckBox4.Checked=False))  or ((Form42.CheckBox3.Checked) and (Form42.CheckBox4.Checked=False))) and (pos('axis',E[order_z[i-1]])=0) then PaintBox1.Canvas.TextOut(scr_x[order_z[i-1]]-round(PaintBox1.Canvas.TextWidth(E[order_z[i-1]])/2)+translatx,scr_y[order_z[i-1]]-round(PaintBox1.Canvas.TextHeight(E[order_z[i-1]])/2)+translaty,E[order_z[i-1]]);
if (((CheckBox3.Checked=False) and (CheckBox4.Checked))  or ((Form42.CheckBox3.Checked=False) and (Form42.CheckBox4.Checked))) and (pos('axis',E[order_z[i-1]])=0) then  PaintBox1.Canvas.TextOut(scr_x[order_z[i-1]]-round(PaintBox1.Canvas.TextWidth(inttostr(order_z[i-1]))/2)+translatx,scr_y[order_z[i-1]]-round(PaintBox1.Canvas.TextHeight(inttostr(order_z[i-1]))/2)+translaty,inttostr(order_z[i-1]));
if (((CheckBox3.Checked) and (CheckBox4.Checked))  or ((Form42.CheckBox3.Checked) and (Form42.CheckBox4.Checked))) and (pos('axis',E[order_z[i-1]])=0)  then PaintBox1.Canvas.TextOut(scr_x[order_z[i-1]]-round(PaintBox1.Canvas.TextWidth(inttostr(order_z[i-1])+E[order_z[i-1]])/2)+translatx,scr_y[order_z[i-1]]-round(PaintBox1.Canvas.TextHeight(inttostr(order_z[i-1])+E[order_z[i-1]])/2)+translaty,E[order_z[i-1]]+inttostr(order_z[i-1]));
PaintBox1.Canvas.Brush.Style:=bsClear;
PaintBox1.Canvas.Font.Size:=Round(4*scale_atom);
if (Qval<>nil) and (pos('axis',E[order_z[i-1]])=0) and ((CheckBox3.Checked=False) and (CheckBox4.Checked=False)) then PaintBox1.Canvas.TextOut(scr_x[order_z[i-1]]-round(PaintBox1.Canvas.TextWidth(Copy(Qval[order_z[i-1]],1,pos('.',Qval[order_z[i-1]])+3))/2)+translatx,scr_y[order_z[i-1]]-round(PaintBox1.Canvas.TextHeight(Copy(Qval[order_z[i-1]],1,pos('.',Qval[order_z[i-1]])+3))/2)+translaty,Copy(Qval[order_z[i-1]],1,pos('.',Qval[order_z[i-1]])+3));
if (Qval<>nil) and (pos('axis',E[order_z[i-1]])=0) and ((CheckBox3.Checked) or (CheckBox4.Checked)) then PaintBox1.Canvas.TextOut(scr_x[order_z[i-1]]-round(PaintBox1.Canvas.TextWidth(Copy(Qval[order_z[i-1]],1,pos('.',Qval[order_z[i-1]])+3))/2)+translatx,scr_y[order_z[i-1]]-round(PaintBox1.Canvas.TextHeight(Copy(Qval[order_z[i-1]],1,pos('.',Qval[order_z[i-1]])+3))/2)+translaty+round(power(40.0*strtofloat(radius[s-1]),1)),Copy(Qval[order_z[i-1]],1,pos('.',Qval[order_z[i-1]])+3));
PaintBox1.Canvas.Brush.Style:=bsSolid;
1040:
end;



if Form42.CheckBox5.Checked then begin
PaintBox1.Canvas.Brush.Style:=bsClear;    ///AXISES Adding
PaintBox1.Canvas.Pen.Color:=clBlack;
PaintBox1.Canvas.Font.Size:=12;
PaintBox1.Canvas.Font.Name:='Tahoma';
PaintBox1.Canvas.TextOut(scr_x[MaxIntValue(order_z)-3]+translatx,scr_y[MaxIntValue(order_z)-3]+translaty,'O');
PaintBox1.Canvas.TextOut(scr_x[MaxIntValue(order_z)-2]+translatx,scr_y[MaxIntValue(order_z)-2]+translaty,'X');
PaintBox1.Canvas.TextOut(scr_x[MaxIntValue(order_z)-1]+translatx,scr_y[MaxIntValue(order_z)-1]+translaty,'Y');
PaintBox1.Canvas.TextOut(scr_x[MaxIntValue(order_z)-0]+translatx,scr_y[MaxIntValue(order_z)-0]+translaty,'Z');
end;



                                                            //xout

if Form24.Timer1.Enabled=True then begin
if length(dx)<length(x_1) then setlength(dx,length(x_1));
if length(dy)<length(y_1) then setlength(dy,length(y_1));
if length(dz)<length(z_1) then setlength(dz,length(z_1));

x_1[i]:=x_1[i]-dx[i];
y_1[i]:=y_1[i]-dy[i];
z_1[i]:=z_1[i]-dz[i];



end;

end;







end;




anglex:=0;
angley:=0;
anglez:=0;
ux:=0;
uy:=0;
uz:=0;


Evolut:=false;

Form36.Caption:='Модель :: '+ Form1.OpenDialog1.FileName;
Form36.StatusBar1.Panels[1].Text:='Цикл '+ inttostr(nc);
if length(Rx)>1 then begin


cli:=True;
Form37.BitBtn5.Click;
cli:=False;

SetLength(Rx_show_view,Length(Rx_show));
for i:=0 to Length(Rx_show)-1 do
Rx_show_view[i]:=Rx_show[i];

 SetLength(irc_fin_view,Length(irc_fin));
 for i:=0 to Length(irc_fin)-1 do
irc_fin_view[i]:=irc_fin[i];

//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(Rx_show_view)>1 then begin                       //  ########################################
 for i:=0 to Length(Rx_show_view)-1 do                      //  ########################################
 for j:=0 to Length(Rx_show_view)-2 do                      //  ########################################                                              //  ########################################
 if  Rx_show_view[j]>Rx_show_view[j+1] then begin           //  ######
  x20 := Rx_show_view[j+1];                                 //  ######   Sorting of array  Rx_show_view and wired array irc_fin_view
  y20 := irc_fin_view[j+1];                                 //  ######
  Rx_show_view[j+1] := Rx_show_view[j];                     //  ########################################
  irc_fin_view[j+1]:= irc_fin_view[j];                      //  ########################################
  Rx_show_view[j]:=x20;                                     //  ########################################
  irc_fin_view[j]:=y20;
 end;
 end;





for i:=0 to length(irc_fin_view)-1 do
if nc=irc_fin_view[i]+1 then break;

for j:=0 to length(irc_fin_view)-1 do
if irc_fin_view[j]=0 then break;


Form36.StatusBar1.Panels[1].Text:='Шаг '+ inttostr(i-j);
end;

if scanpoint<>nil then  begin
if nc-1>=length(scanpoint) then  Form36.StatusBar1.Panels[1].Text:='Шаг '+ inttostr(strtoint(scanpoint[length(scanpoint)-1])+1);
if nc-1<length(scanpoint) then if scanpoint[nc-1]='' then   Form36.StatusBar1.Panels[1].Text:='Шаг 0';
if nc-1<length(scanpoint) then if scanpoint[nc-1]<>'' then Form36.StatusBar1.Panels[1].Text:='Шаг '+scanpoint[nc-1];
end;

if escfreal<>nil then
if start_of_new_trj<>nil then   Form36.StatusBar1.Panels[1].Text:='Точка '+inttostr(nc-start_of_new_trj[Form49.ComboBox2.ItemIndex])
else Form36.StatusBar1.Panels[1].Text:='Точка '+inttostr(nc-1-constrain);


BBB:=false;
bonds_painted:=true;


end;





end;  //   if dial=true then begin


//end;




















procedure TForm36.FormCreate(Sender: TObject);
begin
Panel2.DoubleBuffered:=True;
PaintBox1.Canvas.Brush.Color:=clWhite;
PaintBox1.Canvas.FillRect(PaintBox1.Canvas.ClipRect);
//png:=TPNGObject.Create;
//png.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_left.png');
//showmessage(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_left.png');
//Form36.Canvas.Draw(1,1,png);


Form36.Image1.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Home.png');
Form36.Image2.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_rot_left.ico');
Form36.Image3.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_rot_right.ico');
Form36.Image4.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_rot_X_up.ico');
Form36.Image5.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_rot_X_down.ico');
Form36.Image6.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_rot_Y_left.ico');
Form36.Image7.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_rot_Y_right.ico');
Form36.Image8.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_left.ico');
Form36.Image9.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_up.ico');
Form36.Image10.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_down.ico');
Form36.Image11.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Arr_right.ico');
Form36.Image12.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Atom_incr.ico');
Form36.Image13.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Atom_decr.ico');
Form36.Image14.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Zoom_plus.ico');
Form36.Image15.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Zoom_minus.ico');
Form36.Image16.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Back.png');
Form36.Image17.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\Forward.png');



end;

procedure TForm36.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var i,j,y: Integer;
    x: Real;
    summa_bomd: integer;
  label 0;
begin
  summa_bomd:=0;
  Rx_show_view:=nil;
  irc_fin_view:=nil;
Form36.SetFocus;
if (key=VK_DOWN) and not (ssCtrl in Shift) then begin
anglex:=anglex+5;
ugolx:=ugolx+5;
ugoly:=0;
ugolz:=0;
if copy(trxyz[length(trxyz)-1],1,1)='X' then trxyz[length(trxyz)-1]:='X'+inttostr(ugolx)
else begin
setlength(trxyz,length(trxyz)+1);
trxyz[length(trxyz)-1]:='X'+inttostr(ugolx);
end;
end;
if (key=VK_UP) and not (ssCtrl in Shift) then begin
anglex:=anglex-5;
ugolx:=ugolx-5;
ugoly:=0;
ugolz:=0;
if copy(trxyz[length(trxyz)-1],1,1)='X' then trxyz[length(trxyz)-1]:='X'+inttostr(ugolx)
else begin
setlength(trxyz,length(trxyz)+1);
trxyz[length(trxyz)-1]:='X'+inttostr(ugolx);
end;
end;
if (key=VK_RIGHT) and not (ssCtrl in Shift) then  begin
angley:=angley+5;
ugoly:=ugoly+5;
ugolx:=0;
ugolz:=0;
if copy(trxyz[length(trxyz)-1],1,1)='Y' then trxyz[length(trxyz)-1]:='Y'+inttostr(ugoly)
else begin
setlength(trxyz,length(trxyz)+1);
trxyz[length(trxyz)-1]:='Y'+inttostr(ugoly);
end;
end;
if (key=VK_LEFT) and not (ssCtrl in Shift) then  begin
angley:=angley-5;
ugoly:=ugoly-5;
ugolx:=0;
ugolz:=0;
if copy(trxyz[length(trxyz)-1],1,1)='Y' then trxyz[length(trxyz)-1]:='Y'+inttostr(ugoly)
else begin
setlength(trxyz,length(trxyz)+1);
trxyz[length(trxyz)-1]:='Y'+inttostr(ugoly);
end;
end;
if (key=VK_END) and not (ssCtrl in Shift) then   begin
anglez:=anglez+5;
ugolz:=ugolz+5;
ugolx:=0;
ugoly:=0;
if copy(trxyz[length(trxyz)-1],1,1)='Z' then trxyz[length(trxyz)-1]:='Z'+inttostr(ugolz)
else begin
setlength(trxyz,length(trxyz)+1);
trxyz[length(trxyz)-1]:='Z'+inttostr(ugolz);
end;
end;
if (key=VK_DELETE) and not (ssCtrl in Shift) then  begin
anglez:=anglez-5;
ugolz:=ugolz-5;
ugolx:=0;
ugoly:=0;
if copy(trxyz[length(trxyz)-1],1,1)='Z' then trxyz[length(trxyz)-1]:='Z'+inttostr(ugolz)
else begin
setlength(trxyz,length(trxyz)+1);
trxyz[length(trxyz)-1]:='Z'+inttostr(ugolz);
end;
end;


if (key=VK_ADD) and not (ssCtrl in Shift) then begin
scale_panorama:=scale_panorama-0.02;
scal:=0;
end;
if (key=VK_SUBTRACT) and not (ssCtrl in Shift) then begin
if scale_panorama<=0.48 then scale_panorama:=scale_panorama+0.02;
scal:=0;
end;
if  (ssCtrl in Shift) and (Key=VK_ADD) and not (ssAlt in Shift) then scale_atom:=scale_atom*1.1;
if  (ssCtrl in Shift) and (Key=VK_SUBTRACT) and not (ssAlt in Shift) then scale_atom:=scale_atom/1.1;
if (key=VK_LEFT) and (ssCtrl in Shift) then begin
translatx:=translatx-5;
end;
if (key=VK_RIGHT) and (ssCtrl in Shift) then begin
translatx:=translatx+5;
end;
if (key=VK_UP) and (ssCtrl in Shift) then begin
translaty:=translaty-5;
end;
if (key=VK_DOWN) and (ssCtrl in Shift) then begin
translaty:=translaty+5;
end;


if (key=ord('B')) or (key=ord('И')) then  begin
if nc>1 then opt:=opt+1;
if Length(Rx)>1 then begin
  cli:=True;
Form37.BitBtn5.Click;
cli:=False;

SetLength(Rx_show_view,Length(Rx_show));
for i:=0 to Length(Rx_show)-1 do
Rx_show_view[i]:=Rx_show[i];

 SetLength(irc_fin_view,Length(irc_fin));
 for i:=0 to Length(irc_fin)-1 do
irc_fin_view[i]:=irc_fin[i];                                       //  BACK       <------------------

//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(Rx_show_view)>1 then begin                       //  ########################################
 for i:=0 to Length(Rx_show_view)-1 do                      //  ########################################
 for j:=0 to Length(Rx_show_view)-2 do                      //  ########################################                                              //  ########################################
 if  Rx_show_view[j]>Rx_show_view[j+1] then begin           //  ######
  x := Rx_show_view[j+1];                                   //  ######   Sorting of array  Rx_show_view and wired array irc_fin_view
  y := irc_fin_view[j+1];                                   //  ######
  Rx_show_view[j+1] := Rx_show_view[j];                     //  ########################################
  irc_fin_view[j+1]:= irc_fin_view[j];                      //  ########################################
  Rx_show_view[j]:=x;                                       //  ########################################
  irc_fin_view[j]:=y;
 end;
 end;

 for i:=0 to Length(irc_fin_view)-1 do
 if nc-1=irc_fin_view[i] then Break;
 if i>0 then nc:=irc_fin_view[i-1]+1;
 opt:=nomer_cycla-nc;



end;

if scanpoint<>nil then begin
  opt:=opt-1;
for i:=1 to length(scanpoint)-1 do
if (scanpoint[nc-i-1]<>'') or (nc-i-1=0) then Break;
opt:=opt+i;
end;


if escfreal<>nil then begin
if nc>1 then  opt:=opt-1;
if (trj=0) and (trjn=0) then   begin
  if nc<=1+constrain then goto 0;
if opt<nomer_cycla-1 then
opt:=opt+1;            //============== ADMP
end
else begin
if (nc>start_of_new_trj[Form49.ComboBox2.ItemIndex]+1) and (nc<=start_of_new_trj[Form49.ComboBox2.ItemIndex+1]) and (opt<nomer_cycla-2) then opt:=opt+1
else goto 0;
end;
end;



if (nc<=1) and (Rx=nil)   then goto 0;

x_1:=nil;
y_1:=nil;
z_1:=nil;
scal:=0;
ux:=ugolx;
uy:=ugoly;
uz:=ugolz;
Evolut:=true;
bonds_painted:=false;
are_bonds:=nil;
end;

if (key=ord('N')) or (key=ord('Т')) then begin
if nc<nomer_cycla then opt:=opt-1;

if length(Rx)>1 then begin
  cli:=True;                         
Form37.BitBtn5.Click;
cli:=False;

SetLength(Rx_show_view,Length(Rx_show));
for i:=0 to Length(Rx_show)-1 do
Rx_show_view[i]:=Rx_show[i];

 SetLength(irc_fin_view,Length(irc_fin));
 for i:=0 to Length(irc_fin)-1 do
irc_fin_view[i]:=irc_fin[i];                                      // NEXT  ------------------>

//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(Rx_show_view)>1 then begin                       //  ########################################
 for i:=0 to Length(Rx_show_view)-1 do                      //  ########################################
 for j:=0 to Length(Rx_show_view)-2 do                      //  ########################################                                              //  ########################################
 if  Rx_show_view[j]>Rx_show_view[j+1] then begin           //  ######
  x := Rx_show_view[j+1];                                   //  ######   Sorting of array  Rx_show_view and wired array irc_fin_view
  y := irc_fin_view[j+1];                                   //  ######
  Rx_show_view[j+1] := Rx_show_view[j];                     //  ########################################
  irc_fin_view[j+1]:= irc_fin_view[j];                      //  ########################################
  Rx_show_view[j]:=x;                                       //  ########################################
  irc_fin_view[j]:=y;
 end;
 end;


for i:=0 to Length(irc_fin_view)-1 do
if nc-1=irc_fin_view[i] then Break;
if i<Length(irc_fin_view)-1 then nc:=irc_fin_view[i+1]+1;
opt:=nomer_cycla-nc;



end;


if scanpoint<>nil then begin
  opt:=opt+1;
for i:=1 to length(scanpoint)-1 do
if (scanpoint[nc+i-1]<>'') or (nc+i-1=nomer_cycla) then Break;
opt:=opt-i;
end;


if escfreal<>nil then begin
if nc<nomer_cycla then  opt:=opt+1;
if (trj=0) and (trjn=0) then   begin
if z_fin=true then if nc>=nomer_cycla then goto 0;
if z_fin=false then if nc>=nomer_cycla then goto 0;
if z_fin=true then if opt>0 then opt:=opt-1;            //============== ADMP
if z_fin=false then if opt>=1 then opt:=opt-1;
end
else begin
if (nc>=start_of_new_trj[Form49.ComboBox2.ItemIndex]) and (nc<start_of_new_trj[Form49.ComboBox2.ItemIndex+1]) and (opt>1) then opt:=opt-1
else goto 0;
end;
end;


if nc>=nomer_cycla then goto 0;

x_1:=nil;
y_1:=nil;
z_1:=nil;
scal:=0;
ux:=ugolx;
uy:=ugoly;
uz:=ugolz;
Evolut:=true;
bonds_painted:=false;
are_bonds:=nil;
end;


if not (key in [35..40,46,107,109,66,78]) then goto 0;


PaintBox1.Invalidate;
0:

end;

procedure TForm36.FormShow(Sender: TObject);
var i: integer;
begin
//Запомним нативные координаты
setlength(native_x,length(x));
setlength(native_y,length(y));
setlength(native_z,length(z));
for i:=1 to length(x)-2 do begin
native_x[i]:=x[i];
native_y[i]:=y[i];
native_z[i]:=z[i];
end;


end;

procedure TForm36.FormResize(Sender: TObject);
begin
scal:=0;
PaintBox1.Invalidate;
end;

procedure TForm36.N2Click(Sender: TObject);
begin
Form36.Close;
end;

procedure TForm36.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image1.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image2.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image3.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image4.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image5.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image6.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image7.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image8.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image9.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image10MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image10.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image11MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image11.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image12MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image12.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image13MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image13.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image14MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image14.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image15MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image15.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image16MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image16.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Image17MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image18.Left:=Image17.Left;
Image18.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Icons\selector.bmp');
end;

procedure TForm36.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if Cursor<>-21 then Image18.Picture:=nil;
end;

procedure TForm36.Image2Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_END;
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image3Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_DELETE;
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image4Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_UP;
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image5Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_DOWN;
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image6Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_LEFT;
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image7Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_RIGHT;
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image8Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_LEFT;
shift:=[ssCtrl];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image9Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_UP;
shift:=[ssCtrl];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image10Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_DOWN;
shift:=[ssCtrl];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image11Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_RIGHT;
shift:=[ssCtrl];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image12Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_ADD;
shift:=[ssCtrl];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image13Click(Sender: TObject);

var key: Word;
shift: TShiftState;
begin
key:=VK_SUBTRACT;
shift:=[ssCtrl];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image14Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_ADD;
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image15Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=VK_SUBTRACT;
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image16Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=ord('B');
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.Image17Click(Sender: TObject);
var key: Word;
shift: TShiftState;
begin
key:=ord('N');
shift:=[];
Form36.KeyDown(key,shift);
end;

procedure TForm36.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=True then Form42.CheckBox1.Checked:=True;
if CheckBox1.Checked=False then Form42.CheckBox1.Checked:=False;
Form36.PaintBox1.Repaint;
end;

procedure TForm36.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked=True then Form42.CheckBox2.Checked:=True;
if CheckBox2.Checked=False then Form42.CheckBox2.Checked:=False;
Form36.PaintBox1.Repaint;
end;

procedure TForm36.CheckBox3Click(Sender: TObject);
begin
if CheckBox3.Checked=True then Form42.CheckBox3.Checked:=True;
if CheckBox3.Checked=False then Form42.CheckBox3.Checked:=False;
Form36.PaintBox1.Repaint;
end;

procedure TForm36.CheckBox4Click(Sender: TObject);
begin
if CheckBox4.Checked=True then Form42.CheckBox4.Checked:=True;
if CheckBox4.Checked=False then Form42.CheckBox4.Checked:=False;
Form36.PaintBox1.Repaint;
end;

procedure TForm36.N4Click(Sender: TObject);
begin
Form42.Show;
end;

procedure TForm36.N5Click(Sender: TObject);
begin
Form43.Show;
end;

procedure TForm36.Image1Click(Sender: TObject);
begin
if length(Rx)>1 then begin
 //nc:=1;

 opt:=nomer_cycla-1;
 x_1:=nil;
y_1:=nil;
z_1:=nil;
scal:=0;
ux:=ugolx;
uy:=ugoly;
uz:=ugolz;
Evolut:=true;
bonds_painted:=false;
are_bonds:=nil;
 PaintBox1.Invalidate;



end;
end;

end.
