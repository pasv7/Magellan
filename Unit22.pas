unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Math, Menus;

type
  TForm22 = class(TForm)
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

uses Unit21;

{$R *.dfm}





procedure TForm22.PaintBox1Paint(Sender: TObject);
var i,j,k,s,t,p,a_length,track1,track2: word;
xts1,xts2,xts3,xts4,yts1,yts2,yts3,yts4,  xts1_,xts2_,xts3_,xts4_,yts1_,yts2_,yts3_,yts4_: integer;
xci1,xci2,xci3,xci4,yci1,yci2,yci3,yci4,  xci1_,xci2_,xci3_,xci4_,yci1_,yci2_,yci3_,yci4_: integer;
Xdir,Ydir,Xdirmin,Ydirmin,Hvert,Xdir0,Tick,Ydir0min,Ydir0max,Ky,lng: integer;   //Ky - ������ �� ����� �� ����  lng - ���������� ����� ��������� �������� ����� �������
Xdir1,Xdir2,Ydir1,Ydir2: array of integer;
a,b,l1,l2,l3,l4,Dir1min,Dir2min,Dir3min,LMin,LMax: real;
LineZero,LineMin,LineMax,LineStart,LineEnd,sp,pos1,pos2,pos3,pos4: integer;
TL: TLogFont;
begin
Hvert:=strtoint(Form21.Edit5.Text);      // ������ �� ���� � �� �����

/////////////����� �������� � ��������� �������
a:=100000000;
b:=-100000000;
for i:=0 to length(EDst4)-1 do begin
if a>=strtofloat(EDst4[i].Text) then a:=strtofloat(EDst4[i].Text);   // �������
if b<=strtofloat(EDst4[i].Text) then b:=strtofloat(EDst4[i].Text);   // ��������
end;

//////////��������� ������������ �����

for  i:=0 to length(EDst2)-1 do  begin
if uppercase(CBst2[i].Text)='SOLID' then   Form22.PaintBox1.Canvas.Pen.Style:=psSolid;    // �����
if uppercase(CBst2[i].Text)='DASH' then   Form22.PaintBox1.Canvas.Pen.Style:=psDash;
if uppercase(CBst2[i].Text)='DOT' then   Form22.PaintBox1.Canvas.Pen.Style:=psDot;

Form22.PaintBox1.Canvas.Pen.Width:=strtoint(CBst3[i].Text);

Form22.PaintBox1.Canvas.Pen.Color:=ClBst1[i].Selected;


setlength(Xdir1,length(EDst2));
setlength(Xdir2,length(EDst2));
setlength(Ydir1,length(EDst2));
setlength(Ydir2,length(EDst2));

track1:=Form21.TrackBar1.Position;
track2:=Form21.TrackBar2.Position;


/////////��������� ������ ����� - LM
if uppercase(CBst1[i].Text)='LM' then begin

Xdir1[i]:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text)))+track1*10;
Xdir2[i]:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text))+strtoint(CBst4[i].Text))+track1*10;
Ydir1[i]:=Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2));
Ydir2[i]:=Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2));


Form22.PaintBox1.Canvas.MoveTo(Xdir1[i], Ydir1[i]);
Form22.PaintBox1.Canvas.LineTo(Xdir2[i], Ydir2[i]);
end;


/////////��������� ����������� ��������� - TS
if uppercase(CBst1[i].Text)='TS' then begin
xts1:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text)))+track1*10;
yts1:=Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))-5;  //*Form21.TrackBar2.Position;
xts2:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text))+strtoint(CBst4[i].Text))+track1*10;   ////////////////
yts2:=Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))+5;     //*Form21.TrackBar2.Position;
xts3:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text)))+track1*10;
yts3:=Round((Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))-5    {*Form21.TrackBar2.Position}  +  Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))+5{*Form21.TrackBar2.Position})/2);
xts4:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text))+strtoint(CBst4[i].Text))+track1*10;
yts4:=Round((Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))-5{*Form21.TrackBar2.Position}  +  Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2){*Form21.TrackBar2.Position})+5{*Form21.TrackBar2.Position})/2);


Form22.PaintBox1.Canvas.Arc(  {x1=}    xts1, {y1=}  yts1,  {x2=}  xts2,  {y2=}  yts2 , {x������=}  xts3 , {y������=}  yts3, {x�����=} xts4, {y�����=}  yts4  );

xts1_:=xts1+Round(0.3*(xts2-xts1)/2);
xts2_:=xts2-Round(0.3*(xts2-xts1)/2);
yts1_:=yts2;
yts2_:=yts2+Round(1.2*(yts2-yts1));

xts4_:=xts1_;
xts3_:=xts2_;
yts4_:=yts2+Round(1.2*(yts2-yts1));
yts3_:=yts4_;

Xdir1[i]:=xts1;
Xdir2[i]:=xts2;
Ydir1[i]:=yts2;
Ydir2[i]:=yts2;


Form22.PaintBox1.Canvas.Arc(  {x1=}    xts1_, {y1=}  yts1_,  {x2=}  xts2_,  {y2=}  yts2_ , {x������=}  xts3_ , {y������=}  yts3_, {x�����=} xts4_, {y�����=}  yts4_  );
end;


////////////////��������� ���������� ����������� - CI
if uppercase(CBst1[i].Text)='CI' then begin          // 40 - ������ �� ����� ����� - �������� �� 20 � ������� ������� ��
xci1:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text)))+track1*10;
yci1:=Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))-5;
xci2:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text))+strtoint(CBst4[i].Text))+track1*10;   ////////////////
yci2:=Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))+5*0;
xci3:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text)))+track1*10;
yci3:=Round((Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))-5  +  Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))+5*0)/2);
xci4:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text))+strtoint(CBst4[i].Text))+track1*10;
yci4:=Round((Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))-5  +  Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))+5*0)/2);

Form22.PaintBox1.Canvas.Arc(  {x1=}    xci1, {y1=}  yci1,  {x2=}  xci2,  {y2=}  yci2 , {x������=}  xci3 , {y������=}  yci3, {x�����=} xci4, {y�����=}  yci4  );

xci1_:=xci1;
yci1_:=yci2+5;
xci2_:=xci2;
yci2_:=yci1_+5;
xci4_:=xci1;
xci3_:=xci2;
yci3_:=Round((yci1_+yci2_)/2);
yci4_:=yci3_;

Form22.PaintBox1.Canvas.Arc(  {x1=}    xci1_, {y1=}  yci1_,  {x2=}  xci2_,  {y2=}  yci2_ , {x������=}  xci3_ , {y������=}  yci3_, {x�����=} xci4_, {y�����=}  yci4_  );

Form22.PaintBox1.Canvas.Pen.Style:=psDot;
Form22.PaintBox1.Canvas.MoveTo(xci3,yci3);
Form22.PaintBox1.Canvas.LineTo(xci3_,yci3_);
Form22.PaintBox1.Canvas.MoveTo(xci4,yci4);
Form22.PaintBox1.Canvas.LineTo(xci4_,yci4_);
Form22.PaintBox1.Canvas.Pen.Style:=psSolid;


Xdir1[i]:=xci3;
Xdir2[i]:=xci3_;
Ydir1[i]:=Round((yci3+yci3_)/2);
Ydir2[i]:=Round((yci3+yci3_)/2);


end;


////////////////��������� ����� ����������� ���������� � ���������� ������������ - MEXP

if uppercase(CBst1[i].Text)='MEXP' then begin





Form22.PaintBox1.Canvas.MoveTo((strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text)))+track1*10,     Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))   -5         );
Form22.PaintBox1.Canvas.LineTo((strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text))+strtoint(CBst4[i].Text))+10*track1,     Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))   +5         );

Form22.PaintBox1.Canvas.MoveTo((strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text))+strtoint(CBst4[i].Text))+track1*10,     Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))   -5          );
Form22.PaintBox1.Canvas.LineTo((strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text)))+track1*10,     Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))   +5         );

Xdir1[i]:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text)))+track1*10;
Xdir2[i]:=(strtoint(Form21.Edit4.Text) + strtoint(EDst1[i].Text)*(Form21.TrackBar3.Position+strtoint(CBst4[i].Text))+strtoint(CBst4[i].Text))+track1*10;
Ydir1[i]:=Round((Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))   -5   + Round(((2*Hvert+track2-Form22.ClientHeight)*(strtofloat(EDst4[i].Text)-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))   +5)/2);
Ydir2[i]:=Ydir1[i];

end;



end;     // ����� ����� ��������� "�������"


/////////////������ ����������

















for i:=0 to length(EDst5)-1 do begin
if EDst5[i]<>nil then begin




for j:=0 to length(EDst2)-1 do begin


////////////////�����///////////////////////////////////////////
if  uppercase(CBst6[i].Text)='SOLID' then Form22.PaintBox1.Canvas.Pen.Style:=psSolid;
if  uppercase(CBst6[i].Text)='DASH' then Form22.PaintBox1.Canvas.Pen.Style:=psDash;
if  uppercase(CBst6[i].Text)='DOT' then Form22.PaintBox1.Canvas.Pen.Style:=psDot;
if  uppercase(CBst5[i].Text)='NONE' then Form22.PaintBox1.Canvas.Pen.Style:=psClear;

if  uppercase(CBst5[i].Text)<>'NONE'  then Form22.PaintBox1.Canvas.Pen.Width:=strtoint(CBst5[i].Text);
Form22.PaintBox1.Canvas.Pen.Color:=ClBst2[i].Selected;
///////////////////////////////////////////////////////////////


if EDst5[i].Text=EDst2[j].Text then begin
Form22.PaintBox1.Canvas.MoveTo(Xdir2[j],Ydir2[j]);       // �� ����� ������ �������...
for k:=0 to length(EDst2)-1 do begin
if (EDst6[i].Text=EDst2[k].Text) and (strtoint(EDst1[j].Text)<strtoint(EDst1[k].Text)) then Form22.PaintBox1.Canvas.LineTo(Xdir1[k],Ydir1[k]);   // � ������ ������
if (EDst6[i].Text=EDst2[k].Text) and (strtoint(EDst1[j].Text)=strtoint(EDst1[k].Text)) then Form22.PaintBox1.Canvas.LineTo(Xdir2[k],Ydir2[k]);   // ��� � ����� ������ ��� ��������� ������� �������
if (EDst6[i].Text=EDst2[k].Text) and (strtoint(EDst1[j].Text)>strtoint(EDst1[k].Text)) then begin // ��� �� ������ ������ � ����� ������ ���� ������ ������� �� ������� ������ ������
Form22.PaintBox1.Canvas.MoveTo(Xdir1[j],Ydir1[j]);
Form22.PaintBox1.Canvas.LineTo(Xdir2[k],Ydir2[k]);                     // ������ EDst1 - ������� �� �����, � EDst2 - ���������� �����
end;
end;
end;

end;









//Form22.PaintBox1.Invalidate;
















////////////����� ���������� ����������, ������ ��������� ������ ���������


Form22.PaintBox1.Canvas.Pen.Style:=psSolid;
if  uppercase(CBst5[i].Text) ='NONE' then Form22.PaintBox1.Canvas.Pen.Style:=psClear;



for t:=0 to length(EDst2)-1 do
if EDst5[i].Text=EDst2[t].Text then break;      // t - ����� ������� ��� EDst5

for p:=0 to length(EDst2)-1 do
if EDst6[i].Text=EDst2[p].Text then break;      // p - ����� ������� ��� EDst6





if  strtoint(EDst1[t].Text)<strtoint(EDst1[p].Text) then begin     //  ~~~~~~~~~~~~~~~~~~~~~~

l1:=sqrt(sqr(Xdir1[strtoint(EDst6[i].Text)]-Xdir2[strtoint(EDst5[i].Text)]) + sqr(Ydir1[strtoint(EDst6[i].Text)]-Ydir2[strtoint(EDst5[i].Text)]));
l2:=12;                    //l1*0.1;     // ����� �������
l3:=sqrt (sqr(l1) + sqr(l2) - 2*l1*l2*cos(10*pi/180));  // ������� ������� ������  , 10 - ���� �������


/////Dir1min:=100;
/////Dir2min:=100;
for Xdir:=Xdir1[strtoint(EDst6[i].Text)]-20 to Xdir1[strtoint(EDst6[i].Text)]+20 do  begin    //10 - ��� ������ ���������
for Ydir:=Ydir1[strtoint(EDst6[i].Text)]-20 to Ydir1[strtoint(EDst6[i].Text)]+20 do  begin
//showmessage(floattostr(sqrt( sqr(Xdir2[i]-Xdir) +sqr(Ydir2[i]-Ydir) )-l3) +'---'+ floattostr(sqrt( sqr(Xdir1[i]-Xdir) +sqr(Ydir1[i]-Ydir) )-l2));

//if (Dir1min>=Abs(sqrt( sqr(Xdir2[strtoint(EDst5[i].Text)]-Xdir) +sqr(Ydir2[strtoint(EDst5[i].Text)]-Ydir) )-l3))  and  (Dir2min>=Abs(sqrt( sqr(Xdir1[strtoint(EDst6[i].Text)]-Xdir) +sqr(Ydir1[strtoint(EDst6[i].Text)]-Ydir) )-l2)) then begin
Dir1min:=sqrt(sqr(Xdir2[strtoint(EDst5[i].Text)]-Xdir) +sqr(Ydir2[strtoint(EDst5[i].Text)]-Ydir))-l3;
Dir2min:=sqrt(sqr(Xdir1[strtoint(EDst6[i].Text)]-Xdir) +sqr(Ydir1[strtoint(EDst6[i].Text)]-Ydir)) -l2;
if (abs(Dir1min)<=0.5) and (abs(Dir2min)<=0.5)   then begin  /////        0.5 - ����� ������ ����� ��� ���������� ������� �������, ��� ������ - ��� ����
Xdirmin:=Xdir;
Ydirmin:=Ydir;
Form22.PaintBox1.Canvas.MoveTo(Xdir1[strtoint(EDst6[i].Text)],Ydir1[strtoint(EDst6[i].Text)]);
Form22.PaintBox1.Canvas.LineTo(Xdirmin,Ydirmin);
end;/////

end;
end;      // ��������� �������� ��������� ��� ������������ ������� ������� - ����� ������ ������

end;      // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~






if  strtoint(EDst1[t].Text)=strtoint(EDst1[p].Text) then begin     //  ~~~~~~~~~~~~~~~~~~~~~~

l1:=sqrt(sqr(Xdir2[strtoint(EDst6[i].Text)]-Xdir2[strtoint(EDst5[i].Text)]) + sqr(Ydir2[strtoint(EDst6[i].Text)]-Ydir2[strtoint(EDst5[i].Text)]));
l2:=12;                    //l1*0.1;     // ����� �������
l3:=sqrt (sqr(l1) + sqr(l2) - 2*l1*l2*cos(10*pi/180));  // ������� ������� ������  , 10 - ���� �������

/////Dir1min:=100;
/////Dir2min:=100;
for Xdir:=Xdir2[strtoint(EDst6[i].Text)]-20 to Xdir2[strtoint(EDst6[i].Text)]+20 do  begin    //10 - ��� ������ ���������
for Ydir:=Ydir2[strtoint(EDst6[i].Text)]-20 to Ydir2[strtoint(EDst6[i].Text)]+20 do  begin
//showmessage(floattostr(sqrt( sqr(Xdir2[i]-Xdir) +sqr(Ydir2[i]-Ydir) )-l3) +'---'+ floattostr(sqrt( sqr(Xdir1[i]-Xdir) +sqr(Ydir1[i]-Ydir) )-l2));

//if (Dir1min>=Abs(sqrt( sqr(Xdir2[strtoint(EDst5[i].Text)]-Xdir) +sqr(Ydir2[strtoint(EDst5[i].Text)]-Ydir) )-l3))  and  (Dir2min>=Abs(sqrt( sqr(Xdir1[strtoint(EDst6[i].Text)]-Xdir) +sqr(Ydir1[strtoint(EDst6[i].Text)]-Ydir) )-l2)) then begin
Dir1min:=sqrt(sqr(Xdir2[strtoint(EDst5[i].Text)]-Xdir) +sqr(Ydir2[strtoint(EDst5[i].Text)]-Ydir))-l3;
Dir2min:=sqrt(sqr(Xdir2[strtoint(EDst6[i].Text)]-Xdir) +sqr(Ydir2[strtoint(EDst6[i].Text)]-Ydir)) -l2;
if (abs(Dir1min)<=0.5) and (abs(Dir2min)<=0.5)   then begin  /////        0.5 - ����� ������ ����� ��� ���������� ������� �������, ��� ������ - ��� ����
Xdirmin:=Xdir;
Ydirmin:=Ydir;
Form22.PaintBox1.Canvas.MoveTo(Xdir2[strtoint(EDst6[i].Text)],Ydir2[strtoint(EDst6[i].Text)]);
Form22.PaintBox1.Canvas.LineTo(Xdirmin,Ydirmin);
end;/////

end;
end;      // ��������� �������� ��������� ��� ������� � ����������� ���������

end;      // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



if  strtoint(EDst1[t].Text)>strtoint(EDst1[p].Text) then begin     //  ~~~~~~~~~~~~~~~~~~~~~~

l1:=sqrt(sqr(Xdir2[strtoint(EDst6[i].Text)]-Xdir1[strtoint(EDst5[i].Text)]) + sqr(Ydir2[strtoint(EDst6[i].Text)]-Ydir1[strtoint(EDst5[i].Text)]));
l2:=12;                    //l1*0.1;     // ����� �������
l3:=sqrt (sqr(l1) + sqr(l2) - 2*l1*l2*cos(10*pi/180));  // ������� ������� ������  , 10 - ���� �������

/////Dir1min:=100;
/////Dir2min:=100;
for Xdir:=Xdir2[strtoint(EDst6[i].Text)]-20 to Xdir2[strtoint(EDst6[i].Text)]+20 do  begin    //10 - ��� ������ ���������
for Ydir:=Ydir2[strtoint(EDst6[i].Text)]-20 to Ydir2[strtoint(EDst6[i].Text)]+20 do  begin
//showmessage(floattostr(sqrt( sqr(Xdir2[i]-Xdir) +sqr(Ydir2[i]-Ydir) )-l3) +'---'+ floattostr(sqrt( sqr(Xdir1[i]-Xdir) +sqr(Ydir1[i]-Ydir) )-l2));

//if (Dir1min>=Abs(sqrt( sqr(Xdir2[strtoint(EDst5[i].Text)]-Xdir) +sqr(Ydir2[strtoint(EDst5[i].Text)]-Ydir) )-l3))  and  (Dir2min>=Abs(sqrt( sqr(Xdir1[strtoint(EDst6[i].Text)]-Xdir) +sqr(Ydir1[strtoint(EDst6[i].Text)]-Ydir) )-l2)) then begin
Dir1min:=sqrt(sqr(Xdir1[strtoint(EDst5[i].Text)]-Xdir) +sqr(Ydir1[strtoint(EDst5[i].Text)]-Ydir))-l3;
Dir2min:=sqrt(sqr(Xdir2[strtoint(EDst6[i].Text)]-Xdir) +sqr(Ydir2[strtoint(EDst6[i].Text)]-Ydir)) -l2;
if (abs(Dir1min)<=0.5) and (abs(Dir2min)<=0.5)   then begin  /////        0.5 - ����� ������ ����� ��� ���������� ������� �������, ��� ������ - ��� ����
Xdirmin:=Xdir;
Ydirmin:=Ydir;
Form22.PaintBox1.Canvas.MoveTo(Xdir2[strtoint(EDst6[i].Text)],Ydir2[strtoint(EDst6[i].Text)]);
Form22.PaintBox1.Canvas.LineTo(Xdirmin,Ydirmin);
end;/////

end;
end;      // ��������� �������� ��������� ��� ������� � ����������� ���������

end;      // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~









end;
end;      // ��������� �������� ����� (��� �������� - ������� � ��������� � �������������)

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
///////////////////////  �������� �������� ��� � ������� � ����   ///////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

// ��� ��


// ���� ������������ �������� �-��� ���������� ����� Xdir2:

Xdir0:=-1000;
for i:=0 to length(Xdir2)-1 do
if Xdir0<Xdir2[i] then Xdir0:=Xdir2[i];    // Xdir0 - ���������� �������� ���������� �

{
if Xdir0-strtoint(Form21.Edit4.Text)<150 then begin
if Form22.ClientWidth>400 then  Xdir0:=340+strtoint(Form21.Edit4.Text)    // ���� � ������ ��� �� - ����� �������� ���, �� �������� �� ���������, ����� ����� ������� �� ����� ��� �� ����� �������
else  Xdir0:=Form22.ClientWidth-40;
end;
     }

if Form21.CheckBox1.Checked=true then begin
Form22.PaintBox1.Canvas.Pen.Style:=psSolid;
Form22.PaintBox1.Canvas.Pen.Color:=ClBlack;
Form22.PaintBox1.Canvas.Pen.Width:=strtoint(Form21.ComboBox2.Text); // ������� ��� ��
Form22.PaintBox1.Canvas.MoveTo(strtoint(Form21.Edit4.Text)-10, Form22.ClientHeight - Hvert + 10);  // 10 - ������ �� ������ ������� �� ���� Oy, Ox
Form22.PaintBox1.Canvas.LineTo(Form22.ClientWidth-40, Form22.ClientHeight - Hvert + 10);     //length(Xdir2)-1 - ���������� ����� ���������� �������� (���������� ����� ��������� �������)
// �������� ��� ��

Form22.PaintBox1.Canvas.Font.Name:=Form21.Combobox4.Text;
Form22.PaintBox1.Canvas.Font.Size:=strtoint(copy(Form21.Combobox3.Text,0,pos(' ',Form21.Combobox3.Text)-1));
Form22.PaintBox1.Canvas.Font.Color:=Form21.ColorBox1.Selected;
case Form21.Combobox5.ItemIndex of
0: Form22.PaintBox1.Canvas.Font.Style:=Form22.PaintBox1.Canvas.Font.Style-[fsBold]-[fsItalic]-[fsUnderline];
1: Form22.PaintBox1.Canvas.Font.Style:=[fsBold];
2: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic];
3: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic];
end;
Form22.PaintBox1.Canvas.TextOut(Form22.ClientWidth-45-(strtoint(copy(Form21.Combobox3.Text,0,pos(' ',Form21.Combobox3.Text)-1))-3)*Length(Form21.Edit1.Text),Form22.ClientHeight - Hvert + 20,Form21.Edit1.Text);
                                // ����� ��� ����� 45 - ���������� �� ����� �������� � ������� ������
end;





// ��� Oy     , a - min, b - max

Ky:=10;
Ydir0min:=1000000;
for i:=0 to length(Ydir1)-1 do
if Ydir0min>Ydir1[i] then Ydir0min:=Ydir1[i];
Ydir0max:=-1000000;
for i:=0 to length(Ydir1)-1 do
if Ydir0max<Ydir1[i] then Ydir0max:=Ydir1[i];



If Form21.CheckBox2.Checked=true then begin
Form22.PaintBox1.Canvas.Pen.Style:=psSolid;
Form22.PaintBox1.Canvas.Pen.Color:=ClBlack;
Form22.PaintBox1.Canvas.Pen.Width:=strtoint(Form21.ComboBox6.Text); // ������� ��� �y

//Form22.PaintBox1.Canvas.MoveTo(strtoint(Form21.Edit4.Text)-10, Form22.ClientHeight - Hvert + 10);
                                     // strtoint(Form21.Edit4.Text)-10, Form22.ClientHeight - Hvert + 10
Form22.PaintBox1.Canvas.MoveTo(strtoint(Form21.Edit4.Text)-Ky, Ydir0min - Ky);  // 10 - ������ �� ������ ������� �� ���� Oy, Ox
Form22.PaintBox1.Canvas.LineTo(strtoint(Form21.Edit4.Text)-Ky, Ydir0max + Ky+track2);


//�������� ��������
Tick:=Round((Ydir0max - Ydir0min + 2*Ky+track2)*0.05*strtoint(Form21.Combobox9.Text));
Form22.PaintBox1.Canvas.Pen.Width:=strtoint(Form21.ComboBox7.Text); // ������� �������� ��� �y


if Form21.RadioButton1.Checked then begin      //���� ������� ��������
for i:=0 to Round((Ydir0max - Ydir0min+2*Ky+track2)/Tick)-1 do begin
Form22.PaintBox1.Canvas.MoveTo(strtoint(Form21.Edit4.Text)-Ky-strtoint(Form21.ComboBox1.Text), Ydir0max + Ky +track2 - Tick*i);
Form22.PaintBox1.Canvas.LineTo(strtoint(Form21.Edit4.Text)-Ky, Ydir0max + Ky +track2- Tick*i);
end;
end;


if Form21.RadioButton2.Checked then begin      //���� ������ ��������
for i:=0 to Round((Ydir0max - Ydir0min+2*Ky+track2)/Tick)-1 do begin
Form22.PaintBox1.Canvas.MoveTo(strtoint(Form21.Edit4.Text)-Ky, Ydir0max + Ky +track2- Tick*i);
Form22.PaintBox1.Canvas.LineTo(strtoint(Form21.Edit4.Text)-Ky + strtoint(Form21.ComboBox1.Text), Ydir0max + Ky +track2- Tick*i);
end;
end;


if Form21.RadioButton3.Checked then begin      //���� �� ������
for i:=0 to Round((Ydir0max - Ydir0min+2*Ky+track2)/Tick)-1 do begin
Form22.PaintBox1.Canvas.MoveTo(strtoint(Form21.Edit4.Text)-Ky - Round(strtoint(Form21.ComboBox1.Text)/2), Ydir0max + Ky+track2 - Tick*i);
Form22.PaintBox1.Canvas.LineTo(strtoint(Form21.Edit4.Text)-Ky + Round(strtoint(Form21.ComboBox1.Text)/2), Ydir0max + Ky+track2 - Tick*i);
end;
end;



//������ �����
//����� ������
Form22.PaintBox1.Canvas.Font.Name:=Form21.Combobox13.Text;
Form22.PaintBox1.Canvas.Font.Size:=strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1));
Form22.PaintBox1.Canvas.Font.Color:=Form21.ColorBox3.Selected;
case Form21.Combobox14.ItemIndex of
0: Form22.PaintBox1.Canvas.Font.Style:=Form22.PaintBox1.Canvas.Font.Style-[fsBold]-[fsItalic]-[fsUnderline];
1: Form22.PaintBox1.Canvas.Font.Style:=[fsBold];
2: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic];
3: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic];
end;


lng:=0;          // ������ ���������� ����� ��������� ��������
for i:=0 to Round((Ydir0max - Ydir0min+2*Ky+track2)/Tick)-1 do
if lng<length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)) then  lng:=length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));



//��� ����� �������� �������� (������ �� ��� ����� - 40)
a_length:=0;
for i:=0 to Round((Ydir0max - Ydir0min+2*Ky+track2)/Tick)-1 do
if a_length<length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)) then  a_length:=length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));





for i:=0 to Round((Ydir0max - Ydir0min+2*Ky+track2)/Tick)-1 do   begin
//if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))<9 then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (12+sqr(a_length))           , Ydir0max + Ky+track2 - Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));
if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))<9 then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (12+sqr(a_length))           , Ydir0max + Ky+track2 - Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1));



//if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=9 then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (16+sqr(a_length))         , Ydir0max + Ky+track2 - Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));
if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=9 then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (16+sqr(a_length))         , Ydir0max + Ky+track2 - Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1));



//if (strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=10) or (strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=11) then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (20+sqr(a_length))         , Ydir0max + Ky+track2 - Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));

if (strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=10) or (strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=11) then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (20+sqr(a_length))         , Ydir0max + Ky+track2 - Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min) ) ,ffFixed,4,1));


//if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=12 then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (24+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));
if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=12 then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (24+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1));


//if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=13  then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (28+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));
if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=13  then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (28+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1));


//if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=14 then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (32+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));
if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=14 then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (32+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1));


//if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=15 then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (36+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));
if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=15 then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (36+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1));


//if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=16 then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (40+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));
if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))=16 then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (40+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1));


//if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))>16 then
//Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (44+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf((a-Ky*(b-a)/(Ydir0max-Ydir0min)+i*Tick*(b-a)/(Ydir0max-Ydir0min)) ,ffFixed,4,1));
if strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))>16 then
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - (44+sqr(a_length))         , Ydir0max + Ky +track2- Tick*i -Round(strtoint(copy(Form21.Combobox12.Text,0,pos(' ',Form21.Combobox12.Text)-1))*0.7)             , copy('    ',0,2*lng-2*length(floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1)))       +     floattostrf(( b- ((b-a)*(Form22.ClientHeight-Hvert+10-i*Tick-Ydir0min))/(Ydir0max-Ydir0min)) ,ffFixed,4,1));




end;



                                                                     // ��� ��� ����, ����� ����� � ������� ������ ���� � � ������� ������������� ���������� - ������ ��� ��������                          //��� �������� � ������ ����, �� ��������� �� ��������� ���� ����                                                                                                                              //���������� �� �������




//...������ ��������� ��� ��
//����� ������
Form22.PaintBox1.Canvas.Font.Name:=Form21.Combobox10.Text;
Form22.PaintBox1.Canvas.Font.Size:=strtoint(copy(Form21.Combobox8.Text,0,pos(' ',Form21.Combobox8.Text)-1));
Form22.PaintBox1.Canvas.Font.Color:=Form21.ColorBox2.Selected;
case Form21.Combobox11.ItemIndex of
0: Form22.PaintBox1.Canvas.Font.Style:=Form22.PaintBox1.Canvas.Font.Style-[fsBold]-[fsItalic]-[fsUnderline];
1: Form22.PaintBox1.Canvas.Font.Style:=[fsBold];
2: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic];
3: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic];
end;
//��� ����� ���������
Form22.PaintBox1.Canvas.TextOut(strtoint(Form21.Edit4.Text)-Ky - Round(0.3*strtoint(copy(Form21.Combobox8.Text,0,pos(' ',Form21.Combobox8.Text)-1))*length(Form21.Edit2.Text)), Ydir0min-40 ,Form21.Edit2.Text);
                                                                 // ���������� ������ ������ - ��������� ��� �� ������ ���

end;



//������ ��������� ����� ��������� (�� ������� ��������� ����� 21)
//������� ��� ������ ����� �������
Form22.PaintBox1.Canvas.Font.Name:=Form21.Combobox16.Text;
Form22.PaintBox1.Canvas.Font.Size:=strtoint(copy(Form21.Combobox15.Text,0,pos(' ',Form21.Combobox15.Text)-1));
Form22.PaintBox1.Canvas.Font.Color:=Form21.ColorBox4.Selected;
case Form21.Combobox17.ItemIndex of
0: Form22.PaintBox1.Canvas.Font.Style:=Form22.PaintBox1.Canvas.Font.Style-[fsBold]-[fsItalic]-[fsUnderline];
1: Form22.PaintBox1.Canvas.Font.Style:=[fsBold];
2: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic];
3: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic];
end;
//��� ����� ���������
if Form21.CheckBox3.Checked then begin
if Form21.RadioButton4.Checked then
Form22.PaintBox1.Canvas.TextOut(Round(Form22.ClientWidth/2 - 0.4*strtoint(copy(Form21.Combobox15.Text,0,pos(' ',Form21.Combobox15.Text)-1))*length(Form21.Edit3.Text)),    Ydir0min-65 ,Form21.Edit3.Text);
if Form21.RadioButton5.Checked then
Form22.PaintBox1.Canvas.TextOut(Round(Form22.ClientWidth/2 - 0.4*strtoint(copy(Form21.Combobox15.Text,0,pos(' ',Form21.Combobox15.Text)-1))*length(Form21.Edit3.Text)),    Form22.ClientHeight - Hvert + 50 ,Form21.Edit3.Text);
end;                                                         // ������ ��� ����� ������






// ������ ����� �����, ������� � ����.
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
///������ ����//////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////



///////��� �������,,,,,,,,,,,,

for i:=0 to length(EDst2)-1 do  begin
for j:=0 to length(EDst7)-1 do  begin

if uppercase(CBst7[j].Text)<>'NONE' then begin   // ���� ����� �� None (�.�. �� ���������� ������, ��...)


if Edst2[i].Text=EDst7[j].Text then begin


// ������ �� ������ ������ � ��� ���������
Form22.PaintBox1.Canvas.Font.Name:=CBst8[j].Text;
Form22.PaintBox1.Canvas.Font.Size:=strtoint(copy(CBst9[j].Text,0,pos(' ',CBst9[j].Text)-1));
Form22.PaintBox1.Canvas.Font.Color:=ClBst3[j].Selected;
case CBst10[j].ItemIndex of
0: Form22.PaintBox1.Canvas.Font.Style:=Form22.PaintBox1.Canvas.Font.Style-[fsBold]-[fsItalic]-[fsUnderline];
1: Form22.PaintBox1.Canvas.Font.Style:=[fsBold];
2: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic];
3: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic];
4: Form22.PaintBox1.Canvas.Font.Style:=[fsUnderline];
5: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsUnderline];
6: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic,fsUnderline];
7: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic,fsUnderline];
end;

Form22.PaintBox1.Canvas.TextOut(Xdir1[j] -Round(0.25*strtoint(copy(CBst9[j].Text,0,pos(' ',CBst9[j].Text)-1))*length(Edst8[j].Text)) +Round(strtofloat(EDx1[j].Text)), Ydir1[j]-20-Round(strtofloat(EDy1[j].Text)), Edst8[j].Text)
                                          // ����� ������� ��� ����� �������

end;
end;
end;
end;


///////////// �������� ������� � �������..........................

for i:=0 to length(EDst2)-1 do  begin
for j:=0 to length(EDst9)-1 do  begin

if uppercase(CBst11[j].Text)<>'NONE' then begin   // ���� ����� �� None (�.�. �� ���������� ������, ��...)


if Edst2[i].Text=EDst9[j].Text then begin


// ������ �� ������ ������ � ��� ���������
Form22.PaintBox1.Canvas.Font.Name:=CBst12[j].Text;
Form22.PaintBox1.Canvas.Font.Size:=strtoint(copy(CBst13[j].Text,0,pos(' ',CBst13[j].Text)-1));
Form22.PaintBox1.Canvas.Font.Color:=ClBst4[j].Selected;
case CBst14[j].ItemIndex of
0: Form22.PaintBox1.Canvas.Font.Style:=Form22.PaintBox1.Canvas.Font.Style-[fsBold]-[fsItalic]-[fsUnderline];
1: Form22.PaintBox1.Canvas.Font.Style:=[fsBold];
2: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic];
3: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic];
4: Form22.PaintBox1.Canvas.Font.Style:=[fsUnderline];
5: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsUnderline];
6: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic,fsUnderline];
7: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic,fsUnderline];
end;

Form22.PaintBox1.Canvas.TextOut(Xdir1[j] + Round(0.1*strtoint(copy(CBst13[j].Text,0,pos(' ',CBst13[j].Text)-1))*length(Edst10[j].Text)) +Round(strtofloat(EDx2[j].Text)), Ydir1[j]+5-Round(strtofloat(EDy2[j].Text)), Edst10[j].Text)
                                          // ����� ������� ��� ����� �������

end;
end;
end;
end;



///////////////// ����� ������� (��������� ����������)


for i:=0 to length(EDst2)-1 do  begin
for j:=0 to length(EDst11)-1 do  begin

if uppercase(CBst15[j].Text)<>'NONE' then begin   // ���� ����� �� None (�.�. �� ���������� ������, ��...)


if Edst2[i].Text=EDst11[j].Text then begin


// ������ �� ������ ������ � ��� ���������
Form22.PaintBox1.Canvas.Font.Name:=CBst16[j].Text;
Form22.PaintBox1.Canvas.Font.Size:=strtoint(copy(CBst17[j].Text,0,pos(' ',CBst17[j].Text)-1));
Form22.PaintBox1.Canvas.Font.Color:=ClBst5[j].Selected;
case CBst18[j].ItemIndex of
0: Form22.PaintBox1.Canvas.Font.Style:=Form22.PaintBox1.Canvas.Font.Style-[fsBold]-[fsItalic]-[fsUnderline];
1: Form22.PaintBox1.Canvas.Font.Style:=[fsBold];
2: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic];
3: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic];
4: Form22.PaintBox1.Canvas.Font.Style:=[fsUnderline];
5: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsUnderline];
6: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic,fsUnderline];
7: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic,fsUnderline];
end;

Form22.PaintBox1.Canvas.TextOut(Xdir2[j] + 7 + Round(strtofloat(EDx3[j].Text)), Ydir1[j]- Round(0.5*strtoint(copy(CBst13[j].Text,0,pos(' ',CBst13[j].Text)-1)))                  -Round(strtofloat(EDy3[j].Text)), Edst12[j].Text)
                                          // ����� ������� ��� ����� �������

end;
end;
end;
end;



//// ��� ��� ���������� (������������)
////////////////////////////////////////////////////////////////////////\\\\
/////////////   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



for i:=0 to length(EDst13)-1 do begin
if EDst13[i]<>nil then begin

if uppercase(CBst19[i].Text)<>'NONE' then begin     // ���� �� None


for j:=0 to length(EDst2)-1 do begin


////////////////�����///////////////////////////////////////////
Form22.PaintBox1.Canvas.Font.Name:=CBst20[i].Text;
Form22.PaintBox1.Canvas.Font.Size:=strtoint(copy(CBst21[i].Text,0,pos(' ',CBst21[i].Text)-1));
Form22.PaintBox1.Canvas.Font.Color:=ClBst6[i].Selected;
case CBst22[i].ItemIndex of
0: Form22.PaintBox1.Canvas.Font.Style:=Form22.PaintBox1.Canvas.Font.Style-[fsBold]-[fsItalic]-[fsUnderline];
1: Form22.PaintBox1.Canvas.Font.Style:=[fsBold];
2: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic];
3: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic];
4: Form22.PaintBox1.Canvas.Font.Style:=[fsUnderline];
5: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsUnderline];
6: Form22.PaintBox1.Canvas.Font.Style:=[fsItalic,fsUnderline];
7: Form22.PaintBox1.Canvas.Font.Style:=[fsBold,fsItalic,fsUnderline];
end;
///////////////////////////////////////////////////////////////


if EDst13[i].Text=EDst2[j].Text then begin
for k:=0 to length(EDst2)-1 do begin
if (EDst14[i].Text=EDst2[k].Text) and (strtoint(EDst2[j].Text)<strtoint(EDst2[k].Text)) then Form22.PaintBox1.Canvas.TextOut(Round((Xdir2[j]+Xdir1[k])/2)+5+Round(strtofloat(EDx4[i].Text)),Round((Ydir2[j]+Ydir1[k])/2)-Round(strtofloat(EDy4[i].Text)), EDst15[i].Text );
if (EDst14[i].Text=EDst2[k].Text) and (strtoint(EDst2[j].Text)=strtoint(EDst2[k].Text)) then Form22.PaintBox1.Canvas.TextOut(Round((Xdir2[j]+Xdir2[k])/2)+5+Round(strtofloat(EDx4[i].Text)),Round((Ydir2[j]+Ydir2[k])/2)-Round(strtofloat(EDy4[i].Text)), EDst15[i].Text );
if (EDst14[i].Text=EDst2[k].Text) and (strtoint(EDst2[j].Text)>strtoint(EDst2[k].Text)) then Form22.PaintBox1.Canvas.TextOut(Round((Xdir1[j]+Xdir2[k])/2)+5+Round(strtofloat(EDx4[i].Text)),Round((Ydir1[j]+Ydir2[k])/2)-Round(strtofloat(EDy4[i].Text)), EDst15[i].Text );
end;
end;

end;
end;


end;
end;



//��������� ������� ����� (������� - ���������)

if Form21.CheckBox4.Checked=True then begin
//LineZero:=Round(((2*Hvert+track2-Form22.ClientHeight)*(0-a)/(b-a) +  Form22.ClientHeight-Hvert-track2))+track2;
LineZero:=Round(Ydir0min+b*((Ydir0max-Ydir0min)/(b-a)))-4;
LineStart:=strtoint(Form21.Edit4.Text);
LineEnd:=Form22.ClientWidth-60;

if Form21.ComboBox18.ItemIndex=0 then Form22.PaintBox1.Canvas.Pen.Style:=psSolid;
if Form21.ComboBox18.ItemIndex=1 then Form22.PaintBox1.Canvas.Pen.Style:=psDot;
if Form21.ComboBox18.ItemIndex=2 then Form22.PaintBox1.Canvas.Pen.Style:=psDash;
Form22.PaintBox1.Canvas.Pen.Width:=strtoint(Form21.ComboBox19.Text);
Form22.PaintBox1.Canvas.Pen.Color:=Form21.ColorBox5.Selected;


Form22.PaintBox1.Canvas.MoveTo(LineStart,LineZero);
Form22.PaintBox1.Canvas.LineTo(LineEnd,LineZero);

end;


//��������� ����� �������� (������� - ���������)
if Form21.CheckBox5.Checked=True then begin

if (Form21.Edit6.Text='') or (Form21.Edit6.Text=' ') or (copy(Form21.Edit6.Text,1,2)='00') then Form21.Edit6.Text:='100 %';


if pos('%',Form21.Edit6.Text)<>0 then  begin
pos1:=0;
pos2:=0;
pos3:=0;
pos4:=0;
for sp:=1 to length(Form21.Edit6.Text) do begin
if (copy(Form21.Edit6.Text,sp,1)=' ') then pos1:=pos1+1         //������� �� ��������
else break;
end;
for sp:=1 to length(Form21.Edit6.Text) do  begin
if (copy(Form21.Edit6.Text,pos1+sp,1)<>' ') then pos2:=pos2+1       //�������
else break;
end;
for sp:=1 to length(Form21.Edit6.Text) do  begin
if (copy(Form21.Edit6.Text,pos1+pos2+sp,1)=' ') then pos3:=pos3+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for sp:=1 to length(Form21.Edit6.Text) do  begin
if (copy(Form21.Edit6.Text,pos1+pos2+pos3+sp,1)<>' ') then pos4:=pos4+1   //���� ��� 1-�� ����������
else break;
end;

if pos('%',copy(Form21.Edit6.Text,pos1+1,pos2))<>0 then LMin:=strtofloat(copy(Form21.Edit6.Text,pos1+1,pos2-1))
else LMin:=strtofloat(copy(Form21.Edit6.Text,pos1+1,pos2));

LineMin:=Round(((2*Hvert+track2-Form22.ClientHeight)*((b-a)*(1-(LMin/100)))/(b-a) +  Form22.ClientHeight-Hvert-track2));


end
else  begin
pos1:=0;
pos2:=0;
pos3:=0;
pos4:=0;
for sp:=1 to length(Form21.Edit6.Text) do begin
if (copy(Form21.Edit6.Text,sp,1)=' ') then pos1:=pos1+1         //������� �� ��������
else break;
end;
for sp:=1 to length(Form21.Edit6.Text) do  begin
if (copy(Form21.Edit6.Text,pos1+sp,1)<>' ') then pos2:=pos2+1       //�������
else break;
end;


LMin:=strtofloat(copy(Form21.Edit6.Text,pos1+1,pos2));
LineMin:=Round(((2*Hvert+track2-Form22.ClientHeight)*(LMin-a)/(b-a) +  Form22.ClientHeight-Hvert-track2));

end;


LineStart:=strtoint(Form21.Edit4.Text);
LineEnd:=Form22.ClientWidth-60;
if Form21.ComboBox20.ItemIndex=0 then Form22.PaintBox1.Canvas.Pen.Style:=psSolid;
if Form21.ComboBox20.ItemIndex=1 then Form22.PaintBox1.Canvas.Pen.Style:=psDot;
if Form21.ComboBox20.ItemIndex=2 then Form22.PaintBox1.Canvas.Pen.Style:=psDash;
Form22.PaintBox1.Canvas.Pen.Width:=strtoint(Form21.ComboBox21.Text);
Form22.PaintBox1.Canvas.Pen.Color:=Form21.ColorBox6.Selected;


Form22.PaintBox1.Canvas.MoveTo(LineStart,LineMin);
Form22.PaintBox1.Canvas.LineTo(LineEnd,LineMin);

end;








//��������� ����� ��������� (������� - ���������)
if Form21.CheckBox6.Checked=True then begin

if (Form21.Edit7.Text='') or (Form21.Edit7.Text=' ') or (copy(Form21.Edit7.Text,1,2)='00') then Form21.Edit7.Text:='100 %';


if pos('%',Form21.Edit7.Text)<>0 then  begin
pos1:=0;
pos2:=0;
pos3:=0;
pos4:=0;
for sp:=1 to length(Form21.Edit7.Text) do begin
if (copy(Form21.Edit7.Text,sp,1)=' ') then pos1:=pos1+1         //������� �� ��������
else break;
end;
for sp:=1 to length(Form21.Edit7.Text) do  begin
if (copy(Form21.Edit7.Text,pos1+sp,1)<>' ') then pos2:=pos2+1       //�������
else break;
end;
for sp:=1 to length(Form21.Edit7.Text) do  begin
if (copy(Form21.Edit7.Text,pos1+pos2+sp,1)=' ') then pos3:=pos3+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for sp:=1 to length(Form21.Edit7.Text) do  begin
if (copy(Form21.Edit7.Text,pos1+pos2+pos3+sp,1)<>' ') then pos4:=pos4+1   //���� ��� 1-�� ����������
else break;
end;

if pos('%',copy(Form21.Edit7.Text,pos1+1,pos2))<>0 then LMax:=strtofloat(copy(Form21.Edit7.Text,pos1+1,pos2-1))
else LMax:=strtofloat(copy(Form21.Edit7.Text,pos1+1,pos2));

LineMax:=Round(((2*Hvert+track2-Form22.ClientHeight)*(b-(b-a)*(1-(LMax/100))-a)/(b-a) +  Form22.ClientHeight-Hvert-track2));


end
else  begin
pos1:=0;
pos2:=0;
pos3:=0;
pos4:=0;
for sp:=1 to length(Form21.Edit7.Text) do begin
if (copy(Form21.Edit7.Text,sp,1)=' ') then pos1:=pos1+1         //������� �� ��������
else break;
end;
for sp:=1 to length(Form21.Edit7.Text) do  begin
if (copy(Form21.Edit7.Text,pos1+sp,1)<>' ') then pos2:=pos2+1       //�������
else break;
end;


LMax:=strtofloat(copy(Form21.Edit7.Text,pos1+1,pos2));
LineMax:=Round(((2*Hvert+track2-Form22.ClientHeight)*(LMax-a)/(b-a) +  Form22.ClientHeight-Hvert-track2));

end;


LineStart:=strtoint(Form21.Edit4.Text);
LineEnd:=Form22.ClientWidth-60;
if Form21.ComboBox22.ItemIndex=0 then Form22.PaintBox1.Canvas.Pen.Style:=psSolid;
if Form21.ComboBox22.ItemIndex=1 then Form22.PaintBox1.Canvas.Pen.Style:=psDot;
if Form21.ComboBox22.ItemIndex=2 then Form22.PaintBox1.Canvas.Pen.Style:=psDash;
Form22.PaintBox1.Canvas.Pen.Width:=strtoint(Form21.ComboBox23.Text);
Form22.PaintBox1.Canvas.Pen.Color:=Form21.ColorBox7.Selected;


Form22.PaintBox1.Canvas.MoveTo(LineStart,LineMax);
Form22.PaintBox1.Canvas.LineTo(LineEnd,LineMax);

end;


























//end;























end;

procedure TForm22.FormCreate(Sender: TObject);
begin
Form22.PaintBox1.Color:=clWhite;
Form22.DoubleBuffered:=True;
end;

procedure TForm22.PaintBox1DblClick(Sender: TObject);
begin
Form21.Show;
end;

procedure TForm22.N1Click(Sender: TObject);
var  Bitmap: TBitmap;
a: widestring;
begin
Bitmap := TBitmap.Create;
Bitmap.Height:=PaintBox1.ClientHeight;
Bitmap.Width:=PaintBox1.ClientWidth;
Bitmap.Canvas.CopyRect(Rect(0,0,Bitmap.Width,Bitmap.Height),Form22.PaintBox1.Canvas,Form22.PaintBox1.ClientRect);

If SaveDialog1.Execute then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
Bitmap.SaveToFile(a);
end;
Bitmap.Free;
Savedialog1.FreeOnRelease;




end;

procedure TForm22.N2Click(Sender: TObject);
var f: TextFile;
    i: word;
    ind,ind1,ind2,ind3: string;     // Yes ��� No ��� ����������
    a,probel: widestring;
begin
If SaveDialog2.Execute then begin
if  pos('.dgr',Savedialog2.Filename)<>0 then a:=Savedialog2.Filename
else a:=Savedialog2.Filename+'.dgr';
AssignFile(f,a);
Rewrite(f);

WriteLn(f,' !***********************************************************');
WriteLn(f,' !*                        Magellan                         *');
WriteLn(f,' !*                designed by PANDORA soft                 *');
WriteLn(f,' !*                                                         *');
WriteLn(f,' !*      DGR-descriptor for generating energy diagramm      *');
WriteLn(f,' !*      Works with the interpreter as part of Magellan     *');
WriteLn(f,' !***********************************************************');
WriteLn(f, '');
WriteLn(f, '');

if Form21.CheckBox3.Checked=True then WriteLn(f,' TD:  Yes')
else  WriteLn(f,' TD:  No');                                                    //��������� �������� - �� ���
if Form21.Radiobutton4.Checked=True then WriteLn(f,' TD_pl = up');              //��������� ������
if Form21.Radiobutton5.Checked=True then WriteLn(f,' TD_pl = down');            //��������� �����
WriteLn(f, ' TD = "'+Form21.Edit3.Text+'"');                                    //��� ���������
WriteLn(f, ' TD(FS) = '+copy(Form21.Combobox15.Text,1,length(Form21.Combobox15.Text)-3));      //������ ������ ���������
WriteLn(f, ' TD(FN) = '+Form21.Combobox16.Text);                                               //��� ������ ���������
WriteLn(f, ' TD(FC) = '+Form21.Colorbox4.ColorNames[Form21.Colorbox4.ItemIndex]);              //���� ������ ���������
WriteLn(f, ' TD(FSt) = '+Form21.Combobox17.Text);                                              //����� ������ ���������
WriteLn(f, ' IPX = '+Form21.Edit4.Text);                                                       //��������� ����� �� ��� �
WriteLn(f, ' IPY = '+Form21.Edit5.Text);                                                       //��������� ����� �� ��� Y
WriteLn(f, ' SCX = '+inttostr(Form21.TrackBar1.Position));                                     //����� �� ��� ���������� �������
WriteLn(f, ' SCY = '+inttostr(Form21.TrackBar2.Position));                                     //����� �� ��� �������
WriteLn(f, ' SCIS = '+inttostr(Form21.TrackBar3.Position));                                    //��������������� ����������� ������������
if Form21.CheckBox1.Checked=True then WriteLn(f, ' AX:  Yes')                                  //��� � - �� ���
else  WriteLn(f, ' AX:  No');
WriteLn(f, ' AX = "'+Form21.Edit1.Text+'"');                                                   //������������ ��� �
WriteLn(f, ' AX(W) = '+Form21.Combobox2.Text);                                                 //������� ����� ��� �
WriteLn(f, ' AX(FS) = '+copy(Form21.Combobox3.Text,1,length(Form21.Combobox3.Text)-3));        //������ ������ �������� ��� �
WriteLn(f, ' AX(FN) = '+Form21.Combobox4.Text);                                                //��� ������ �������� ��� �
WriteLn(f, ' AX(FC) = '+Form21.Colorbox1.ColorNames[Form21.Colorbox1.ItemIndex]);              //���� ������ �������� ��� �
WriteLn(f, ' AX(FSt) = '+Form21.Combobox5.Text);                                               //����� ������ �������� ��� �

if Form21.CheckBox2.Checked=True then WriteLn(f, ' AY:  Yes')                                  //��� Y - ��  ���
else  WriteLn(f, ' AY:  No');
WriteLn(f, ' AY = "'+Form21.Edit2.Text+'"');                                                   //������������ ��� Y
WriteLn(f, ' AY(W) = '+Form21.Combobox6.Text);                                                 //������� ����� ��� Y
WriteLn(f, ' AY(FS) = '+copy(Form21.Combobox8.Text,1,length(Form21.Combobox8.Text)-3));        //������ ������ �������� ��� Y
WriteLn(f, ' AY(FN) = '+Form21.Combobox10.Text);                                               //��� ������ �������� ��� Y
WriteLn(f, ' AY(FC) = '+Form21.Colorbox2.ColorNames[Form21.Colorbox2.ItemIndex]);              //���� ������ �������� ��� Y
WriteLn(f, ' AY(FSt) = '+Form21.Combobox11.Text);                                              //����� ������ �������� ��� Y
WriteLn(f, ' AYT(W) = '+Form21.Combobox7.Text);                                                //������� ����� �������� ����� Y
WriteLn(f, ' AYT(L) = '+Form21.Combobox1.Text);                                                //����� ����� �������� ����� Y
WriteLn(f, ' AYT(F) = '+Form21.Combobox9.Text);                                                //������� ����� �������� ����� Y
if Form21.Radiobutton1.Checked=True then WriteLn(f,' AYT_pl = out');                           //�������� ����� Y ������
if Form21.Radiobutton2.Checked=True then WriteLn(f,' AYT_pl = in');                            //�������� ����� Y ������
if Form21.Radiobutton3.Checked=True then WriteLn(f,' AYT_pl = centre');                        //�������� ����� Y �� ������

WriteLn(f, ' AYT(FS) = '+copy(Form21.Combobox12.Text,1,length(Form21.Combobox12.Text)-3));     //������ ������ ��������� ��������
WriteLn(f, ' AYT(FN) = '+Form21.Combobox13.Text);                                              //��� ������ ��������� ��������
WriteLn(f, ' AYT(FC) = '+Form21.Colorbox3.ColorNames[Form21.Colorbox3.ItemIndex]);             //���� ������ ��������� ��������
WriteLn(f, ' AYT(FSt) = '+Form21.Combobox14.Text);                                             //����� ������ ��������� ��������

if Form21.CheckBox4.Checked=True then WriteLn(f, ' LZ:  Yes')                                  //������� ����� - �� ���
else WriteLn(f, ' LZ:  No');
WriteLn(f, ' LZ(W) = '+Form21.Combobox19.Text);                                                //������� ������� �����
WriteLn(f, ' LZ(C) = '+Form21.Colorbox5.ColorNames[Form21.Colorbox5.ItemIndex]);               //���� ������� �����
WriteLn(f, ' LZ(St) = '+Form21.Combobox18.Text);                                               //����� ������� �����

probel:='                                                                                          ';

if Form21.CheckBox5.Checked=True then WriteLn(f, ' LMIN:  Yes')                                //����� �������� ������� - �� ���
else WriteLn(f, ' LMIN:  No');
WriteLn(f, ' LMIN(W) = '+Form21.Combobox21.Text);                                              //�������
WriteLn(f, ' LMIN(C) = '+Form21.Colorbox6.ColorNames[Form21.Colorbox6.ItemIndex]);             //����
WriteLn(f, ' LMIN(St) = '+Form21.Combobox20.Text);                                             //�����
if (Form21.Edit6.Text<>'') and (Form21.Edit6.Text<>copy(probel,1,length(Form21.Edit6.Text))) then
WriteLn(f, ' LMIN = '+Form21.Edit6.Text)
else  WriteLn(f, ' LMIN = 100 %');                                                             //��������

if Form21.CheckBox6.Checked=True then WriteLn(f, ' LMAX:  Yes')                                //����� ��������� ������� - �� ���
else WriteLn(f, ' LMAX:  No');
WriteLn(f, ' LMAX(W) = '+Form21.Combobox23.Text);                                              //�������
WriteLn(f, ' LMAX(C) = '+Form21.Colorbox7.ColorNames[Form21.Colorbox7.ItemIndex]);             //����
WriteLn(f, ' LMAX(St) = '+Form21.Combobox22.Text);                                             //�����
if (Form21.Edit7.Text<>'') and (Form21.Edit7.Text<>copy(probel,1,length(Form21.Edit7.Text))) then
WriteLn(f, ' LMAX = '+Form21.Edit7.Text)
else  WriteLn(f, ' LMAX = 100 %');                                                             //��������


WriteLn(f, '');

probel:='';
for i:=0 to 100 do
probel:=probel+' ';


for i:=0 to length(EDst2)-1 do
WriteLn(f, ' P'+EDst2[i].Text+ copy(probel,1,4-length(EDst2[i].Text)) +EDst4[i].Text + copy(probel,1,15-length(EDst4[i].Text)) +CBst1[i].Text + copy(probel,1,7-length(CBst1[i].Text))+ '"' + EDst3[i].Text + '"'+ copy(probel,1,30-length(EDst3[i].Text)) +  '[' +EDst1[i].Text+']'+ copy(probel,1,7-length(EDst1[i].Text)) + CBst2[i].Text + copy(probel,1,8-length(CBst2[i].Text)) + ClBst1[i].ColorNames[ClBst1[i].ItemIndex] +    copy(probel,1,10-length(ClBst1[i].ColorNames[ClBst1[i].ItemIndex]))   + CBst3[i].Text + copy(probel,1,4-length(CBst3[i].Text)) + CBst4[i].Text );


WriteLn(f, '');

for i:=0 to length(EDst5)-1 do begin
if CBst19[i].Text='Text' then ind:='Yes'   else ind:='No';
WriteLn(f, ' AR' + '   ' +EDst5[i].Text + '->' +EDst6[i].Text + copy(probel,1,8-length(EDst5[i].Text + '->' +EDst6[i].Text)) + CBst5[i].Text + copy(probel,1,5-length(CBst5[i].Text)) +CBst6[i].Text + copy(probel,1,8-length(CBst6[i].Text)) + ClBst2[i].ColorNames[ClBst2[i].ItemIndex]+  copy(probel,1,12-length(ClBst2[i].ColorNames[ClBst2[i].ItemIndex]))  +  'Name=(' + CBst20[i].Text + ',' + copy(CBst21[i].Text,1,length(CBst21[i].Text)-3) + ',' + ClBst6[i].ColorNames[ClBst6[i].ItemIndex] + ',' + CBst22[i].Text + ',' + EDx4[i].Text + ',' + EDy4[i].Text +'):'+   copy(probel,1,62-length('Name=(' + CBst20[i].Text + ',' + copy(CBst21[i].Text,1,length(CBst21[i].Text)-3) + ',' + ClBst6[i].ColorNames[ClBst6[i].ItemIndex] + ',' + CBst22[i].Text + ',' + EDx4[i].Text + ',' + EDy4[i].Text +'):')) +  '  ' + ind  );
end;

WriteLn(f, '');


for i:=0 to length(EDst2)-1 do begin
if CBst7[i].Text='Text' then ind1:='Yes'   else ind1:='No';
if CBst11[i].Text='Text' then ind2:='Yes'   else ind2:='No';
if CBst15[i].Text='Text' then ind3:='Yes'   else ind3:='No';
WriteLn(f, ' SPT' + '   ' + 'P'+EDst7[i].Text +  copy(probel,1,5-length(EDst7[i].Text)) + 'Name=(' + CBst8[i].Text + ',' + copy(CBst9[i].Text,1,length(CBst9[i].Text)-3) + ',' + ClBst3[i].ColorNames[ClBst3[i].ItemIndex] + ',' + CBst10[i].Text + ',' + EDx1[i].Text + ',' + EDy1[i].Text +'):' +  copy(probel,1,62-length('Name=(' + CBst8[i].Text + ',' + copy(CBst9[i].Text,1,length(CBst9[i].Text)-3) + ',' + ClBst3[i].ColorNames[ClBst3[i].ItemIndex] + ',' + CBst10[i].Text + ',' + EDx1[i].Text + ',' + EDy1[i].Text +'):')) +' '+   ind1  +  copy(probel,1,6-length(ind1)) +    'Energy=(' + CBst12[i].Text + ',' + copy(CBst13[i].Text,1,length(CBst13[i].Text)-3) + ',' + ClBst4[i].ColorNames[ClBst4[i].ItemIndex] + ',' + CBst14[i].Text + ',' + EDx2[i].Text + ',' + EDy2[i].Text +'):'  +   copy(probel,1,62-length('Energy=(' + CBst12[i].Text + ',' + copy(CBst13[i].Text,1,length(CBst13[i].Text)-3) + ',' + ClBst4[i].ColorNames[ClBst4[i].ItemIndex] + ',' + CBst14[i].Text + ',' + EDx2[i].Text + ',' + EDy2[i].Text +'):')) + ' '+
 ind2 +  copy(probel,1,6-length(ind2))  +        'Num=(' + CBst16[i].Text + ',' + copy(CBst17[i].Text,1,length(CBst17[i].Text)-3) + ',' + ClBst5[i].ColorNames[ClBst5[i].ItemIndex] + ',' + CBst18[i].Text + ',' + EDx3[i].Text + ',' + EDy3[i].Text +'):'   +  copy(probel,1,62-length('Num=(' + CBst16[i].Text + ',' + copy(CBst17[i].Text,1,length(CBst17[i].Text)-3) + ',' + ClBst5[i].ColorNames[ClBst5[i].ItemIndex] + ',' + CBst18[i].Text + ',' + EDx3[i].Text + ',' + EDy3[i].Text +'):')) +' '+    ind3  );
end;


WriteLn(f, '');






CloseFile(f);
end;
Savedialog2.FreeOnRelease;


end;

end.
