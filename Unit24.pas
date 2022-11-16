unit Unit24;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Menus, OleServer, ExcelXP, ComObj, ActiveX,
  ExtCtrls;

type
  TForm24 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Excel1: TMenuItem;
    N5: TMenuItem;
    Excel2: TMenuItem;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    N7: TMenuItem;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TrackBar1: TTrackBar;
    Label8: TLabel;
    TrackBar2: TTrackBar;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Excel2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;
  pol1,pol2,pol3: widestring;
  ch,ch_at: word;       // ch - ������� �����   , ch_at - ������� ������
  frn,orb,freq,mass,fr_const,ir_inten,raman,depolar_p,depolar_u,dip_str,rot_str: array of string;
  nom,at_nom: array of string;
  dx1,dy1,dz1: array of array of string;
  pol1_mult,pol2_mult,pol3_mult: array of string;
  ch_mult,ch_at_mult: array of word;
  frn_mult,orb_mult,freq_mult,mass_mult,fr_const_mult,ir_inten_mult,nom_mult,at_nom_mult,raman_mult,depolar_p_mult,depolar_u_mult,dip_str_mult,rot_str_mult: array of array of string;
  dx1_mult,dy1_mult,dz1_mult: array of array of array of string;
  basket,img_freq: array of word;
  AA,kor: real;
  BBB: boolean=false;

implementation

uses Unit1, Unit25, Unit27, Unit28, Unit29, Unit33, Unit35, Unit36;

{$R *.dfm}

procedure TForm24.FormShow(Sender: TObject);
var f: TextFile;
str: widestring;
p,cn1,cn2,cn3,cn4,cn5,cn6,cn7,cn8,cn9,cn10,cn11,cn12,cn13,cn14,cn15,cn16,cn17,cn18,cn19,cn20,cn21,cn22,i,s,j,k: word;
cic,maxj,cic_at,maxj_at,a,max_b,p1: word;
itm: TListItem;
label 0,10,11,12,13,101,102,103,104,105,131,132,133,134,135,77;
begin
ListView1.Clear;
ComboBox1.Clear;
if dial=true then  BitBtn2.Enabled:=True  else BitBtn2.Enabled:=False;
BitBtn1.Enabled:=True;

///////////////////////////��������� ���� ���������� � ��������/////////////////////////////
pol1:='';
pol2:='';
pol3:='';
ch:=0;
ch_at:=0;
frn:=nil;
orb:=nil;
freq:=nil;
mass:=nil;
fr_const:=nil;
ir_inten:=nil;
nom:=nil;
at_nom:=nil;
dx1:=nil;
dy1:=nil;
dz1:=nil;
pol1_mult:=nil;
pol2_mult:=nil;
pol3_mult:=nil;
ch_mult:=nil;
ch_at_mult:=nil;
frn_mult:=nil;
orb_mult:=nil;
freq_mult:=nil;
mass_mult:=nil;
fr_const_mult:=nil;
ir_inten_mult:=nil;
nom_mult:=nil;
at_nom_mult:=nil;
dx1_mult:=nil;
dy1_mult:=nil;
dz1_mult:=nil;
basket:=nil;
cic:=0;
maxj:=0;
cic_at:=0;
maxj_at:=0;
a:=0;
max_b:=0;
p:=0;
i:=0;
s:=0;
j:=0;
k:=0;
Raman:=nil;
depolar_p:=nil;
depolar_u:=nil;
raman_mult:=nil;
depolar_p_mult:=nil;
depolar_u_mult:=nil;
dip_str:=nil;
dip_str_mult:=0;
rot_str:=nil;
rot_str_mult:=nil;
BitBtn3.Enabled:=False;
BitBtn4.Enabled:=False;
while ListView1.Columns.Count>4 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);
///////////////////////////////////////////////////////////////////////////////////////


if ListView1.Columns.Count>4 then begin
ListView1.Columns.Delete(ListView1.Columns.Count-1);
ListView1.Columns.Delete(ListView1.Columns.Count-1);
ListView1.Columns.Delete(ListView1.Columns.Count-1);
end;







if dial=true  then begin  // ������ ������ ������ ������ �����
AssignFile(f,Form1.OpenDialog1.FileName);
Reset(f);
while not Eof(f) do begin
ReadLn(f,str);
if pos('Diagonal vibrational polarizability',str)<>0 then break;
if pos('Harmonic frequencies (cm**-1)',str)<>0 then begin
goto 11;
break;
end;
end;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;

ReadLn(f,str);


for p:=1 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� 2-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //2-�� �������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� 3-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //3-�� �������
else break;
end;

pol1:= copy(str,cn1+1,cn2);   //������ ��������
pol2:= copy(str,cn1+cn2+cn3+1,cn4);    //������ ��������
pol3:= copy(str,cn1+cn2+cn3+cn4+cn5+1,cn6);   //������ ��������

ReadLn(f,str);
11: ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str); // ������ �� ������ ������ ������

ch:=0;
ch_at:=0;
basket:=0;





ReadLn(f,str);  // ��������� ������   1    2     3 ...

p1:=0;          // � ��� ��� ����, ���� ���������� ������� �� ������ ����� �� ������  1   2    3 ////*******
while copy(str,1,15)<>'               ' do  begin
p1:=p1+1;
if p1>10 then break;
ReadLn(f,str);
end;       /////********************************************************************************************


if  copy(str,1,15)<>'               ' then begin      /// �����������
MessageDlg('����������� ������ � ����������',mtWarning,[mbOK],0);
BitBtn1.Enabled:=False;
label5.Caption:='?????';
label6.Caption:='?????';
label7.Caption:='?????';
goto 0;
end;


//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
while str<>''  do begin      // ������ �� ����� ������ ������   !!!!!!!!!!!!!!!!!!!!! ������ ������ ������
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;

setlength(frn,ch+3);
if pos('               ',str)<>0 then begin

for p:=1 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� 2-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //2-�� �������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� 3-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //3-�� �������
else break;
end;

frn[ch]:= copy(str,cn1+1,cn2);   //������ �����
frn[ch+1]:= copy(str,cn1+cn2+cn3+1,cn4);    //������ �����
frn[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+1,cn6);   //������ �����


cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;


ReadLn(f,str);  // ��������� ������ ����� ���������  �     �    �  ...
setlength(orb,ch+3);

for p:=1 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� 2-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //2-�� �������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� 3-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //3-�� �������
else break;
end;


orb[ch]:= copy(str,cn1+1,cn2);   //������ ��� ��
orb[ch+1]:= copy(str,cn1+cn2+cn3+1,cn4);    //������ ��� ��
orb[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+1,cn6);   //������ ��� ��


cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ������   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
setlength(freq,ch+3);
if pos('Frequencies --',str)<>0   then begin


for p:=length('Frequencies --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������
else break;
end;

freq[ch]:= copy(str,cn1+2+length('Frequencies --'),cn2);   //������ �������
freq[ch+1]:= copy(str,cn1+cn2+cn3+2+length('Frequencies --'),cn4);    //������ �������
freq[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Frequencies --'),cn6);   //������ �������

end;


cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ����   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
setlength(mass,ch+3);
if pos('Red. masses --',str)<>0   then begin


for p:=length('Red. masses --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �����
end;

mass[ch]:= copy(str,cn1+2+length('Red. masses --'),cn2);   //������ �����
mass[ch+1]:= copy(str,cn1+cn2+cn3+2+length('Red. masses --'),cn4);    //������ �����
mass[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Red. masses --'),cn6);   //������ �����

end;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ��������   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
setlength(fr_const,ch+3);
if pos('Frc consts  --',str)<>0   then begin


for p:=length('Frc consts  --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ ���������
end;

fr_const[ch]:= copy(str,cn1+2+length('Frc consts  --'),cn2);   //������ ���������
fr_const[ch+1]:= copy(str,cn1+cn2+cn3+2+length('Frc consts  --'),cn4);    //������ ���������
fr_const[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Frc consts  --'),cn6);   //������ ���������

end;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ��������������   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
setlength(ir_inten,ch+3);
if pos('IR Inten    --',str)<>0   then begin


for p:=length('IR Inten    --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

ir_inten[ch]:= copy(str,cn1+2+length('IR Inten    --'),cn2);   //������ �������������
ir_inten[ch+1]:= copy(str,cn1+cn2+cn3+2+length('IR Inten    --'),cn4);    //������ �������������
ir_inten[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('IR Inten    --'),cn6);   //������ �������������

end;


cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ����������� �����������   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if pos('Raman',str)=0 then goto 101;
setlength(raman,ch+3);
if pos('Raman Activ --',str)<>0   then begin


for p:=length('Raman Activ --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

raman[ch]:= copy(str,cn1+2+length('Raman Activ --'),cn2);   //������ �������������
raman[ch+1]:= copy(str,cn1+cn2+cn3+2+length('Raman Activ --'),cn4);    //������ �������������
raman[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Raman Activ --'),cn6);   //������ �������������

end;





ReadLn(f,str);  // ���������  ������������� �   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
101:
if pos('Depolar',str)=0 then goto 102;
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;


if pos('Depolar',str)=0 then goto 102;
setlength(depolar_p,ch+3);
if pos('Depolar (P) --',str)<>0   then begin


for p:=length('Depolar (P) --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

depolar_p[ch]:= copy(str,cn1+2+length('Depolar (P) --'),cn2);   //������ �������������
depolar_p[ch+1]:= copy(str,cn1+cn2+cn3+2+length('Depolar (P) --'),cn4);    //������ �������������
depolar_p[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Depolar (P) --'),cn6);   //������ �������������

end;




ReadLn(f,str);  // ���������  ������������� U   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
102:
if pos('Depolar',str)=0 then goto 103;
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;


if pos('Depolar',str)=0 then goto 103;
setlength(depolar_u,ch+3);
if pos('Depolar (U) --',str)<>0   then begin


for p:=length('Depolar (U) --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

depolar_u[ch]:= copy(str,cn1+2+length('Depolar (U) --'),cn2);   //������ �������������
depolar_u[ch+1]:= copy(str,cn1+cn2+cn3+2+length('Depolar (U) --'),cn4);    //������ �������������
depolar_u[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Depolar (U) --'),cn6);   //������ �������������

end;



ReadLn(f,str);  // ���������  Dip. str. (VCD)  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
103:
if pos('Dip. str.',str)=0 then goto 104;
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;


if pos('Dip. str.',str)=0 then goto 104;
setlength(dip_str,ch+3);
if pos('Dip. str.   --',str)<>0   then begin


for p:=length('Dip. str.   --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ ����������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ ����������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ ����������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ ����������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� ����������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ ����������
end;

dip_str[ch]:= copy(str,cn1+2+length('Dip. str.   --'),cn2);   //������ ����������
dip_str[ch+1]:= copy(str,cn1+cn2+cn3+2+length('Dip. str.   --'),cn4);    //������ ����������
dip_str[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Dip. str.   --'),cn6);   //������ ����������

end;


ReadLn(f,str);  // ���������  Rot. str. (VCD)  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
104:
if pos('Rot. str.',str)=0 then goto 105;
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;


if pos('Rot. str.',str)=0 then goto 105;
setlength(rot_str,ch+3);
if pos('Rot. str.   --',str)<>0   then begin


for p:=length('Rot. str.   --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ ����������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ ����������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ ����������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ ����������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� ����������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ ����������
end;

rot_str[ch]:= copy(str,cn1+2+length('Rot. str.   --'),cn2);   //������ ����������
rot_str[ch+1]:= copy(str,cn1+cn2+cn3+2+length('Rot. str.   --'),cn4);    //������ ����������
rot_str[ch+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Rot. str.   --'),cn6);   //������ ����������

end;


105:
while pos('Atom',str)=0  do
ReadLn(f,str);
if pos('Atom',str)<>0 then goto 10;


/// ������ ��������� ��������� ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
///////////////////////////////////////////////////////////////////////////////////
/// ������������ �������� �� ����������.............................................



ch_at:=0;

ReadLn(f,str);  // ���� ������ ����������
10:
ReadLn(f,str);


i:=0;
while (copy(str,1,13)<>'             ') and (str<>'') do begin

ch_at:=ch_at+1;
if a<ch_at then a:=ch_at;




setlength(nom,a);
setlength(at_nom,a);
setlength(dx1,ch+3,a);
setlength(dy1,ch+3,a);
setlength(dz1,ch+3,a);




cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;
cn13:=0;
cn14:=0;
cn15:=0;
cn16:=0;
cn17:=0;
cn18:=0;
cn19:=0;
cn20:=0;
cn21:=0;
cn22:=0;




for p:=1 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1    //������� �� ����������� ������
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1    //���������� �����
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+p,1)=' ' then cn3:=cn3+1    //������� �� �������� ������ � �������
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1    //������� �����
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' '  then cn5:=cn5+1    //������ �� �1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ' then cn6:=cn6+1    //�1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+p,1)=' ' then cn7:=cn7+1    //������� �� Y1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p,1)<>' ' then cn8:=cn8+1    //Y1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p,1)=' ' then cn9:=cn9+1    //������� �� Z1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p,1)<>' ' then cn10:=cn10+1    //Z1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p,1)=' ' then cn11:=cn11+1    //������� �� �2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p,1)<>' ' then cn12:=cn12+1    //�2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+p,1)=' ' then cn13:=cn13+1    //������� �� Y2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+p,1)<>' ' then cn14:=cn14+1    //Y2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+p,1)=' ' then cn15:=cn15+1    //������� �� Z2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+p,1)<>' '  then cn16:=cn16+1    //Z2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+p,1)=' ' then cn17:=cn17+1    //������� �� �3
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+p,1)<>' ' then cn18:=cn18+1    //�3
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+p,1)=' ' then cn19:=cn19+1    //������� �� Y3
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+p,1)<>' ' then cn20:=cn20+1    //Y3
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+p,1)=' ' then cn21:=cn21+1    //������� �� Z3
else break;
end;
for p:=1 to length(str) do begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>' ') and (copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>'') and (copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>#13)  then cn22:=cn22+1    //Z3
else break;
end;


nom[i]:=copy(str,cn1+1,cn2);       //  ���������� �����
at_nom[i]:=copy(str,cn1+cn2+cn3+1,cn4);    // ������� �����
dx1[ch,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+1,cn6);        //�1
dy1[ch,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+1,cn8);   //Y1
dz1[ch,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+1,cn10);        //Z1
dx1[ch+1,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+1,cn12);        //X2
dy1[ch+1,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+1,cn14); //Y2
dz1[ch+1,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+1,cn16);        //Z2
dx1[ch+2,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+1,cn18);        //X3
dy1[ch+2,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+1,cn20);  //Y3
dz1[ch+2,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+1,cn22);    //Z3

i:=i+1;


ReadLn(f,str);

end;   // ����� ������ ������������ ��������

ch:=ch+3;
//basket[j]:=ch_at;


end;    // ����� ������ ������ ������

end;    // ���� �������� �� �����

CloseFile(f);




end;    // ����� �������� ������� ������ �����






if dial=false  then begin  // ������ ������ ������ ���������� ������!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                           //  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
setlength(ch_mult,nf);
setlength(ch_at_mult,nf);
setlength(basket,nf);

                           // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
for j:=0 to nf-1 do  begin
AssignFile(f,Form1.OpenDialog2.Files[j]);
Reset(f);
while not Eof(f) do begin
ReadLn(f,str);
if pos('Diagonal vibrational polarizability',str)<>0 then break;
if pos('Harmonic frequencies (cm**-1)',str)<>0 then begin
goto 12;
break;
end;
end;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;

ReadLn(f,str);


for p:=1 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� 2-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //2-�� �������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� 3-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //3-�� �������
else break;
end;

setlength(pol1_mult,nf);
setlength(pol2_mult,nf);
setlength(pol3_mult,nf);

pol1_mult[j]:= copy(str,cn1+1,cn2);   //������ ��������
pol2_mult[j]:= copy(str,cn1+cn2+cn3+1,cn4);    //������ ��������
pol3_mult[j]:= copy(str,cn1+cn2+cn3+cn4+cn5+1,cn6);   //������ ��������

ReadLn(f,str);
12: ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str); // ������ �� ������ ������ ������

ch_mult[j]:=0;
ch_at_mult[j]:=0;
basket[j]:=0;





ReadLn(f,str);  // ��������� ������   1    2     3 ...

p1:=0;          // � ��� ��� ����, ���� ���������� ������� �� ������ ����� �� ������  1   2    3
while copy(str,1,15)<>'               ' do  begin
p1:=p1+1;
if p1>10 then break;
ReadLn(f,str);
end;


if  copy(str,1,15)<>'               ' then begin      /// �����������
//MessageDlg('����������� ������ � ����������',mtWarning,[mbOK],0);
label5.Caption:='?????';
label6.Caption:='?????';
label7.Caption:='?????';
goto 77;
end;





while str<>''  do begin      // ������ �� ����� ������ ������   !!!!!!!!!!!!!!!!!!!!! ������ ������ ������
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;


if j>=1 then begin
maxj:=0;
for cic:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
if ch_mult[maxj]<ch_mult[cic] then maxj:=cic;   //maxj - ������ ������� � ���������� ������ ���������
setlength(frn_mult,nf,ch_mult[maxj]+3);
end
else setlength(frn_mult,nf,ch_mult[j]+3);




if pos('               ',str)<>0 then begin

for p:=1 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� 2-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //2-�� �������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� 3-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //3-�� �������
else break;
end;

frn_mult[j,ch_mult[j]]:= copy(str,cn1+1,cn2);   //������ �����
frn_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+1,cn4);    //������ �����
frn_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+1,cn6);   //������ �����


cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;


ReadLn(f,str);  // ��������� ������ ����� ���������  �     �    �  ...


if j>=1 then begin

//maxj:=0;
//for cic:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
//if ch_mult[maxj]<ch_mult[cic] then maxj:=cic;   //maxj - ������ ������� � ���������� ������ ���������
setlength(orb_mult,nf,ch_mult[maxj]+3);
end
else setlength(orb_mult,nf,ch_mult[j]+3);



for p:=1 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� 2-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //2-�� �������
else break;
end;
for p:=1 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� 3-�� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //3-�� �������
else break;
end;


orb_mult[j,ch_mult[j]]:= copy(str,cn1+1,cn2);   //������ ��� ��
orb_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+1,cn4);    //������ ��� ��
orb_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+1,cn6);   //������ ��� ��


cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ������   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if j>=1 then begin
//for cic:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
//if ch_mult[j]>ch_mult[cic] then maxj:=j;   //maxj - ������ ������� � ���������� ������ ���������
setlength(freq_mult,nf,ch_mult[maxj]+3);
end
else setlength(freq_mult,nf,ch_mult[j]+3);


if pos('Frequencies --',str)<>0   then begin


for p:=length('Frequencies --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������
else break;
end;
for p:=length('Frequencies --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������
else break;
end;

freq_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('Frequencies --'),cn2);   //������ �������
freq_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('Frequencies --'),cn4);    //������ �������
freq_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Frequencies --'),cn6);   //������ �������

end;


cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ����   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if j>=1 then begin
//for cic:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
//if ch_mult[j]>ch_mult[cic] then maxj:=j;   //maxj - ������ ������� � ���������� ������ ���������
setlength(mass_mult,nf,ch_mult[maxj]+3);
end
else setlength(mass_mult,nf,ch_mult[j]+3);


if pos('Red. masses --',str)<>0   then begin


for p:=length('Red. masses --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �����
else break;
end;
for p:=length('Red. masses --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �����
end;

mass_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('Red. masses --'),cn2);   //������ �����
mass_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('Red. masses --'),cn4);    //������ �����
mass_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Red. masses --'),cn6);   //������ �����

end;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ��������   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if j>=1 then begin
//for cic:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
//if ch_mult[j]>ch_mult[cic] then maxj:=j;   //maxj - ������ ������� � ���������� ������ ���������
setlength(fr_const_mult,nf,ch_mult[maxj]+3);
end
else setlength(fr_const_mult,nf,ch_mult[j]+3);


if pos('Frc consts  --',str)<>0   then begin


for p:=length('Frc consts  --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� ���������
else break;
end;
for p:=length('Frc consts  --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ ���������
end;

fr_const_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('Frc consts  --'),cn2);   //������ ���������
fr_const_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('Frc consts  --'),cn4);    //������ ���������
fr_const_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Frc consts  --'),cn6);   //������ ���������

end;

cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;



ReadLn(f,str);  // ��������� ������ ��������������   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if j>=1 then begin
//for cic:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
//if ch_mult[j]>ch_mult[cic] then maxj:=j;   //maxj - ������ ������� � ���������� ������ ���������
setlength(ir_inten_mult,nf,ch_mult[maxj]+3);
end
else setlength(ir_inten_mult,nf,ch_mult[j]+3);


if pos('IR Inten    --',str)<>0   then begin


for p:=length('IR Inten    --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('IR Inten    --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

ir_inten_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('IR Inten    --'),cn2);   //������ �������������
ir_inten_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('IR Inten    --'),cn4);    //������ �������������
ir_inten_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('IR Inten    --'),cn6);   //������ �������������

end;


cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;




ReadLn(f,str);  // ��������� ������ Raman Intens   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if pos('Raman',str)=0 then goto 131;

if j>=1 then begin
//for cic:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
//if ch_mult[j]>ch_mult[cic] then maxj:=j;   //maxj - ������ ������� � ���������� ������ ���������
setlength(raman_mult,nf,ch_mult[maxj]+3);
end
else setlength(raman_mult,nf,ch_mult[j]+3);


if pos('Raman Activ --',str)<>0   then begin


for p:=length('Raman Activ --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('Raman Activ --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

raman_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('Raman Activ --'),cn2);   //������ �������������
raman_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('Raman Activ --'),cn4);    //������ �������������
raman_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Raman Activ --'),cn6);   //������ �������������

end;




ReadLn(f,str);  // ���������  ������������� �   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
131:
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;




if pos('Depolar',str)=0 then goto 132;
if j>=1 then begin
setlength(depolar_p_mult,nf,ch_mult[maxj]+3);
end
else setlength(depolar_p_mult,nf,ch_mult[j]+3);



if pos('Depolar (P) --',str)<>0   then begin


for p:=length('Depolar (P) --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('Depolar (P) --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

depolar_p_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('Depolar (P) --'),cn2);   //������ ������������� �
depolar_p_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('Depolar (P) --'),cn4);    //������ ������������� �
depolar_p_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Depolar (P) --'),cn6);   //������ ������������� �

end;


ReadLn(f,str);  // ���������  ������������� U   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
132:
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;




if pos('Depolar',str)=0 then goto 133;
if j>=1 then begin
setlength(depolar_u_mult,nf,ch_mult[maxj]+3);
end
else setlength(depolar_u_mult,nf,ch_mult[j]+3);


if pos('Depolar (U) --',str)<>0   then begin


for p:=length('Depolar (U) --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('Depolar (U) --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

depolar_u_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('Depolar (U) --'),cn2);   //������ �������������
depolar_u_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('Depolar (U) --'),cn4);    //������ �������������
depolar_u_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Depolar (U) --'),cn6);   //������ �������������

end;






ReadLn(f,str);  // ���������  Dip. str.   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
133:
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
if pos('Dip. str.',str)=0 then goto 134;
if j>=1 then begin
setlength(dip_str_mult,nf,ch_mult[maxj]+3);
end
else setlength(dip_str_mult,nf,ch_mult[j]+3);


if pos('Dip. str.   --',str)<>0   then begin


for p:=length('Dip. str.   --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('Dip. str.   --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

dip_str_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('Dip. str.   --'),cn2);   //������ �������������
dip_str_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('Dip. str.   --'),cn4);    //������ �������������
dip_str_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Dip. str.   --'),cn6);   //������ �������������

end;






ReadLn(f,str);  // ���������  Rot. str.   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
134:
cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
if pos('Rot. str.',str)=0 then goto 135;
if j>=1 then begin
setlength(rot_str_mult,nf,ch_mult[maxj]+3);
end
else setlength(rot_str_mult,nf,ch_mult[j]+3);


if pos('Rot. str.   --',str)<>0   then begin


for p:=length('Rot. str.   --')+2 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1         //������� �� ������ �������������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1       //������ �������������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+p,1)=' '  then cn3:=cn3+1      //������� �� ������ �������������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1   //������ �������������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' ' then cn5:=cn5+1   //������ �� ������� �������������
else break;
end;
for p:=length('Rot. str.   --')+2 to length(str) do  begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>'') and  (copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>#13) then cn6:=cn6+1  //������ �������������
end;

rot_str_mult[j,ch_mult[j]]:= copy(str,cn1+2+length('Rot. str.   --'),cn2);   //������ �������������
rot_str_mult[j,ch_mult[j]+1]:= copy(str,cn1+cn2+cn3+2+length('Rot. str.   --'),cn4);    //������ �������������
rot_str_mult[j,ch_mult[j]+2]:= copy(str,cn1+cn2+cn3+cn4+cn5+2+length('Rot. str.   --'),cn6);   //������ �������������

end;



135:
while pos('Atom',str)=0  do
ReadLn(f,str);
if pos('Atom',str)<>0 then goto 13;




/// ������ ��������� ��������� ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
///////////////////////////////////////////////////////////////////////////////////
/// ������������ �������� �� ����������.............................................





ReadLn(f,str);  // ���� ������ ����������
13: ReadLn(f,str);


i:=0;
ch_at_mult[j]:=0;
while (copy(str,1,13)<>'             ') and (str<>'') do begin

ch_at_mult[j]:=ch_at_mult[j]+1;        // ������� ����� ������
for cic_at:=0 to j do
if max_b<ch_at_mult[cic_at] then max_b:=ch_at_mult[cic_at];    /////////////////////////////////////////////////////ghkvhuivy

{
if basket[j]=0 then begin
if j>=1 then begin

maxj_at:=0;
for cic_at:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
if ch_at_mult[maxj_at]<ch_at_mult[cic_at] then maxj_at:=cic_at;   //maxj_at - ������ ������� � ���������� ������ ������


max_b:=0;
for cic_at:=0 to j do       // cic - ������� ��� �������� ����� ������ �� ���� ���������� �������� ��� ������ ����������� ������
if max_b<basket[cic_at] then max_b:=basket[cic_at];   //maxj_at - ������ ������� � ���������� ������ ������

basket[j]:=max_b; }


if j>=1 then begin
setlength(nom_mult,nf,max_b+1);
setlength(at_nom_mult,nf,max_b+1);
setlength(dx1_mult,nf,ch_mult[maxj]+3,max_b+1);
setlength(dy1_mult,nf,ch_mult[maxj]+3,max_b+1);
setlength(dz1_mult,nf,ch_mult[maxj]+3,max_b+1);
end
else begin
setlength(nom_mult,nf,max_b+1);
setlength(at_nom_mult,nf,max_b+1);
setlength(dx1_mult,nf,ch_mult[j]+3,max_b+1);
setlength(dy1_mult,nf,ch_mult[j]+3,max_b+1);
setlength(dz1_mult,nf,ch_mult[j]+3,max_b+1);
end;











{

setlength(nom_mult,nf,ch_at_mult[maxj_at]+1);
setlength(at_nom_mult,nf,ch_at_mult[maxj_at]+1);
setlength(dx1_mult,nf,ch_mult[maxj]+3,ch_at_mult[maxj_at]+1);
setlength(dy1_mult,nf,ch_mult[maxj]+3,ch_at_mult[maxj_at]+1);
setlength(dz1_mult,nf,ch_mult[maxj]+3,ch_at_mult[maxj_at]+1);

end
else begin
setlength(nom_mult,nf,ch_at_mult[j]+1);
setlength(at_nom_mult,nf,ch_at_mult[j]+1);
setlength(dx1_mult,nf,ch_mult[j]+3,ch_at_mult[j]+1);
setlength(dy1_mult,nf,ch_mult[j]+3,ch_at_mult[j]+1);
setlength(dz1_mult,nf,ch_mult[j]+3,ch_at_mult[j]+1);
end;
end
else begin
if j=0 then begin
setlength(dx1_mult,nf,ch_mult[j]+3,basket[j]);
setlength(dy1_mult,nf,ch_mult[j]+3,basket[j]);
setlength(dz1_mult,nf,ch_mult[j]+3,basket[j]);
end
else begin
setlength(dx1_mult,nf,ch_mult[maxj]+3,basket[j]);
setlength(dy1_mult,nf,ch_mult[maxj]+3,basket[j]);
setlength(dz1_mult,nf,ch_mult[maxj]+3,basket[j]);


end;

end; }







{
if basket=0 then setlength(dx1_mult,nf,ch_mult[j]+3,ch_at_mult[j]+1)
else  setlength(dx1_mult,nf,ch_mult[j]+3,basket);
if basket=0 then setlength(dy1_mult,nf,ch_mult[j]+3,ch_at_mult[j]+1)
else  setlength(dy1_mult,nf,ch_mult[j]+3,basket);
if basket=0 then setlength(dz1_mult,nf,ch_mult[j]+3,ch_at_mult[j]+1)
else  setlength(dz1_mult,nf,ch_mult[j]+3,basket);      }



cn1:=0;
cn2:=0;
cn3:=0;
cn4:=0;
cn5:=0;
cn6:=0;
cn7:=0;
cn8:=0;
cn9:=0;
cn10:=0;
cn11:=0;
cn12:=0;
cn13:=0;
cn14:=0;
cn15:=0;
cn16:=0;
cn17:=0;
cn18:=0;
cn19:=0;
cn20:=0;
cn21:=0;
cn22:=0;




for p:=1 to length(str) do begin
if copy(str,p,1)=' ' then cn1:=cn1+1    //������� �� ����������� ������
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+p,1)<>' ' then cn2:=cn2+1    //���������� �����
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+p,1)=' ' then cn3:=cn3+1    //������� �� �������� ������ � �������
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+p,1)<>' '  then cn4:=cn4+1    //������� �����
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+p,1)=' '  then cn5:=cn5+1    //������ �� �1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+p,1)<>' ' then cn6:=cn6+1    //�1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+p,1)=' ' then cn7:=cn7+1    //������� �� Y1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+p,1)<>' ' then cn8:=cn8+1    //Y1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+p,1)=' ' then cn9:=cn9+1    //������� �� Z1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+p,1)<>' ' then cn10:=cn10+1    //Z1
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+p,1)=' ' then cn11:=cn11+1    //������� �� �2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+p,1)<>' ' then cn12:=cn12+1    //�2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+p,1)=' ' then cn13:=cn13+1    //������� �� Y2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+p,1)<>' ' then cn14:=cn14+1    //Y2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+p,1)=' ' then cn15:=cn15+1    //������� �� Z2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+p,1)<>' '  then cn16:=cn16+1    //Z2
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+p,1)=' ' then cn17:=cn17+1    //������� �� �3
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+p,1)<>' ' then cn18:=cn18+1    //�3
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+p,1)=' ' then cn19:=cn19+1    //������� �� Y3
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+p,1)<>' ' then cn20:=cn20+1    //Y3
else break;
end;
for p:=1 to length(str) do begin
if copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+p,1)=' ' then cn21:=cn21+1    //������� �� Z3
else break;
end;
for p:=1 to length(str) do begin
if (copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>' ') and (copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>'') and (copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+p,1)<>#13)  then cn22:=cn22+1    //Z3
else break;
end;


nom_mult[j,i]:=copy(str,cn1+1,cn2);       //  ���������� �����
at_nom_mult[j,i]:=copy(str,cn1+cn2+cn3+1,cn4);    // ������� �����
dx1_mult[j,ch_mult[j],i]:=copy(str,cn1+cn2+cn3+cn4+cn5+1,cn6);        //�1
dy1_mult[j,ch_mult[j],i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+1,cn8);   //Y1
dz1_mult[j,ch_mult[j],i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+1,cn10);        //Z1
dx1_mult[j,ch_mult[j]+1,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+1,cn12);        //X2
dy1_mult[j,ch_mult[j]+1,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+1,cn14); //Y2
dz1_mult[j,ch_mult[j]+1,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+1,cn16);        //Z2
dx1_mult[j,ch_mult[j]+2,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+1,cn18);        //X3
dy1_mult[j,ch_mult[j]+2,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+1,cn20);  //Y3
dz1_mult[j,ch_mult[j]+2,i]:=copy(str,cn1+cn2+cn3+cn4+cn5+cn6+cn7+cn8+cn9+cn10+cn11+cn12+cn13+cn14+cn15+cn16+cn17+cn18+cn19+cn20+cn21+1,cn22);    //Z3

i:=i+1;
{if basket[j]=0 then }

{if  pos(' Atom ',str)=0 then}  ReadLn(f,str);

end;   // ����� ������ ������������ ��������



ch_mult[j]:=ch_mult[j]+3;
{basket[j]:=ch_at_mult[j]; }


 end;    // ����� ������ ������ ������

 end;    // ���� �������� �� �����

CloseFile(f);




77:




end;
end;










///////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
//////////////////�����   ��������  ����������� ListView ������
/////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////











if dial=true then begin        // ���� ������ �������� ������ �����

if length(Raman)<>0 then begin
BitBtn3.Enabled:=True;
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Items[4].Caption:='����������� �������������, �^4/�.�.';
Form24.ListView1.Columns.Items[5].Caption:='P-�������������';
Form24.ListView1.Columns.Items[6].Caption:='U-�������������';
Form24.ListView1.Columns.Items[4].Width:=150;
Form24.ListView1.Columns.Items[5].Width:=150;
Form24.ListView1.Columns.Items[6].Width:=150;
Form24.ListView1.Columns.Items[4].Alignment:=taCenter;
Form24.ListView1.Columns.Items[5].Alignment:=taCenter;
Form24.ListView1.Columns.Items[6].Alignment:=taCenter;
end;

if length(rot_str)<>0 then begin
BitBtn4.Enabled:=True;
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Items[Form24.ListView1.Columns.Count-1].Caption:='VCD, 10^-44 esu^2-cm^2';
Form24.ListView1.Columns.Items[Form24.ListView1.Columns.Count-1].Width:=150;
Form24.ListView1.Columns.Items[Form24.ListView1.Columns.Count-1].Alignment:=taCenter;
end;



if length(freq)=0 then begin
MessageDlg('����������� ������ � ����������',mtWarning,[mbOK],0);
BitBtn1.Enabled:=False;
label5.Caption:='?????';
label6.Caption:='?????';
label7.Caption:='?????';
goto 0;
end;



Combobox1.Items.Add(Form1.OpenDialog1.FileName);
Combobox1.ItemIndex:=0;

Label5.Caption:=copy(pol1,1,pos('.',pol1)+3) +'  '+copy(pol2,1,pos('.',pol2)+3)+'  '+copy(pol3,1,pos('.',pol3)+3);



s:=0;
for i:=0 to ch-1 do begin
if  freq[i]<>'' then begin
if strtofloat(freq[i])<0 then s:=s+1;
end;
end;
Label7.Caption:=inttostr(s);
Label7.Font.Color:=clBlue;
Label7.Font.Style:=[fsBold];


for i:=0 to ch-1 do begin
if frn[i]<>'' then itm:=Form24.ListView1.Items.Add;
if frn[i]<>'' then  itm.Caption:=frn[i];
if orb[i]<>'' then  itm.SubItems.Append(orb[i]);
if freq[i]<>'' then itm.SubItems.Append(freq[i]);
if ir_inten[i]<>'' then itm.SubItems.Append(ir_inten[i]);

if length(Raman)<>0 then begin
if Raman[i]<>'' then itm.SubItems.Append(Raman[i]);
end;
if length(depolar_p)<>0 then begin
if depolar_p[i]<>'' then itm.SubItems.Append(depolar_p[i]);
end;
if length(depolar_u)<>0 then begin
if depolar_u[i]<>'' then itm.SubItems.Append(depolar_u[i]);
end;
if length(rot_str)<>0 then begin
if rot_str[i]<>'' then itm.SubItems.Append(rot_str[i]);
end;

if frn[i]<>'' then  Label6.Caption:=inttostr(i+1);
end;



end




else begin    // ���� ������ �������� ���������� ������
BitBtn2.Enabled:=False;

if length(Raman_mult)<>0 then begin
BitBtn3.Enabled:=True;
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Items[4].Caption:='����������� �������������, �^4/�.�.';
Form24.ListView1.Columns.Items[5].Caption:='P-�������������';
Form24.ListView1.Columns.Items[6].Caption:='U-�������������';
Form24.ListView1.Columns.Items[4].Width:=150;
Form24.ListView1.Columns.Items[5].Width:=150;
Form24.ListView1.Columns.Items[6].Width:=150;
Form24.ListView1.Columns.Items[4].Alignment:=taCenter;
Form24.ListView1.Columns.Items[5].Alignment:=taCenter;
Form24.ListView1.Columns.Items[6].Alignment:=taCenter;
end;


if length(rot_str_mult)<>0 then begin
BitBtn4.Enabled:=True;
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Items[Form24.ListView1.Columns.Count-1].Caption:='VCD, 10^-44 esu^2*cm^2';
Form24.ListView1.Columns.Items[Form24.ListView1.Columns.Count-1].Width:=150;
Form24.ListView1.Columns.Items[Form24.ListView1.Columns.Count-1].Alignment:=taCenter;
end;






for j:=0 to nf-1 do   begin
if ch_mult[j]=0 then MessageDlg('� ����� '+ Form1.OpenDialog2.Files[j] +' ����������� ������ � ����������',mtWarning,[mbOK],0);
if ch_mult[j]<>0 then Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
end;
Combobox1.ItemIndex:=0;

////////������ ���� ��������� ���� � �����������������

basket:=nil;
k:=0;
setlength(basket,nf);
for j:=0 to nf-1 do   begin
if  ch_mult[j]<>0 then begin
basket[k]:=j;   // ����� ���������� ��������
k:=k+1;
end;
end;

{for i:=1 to length(basket)-2 do
if basket[i]=0 then FreeAndNil(basket[i]);  //������ �� ������� ������ ��������    }






if pol1_mult<>nil then Label5.Caption:=copy(pol1_mult[basket[0]],1,pos('.',pol1_mult[basket[0]])+3) +'  '+copy(pol2_mult[basket[0]],1,pos('.',pol2_mult[basket[0]])+3)+'  '+copy(pol3_mult[basket[0]],1,pos('.',pol3_mult[basket[0]])+3)
else  Label5.Caption:='???????';



if k=0 then goto 0;



s:=0;
for i:=0 to ch_mult[basket[0]]-1 do begin
if freq_mult[basket[0],i]<>'' then begin
if strtofloat(freq_mult[basket[0],i])<0 then s:=s+1;
end;
end;

Label7.Caption:=inttostr(s);
Label7.Font.Color:=clBlue;
Label7.Font.Style:=[fsBold];



for i:=0 to ch_mult[basket[0]]-1 do begin
if frn_mult[basket[0],i]<>'' then  itm:=Form24.ListView1.Items.Add;
if frn_mult<>nil then begin
if frn_mult[basket[0],i]<>'' then  itm.Caption:=frn_mult[basket[0],i];
if orb_mult[basket[0],i]<>'' then  itm.SubItems.Append(orb_mult[basket[0],i]);
if freq_mult[basket[0],i]<>'' then itm.SubItems.Append(freq_mult[basket[0],i]);
if ir_inten_mult[basket[0],i]<>'' then itm.SubItems.Append(ir_inten_mult[basket[0],i]);
if frn_mult[basket[0],i]<>'' then  Label6.Caption:=inttostr(i+1);

if length(Raman_mult)<>0 then begin
if Raman_mult[basket[0],i]<>'' then itm.SubItems.Append(Raman_mult[basket[0],i]);
end;
if length(depolar_p_mult)<>0 then begin
if depolar_p_mult[basket[0],i]<>'' then itm.SubItems.Append(depolar_p_mult[basket[0],i]);
end;
if length(depolar_u_mult)<>0 then begin
if depolar_u_mult[basket[0],i]<>'' then itm.SubItems.Append(depolar_u_mult[basket[0],i]);
end;
if length(rot_str_mult)<>0 then begin
if rot_str_mult[basket[0],i]<>'' then itm.SubItems.Append(rot_str_mult[basket[0],i]);
end;


end;
end;





end;




if  ListView1.Columns.Count> ListView1.Items[0].SubItems.Count+1 then begin
while ListView1.Columns.Count<>ListView1.Items[0].SubItems.Count+1 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);
end;


if ListView1.Items[0].SubItems.Count=4 then begin
ListView1.Columns[4].Caption:='VCD, 10^-44 esu^2*cm^2';
BitBtn3.Enabled:=False;
BitBtn4.Enabled:=True;
end;
if ListView1.Items[0].SubItems.Count=6 then begin
ListView1.Columns[4].Caption:='����������� �������������, �^4/�.�.';
ListView1.Columns[5].Caption:='P-�������������';
ListView1.Columns[6].Caption:='U-�������������';
BitBtn3.Enabled:=True;
BitBtn4.Enabled:=False;

end;
if ListView1.Items[0].SubItems.Count=7 then begin
ListView1.Columns[4].Caption:='����������� �������������, �^4/�.�.';
ListView1.Columns[5].Caption:='P-�������������';
ListView1.Columns[6].Caption:='U-�������������';
ListView1.Columns[7].Caption:='VCD, 10^-44 esu^2*cm^2';
BitBtn3.Enabled:=True;
BitBtn4.Enabled:=True;
end;

if ListView1.Items[0].SubItems.Count=3 then begin
BitBtn3.Enabled:=False;
BitBtn4.Enabled:=False;
end;

//if length(Raman)<>0 then Form24.Resize;





///////////////// ���� ���� ��� ����, ����� ��������� �������� ���� ''
if dial=true then begin

for i:=0 to length(freq) do begin
if freq[i]='' then begin
setlength(frn,i);
setlength(orb,i);
setlength(freq,i);
setlength(mass,i);
setlength(fr_const,i);
setlength(ir_inten,i);
if length(raman)<>0 then setlength(raman,i);
if length(raman)<>0 then setlength(depolar_p,i);
if length(raman)<>0 then setlength(depolar_u,i);
if length(rot_str)<>0 then setlength(rot_str,i);
break;
end;
end;

end;


//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////




if ListView1.Items.Count>=1 then BitBtn2.Enabled:=True
else BitBtn2.Enabled:=False;

if dial=true then  BitBtn2.Enabled:=True
else BitBtn2.Enabled:=False;



0: end;










procedure TForm24.FormResize(Sender: TObject);
var awidth,i: integer;
begin
Listview1.Height:=Form24.Height-295;
Listview1.Left:=10;
Listview1.Width:=Form24.Width-36;
Combobox1.Top:=ListView1.Top+Listview1.Height+8;
Combobox1.Left:=Listview1.Left;
Label1.Top:=Combobox1.Top+3;
Label1.Left:=Form24.Width- Label1.Width-(Form24.Width-ListView1.Width-ListView1.Left)-5;
Combobox1.Width:= Form24.Width-Combobox1.Left- (Form24.Width-ListView1.Width-ListView1.Left)- Label1.Width-10;
GroupBox1.Left:=Listview1.Left;
GroupBox1.Top:=Combobox1.Top+Combobox1.Height+7;
//Label4.Top:=Combobox1.Top+Combobox1.Height+12;
//Label4.Left:=Listview1.Left;
//Label5.Top:=Combobox1.Top+Combobox1.Height+12;
//Label2.Top:=Label4.Top+Label4.Height+3;
//Label2.Left:=Listview1.Left;
//Label6.Top:=Label4.Top+Label4.Height+3;
//Label3.Top:=Label2.Top+Label2.Height+3;
//Label3.Left:=Listview1.Left;
//Label7.Top:=Label2.Top+Label2.Height+3;
GroupBox1.Width:= Form24.Width-2*BitBtn2.Left-188;
BitBtn1.Top:=GroupBox1.Top+7;
BitBtn3.Top:=BitBtn1.Top+BitBtn1.Height+2;
BitBtn4.Top:=BitBtn3.Top+BitBtn3.Height+2;
BitBtn1.Left:= GroupBox1.Left+GroupBox1.Width+5;
BitBtn3.Left:= BitBtn1.Left;
BitBtn4.Left:= BitBtn1.Left;
BitBtn1.Width:=162;
BitBtn3.Width:=162;
BitBtn4.Width:=162;
BitBtn2.Left:= GroupBox1.Left;
BitBtn2.Top:=GroupBox1.Top+GroupBox1.Height+5;
TrackBar1.Width:=Form24.Width-2*BitBtn2.Left-153;
TrackBar2.Width:=TrackBar1.Width;
TrackBar1.Top:=BitBtn2.Top+5;
TrackBar1.Left:=BitBtn2.Left+BitBtn2.Width+5;
TrackBar2.Top:=TrackBar1.Top+TrackBar1.Height+10;
TrackBar2.Left:=TrackBar1.Left;
Label8.Top:=TrackBar1.Top;
Label9.Top:=TrackBar2.Top;
Label8.Left:=TrackBar1.Left+TrackBar1.Width+3;
Label9.Left:=TrackBar2.Left+TrackBar2.Width+3;


{

awidth:=0;
for i:=0 to ListView1.Columns.Count-1 do
awidth:=awidth+ ListView1.Columns[i].Width;

for i:=0 to ListView1.Columns.Count-1 do
ListView1.Columns[i].Width:=Round(ListView1.Columns[i].Width / awidth);

}

{
if length(Raman)=0 then begin
ListView1.Columns[0].Width:=Round( ListView1.Columns[0].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width)*ListView1.Width);
ListView1.Columns[1].Width:=Round( ListView1.Columns[1].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width)*ListView1.Width);
ListView1.Columns[2].Width:=Round( ListView1.Columns[2].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width)*ListView1.Width);
ListView1.Columns[3].Width:=Round( ListView1.Columns[3].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width)*ListView1.Width);
end
else begin
ListView1.Columns[0].Width:=Round( ListView1.Columns[0].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width+ListView1.Columns[4].Width+ListView1.Columns[5].Width+ListView1.Columns[6].Width)*ListView1.Width);
ListView1.Columns[1].Width:=Round( ListView1.Columns[1].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width+ListView1.Columns[4].Width+ListView1.Columns[5].Width+ListView1.Columns[6].Width)*ListView1.Width);
ListView1.Columns[2].Width:=Round( ListView1.Columns[2].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width+ListView1.Columns[4].Width+ListView1.Columns[5].Width+ListView1.Columns[6].Width)*ListView1.Width);
ListView1.Columns[3].Width:=Round( ListView1.Columns[3].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width+ListView1.Columns[4].Width+ListView1.Columns[5].Width+ListView1.Columns[6].Width)*ListView1.Width);

ListView1.Columns[4].Width:=Round( ListView1.Columns[4].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width+ListView1.Columns[4].Width+ListView1.Columns[5].Width+ListView1.Columns[6].Width)*ListView1.Width);
ListView1.Columns[5].Width:=Round( ListView1.Columns[5].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width+ListView1.Columns[4].Width+ListView1.Columns[5].Width+ListView1.Columns[6].Width)*ListView1.Width);
ListView1.Columns[6].Width:=Round( ListView1.Columns[6].Width/(ListView1.Columns[0].Width+ListView1.Columns[1].Width+ListView1.Columns[2].Width+ListView1.Columns[3].Width+ListView1.Columns[4].Width+ListView1.Columns[5].Width+ListView1.Columns[6].Width)*ListView1.Width);

end;

}


end;






procedure TForm24.ComboBox1Change(Sender: TObject);
var i,j,s,kill: word;
itm: TListItem;
label 10,11;
begin



//for i:=0 to length(ch_mult)-1 do begin
//if ch_mult[i]=0 then













if dial=false then begin
ListView1.Clear;
if pol1_mult<>nil then Label5.Caption:=copy(pol1_mult[basket[Combobox1.ItemIndex]],1,pos('.',pol1_mult[basket[Combobox1.ItemIndex]])+3) +'  '+copy(pol2_mult[basket[Combobox1.ItemIndex]],1,pos('.',pol2_mult[basket[Combobox1.ItemIndex]])+3)+'  '+copy(pol3_mult[basket[Combobox1.ItemIndex]],1,pos('.',pol3_mult[basket[Combobox1.ItemIndex]])+3)
else Label5.Caption:='???????';



s:=0;
for i:=0 to ch_mult[basket[Combobox1.ItemIndex]]-1 do begin
if ch_mult[basket[Combobox1.ItemIndex]]=0 then goto 10;
if freq_mult[basket[Combobox1.ItemIndex],i]<>'' then begin
if strtofloat(freq_mult[basket[Combobox1.ItemIndex],i])<0 then s:=s+1;
end;
10: end;
Label7.Caption:=inttostr(s);
Label7.Font.Color:=clBlue;
Label7.Font.Style:=[fsBold];

for i:=0 to ch_mult[basket[Combobox1.ItemIndex]]-1 do begin

if ch_mult[basket[Combobox1.ItemIndex]]=0 then goto 11;
if frn_mult[basket[Combobox1.ItemIndex],i]<>'' then  itm:=Form24.ListView1.Items.Add;
if frn_mult<>nil then begin
if frn_mult[basket[Combobox1.ItemIndex],i]<>'' then  itm.Caption:=frn_mult[basket[Combobox1.ItemIndex],i];
if orb_mult[basket[Combobox1.ItemIndex],i]<>'' then  itm.SubItems.Append(orb_mult[basket[Combobox1.ItemIndex],i]);
if freq_mult[basket[Combobox1.ItemIndex],i]<>'' then itm.SubItems.Append(freq_mult[basket[Combobox1.ItemIndex],i]);
if ir_inten_mult[basket[Combobox1.ItemIndex],i]<>'' then itm.SubItems.Append(ir_inten_mult[basket[Combobox1.ItemIndex],i]);
if frn_mult[basket[Combobox1.ItemIndex],i]<>'' then  Label6.Caption:=inttostr(i+1);


if length(Raman_mult)<>0 then begin
while i<length(raman_mult[basket[Combobox1.ItemIndex]]) do begin
if raman_mult[basket[Combobox1.ItemIndex],i]<>'' then itm.SubItems.Append(Raman_mult[basket[Combobox1.ItemIndex],i]);
if depolar_p_mult[basket[Combobox1.ItemIndex],i]<>'' then itm.SubItems.Append(depolar_p_mult[basket[Combobox1.ItemIndex],i]);
if depolar_u_mult[basket[Combobox1.ItemIndex],i]<>'' then itm.SubItems.Append(depolar_u_mult[basket[Combobox1.ItemIndex],i]);
break;
end;
end;


if length(rot_str_mult)<>0 then begin
while i<length(rot_str_mult[basket[Combobox1.ItemIndex]]) do begin
if rot_str_mult[basket[Combobox1.ItemIndex],i]<>'' then itm.SubItems.Append(rot_str_mult[basket[Combobox1.ItemIndex],i]);
break;
end;
end;







end;



11: end;


//for i:=0 to ListView1.Columns.Count-1 do
//if ListView1.Items[0].SubItems[i]='' then ListView1.Columns.Delete(i);

//showmessage(ListView1.Items[0].SubItems[0]);
//showmessage(ListView1.Items[0].SubItems[1]);
//showmessage(ListView1.Items[0].SubItems[2]);

if  ListView1.Columns.Count> ListView1.Items[0].SubItems.Count+1 then begin
while ListView1.Columns.Count<>ListView1.Items[0].SubItems.Count+1 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);
end
else begin
while ListView1.Columns.Count<>ListView1.Items[0].SubItems.Count+1 do begin
Form24.ListView1.Columns.Add;
Form24.ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=150;
Form24.ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;

if (length(raman_mult)<>0) and (ListView1.Items[0].SubItems.Count<6)  then begin
for i:=0 to length(Raman_mult[basket[Combobox1.ItemIndex]])-1 do begin
if raman_mult[basket[Combobox1.ItemIndex],0]<>'' then begin
itm:=Form24.ListView1.Items.Add;
itm.SubItems.Append(Raman_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(depolar_p_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(depolar_u_mult[basket[Combobox1.ItemIndex],i]);
end;
end;

if (length(rot_str_mult)<>0) and (ListView1.Items[0].SubItems.Count<4)  then begin
for i:=0 to length(rot_str_mult[basket[Combobox1.ItemIndex]])-1 do begin
if rot_str_mult[basket[Combobox1.ItemIndex],0]<>'' then begin
itm:=Form24.ListView1.Items.Add;
itm.SubItems.Append(rot_str_mult[basket[Combobox1.ItemIndex],i]);
end;
end;
end;


end;





end;
end;




if ListView1.Items[0].SubItems.Count=4 then begin
ListView1.Columns[4].Caption:='VCD, 10^-44 esu^2*cm^2';
BitBtn3.Enabled:=False;
BitBtn4.Enabled:=True;
end;

if ListView1.Items[0].SubItems.Count=6 then begin
ListView1.Columns[4].Caption:='����������� �������������, �^4/�.�.';
ListView1.Columns[5].Caption:='P-�������������';
ListView1.Columns[6].Caption:='U-�������������';
BitBtn3.Enabled:=True;
BitBtn4.Enabled:=False;

end;
if ListView1.Items[0].SubItems.Count=7 then begin
ListView1.Columns[4].Caption:='����������� �������������, �^4/�.�.';
ListView1.Columns[5].Caption:='P-�������������';
ListView1.Columns[6].Caption:='U-�������������';
ListView1.Columns[7].Caption:='VCD, 10^-44 esu^2*cm^2';
BitBtn3.Enabled:=True;
BitBtn4.Enabled:=True;
end;


if ListView1.Items[0].SubItems.Count=3 then begin
BitBtn3.Enabled:=False;
BitBtn4.Enabled:=False;
end;



Form25.PaintBox1.Invalidate;
Form27.PaintBox1.Invalidate;
Form28.PaintBox1.Invalidate;
Form29.PaintBox1.Invalidate;
end;


end;

procedure TForm24.BitBtn1Click(Sender: TObject);
begin
Form25.Show;
end;

procedure TForm24.BitBtn3Click(Sender: TObject);
begin
Form27.Show;
end;

procedure TForm24.BitBtn4Click(Sender: TObject);
begin
Form33.Show;
end;

procedure TForm24.N6Click(Sender: TObject);
begin
Form24.Close;
end;

procedure TForm24.N4Click(Sender: TObject);
var f: TextFile;
i,j,decimal_correct: integer;
a,probel,cap: widestring;
begin
probel:='';
for i:=0 to 100 do
probel:=probel+' ';



if SaveDialog1.Execute then begin
if  pos('.frq',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.frq';
AssignFile(f,a);
Rewrite(f);
WriteLn(f,' **************************************************************');
WriteLn(f,' *                        Frequencies                         *');
WriteLn(f,' *                        by Magellan                         *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                       PANDORA soft (c)                     *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,'');

//  #     Type       Freq, cm^-1        Int, a.m.u.     Ram, �^4/a.m.u.      P-depolar         U-depolar      VCD, 10^-44 esu^2*cm^2


WriteLn(f,' System: '+ Combobox1.Text);
WriteLn(f,' Total number of frequencies: '+ Label6.Caption);
WriteLn(f,' Number of imaginary frequencies: '+ Label7.Caption);
WriteLn(f,'');


Write(f,copy(probel,1,length(inttostr(ListView1.Items.Count))));

for i:=0 to ListView1.Columns.Count-1 do  begin
{if ListView1.Items.Count<=9 then Write(f,' ' + ListView1.Columns[i].Caption + '     ');
if (ListView1.Items.Count<=99) and (ListView1.Items.Count>9) then Write(f,'  ' + ListView1.Columns[i].Caption + '     ');
if (ListView1.Items.Count<=999) and (ListView1.Items.Count>99) then Write(f,'   ' + ListView1.Columns[i].Caption + '     ');
if (ListView1.Items.Count<=9999) and (ListView1.Items.Count>999) then Write(f,'    ' + ListView1.Columns[i].Caption + '     ');
if ListView1.Items.Count>=9999 then Write(f,'     ' + ListView1.Columns[i].Caption + '     ');}





cap:=ListView1.Columns[i].Caption;
if cap='�' then cap:='#';
if cap='���' then cap:='     Type';
if cap='�������, 1/��' then cap:='      Freq, cm^-1';
if cap='�������������, �.�.' then cap:='         Int, a.m.u.';
if cap='����������� �������������, �^4/�.�.' then cap:='     Ram, �^4/a.m.u.';
if cap='P-�������������' then cap:='      P-depolar';
if cap='U-�������������' then cap:='         U-depolar';
if cap='VCD, 10^-44 esu^2*cm^2' then cap:='     VCD, 10^-44 esu^2*cm^2';
Write(f,cap);
end;




WriteLn(f,'');


for i:=0 to ListView1.Items.Count-1 do begin

if ListView1.Items.Count<=9 then Write(f,copy(probel,1,2-length(ListView1.Items[i].Caption)));
if (ListView1.Items.Count<=99) and (ListView1.Items.Count>9) then Write(f,copy(probel,1,3-length(ListView1.Items[i].Caption)));
if (ListView1.Items.Count<=999) and (ListView1.Items.Count>99) then Write(f,copy(probel,1,4-length(ListView1.Items[i].Caption)));
if (ListView1.Items.Count<=9999) and (ListView1.Items.Count>999) then Write(f,copy(probel,1,5-length(ListView1.Items[i].Caption)));
if ListView1.Items.Count>=9999 then  Write(f,copy(probel,1,6-length(ListView1.Items[i].Caption)));
Write(f,ListView1.Items[i].Caption);
//Write(f,copy(probel,1,10-length(ListView1.Items[i].Caption)-length(ListView1.Items[i].Subitems[0])));
for j:=0 to ListView1.Columns.Count-2 do begin
//decimal_correct:=pos('.',ListView1.Items[i].Subitems[j]);
if j=0 then Write(f,copy(probel,1,7-length(ListView1.Items[i].Subitems[j])) + ListView1.Items[i].Subitems[j])
else Write(f,copy(probel,1,18-length(ListView1.Items[i].Subitems[j])) + ListView1.Items[i].Subitems[j]);
end;
WriteLn(f,'');
end;

WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,' Normal saving of frq*** file at '+Datetostr(Now));


CloseFile(f);
end;

end;

procedure TForm24.FormCreate(Sender: TObject);
begin
DecimalSeparator:='.';
AA:=1;
end;

procedure TForm24.Excel1Click(Sender: TObject);
var MSExcel: OleVariant;
Rez: HRESULT;
ClassID: TCLSID;
i,j: integer;
cap: widestring;
label 0;
begin


//��������� ���������� �� Excel �� ����������
begin
Rez := CLSIDFromProgID(PWideChar(WideString('Excel.Application')), ClassID);
if Rez <> S_OK then begin
MessageDlg('EXCEL �� ����������',mtERROR,[mbok],0);
goto 0;
end;
end;

//���� ��, �� ���� ������
MSExcel:=CreateOleObject('Excel.Application');
MSExcel.Workbooks.Add;
MSExcel.Visible:=True;

MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,1].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,3].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,4].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,5].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,6].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,7].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,8].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,1].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,3].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,4].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,5].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,6].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,7].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,8].HorizontalAlignment := xlRight;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['C:C'].ColumnWidth := 15;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['D:D'].ColumnWidth := 15;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['E:E'].ColumnWidth := 22;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['F:F'].ColumnWidth := 22;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['G:G'].ColumnWidth := 22;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['H:H'].ColumnWidth := 22;



MSExcel.Cells[1,1]:='System: '+Combobox1.Items[j];
MSExcel.Cells[2,1]:= 'Total number of frequencies: '+ Label6.Caption;
MSExcel.Cells[3,1]:='Number of imaginary frequencies: '+ Label7.Caption;



for i:=0 to ListView1.Columns.Count-1 do  begin
cap:=ListView1.Columns[i].Caption;
if cap='�' then cap:='#';
if cap='���' then cap:='Type';
if cap='�������, 1/��' then cap:='Freq, cm^-1';
if cap='�������������, �.�.' then cap:='Int, a.m.u.';
if cap='����������� �������������, �^4/�.�.' then cap:='Ram, �^4/a.m.u.';
if cap='P-�������������' then cap:='P-depolar';
if cap='U-�������������' then cap:='U-depolar';
if cap='VCD, 10^-44 esu^2*cm^2' then cap:='VCD, 10^-44 esu^2*cm^2';
MSExcel.Cells[4,i+1]:=cap;
end;


for j:=0 to ListView1.Items.Count-1 do   begin
for i:=0 to ListView1.Columns.Count-1 do  begin
if i=0 then MSExcel.Cells[j+5,i+1]:=ListView1.Items[j].Caption
else MSExcel.Cells[j+5,i+1]:=ListView1.Items[j].Subitems[i-1];
end;
end;







0: end;

procedure TForm24.N5Click(Sender: TObject);
var f: TextFile;
i,j,decimal_correct,s,k: integer;
a,probel,cap: widestring;
begin
if dial=true then N4.Click   // ���� ������ ���������� ���� ���� � ���������
else begin

probel:='';
for i:=0 to 100 do
probel:=probel+' ';

if SaveDialog1.Execute then begin
if  pos('.frq',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.frq';
AssignFile(f,a);
Rewrite(f);
WriteLn(f,' **************************************************************');
WriteLn(f,' *                        Frequencies                         *');
WriteLn(f,' *                        by Magellan                         *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                       PANDORA soft (c)                     *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,'');

//  #     Type       Freq, cm^-1        Int, a.m.u.     Ram, �^4/a.m.u.      P-depolar         U-depolar      VCD, 10^-44 esu^2*cm^2

for i:=0 to Combobox1.Items.Count-1 do  begin
//for j:=0 to ch_mult[i]-1 do  begin

WriteLn(f,' File number '+ inttostr(i+1));
WriteLn(f,' System: '+ Combobox1.Items[i]);
WriteLn(f,' Total number of frequencies: '+ inttostr(ch_mult[basket[i]]));
s:=0;
for k:=0 to ch_mult[basket[i]]-1 do begin
if freq_mult[basket[i],k]<>'' then begin
if strtofloat(freq_mult[basket[i],k])<0 then s:=s+1;
end;
end;
WriteLn(f,' Number of imaginary frequencies: '+ inttostr(s));
WriteLn(f,'');


Write(f,copy(probel,1,length(inttostr(ch_mult[basket[i]]))));

//for j:=0 to ListView1.Columns.Count-1 do  begin
{if ListView1.Items.Count<=9 then Write(f,' ' + ListView1.Columns[i].Caption + '     ');
if (ListView1.Items.Count<=99) and (ListView1.Items.Count>9) then Write(f,'  ' + ListView1.Columns[i].Caption + '     ');
if (ListView1.Items.Count<=999) and (ListView1.Items.Count>99) then Write(f,'   ' + ListView1.Columns[i].Caption + '     ');
if (ListView1.Items.Count<=9999) and (ListView1.Items.Count>999) then Write(f,'    ' + ListView1.Columns[i].Caption + '     ');
if ListView1.Items.Count>=9999 then Write(f,'     ' + ListView1.Columns[i].Caption + '     ');}







//for j:=0 to 7 do  begin
Write(f,'#');
Write(f,'     Type');
Write(f,'      Freq, cm^-1');
Write(f,'         Int, a.m.u.');
if Raman_mult<>nil then begin
if Raman_mult[basket[i]]<>nil then begin
if Raman_mult[basket[i],0]<>''  then begin
Write(f,'     Ram, �^4/a.m.u.');
end;
end;
end;
if depolar_p_mult<>nil then begin
if depolar_p_mult[basket[i]]<>nil then begin
if depolar_p_mult[basket[i],0]<>''  then begin
Write(f,'      P-depolar');
end;
end;
end;
if depolar_u_mult<>nil then begin
if depolar_u_mult[basket[i]]<>nil then begin
if depolar_u_mult[basket[i],0]<>''  then begin
Write(f,'      U-depolar');
end;
end;
end;
if rot_str_mult<>nil then begin
if rot_str_mult[basket[i]]<>nil then begin
if rot_str_mult[basket[i],0]<>''  then begin
Write(f,'     VCD, 10^-44 esu^2*cm^2');
end;
end;
end;









{
cap:=ListView1.Columns[j].Caption;
if cap='�' then cap:='#';
if cap='���' then cap:='     Type';
if cap='�������, 1/��' then cap:='      Freq, cm^-1';
if cap='�������������, �.�.' then cap:='         Int, a.m.u.';
if cap='����������� �������������, �^4/�.�.' then cap:='     Ram, �^4/a.m.u.';
if cap='P-�������������' then cap:='      P-depolar';
if cap='U-�������������' then cap:='         U-depolar';
if cap='VCD, 10^-44 esu^2*cm^2' then cap:='     VCD, 10^-44 esu^2*cm^2';
Write(f,cap);
end;
}



WriteLn(f,'');




{

for k:=0 to ch_mult[basket[j]]-1 do begin


MSExcel.Cells[j+a+6+k,1] :=frn_mult[basket[j],k];
//Write(f,copy(probel,1,10-length(ListView1.Items[i].Caption)-length(ListView1.Items[i].Subitems[0])));
for i:=1 to 7 do begin
//decimal_correct:=pos('.',ListView1.Items[i].Subitems[j]);
if i=1 then MSExcel.Cells[j+a+6+k,2] :=orb_mult[basket[j],k];
if i=2 then MSExcel.Cells[j+a+6+k,3] :=freq_mult[basket[j],k];
if i=3 then MSExcel.Cells[j+a+6+k,4] :=ir_inten_mult[basket[j],k];
cell_i:=4;
if Raman_mult<>nil then
begin
if Raman_mult[basket[j]]<>nil then begin
if Raman_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=Raman_mult[basket[j],k];
end;
end;
end;
if depolar_p_mult<>nil then begin
begin
if depolar_p_mult[basket[j]]<>nil  then begin
if depolar_p_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=depolar_p_mult[basket[j],k];
end;
end;
end;

if depolar_u_mult<>nil then begin
begin
if depolar_u_mult[basket[j]]<>nil  then begin
if depolar_u_mult[basket[j],0]<>''  then  begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=depolar_u_mult[basket[j],k];
end;
end;
end;

if rot_str_mult<>nil then begin
begin
if rot_str_mult[basket[j]]<>nil  then begin
if rot_str_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=rot_str_mult[basket[j],k];
end;
end;
end;

end;
end;

end;
end;

end;
end;





}































































for k:=0 to ch_mult[basket[i]]-1 do begin

if ch_mult[basket[i]]<=9 then Write(f,copy(probel,1,2-length(frn_mult[basket[i],k])));
if (ch_mult[basket[i]]<=99) and (ch_mult[basket[i]]>9) then Write(f,copy(probel,1,3-length(frn_mult[basket[i],k])));
if (ch_mult[basket[i]]<=999) and (ch_mult[basket[i]]>99) then Write(f,copy(probel,1,4-length(frn_mult[basket[i],k])));
if (ch_mult[basket[i]]<=9999) and (ch_mult[basket[i]]>999) then Write(f,copy(probel,1,5-length(frn_mult[basket[i],k])));
if ch_mult[basket[i]]>=9999 then  Write(f,copy(probel,1,6-length(frn_mult[basket[i],k])));
Write(f,frn_mult[basket[i],k]);
//Write(f,copy(probel,1,10-length(ListView1.Items[i].Caption)-length(ListView1.Items[i].Subitems[0])));

{
for i:=1 to 7 do begin
//decimal_correct:=pos('.',ListView1.Items[i].Subitems[j]);
if i=1 then MSExcel.Cells[j+a+6+k,2] :=orb_mult[basket[j],k];
if i=2 then MSExcel.Cells[j+a+6+k,3] :=freq_mult[basket[j],k];
if i=3 then MSExcel.Cells[j+a+6+k,4] :=ir_inten_mult[basket[j],k];
cell_i:=4;
if Raman_mult<>nil then
begin
if Raman_mult[basket[j]]<>nil then begin
if Raman_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=Raman_mult[basket[j],k];
end;
end;
end;
if depolar_p_mult<>nil then begin
begin
if depolar_p_mult[basket[j]]<>nil  then begin
if depolar_p_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=depolar_p_mult[basket[j],k];
end;
end;
end;

if depolar_u_mult<>nil then begin
begin
if depolar_u_mult[basket[j]]<>nil  then begin
if depolar_u_mult[basket[j],0]<>''  then  begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=depolar_u_mult[basket[j],k];
end;
end;
end;

if rot_str_mult<>nil then begin
begin
if rot_str_mult[basket[j]]<>nil  then begin
if rot_str_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=rot_str_mult[basket[j],k];
end;
end;
end;

}


//++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++


//for j:=1 to 7 do begin
//decimal_correct:=pos('.',ListView1.Items[i].Subitems[j]);
Write(f,copy(probel,1,7-length(orb_mult[basket[i],k])) + orb_mult[basket[i],k]);
Write(f,copy(probel,1,18-length(freq_mult[basket[i],k])) + freq_mult[basket[i],k]);
Write(f,copy(probel,1,18-length(ir_inten_mult[basket[i],k])) + ir_inten_mult[basket[i],k]);

if Raman_mult<>nil then
begin
if Raman_mult[basket[i]]<>nil then begin
if Raman_mult[basket[i],0]<>''  then begin
Write(f,copy(probel,1,18-length(Raman_mult[basket[i],k])) + Raman_mult[basket[i],k]);
end;
end;
end;
if depolar_p_mult<>nil then begin
begin
if depolar_p_mult[basket[i]]<>nil  then begin
if depolar_p_mult[basket[i],0]<>''  then begin
Write(f,copy(probel,1,18-length(depolar_p_mult[basket[i],k])) + depolar_p_mult[basket[i],k]);
end;
end;
end;

if depolar_u_mult<>nil then begin
begin
if depolar_u_mult[basket[i]]<>nil  then begin
if depolar_u_mult[basket[i],0]<>''  then  begin
Write(f,copy(probel,1,15-length(depolar_u_mult[basket[i],k])) + depolar_u_mult[basket[i],k]);
end;
end;
end;

if rot_str_mult<>nil then begin
begin
if rot_str_mult[basket[i]]<>nil  then begin
if rot_str_mult[basket[i],0]<>''  then begin
Write(f,copy(probel,1,18-length(rot_str_mult[basket[i],k])) +rot_str_mult[basket[i],k]);
end;
end;
end;
end;
end;
//end;




{

if ListView1.Columns[j].Caption='����������� �������������, �^4/�.�.' then Write(f,copy(probel,1,18-length(Raman_mult[basket[i],k])) + Raman_mult[basket[i],k]);
if ListView1.Columns[j].Caption='P-�������������' then Write(f,copy(probel,1,18-length(depolar_p_mult[basket[i],k])) + depolar_p_mult[basket[i],k]);
if ListView1.Columns[j].Caption='U-�������������' then Write(f,copy(probel,1,18-length(depolar_u_mult[basket[i],k])) + depolar_u_mult[basket[i],k]);
if ListView1.Columns[j].Caption='VCD, 10^-44 esu^2*cm^2' then Write(f,copy(probel,1,18-length(rot_str_mult[basket[i],k])) + rot_str_mult[basket[i],k]);
}
end;
WriteLn(f,'');
end;


WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
end;
WriteLn(f,' Normal saving of frq*** file at '+Datetostr(Now));


CloseFile(f);













end;

end;
end;

procedure TForm24.Excel2Click(Sender: TObject);
var MSExcel: OleVariant;
Rez: HRESULT;
ClassID: TCLSID;
i,j,k,s,a,cell_i: integer;
cap: widestring;
label 0;
begin
if dial=true then  Excel1.Click
else begin

//��������� ���������� �� Excel �� ����������
begin
Rez := CLSIDFromProgID(PWideChar(WideString('Excel.Application')), ClassID);
if Rez <> S_OK then begin
MessageDlg('EXCEL �� ����������',mtERROR,[mbok],0);
goto 0;
end;
end;

//���� ��, �� ���� ������
MSExcel:=CreateOleObject('Excel.Application');
MSExcel.Workbooks.Add;
MSExcel.Visible:=True;

MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,1].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,3].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,4].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,5].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,6].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,7].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,8].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,1].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,3].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,4].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,5].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,6].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,7].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,8].HorizontalAlignment := xlRight;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['C:C'].ColumnWidth := 15;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['D:D'].ColumnWidth := 15;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['E:E'].ColumnWidth := 22;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['F:F'].ColumnWidth := 22;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['G:G'].ColumnWidth := 22;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['H:H'].ColumnWidth := 22;


for j:=0 to Combobox1.Items.Count-1 do  begin     // ���� �� ������ - ��������� � �����

if j=0 then a:=0 else a:=a+k+6;


MSExcel.Cells[j+1+a,1]:='File # '+inttostr(j+1);
MSExcel.Cells[j+2+a,1]:='System: '+Combobox1.Items[j];
MSExcel.Cells[j+3+a,1]:= 'Total number of frequencies: '+ inttostr(ch_mult[basket[j]]);
s:=0;
for k:=0 to ch_mult[basket[j]]-1 do begin
if freq_mult[basket[j],k]<>'' then begin
if strtofloat(freq_mult[basket[j],k])<0 then s:=s+1;
end;
end;
MSExcel.Cells[j+4+a,1]:='Number of imaginary frequencies: '+ inttostr(s);








for i:=0 to 7 do  begin
if i=0 then MSExcel.Cells[j+5+a,i+1]:='#';
if i=1 then MSExcel.Cells[j+5+a,i+1]:='Type';
if i=2 then MSExcel.Cells[j+5+a,i+1]:='Freq, cm^-1';
if i=3 then MSExcel.Cells[j+5+a,i+1]:='Int, a.m.u.';
cell_i:=4;
if Raman_mult<>nil then begin
if Raman_mult[basket[j]]<>nil then begin
if Raman_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+5+a,cell_i]:='Ram, �^4/a.m.u.';
end;
end;
end;
if depolar_p_mult<>nil then begin
if depolar_p_mult[basket[j]]<>nil then begin
if depolar_p_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+5+a,cell_i]:='P-depolar';
end;
end;
end;
if depolar_u_mult<>nil then begin
if depolar_u_mult[basket[j]]<>nil then begin
if depolar_u_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+5+a,cell_i]:='U-depolar';
end;
end;
end;
if rot_str_mult<>nil then begin
if rot_str_mult[basket[j]]<>nil then begin
if rot_str_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+5+a,cell_i]:='VCD, 10^-44 esu^2*cm^2';
end;
end;
end;




end;



for k:=0 to ch_mult[basket[j]]-1 do begin


MSExcel.Cells[j+a+6+k,1] :=frn_mult[basket[j],k];
//Write(f,copy(probel,1,10-length(ListView1.Items[i].Caption)-length(ListView1.Items[i].Subitems[0])));
for i:=1 to 7 do begin
//decimal_correct:=pos('.',ListView1.Items[i].Subitems[j]);
if i=1 then MSExcel.Cells[j+a+6+k,2] :=orb_mult[basket[j],k];
if i=2 then MSExcel.Cells[j+a+6+k,3] :=freq_mult[basket[j],k];
if i=3 then MSExcel.Cells[j+a+6+k,4] :=ir_inten_mult[basket[j],k];
cell_i:=4;
if Raman_mult<>nil then
begin
if Raman_mult[basket[j]]<>nil then begin
if Raman_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=Raman_mult[basket[j],k];
end;
end;
end;
if depolar_p_mult<>nil then begin
begin
if depolar_p_mult[basket[j]]<>nil  then begin
if depolar_p_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=depolar_p_mult[basket[j],k];
end;
end;
end;

if depolar_u_mult<>nil then begin
begin
if depolar_u_mult[basket[j]]<>nil  then begin
if depolar_u_mult[basket[j],0]<>''  then  begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=depolar_u_mult[basket[j],k];
end;
end;
end;

if rot_str_mult<>nil then begin
begin
if rot_str_mult[basket[j]]<>nil  then begin
if rot_str_mult[basket[j],0]<>''  then begin
cell_i:=cell_i+1;
MSExcel.Cells[j+a+6+k,cell_i] :=rot_str_mult[basket[j],k];
end;
end;
end;

end;
end;

end;
end;

end;
end;







end;












0: end;

procedure TForm24.N7Click(Sender: TObject);
begin
Form35.Show;
end;

procedure TForm24.BitBtn2Click(Sender: TObject);
var i: integer;
begin
if Timer1.Enabled=False then begin
Timer1.Enabled:=True;
BitBtn2.Caption:='����';
end
else begin
Timer1.Enabled:=False;
BitBtn2.Caption:='�����';
dx:=nil;
dy:=nil;
dz:=nil;
for i:=1 to length(x_1)-2 do begin
x_1[i]:=strtofloat(x_draw_out[nc][i]);
y_1[i]:=strtofloat(y_draw_out[nc][i]);
z_1[i]:=strtofloat(z_draw_out[nc][i]);
end;

end;
if (Form1.OpenDialog1.FilterIndex=2) and (Form36.Showing=False) then  Form36.Show;
end;

procedure TForm24.Timer1Timer(Sender: TObject);
var i: integer;
begin
Timer1.Interval:=30;
BBB:=true;
if AA>=1 then begin
kor:=-0.01*TrackBar2.Position;
end;
if AA<=-1 then begin
kor:=0.01*TrackBar2.Position;
end;


AA:=AA+kor;
//if AA=-1 then AA:=AA+0.1;


//if (Form1.OpenDialog1.FilterIndex=2) and (Form36.Showing=False) then  Form36.Show;
if ListView1.Selected<>nil then begin

for i:=1 to nomer_atoma do begin
setlength(dx,i+1);
setlength(dy,i+1);
setlength(dz,i+1);
dx[i]:=(TrackBar1.Position/11)*AA*(strtofloat(dx1[Form24.ListView1.Selected.Index,i-1]));
dy[i]:=(TrackBar1.Position/11)*AA*(strtofloat(dy1[Form24.ListView1.Selected.Index,i-1]));
dz[i]:=(TrackBar1.Position/11)*AA*(strtofloat(dz1[Form24.ListView1.Selected.Index,i-1]));
end;
//Form36.StatusBar1.Panels[2].Text:=floattostr(AA);
Application.ProcessMessages;

Form36.PaintBox1.Repaint;

end;

end;

end.
