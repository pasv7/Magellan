unit Unit21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math, ComCtrls, Types, Buttons;

type
  TForm21 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    Label2: TLabel;
    ScrollBox2: TScrollBox;
    TabSheet4: TTabSheet;
    ScrollBox3: TScrollBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ScrollBox4: TScrollBox;
    Label6: TLabel;
    ScrollBox5: TScrollBox;
    ScrollBox6: TScrollBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet5: TTabSheet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Label7: TLabel;
    ComboBox1: TComboBox;
    Label8: TLabel;
    ComboBox2: TComboBox;
    Label9: TLabel;
    ComboBox3: TComboBox;
    Label10: TLabel;
    ComboBox4: TComboBox;
    Label11: TLabel;
    ColorBox1: TColorBox;
    Label12: TLabel;
    ComboBox5: TComboBox;
    Label13: TLabel;
    ComboBox6: TComboBox;
    Label14: TLabel;
    Edit2: TEdit;
    Label15: TLabel;
    TabSheet6: TTabSheet;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    ComboBox7: TComboBox;
    Label16: TLabel;
    ComboBox8: TComboBox;
    Label17: TLabel;
    ComboBox9: TComboBox;
    Label18: TLabel;
    ComboBox10: TComboBox;
    Label19: TLabel;
    ColorBox2: TColorBox;
    Label20: TLabel;
    ComboBox11: TComboBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    ComboBox12: TComboBox;
    Label24: TLabel;
    ComboBox13: TComboBox;
    Label25: TLabel;
    ColorBox3: TColorBox;
    Label26: TLabel;
    ComboBox14: TComboBox;
    Label27: TLabel;
    CheckBox3: TCheckBox;
    Edit3: TEdit;
    Label28: TLabel;
    ComboBox15: TComboBox;
    Label29: TLabel;
    ComboBox16: TComboBox;
    Label30: TLabel;
    ColorBox4: TColorBox;
    Label31: TLabel;
    ComboBox17: TComboBox;
    Label32: TLabel;
    TrackBar1: TTrackBar;
    Label33: TLabel;
    TrackBar2: TTrackBar;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label34: TLabel;
    GroupBox2: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    TrackBar3: TTrackBar;
    Label35: TLabel;
    Edit4: TEdit;
    Label36: TLabel;
    Edit5: TEdit;
    Label37: TLabel;
    BitBtn5: TBitBtn;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    CheckBox4: TCheckBox;
    ColorBox5: TColorBox;
    Label87: TLabel;
    ComboBox18: TComboBox;
    Label88: TLabel;
    ComboBox19: TComboBox;
    Label89: TLabel;
    CheckBox5: TCheckBox;
    ColorBox6: TColorBox;
    Label90: TLabel;
    ComboBox20: TComboBox;
    Label91: TLabel;
    ComboBox21: TComboBox;
    Label92: TLabel;
    CheckBox6: TCheckBox;
    ColorBox7: TColorBox;
    Label93: TLabel;
    ComboBox22: TComboBox;
    Label94: TLabel;
    ComboBox23: TComboBox;
    Label95: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label96: TLabel;
    Label97: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;
  EDst1,EDst2,EDst3,EDst4,EDst5,EDst6,EDst7,EDst8,EDst9,EDst10,EDst11,EDst12,EDst13,EDst14,EDst15,EDx1,EDy1,EDx2,EDy2,EDx3,EDy3,EDx4,EDy4: array of TEdit;
  CBst1,CBst2,CBst3,CBst4,CBst5,CBst6,CBst7,CBst8,CBst9,CBst10,CBst11,CBst12,CBst13,CBst14,CBst15,CBst16,CBst17,CBst18,  CBst19,CBst20,CBst21,CBst22: array of TComboBox;
  ClBst1,ClBst2,ClBst3,ClBst4,ClBst5,ClBst6: array of TColorBox;
  LB,LB1: array of TLabel;
  ChB3: array of TCheckBox;
  del_pressed: boolean;


implementation

uses Unit20, Unit22, Unit19;

{$R *.dfm}

procedure TForm21.FormShow(Sender: TObject);
var Namepoint,Enpoint,Npoint,Epoint,Conn,Conn1: array of string;
s,i,k,p,j: word;
kk: boolean;
ScrPos: integer;
label 0;
begin
ScrPos:=ScrollBox1.VertScrollBar.Position;
BitBtn4.Enabled:=True;
////////////////////???? ?????????? ???? ? ??????? ????????? ??????? Enpoint ? Namepoint
if pos2=true then begin    // ???? ????? ??????? ??? ?????????? ????? DGR ? ????????? ? ?????
BitBtn4.Enabled:=False;
goto 0;
end;
s:=0;
setlength(Namepoint,length(EDN1));
setlength(Enpoint,length(EDN1));
for i:=0 to length(EDN1)-1 do begin
if i/2=round(i/2) then begin
Namepoint[s]:=EDN1[i].Text;
Enpoint[s]:=EDE1[i].Text;
end
else begin
Namepoint[s]:=EDN2[i].Text;
Enpoint[s]:=EDE2[i].Text;
end;
s:=s+1;
end;

for i:=0 to length(Namepoint)-1 do begin
if Namepoint[i]='' then  begin
setlength(Namepoint,i);
setlength(Enpoint,i);
break;
end;
end;




//////////////////////////???? ????????? ???? ? ??????? ??? ???????? NPoint ? Epoint
s:=0;
setlength(Npoint,s+1);
setlength(Epoint,s+1);
Npoint[0]:=Namepoint[0];
Epoint[0]:=floattostr((strtofloat(Enpoint[0])-strtofloat(Enpoint[chkzero]))*23.06*27.2116);

for i:=1 to length(Namepoint)-1 do begin
kk:=false;
for k:=0 to length(Npoint)-1 do
if Namepoint[i]=Npoint[k]  then kk:=true;
if kk=false then begin
s:=s+1;
setlength(Npoint,s+1);
setlength(Epoint,s+1);
Npoint[s]:=Namepoint[i];
Epoint[s]:=floattostr((strtofloat(Enpoint[i])-strtofloat(Enpoint[chkzero]))*23.06*27.2116);
end;
end;
////////////////////////////////////////////////////////////////////////////////////////





/////////////////???? ??????????-?????????
p:=0;
setlength(Conn,Round(length(EDN1)/2));
for j:=0 to length(Npoint)-1 do begin
for i:=0 to length(Npoint)-1 do begin
for k:=0 to length(Namepoint)-2 do begin
if (Npoint[j]=Namepoint[k]) and (Npoint[i]=Namepoint[k+1]) and (Round(k/2)=k/2) then begin
Conn[p]:=inttostr(j)+'--->'+inttostr(i);
p:=p+1;
end;
end;
end;
end;
/////////////////////////////////////////



//////////////////????? ???????? ??????????
s:=0;
setlength(Conn1,s+1);
Conn1[0]:=Conn[0];

for i:=1 to length(Conn)-1 do begin
kk:=false;
for k:=0 to length(Conn1)-1 do
if Conn[i]=Conn1[k]  then kk:=true;
if kk=false then begin
s:=s+1;
setlength(Conn1,s+1);
Conn1[s]:=Conn[i];
end;
end;

//////////////////////////////////////////////

setlength(Conn,length(Conn1));
for i:=0 to length(Conn)-1 do
Conn[i]:=Conn1[i];
















setlength(EDst1,length(Npoint));
setlength(EDst2,length(Npoint));
setlength(EDst3,length(Npoint));
setlength(EDst4,length(Npoint));
setlength(CBst1,length(Npoint));
setlength(CBst2,length(Npoint));
setlength(CBst3,length(Npoint));
setlength(CBst4,length(Npoint));
setlength(ClBst1,length(Npoint));

for i:=0 to length(Npoint)-1 do begin
EDst1[i]:=TEdit.Create(self);
EDst2[i]:=TEdit.Create(self);
EDst3[i]:=TEdit.Create(self);
EDst4[i]:=TEdit.Create(self);
CBst1[i]:=TCombobox.Create(self);
CBst2[i]:=TCombobox.Create(self);
CBst3[i]:=TCombobox.Create(self);
CBst4[i]:=TCombobox.Create(self);
ClBst1[i]:=TColorbox.Create(self);
EDst1[i].Parent:=Form21.ScrollBox1;
EDst2[i].Parent:=Form21.ScrollBox1;
EDst3[i].Parent:=Form21.ScrollBox1;
EDst4[i].Parent:=Form21.ScrollBox1;
CBst1[i].Parent:=Form21.ScrollBox1;
CBst2[i].Parent:=Form21.ScrollBox1;
CBst3[i].Parent:=Form21.ScrollBox1;
CBst4[i].Parent:=Form21.ScrollBox1;
ClBst1[i].Parent:=Form21.ScrollBox1;
end;



for i:=0 to length(Npoint)-1 do begin
EDst1[i].Left:=5;
EDst1[i].Width:=30;
EDst1[i].Top:=5+i*20;
EDst1[i].Text:=inttostr(i);         //??????? ?? ????? (????????????)

EDst2[i].Left:=EDst1[i].Left+EDst1[i].Width+25;
EDst2[i].Width:=30;
EDst2[i].Top:=5+i*20;
EDst2[i].Text:=inttostr(i);         //?????????? ????? ??? ?????????????

EDst3[i].Left:=EDst2[i].Left+EDst2[i].Width;
EDst3[i].Width:=140;
EDst3[i].Top:=5+i*20;
EDst3[i].Text:=Npoint[i];           //???

EDst4[i].Left:=EDst3[i].Left+EDst3[i].Width;
EDst4[i].Width:=60;
EDst4[i].Top:=5+i*20;
EDst4[i].Text:=floattostr(RoundTo(strtofloat(Epoint[i]),-1));           //???????

CBst1[i].Left:=EDst4[i].Left+EDst4[i].Width;
CBst1[i].Width:=65;
CBst1[i].Top:=5+i*20;
CBst1[i].Items.Add('LM');
CBst1[i].Items.Add('TS');
CBst1[i].Items.Add('CI');
CBst1[i].Items.Add('Mexp');
CBst1[i].ItemIndex:=0;

CBst2[i].Left:=CBst1[i].Left+CBst1[i].Width;
CBst2[i].Width:=65;
CBst2[i].Top:=5+i*20;
CBst2[i].Items.Add('Solid');
CBst2[i].Items.Add('Dash');
CBst2[i].Items.Add('Dot');
CBst2[i].ItemIndex:=0;

ClBst1[i].Left:=CBst2[i].Left+CBst2[i].Width;
ClBst1[i].Width:=95;
ClBst1[i].Top:=5+i*20;
ClBst1[i].Style:=[cbStandardColors,cbPrettyNames];

CBst3[i].Left:=ClBst1[i].Left+ClBst1[i].Width;
CBst3[i].Width:=50;
CBst3[i].Top:=5+i*20;
CBst3[i].Items.Add('1');
CBst3[i].Items.Add('2');
CBst3[i].Items.Add('3');
CBst3[i].Items.Add('4');
CBst3[i].Items.Add('5');
CBst3[i].ItemIndex:=2;

CBst4[i].Left:=CBst3[i].Left+CBst3[i].Width;
CBst4[i].Width:=50;
CBst4[i].Top:=5+i*20;
CBst4[i].Items.Add('15');
CBst4[i].Items.Add('20');
CBst4[i].Items.Add('25');
CBst4[i].Items.Add('30');
CBst4[i].Items.Add('40');
CBst4[i].Items.Add('50');
CBst4[i].ItemIndex:=3;
end;




for i:=0 to length(Conn)-1 do  begin
if Conn[i]='' then begin
setlength(Conn,i);
break;
end;
end;

/////////////////???? ??????????
setlength(ChB3,length(Conn));
setlength(EDst5,length(Conn));
setlength(EDst6,length(Conn));
setlength(CBst5,length(Conn));
setlength(CBst6,length(Conn));
setlength(ClBst2,length(Conn));
setlength(LB,length(Conn));


for i:=0 to length(Conn)-1 do begin
ChB3[i]:=TCheckBox.Create(self);
EDst5[i]:=TEdit.Create(self);
EDst6[i]:=TEdit.Create(self);
LB[i]:=TLabel.Create(self);
CBst5[i]:=TCombobox.Create(self);
CBst6[i]:=TCombobox.Create(self);
ClBst2[i]:=TColorbox.Create(self);
ChB3[i].Parent:=Form21.ScrollBox2;
EDst5[i].Parent:=Form21.ScrollBox2;
EDst6[i].Parent:=Form21.ScrollBox2;
CBst5[i].Parent:=Form21.ScrollBox2;
CBst6[i].Parent:=Form21.ScrollBox2;
LB[i].Parent:=Form21.ScrollBox2;
ClBst2[i].Parent:=Form21.ScrollBox2;
end;

for i:=0 to length(Conn)-1 do begin
ChB3[i].Left:=5;
ChB3[i].Width:=15;
ChB3[i].Top:=5+i*20+Round(EDst5[i].Height/2)-Round(ChB3[i].Height/2);
EDst5[i].Left:=ChB3[i].Left+ChB3[i].Width+3;
EDst5[i].Width:=30;
EDst5[i].Top:=5+i*20;
EDst5[i].Text:=copy(Conn[i],0,pos('--->',Conn[i])-1);
LB[i].Left:=EDst5[i].Left+EDst5[i].Width+5;
LB[i].Top:=EDst5[i].Top+Round(EDst5[i].Height/2)-Round(LB[i].Height/2);
LB[i].Caption:='---->';
LB[i].Visible:=True;
EDst6[i].Left:=LB[i].Left+LB[i].Width+5;
EDst6[i].Width:=30;
EDst6[i].Top:=5+i*20;
EDst6[i].Text:=copy(Conn[i],pos('--->',Conn[i])+4,500);

CBst5[i].Left:=EDst6[i].Left+EDst6[i].Width+35;
CBst5[i].Width:=50;
CBst5[i].Top:=5+i*20;
CBst5[i].Items.Add('none');
CBst5[i].Items.Add('1');
CBst5[i].Items.Add('2');
CBst5[i].Items.Add('3');
CBst5[i].ItemIndex:=1;

CBst6[i].Left:=CBst5[i].Left+CBst5[i].Width;
CBst6[i].Width:=70;
CBst6[i].Top:=5+i*20;
CBst6[i].Items.Add('Solid');
CBst6[i].Items.Add('Dash');
CBst6[i].Items.Add('Dot');
CBst6[i].ItemIndex:=0;

ClBst2[i].Left:=CBst6[i].Left+CBst6[i].Width;
ClBst2[i].Width:=100;
ClBst2[i].Top:=5+i*20;
ClBst2[i].Style:=[cbStandardColors,cbPrettyNames];





end; ////////////////////////////////




//////////////////////////////??????? ??????? (?????)
///////////////////////////1.1 ???????????? ???????????? ????? ? ?? ????????
setlength(EDst7,length(Npoint));
setlength(EDst8,length(Npoint));
setlength(CBst7,length(Npoint));
setlength(CBst8,length(Npoint));
setlength(CBst9,length(Npoint));
setlength(CBst10,length(Npoint));
setlength(ClBst3,length(Npoint));
setlength(EDx1,length(Npoint));
setlength(EDy1,length(Npoint));

for i:=0 to length(Npoint)-1 do begin
EDst7[i]:=TEdit.Create(self);
EDst8[i]:=TEdit.Create(self);
CBst7[i]:=TCombobox.Create(self);
CBst8[i]:=TCombobox.Create(self);
CBst9[i]:=TCombobox.Create(self);
CBst10[i]:=TCombobox.Create(self);
ClBst3[i]:=TColorbox.Create(self);
EDx1[i]:=TEdit.Create(self);
EDy1[i]:=TEdit.Create(self);
EDst7[i].Parent:=Form21.ScrollBox3;
EDst8[i].Parent:=Form21.ScrollBox3;
CBst7[i].Parent:=Form21.ScrollBox3;
CBst8[i].Parent:=Form21.ScrollBox3;
CBst9[i].Parent:=Form21.ScrollBox3;
CBst10[i].Parent:=Form21.ScrollBox3;
ClBst3[i].Parent:=Form21.ScrollBox3;
EDx1[i].Parent:=Form21.ScrollBox3;
EDy1[i].Parent:=Form21.ScrollBox3;
end;


for i:=0 to length(Npoint)-1 do begin
CBst7[i].Left:=5;
CBst7[i].Width:=70;
CBst7[i].Top:=5+i*20;
CBst7[i].Items.Add('None');
CBst7[i].Items.Add('Text');
CBst7[i].ItemIndex:=1;              //????? ??? ??????

EDst7[i].Left:=CBst7[i].Left+CBst7[i].Width+20;
EDst7[i].Width:=30;
EDst7[i].Top:=5+i*20;
EDst7[i].Text:=inttostr(i);         //?????  ?????

EDst8[i].Left:=EDst7[i].Left+EDst7[i].Width;
EDst8[i].Width:=140;
EDst8[i].Top:=5+i*20;
EDst8[i].Text:=Npoint[i];           //??? ?????

CBst8[i].Left:=EDst8[i].Left+EDst8[i].Width;
CBst8[i].Width:=130;
CBst8[i].Top:=5+i*20;
CBst8[i].Items.Add('Arial');
CBst8[i].Items.Add('Tahoma');
CBst8[i].Items.Add('Times New Roman');
CBst8[i].Items.Add('Courier New');
CBst8[i].ItemIndex:=0;           // ?????

CBst9[i].Left:=CBst8[i].Left+CBst8[i].Width;
CBst9[i].Width:=65;
CBst9[i].Top:=5+i*20;
CBst9[i].Items.Add('8 ??');
CBst9[i].Items.Add('9 ??');
CBst9[i].Items.Add('10 ??');
CBst9[i].Items.Add('11 ??');
CBst9[i].Items.Add('12 ??');
CBst9[i].Items.Add('13 ??');
CBst9[i].Items.Add('14 ??');
CBst9[i].ItemIndex:=2;

ClBst3[i].Left:=CBst9[i].Left+CBst9[i].Width;
ClBst3[i].Width:=95;
ClBst3[i].Top:=5+i*20;
ClBst3[i].Style:=[cbStandardColors,cbPrettyNames];
ClBst3[i].ItemIndex:=ClBst3[i].Items.IndexOf('Blue');

CBst10[i].Left:=ClBst3[i].Left+ClBst3[i].Width;
CBst10[i].Width:=130;
CBst10[i].Top:=5+i*20;
CBst10[i].Items.Add('Normal');
CBst10[i].Items.Add('Bold');
CBst10[i].Items.Add('Italic');
CBst10[i].Items.Add('Bold+Italic');
CBst10[i].Items.Add('Underline');
CBst10[i].Items.Add('Bold+Underline');
CBst10[i].Items.Add('Italic+Underline');
CBst10[i].Items.Add('Bold+Ital.+Underl.');
CBst10[i].ItemIndex:=0;

EDx1[i].Left:=CBst10[i].Left+CBst10[i].Width+3;
EDx1[i].Width:=40;
EDx1[i].Top:=5+i*20;
EDx1[i].Text:='0';

EDy1[i].Left:=EDx1[i].Left+EDx1[i].Width;
EDy1[i].Width:=40;
EDy1[i].Top:=5+i*20;
EDy1[i].Text:='0';



end;



///////////////////////////////1.2 ??????? ????? ? ?? ????????




setlength(EDst9,length(Npoint));
setlength(EDst10,length(Npoint));
setlength(CBst11,length(Npoint));
setlength(CBst12,length(Npoint));
setlength(CBst13,length(Npoint));
setlength(CBst14,length(Npoint));
setlength(ClBst4,length(Npoint));
setlength(EDx2,length(Npoint));
setlength(EDy2,length(Npoint));


for i:=0 to length(Npoint)-1 do begin
EDst9[i]:=TEdit.Create(self);
EDst10[i]:=TEdit.Create(self);
CBst11[i]:=TCombobox.Create(self);
CBst12[i]:=TCombobox.Create(self);
CBst13[i]:=TCombobox.Create(self);
CBst14[i]:=TCombobox.Create(self);
ClBst4[i]:=TColorbox.Create(self);
EDx2[i]:=TEdit.Create(self);
EDy2[i]:=TEdit.Create(self);
EDst9[i].Parent:=Form21.ScrollBox4;
EDst10[i].Parent:=Form21.ScrollBox4;
CBst11[i].Parent:=Form21.ScrollBox4;
CBst12[i].Parent:=Form21.ScrollBox4;
CBst13[i].Parent:=Form21.ScrollBox4;
CBst14[i].Parent:=Form21.ScrollBox4;
ClBst4[i].Parent:=Form21.ScrollBox4;
EDx2[i].Parent:=Form21.ScrollBox4;
EDy2[i].Parent:=Form21.ScrollBox4;
end;


for i:=0 to length(Npoint)-1 do begin
CBst11[i].Left:=5;
CBst11[i].Width:=70;
CBst11[i].Top:=5+i*20;
CBst11[i].Items.Add('None');
CBst11[i].Items.Add('Text');
CBst11[i].ItemIndex:=1;              //????? ??? ??????

EDst9[i].Left:=CBst11[i].Left+CBst11[i].Width+20;
EDst9[i].Width:=30;
EDst9[i].Top:=5+i*20;
EDst9[i].Text:=inttostr(i);         //?????  ?????

EDst10[i].Left:=EDst9[i].Left+EDst9[i].Width;
EDst10[i].Width:=140;
EDst10[i].Top:=5+i*20;
EDst10[i].Text:=floattostr(RoundTo(strtofloat(Epoint[i]),-1));           //??? ?????

CBst12[i].Left:=EDst10[i].Left+EDst10[i].Width;
CBst12[i].Width:=130;
CBst12[i].Top:=5+i*20;
CBst12[i].Items.Add('Arial');
CBst12[i].Items.Add('Tahoma');
CBst12[i].Items.Add('Times New Roman');
CBst12[i].Items.Add('Courier New');
CBst12[i].ItemIndex:=0;           // ?????

CBst13[i].Left:=CBst12[i].Left+CBst12[i].Width;
CBst13[i].Width:=65;
CBst13[i].Top:=5+i*20;
CBst13[i].Items.Add('8 ??');
CBst13[i].Items.Add('9 ??');
CBst13[i].Items.Add('10 ??');
CBst13[i].Items.Add('11 ??');
CBst13[i].Items.Add('12 ??');
CBst13[i].Items.Add('13 ??');
CBst13[i].Items.Add('14 ??');
CBst13[i].ItemIndex:=2;

ClBst4[i].Left:=CBst13[i].Left+CBst13[i].Width;
ClBst4[i].Width:=95;
ClBst4[i].Top:=5+i*20;
ClBst4[i].Style:=[cbStandardColors,cbPrettyNames];
ClBst4[i].ItemIndex:=ClBst4[i].Items.IndexOf('Black');

CBst14[i].Left:=ClBst4[i].Left+ClBst4[i].Width;
CBst14[i].Width:=130;
CBst14[i].Top:=5+i*20;
CBst14[i].Items.Add('Normal');
CBst14[i].Items.Add('Bold');
CBst14[i].Items.Add('Italic');
CBst14[i].Items.Add('Bold+Italic');
CBst14[i].Items.Add('Underline');
CBst14[i].Items.Add('Bold+Underline');
CBst14[i].Items.Add('Italic+Underline');
CBst14[i].Items.Add('Bold+Ital.+Underl.');
CBst14[i].ItemIndex:=0;

EDx2[i].Left:=CBst14[i].Left+CBst14[i].Width+3;
EDx2[i].Width:=40;
EDx2[i].Top:=5+i*20;
EDx2[i].Text:='0';

EDy2[i].Left:=EDx2[i].Left+EDx2[i].Width;
EDy2[i].Width:=40;
EDy2[i].Top:=5+i*20;
EDy2[i].Text:='0';


end;



/////////////////////////////1.3. ?????? ?????????? ? ?? ????????


setlength(EDst11,length(Npoint));
setlength(EDst12,length(Npoint));
setlength(CBst15,length(Npoint));
setlength(CBst16,length(Npoint));
setlength(CBst17,length(Npoint));
setlength(CBst18,length(Npoint));
setlength(ClBst5,length(Npoint));
setlength(EDx3,length(Npoint));
setlength(EDy3,length(Npoint));


for i:=0 to length(Npoint)-1 do begin
EDst11[i]:=TEdit.Create(self);
EDst12[i]:=TEdit.Create(self);
CBst15[i]:=TCombobox.Create(self);
CBst16[i]:=TCombobox.Create(self);
CBst17[i]:=TCombobox.Create(self);
CBst18[i]:=TCombobox.Create(self);
ClBst5[i]:=TColorbox.Create(self);
EDx3[i]:=TEdit.Create(self);
EDy3[i]:=TEdit.Create(self);
EDst11[i].Parent:=Form21.ScrollBox5;
EDst12[i].Parent:=Form21.ScrollBox5;
CBst15[i].Parent:=Form21.ScrollBox5;
CBst16[i].Parent:=Form21.ScrollBox5;
CBst17[i].Parent:=Form21.ScrollBox5;
CBst18[i].Parent:=Form21.ScrollBox5;
ClBst5[i].Parent:=Form21.ScrollBox5;
EDx3[i].Parent:=Form21.ScrollBox5;
EDy3[i].Parent:=Form21.ScrollBox5;
end;


for i:=0 to length(Npoint)-1 do begin
CBst15[i].Left:=5;
CBst15[i].Width:=70;
CBst15[i].Top:=5+i*20;
CBst15[i].Items.Add('None');
CBst15[i].Items.Add('Text');
CBst15[i].ItemIndex:=0;              //????? ??? ??????

EDst11[i].Left:=CBst15[i].Left+CBst15[i].Width+20;
EDst11[i].Width:=30;
EDst11[i].Top:=5+i*20;
EDst11[i].Text:=inttostr(i);         //?????  ?????

EDst12[i].Left:=EDst11[i].Left+EDst11[i].Width;
EDst12[i].Width:=140;
EDst12[i].Top:=5+i*20;
EDst12[i].Text:=inttostr(i);           //??? ?????

CBst16[i].Left:=EDst12[i].Left+EDst12[i].Width;
CBst16[i].Width:=130;
CBst16[i].Top:=5+i*20;
CBst16[i].Items.Add('Arial');
CBst16[i].Items.Add('Tahoma');
CBst16[i].Items.Add('Times New Roman');
CBst16[i].Items.Add('Courier New');
CBst16[i].ItemIndex:=0;           // ?????

CBst17[i].Left:=CBst16[i].Left+CBst16[i].Width;
CBst17[i].Width:=65;
CBst17[i].Top:=5+i*20;
CBst17[i].Items.Add('8 ??');
CBst17[i].Items.Add('9 ??');
CBst17[i].Items.Add('10 ??');
CBst17[i].Items.Add('11 ??');
CBst17[i].Items.Add('12 ??');
CBst17[i].Items.Add('13 ??');
CBst17[i].Items.Add('14 ??');
CBst17[i].ItemIndex:=2;

ClBst5[i].Left:=CBst17[i].Left+CBst17[i].Width;
ClBst5[i].Width:=95;
ClBst5[i].Top:=5+i*20;
ClBst5[i].Style:=[cbStandardColors,cbPrettyNames];
ClBst5[i].ItemIndex:=ClBst5[i].Items.IndexOf('Olive');

CBst18[i].Left:=ClBst5[i].Left+ClBst5[i].Width;
CBst18[i].Width:=130;
CBst18[i].Top:=5+i*20;
CBst18[i].Items.Add('Normal');
CBst18[i].Items.Add('Bold');
CBst18[i].Items.Add('Italic');
CBst18[i].Items.Add('Bold+Italic');
CBst18[i].Items.Add('Underline');
CBst18[i].Items.Add('Bold+Underline');
CBst18[i].Items.Add('Italic+Underline');
CBst18[i].Items.Add('Bold+Ital.+Underl.');
CBst18[i].ItemIndex:=0;


EDx3[i].Left:=CBst18[i].Left+CBst18[i].Width+3;
EDx3[i].Width:=40;
EDx3[i].Top:=5+i*20;
EDx3[i].Text:='0';

EDy3[i].Left:=EDx3[i].Left+EDx3[i].Width;
EDy3[i].Width:=40;
EDy3[i].Top:=5+i*20;
EDy3[i].Text:='0';



end;


////////////////////////??????? (???????????)

setlength(EDst13,length(EDst5));
setlength(EDst14,length(EDst5));
setlength(EDst15,length(EDst5));
setlength(CBst19,length(EDst5));
setlength(CBst20,length(EDst5));
setlength(CBst21,length(EDst5));
setlength(CBst22,length(EDst5));
setlength(ClBst6,length(EDst5));
setlength(LB1,length(EDst5));
setlength(EDx4,length(EDst5));
setlength(EDy4,length(EDst5));


for i:=0 to length(EDst5)-1 do begin
EDst13[i]:=TEdit.Create(self);
EDst14[i]:=TEdit.Create(self);
EDst15[i]:=TEdit.Create(self);
CBst19[i]:=TCombobox.Create(self);
CBst20[i]:=TCombobox.Create(self);
CBst21[i]:=TCombobox.Create(self);
CBst22[i]:=TCombobox.Create(self);
ClBst6[i]:=TColorbox.Create(self);
LB1[i]:=TLabel.Create(self);
EDx4[i]:=TEdit.Create(self);
EDy4[i]:=TEdit.Create(self);
EDst13[i].Parent:=Form21.ScrollBox6;
EDst14[i].Parent:=Form21.ScrollBox6;
EDst15[i].Parent:=Form21.ScrollBox6;
CBst19[i].Parent:=Form21.ScrollBox6;
CBst20[i].Parent:=Form21.ScrollBox6;
CBst21[i].Parent:=Form21.ScrollBox6;
CBst22[i].Parent:=Form21.ScrollBox6;
ClBst6[i].Parent:=Form21.ScrollBox6;
LB1[i].Parent:=Form21.ScrollBox6;
EDx4[i].Parent:=Form21.ScrollBox6;
EDy4[i].Parent:=Form21.ScrollBox6;
end;


for i:=0 to length(EDst5)-1 do begin
CBst19[i].Left:=5;
CBst19[i].Width:=70;
CBst19[i].Top:=5+i*20;
CBst19[i].Items.Add('None');
CBst19[i].Items.Add('Text');
CBst19[i].ItemIndex:=1;              //????? ??? ??????

EDst13[i].Left:=CBst19[i].Left+CBst19[i].Width+20;
EDst13[i].Width:=30;
EDst13[i].Top:=5+i*20;
EDst13[i].Text:=EDst5[i].Text;         // ???????

LB1[i].Left:=EDst13[i].Left+EDst13[i].Width+5;
LB1[i].Top:=EDst13[i].Top+Round(EDst13[i].Height/2)-Round(LB1[i].Height/2);
LB1[i].Caption:='---->';

EDst14[i].Left:=LB1[i].Left+LB1[i].Width+5;
EDst14[i].Width:=30;
EDst14[i].Top:=5+i*20;
EDst14[i].Text:=EDst6[i].Text;           //???????

EDst15[i].Left:=EDst14[i].Left+EDst14[i].Width+5;
EDst15[i].Width:=60;
EDst15[i].Top:=5+i*20;
EDst15[i].Text:=floattostr(strtofloat(EDst4[strtoint(EDst14[i].Text)].Text)-strtofloat(EDst4[strtoint(EDst13[i].Text)].Text));  /////////////////////////////???? ??????? ????????!!!!!


CBst20[i].Left:=EDst15[i].Left+EDst15[i].Width;
CBst20[i].Width:=140;
CBst20[i].Top:=5+i*20;
CBst20[i].Items.Add('Arial');
CBst20[i].Items.Add('Tahoma');
CBst20[i].Items.Add('Times New Roman');
CBst20[i].Items.Add('Courier New');
CBst20[i].ItemIndex:=0;           // ?????

CBst21[i].Left:=CBst20[i].Left+CBst20[i].Width;
CBst21[i].Width:=65;
CBst21[i].Top:=5+i*20;
CBst21[i].Items.Add('8 ??');
CBst21[i].Items.Add('9 ??');
CBst21[i].Items.Add('10 ??');
CBst21[i].Items.Add('11 ??');
CBst21[i].Items.Add('12 ??');
CBst21[i].Items.Add('13 ??');
CBst21[i].Items.Add('14 ??');
CBst21[i].ItemIndex:=2;

ClBst6[i].Left:=CBst21[i].Left+CBst21[i].Width;
ClBst6[i].Width:=95;
ClBst6[i].Top:=5+i*20;
ClBst6[i].Style:=[cbStandardColors,cbPrettyNames];
ClBst6[i].ItemIndex:=ClBst6[i].Items.IndexOf('Red');

CBst22[i].Left:=ClBst6[i].Left+ClBst6[i].Width;
CBst22[i].Width:=130;
CBst22[i].Top:=5+i*20;
CBst22[i].Items.Add('Normal');
CBst22[i].Items.Add('Bold');
CBst22[i].Items.Add('Italic');
CBst22[i].Items.Add('Bold+Italic');
CBst22[i].Items.Add('Underline');
CBst22[i].Items.Add('Bold+Underline');
CBst22[i].Items.Add('Italic+Underline');
CBst22[i].Items.Add('Bold+Ital.+Underl.');
CBst22[i].ItemIndex:=1;


EDx4[i].Left:=CBst22[i].Left+CBst22[i].Width+3;
EDx4[i].Width:=40;
EDx4[i].Top:=5+i*20;
EDx4[i].Text:='0';

EDy4[i].Left:=EDx4[i].Left+EDx4[i].Width;
EDy4[i].Width:=40;
EDy4[i].Top:=5+i*20;
EDy4[i].Text:='0';





end;














0: end;



procedure TForm21.BitBtn2Click(Sender: TObject);
var i,s,n,m,posi,j: word;
EDst5TEMP,EDst6TEMP: array of TEdit;
CBst5TEMP,CBst6TEMP: array of TComboBox;
ClBst2TEMP: array of TColorBox;
LBTEMP:  array of TLabel;
ChB1TEMP: array of TCheckBox;
EDst13tmp,EDst14tmp,EDst15tmp,EDx4tmp,EDy4tmp,CBst19tmp,CBst20tmp,CBst21tmp,CBst22tmp,ClBst6tmp: array of widestring;
delitem,othitem: array of integer;
label 0;

begin
posi:=ScrollBox2.VertScrollBar.Position;
if length(EDst5)=0 then goto 0;
s:=0;
j:=0;
for i:=0 to length(EDst5)-1 do begin
if ChB3<>nil then begin
if ChB3[i]<>nil then begin
if ChB3[i].Checked=True then begin
FreeAndNil(ChB3[i]);
FreeAndNil(EDst5[i]);
FreeAndNil(EDst6[i]);
FreeAndNil(CBst5[i]);
FreeAndNil(CBst6[i]);
FreeAndNil(ClBst2[i]);
FreeAndNil(LB[i]);
setlength(delitem,length(delitem)+1);
delitem[s]:=i;                          // ?????? ????????? ?????????
s:=s+1;
end
else begin
setlength(othitem,length(othitem)+1);
othitem[j]:=i;
j:=j+1;
end;
end;
end;
end;







ScrollBox2.VertScrollBar.Position:=0;


s:=0;
for i:=0 to length(EDst5)-1 do begin
if EDst5[i]<>nil then  begin
EDst5[i].Top:=5+s*20;
EDst6[i].Top:=5+s*20;
CBst5[i].Top:=5+s*20;
CBst6[i].Top:=5+s*20;
ClBst2[i].Top:=5+s*20;
ChB3[i].Top:=EDst5[i].Top+Round(EDst5[i].Height/2)-Round(ChB3[i].Height/2);
LB[i].Top:=EDst5[i].Top+Round(EDst5[i].Height/2)-Round(LB[i].Height/2);
s:=s+1;
end;
end;

indexx:=s;
del_pressed:=true;

//???????? ?????? ????????? ?? ?? ????? ??????

setlength(EDst5TEMP,s);
setlength(EDst6TEMP,s);
setlength(CBst5TEMP,s);
setlength(CBst6TEMP,s);
setlength(ClBst2TEMP,s);
setlength(LBTEMP,s);
setlength(ChB1TEMP,s);


n:=0;
m:=0;
for i:=0 to length(EDst5)-1 do begin
if EDst5[i]<>nil then  begin
EDst5TEMP[n]:=TEdit.Create(nil);
EDst6TEMP[n]:=TEdit.Create(nil);
ChB1TEMP[n]:=TCheckBox.Create(nil);
CBst5TEMP[n]:=TComboBox.Create(nil);
CBst6TEMP[n]:=TComboBox.Create(nil);
ClBst2TEMP[n]:=TColorBox.Create(nil);
LBTEMP[n]:=TLabel.Create(nil);


EDst5TEMP[n]:=EDst5[i];
EDst6TEMP[n]:=EDst6[i];
CBst5TEMP[n]:=CBst5[i];
CBst6TEMP[n]:=CBst6[i];
ClBst2TEMP[n]:=ClBst2[i];
ChB1TEMP[n]:=ChB3[i];
LBTEMP[n]:=LB[i];


n:=n+1;
end;
end;


setlength(EDst5,s);
setlength(EDst6,s);
setlength(CBst5,s);
setlength(CBst6,s);
setlength(ClBst2,s);
setlength(ChB3,s);
setlength(LB,s);


if length(EDst5)= 0 then goto 0;

for i:=0 to length(EDst5)-1 do begin
EDst5[i]:=EDst5TEMP[i];
EDst6[i]:=EDst6TEMP[i];
CBst5[i]:=CBst5TEMP[i];
CBst6[i]:=CBst6TEMP[i];
ClBst2[i]:=ClBst2TEMP[i];
ChB3[i]:=ChB1TEMP[i];
LB[i]:=LBTEMP[i];
end;

indexx:=s;
indi:=true;
//for i:=0 to 2*s-1 do
//EDN1[i]:=EDTEMP[i];

ScrollBox2.VertScrollBar.Position:=posi;





///////////////////// ?????????? ??? ???????? ????????? - ????????
//////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////// ?? SCROLLBOX6////////////////////////////////////
///////////////////////////////////////////////////////////////////////////


// ????? ???????? ?????? ???????? ??? ??????????? ?????? ??????????????: ??? ?????????? ????????? ? ????? ????? ???????

//???????? ????????? ????????? ? ????????? ????????

setlength(EDst13tmp,length(EDst13));
setlength(EDst14tmp,length(EDst14));
setlength(EDst15tmp,length(EDst15));
setlength(CBst19tmp,length(CBst19));
setlength(CBst20tmp,length(CBst20));
setlength(CBst21tmp,length(CBst21));
setlength(CBst22tmp,length(CBst22));
setlength(ClBst6tmp,length(ClBst6));
setlength(EDx4tmp,length(EDx4));
setlength(EDy4tmp,length(EDy4));

for i:=0 to length(EDst13)-1 do begin
EDst13tmp[i]:=EDst13[i].Text;
EDst14tmp[i]:=EDst14[i].Text;
EDst15tmp[i]:=EDst15[i].Text;
CBst19tmp[i]:=CBst19[i].Text;
CBst20tmp[i]:=CBst20[i].Text;
CBst21tmp[i]:=CBst21[i].Text;
CBst22tmp[i]:=CBst22[i].Text;
ClBst6tmp[i]:=ClBst6[i].ColorNames[ClBst6[i].ItemIndex];
EDx4tmp[i]:=EDx4[i].Text;
EDy4tmp[i]:=EDy4[i].Text;
end;                        // ?????????!!!




for i:=0 to length(EDst13)-1 do begin     // ??????? ??????? ??? ????????
if EDst13[i]<>nil then begin
FreeAndNil(EDst13[i]);
FreeAndNil(EDst14[i]);
FreeAndNil(EDst15[i]);
FreeAndNil(CBst19[i]);
FreeAndNil(CBst20[i]);
FreeAndNil(CBst21[i]);
FreeAndNil(CBst22[i]);
FreeAndNil(ClBst6[i]);
FreeAndNil(LB1[i]);
FreeAndNil(EDx4[i]);
FreeAndNil(EDy4[i]);
end;
end;

ScrollBox6.VertScrollBar.Position:=0;

                                           // ????? ????????? ?? ??????



posi:=ScrollBox6.VertScrollBar.Position;

setlength(EDst13,length(EDst5));
setlength(EDst14,length(EDst5));
setlength(EDst15,length(EDst5));
setlength(CBst19,length(EDst5));
setlength(CBst20,length(EDst5));
setlength(CBst21,length(EDst5));
setlength(CBst22,length(EDst5));
setlength(ClBst6,length(EDst5));
setlength(LB1,length(EDst5));
setlength(EDx4,length(EDst5));
setlength(EDy4,length(EDst5));


for i:=0 to length(EDst5)-1 do begin
EDst13[i]:=TEdit.Create(self);
EDst14[i]:=TEdit.Create(self);
EDst15[i]:=TEdit.Create(self);
CBst19[i]:=TCombobox.Create(self);
CBst20[i]:=TCombobox.Create(self);
CBst21[i]:=TCombobox.Create(self);
CBst22[i]:=TCombobox.Create(self);
ClBst6[i]:=TColorbox.Create(self);
LB1[i]:=TLabel.Create(self);
EDx4[i]:=TEdit.Create(self);
EDy4[i]:=TEdit.Create(self);
EDst13[i].Parent:=Form21.ScrollBox6;
EDst14[i].Parent:=Form21.ScrollBox6;
EDst15[i].Parent:=Form21.ScrollBox6;
CBst19[i].Parent:=Form21.ScrollBox6;
CBst20[i].Parent:=Form21.ScrollBox6;
CBst21[i].Parent:=Form21.ScrollBox6;
CBst22[i].Parent:=Form21.ScrollBox6;
ClBst6[i].Parent:=Form21.ScrollBox6;
LB1[i].Parent:=Form21.ScrollBox6;
EDx4[i].Parent:=Form21.ScrollBox6;
EDy4[i].Parent:=Form21.ScrollBox6;
end;


for i:=0 to length(othitem)-1 do begin
CBst19[i].Left:=5;
CBst19[i].Width:=70;
CBst19[i].Top:=5+i*20;
CBst19[i].Items.Add('None');
CBst19[i].Items.Add('Text');
CBst19[i].ItemIndex:=CBst19[i].Items.IndexOf(CBst19tmp[othitem[i]]);              //????? ??? ??????

EDst13[i].Left:=CBst19[i].Left+CBst19[i].Width+20;
EDst13[i].Width:=30;
EDst13[i].Top:=5+i*20;
EDst13[i].Text:=EDst5[i].Text;         // ???????

LB1[i].Left:=EDst13[i].Left+EDst13[i].Width+5;
LB1[i].Top:=EDst13[i].Top+Round(EDst13[i].Height/2)-Round(LB1[i].Height/2);
LB1[i].Caption:='---->';

EDst14[i].Left:=LB1[i].Left+LB1[i].Width+5;
EDst14[i].Width:=30;
EDst14[i].Top:=5+i*20;
EDst14[i].Text:=EDst6[i].Text;           //???????

EDst15[i].Left:=EDst14[i].Left+EDst14[i].Width+5;
EDst15[i].Width:=60;
EDst15[i].Top:=5+i*20;
EDst15[i].Text:=floattostr(strtofloat(EDst4[strtoint(EDst14[i].Text)].Text)-strtofloat(EDst4[strtoint(EDst13[i].Text)].Text));  /////////////////////////////???? ??????? ????????!!!!!


CBst20[i].Left:=EDst15[i].Left+EDst15[i].Width;
CBst20[i].Width:=140;
CBst20[i].Top:=5+i*20;
CBst20[i].Items.Add('Arial');
CBst20[i].Items.Add('Tahoma');
CBst20[i].Items.Add('Times New Roman');
CBst20[i].Items.Add('Courier New');
CBst20[i].ItemIndex:= CBst20[i].Items.IndexOf(CBst20tmp[othitem[i]]);           // ?????


CBst21[i].Left:=CBst20[i].Left+CBst20[i].Width;
CBst21[i].Width:=65;
CBst21[i].Top:=5+i*20;
CBst21[i].Items.Add('8 ??');
CBst21[i].Items.Add('9 ??');
CBst21[i].Items.Add('10 ??');
CBst21[i].Items.Add('11 ??');
CBst21[i].Items.Add('12 ??');
CBst21[i].Items.Add('13 ??');
CBst21[i].Items.Add('14 ??');
CBst21[i].ItemIndex:= CBst21[i].Items.IndexOf(CBst21tmp[othitem[i]]);

ClBst6[i].Left:=CBst21[i].Left+CBst21[i].Width;
ClBst6[i].Width:=95;
ClBst6[i].Top:=5+i*20;
ClBst6[i].Style:=[cbStandardColors,cbPrettyNames];
ClBst6[i].ItemIndex:=ClBst6[i].Items.IndexOf(ClBst6tmp[othitem[i]]);

CBst22[i].Left:=ClBst6[i].Left+ClBst6[i].Width;
CBst22[i].Width:=130;
CBst22[i].Top:=5+i*20;
CBst22[i].Items.Add('Normal');
CBst22[i].Items.Add('Bold');
CBst22[i].Items.Add('Italic');
CBst22[i].Items.Add('Bold+Italic');
CBst22[i].Items.Add('Underline');
CBst22[i].Items.Add('Bold+Underline');
CBst22[i].Items.Add('Italic+Underline');
CBst22[i].Items.Add('Bold+Ital.+Underl.');
CBst22[i].ItemIndex:= CBst22[i].Items.IndexOf(CBst22tmp[othitem[i]]);


EDx4[i].Left:=CBst22[i].Left+CBst22[i].Width+3;
EDx4[i].Width:=40;
EDx4[i].Top:=5+i*20;
EDx4[i].Text:=EDx4tmp[othitem[i]];

EDy4[i].Left:=EDx4[i].Left+EDx4[i].Width;
EDy4[i].Width:=40;
EDy4[i].Top:=5+i*20;
EDy4[i].Text:=EDy4tmp[othitem[i]];

ScrollBox6.VertScrollBar.Position:=posi;


end;

























































































0: end;









procedure TForm21.BitBtn1Click(Sender: TObject);
var p,posi,pos15,pos16,pos17,pos18,sp: word;    //pos15,pos16,pos17 - ??????? ? inputbox
vlinp: string;
d: integer;
label 0;
begin
p:=length(EDst5);
posi:=ScrollBox2.VertScrollBar.Position;

setlength(EDst5,p+1);
setlength(EDst6,p+1);
setlength(CBst5,p+1);
setlength(CBst6,p+1);
setlength(ClBst2,p+1);
setlength(ChB3,p+1);
setlength(LB,p+1);


EDst5[p]:=TEdit.Create(self);
EDst6[p]:=TEdit.Create(self);
CBst5[p]:=TComboBox.Create(self);
CBst6[p]:=TComboBox.Create(self);
ClBst2[p]:=TColorBox.Create(self);
ChB3[p]:=TCheckBox.Create(self);
LB[p]:=TLabel.Create(self);

EDst5[p].Parent:=Form21.ScrollBox2;
EDst6[p].Parent:=Form21.ScrollBox2;
CBst5[p].Parent:=Form21.ScrollBox2;
CBst6[p].Parent:=Form21.ScrollBox2;
ClBst2[p].Parent:=Form21.ScrollBox2;
ChB3[p].Parent:=Form21.ScrollBox2;
LB[p].Parent:=Form21.ScrollBox2;

Scrollbox2.VertScrollBar.Position:=0;


ChB3[p].Left:=5;
ChB3[p].Width:=15;
ChB3[p].Top:=5+p*20+Round(EDst5[p].Height/2)-Round(ChB3[p].Height/2);
EDst5[p].Left:=ChB3[p].Left+ChB3[p].Width+3;
EDst5[p].Width:=30;
EDst5[p].Top:=5+p*20;

LB[p].Left:=EDst5[p].Left+EDst5[p].Width+5;
LB[p].Top:=EDst5[p].Top+Round(EDst5[p].Height/2)-Round(LB[p].Height/2);
LB[p].Caption:='---->';
EDst6[p].Left:=LB[p].Left+LB[p].Width+5;
EDst6[p].Width:=30;
EDst6[p].Top:=5+p*20;


CBst5[p].Left:=EDst6[p].Left+EDst6[p].Width+35;
CBst5[p].Width:=50;
CBst5[p].Top:=5+p*20;
CBst5[p].Items.Add('none');
CBst5[p].Items.Add('1');
CBst5[p].Items.Add('2');
CBst5[p].Items.Add('3');
CBst5[p].ItemIndex:=1;

CBst6[p].Left:=CBst5[p].Left+CBst5[p].Width;
CBst6[p].Width:=70;
CBst6[p].Top:=5+p*20;
CBst6[p].Items.Add('Solid');
CBst6[p].Items.Add('Dot');
CBst6[p].Items.Add('Dash');
CBst6[p].ItemIndex:=0;

ClBst2[p].Left:=CBst6[p].Left+CBst6[p].Width;
ClBst2[p].Height:=Edst5[p].Height;
ClBst2[p].Width:=100;
ClBst2[p].Top:=5+p*20;
ClBst2[p].Style:=[cbStandardColors,cbPrettyNames];

vlinp:=inputbox('???? ?????????? ???????????? ???????','??????? ?????? ?????, ??????????????? ????????? ? ????????? ? ??????? A B',vlinp);

if (vlinp='') or (pos(' ',vlinp)=0) then vlinp:='0 0';



pos15:=0;
pos16:=0;
pos17:=0;
pos18:=0;

for sp:=1 to length(vlinp) do begin
if (copy(vlinp,sp,1)=' ') then pos15:=pos15+1         //??????? ?? ????????
else break;
end;
for sp:=1 to length(vlinp) do  begin
if (copy(vlinp,pos15+sp,1)<>' ') then pos16:=pos16+1       //???????
else break;
end;
for sp:=1 to length(vlinp) do  begin
if (copy(vlinp,pos15+pos16+sp,1)=' ') then pos17:=pos17+1      //??????? ???????-???? ??? ???????-?????? ??????????
else break;
end;
for sp:=1 to length(vlinp) do  begin
if (copy(vlinp,pos15+pos16+pos17+sp,1)<>' ') then pos18:=pos18+1   //???? ??? 1-?? ??????????
else break;
end;



EDst5[p].Text:=copy(vlinp,pos15+1,pos16);
EDst6[p].Text:=copy(vlinp,pos15+pos16+pos17+1,pos18);

if (EDst5[p].Text='') or (EDst5[p].Text=' ') then  EDst5[p].Text:='0';
if (EDst6[p].Text='') or (EDst6[p].Text=' ') then  EDst6[p].Text:='0';

if TryStrToInt(EDst5[p].Text,d)=false then EDst5[p].Text:='0';
if TryStrToInt(EDst6[p].Text,d)=false then EDst6[p].Text:='0';


Scrollbox2.VertScrollBar.Position:=posi;





//// ? ?????? ???????? ??? ??????????? ???? ?????? ????????????? ??????????? ???????
///////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

setlength(CBst19,length(CBst19)+1);
setlength(EDst13,length(EDst13)+1);
setlength(LB1,length(LB1)+1);
setlength(EDst14,length(EDst14)+1);
setlength(EDst15,length(EDst15)+1);
setlength(CBst20,length(CBst20)+1);
setlength(CBst21,length(CBst21)+1);
setlength(ClBst6,length(ClBst6)+1);
setlength(CBst22,length(CBst22)+1);
setlength(EDx4,length(EDx4)+1);
setlength(EDy4,length(EDy4)+1);
p:=length(CBst19)-1;
posi:=ScrollBox6.VertScrollBar.Position;


EDst13[p]:=TEdit.Create(self);
EDst14[p]:=TEdit.Create(self);
EDst15[p]:=TEdit.Create(self);
CBst19[p]:=TCombobox.Create(self);
CBst20[p]:=TCombobox.Create(self);
CBst21[p]:=TCombobox.Create(self);
CBst22[p]:=TCombobox.Create(self);
ClBst6[p]:=TColorbox.Create(self);
LB1[p]:=TLabel.Create(self);
EDx4[p]:=TEdit.Create(self);
EDy4[p]:=TEdit.Create(self);
EDst13[p].Parent:=Form21.ScrollBox6;
EDst14[p].Parent:=Form21.ScrollBox6;
EDst15[p].Parent:=Form21.ScrollBox6;
CBst19[p].Parent:=Form21.ScrollBox6;
CBst20[p].Parent:=Form21.ScrollBox6;
CBst21[p].Parent:=Form21.ScrollBox6;
CBst22[p].Parent:=Form21.ScrollBox6;
ClBst6[p].Parent:=Form21.ScrollBox6;
LB1[p].Parent:=Form21.ScrollBox6;
EDx4[p].Parent:=Form21.ScrollBox6;
EDy4[p].Parent:=Form21.ScrollBox6;




CBst19[p].Left:=5;
CBst19[p].Width:=70;
CBst19[p].Top:=5+p*20;
CBst19[p].Items.Add('None');
CBst19[p].Items.Add('Text');
CBst19[p].ItemIndex:=1;              //????? ??? ??????

EDst13[p].Left:=CBst19[p].Left+CBst19[p].Width+20;
EDst13[p].Width:=30;
EDst13[p].Top:=5+p*20;
EDst13[p].Text:=EDst5[p].Text;         // ???????

LB1[p].Left:=EDst13[p].Left+EDst13[p].Width+5;
LB1[p].Top:=EDst13[p].Top+Round(EDst13[p].Height/2)-Round(LB1[p].Height/2);
LB1[p].Caption:='---->';

EDst14[p].Left:=LB1[p].Left+LB1[p].Width+5;
EDst14[p].Width:=30;
EDst14[p].Top:=5+p*20;
EDst14[p].Text:=EDst6[p].Text;           //???????

EDst15[p].Left:=EDst14[p].Left+EDst14[p].Width+5;
EDst15[p].Width:=60;
EDst15[p].Top:=5+p*20;
EDst15[p].Text:=floattostr(strtofloat(EDst4[strtoint(EDst14[p].Text)].Text)-strtofloat(EDst4[strtoint(EDst13[p].Text)].Text));  /////////////////////////////???? ??????? ????????!!!!!


CBst20[p].Left:=EDst15[p].Left+EDst15[p].Width;
CBst20[p].Width:=140;
CBst20[p].Top:=5+p*20;
CBst20[p].Items.Add('Arial');
CBst20[p].Items.Add('Tahoma');
CBst20[p].Items.Add('Times New Roman');
CBst20[p].Items.Add('Courier New');
CBst20[p].ItemIndex:=0;           // ?????

CBst21[p].Left:=CBst20[p].Left+CBst20[p].Width;
CBst21[p].Width:=65;
CBst21[p].Top:=5+p*20;
CBst21[p].Items.Add('8 ??');
CBst21[p].Items.Add('9 ??');
CBst21[p].Items.Add('10 ??');
CBst21[p].Items.Add('11 ??');
CBst21[p].Items.Add('12 ??');
CBst21[p].Items.Add('13 ??');
CBst21[p].Items.Add('14 ??');
CBst21[p].ItemIndex:=2;

ClBst6[p].Left:=CBst21[p].Left+CBst21[p].Width;
ClBst6[p].Width:=95;
ClBst6[p].Top:=5+p*20;
ClBst6[p].Style:=[cbStandardColors,cbPrettyNames];
ClBst6[p].ItemIndex:=ClBst6[p].Items.IndexOf('Red');

CBst22[p].Left:=ClBst6[p].Left+ClBst6[p].Width;
CBst22[p].Width:=130;
CBst22[p].Top:=5+p*20;
CBst22[p].Items.Add('Normal');
CBst22[p].Items.Add('Bold');
CBst22[p].Items.Add('Italic');
CBst22[p].Items.Add('Bold+Italic');
CBst22[p].Items.Add('Underline');
CBst22[p].Items.Add('Bold+Underline');
CBst22[p].Items.Add('Italic+Underline');
CBst22[p].Items.Add('Bold+Ital.+Underl.');
CBst22[p].ItemIndex:=1;


EDx4[p].Left:=CBst22[p].Left+CBst22[p].Width+3;
EDx4[p].Width:=40;
EDx4[p].Top:=5+p*20;
EDx4[p].Text:='0';

EDy4[p].Left:=EDx4[p].Left+EDx4[p].Width;
EDy4[p].Width:=40;
EDy4[p].Top:=5+p*20;
EDy4[p].Text:='0';

Scrollbox6.VertScrollBar.Position:=posi;









































































0:
end;

procedure TForm21.BitBtn3Click(Sender: TObject);
var i, posi: word;
label 0,10;
begin

// ???? ??????? Update ???????? ???????????


//?? ??????? ?????????, ????? ??? ??? ??????????,
//????????? Update ???????? ? ?????? ????????????? ??????????

if length(EDst13)=0 then goto 10;

if length(EDst5)=length(EDst13) then begin
EDst13[length(EDst13)-1].Text:=EDst5[length(EDst13)-1].Text;         // ???????
EDst14[length(EDst13)-1].Text:=EDst6[length(EDst13)-1].Text;           //???????
EDst15[length(EDst13)-1].Text:=floattostr(strtofloat(EDst4[strtoint(EDst14[length(EDst13)-1].Text)].Text)-strtofloat(EDst4[strtoint(EDst13[length(EDst13)-1].Text)].Text));
goto 10;
end;
////////////////////////////////////////////////////////








for i:=0 to length(EDst13)-1 do begin     // ??????? ??????? ??? ????????
if EDst13[i]<>nil then begin
FreeAndNil(EDst13[i]);
FreeAndNil(EDst14[i]);
FreeAndNil(EDst15[i]);
FreeAndNil(CBst19[i]);
FreeAndNil(CBst20[i]);
FreeAndNil(CBst21[i]);
FreeAndNil(CBst22[i]);
FreeAndNil(ClBst6[i]);
FreeAndNil(LB1[i]);
FreeAndNil(EDx4[i]);
FreeAndNil(EDy4[i]);
end;
end;

ScrollBox6.VertScrollBar.Position:=0;

                                           // ????? ????????? ?? ??????



posi:=ScrollBox6.VertScrollBar.Position;

setlength(EDst13,length(EDst5));
setlength(EDst14,length(EDst5));
setlength(EDst15,length(EDst5));
setlength(CBst19,length(EDst5));
setlength(CBst20,length(EDst5));
setlength(CBst21,length(EDst5));
setlength(CBst22,length(EDst5));
setlength(ClBst6,length(EDst5));
setlength(LB1,length(EDst5));
setlength(EDx4,length(EDst5));
setlength(EDy4,length(EDst5));

if EDst5=nil then goto 10;


for i:=0 to length(EDst5)-1 do begin
EDst13[i]:=TEdit.Create(self);
EDst14[i]:=TEdit.Create(self);
EDst15[i]:=TEdit.Create(self);
CBst19[i]:=TCombobox.Create(self);
CBst20[i]:=TCombobox.Create(self);
CBst21[i]:=TCombobox.Create(self);
CBst22[i]:=TCombobox.Create(self);
ClBst6[i]:=TColorbox.Create(self);
LB1[i]:=TLabel.Create(self);
EDx4[i]:=TEdit.Create(self);
EDy4[i]:=TEdit.Create(self);
EDst13[i].Parent:=Form21.ScrollBox6;
EDst14[i].Parent:=Form21.ScrollBox6;
EDst15[i].Parent:=Form21.ScrollBox6;
CBst19[i].Parent:=Form21.ScrollBox6;
CBst20[i].Parent:=Form21.ScrollBox6;
CBst21[i].Parent:=Form21.ScrollBox6;
CBst22[i].Parent:=Form21.ScrollBox6;
ClBst6[i].Parent:=Form21.ScrollBox6;
LB1[i].Parent:=Form21.ScrollBox6;
EDx4[i].Parent:=Form21.ScrollBox6;
EDy4[i].Parent:=Form21.ScrollBox6;
end;


for i:=0 to length(EDst5)-1 do begin
CBst19[i].Left:=5;
CBst19[i].Width:=70;
CBst19[i].Top:=5+i*20;
CBst19[i].Items.Add('None');
CBst19[i].Items.Add('Text');
CBst19[i].ItemIndex:=1;              //????? ??? ??????

EDst13[i].Left:=CBst19[i].Left+CBst19[i].Width+20;
EDst13[i].Width:=30;
EDst13[i].Top:=5+i*20;
EDst13[i].Text:=EDst5[i].Text;         // ???????

LB1[i].Left:=EDst13[i].Left+EDst13[i].Width+5;
LB1[i].Top:=EDst13[i].Top+Round(EDst13[i].Height/2)-Round(LB1[i].Height/2);
LB1[i].Caption:='---->';

EDst14[i].Left:=LB1[i].Left+LB1[i].Width+5;
EDst14[i].Width:=30;
EDst14[i].Top:=5+i*20;
EDst14[i].Text:=EDst6[i].Text;           //???????

EDst15[i].Left:=EDst14[i].Left+EDst14[i].Width+5;
EDst15[i].Width:=60;
EDst15[i].Top:=5+i*20;
EDst15[i].Text:=floattostr(strtofloat(EDst4[strtoint(EDst14[i].Text)].Text)-strtofloat(EDst4[strtoint(EDst13[i].Text)].Text));  /////////////////////////////???? ??????? ????????!!!!!


CBst20[i].Left:=EDst15[i].Left+EDst15[i].Width;
CBst20[i].Width:=140;
CBst20[i].Top:=5+i*20;
CBst20[i].Items.Add('Arial');
CBst20[i].Items.Add('Tahoma');
CBst20[i].Items.Add('Times New Roman');
CBst20[i].Items.Add('Courier New');
CBst20[i].ItemIndex:=0;           // ?????

CBst21[i].Left:=CBst20[i].Left+CBst20[i].Width;
CBst21[i].Width:=65;
CBst21[i].Top:=5+i*20;
CBst21[i].Items.Add('8 ??');
CBst21[i].Items.Add('9 ??');
CBst21[i].Items.Add('10 ??');
CBst21[i].Items.Add('11 ??');
CBst21[i].Items.Add('12 ??');
CBst21[i].Items.Add('13 ??');
CBst21[i].Items.Add('14 ??');
CBst21[i].ItemIndex:=2;

ClBst6[i].Left:=CBst21[i].Left+CBst21[i].Width;
ClBst6[i].Width:=95;
ClBst6[i].Top:=5+i*20;
ClBst6[i].Style:=[cbStandardColors,cbPrettyNames];
ClBst6[i].ItemIndex:=ClBst6[i].Items.IndexOf('Red');

CBst22[i].Left:=ClBst6[i].Left+ClBst6[i].Width;
CBst22[i].Width:=130;
CBst22[i].Top:=5+i*20;
CBst22[i].Items.Add('Normal');
CBst22[i].Items.Add('Bold');
CBst22[i].Items.Add('Italic');
CBst22[i].Items.Add('Bold+Italic');
CBst22[i].Items.Add('Underline');
CBst22[i].Items.Add('Bold+Underline');
CBst22[i].Items.Add('Italic+Underline');
CBst22[i].Items.Add('Bold+Ital.+Underl.');
CBst22[i].ItemIndex:=1;


EDx4[i].Left:=CBst22[i].Left+CBst22[i].Width+3;
EDx4[i].Width:=40;
EDx4[i].Top:=5+i*20;
EDx4[i].Text:='0';

EDy4[i].Left:=EDx4[i].Left+EDx4[i].Width;
EDy4[i].Width:=40;
EDy4[i].Top:=5+i*20;
EDy4[i].Text:='0';

ScrollBox6.VertScrollBar.Position:=posi;

end;






















10:
if length(EDst5)<1 then begin showmessage('?? ??????? ?? ?????? ????????????? ???????????'); goto 0; end;
Form22.Show;
Form22.PaintBox1.Invalidate;
0: end;

procedure TForm21.BitBtn4Click(Sender: TObject);
begin
Form21.Close;
Form20.Show;
end;

procedure TForm21.BitBtn5Click(Sender: TObject);
var i,n,m: integer;
prm1,prm2: widestring;
begin
for i:=0 to length(EDst2)-1 do begin
EDst8[i].Text:=EDst3[i].Text;
EDst10[i].Text:=EDst4[i].Text;
end;

for i:=0 to length(EDst5)-1 do begin
EDst13[i].Text:=EDst5[i].Text;
EDst14[i].Text:=EDst6[i].Text;


for m:=0 to length(EDst2)-1 do begin
if EDst13[i].Text=EDSt2[m].Text then begin
for n:=0 to length(EDst2)-1 do begin
if EDst14[i].Text=EDSt2[n].Text then
EDst15[i].Text:=floattostr(strtofloat(EDst4[n].Text)-strtofloat(EDst4[m].Text));  /////////////////////////////???? ??????? ????????!!!!!
end;
end;
end;

end;




end;

procedure TForm21.FormClose(Sender: TObject; var Action: TCloseAction);
var i: integer;
begin

if EDst1<>nil then begin
for i:=0 to length(EDst1)-1 do
FreeAndNil(EDst1[i]);
end;
if EDst2<>nil then begin
for i:=0 to length(EDst2)-1 do
FreeAndNil(EDst2[i]);
end;
if EDst3<>nil then begin
for i:=0 to length(EDst3)-1 do
FreeAndNil(EDst3[i]);
end;
if EDst4<>nil then begin
for i:=0 to length(EDst4)-1 do
FreeAndNil(EDst4[i]);
end;
if EDst5<>nil then begin
for i:=0 to length(EDst5)-1 do
FreeAndNil(EDst5[i]);
end;
if EDst6<>nil then begin
for i:=0 to length(EDst6)-1 do
FreeAndNil(EDst6[i]);
end;
if EDst7<>nil then begin
for i:=0 to length(EDst7)-1 do
FreeAndNil(EDst7[i]);
end;
if EDst8<>nil then begin
for i:=0 to length(EDst8)-1 do
FreeAndNil(EDst8[i]);
end;
if EDst9<>nil then begin
for i:=0 to length(EDst9)-1 do
FreeAndNil(EDst9[i]);
end;
if EDst10<>nil then begin
for i:=0 to length(EDst10)-1 do
FreeAndNil(EDst10[i]);
end;
if EDst11<>nil then begin
for i:=0 to length(EDst11)-1 do
FreeAndNil(EDst11[i]);
end;
if EDst12<>nil then begin
for i:=0 to length(EDst12)-1 do
FreeAndNil(EDst12[i]);
end;
if EDst13<>nil then begin
for i:=0 to length(EDst13)-1 do
FreeAndNil(EDst13[i]);
end;
if EDst14<>nil then begin
for i:=0 to length(EDst14)-1 do
FreeAndNil(EDst14[i]);
end;
if EDst15<>nil then begin
for i:=0 to length(EDst15)-1 do
FreeAndNil(EDst15[i]);
end;
if CBst1<>nil then begin
for i:=0 to length(CBst1)-1 do
FreeAndNil(CBst1[i]);
end;
if CBst2<>nil then begin
for i:=0 to length(CBst2)-1 do
FreeAndNil(CBst2[i]);
end;
if CBst3<>nil then begin
for i:=0 to length(CBst3)-1 do
FreeAndNil(CBst3[i]);
end;
if CBst4<>nil then begin
for i:=0 to length(CBst4)-1 do
FreeAndNil(CBst4[i]);
end;
if CBst5<>nil then begin
for i:=0 to length(CBst5)-1 do
FreeAndNil(CBst5[i]);
end;
if CBst6<>nil then begin
for i:=0 to length(CBst6)-1 do
FreeAndNil(CBst6[i]);
end;
if CBst7<>nil then begin
for i:=0 to length(CBst7)-1 do
FreeAndNil(CBst7[i]);
end;
if CBst8<>nil then begin
for i:=0 to length(CBst8)-1 do
FreeAndNil(CBst8[i]);
end;
if CBst9<>nil then begin
for i:=0 to length(CBst9)-1 do
FreeAndNil(CBst9[i]);
end;
if CBst10<>nil then begin
for i:=0 to length(CBst10)-1 do
FreeAndNil(CBst10[i]);
end;
if CBst11<>nil then begin
for i:=0 to length(CBst11)-1 do
FreeAndNil(CBst11[i]);
end;
if CBst12<>nil then begin
for i:=0 to length(CBst12)-1 do
FreeAndNil(CBst12[i]);
end;
if CBst13<>nil then begin
for i:=0 to length(CBst13)-1 do
FreeAndNil(CBst13[i]);
end;
if CBst14<>nil then begin
for i:=0 to length(CBst14)-1 do
FreeAndNil(CBst14[i]);
end;
if CBst15<>nil then begin
for i:=0 to length(CBst15)-1 do
FreeAndNil(CBst15[i]);
end;
if CBst16<>nil then begin
for i:=0 to length(CBst16)-1 do
FreeAndNil(CBst16[i]);
end;
if CBst17<>nil then begin
for i:=0 to length(CBst17)-1 do
FreeAndNil(CBst17[i]);
end;
if CBst18<>nil then begin
for i:=0 to length(CBst18)-1 do
FreeAndNil(CBst18[i]);
end;
if CBst19<>nil then begin
for i:=0 to length(CBst19)-1 do
FreeAndNil(CBst19[i]);
end;
if CBst20<>nil then begin
for i:=0 to length(CBst20)-1 do
FreeAndNil(CBst20[i]);
end;
if CBst21<>nil then begin
for i:=0 to length(CBst21)-1 do
FreeAndNil(CBst21[i]);
end;
if CBst22<>nil then begin
for i:=0 to length(CBst22)-1 do
FreeAndNil(CBst22[i]);
end;
if ClBst1<>nil then begin
for i:=0 to length(ClBst1)-1 do
FreeAndNil(ClBst1[i]);
end;
if ClBst2<>nil then begin
for i:=0 to length(ClBst2)-1 do
FreeAndNil(ClBst2[i]);
end;
if ClBst3<>nil then begin
for i:=0 to length(ClBst3)-1 do
FreeAndNil(ClBst3[i]);
end;
if ClBst4<>nil then begin
for i:=0 to length(ClBst4)-1 do
FreeAndNil(ClBst4[i]);
end;
if ClBst5<>nil then begin
for i:=0 to length(ClBst5)-1 do
FreeAndNil(ClBst5[i]);
end;
if ClBst6<>nil then begin
for i:=0 to length(ClBst6)-1 do
FreeAndNil(ClBst6[i]);
end;
if LB<>nil then begin
for i:=0 to length(LB)-1 do
FreeAndNil(LB[i]);
end;
if LB1<>nil then begin
for i:=0 to length(LB1)-1 do
FreeAndNil(LB1[i]);
end;
if EDx1<>nil then begin
for i:=0 to length(EDx1)-1 do
FreeAndNil(EDx1[i]);
end;
if EDy1<>nil then begin
for i:=0 to length(EDy1)-1 do
FreeAndNil(EDy1[i]);
end;
if EDx2<>nil then begin
for i:=0 to length(EDx2)-1 do
FreeAndNil(EDx2[i]);
end;
if EDy2<>nil then begin
for i:=0 to length(EDy2)-1 do
FreeAndNil(EDy2[i]);
end;
if EDx3<>nil then begin
for i:=0 to length(EDx3)-1 do
FreeAndNil(EDx3[i]);
end;
if EDy3<>nil then begin
for i:=0 to length(EDy3)-1 do
FreeAndNil(EDy3[i]);
end;
if EDx4<>nil then begin
for i:=0 to length(EDx4)-1 do
FreeAndNil(EDx4[i]);
end;
if EDy4<>nil then begin
for i:=0 to length(EDy4)-1 do
FreeAndNil(EDy4[i]);
end;
if ChB3<>nil then begin
for i:=0 to length(ChB3)-1 do
FreeAndNil(ChB3[i]);
end;












EDst1:=nil;
EDst2:=nil;
EDst3:=nil;
EDst4:=nil;
EDst5:=nil;
EDst6:=nil;
EDst7:=nil;
EDst8:=nil;
EDst9:=nil;
EDst10:=nil;
EDst11:=nil;
EDst12:=nil;
EDst13:=nil;
EDst14:=nil;
EDst15:=nil;
CBst1:=nil;
CBst2:=nil;
CBst3:=nil;
CBst4:=nil;
CBst5:=nil;
CBst6:=nil;
CBst7:=nil;
CBst8:=nil;
CBst9:=nil;
CBst10:=nil;
CBst11:=nil;
CBst12:=nil;
CBst13:=nil;
CBst14:=nil;
CBst15:=nil;
CBst16:=nil;
CBst17:=nil;
CBst18:=nil;
CBst19:=nil;
CBst20:=nil;
CBst21:=nil;
CBst22:=nil;
ClBst1:=nil;
ClBst2:=nil;
ClBst3:=nil;
ClBst4:=nil;
ClBst5:=nil;
ClBst6:=nil;
LB:=nil;
LB1:=nil;
EDx1:=nil;
EDx2:=nil;
EDx3:=nil;
EDx4:=nil;
EDy1:=nil;
EDy2:=nil;
EDy3:=nil;
EDy4:=nil;
ChB3:=nil;



indexx:=0;




end;

procedure TForm21.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //????????? ???????? ?????? ???????? 'Back Space'
    case Key of
      '0'..'9','.','%',' ','-': key := key;//???? ?????? ?????, ?? ?????? ?? ??????
    else
      Key := #0; //"????????" ??? ????????? ???????
    end;
  end;
end;

procedure TForm21.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //????????? ???????? ?????? ???????? 'Back Space'
    case Key of
      '0'..'9','.','%',' ','-': key := key;//???? ?????? ?????, ?? ?????? ?? ??????
    else
      Key := #0; //"????????" ??? ????????? ???????
    end;
  end;
end;

procedure TForm21.FormPaint(Sender: TObject);
begin
ScrollBox2.Invalidate;
end;

end.
