unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Menus, Math;



type
  TForm15 = class(TForm)
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    BitBtn1: TBitBtn;
    TrackBar1: TTrackBar;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox2: TGroupBox;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    ColorBox3: TColorBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox4: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Timer1: TTimer;
    PaintBox2: TPaintBox;
    Label9: TLabel;
    CheckBox4: TCheckBox;
    ColorBox4: TColorBox;
    Label10: TLabel;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure ColorBox4Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure TrackBar1KeyPress(Sender: TObject; var Key: Char);
    procedure ColorBox4KeyPress(Sender: TObject; var Key: Char);
    procedure TrackBar2KeyPress(Sender: TObject; var Key: Char);
    procedure TrackBar3KeyPress(Sender: TObject; var Key: Char);
    procedure ColorBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ColorBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ColorBox3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  procedure CMDialogKey(var Msg: TWMKey);
  message CM_DIALOGKEY;
  procedure NameOrb(a,b,c,d: integer);
    { Public declarations }
  end;

var
  Form15: TForm15;
  H,W,Wid: integer;       // Wid - параметр, контролирующий рамку при появлении надписей ВЗМО/НСМО
  But1,But2,But3: word;        // Smem - параметр, контролирующий работу прокрутки области орбиталей
  TM: word;
  YdeltaVerh,YdeltaNiz,YdeltaVerh_beta,YdeltaNiz_beta,Smes,scl_add_v,scl_add_n: real;
  mlt,mlt_beta: real;
  initialpos: integer;


implementation

uses Unit1, Unit24, Unit14;

{$R *.dfm}


procedure TForm15.CMDialogKey(var Msg: TWMKEY);
var i,Res1,Res2,Res3: integer;
key: Word;
Shift: TShiftState;
State: TKeyboardState;
begin
Form15.SetFocus;
Form15.SetFocusedControl(Form15);
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
 Form15.Focused;
 key:=Msg.Charcode;
 Form15.FormKeyDown(Self,key,shift);
  end;
  if (ActiveControl is TCheckBox)  and (ssCtrl in Shift) and
    ((Msg.Charcode = 37) or (Msg.Charcode = 38) or (Msg.Charcode = 39) or (Msg.Charcode = 40)) then
  begin
 Form15.Focused;
 key:=Msg.Charcode;
 Form15.FormKeyDown(Self,key,shift);
  end;
  inherited;
end;














procedure TForm15.FormCreate(Sender: TObject);
begin
W:=PaintBox1.ClientWidth;
H:=Paintbox1.ClientHeight;
PaintBox1.Parent.DoubleBuffered:=true;
with Form15.TrackBar1 do begin
Min:=1;
Max:=1000;
Position:=1;
Frequency:=200;
end;

with Form15.TrackBar2 do begin
Min:=5;
Max:=50;
Position:=15;
Frequency:=30;
end;

with Form15.TrackBar3 do begin
Min:=10;
Max:=100;
Position:=55;
Frequency:=30;
end;
YdeltaVerh:=0;
YdeltaNiz:=0;
YdeltaVerh_beta:=0;
YdeltaNiz_beta:=0;
Smes:=0;
end;





















procedure TForm15.FormResize(Sender: TObject);
begin
ScrollBox1.ClientWidth:=Form15.ClientWidth-ScrollBox1.Left-20;
ScrollBox1.ClientHeight:=Form15.ClientHeight-ScrollBox1.Top-165;
//PaintBox1.ClientWidth:=ScrollBox1.ClientWidth-10; }
PaintBox1.ClientHeight:=ScrollBox1.ClientHeight-PaintBox1.Top-50;
PaintBox2.Top:= PaintBox1.Top+PaintBox1.ClientHeight+2;
GroupBox1.Top:=ScrollBox1.Top+ScrollBox1.Height+15;
Label6.Top:= ScrollBox1.Top+ScrollBox1.Height+17;
BitBtn1.Top:=ScrollBox1.Top+ScrollBox1.Height+40;
TrackBar1.Top:=ScrollBox1.Top+ScrollBox1.Height+35;
Label9.Top:= ScrollBox1.Top+ScrollBox1.Height+65;
Label10.Top:= ScrollBox1.Top+ScrollBox1.Height+85;
ColorBox4.Top:= ScrollBox1.Top+ScrollBox1.Height+105;
CheckBox1.Top:=ScrollBox1.Top+ScrollBox1.Height+22;
CheckBox2.Top:=ScrollBox1.Top+ScrollBox1.Height+52;
CheckBox3.Top:=ScrollBox1.Top+ScrollBox1.Height+82;
CheckBox4.Top:=ScrollBox1.Top+ScrollBox1.Height+112;
GroupBox2.Top:=ScrollBox1.Top+ScrollBox1.Height+15;
GroupBox3.Top:=ScrollBox1.Top+ScrollBox1.Height+15;
GroupBox4.Top:=ScrollBox1.Top+ScrollBox1.Height+15;
//showmessage(inttostr(length(ch_mult)));
end;





procedure TForm15.RadioButton1Click(Sender: TObject);
begin
if radiobutton1.Checked then begin
if (but1>0) and (but1>=W) then PaintBox1.ClientWidth:=but1;
if but1=0 then PaintBox1.ClientWidth:=W;
if (but1>0) and (but1<W) then PaintBox1.ClientWidth:=W;
PaintBox1.Invalidate;
PaintBox2.Invalidate;
Form15.Caption:='ALPHA-Levels';


end;
end;

procedure TForm15.RadioButton2Click(Sender: TObject);
begin
if radiobutton2.Checked then begin
if (but2>0) and (but2>=W) then PaintBox1.ClientWidth:=but2;
if but2=0 then PaintBox1.ClientWidth:=W;
if (but2>0) and (but2<W) then PaintBox1.ClientWidth:=W;
PaintBox1.Invalidate;
PaintBox2.Invalidate;
Form15.Caption:='BETA-Levels';
end;
end;




////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////PAINT/////////////////////////////////////////////////////////////////////
/////////////////////////////PAINT/////////////////////////////////////////////////////////////////////
/////////////////////////////PAINT/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////





procedure TForm15.PaintBox1Paint(Sender: TObject);
var scale,i,j,zn,Hmax,Hmin,mmint1,mmint2,mmint3,k, XXout,YYout: integer;
mm1,mm2,Hmax1,Hmin1: real;
probel,ras,txtout1: string;       // ras - расширение файла
wd, st: word;
begin
//showmessage(inttostr(length(ch_mult)));
if ev=1 then initialpos:=50 else initialpos:=60;
wd:=Trackbar3.Position; // ширина орбитали
st:=Trackbar2.Position; // расстояние между штрихами
probel:='                    ';
PaintBox1.Canvas.Pen.Color:=clBlack;
PaintBox1.Canvas.Brush.Color:=ColorBox4.Selected;
//PaintBox1.Canvas.Rectangle();
//PaintBox1.ClientWidth:=Form14.ComboBox1.Items.Count*65 ;
//PaintBox1.Canvas.Rectangle(40,0,PaintBox1.ClientWidth-5,PaintBox1.ClientHeight);
Form15.PaintBox1.Canvas.Pen.Width:=0;


PaintBox1.Canvas.Rectangle(initialpos-10,0,PaintBox1.ClientWidth-5,PaintBox1.ClientHeight);

PaintBox1.Canvas.Brush.Color:=clWhite;





ch:=length(Eorb)-1;


if (dial=true) and (beta=true) then begin
mm1:=0;
mm2:=0;
if (YdeltaVerh=0) and  (YdeltaNiz=0) then begin
if mm1<strtofloat(Eorb[ch]) then mm1:=strtofloat(Eorb[ch]);
if mm1<strtofloat(Eorb_beta[ch]) then mm1:=strtofloat(Eorb_beta[ch]);
if mm2>strtofloat(Eorb[0]) then mm2:=strtofloat(Eorb[0]); //
if mm2>strtofloat(Eorb_beta[0]) then mm2:=strtofloat(Eorb_beta[0]);
end
else begin
if mm1<strtofloat(Eorb[0])+ (1-mlt)*(strtofloat(Eorb[ch])-strtofloat(Eorb[0]))  +   (strtofloat(Eorb[ch])-strtofloat(Eorb[0]))/(2*TrackBar1.Position) then mm1:=strtofloat(Eorb[0])+ (1-mlt)*(strtofloat(Eorb[ch])-strtofloat(Eorb[0]))  +   (strtofloat(Eorb[ch])-strtofloat(Eorb[0]))/(2*TrackBar1.Position);
if mm1<strtofloat(Eorb_beta[0])+ (1-mlt_beta)*(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))  +   (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))/(2*TrackBar1.Position) then mm1:=strtofloat(Eorb_beta[0])+ (1-mlt_beta)*(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))  +   (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))/(2*TrackBar1.Position);
if mm2>strtofloat(Eorb[0])+ (1-mlt)*(strtofloat(Eorb[ch])-strtofloat(Eorb[0]))  -   (strtofloat(Eorb[ch])-strtofloat(Eorb[0]))/(2*TrackBar1.Position) then mm2:=strtofloat(Eorb[0])+ (1-mlt)*(strtofloat(Eorb[ch])-strtofloat(Eorb[0]))  -   (strtofloat(Eorb[ch])-strtofloat(Eorb[0]))/(2*TrackBar1.Position); //
if mm2>strtofloat(Eorb_beta[0])+ (1-mlt_beta)*(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))  -   (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))/(2*TrackBar1.Position) then mm2:=strtofloat(Eorb_beta[0])+ (1-mlt_beta)*(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))  -   (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))/(2*TrackBar1.Position);
//showmessage(floattostr(strtofloat(Eorb_beta[0])+ (1-mlt_beta)*(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))  -   (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))/(2*TrackBar1.Position)));
end;
end;

if (dial=true) and (beta=true) then begin
if (YdeltaVerh<>0) and  (YdeltaNiz<>0) then begin
mm1:=YdeltaVerh;
mm2:=YdeltaNiz;
end;
end;






{
if beta_mult[j]=true then begin
if (YdeltaVerh=0) and  (YdeltaNiz=0) then  begin
if mm1<strtofloat(Eorb_mult_beta[j,ch_mult[j]]) then  mm1:=strtofloat(Eorb_mult[j,ch_mult[j]]) // нашли конец
else mm1:=round(strtofloat(Eorb_mult[j,0]) +mlt* (strtofloat(Eorb_mult[j,ch_mult[j]])-strtofloat(Eorb_mult[j,0]))   + (strtofloat(Eorb_mult[j,ch_mult[j]])-strtofloat(Eorb_mult[j,0]))/(2*TrackBar1.Position));
}



if dial=false then begin
mm1:=0;
mm2:=0;
for j:=0 to Form14.Combobox1.Items.Count-1 do begin
if (YdeltaVerh=0) and  (YdeltaNiz=0) then  begin
//showmessage( inttostr(length(ch_mult)));
if mm1<strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]]) then  mm1:=strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]]); // нашли конец
if beta_mult[basket[j]]=true then
if mm1<strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]]) then  mm1:=strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]]); // нашли конец
end
else begin
if mm1<strtofloat(Eorb_mult[basket[j],0]) +(1-mlt)* (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))   + (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))/(2*TrackBar1.Position) then  mm1:=strtofloat(Eorb_mult[basket[j],0]) +(1-mlt)* (strtofloat(Eorb_mult[basket[j],ch_mult[j]])-strtofloat(Eorb_mult[basket[j],0]))   + (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))/(2*TrackBar1.Position); // нашли конец
if beta_mult[j]=true then begin
if mm1<strtofloat(Eorb_mult_beta[basket[j],0]) +(1-mlt_beta)* (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]))   + (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]))/(2*TrackBar1.Position)   then mm1:=strtofloat(Eorb_mult_beta[basket[j],0]) +(1-mlt_beta)* (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]))   + (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]))/(2*TrackBar1.Position);
end;




mmint1:=j; // нашли номер системы, у которой самый большой размах
end;
if (YdeltaVerh=0) and  (YdeltaNiz=0) then  begin
if mm2>strtofloat(Eorb_mult[basket[j],0]) then mm2:=strtofloat(Eorb_mult[basket[j],0]); // нашли конец
if beta_mult[basket[j]]=true then
if mm2>strtofloat(Eorb_mult_beta[basket[j],0]) then mm2:=strtofloat(Eorb_mult_beta[basket[j],0]); // нашли конец
end
else begin
if mm2>strtofloat(Eorb_mult[basket[j],0]) +(1-mlt)* (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))   - (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))/(2*TrackBar1.Position) then  mm2:=strtofloat(Eorb_mult[basket[j],0]) +(1-mlt)* (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))   - (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))/(2*TrackBar1.Position); // нашли конец
if beta_mult[basket[j]]=true then begin
if mm2>strtofloat(Eorb_mult_beta[basket[j],0]) +(1-mlt_beta)* (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]))   - (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]))/(2*TrackBar1.Position)  then mm2:= strtofloat(Eorb_mult[basket[j],0]) +(1-mlt)* (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))   - (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]))/(2*TrackBar1.Position);
//showmessage(floattostr(strtofloat(Eorb_mult_beta[basket[j],0]) +(1-mlt_beta)* (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]))   - (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]))/(2*TrackBar1.Position)));
end;


mmint2:=j; // нашли номер системы, у которой самый большой размах
end;
end;  // for j:=0 to Form14.Combobox1.Items.Count-1 do begin
end;  // if dial=false then begin



if Trackbar1.Position>1  then begin
mm1:=mm1+Smes/TrackBar1.Position;
mm2:=mm2+Smes/TrackBar1.Position;
if (dial=true) and (beta=false) then begin
scl_add_v:=Ydeltaverh;
scl_add_n:=Ydeltaniz;
scl_add_v:=scl_add_v+Smes*0.5/TrackBar1.Position;
scl_add_n:=scl_add_n+Smes*0.5/TrackBar1.Position;
end;

if (dial=true) and (beta=true) then begin
scl_add_v:=Ydeltaverh;
scl_add_n:=Ydeltaniz;
scl_add_v:=scl_add_v+Smes*0.5/TrackBar1.Position;
scl_add_n:=scl_add_n+Smes*0.5/TrackBar1.Position;
end;




end;











// 0.035 - эмпирический коэффициент частости насечек на шкале

scale:=Round(PaintBox1.ClientHeight*0.035);
for i:=1 to scale-1 do begin               //  scale=Round(PaintBox1.ClientHeight*0.035) - число насечек на оси энергий зависит от размеров окна
if  PaintBox1.ClientHeight>500000 then zn:=3 else zn:=2;
with Form15.PaintBox1.Canvas do begin
MoveTo(initialpos-10,Round(PaintBox1.ClientHeight-(1/scale)*i*PaintBox1.ClientHeight));
LineTo(initialpos-5,Round(PaintBox1.ClientHeight-(1/scale)*i*PaintBox1.ClientHeight));
Form15.PaintBox1.Canvas.Font.Size:=9;
if (YdeltaVerh=0) and  (YdeltaNiz=0) then begin
if dial=true then begin
txtout1:=floattostrf((strtofloat(Eorb[0])+(i*(strtofloat(Eorb[ch])-strtofloat(Eorb[0]))/scale))*ev,ffFixed,4,zn);
TextOut(45-Form15.PaintBox1.Canvas.TextWidth(txtout1),Round(PaintBox1.ClientHeight-(1/scale)*i*PaintBox1.ClientHeight)-7, txtout1);
end
else begin
txtout1:=floattostrf((mm2+((i*(mm1-mm2))/scale))*ev,ffFixed,4,zn);
TextOut(45-Form15.PaintBox1.Canvas.TextWidth(txtout1),Round(PaintBox1.ClientHeight-(1/scale)*i*(PaintBox1.ClientHeight))-7, txtout1) ;
//showmessage(inttostr(8-length(floattostrf((mm2+((i*(mm1-mm2))/scale))*ev,ffFixed,4,zn))));
end;
end
else begin
if dial=true then begin
txtout1:=floattostrf((scl_add_n+(i*(scl_add_v-scl_add_n)/scale))*ev,ffFixed,4,zn);
TextOut(45-Form15.PaintBox1.Canvas.TextWidth(txtout1),Round(PaintBox1.ClientHeight-(1/scale)*i*PaintBox1.ClientHeight)-7, txtout1);
end
else begin
txtout1:=floattostrf((mm2+((i*(mm1-mm2))/scale))*ev,ffFixed,4,zn);
TextOut(45-Form15.PaintBox1.Canvas.TextWidth(txtout1),Round(PaintBox1.ClientHeight-(1/scale)*i*(PaintBox1.ClientHeight))-7,  txtout1) ;
end;
end;




end; // закончили рисовать шкалу со значениями
end;


Form15.PaintBox1.Canvas.Font.Style:=[fsBold];
if checkbox3.Checked=false then Form15.PaintBox1.Canvas.TextOut(initialpos-50,1,'E, эВ')
else  Form15.PaintBox1.Canvas.TextOut(initialpos-50,1,'E, eV');





if (dial=true) and (Form1.OpenDialog1.FilterIndex=2) then begin
Hmax:=PaintBox1.ClientHeight-10;
Hmin:=0;
with Form15.PaintBox1.Canvas do begin
Pen.Width:=strtoint(Combobox1.Items[Combobox1.ItemIndex]);
Pen.Color:=clBlack;
for i:=0 to ch do begin
//TextOut(XXout,YYout-1,'НСМО');
if (typ[i]='O') or  (pos('-O',typ[i])<>0) then Form15.PaintBox1.Canvas.Pen.Color:=ColorBox1.Selected
else  Form15.PaintBox1.Canvas.Pen.Color:=ColorBox2.Selected;

                             
///////////////////
if (radiobutton1.Checked) or  (radiobutton3.Checked) then begin
if checkbox1.Checked then begin
if (i=homo) or (i=homo-1)  then  begin
Form15.PaintBox1.Canvas.Pen.Color:=ColorBox3.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox2.Items[Combobox2.ItemIndex]);
end;
end;
end;
////////////////////




if (Radiobutton1.Checked=true) or (Radiobutton3.Checked=true) then begin
//Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox1.Items[Combobox1.ItemIndex]);
if beta=true then begin
MoveTo (initialpos, Round((Hmax-Hmin)* (1-((strtofloat(Eorb[i])-mm2)/ (mm1-mm2))))+5);
LineTo (initialpos+wd, Round((Hmax-Hmin)* (1-((strtofloat(Eorb[i])-mm2)/ (mm1-mm2))))+5);
XXout:=initialpos+wd;
YYout:=Round((Hmax-Hmin)* (1-((strtofloat(Eorb[i])-mm2)/ (mm1-mm2))))+5;
NameOrb(i,homo,XXout,YYout);
end
else begin
if (YdeltaVerh=0) and  (YdeltaNiz=0) then begin
MoveTo (initialpos,Round((Hmax-Hmin)*(strtofloat(Eorb[ch])-strtofloat(Eorb[i]))/ (strtofloat(Eorb[ch])-strtofloat(Eorb[0])))+5);
LineTo (initialpos+wd,Round((Hmax-Hmin)*(strtofloat(Eorb[ch])-strtofloat(Eorb[i]))/ (strtofloat(Eorb[ch])-strtofloat(Eorb[0])))+5);
XXout:=initialpos+wd;
YYout:=Round((Hmax-Hmin)*(strtofloat(Eorb[ch])-strtofloat(Eorb[i]))/ (strtofloat(Eorb[ch])-strtofloat(Eorb[0])))+5;
NameOrb(i,homo,XXout,YYout);
end
else begin

MoveTo (initialpos,Round((Hmax-Hmin)*(scl_add_v-strtofloat(Eorb[i]))/ (scl_add_v-scl_add_n))+5);
LineTo (initialpos+wd,Round((Hmax-Hmin)*(scl_add_v-strtofloat(Eorb[i]))/ (scl_add_v-scl_add_n))+5);
XXout:=initialpos+wd;
YYout:=Round((Hmax-Hmin)*(scl_add_v-strtofloat(Eorb[i]))/ (scl_add_v-scl_add_n))+5;
NameOrb(i,homo,XXout,YYout);
end;
end;


Form15.PaintBox1.Canvas.Pen.Color:=ColorBox2.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox1.Items[Combobox1.ItemIndex]);
end;




if beta=true then begin
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox1.Items[Combobox1.ItemIndex]);

if (typ_beta[i]='O') or  (pos('-O',typ_beta[i])<>0) then Form15.PaintBox1.Canvas.Pen.Color:=ColorBox1.Selected
else  Form15.PaintBox1.Canvas.Pen.Color:=ColorBox2.Selected;
//Form15.PaintBox1.Canvas.Pen.Width:= strtoint(Combobox1.Items[Combobox1.ItemIndex]);
//////////////////////
if (radiobutton2.Checked) or   (radiobutton3.Checked) then begin
if checkbox1.Checked then begin
if (i=homo_beta) or (i=homo_beta-1)  then  begin
Form15.PaintBox1.Canvas.Pen.Color:=ColorBox3.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox2.Items[Combobox2.ItemIndex]);
end;
end;
end;
////////////////////




if (Radiobutton2.Checked=true) or (Radiobutton3.Checked=true) then begin
if Radiobutton2.Checked=true then  mmint1:=wd+st
else mmint1:=0;


MoveTo (initialpos+wd+st-mmint1, Round((Hmax-Hmin)* (1-((strtofloat(Eorb_beta[i])-mm2)/ (mm1-mm2))))+5);
LineTo (initialpos+wd*2+st-mmint1, Round((Hmax-Hmin)* (1-((strtofloat(Eorb_beta[i])-mm2)/ (mm1-mm2))))+5);
XXout:=initialpos+wd*2+st-mmint1;
YYout:=Round((Hmax-Hmin)* (1-((strtofloat(Eorb_beta[i])-mm2)/ (mm1-mm2))))+5;
NameOrb(i,homo_beta,XXout,YYout);

Form15.PaintBox1.Canvas.Pen.Color:=ColorBox2.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox1.Items[Combobox1.ItemIndex]);
end;
end;


end;

end;
end; ///////конец  диалога открытия одного файла


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
if dial=false then begin
mmint3:=0;
Hmax:=PaintBox1.ClientHeight-5;
Hmin:=5;
with Form15.PaintBox1.Canvas do begin
Pen.Width:=strtoint(Form15.Combobox1.Items[Form15.Combobox1.ItemIndex]);
Pen.Color:=clBlack;

for i:=0 to Form14.ComboBox1.Items.Count-1 do begin
for j:=0 to ch_mult[basket[i]] do begin
if (typ_mult[basket[i],j]='O')  or  (pos('-O',typ_mult[basket[i],j])<>0)  then Form15.PaintBox1.Canvas.Pen.Color:=ColorBox1.Selected
else  Form15.PaintBox1.Canvas.Pen.Color:=ColorBox2.Selected;

Pen.Width:= strtoint(Combobox1.Items[Combobox1.ItemIndex]);

////////////////////////
if radiobutton1.Checked then begin
if checkbox1.Checked then begin
if (j=homo_mult[basket[i]]) or (j=homo_mult[basket[i]]-1)  then  begin
Form15.PaintBox1.Canvas.Pen.Color:=ColorBox3.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox2.Items[Combobox2.ItemIndex]);
end;
end;
end;
////////////////////////






if (Radiobutton1.Checked=true) or (Radiobutton3.Checked=true) then begin


if (Radiobutton1.Checked=true) then begin
MoveTo (initialpos+(wd+st)*i, Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult[basket[i], j])-mm2)/ (mm1-mm2))))+5);
LineTo (initialpos+(wd+st)*i+wd, Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult[basket[i], j])-mm2)/ (mm1-mm2))))+5);
XXout:=initialpos+(wd+st)*i+wd;
YYout:=Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult[basket[i], j])-mm2)/ (mm1-mm2))))+5;
NameOrb(j,homo_mult[basket[i]],XXout,YYout);
end;

if (Radiobutton3.Checked=true) then begin

/////////////////////////
if radiobutton3.Checked then begin
if checkbox1.Checked then begin
if (j=homo_mult[basket[i]]) or (j=homo_mult[basket[i]]-1)  then  begin
Form15.PaintBox1.Canvas.Pen.Color:=ColorBox3.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox2.Items[Combobox2.ItemIndex]);
end;
end;
end;
////////////////////////////


MoveTo (initialpos+(wd+st)*(i+mmint3), Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult[basket[i], j])-mm2)/ (mm1-mm2))))+5);
LineTo (initialpos+(wd+st)*(i+mmint3)+wd, Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult[basket[i], j])-mm2)/ (mm1-mm2))))+5);
XXout:=initialpos+(wd+st)*(i+mmint3)+wd;
YYout:=Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult[basket[i], j])-mm2)/ (mm1-mm2))))+5;
NameOrb(j,homo_mult[basket[i]],XXout,YYout);
end;



Form15.PaintBox1.Canvas.Pen.Color:=ColorBox2.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=1;
end;




if beta_mult[basket[i]]=true then begin
if (typ_mult_beta[basket[i],j]='O') or  (pos('-O',typ_mult_beta[basket[i],j])<>0) then Form15.PaintBox1.Canvas.Pen.Color:=ColorBox1.Selected
else  Form15.PaintBox1.Canvas.Pen.Color:=ColorBox2.Selected;

Pen.Width:= strtoint(Combobox1.Items[Combobox1.ItemIndex]);
/////////////////////////
if (radiobutton2.Checked) or (radiobutton3.Checked) then begin
if checkbox1.Checked then begin
if (j=homo_mult_beta[basket[i]]) or (j=homo_mult_beta[basket[i]]-1)  then  begin
Form15.PaintBox1.Canvas.Pen.Color:=ColorBox3.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox2.Items[Combobox2.ItemIndex]);
end;
end;
end;
////////////////////////////



if (Radiobutton2.Checked=true) or (Radiobutton3.Checked=true) then begin
if  Radiobutton3.Checked=true then mmint1:=wd+st
else mmint1:=0;

/////if rad.but3. is checked!!!!!!!!!!!!
if (Radiobutton3.Checked=true) and (beta_mult[basket[i]]=true) then  begin
/////////////////////////
if radiobutton3.Checked then begin
if checkbox1.Checked then begin
if (j=homo_mult_beta[basket[i]]) or (j=homo_mult_beta[basket[i]]-1)  then  begin
Form15.PaintBox1.Canvas.Pen.Color:=ColorBox3.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=strtoint(Combobox2.Items[Combobox2.ItemIndex]);
end;
end;
end;
////////////////////////////

MoveTo (initialpos+(i+mmint3+1)*(wd+st), Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult_beta[basket[i], j])-mm2)/ (mm1-mm2))))+5);
LineTo (initialpos+(i+mmint3+1)*(wd+st)+wd, Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult_beta[basket[i], j])-mm2)/ (mm1-mm2))))+5);
XXout:=initialpos+(i+mmint3+1)*(wd+st)+wd;
YYout:=Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult_beta[basket[i], j])-mm2)/ (mm1-mm2))))+5;
NameOrb(j,homo_mult_beta[basket[i]],XXout,YYout);
end;


if (Radiobutton2.Checked=true) and (beta_mult[basket[i]]=true) then  begin
MoveTo (initialpos+wd*mmint3+(st*mmint3)+mmint1*(mmint3+1), Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult_beta[basket[i], j])-mm2)/ (mm1-mm2))))+5);
LineTo (initialpos+wd*mmint3+(st*mmint3)+wd+mmint1*(mmint3+1), Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult_beta[basket[i], j])-mm2)/ (mm1-mm2))))+5);
XXout:=initialpos+wd*mmint3+(st*mmint3)+wd+mmint1*(mmint3+1);
YYout:=Round((Hmax-Hmin)* (1-((strtofloat(Eorb_mult_beta[basket[i], j])-mm2)/ (mm1-mm2))))+5;
NameOrb(j,homo_mult_beta[basket[i]],XXout,YYout);
end;




Form15.PaintBox1.Canvas.Pen.Color:=ColorBox2.Selected;
Form15.PaintBox1.Canvas.Pen.Width:=1;
end;



end;

if checkbox2.checked=true then wid:=30 else  wid:=0;
if radiobutton1.Checked then            // в глоб. переменную заносим размер рамки
but1:= initialpos+wd*i+(st*i)+wd  +   10 + Wid;
if radiobutton2.Checked then
but2:= initialpos+wd*mmint3+(st*mmint3)+wd+mmint1*(mmint3+1)+10+Wid;
if radiobutton3.Checked then
but3:=initialpos+(i+mmint3+1)*(wd+st)+wd+10+Wid;
//////////////////////////


end;  // for j:=0 to ch_mult[Combobox1.ItemIndex] do begin


if (radiobutton2.checked=true) and (beta_mult[basket[i]]=true) then   mmint3:=mmint3+1;
if (radiobutton3.checked=true) and (beta_mult[basket[i]]=true) then   mmint3:=mmint3+1;

end;  // for i:=0 to Form14.ComboBox1.Items.Count-1 do begin
end;  // with Form14.PaintBox1.Canvas do begin


if (dial=false) and (radiobutton1.Checked=true) and (but1>W+10) then
PaintBox1.ClientWidth:=but1;
if (dial=false) and (radiobutton2.Checked=true) and (but2>W+10) then
PaintBox1.ClientWidth:=but2;
if (dial=false) and (radiobutton3.Checked=true) and (but3>W+10) then
PaintBox1.ClientWidth:=but3;

end; ///////конец  диалога открытия нескольких файлов


end;








procedure TForm15.FormShow(Sender: TObject);
begin
Form15.Resize;
end;








procedure TForm15.Timer1Timer(Sender: TObject);
begin
Form15.Resize;
Timer1.Enabled:=false;
end;









procedure TForm15.PaintBox2Paint(Sender: TObject);
var i,j: integer;
ras: string;
wd,st: word;
begin
if checkbox4.Checked then begin
wd:=Trackbar3.Position; // ширина орбитали
st:=Trackbar2.Position; // расстояние между штрихами
PaintBox2.ClientWidth:= PaintBox1.ClientWidth;
j:=-1;
for i:=0 to Form14.ComboBox1.Items.Count-1 do
begin
if pos('.out',Form14.ComboBox1.Items[i])<>0 then  ras:=copy(Form14.ComboBox1.Items[i],0,pos('.out',Form14.ComboBox1.Items[i])-1);
if pos('.log',Form14.ComboBox1.Items[i])<>0 then  ras:=copy(Form14.ComboBox1.Items[i],0,pos('.log',Form14.ComboBox1.Items[i])-1);
if Radiobutton1.Checked=true then begin
if dial=true then PaintBox2.Canvas.TextOut(initialpos,0,ras)
else  PaintBox2.Canvas.TextOut(initialpos+wd*i+(st*i),0,ras);
end;
if Radiobutton2.Checked=true then begin
if dial=true then PaintBox2.Canvas.TextOut(initialpos,0,ras)
else begin
if beta_mult[basket[i]]=true then begin j:=j+1;
PaintBox2.Canvas.TextOut(initialpos+wd*j+(st*j),0,ras);
end;
end;
end; ///////if Radiobutton2.Checked=true then begin


if Radiobutton3.Checked=true then begin
if dial=true then begin
PaintBox2.Canvas.TextOut(initialpos,0,ras+'(A)');
PaintBox2.Canvas.TextOut(initialpos+st+wd,0,ras+'(B)');
end;
end;



if Radiobutton3.Checked=true then begin
if dial=false then begin
if beta_mult[basket[i]]=true then  begin
PaintBox2.Canvas.TextOut(initialpos+(wd+st)*(i+j+1),0,ras+'(A)');
j:=j+1;
PaintBox2.Canvas.TextOut(initialpos+(wd+st)*(i+j+1),0,ras+'(B)');
end;
if beta_mult[basket[i]]=false then  begin
PaintBox2.Canvas.TextOut(initialpos+(wd+st)*(i+j+1),0,ras+'(A)');
end;
end;
end;

end;


end; //////////  if checkbox4.Checked then begin

end;

procedure TForm15.RadioButton3Click(Sender: TObject);
begin
if radiobutton3.Checked then begin
if (but3>0) and (but3>=W) then PaintBox1.ClientWidth:=but3;
if but3=0 then PaintBox1.ClientWidth:=W;
if (but3>0) and (but3<W) then PaintBox1.ClientWidth:=W;
PaintBox1.Invalidate;
PaintBox2.Invalidate;
Form15.Caption:='ALPHA/BETA-Levels';
end;
end;












procedure TForm15.TrackBar2Change(Sender: TObject);
begin
if Form15.Showing then begin
if radiobutton1.Checked then begin
if (but1>0) and (but1>=W) then PaintBox1.ClientWidth:=but1;
if but1=0 then PaintBox1.ClientWidth:=W;
if (but1>0) and (but1<W) then PaintBox1.ClientWidth:=W;
end;

if radiobutton2.Checked then begin
if (but2>0) and (but2>=W) then PaintBox1.ClientWidth:=but2;
if but2=0 then PaintBox1.ClientWidth:=W;
if (but2>0) and (but2<W) then PaintBox1.ClientWidth:=W;
end;

if radiobutton3.Checked then begin
if (but3>0) and (but3>=W) then PaintBox1.ClientWidth:=but3;
if but3=0 then PaintBox1.ClientWidth:=W;
if (but3>0) and (but3<W) then PaintBox1.ClientWidth:=W;
end;

PaintBox1.Refresh;
PaintBox2.Refresh;
end;
end;









procedure TForm15.TrackBar3Change(Sender: TObject);
begin
if Form15.Showing then begin
if radiobutton1.Checked then begin
if (but1>0) and (but1>=W) and (checkbox2.checked=false)  then PaintBox1.ClientWidth:=but1;
if (but1>0) and (but1>=W) and (checkbox2.checked=true)  then PaintBox1.ClientWidth:=but1+30;
if but1=0 then PaintBox1.ClientWidth:=W;
if (but1>0) and (but1<W) then PaintBox1.ClientWidth:=W;
end;

if radiobutton2.Checked then begin
if (but2>0) and (but2>=W) and (checkbox2.checked=false) then PaintBox1.ClientWidth:=but2;
if (but2>0) and (but2>=W) and (checkbox2.checked=true) then PaintBox1.ClientWidth:=but2+30;
if but2=0 then PaintBox1.ClientWidth:=W;
if (but2>0) and (but2<W) then PaintBox1.ClientWidth:=W;
end;

if radiobutton3.Checked then begin
if (but3>0) and (but3>=W) and (checkbox2.checked=false) then PaintBox1.ClientWidth:=but3;
if (but3>0) and (but3>=W) and (checkbox2.checked=true) then PaintBox1.ClientWidth:=but3+30;
if but3=0 then PaintBox1.ClientWidth:=W;
if (but3>0) and (but3<W) then PaintBox1.ClientWidth:=W;
end;



PaintBox1.Refresh;
PaintBox2.Refresh;
end;
end;














procedure TForm15.ColorBox1Change(Sender: TObject);
begin
PaintBox1.Refresh;
PaintBox2.Refresh;
end;

procedure TForm15.ColorBox2Change(Sender: TObject);
begin
PaintBox1.Refresh;
PaintBox2.Refresh;
end;

procedure TForm15.BitBtn1Click(Sender: TObject);
var mlt1, mlt2, mlt1_beta, mlt2_beta: array of real;
summ1,summ2,summ1_beta,summ2_beta: real;
j,count_beta: integer;
begin
summ1:=0;
summ2:=0;
summ1_beta:=0;
summ2_beta:=0;
count_beta:=0;
setlength(mlt1,Form14.Combobox1.Items.Count);
setlength(mlt2,Form14.Combobox1.Items.Count);
setlength(mlt1_beta,Form14.Combobox1.Items.Count);
setlength(mlt2_beta,Form14.Combobox1.Items.Count);
for j:=0 to Form14.Combobox1.Items.Count-1 do begin
if dial=true then begin
mlt1[j]:= (strtofloat(Eorb[ch])-strtofloat(Eorb[homo]))/(strtofloat(Eorb[ch])-strtofloat(Eorb[0]));
mlt2[j]:= (strtofloat(Eorb[ch])-strtofloat(Eorb[homo-1]))/(strtofloat(Eorb[ch])-strtofloat(Eorb[0]));
if beta=true then begin
mlt1_beta[j]:= (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[homo_beta]))/(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]));
mlt2_beta[j]:= (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[homo_beta-1]))/(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]));
end;
end
else begin
mlt1[j]:= (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],homo_mult[basket[j]]]))/(strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]));
mlt2[j]:= (strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],homo_mult[basket[j]]-1]))/(strtofloat(Eorb_mult[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult[basket[j],0]));
if beta_mult[basket[j]]=true then begin
mlt1_beta[j]:= (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],homo_mult_beta[basket[j]]]))/(strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]));
mlt2_beta[j]:= (strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],homo_mult_beta[basket[j]]-1]))/(strtofloat(Eorb_mult_beta[basket[j],ch_mult[basket[j]]])-strtofloat(Eorb_mult_beta[basket[j],0]));
end;
end;
end;    //for j:=0 to Form14.Combobox1.Items.Count-1 do begin

for j:=0 to Form14.Combobox1.Items.Count-1 do begin
summ1:=summ1+mlt1[j];
summ2:=summ2+mlt2[j];
if beta=true then  begin
summ1_beta:=summ1_beta+mlt1_beta[j];
summ2_beta:=summ2_beta+mlt2_beta[j];
count_beta:=count_beta+1;
end;
if beta_mult<>nil then begin
if beta_mult[basket[j]]=true then begin
summ1_beta:=summ1_beta+mlt1_beta[j];
summ2_beta:=summ2_beta+mlt2_beta[j];
count_beta:=count_beta+1;
end;
end;



end;
mlt:=(summ1+summ2)/(2*Form14.Combobox1.Items.Count);
if count_beta>0 then mlt_beta:=(summ1_beta+summ2_beta)/(2*count_beta);


if dial=true then begin
YdeltaVerh:=strtofloat(Eorb[0])+ (1-mlt)*(strtofloat(Eorb[ch])-strtofloat(Eorb[0]))  +   (strtofloat(Eorb[ch])-strtofloat(Eorb[0]))/(2*TrackBar1.Position);  // расстояние от центра поля до новорй верхней границы
YdeltaNiz:=strtofloat(Eorb[0])+ (1-mlt)*(strtofloat(Eorb[ch])-strtofloat(Eorb[0]))  -   (strtofloat(Eorb[ch])-strtofloat(Eorb[0]))/(2*TrackBar1.Position);   // расстояние от центра поля до новорй нижней границы
if beta=true then begin
YdeltaVerh_beta:=strtofloat(Eorb_beta[0])+ (1-mlt_beta)*(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))  +   (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))/(2*TrackBar1.Position);
YdeltaNiz_beta:=strtofloat(Eorb_beta[0])+ (1-mlt_beta)*(strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))  -   (strtofloat(Eorb_beta[ch])-strtofloat(Eorb_beta[0]))/(2*TrackBar1.Position);
end;
end
else begin
YdeltaVerh:=strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],0]) +(1-mlt)* (strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],ch_mult[basket[Form14.Combobox1.Itemindex]]])-strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],0]))   + (strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],ch_mult[basket[Form14.Combobox1.Itemindex]]])-strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],0]))/(2*TrackBar1.Position);  // расстояние от центра поля до новорй верхней границы
YdeltaNiz:=strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],0]) +(1-mlt)* (strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],ch_mult[basket[Form14.Combobox1.Itemindex]]])-strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],0]))   - (strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],ch_mult[basket[Form14.Combobox1.Itemindex]]])-strtofloat(Eorb_mult[basket[Form14.Combobox1.Itemindex],0]))/(2*TrackBar1.Position);   // расстояние от центра поля до новорй нижней границы
if beta_mult[basket[Form14.Combobox1.Itemindex]]=true then  begin
YdeltaVerh_beta:=strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],0]) +(1-mlt_beta)* (strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],ch_mult[basket[Form14.Combobox1.Itemindex]]])-strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],0]))   + (strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],ch_mult[basket[Form14.Combobox1.Itemindex]]])-strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],0]))/(2*TrackBar1.Position);  // расстояние от центра поля до новорй верхней границы
YdeltaNiz_beta:=strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],0]) +(1-mlt_beta)* (strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],ch_mult[basket[Form14.Combobox1.Itemindex]]])-strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],0]))   - (strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],ch_mult[basket[Form14.Combobox1.Itemindex]]])-strtofloat(Eorb_mult_beta[basket[Form14.Combobox1.Itemindex],0]))/(2*TrackBar1.Position);   // расстояние от центра поля до новорй нижней границы
end;
end;



PaintBox1.Repaint;






end;

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
YdeltaVerh:=0;
YdeltaNiz:=0;
YdeltaVerh_beta:=0;
YdeltaNiz_beta:=0;
TrackBar1.Position:=TrackBar1.Min;
end;

procedure TForm15.PaintBox1DblClick(Sender: TObject);
begin
YdeltaVerh:=0;
YdeltaNiz:=0;
YdeltaVerh_beta:=0;
YdeltaNiz_beta:=0;
TrackBar1.Position:=TrackBar1.Min;
Smes:=0;
PaintBox1.Repaint;
end;

procedure TForm15.CheckBox1Click(Sender: TObject);
begin
Paintbox1.Repaint;
end;

procedure TForm15.ColorBox3Change(Sender: TObject);
begin
Paintbox1.Repaint;
end;

procedure TForm15.ComboBox2Change(Sender: TObject);
begin
Paintbox1.Repaint;
end;

procedure TForm15.ComboBox1Change(Sender: TObject);
begin
PaintBox1.Repaint;
end;

procedure TForm15.TrackBar1Change(Sender: TObject);
label 0;
begin
Smes:=0;
if form15.Showing=true then begin
if Trackbar1.Position=1 then begin
YdeltaVerh:=0;
YdeltaNiz:=0;
YdeltaVerh_beta:=0;
YdeltaNiz_beta:=0;
goto 0;
end;
BitBtn1.Click;
0: PaintBox1.Repaint;
end;
end;

procedure TForm15.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
/////////////КНОПКА + ///////////////////////
if (ssShift) in SHIFT then begin
if key=VK_ADD then begin
Smes:=0;
while  trackbar1.Position<>TrackBar1.Max do begin
trackbar1.Position:=Trackbar1.Position+50;
break;
end;
end;
end
else begin
if key=VK_ADD then begin
Smes:=0;
while  trackbar1.Position<>TrackBar1.Max do begin
trackbar1.Position:=Trackbar1.Position+10;
break;
end;
end;
end;


//////////////КНОПКА - /////////////////////
if (ssShift) in SHIFT then begin
if key=VK_SUBTRACT then begin
Smes:=0;
while  trackbar1.Position<>TrackBar1.Min do begin
trackbar1.Position:=Trackbar1.Position-50;
break;
end;
end;
end
else begin
if key=VK_SUBTRACT then begin
Smes:=0;
while  trackbar1.Position<>TrackBar1.Min do begin
trackbar1.Position:=Trackbar1.Position-10;
break;
end;
end;
end;


/////////////////КНОПКА ВВЕРХ////////////////////

if (ssShift) in SHIFT then begin
if (key=ord('D')) or (key=ord('В')) then begin
Smes:=Smes+5;
PaintBox1.Refresh;
end;
end
else begin
if (key=ord('D')) or (key=ord('В')) then begin
Smes:=Smes+1;
PaintBox1.Refresh;
end;
end;


/////////////////КНОПКА ВВЕРХ////////////////////

if (ssShift) in SHIFT then begin
if (key=ord('U')) or (key=ord('Г')) then begin
Smes:=Smes-5;
PaintBox1.Refresh;
end;
end
else begin
if (key=ord('U')) or (key=ord('Г')) then begin
Smes:=Smes-1;
PaintBox1.Refresh;
end;
end;






end;

procedure TForm15.CheckBox2Click(Sender: TObject);
begin
//if checkbox2.Checked=true then PaintBox1.ClientWidth:=PaintBox1.ClientWidth+30;
//if checkbox2.Checked=false then PaintBox1.ClientWidth:=PaintBox1.ClientWidth-30;
PaintBox1.Repaint;
end;

procedure TForm15.NameOrb(a, b, c, d: integer);
begin
if checkbox2.Checked=true then begin
if a=b then begin
Form15.PaintBox1.Canvas.Font.Size:=7;
Form15.PaintBox1.Canvas.Font.Name:='Tahoma';
Form15.PaintBox1.Canvas.Font.Style:=[];
if checkbox3.Checked=false then Form15.PaintBox1.Canvas.TextOut(c+2,d-5,'НСМО')
else  Form15.PaintBox1.Canvas.TextOut(c+2,d-5,'LUMO')
end;
if a=b-1 then begin
Form15.PaintBox1.Canvas.Font.Size:=7;
Form15.PaintBox1.Canvas.Font.Name:='Tahoma';
Form15.PaintBox1.Canvas.Font.Style:=[];
if checkbox3.Checked=false then Form15.PaintBox1.Canvas.TextOut(c+2,d-5,'ВЗМО')
else  Form15.PaintBox1.Canvas.TextOut(c+2,d-5,'HOMO')
end;
end;   // checkbox2.Checked=true then begin




end;









procedure TForm15.CheckBox3Click(Sender: TObject);
begin
PaintBox1.Refresh;
end;

procedure TForm15.CheckBox4Click(Sender: TObject);
begin
PaintBox1.Refresh;
PaintBox2.Refresh;
end;

procedure TForm15.ColorBox4Change(Sender: TObject);
begin
PaintBox1.Refresh;
end;

procedure TForm15.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 Key := #0;
end;

procedure TForm15.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
 Key := #0;
end;

procedure TForm15.N1Click(Sender: TObject);
var
  Bitmap1, Bitmap2, Bitmap: TBitmap;
  a: widestring;
begin
Bitmap := TBitmap.Create;
Bitmap1 := TBitmap.Create;
Bitmap2 := TBitmap.Create;
Bitmap1.Height:=PaintBox1.ClientHeight;
Bitmap1.Width:=PaintBox1.ClientWidth;
Bitmap2.Height:=PaintBox2.ClientHeight;
Bitmap2.Width:=PaintBox2.ClientWidth;
Bitmap.Width:=Bitmap2.Width;
Bitmap.Height:=Bitmap1.Height+Bitmap2.Height;


Bitmap1.Canvas.CopyRect(Rect(0,0,Bitmap1.Width,Bitmap1.Height),PaintBox1.Canvas,PaintBox1.ClientRect);
Bitmap2.Canvas.CopyRect(Rect(0,0,Bitmap2.Width,Bitmap2.Height),PaintBox2.Canvas,PaintBox2.ClientRect);
Bitmap.Canvas.CopyRect(Rect(0,0,Bitmap1.Width,BitMap1.Height), Bitmap1.Canvas, Rect(0,0,Bitmap1.Width,BitMap1.Height));
Bitmap.Canvas.CopyRect(Rect(0,Bitmap1.Height,Bitmap2.Width,Bitmap1.Height+Bitmap2.Height), Bitmap2.Canvas, Rect(0,0,Bitmap2.Width,BitMap2.Height));




If SaveDialog1.Execute then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
Bitmap.SaveToFile(a);
end;
Bitmap.Free;
Bitmap1.Free;
Bitmap2.Free;
Savedialog1.FreeOnRelease;




end;


procedure TForm15.TrackBar1KeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;

procedure TForm15.ColorBox4KeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;

procedure TForm15.TrackBar2KeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;

procedure TForm15.TrackBar3KeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;

procedure TForm15.ColorBox1KeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;

procedure TForm15.ColorBox2KeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;

procedure TForm15.ColorBox3KeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;

end.
