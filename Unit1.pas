unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Math, XPMan, ComCtrls, Gauges, Grids, Outline,
  DirOutln, ExtCtrls, ShellCtrls, OleCtrls, Chartfx3, ShellAPI;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    OpenDialog1: TOpenDialog;
    N4: TMenuItem;
    N5: TMenuItem;
    N3D1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    LOGOUT1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N3D2: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    Opt1: TMenuItem;
    Freq1: TMenuItem;
    IRC1: TMenuItem;
    NMR1: TMenuItem;
    UVVis1: TMenuItem;
    Scan1: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    Z1: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    ZXYZ1: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    Web1: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    XPManifest1: TXPManifest;
    OpenDialog2: TOpenDialog;
    StatusBar1: TStatusBar;
    N43: TMenuItem;
    N9: TMenuItem;
    ADMPBOMD1: TMenuItem;
    N44: TMenuItem;
    Z2: TMenuItem;
    XYZ1: TMenuItem;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    N45: TMenuItem;
    N46: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N3D2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Opt1Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure Freq1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure IRC1Click(Sender: TObject);
    procedure Scan1Click(Sender: TObject);
    procedure ADMPBOMD1Click(Sender: TObject);
    procedure UVVis1Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure XYZ1Click(Sender: TObject);
    procedure Z2Click(Sender: TObject);
    procedure NMR1Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
  atomout,xout,yout,zout,typeout,atomoutel: array of array of string;
  atomout_mult,xout_mult,yout_mult,zout_mult,typeout_mult,atomoutel_mult: array of array of array of string;
  nomer_atoma,nomer_cycla,nf,identificator: integer;
  dial: boolean;
  nomer_atoma_mult,nomer_cycla_mult: array of integer;
  atom_store,x,y,z,flag,bond_type,thresh1,thresh2: array of string;
  src_start,src_route,src_title,src_mult,src_geom: array of widestring;    //���������� ��� ������ ���������� ������ ��� ����������
  src_start_mult,src_route_mult,src_title_mult,src_mult_mult,src_geom_mult: array of array of widestring;
  pb: TGauge;
  ISZ: widestring;
  IAZ: widestring;
  constrain: integer;



  //atomout,xout,yout,zout,typeout - ����, ���������� � ��� �� ������������ Out-�����
  //atomout_mult,xout_mult,yout_mult,zout_mult,typeout_mult - ����������, �� ��� ������ ������ ���������� ������
  //nomer_atoma - ����� ����� � ����������� ���������� � out-�����
  //nomer_cycla - ����� ����� �����������
  //nf - ����� ����� ��� ������ ���������� ������
  //dial - �������� ����� ��� ������� ������ - ���� ���� ��� ��������� ������

implementation

uses Unit2,
 Unit3, Unit4, Unit6, Unit9, Unit10, Unit11, Unit12, Unit14, Unit15, Unit18,
 Unit19, Unit24, Unit36, Unit37, Unit39, Unit43, Unit44, Unit49, Unit52, Unit58,
 Unit64,Unit70, Unit72, Unit73;

{$R *.dfm}
{$MAXSTACKSIZE 1048576000}




procedure TForm1.N2Click(Sender: TObject);
var f,t: TextFile;
res,res1,res2,Nprop,ish_geom_ne: Boolean;
r23,r23rel,ma1,ma2,ma3,ma4,ma5,ma6,ma7,ma8,ma9,ma10,ma11,ma12,ma13,ma14,ma15,mx,my,mz,ma16,ma17,ma18,ma19,ma20,rabx_dis,rabx_ang,mem,ma6_1,ma6_2,ma1_con,Det,ma41,Detx,Det_1,Det_2: extended;
str,str1,probel: widestring;
xc,yc,zc,x_x,y_y,z_z,x4_4,y4_4,z4_4,x_int,y_int,z_int,xf,yf,zf,x4_4_4,y4_4_4,z4_4_4,x_intf,y_intf,z_intf,zflag: array of string;
cart: array[1..10] of string;
atom: array of array of string;
variab_z: array of array of string;
variabl,value: array of string;
i,j,l,k,xi,yi,zi,x1,y1,z1,nomer_a,nomer_variabl,i1,j1,i2,j2,i3,j3,i4,j4,i5,j5,i6,j6,i7,j7,r,p,p_pr,verif1,verif2,verif3,verif4,iter,iter_criet,p1,tret,a,b,c,d,razryd,s,per,rez,verif5,nomer_z,ver,nomer_atoma_max,nomer_cycla_max,Nstr,Nvar,Nx,Px,Cx,siz: integer;
rab: array of array of real;
krit2: array of integer;
cn,id: array[0..14] of integer;
InpStd: string;
IIN,IST,IZM: boolean;
IINc,ISTc,IZMc: integer;


label 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,100,111,112,25,130,2718,1515;
begin

Form1.StatusBar1.Panels[1].Text:='';

if FileExists(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr') then
DeleteFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');


if OpenDialog1.Execute then begin

IIN:=False;
IST:=False;
IZM:=False;
src_start:=nil;
src_route:=nil;
src_title:=nil;
src_mult:=nil;
src_geom:=nil;
x_tr:=nil;
y_tr:=nil;
z_tr:=nil;
nomer_atoma:=0;
nomer_cycla:=0;
CopyFile(PChar(OpenDialog1.FileName),PChar(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr'),false);
SetFileAttributes(PChar(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr'),FILE_ATTRIBUTE_NORMAL);
OpenDialog1.FreeOnRelease;
Form43.BitBtn3.Click;
end
else goto 100;
dial:=true;
Nprop:=False;
Px:=0;
Cx:=0;

Form12.ListView1.Clear;
centr1:=nil;  // ������ XYZ
anal:=False;  // ������ XYZ
szf:=0;        // ������ XYZ
sstrings:=0;    // ������ XYZ



//if  Opendialog1.FilterIndex=1 then begin
//AssignFile(f,copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');
//Reset(f);
//while not Eof(f) do begin
//ReadLn(f,str);



//end;



pb:= TGauge.Create(Statusbar1);
pb.Visible:=False;
//////////////////////////////////////InpStd:='Standard orientation:';

25:
AssignFile(f,copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');
Reset(f);
case Opendialog1.FilterIndex of   //gjf,com-�����
1:   begin
////////////////////��������� ���������� ����������///////////////////////////////////////////////
atom_store:=nil;
x:=nil;
y:=nil;
z:=nil;
xout:=nil;
yout:=nil;
zout:=nil;
flag:=nil;
scr_x:=nil;  // ��������� ���������� ���������� �������� ��������� ��� ������ ������
scr_y:=nil;  // ��������� ���������� ���������� �������� ���������
scr_z:=nil;  // ��������� ���������� ���������� �������� ��������� (Unit36)
x_1:=nil;
y_1:=nil;
z_1:=nil;
scale_atom:=1.5;
scale_panorama:=0.05;
translatx:=0;
translaty:=0;
xinv:=0;
yinv:=0;
zinv:=0;
anglex:=0;
angley:=0;
anglez:=0;
scal:=0;
opt:=0;
ux:=0;
uy:=0;
uz:=0;
ugolx:=0;
ugoly:=0;
ugolz:=0;
trxyz:=nil;
bonds_painted:=false;
are_bonds:=nil;
Red:=nil;
Green:=nil;
Blue:=nil;
dx:=nil;
dy:=nil;
dz:=nil;
x_tr:=nil;
y_tr:=nil;
z_tr:=nil;
D1:=0;
//////////////////////////////////////////////////////////////////////////////////////////////////
while not Eof(f) do begin
ReadLn(f,str);
if (pos('%',str)<>0) and (pos('=',str)<>0) then  begin
setlength(src_start,length(src_start)+1);
src_start[length(src_start)-1]:=str;
end;
if (copy(str,1,1)='#') or (copy(str,1,2)=' #') then break;   //����� ������ #       !!!!!!!!!
end;
nomer_atoma:=1;
probel:='';
for i:=0 to 100 do
probel:=probel+' ';

setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;

ReadLn(f,str);    //� ����������� ����� ��� ������ ������ ����� ��������� � ������������

if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //���� ��������� ������ �������� ����� �������, �� ��� ������
setlength(src_route,length(src_route)+1);
src_route[length(src_route)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 1;
if (length(str)>1) or (copy(str,1,1)='#') then begin
ReadLn(f,str); //������ ���� ������ ������� ����� ���������� ������
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;   // �������� ������ � �������������� ���������� (�� 8 ����� ������������)
1:
ReadLn(f,str); //��� ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
ReadLn(f,str); //������ ��������� ������ ����� ��������� (������ ���� ������, �� ����� ���� � ������������ ���������)
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); //��������� �� ���������� ������ ��������� 2-�� ������� ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...3-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...4-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...5-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...6-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...7-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...8-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...9-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...10-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...11-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...12-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...13-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
if copy(str,1,length(str))=copy(probel,1,length(str)) then goto 2;
if length(str)>1 then begin ReadLn(f,str); // ...14-�� ������ ���������
setlength(src_title,length(src_title)+1);
src_title[length(src_title)-1]:=str;
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
end;
end;
end;    //����� �������� ��������� ������
2:
ReadLn(f,str);  //������ ������ ��������������� � ������, �� ��������� ������ �������� ������ ���������
setlength(src_mult,length(src_mult)+1);
src_mult[length(src_mult)-1]:=str;

Px:=1;
if Nprop=False then begin
//���������� ������ ������������� ������� � ������� ������� ��� ���������� Gauge
Nstr:=0;
Nvar:=1;
while not Eof(f) do  begin
Readln(f,str);
if (str<>'') and (str<>Copy(probel,1,Length(str))) and (Pos('VARIAB',UpperCase(str))=0) and (Pos('CONST',UpperCase(str))=0) then Nstr:=Nstr+1
else Break;
end;
Readln(f,str);
if (str='') or (str=Copy(probel,1,Length(str))) then begin
NVar:=3;
Px:=0;
NProp:=true;
CloseFile(f);
goto 25;
end;

for i:=1 to 4 do  //���� ����� ��������� ������ connectivity
cn[i]:=0;
for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //���� ��� 1-�� ����������
else break;
end;
cart[1]:= copy(str,cn[1]+1,cn[2]);      //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);     //���� ��� ������ ����������
if (Pos('.',cart[1])=0) and (Pos('.',cart[2])=0) then   begin
NVar:=3;
Px:=0;
NProp:=true;
CloseFile(f);
goto 25;
end




else begin
while not Eof(f) do  begin
Readln(f,str);
if (str<>'') and (str<>Copy(probel,1,Length(str))) and (Pos('VARIAB',UpperCase(str))=0) and (Pos('CONST',UpperCase(str))=0) then NVar:=NVar+1
else Break;
end;

Readln(f,str);

for i:=1 to 4 do  //���� ����� ��������� ������ connectivity
cn[i]:=0;
for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //���� ��� 1-�� ����������
else break;
end;
cart[1]:= copy(str,cn[1]+1,cn[2]);      //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);     //���� ��� ������ ����������
if (Pos('.',cart[1])=0) and (Pos('.',cart[2])=0) then   begin
NProp:=true;
CloseFile(f);
goto 25;
end;





if (str<>'') or (str<>Copy(probel,1,Length(str))) then begin;
while not Eof(f) do  begin
Readln(f,str);
if (str<>'') and (str<>Copy(probel,1,Length(str))) and (Pos('VARIAB',UpperCase(str))=0) and (Pos('CONST',UpperCase(str))=0) then NVar:=NVar+1
else Break;
end;
end;
NProp:=true;
CloseFile(f);
goto 25;
end;
end;




ReadLn(f,str);  //�������� �� Z-������� ��� ���������� ����������
str1:=str;      //str1 - ������ ������, �� ��� �������� Z-������� �� ���������� ���������

identificator:=0;

////////////////////////////////������ ��������� ���������� ���������////////////////////////////////////////////////////

20:

Application.ProcessMessages;
s:=0;
for p:=1 to length(str1) do
if (copy(str1,p,1)=' ') or  (copy(str1,p,1)=',')  then s:=s+1;

if (length(str1)-s>6) or (pos('.',str1)<>0) then begin   //����� ���� � ����������� ������������ � �������� � ���� ��������
id[1]:=3;
identificator:=1;
while (str<>'') and (str<>copy(probel,1,length(str))) and (pos('VARIAB',WideUpperCase(str))=0) and (pos('CONST',WideUpperCase(str))=0) do begin


///////////////////////////////�������� ���������� ��������� �� ������� ����������///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
for i:=1 to 10 do
cn[i]:=0;

for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //���� ��� 1-�� ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //2-��
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=',') then cn[9]:=cn[9]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>',') then cn[10]:=cn[10]+1
else break;
end;
cart[1]:= copy(str,cn[1]+1,cn[2]);      //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);     //���� ��� ������ ����������
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);     //������ ��� ������ ����������
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);   //������ ��� ������ ����������
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]);  //������ ���������� ��� �����

///*********************************************************************************************
setlength(atom_store,nomer_atoma+2);   //������������ ������
setlength(x,nomer_atoma+2);
setlength(y,nomer_atoma+2);
setlength(z,nomer_atoma+2);
setlength(flag,nomer_atoma+2);
///*********************************************************************************************




for p:=1 to nomer_atoma do begin
if (cart[2]=atom_store[p]) or (cart[3]=atom_store[p]) or (cart[4]=atom_store[p]) then  begin
identificator:=3;
nomer_atoma:=nomer_atoma+1;
nomer_a:=nomer_atoma-1;
id[1]:=3;
goto 3;
end;
if (verif4<>0) and (length(cart[4])=length(inttostr(verif4)))  then begin
identificator:=3;
nomer_atoma:=nomer_atoma+1;
nomer_a:=nomer_atoma-1;
id[1]:=3;
goto 3;
end;
end;



atom_store[nomer_atoma]:=cart[1];       //�������

flag[nomer_atoma]:=cart[2];                 //����
TryStrToInt(flag[nomer_atoma],verif5);
if pos('.',flag[nomer_atoma])<>0 then flag[nomer_atoma]:='';
if (pos('.',flag[nomer_atoma])=0)  then begin
if (verif5=0) and  (inttostr(verif5)<>flag[nomer_atoma]) then flag[nomer_atoma]:='';
end;








if flag[nomer_atoma]='' then x[nomer_atoma]:=cart[2]     //���������� �
else x[nomer_atoma]:=cart[3];


if copy(x[nomer_atoma],1,1)='.' then x[nomer_atoma]:='0'+x[nomer_atoma];
if copy(x[nomer_atoma],1,2)='-.' then x[nomer_atoma]:='-0'+copy(x[nomer_atoma],2,length(x[nomer_atoma]));


if flag[nomer_atoma]='' then y[nomer_atoma]:=cart[3]     //���������� Y
else y[nomer_atoma]:=cart[4];

if copy(y[nomer_atoma],1,1)='.' then y[nomer_atoma]:='0'+y[nomer_atoma];
if copy(y[nomer_atoma],1,2)='-.' then y[nomer_atoma]:='-0'+copy(y[nomer_atoma],2,length(y[nomer_atoma]));

if flag[nomer_atoma]='' then z[nomer_atoma]:=cart[4]     //���������� Z
else z[nomer_atoma]:=cart[5];

if copy(z[nomer_atoma],1,1)='.' then z[nomer_atoma]:='0'+z[nomer_atoma];
if copy(z[nomer_atoma],1,2)='-.' then z[nomer_atoma]:='-0'+copy(z[nomer_atoma],2,length(z[nomer_atoma]));


ReadLn(f,str);
nomer_atoma:=nomer_atoma+1;


with pb do begin
Application.ProcessMessages;
Statusbar1.Panels[0].Text:='Reading Cartesian';
Parent:= Statusbar1;
pb.BackColor:=clBtnFace;
pb.ForeColor:=RGB(0,220,50);
 pb.Progress:=round((nomer_atoma/NStr)*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := StatusBar1.Panels[0].Width+1;
   Height:= StatusBar1.Height - Top-4;
   Width:= StatusBar1.Panels[1].Width-3;
   pb.Visible:=True;
end;

end;   ///////////////////





if (str=copy(probel,1,length(str))) or (cart[2]='') or (cart[3]='') or (pos('VARIAB',WideUpperCase(str))<>0) or (pos('CONST',WideUpperCase(str))<>0) then begin
ReadLn(f,str);

////////////////////////////////////////////////////////////////////
///����� ������ ����� ���� Link1 ��� ������� Connectivity

for i:=1 to 10 do
cn[i]:=0;

for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //1-�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //2 �������
else break;
end;

cart[1]:= copy(str,cn[1]+1,cn[2]);   //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //���� ��� ������ ����������

if (pos('.',cart[1])=0) and (pos('.',cart[2])=0) then begin
if pos('=',str)=0 then goto  22;
end;

///////////////////////////////////////////////////////////////////

if (str<>copy(probel,1,length(str))) and (str<>'')  then begin// �������� ��������� ���������� � ��������� � ��������������� �������
nomer_variabl:=0; //��� ����� ���������� � ������ ���������� � ��������
21: for i:=0 to 20 do // ���� ������� �� ������ �������
if copy(str,i,1)<>' ' then break;
for j:=0 to 20 do // ���� ������� ����� ���������� (���������)
if (copy(str,i+j,1)=' ') or (copy(str,i+j,1)=',') or (copy(str,i+j,1)='=') then break;
if i>0 then r:=0 else r:=1;

//////////////////////////������������ ������///////////////////////////////
SetLength(variabl,nomer_variabl+2);
SetLength(value,nomer_variabl+2);
////////////////////////////////////////////////////////////////////////////

variabl[nomer_variabl]:=copy(str,i,j-r); //1-�� ����������
for i1:=0 to 40 do // ���� ������� ����� ����������� ����� ������ ���������� � ���������
if (copy(str,i+j+i1,1)<>' ') and (copy(str,i+j+i1,1)<>',') and (copy(str,i+j+i1,1)<>'=') then break;
value[nomer_variabl]:=copy(str,i+j+i1,14); // ������� �������� ����� �� ����� ����������� (����. -210.0234523)
if pos(' ',value[nomer_variabl])<>0 then  value[nomer_variabl]:=copy(value[nomer_variabl],1,pos(' ',value[nomer_variabl])-1);
nomer_variabl:=nomer_variabl+1;
ReadLn(f,str);  //������ ��������� ������
if (str<>'') and (str<>copy(probel,1,length(probel))) and (pos('.',str)<>0) then goto 21;


end;
ReadLn(f,str);

for i:=1 to 10 do
cn[i]:=0;

for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //1-�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //2 �������
else break;
end;

cart[1]:= copy(str,cn[1]+1,cn[2]);   //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //���� ��� ������ ����������

if (pos('.',cart[1])<>0) or (pos('.',cart[2])<>0) or (pos('=',str)<>0) then goto 5;
//end;    //����� ������ ���������� �� ������ ���������� � ��������




22:
Application.ProcessMessages;
SetLength(value,nomer_variabl+2);
SetLength(variabl,nomer_variabl+2);
for i:=0 to nomer_atoma do  begin   //����� ����������� ����������� � �������� �� ������ ���������� � ��������
id[3]:=5;
for j:=0 to nomer_variabl do  begin
if (x[i]=variabl[j]) and (pos('-',x[i])=0) then x[i]:=value[j];
if (x[i]=variabl[j]) and (pos('-',x[i])<>0) then x[i]:=floattostr(strtofloat(value[j])*(-1));
if (y[i]=variabl[j]) and (pos('-',y[i])=0) then y[i]:=value[j];
if (y[i]=variabl[j]) and (pos('-',y[i])<>0) then y[i]:=floattostr(strtofloat(value[j])*(-1));
if (z[i]=variabl[j]) and (pos('-',z[i])=0) then z[i]:=value[j];
if (z[i]=variabl[j]) and (pos('-',z[i])<>0) then z[i]:=floattostr(strtofloat(value[j])*(-1));
end;
end;


for i:=0 to nomer_atoma-1 do  begin
if copy(x[i],1,1)='.' then x[i]:='0'+x[i];
if copy(y[i],1,1)='.' then y[i]:='0'+y[i];
if copy(z[i],1,1)='.' then z[i]:='0'+z[i];
if copy(x[i],1,2)='-.' then x[i]:='-0'+copy(x[i],2,length(x[i]));
if copy(y[i],1,2)='-.' then y[i]:='-0'+copy(y[i],2,length(y[i]));
if copy(z[i],1,2)='-.' then z[i]:='-0'+copy(z[i],2,length(z[i]));
if (x[i]<>'') and (pos('.',x[i])<>0) then x[i]:=x[i]+'000000000000';
if (y[i]<>'') and (pos('.',y[i])<>0) then y[i]:=y[i]+'000000000000';
if (z[i]<>'') and (pos('.',z[i])<>0) then z[i]:=z[i]+'000000000000';
end;




if id[2]=4 then goto 5
else goto 0;








end;










////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{
for i:=1 to 100  do              // ���������� ������� �������� �� ��������� ���������
if copy(str,i,1)<>' ' then break;     //i - ������� � ������, � ������� ���������� ������� �����
for j:=0 to 40 do    //���� ��� ������������� ������ ������ �������� (�� ����� ���� ������� �������� � ��������. �������)
if (copy(str,i+j,1)=' ') or (copy(str,i+j,1)=',') then break;
atom_store[nomer_atoma]:=copy(str,i,j); //1-�� ������� ����� � ��������, �������� �1 ��� ��� ������� (Si, As, P � �.�.)

for k:=1 to 100 do
if (copy(str,i+j+k,1)<>' ') and (copy(str,i+j+k,1)<>',') then break; //����� ��������� ������� ����������� ����� ������� ��������

for a:=1 to 10 do
if (copy(str,i+j+k+a,1)=' ') or (copy(str,i+j+k+a,1)=',') then break;    //����� ������ ����������� ����� ����� (�������� �� �������������)

flag[nomer_atoma]:= copy(str,i+j+k,a);
TryStrToInt(flag[nomer_atoma],verif5);
if pos('.',flag[nomer_atoma])<>0 then flag[nomer_atoma]:='';

if (pos('.',flag[nomer_atoma])=0)  then begin
if (verif5=0) and  (inttostr(verif5)<>flag[nomer_atoma]) then flag[nomer_atoma]:='';
end;

//��������!! ���� ���������� ������ �����������, �� ����� � �� ���� ����� (� ����� ����� �� �����)











////////////////////////////////���� ��� ONIOM � MM/////////////////////////////////////////////////////
b:=0;
for a:=1 to length(str) do  begin
if copy(str,a,1)='.' then begin
b:=b+1;
verif[b]:=a;
end;
end;
////////////////////////////////////////////////////////////////////////////////////////////////////////




if b=3 then begin
xi:=pos('.',str); //����� ������� ���������� ����� � ���������e x
yi:=xi+pos('.',copy(str,xi+1,length(str)));  //����� ������� ���������� ����� � ���������e y
zi:=yi+pos('.',copy(str,yi+1,length(str)));  //����� ������� ���������� ����� � ���������e z
end
else begin
xi:=verif[2];
yi:=verif[3];
zi:=verif[4];
end;
x1:=pos(',',copy(str,xi,length(str)))-2;  //����� ������ ����� ����� � �-��� ����������
y1:=pos(',',copy(str,yi,length(str)))-2;  //����� ������ ����� ����� � �-��� ����������
z1:=pos(' ',copy(str,zi,length(str)))-2;  //����� ������ ����� ����� � z-��� ����������
if z1<0 then  z1:=pos(',',copy(str,zi,length(str)))-2;
if z1<0 then  z1:=20;
if x1<0 then  x1:=pos(' ',copy(str,xi,length(str)))-2;  //����� ������ ����� ����� � �-��� ����������
if y1<0 then  y1:=pos(' ',copy(str,yi,length(str)))-2;  //����� ������ ����� ����� � �-��� ����������



                                  //����� ������ ����� ����� � z-��� ���������� �� ������� ����������� - ��� ���������� ���������
for i:=1 to 6 do                        //�������� ����� ������ �� ����� (�������� �������� 6 ������)
if (copy(str,xi-i,1)=' ') or (copy(str,xi-i,1)=',') then  break;      //xi-i - ������� ������ �����, � ����� ����� (i-1 + 1 + x1) ��������                                        // 1 - ���� �����, �� ���� ���������, ���������� � ������� ������������
x[nomer_atoma]:=copy(str,xi-i+1,i-1+1+x1)+'000000000000';        //���������� � ��� ������� �����
for i:=1 to 6 do
if (copy(str,yi-i,1)=' ') or (copy(str,yi-i,1)=',') then  break;
y[nomer_atoma]:=copy(str,yi-i+1,i-1+1+y1)+'000000000000';        //���������� Y ��� ������� �����
for i:=1 to 6 do
if (copy(str,zi-i,1)=' ') or (copy(str,zi-i,1)=',') then break;
z[nomer_atoma]:=copy(str,zi-i+1,i-1+1+z1)+'000000000000';       //���������� Z ��� ������� �����
//showmessage(str);
ReadLn(f,str);  //��������� ����� ������!!!!!!!!!!!!!!!!
}
///////////////////////////////////////////////////////////////////////////////����� ��������� ������


{
if (str<>'') and (str<>copy(probel,1,length(str))) then begin
for i:=1 to 10 do
cn[i]:=0;



for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //���� ��� 1-�� ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //2-��
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=',') then cn[9]:=cn[9]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>',') then cn[10]:=cn[10]+1
else break;
end;

//for i:=1 to 10 do
//cn[i]:=0;


cart[1]:= copy(str,cn[1]+1,cn[2]);
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]);
TryStrToInt(cart[2],verif2);
TryStrToInt(cart[3],verif3);
TryStrToInt(cart[4],verif4);
}


{
for p:=1 to nomer_atoma do begin
if (cart[2]=atom_store[p]) or (cart[3]=atom_store[p]) or (cart[4]=atom_store[p]) then  begin
identificator:=3;
nomer_atoma:=nomer_atoma+1;
nomer_a:=nomer_atoma;
goto 3;
end;
if (verif4<>0) and (length(cart[4])=length(inttostr(verif4)))  then begin
identificator:=3;
nomer_atoma:=nomer_atoma+1;
nomer_a:=nomer_atoma;
goto 3;
end
else begin
ReadLn(f,str);


for i:=1 to 10 do
cn[i]:=0;

for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //1-�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //2 �������
else break;
end;

cart[1]:= copy(str,cn[1]+1,cn[2]);   //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //���� ��� ������ ����������


for p:=1 to nomer_atoma do begin
if  (variab_z[p][1]<>'') and (variab_z[p][2]<>'') and (variab_z[p][3]<>'') then begin
if (pos('.',cart[1])<>0) or (pos('.',cart[2])<>0) or (pos('=',str)<>0) then begin
if (variab_z[p][1]=copy(cart[1],1,length(variab_z[p][1]))) or (variab_z[p][2]=copy(cart[1],1,length(variab_z[p][1])))  or (variab_z[p][3]=copy(cart[1],1,length(variab_z[p][1])))  then goto 5;
end;
end
end;
if id=4 then goto 5
else goto 0;

end;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///if copy(str,1,length(str))=copy(probel,1,length(str)) then break;






end;   //����� �������� � ����������� ������������

///////////////////////////////����� ��������� ���������� ���������////////////////////////////////////////////////////////////

//////////////////////////////������ ��������� Z-�������///////////////////////////////////////////////////////////////////////

if pos('.',str1)=0 then begin   //����� ���� � Z-�������� � �������� � ��� ��������
identificator:=2;
3:
Application.ProcessMessages;
///////////////////////������������� ����� ����������///////////////////////////////
SetLength(atom,nomer_atoma+2,5);
SetLength(variab_z,nomer_atoma+2,5);
SetLength(zflag,nomer_atoma+2);
///////////////////////////////////////////////////////////////////////////////////
if (id[1]=3) and (id[2]<>4) then nomer_atoma:=nomer_atoma-1;
if (id[1]=3) and (id[2]=4) and (atom[nomer_atoma][1]='') and (atom[nomer_atoma-1][1]='') then nomer_atoma:=nomer_atoma-1;
for i:=1 to 100  do              // ���������� ������� �������� �� ��������� ������� � �� ����������
if copy(str,i,1)<>' ' then break;     //i - ������� � ������, � ������� ���������� �������
for j:=0 to 5 do    //���� ��� ������������� ������ ������ ��������
if (copy(str,i+j,1)=' ') or (copy(str,i+j,1)=',') then break;
atom[nomer_atoma][1]:=copy(str,i,j); //1-�� ������� ����� � ��������, �������� �1 ��� ��� �������
if nomer_atoma=1 then goto  4;
for i1:=0 to 30 do
if (copy(str,i+j+i1,1)<>' ') and (copy(str,i+j+i1,1)<>',') then break; //i+j+i1 - ������� ����� ����������� ����� 1-�� ������� ������� � ������
for j1:=0 to 5 do
if (copy(str,i+j+i1+j1,1)=' ') or (copy(str,i+j+i1+j1,1)=',') then break; //i+j+i1+j1 - ������� 2-�� ����� � ������ �������
atom[nomer_atoma][2]:=copy(str,i+j+i1,j1);      //2-�� ���� � ������
for i2:=0 to 30 do
if (copy(str,i+j+i1+j1+i2,1)<>' ') and (copy(str,i+j+i1+j1+i2,1)<>',') then break; //i+j+i1+j1+i2 - ������� ����� ����������� ����� 2-�� ������� ������� � ������ ����������
for j2:=0 to 20 do  //��� ���������� (���������� ����������) ����� ���� ����� �����, ������� 20 ������ ����������
if (copy(str,i+j+i1+j1+i2+j2,1)=' ') or (copy(str,i+j+i1+j1+i2+j2,1)=',') then break;
variab_z[nomer_atoma][1]:=copy(str,i+j+i1+j1+i2,j2);     //���������� � �������
if nomer_atoma=2 then goto  4;
for i3:=0 to 30 do
if (copy(str,i+j+i1+j1+i2+j2+i3,1)<>' ') and (copy(str,i+j+i1+j1+i2+j2+i3,1)<>',') then break; //i+j+i1+j1+i2+j2+i3 - ������� ����� ����������� ����� ������ ���������� � 3-�� ������� �������
for j3:=0 to 5 do
if (copy(str,i+j+i1+j1+i2+j2+i3+j3,1)=' ') or (copy(str,i+j+i1+j1+i2+j2+i3+j3,1)=',') then break; //i+j+i1+j1+i2+j2+i3+j3 - ������� 3 ����� � ������ �������
atom[nomer_atoma][3]:=copy(str,i+j+i1+j1+i2+j2+i3,j3);  //3-�� ���� � ������
for i4:=0 to 30 do
if (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4,1)<>' ') and (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4,1)<>',') then break; //i+j+i1+j1+i2+j2+i3+j3+i4 - ������� ����� ����������� ����� 3-�� ������� ������� � ������ ����������
for j4:=0 to 30 do  //��� ���������� (��������� ����) ����� ���� ����� �����, ������� 20 ������ ����������
if (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4,1)=' ') or (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4,1)=',') then break;
variab_z[nomer_atoma][2]:=copy(str,i+j+i1+j1+i2+j2+i3+j3+i4,j4);     //��������� ���� � �������
if nomer_atoma=3 then goto  4;
for i5:=0 to 30 do
if (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5,1)<>' ') and (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5,1)<>',') then break; //i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5 - ������� ����� ����������� ����� ������ ���������� � 4-�� ������� �������
for j5:=0 to 5 do
if (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5,1)=' ') or (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5,1)=',') then break; //i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5 - ������� 4 ����� � ������ �������
atom[nomer_atoma][4]:=copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5,j5);  //4-�� ���� � ������
for i6:=0 to 30 do
if (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6,1)<>' ') and (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6,1)<>',') then break; //i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6 - ������� ����� ����������� ����� 4-�� ������� ������� � ������� ����������
for j6:=0 to 30 do  //��� ���������� (���������� ����) ����� ���� ����� �����, ������� 20 ������ ����������
if (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6,1)=' ') or (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6,1)=',') then break;
variab_z[nomer_atoma][3]:=copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6,j6);     //���������� ���� � �������
for i7:=0 to 30 do
if (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6+i7,1)<>' ') and (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6+i7,1)<>'') and (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6+i7,1)<>',') then break; // ��������� ��, ��� ����� ���������� ����
for j7:=0 to 30 do  //���� ���� ��� ���������� � ��� ����������
//showmessage(inttostr(nomer_atoma)+' ' +'"'+copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6+i7,1)+'"');
if  (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6+i7+j7,1)=' ') or (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6+i7+j7,1)='')  or (copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6+i7+j7,1)=',')  then break;
zflag[nomer_atoma]:= copy(str,i+j+i1+j1+i2+j2+i3+j3+i4+j4+i5+j5+i6+j6+i7,j7);
if (zflag[nomer_atoma]<>'0') and (zflag[nomer_atoma]<>'') then  begin    //�������������� ������� z-�������

end;








4: id[2]:=4;
Application.ProcessMessages;
ReadLn(f,str);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////���� ������ ���� ��������� ����� ������//////////////////////////////////////////
if (str<>'') and (str<>copy(probel,1,length(str))) and (pos('VARIAB',WideUpperCase(str))=0) and (pos('CONST',WideUpperCase(str))=0) then begin
for i:=1 to 10 do
cn[i]:=0;


for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //���� ��� 1-�� ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //2-��
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=',') then cn[9]:=cn[9]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>',') then cn[10]:=cn[10]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+p,1)=',') then cn[11]:=cn[11]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+p,1)<>',') then cn[12]:=cn[12]+1
else break;
end;


cart[1]:= copy(str,cn[1]+1,cn[2]);   //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //���� ��� ������ ����������   (���� 2 � �������)
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //������ ��� ������ ����������  (���������� � �������)
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // ������ ��� ������ ����������  (���� 3 � �������)
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]); //������ ���������� ��� ����� (��������� ���� � �������)
cart[6]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+1,cn[12]); //------------------  (���� 4 � �������)
TryStrToInt(cart[2],verif2);
TryStrToInt(cart[4],verif3);
TryStrToInt(cart[6],verif4);



///*********************************************************************************************
setlength(atom_store,nomer_atoma+2);   //������������ ������
setlength(x,nomer_atoma+2);
setlength(y,nomer_atoma+2);
setlength(z,nomer_atoma+2);
setlength(flag,nomer_atoma+2);
///*********************************************************************************************




for p:=1 to nomer_atoma do begin
if (cart[2]=atom[p][1]) or (cart[3]=atom[p][1]) or (cart[4]=atom[p][1]) or (cart[5]=atom[p][1]) or (cart[6]=atom[p][1]) then begin
if atom[p][1]<>'' then goto 19;
end;
if (cart[2]=atom_store[p]) or (cart[3]=atom_store[p]) or (cart[4]=atom_store[p]) then begin
if atom_store[p]<>'' then goto 19;
end;

if (verif3<>0) and (length(cart[4])=length(inttostr(verif3)))  then goto 19;
if (verif4<>0) and (length(cart[6])=length(inttostr(verif4)))  then goto 19;
if (cart[4]='') and (atom_store[p]='') then goto 19;

end;








str1:=str;
str:=str1;

nomer_atoma:=nomer_atoma+1;
rez:=nomer_atoma-1;
nomer_z:=rez;
//rez:=nomer_atoma-rez+1;
//if id=4 then goto 5;
goto 20;
end
else nomer_atoma:=nomer_atoma-1;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
19:
Application.ProcessMessages;
nomer_atoma:=nomer_atoma+1;

with pb do begin
Application.ProcessMessages;
Statusbar1.Panels[0].Text:='Reading Z-matrix';
Parent:= Statusbar1;
pb.BackColor:=clBtnFace;
pb.ForeColor:=RGB(0,220,50);
 pb.Progress:=round(nomer_atoma/(2*NStr+2*NVar)*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := StatusBar1.Panels[0].Width+1;
   Height:= StatusBar1.Height - Top-4;
   Width:= StatusBar1.Panels[1].Width-3;
   pb.Visible:=True;
end;

id[2]:=4;
if (str<>copy(probel,0,length(str))) and (pos('VARIAB',WideUpperCase(str))=0) and (pos('CONST',WideUpperCase(str))=0) then  goto 3;

ReadLn(f,str);
if (str<>copy(probel,1,length(str))) and (str<>'')  then begin// �������� ��������� ���������� � ��������� � ��������������� �������
nomer_variabl:=0; //��� ����� ���������� � ������ ���������� � ��������
5: for i:=0 to 20 do // ���� ������� �� ������ �������
if copy(str,i,1)<>' ' then break;
for j:=0 to 20 do // ���� ������� ����� ���������� (���������)
if (copy(str,i+j,1)=' ') or (copy(str,i+j,1)=',') or (copy(str,i+j,1)='=') then break;
if i>0 then r:=0 else r:=1;
SetLength(variabl,nomer_variabl+1);
SetLength(value,nomer_variabl+1);
variabl[nomer_variabl]:=copy(str,i,j-r); //1-�� ����������
for i1:=0 to 40 do // ���� ������� ����� ����������� ����� ������ ���������� � ���������
if (copy(str,i+j+i1,1)<>' ') and (copy(str,i+j+i1,1)<>',') and (copy(str,i+j+i1,1)<>'=') then break;
value[nomer_variabl]:=copy(str,i+j+i1,14); // ������� �������� ����� �� ����� ����������� (����. -210.0234523)
if pos(' ',value[nomer_variabl])<>0 then  value[nomer_variabl]:=copy(value[nomer_variabl],1,pos(' ',value[nomer_variabl])-1);
nomer_variabl:=nomer_variabl+1;

with pb do begin
Application.ProcessMessages;
Statusbar1.Panels[0].Text:='Reading Z-matrix';
Parent:= Statusbar1;
pb.BackColor:=clBtnFace;
pb.ForeColor:=RGB(0,220,50);
 pb.Progress:=Round((nomer_variabl+NStr)/(2*NStr+2*NVar)*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := StatusBar1.Panels[0].Width+1;
   Height:= StatusBar1.Height - Top-3;
   Width:= StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;



ReadLn(f,str);  //������ ��������� ������
if (str<>'') and (str<>copy(probel,1,length(probel))) and (pos('.',str)<>0) then goto 5;
ReadLn(f,str);        // ������ ������ (������ ������ ����� ����������� Variable ��� Constant)
////////////////////
///////////////////////////////////////

for i:=1 to 10 do
cn[i]:=0;

for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //1-�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //2 �������
else break;
end;

cart[1]:= copy(str,cn[1]+1,cn[2]);   //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //���� ��� ������ ����������
//////////////////////////////////////
////////////////////





if (pos('.',cart[1])<>0) or (pos('.',cart[2])<>0) or (pos('=',str)<>0) then goto 5;
end;    //����� ������ ���������� �� ������ ���������� � ��������
        //�������� ���������� Z-������� ���������� � ���������� ����������





Nx:=0;
for i:=0 to nomer_atoma do  begin
for j:=0 to nomer_variabl-1 do  begin
   //����� ����������� ����������� ����� Z-������� � �������� �� ������ ���������� � ��������


 with pb do begin
Application.ProcessMessages;
Statusbar1.Panels[0].Text:='Reading Z-matrix';
Parent:= Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
 pb.Progress:=Round((Nx+Nstr+NVar)/(2*NStr+2*NVar)*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := StatusBar1.Panels[0].Width+1;
   Height:= StatusBar1.Height - Top-3;
   Width:= StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;







SetLength(value,nomer_variabl+2);
SetLength(variab_z,nomer_atoma+2,5);
if variab_z[i][1]=variabl[j] then begin variab_z[i][1]:=value[j]; Nx:=Nx+1;  end;
if variab_z[i][2]=variabl[j] then begin variab_z[i][2]:=value[j]; Nx:=Nx+1;  end;
if (variab_z[i][3]=variabl[j]) and (pos('-',variab_z[i][3])=0) then begin variab_z[i][3]:=value[j]; Nx:=Nx+1; end;
if (copy(variab_z[i][3],2,length(variab_z[i][3])-1)=variabl[j]) and (pos('-',variab_z[i][3])<>0) then  begin variab_z[i][3]:=floattostr(strtofloat(value[j])*(-1)); Nx:=Nx+1;  end;

end;
end;


if (id[1]=3) and (id[2]=4) and (id[3]<>5) then goto  22;
////////////////��������� �����: ������� + ������/////////////////////////

if identificator=3 then  begin
for p:=1 to nomer_a-1 do
if  atom_store[p]<>'' then atom[p][1]:=atom_store[p];

for p:=1 to nomer_atoma do
if  atom[p][1]<>'' then atom_store[p]:=atom[p][1];

k:=nomer_a;
for p:=1 to k-1 do begin
if atom[k][2]=atom[p][1] then begin
i:=p;
x[i]:=x[p];
y[i]:=y[p];
z[i]:=z[p];
end;
if atom[k][3]=atom[p][1] then begin
j:=p;
x[j]:=x[p];
y[j]:=y[p];
z[j]:=z[p];
end;
if atom[k][4]=atom[p][1] then begin
l:=p;
x[l]:=x[p];
y[l]:=y[p];
z[l]:=z[p];
end;
end;

if nomer_a=2 then begin
if variab_z[2][1]<>'' then x[2]:=x[1]+'000000000000';
if variab_z[2][1]='' then  x[2]:='0.000000000000';
if variab_z[2][1]<>'' then y[2]:=y[1]+'000000000000';
if variab_z[2][1]='' then  y[2]:='0.000000000000';
if variab_z[2][1]<>'' then z[2]:=floattostr(strtofloat(variab_z[2][1])+strtofloat(z[1]));
if variab_z[2][1]='' then z[2]:='0.000000000000';
if pos('.',z[2])=0 then z[2]:=z[2]+'.000000000000'  else  z[2]:=z[2]+'000000000000';
if nomer_atoma-nomer_a=0 then goto 0;
if nomer_atoma-nomer_a=1 then  begin
if variab_z[2][1]<>'' then  begin
y[3]:=y[1];
r23:=sqrt(power(strtofloat(variab_z[3][1]),2)+power(strtofloat(variab_z[2][1]),2)-2*strtofloat(variab_z[2][1])*strtofloat(variab_z[3][1])*cos(strtofloat(variab_z[3][2])*pi/180));
if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)-power(r23,2)+power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1]))+strtofloat(z[1]));
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)+power(r23,2)-power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1]))+strtofloat(z[1]));
if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then begin
if power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)<0 then x[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]))
else x[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]));
end;
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then begin
if power(r23,2)-power(strtofloat(z[3]),2)<0 then   x[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]))
else x[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]));
end;
if pos('.',z[3])<>0 then z[3]:=z[3]+'00000000000'
else z[3]:=z[3]+'.00000000000';
identificator:=2;
goto 0;
end
else begin
y[3]:=y[1];
x[3]:=x[1];
z[3]:=floattostr(strtofloat(variab_z[3][1])+strtofloat(z[1]));
if pos('.',z[3])<>0 then z[3]:=z[3]+'00000000000'
else z[3]:=z[3]+'.00000000000';
goto 0;



end;
end;

if nomer_atoma-nomer_a=2 then  begin
if variab_z[2][1]<>'' then  begin
y[3]:=y[1];
r23:=sqrt(power(strtofloat(variab_z[3][1]),2)+power(strtofloat(variab_z[2][1]),2)-2*strtofloat(variab_z[2][1])*strtofloat(variab_z[3][1])*cos(strtofloat(variab_z[3][2])*pi/180));
if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)-power(r23,2)+power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1]))+strtofloat(z[1]));
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)+power(r23,2)-power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1]))+strtofloat(z[1]));
if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then begin
if power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)<0 then x[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]))
else x[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]));
end;
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then begin
if power(r23,2)-power(strtofloat(z[3]),2)<0 then   x[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]))
else x[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]));
end;
if pos('.',z[3])<>0 then z[3]:=z[3]+'00000000000'
else z[3]:=z[3]+'.00000000000';
identificator:=2;
goto 18;
end
else begin
y[3]:=y[1];
x[3]:=x[1];
z[3]:=floattostr(strtofloat(variab_z[3][1])+strtofloat(z[1]));
if pos('.',z[3])<>0 then z[3]:=z[3]+'00000000000'
else z[3]:=z[3]+'.00000000000';
goto 0;


end;
end;






y[3]:=y[1];
r23rel:=sqrt(power(strtofloat(x[1]),2)+power(strtofloat(y[1]),2)+power(strtofloat(z[1]),2));
r23:=sqrt(power(strtofloat(variab_z[3][1]),2)+power(strtofloat(variab_z[2][1]),2)-2*strtofloat(variab_z[2][1])*strtofloat(variab_z[3][1])*cos(strtofloat(variab_z[3][2])*pi/180));
if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)-power(r23,2)+power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1]))+strtofloat(z[1]));
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)+power(r23,2)-power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1]))+strtofloat(z[1]));
if pos('.',z[3])=0 then z[3]:=z[3]+'.000000000000'  else  z[3]:=z[3]+'000000000000';
if copy(z[3],1,1)='.' then z[3]:='0'+z[i];
if copy(z[3],1,2)='-.' then z[3]:='-0'+copy(z[3],2,length(z[3]));
if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then begin
if power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)<0 then x[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power((strtofloat(z[3])-strtofloat(z[1])),2)))+strtofloat(x[1]))
else x[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power((strtofloat(z[3])-strtofloat(z[1])),2)))+strtofloat(x[1]));
end;
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then begin
if power(r23,2)-power(strtofloat(z[3]),2)<0 then   x[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]))
else x[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2)))+strtofloat(x[1]));
if pos('.',x[3])=0 then x[3]:=x[3]+'.000000000000'  else  x[3]:=x[3]+'000000000000';
if copy(x[3],1,1)='.' then x[3]:='0'+x[i];
if copy(x[3],1,2)='-.' then x[3]:='-0'+copy(x[3],2,length(x[3]));
end;
end;

if nomer_atoma=3 then goto 0;
if (nomer_atoma>3) and (nomer_a=2) then  begin
nomer_a:=4;
atom[1][1]:=atom_store[1];
goto 18;
end;







if nomer_a=3 then begin
x[3]:=x[1];
r23:=sqrt(power(strtofloat(variab_z[3][1]),2)+power(strtofloat(variab_z[2][1]),2)-2*strtofloat(variab_z[2][1])*strtofloat(variab_z[3][1])*cos(strtofloat(variab_z[3][2])*pi/180));
if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)-power(r23,2)+power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1]))+strtofloat(z[1]));
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)+power(r23,2)-power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1]))+strtofloat(z[1]));
if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then begin
if power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)<0 then y[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)))+strtofloat(y[1]))
else y[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)))+strtofloat(y[1]));
end;
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then begin
if power(r23,2)-power(strtofloat(z[3]),2)<0 then   y[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2)))+strtofloat(y[1]))
else y[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2)))+strtofloat(y[1]));
end;
end;

if nomer_atoma=4 then goto 0;

if nomer_z>0 then goto  111;
goto  18;
end;
/////////////////////////////////////////////////////////////////////////

if id[1]=3 then rez:=nomer_atoma-rez
else rez:=0;

if nomer_atoma=1 then begin
Setlength(atom_store,2);
Setlength(x,2);
Setlength(y,2);
Setlength(z,2);
atom_store[1]:=atom[1][1];
x[1]:='0.000000000000';
y[1]:='0.000000000000';
z[1]:='0.000000000000';
pb.Progress:=100;
pb.Visible:=False;
StatusBar1.Panels[0].Text:='Ready';
StatusBar1.Panels[1].Text:='1 atom; 0 variables';
//pb.ForeColor:=clBtnFace;
//pb.BackColor:=clBtnFace;
//pb.FreeOnRelease;
goto 0;
end;

for i:=1 to nomer_atoma-rez do
if atom[i][1]<>'' then atom_store[i]:=atom[i][1];

if (id[1]=3) and (id[2]=4) and (id[3]<>5) then goto 22;


111:

res2:=false;
if (x[1]<>'') and (pos('.',x[1])<>0) then x[1]:=x[1]
else  x[1]:='0.000000000000';
if (y[1]<>'') and (pos('.',y[1])<>0) then y[1]:=y[1]
else  y[1]:='0.000000000000';
if (z[1]<>'') and (pos('.',z[1])<>0) then z[1]:=z[1]
else  z[1]:='0.000000000000';
if nomer_z=1  then goto 0;
if nomer_atoma-1=0 then goto 0;
if (x[2]<>'') and (pos('.',x[2])<>0) then x[2]:=x[2]
else  x[2]:='0.000000000000';
if (y[2]<>'') and (pos('.',y[2])<>0) then y[2]:=y[2]
else  y[2]:='0.000000000000';
if z[2]='' then z[2]:=variab_z[2][1]
else  z[2]:='0.000000000000';
if length(z[2])<10 then  z[2]:=z[2]+copy('0000000000000',1,(12-length(copy(z[2],pos('.',z[2]),length(z[2])))));
if nomer_atoma-1=1 then begin
pb.Progress:=100;
pb.Visible:=False;
StatusBar1.Panels[0].Text:='Ready';
StatusBar1.Panels[1].Text:='2 atom; '+inttostr(nomer_variabl)+' variables';
goto 0;
end;
if nomer_z=2 then goto 0;

if (y[3]<>'') and (pos('.',y[3])<>0) then y[3]:=y[3]
else  y[3]:='0.000000000000';
    //������� x �� y
r23:=sqrt(power(strtofloat(variab_z[3][1]),2)+power(strtofloat(variab_z[2][1]),2)-2*strtofloat(variab_z[2][1])*strtofloat(variab_z[3][1])*cos(strtofloat(variab_z[3][2])*pi/180));

if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)-power(r23,2)+power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1])));
if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then z[3]:=floattostr((power(strtofloat(variab_z[2][1]),2)+power(r23,2)-power(strtofloat(variab_z[3][1]),2))/(2*strtofloat(variab_z[2][1])));







if (atom[3][2]=atom[1][1]) or (atom[3][2]='1') then begin
if power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2)<0 then x[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2))))
else x[3]:=floattostr(sqrt(abs(power(strtofloat(variab_z[3][1]),2)-power(strtofloat(z[3]),2))));
end;



if (atom[3][2]=atom[2][1]) or (atom[3][2]='2') then begin
if power(r23,2)-power(strtofloat(z[3]),2)<0 then   x[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2))))
else x[3]:=floattostr(sqrt(abs(power(r23,2)-power(strtofloat(z[3]),2))));
end;



////////



if pos('.',z[2])=0 then z[2]:=z[2]+'.000000000000';
if pos('.',x[3])=0 then x[3]:=x[3]+'.000000000000';
if pos('.',y[3])=0 then y[3]:=y[3]+'.000000000000';
if pos('.',z[3])=0 then z[3]:=z[3]+'.000000000000';


for i:=2 to 3 do begin
if copy(x[i],1,1)='.' then x[i]:='0'+x[i];
if copy(y[i],1,1)='.' then y[i]:='0'+y[i];
if copy(z[i],1,1)='.' then z[i]:='0'+z[i];
if copy(x[i],1,2)='-.' then x[i]:='-0'+copy(x[i],2,length(x[i]));
if copy(y[i],1,2)='-.' then y[i]:='-0'+copy(y[i],2,length(y[i]));
if copy(z[i],1,2)='-.' then z[i]:='-0'+copy(z[i],2,length(z[i]));
end;





if length(x[3])<10 then  x[3]:=x[3]+copy('0000000000000',1,(12-length(copy(x[3],pos('.',x[3]),length(x[3])))));
if length(y[3])<10 then  y[3]:=y[3]+copy('0000000000000',1,(12-length(copy(y[3],pos('.',y[3]),length(y[3])))));
if length(z[3])<10 then  z[3]:=z[3]+copy('0000000000000',1,(12-length(copy(z[3],pos('.',z[3]),length(z[3])))));



if (abs(strtofloat(x[3]))<0.00000001) or (pos('E-',x[3])<>0) then x[3]:='0.000000000000';
if (abs(strtofloat(y[3]))<0.00000001) or (pos('E-',y[3])<>0) then y[3]:='0.000000000000';
if (abs(strtofloat(z[3]))<0.00000001) or (pos('E-',z[3])<>0) then z[3]:='0.000000000000';

if (nomer_atoma-1=3) and (identificator<>2) then goto 0;
if nomer_z=3 then goto 0;

SetLength(rab,5,5);


rab[2][1]:=strtofloat(variab_z[2][1]);    // ��� �������������
rab[2][2]:=strtofloat(variab_z[3][2]);
rab[3][1]:=strtofloat(variab_z[3][1]);
rab[3][2]:=sqrt(power(rab[3][1],2)+power(rab[2][1],2)-2*rab[3][1]*rab[2][1]*cos(strtofloat(variab_z[3][2])*pi/180));
variab_z[2][2]:=variab_z[3][2];

18:

if identificator=3 then per:=nomer_a
else per:=4;
per:=4;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////������ ��������� �����/////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
for k:=per to nomer_atoma do begin  //����������, ��������� � ���������� ���� ��������� �� ���������� ����������
Application.ProcessMessages;

with pb do begin
   Parent:= Statusbar1;
   Statusbar1.Panels[0].Text:='Reading Z-matrix';
   pb.Progress:=round((k+Nstr+2*Nvar)/(2*NStr+2*NVar)*100);
   pb.BackColor:=clBtnFace;
   pb.ForeColor:=RGB(0,220,50);
   pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := StatusBar1.Panels[0].Width+1;
   Height:= StatusBar1.Height - Top-3;
   Width:= StatusBar1.Panels[1].Width-4;
end;  //with;
pb.Visible:= True;













//////////////////////////////////������������� ����� �������//////////////////////////////////////
SetLength(xc,nomer_atoma+2);
SetLength(yc,nomer_atoma+2);
SetLength(zc,nomer_atoma+2);
SetLength(x_x,nomer_atoma+2);
SetLength(y_y,nomer_atoma+2);
SetLength(z_z,nomer_atoma+2);
SetLength(x4_4,nomer_atoma+2);
SetLength(y4_4,nomer_atoma+2);
SetLength(z4_4,nomer_atoma+2);
SetLength(x_int,nomer_atoma+2);
SetLength(y_int,nomer_atoma+2);
SetLength(z_int,nomer_atoma+2);
SetLength(xf,nomer_atoma+2);
SetLength(yf,nomer_atoma+2);
SetLength(zf,nomer_atoma+2);
SetLength(x4_4_4,nomer_atoma+2);
SetLength(y4_4_4,nomer_atoma+2);
SetLength(z4_4_4,nomer_atoma+2);
SetLength(x_intf,nomer_atoma+2);
SetLength(y_intf,nomer_atoma+2);
SetLength(z_intf,nomer_atoma+2);
SetLength(x_int,nomer_atoma+2);
SetLength(y_int,nomer_atoma+2);
SetLength(zflag,nomer_atoma+2);
SetLength(rab,nomer_atoma+2,5);
SetLength(krit2,nomer_atoma+2);
/////////////////////////////////////////////////////////////////////////////////////////////////////
















if (x[k]<>'') and (y[k]<>'') and (z[k]<>'') then goto 112;

if (variab_z[k][1]='') or (variab_z[k][1]=' ') then goto 0;
rab[k][1]:=strtofloat(variab_z[k][1]);




TryStrToInt(atom[k][2],verif1);
TryStrToInt(atom[k][3],verif2);
TryStrToInt(atom[k][4],verif3);








//////////////////////////////////////////�������� ���� ������� �������/////////////////////////////////////////////

SetLength(atom,nomer_atoma+2,5);

for i:=1 to nomer_atoma do begin
TryStrToInt(atom[i][1],ver);
if atom[i][1]<>'' then begin
if (ver=0) or (length(atom[i][1])<>length(inttostr(ver))) then atom_store[i]:=atom[i][1];
end;
end;







if (verif1<>0)  and (length(atom[k][2])=length(inttostr(verif1))) then begin
if (verif2<>0)  and (length(atom[k][3])=length(inttostr(verif2))) then begin
if (verif3=0)  or (length(atom[k][4])<>length(inttostr(verif3))) then begin  //ccb
for p:=1 to k-1 do begin
if atom[k-p][4]=atom_store[k-p] then
begin
atom[k-p][4]:=inttostr(k-p);
//goto 12;
end;
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then rab[k][2]:=sqrt(abs(power(rab[k][1],2)+power(strtofloat(variab_z[k-p][1]),2)-2*rab[k][1]*strtofloat(variab_z[k-p][1])*cos(strtofloat(variab_z[k][2])*pi/180)));
res:=false;
end;
goto 13;
end;
end;
end;



if (verif1<>0)  and (length(atom[k][2])=length(inttostr(verif1))) then begin
if (verif2<>0)  and (length(atom[k][3])=length(inttostr(verif2))) then begin
if (verif3<>0)  and (length(atom[k][4])=length(inttostr(verif3))) then begin  //ccc
for p:=1 to k-1 do begin
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then rab[k][2]:=sqrt(abs(power(rab[k][1],2)+power(strtofloat(variab_z[k-p][1]),2)-2*rab[k][1]*strtofloat(variab_z[k-p][1])*cos(strtofloat(variab_z[k][2])*pi/180)));
res:=false;
goto 13;
end;
end;
end;
end;


if (verif1=0)  or (length(atom[k][2])<>length(inttostr(verif1))) then begin
if (verif2=0)  or (length(atom[k][3])<>length(inttostr(verif2))) then begin
if (verif3=0)  or (length(atom[k][4])<>length(inttostr(verif3))) then begin  //bbb
for p:=1 to k-1 do begin
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then rab[k][2]:=sqrt(abs(power(rab[k][1],2)+power(strtofloat(variab_z[k-p][1]),2)-2*rab[k][1]*strtofloat(variab_z[k-p][1])*cos(strtofloat(variab_z[k][2])*pi/180)));
res:=true;
goto 13;
end;
end;
end;
end;



if (verif1<>0)  and (length(atom[k][2])=length(inttostr(verif1))) then begin
if (verif2=0)  or (length(atom[k][3])<>length(inttostr(verif2))) then begin
if (verif3=0)  or (length(atom[k][4])<>length(inttostr(verif3))) then begin  //cbb


for p:=1 to k-1 do begin
if atom[k][3]=atom_store[k-p] then
begin
atom[k][3]:=inttostr(k-p);
//goto 12;
end;
end;


for p:=1 to k-1 do begin
if atom[k][4]=atom_store[k-p] then
begin
atom[k][4]:=inttostr(k-p);
//goto 12;
end;
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then rab[k][2]:=sqrt(abs(power(rab[k][1],2)+power(strtofloat(variab_z[k-p][1]),2)-2*rab[k][1]*strtofloat(variab_z[k-p][1])*cos(strtofloat(variab_z[k][2])*pi/180)));

res:=false;

end;
goto 13;
end;
end;
end;




if (verif1<>0)  and (length(atom[k][2])=length(inttostr(verif1))) then begin
if (verif2=0)  or (length(atom[k][3])<>length(inttostr(verif2))) then begin
if (verif3<>0)  and (length(atom[k][4])=length(inttostr(verif3))) then begin  //cbc


for p:=1 to k-1 do begin
if atom[k][3]=atom_store[k-p] then
begin
atom[k][3]:=inttostr(k-p);
//goto 12;
end;
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then rab[k][2]:=sqrt(abs(power(rab[k][1],2)+power(strtofloat(variab_z[k-p][1]),2)-2*rab[k][1]*strtofloat(variab_z[k-p][1])*cos(strtofloat(variab_z[k][2])*pi/180)));
res:=false;
end;
goto 13;
end;
end;
end;




if (verif1=0)  or (length(atom[k][2])<>length(inttostr(verif1))) then begin
if (verif2<>0)  and (length(atom[k][3])=length(inttostr(verif2))) then begin
if (verif3=0)  or (length(atom[k][4])<>length(inttostr(verif3))) then begin  //bcb


for p:=1 to k-1 do begin
if atom[k][2]=atom_store[k-p] then
begin
atom[k][2]:=inttostr(k-p);
//goto 12;
end;
end;


for p:=1 to k-1 do begin
if atom[k][4]=atom_store[k-p] then
begin
atom[k][4]:=inttostr(k-p);
//goto 12;
end;
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then rab[k][2]:=sqrt(abs(power(rab[k][1],2)+power(strtofloat(variab_z[k-p][1]),2)-2*rab[k][1]*strtofloat(variab_z[k-p][1])*cos(strtofloat(variab_z[k][2])*pi/180)));
res:=false;
end;
goto 13;
end;
end;
end;




if (verif1=0)  or (length(atom[k][2])<>length(inttostr(verif1))) then begin
if (verif2<>0)  and (length(atom[k][3])=length(inttostr(verif2))) then begin
if (verif3<>0)  and (length(atom[k][4])=length(inttostr(verif3))) then begin  //bcc
for p:=1 to k-1 do begin
if atom[k-p][2]=atom_store[k-p] then
begin
atom[k-p][2]:=inttostr(k-p);
//goto 12;
end;
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then rab[k][2]:=sqrt(abs(power(rab[k][1],2)+power(strtofloat(variab_z[k-p][1]),2)-2*rab[k][1]*strtofloat(variab_z[k-p][1])*cos(strtofloat(variab_z[k][2])*pi/180)));
res:=false;
end;
goto 13;
end;
end;
end;



if (verif1=0)  or (length(atom[k][2])<>length(inttostr(verif1))) then begin
if (verif2=0)  or (length(atom[k][3])<>length(inttostr(verif2))) then begin
if (verif3<>0) and (length(atom[k][4])=length(inttostr(verif3))) then begin  //bbc


for p:=1 to k-1 do begin
if atom[k][2]=atom_store[k-p] then
begin
atom[k][2]:=inttostr(k-p);
//goto 12;
end;
end;


for p:=1 to k-1 do begin
if atom[k][3]=atom_store[k-p] then
begin
atom[k][3]:=inttostr(k-p);
//goto 12;
end;
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then rab[k][2]:=sqrt(abs(power(rab[k][1],2)+power(strtofloat(variab_z[k-p][1]),2)-2*rab[k][1]*strtofloat(variab_z[k-p][1])*cos(strtofloat(variab_z[k][2])*pi/180)));
res:=false;
end;
goto 13;
end;
end;
end;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



13:




if res=false then begin
for p:=1 to k-1 do begin
atom[k-p][1]:=inttostr(k-p);
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) or (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) then p_pr:=1;
if (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][3]) or (atom[k][2]+atom[k][3]=atom[k-p][3]+atom[k-p][2]) then p_pr:=1;
if (atom[k][2]+atom[k][3]=atom[k-p][3]+atom[k-p][4]) or (atom[k][2]+atom[k][3]=atom[k-p][4]+atom[k-p][3]) then p_pr:=1;
end;
for p:=1 to k-1 do begin
atom[k-p][1]:=inttostr(k-p);
if (atom[k][3]+atom[k][4]=atom[k-p][2]+atom[k-p][1]) or (atom[k][3]+atom[k][4]=atom[k-p][1]+atom[k-p][2]) then begin
p_pr:=p_pr+1;
break;
end;
if (atom[k][3]+atom[k][4]=atom[k-p][2]+atom[k-p][3]) or (atom[k][3]+atom[k][4]=atom[k-p][3]+atom[k-p][2]) then begin
p_pr:=p_pr+1;
break;
end;
if (atom[k][3]+atom[k][4]=atom[k-p][3]+atom[k-p][4]) or (atom[k][3]+atom[k][4]=atom[k-p][4]+atom[k-p][3]) then begin
p_pr:=p_pr+1;
break;
end;
end;

for p:=1 to k-1 do begin
if (atom[k][2]+atom[k][3]+atom[k][4]=atom[k-p][2]+atom[k-p][3]+atom[k-p][4]) and (krit2[k-p]=1) then begin
p_pr:=p_pr-1;
break;
end;
end;

end;









p_pr:=1;
for p:=1 to k-1 do begin
if (atom[k][3]+atom[k][4]=atom[k-p][1]+atom[k-p][2]) or (atom[k][3]+atom[k][4]=atom[k-p][2]+atom[k-p][1]) or (atom[k][3]+atom[k][4]=atom[k-p][2]+atom[k-p][3]) or (atom[k][3]+atom[k][4]=atom[k-p][3]+atom[k-p][2]) then begin
p_pr:=2;
break;
end;
end;











krit2[k]:=p_pr;  //����� ��� �������� ��������������� ����������� �����
// krit2 - �.�. ������ �������� ��� ����, ����� ������� ������ � ��������������� ��� ��������
// ���� ���� �� ����� �������� 3 ������������� ���������������� ����� N x y z  �  M x y z , �� ��������� ����� � ������
//���������������� �������� �������� ���� � ������, ���� ���������� ������ ���� ����� �������� � ��������������� ������







/////////////////////////////������ ����� ����������///////////////////////

res:=false;

for i:=1 to k-1 do begin
if (atom[k][2]=atom[i][1]) then begin
res:=true;
break;
end;
end;
if res=false then i:=strtoint(atom[k][2]);
res:=false;

for j:=1 to k-1 do begin
if atom[k][3]=atom[j][1] then begin
res:=true;
break;
end;
end;
if res=false then j:=strtoint(atom[k][3]);
res:=false;


for l:=1 to k-1 do begin
if atom[k][4]=atom[l][1] then begin
res:=true;
break;
end;
end;
if res=false then l:=strtoint(atom[k][4]);
res:=false;

///////////////////////////////��������� ����� ����������///////////////////////

res1:=false;

if  sqrt(power(strtofloat(x[j])-strtofloat(x[l]),2)+ power((strtofloat(y[j])-strtofloat(y[l])),2)+power((strtofloat(z[j])-strtofloat(z[l])),2))<sqrt(power(strtofloat(x[i])-strtofloat(x[l]),2)+ power((strtofloat(y[i])-strtofloat(y[l])),2)+power((strtofloat(z[i])-strtofloat(z[l])),2))   then begin
p_pr:=2;
res1:=true;
end;






res:=false;
if  rab[k][2]=0 then begin
rab[k][2]:=   sqrt   (power(strtofloat(x[i])-strtofloat(x[j]),2)+ power((strtofloat(y[i])-strtofloat(y[j])),2)+power((strtofloat(z[i])-strtofloat(z[j])),2));
rab[k][2]:=  sqrt(power(rab[k][1],2)+power(rab[k][2],2)-2*rab[k][1]*rab[k][2]*cos(strtofloat(variab_z[k][2])*pi/180));
res:=true;
end;









if p_pr=1 then begin
//ma1:=sqrt(power(strtofloat(variab_z[k][1]),2)+power(strtofloat(variab_z[k-1][1]),2)-2*strtofloat(variab_z[k][1])*strtofloat(variab_z[k-1][1])*cos((360-strtofloat(variab_z[k][2])-strtofloat(variab_z[k-1][2]))*pi/180))/2;   //��������� ������������� ���������
//rab[k][3]:=sqrt(2*power(ma1,2)-2*power(ma1,2)*cos(strtofloat(variab_z[k][3])*pi/180));  //"���������������" ������

ma1:=strtofloat(variab_z[k][1])*cos((180-strtofloat(variab_z[k][2]))*pi/180);    //������ ������

for p:=1 to k-1 do begin
if (atom[k][2]+atom[k][4]=atom[k-p][1]+atom[k-p][2])  or  (atom[k][2]+atom[k][4]=atom[k-p][2]+atom[k-p][1]) then begin
rabx_dis:=strtofloat(variab_z[k-p][1]);
rabx_ang:=strtofloat(variab_z[k-p][2]);
end;
if (atom[k][2]+atom[k][4]=atom[k-p][1]+atom[k-p][3])  or  (atom[k][2]+atom[k][4]=atom[k-p][3]+atom[k-p][1]) then begin
rabx_dis:=rab[k-p][2];
rabx_ang:=strtofloat(variab_z[k-p][2]);
end;
end;

for p:=1 to k-1 do  begin
if atom[k][4]=atom[k-p][1] then begin
x_x[k]:=x[k-p];
y_y[k]:=y[k-p];
z_z[k]:=z[k-p];
end;
end;




if abs(ma1)<0.1 then begin  //���� ���� 4-1-2 ����� ������ � 90 ��������
ma4:=strtofloat(variab_z[k][1])*sin((180-strtofloat(variab_z[k][2]))*pi/180);  //������ ��������� ������
ma11:=  sqrt   (power(strtofloat(x[i])-strtofloat(x[j]),2)+ power((strtofloat(y[i])-strtofloat(y[j])),2)+power((strtofloat(z[i])-strtofloat(z[j])),2));    //����� ����� 1-2
ma12:=  sqrt   (power(strtofloat(x[i])-strtofloat(x[l]),2)+ power((strtofloat(y[i])-strtofloat(y[l])),2)+power((strtofloat(z[i])-strtofloat(z[l])),2));       //����� ����� 1-3
ma13:=    sqrt   (power(strtofloat(x[j])-strtofloat(x[l]),2)+ power((strtofloat(y[j])-strtofloat(y[l])),2)+power((strtofloat(z[j])-strtofloat(z[l])),2));      //����� ����� 2-3
ma14:=arccos((power(ma11,2)+power(ma12,2)-power(ma13,2))/(2*ma11*ma12))*180/pi;  //���� � ��������  3-1-2
if ma14>=90 then ma15:= ma12*cos((ma14-90)*pi/180);  // �������� ����� 1-3 �� ��������� ������
if ma14<90 then  ma15:= ma12*cos((90-ma14)*pi/180)+ma1*tan(ma14*pi/180);
ma16:= sqrt(power(ma4,2)+power(ma15,2)-2*ma4*ma15*cos((strtofloat(variab_z[k][3]))*pi/180));   //������� ������� � ��������� ��������� ������
ma17:= ma12*cos((180-ma14)*pi/180)-ma1; // �������� ����� 1-3 �� ��� ������ ����� ������ ������
rab[k][3]:= sqrt(power(ma17,2)+power(ma16,2));

ma2:=ma1/cos((180-rabx_ang)*pi/180);
ma3:=sqrt(power(ma2,2)-power(ma1,2));

if abs(cos(ma14*pi/180))<0.0000001    then begin

xc[k]:=floattostr(strtofloat(x[j])+((ma11+ma1)/ma11)*(strtofloat(x[i])-strtofloat(x[j])));
yc[k]:=floattostr(strtofloat(y[j])+((ma11+ma1)/ma11)*(strtofloat(y[i])-strtofloat(y[j])));
zc[k]:=floattostr(strtofloat(z[j])+((ma11+ma1)/ma11)*(strtofloat(z[i])-strtofloat(z[j])));

ma19:=arccos((power(ma11,2)+power(ma13,2)-power(ma12,2))/(2*ma11*ma13))*180/pi;
x4_4[k]:= floattostr(strtofloat(x[j])+(((ma11+ma1)/cos(ma19*pi/180))/ma13)*(strtofloat(x[l])-strtofloat(x[j])));
y4_4[k]:= floattostr(strtofloat(y[j])+(((ma11+ma1)/cos(ma19*pi/180))/ma13)*(strtofloat(y[l])-strtofloat(y[j])));
z4_4[k]:= floattostr(strtofloat(z[j])+(((ma11+ma1)/cos(ma19*pi/180))/ma13)*(strtofloat(z[l])-strtofloat(z[j])));

x_int[k]:= floattostr(strtofloat(x4_4[k])+ ( (  (ma11+ma1)*tan(ma19*pi/180)  -  ma4*cos(strtofloat(variab_z[k][3])*pi/180) )  /  ( (ma11+ma1)*tan(ma19*pi/180) ) )   * (strtofloat(xc[k])-strtofloat(x4_4[k])));
y_int[k]:= floattostr(strtofloat(y4_4[k])+  ( (  (ma11+ma1)*tan(ma19*pi/180)  -  ma4*cos(strtofloat(variab_z[k][3])*pi/180) )  /  ( (ma11+ma1)*tan(ma19*pi/180) ) )    * (strtofloat(yc[k])-strtofloat(y4_4[k])));
z_int[k]:= floattostr(strtofloat(z4_4[k])+  ( (  (ma11+ma1)*tan(ma19*pi/180)  -  ma4*cos(strtofloat(variab_z[k][3])*pi/180) )  /  ( (ma11+ma1)*tan(ma19*pi/180) ) )  * (strtofloat(zc[k])-strtofloat(z4_4[k])));
xf[k]:=floattostr(2*strtofloat(x_int[k]));
yf[k]:=floattostr(2*strtofloat(y_int[k]));
zf[k]:=floattostr(2*strtofloat(z_int[k]));
goto 11;


end;

goto 9;
end;







if abs(ma1)<0.1 then begin  //���� ���� 4-1-2 ����� ������ � 90 ��������
ma4:=strtofloat(variab_z[k][1])*sin((180-strtofloat(variab_z[k][2]))*pi/180);  //������ ��������� ������
ma11:=         sqrt   (power(strtofloat(x[i])-strtofloat(x[j]),2)+ power((strtofloat(y[i])-strtofloat(y[j])),2)+power((strtofloat(z[i])-strtofloat(z[j])),2));    //����� ����� 1-2
ma12:=    sqrt   (power(strtofloat(x[i])-strtofloat(x[l]),2)+ power((strtofloat(y[i])-strtofloat(y[l])),2)+power((strtofloat(z[i])-strtofloat(z[l])),2));       //����� ����� 1-3
ma13:=    sqrt   (power(strtofloat(x[j])-strtofloat(x[l]),2)+ power((strtofloat(y[j])-strtofloat(y[l])),2)+power((strtofloat(z[j])-strtofloat(z[l])),2));      //����� ����� 2-3
ma14:=(power(ma11,2)+power(ma12,2)-power(ma13,2))/(2*ma11*ma12);  //������� ���� 2-1-3
ma15:= arccos(ma14)*180/pi; //��� ���� � ��������
ma16:= ma12*sin((ma15-90)*pi/180);  //����� ���������������� ������������
ma17:= sqrt(power(ma12*cos((ma15-90)*pi/180),2)+power(rab[k][1],2)-2*(ma12*cos((ma15-90)*pi/180))*rab[k][1]*cos(strtofloat(variab_z[k][3])*pi/180));     //������ ����� ���������������� ������������
rab[k][3]:=sqrt(power(ma16,2)+power(ma17,2));
goto 9;
end;





ma18:=   sqrt(power((strtofloat(x[i])-strtofloat(x[l])),2)+ power((strtofloat(y[i])-strtofloat(y[l])),2)+power((strtofloat(z[i])-strtofloat(z[l])),2));
ma19:=   sqrt(power((strtofloat(x[i])-strtofloat(x[j])),2)+ power((strtofloat(y[i])-strtofloat(y[j])),2)+power((strtofloat(z[i])-strtofloat(z[j])),2));
ma20:=   sqrt(power((strtofloat(x[l])-strtofloat(x[j])),2)+ power((strtofloat(y[l])-strtofloat(y[j])),2)+power((strtofloat(z[l])-strtofloat(z[j])),2));
ma9:=  (arccos((power(ma18,2)+power(ma19,2)-power(ma20,2))/(2*ma18*ma19)) )*180/pi;
ma17:=  (arccos((power(ma19,2)+power(ma20,2)-power(ma18,2))/(2*ma19*ma20)) )*180/pi;



ma2:=0;
if (abs(ma9-rabx_ang)<0.00001) and (abs(cos((180-rabx_ang)*pi/180))>0.0000000001) then begin
ma2:=ma1/cos((180-rabx_ang)*pi/180);     //����� ����� 1-3 �� ����������� � ���������� ������
if (ma1<0) and (ma2<0) and (ma9>90) then goto 14;
//ma15:=ma1/cos((180-rabx_ang)*pi/180);
ma3:=sqrt(power(ma2,2)-power(ma1,2));       //���������� �� ������ ��������� ������ �� ����� ����������� ����� 1-3 � ����������
ma4:=strtofloat(variab_z[k][1])*sin((180-strtofloat(variab_z[k][2]))*pi/180);  //������ ��������� ������
ma5:=sqrt(power(ma3,2)+power(ma4,2)-2*ma3*ma4*cos(strtofloat(variab_z[k][3])*pi/180));       //����� �������, ������������ ���� 4 � ����� ����������� ����� 1-3 � ���������� ������
ma6:=(power(ma2,2)+ power(strtofloat(variab_z[k][1]),2)-power(ma5,2))/(2*ma2*strtofloat(variab_z[k][1]));  //������� �������� ����
rab[k][3]:=sqrt(power(strtofloat(variab_z[k][1]),2)+power(rabx_dis,2)-2*strtofloat(variab_z[k][1])*rabx_dis*ma6);
rab[k][4]:=ma4;   //������ ��������� ������ - 4-�� ���������� ��� ������� ���������
goto 9;
end
else begin
ma4:=strtofloat(variab_z[k][1])*sin((180-strtofloat(variab_z[k][2]))*pi/180);  //������ ��������� ������
ma5:=ma1-ma18*cos((180-ma9)*pi/180);
ma6:=ma18*sin(ma9*pi/180);
ma7:=sqrt(power(ma6,2)+power(ma4,2)-2*ma6*ma4*cos((strtofloat(variab_z[k][3]))*pi/180));
rab[k][3]:=sqrt(power(ma7,2)+power(ma5,2));
if strtofloat(variab_z[k][2])<90 then  begin
xc[k]:=floattostr(strtofloat(x[j])+((ma19-rab[k][1]* sin((90-strtofloat(variab_z[k][2]))*pi/180))/ma19)*(strtofloat(x[i])-strtofloat(x[j])));
yc[k]:=floattostr(strtofloat(y[j])+((ma19-rab[k][1]* sin((90-strtofloat(variab_z[k][2]))*pi/180))/ma19)*(strtofloat(y[i])-strtofloat(y[j])));
zc[k]:=floattostr(strtofloat(z[j])+((ma19-rab[k][1]* sin((90-strtofloat(variab_z[k][2]))*pi/180))/ma19)*(strtofloat(z[i])-strtofloat(z[j])));

x4_4[k]:= floattostr(strtofloat(x[j])+(((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))/cos(ma17*pi/180))/ma20)*(strtofloat(x[l])-strtofloat(x[j])));


y4_4[k]:= floattostr(strtofloat(y[j])+(((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))/cos(ma17*pi/180))/ma20)*(strtofloat(y[l])-strtofloat(y[j])));
z4_4[k]:= floattostr(strtofloat(z[j])+(((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))/cos(ma17*pi/180))/ma20)*(strtofloat(z[l])-strtofloat(z[j])));
x_int[k]:= floattostr(strtofloat(x4_4[k])+  ((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))*tan(ma17*pi/180) +  rab[k][1]*cos((90-strtofloat(variab_z[k][2]))*pi/180) )/  ((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))*tan(ma17*pi/180) )                      *(strtofloat(xc[k])-strtofloat(x4_4[k])));
y_int[k]:= floattostr(strtofloat(y4_4[k])+   ((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))*tan(ma17*pi/180) +  rab[k][1]*cos((90-strtofloat(variab_z[k][2]))*pi/180) )/  ((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))*tan(ma17*pi/180) )                     *(strtofloat(yc[k])-strtofloat(y4_4[k])));
z_int[k]:= floattostr(strtofloat(z4_4[k])+   ((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))*tan(ma17*pi/180) +  rab[k][1]*cos((90-strtofloat(variab_z[k][2]))*pi/180) )/  ((ma19-rab[k][1]*sin((90-strtofloat(variab_z[k][2]))*pi/180))*tan(ma17*pi/180) )                       *(strtofloat(zc[k])-strtofloat(z4_4[k])));

xf[k]:=floattostr(2*strtofloat(x_int[k]));
yf[k]:=floattostr(2*strtofloat(y_int[k]));
zf[k]:=floattostr(2*strtofloat(z_int[k]));
goto 11;

end;
goto 9;
end;


14:
ma4:=strtofloat(variab_z[k][1])*sin((180-strtofloat(variab_z[k][2]))*pi/180);  //������ ��������� ������
ma2:=ma18*sin((180-ma9)*pi/180);
ma3:= rab[k][1]* cos((90-strtofloat(variab_z[k][2]))*pi/180);
ma5:= sqrt(power(ma2,2)+power(ma3,2)-2*ma2*ma3*cos((strtofloat(variab_z[k][3]))*pi/180));
ma6:= ma18*cos((180-ma9)*pi/180)+ rab[k][1]* sin((90-strtofloat(variab_z[k][2]))*pi/180);
rab[k][3]:= sqrt(power(ma5,2)+power(ma6,2));
xc[k]:=floattostr(strtofloat(x[j])+((ma19-rab[k][1]* sin((90-strtofloat(variab_z[k][2]))*pi/180))/ma19)*(strtofloat(x[i])-strtofloat(x[j])));
yc[k]:=floattostr(strtofloat(y[j])+((ma19-rab[k][1]* sin((90-strtofloat(variab_z[k][2]))*pi/180))/ma19)*(strtofloat(y[i])-strtofloat(y[j])));
zc[k]:=floattostr(strtofloat(z[j])+((ma19-rab[k][1]* sin((90-strtofloat(variab_z[k][2]))*pi/180))/ma19)*(strtofloat(z[i])-strtofloat(z[j])));
ma7:=abs(ma1)+ma18*sin((ma9-90)*pi/180);
ma8:=ma7/cos((180-ma9)*pi/180);
x4_4[k]:= floattostr(strtofloat(x[l])+(ma8/ma18)*(strtofloat(x[i])-strtofloat(x[l])));
y4_4[k]:= floattostr(strtofloat(y[l])+(ma8/ma18)*(strtofloat(y[i])-strtofloat(y[l])));
z4_4[k]:= floattostr(strtofloat(z[l])+(ma8/ma18)*(strtofloat(z[i])-strtofloat(z[l])));
if (ma4*cos((strtofloat(variab_z[k][3]))*pi/180))>(ma1*tan((180-ma9)*pi/180)) then begin
x_int[k]:= floattostr(strtofloat(xc[k])+(ma4*cos((strtofloat(variab_z[k][3]))*pi/180)/(ma1*tan((180-ma9)*pi/180)))*(strtofloat(x4_4[k])-strtofloat(xc[k])));
y_int[k]:= floattostr(strtofloat(yc[k])+(ma4*cos((strtofloat(variab_z[k][3]))*pi/180)/(ma1*tan((180-ma9)*pi/180)))*(strtofloat(y4_4[k])-strtofloat(yc[k])));
z_int[k]:= floattostr(strtofloat(zc[k])+(ma4*cos((strtofloat(variab_z[k][3]))*pi/180)/(ma1*tan((180-ma9)*pi/180)))*(strtofloat(z4_4[k])-strtofloat(zc[k])));
end
else begin
x_int[k]:= floattostr(strtofloat(xc[k])+(ma1*tan((180-ma9)*pi/180)/(ma4*cos((strtofloat(variab_z[k][3]))*pi/180)))*(strtofloat(x4_4[k])-strtofloat(xc[k])));
y_int[k]:= floattostr(strtofloat(yc[k])+(ma1*tan((180-ma9)*pi/180)/(ma4*cos((strtofloat(variab_z[k][3]))*pi/180)))*(strtofloat(y4_4[k])-strtofloat(yc[k])));
z_int[k]:= floattostr(strtofloat(zc[k])+(ma1*tan((180-ma9)*pi/180)/(ma4*cos((strtofloat(variab_z[k][3]))*pi/180)))*(strtofloat(z4_4[k])-strtofloat(zc[k])));
end;
xf[k]:=floattostr(2*strtofloat(x_int[k]));
yf[k]:=floattostr(2*strtofloat(y_int[k]));
zf[k]:=floattostr(2*strtofloat(z_int[k]));
goto 11;


9:




for p:=1 to k-1 do begin
for p1:=1 to k-1 do begin
if  (atom[k][2]=atom[k-p][1]) and (atom[k][3]=atom[k-p1][1]) then  begin

if abs(rabx_dis)<1E-15 then goto 11;

if ma2=0 then ma2:=ma18*sin((180-ma9)*pi/180);
//ma3:=sqrt(power(ma2,2)-power(ma1,2));

if  (k-p1>k-p) and (atom[k-p1][1]+atom[k-p1][2]=atom[k-p1][1]+atom[k-p][1]) then  begin
xc[k]:=floattostr(strtofloat(x[k-p1])+((strtofloat(variab_z[k-p1][1])+ma1)/strtofloat(variab_z[k-p1][1]))*(strtofloat(x[k-p])-strtofloat(x[k-p1])));
if  ma2<=rabx_dis then  x4_4[k]:= floattostr(strtofloat(x[k-p])+(ma2/rabx_dis)*(strtofloat(x_x[k])-strtofloat(x[k-p])))
else  x4_4[k]:= floattostr(strtofloat(x[k-p])+(ma2/rabx_dis)*(strtofloat(x_x[k])-strtofloat(x[k-p])));
x_int[k]:=floattostr(strtofloat(x4_4[k])+((ma3-(ma4*cos(strtofloat(variab_z[k][3])*pi/180)))/ma3)*(strtofloat(xc[k]) - strtofloat(x4_4[k])));
xf[k]:=floattostr(2*strtofloat(x_int[k]));  //������������� ������ �������������� ����������
end;
if  (k-p1<k-p) and (atom[k-p][1]+atom[k-p][2]=atom[k-p][1]+atom[k-p1][1]) then  begin
xc[k]:=floattostr(strtofloat(x[k-p1])+((strtofloat(variab_z[k-p][1])+ma1)/strtofloat(variab_z[k-p][1]))*(strtofloat(x[k-p])-strtofloat(x[k-p1])));
if  ma2<=rabx_dis then begin
if abs(ma2)>=0.0001 then  x4_4[k]:= floattostr(strtofloat(x[i])+(ma2/rabx_dis)*(strtofloat(x_x[k])-strtofloat(x[i])));
if abs(ma2)<0.0001 then  x4_4[k]:= floattostr(strtofloat(x[i])+((ma1/cos((180-ma9)*pi/180))/ma18)*(strtofloat(x_x[k])-strtofloat(x[i])));
end
else x4_4[k]:= floattostr(strtofloat(x[i])+(ma2/rabx_dis)*(strtofloat(x_x[k])-strtofloat(x[i])));
if abs(ma2)>=0.0001 then x_int[k]:=floattostr(strtofloat(x4_4[k])+((ma3-(ma4*cos(strtofloat(variab_z[k][3])*pi/180)))/ma3)*(strtofloat(xc[k]) - strtofloat(x4_4[k])));
if abs(ma2)<0.0001 then x_int[k]:= floattostr(strtofloat(x4_4[k])+((ma1*tan((180-ma9)*pi/180)-ma4)/(ma1*tan((180-ma9)*pi/180)))*(strtofloat(xc[k]) - strtofloat(x4_4[k])));
xf[k]:=floattostr(2*strtofloat(x_int[k]));  //������������� ������ �������������� ����������
end;
if  (k-p1>k-p) and (atom[k-p1][1]+atom[k-p1][2]=atom[k-p1][1]+atom[k-p][1]) then begin
yc[k]:=floattostr(strtofloat(y[k-p1])+((strtofloat(variab_z[k-p1][1])+ma1)/strtofloat(variab_z[k-p1][1]))*(strtofloat(y[k-p])-strtofloat(y[k-p1])));
if  ma2<=rabx_dis then y4_4[k]:= floattostr(strtofloat(y[k-p])+(ma2/rabx_dis)*(strtofloat(y_y[k])-strtofloat(y[k-p])))
else y4_4[k]:= floattostr(strtofloat(y[k-p])+(ma2/rabx_dis)*(strtofloat(y_y[k])-strtofloat(y[k-p])));
y_int[k]:=floattostr(strtofloat(y4_4[k])+((ma3-(ma4*cos(strtofloat(variab_z[k][3])*pi/180)))/ma3)*(strtofloat(yc[k]) - strtofloat(y4_4[k])));
yf[k]:=floattostr(2*strtofloat(y_int[k]));  //������������� ������ �������������� ����������
end;
if  (k-p1<k-p) and (atom[k-p][1]+atom[k-p][2]=atom[k-p][1]+atom[k-p1][1]) then begin
yc[k]:=floattostr(strtofloat(y[k-p1])+((strtofloat(variab_z[k-p][1])+ma1)/strtofloat(variab_z[k-p][1]))*(strtofloat(y[k-p])-strtofloat(y[k-p1])));
if  ma2<=rabx_dis then begin
if abs(ma2)>=0.0001 then y4_4[k]:= floattostr(strtofloat(y[i])+(ma2/rabx_dis)*(strtofloat(y_y[k])-strtofloat(y[i])));
if abs(ma2)<0.0001 then  y4_4[k]:= floattostr(strtofloat(y[i])+((ma1/cos((180-ma9)*pi/180))/ma18)*(strtofloat(y_y[k])-strtofloat(y[i])));
end
else  y4_4[k]:= floattostr(strtofloat(y[i])+(ma2/rabx_dis)*(strtofloat(y_y[k])-strtofloat(y[i])));
if abs(ma2)>=0.0001 then y_int[k]:=floattostr(strtofloat(y4_4[k])+((ma3-(ma4*cos(strtofloat(variab_z[k][3])*pi/180)))/ma3)*(strtofloat(yc[k]) - strtofloat(y4_4[k])));
if abs(ma2)<0.0001 then y_int[k]:= floattostr(strtofloat(y4_4[k])+((ma1*tan((180-ma9)*pi/180)-ma4)/(ma1*tan((180-ma9)*pi/180)))*(strtofloat(yc[k]) - strtofloat(y4_4[k])));
yf[k]:=floattostr(2*strtofloat(y_int[k]));  //������������� ������ �������������� ����������
end;
if  (k-p1>k-p) and (atom[k-p1][1]+atom[k-p1][2]=atom[k-p1][1]+atom[k-p][1]) then  begin
zc[k]:=floattostr(strtofloat(z[k-p1])+((strtofloat(variab_z[k-p1][1])+ma1)/strtofloat(variab_z[k-p1][1]))*(strtofloat(z[k-p])-strtofloat(z[k-p1])));
if  ma2<=rabx_dis then z4_4[k]:= floattostr(strtofloat(z[k-p])+(ma2/rabx_dis)*(strtofloat(z_z[k])-strtofloat(z[k-p])))
else  z4_4[k]:= floattostr(strtofloat(z[k-p])+(ma2/rabx_dis)*(strtofloat(z_z[k])-strtofloat(z[k-p])));
z_int[k]:=floattostr(strtofloat(z4_4[k])+((ma3-(ma4*cos(strtofloat(variab_z[k][3])*pi/180)))/ma3)*(strtofloat(zc[k]) - strtofloat(z4_4[k])));
zf[k]:=floattostr(2*strtofloat(z_int[k]));  //������������� ������ �������������� ����������
end;
if  (k-p1<k-p) and (atom[k-p][1]+atom[k-p][2]=atom[k-p][1]+atom[k-p1][1]) then  begin
zc[k]:=floattostr(strtofloat(z[k-p1])+((strtofloat(variab_z[k-p][1])+ma1)/strtofloat(variab_z[k-p][1]))*(strtofloat(z[k-p])-strtofloat(z[k-p1])));
if  ma2<=rabx_dis then begin
if abs(ma2)>=0.0001 then z4_4[k]:= floattostr(strtofloat(z[i])+(ma2/rabx_dis)*(strtofloat(z_z[k])-strtofloat(z[i])));
if abs(ma2)<0.0001 then  z4_4[k]:= floattostr(strtofloat(z[i])+((ma1/cos((180-ma9)*pi/180))/ma18)*(strtofloat(z_z[k])-strtofloat(z[i])));
end
else z4_4[k]:= floattostr(strtofloat(z[i])+(ma2/rabx_dis)*(strtofloat(z_z[k])-strtofloat(z[i])));
if abs(ma2)>=0.0001 then z_int[k]:=floattostr(strtofloat(z4_4[k])+((ma3-(ma4*cos(strtofloat(variab_z[k][3])*pi/180)))/ma3)*(strtofloat(zc[k]) - strtofloat(z4_4[k])));
if abs(ma2)<0.0001 then z_int[k]:= floattostr(strtofloat(z4_4[k])+((ma1*tan((180-ma9)*pi/180)-ma4)/(ma1*tan((180-ma9)*pi/180)))*(strtofloat(zc[k]) - strtofloat(z4_4[k])));
zf[k]:=floattostr(2*strtofloat(z_int[k]));  //������������� ������ �������������� ����������
end;



end;
end;
end;


if (xf[k]='') and (yf[k]='') and (zf[k]='') and (ma1>0) then begin

xc[k]:=floattostr(strtofloat(x[j])+((ma19+ma1)/ma19)*(strtofloat(x[i])-strtofloat(x[j])));
yc[k]:=floattostr(strtofloat(y[j])+((ma19+ma1)/ma19)*(strtofloat(y[i])-strtofloat(y[j])));
zc[k]:=floattostr(strtofloat(z[j])+((ma19+ma1)/ma19)*(strtofloat(z[i])-strtofloat(z[j])));

x4_4[k]:= floattostr(strtofloat(x[l])+((ma18+(ma1/cos(ma9*pi/180)))/ma18)*(strtofloat(x[i])-strtofloat(x[l])));
y4_4[k]:= floattostr(strtofloat(y[l])+((ma18+(ma1/cos(ma9*pi/180)))/ma18)*(strtofloat(y[i])-strtofloat(y[l])));
z4_4[k]:= floattostr(strtofloat(z[l])+((ma18+(ma1/cos(ma9*pi/180)))/ma18)*(strtofloat(z[i])-strtofloat(z[l])));


x_int[k]:=  floattostr(strtofloat(xc[k])+  ((ma4*abs(cos(strtofloat(variab_z[k][3])*pi/180))) /  (ma1*tan(ma9*pi/180)))*  (strtofloat(x4_4[k]) - strtofloat(xc[k])));
y_int[k]:=  floattostr(strtofloat(yc[k])+  ((ma4*abs(cos(strtofloat(variab_z[k][3])*pi/180))) /  (ma1*tan(ma9*pi/180)))*  (strtofloat(y4_4[k]) - strtofloat(yc[k])));
z_int[k]:=  floattostr(strtofloat(zc[k])+  ((ma4*abs(cos(strtofloat(variab_z[k][3])*pi/180))) /  (ma1*tan(ma9*pi/180)))*  (strtofloat(z4_4[k]) - strtofloat(zc[k])));


xf[k]:=floattostr(2*strtofloat(x_int[k]));
yf[k]:=floattostr(2*strtofloat(y_int[k]));
zf[k]:=floattostr(2*strtofloat(z_int[k]));

end;


if (xf[k]='') and (yf[k]='') and (zf[k]='') and (ma1<0) then begin

if  ((strtofloat(x[i])-strtofloat(x[j]))=0) or ((strtofloat(y[i])-strtofloat(y[j]))=0) or ((strtofloat(z[i])-strtofloat(z[j]))=0) or (ma9=90) or (ma18=0) then goto 11;


xc[k]:=floattostr(strtofloat(x[j])+((ma19+ma1)/ma19)*(strtofloat(x[i])-strtofloat(x[j])));
yc[k]:=floattostr(strtofloat(y[j])+((ma19+ma1)/ma19)*(strtofloat(y[i])-strtofloat(y[j])));
zc[k]:=floattostr(strtofloat(z[j])+((ma19+ma1)/ma19)*(strtofloat(z[i])-strtofloat(z[j])));

x4_4[k]:= floattostr(strtofloat(x[i])+((abs(ma1)/cos(ma9*pi/180))/ma18)*(strtofloat(x[l])-strtofloat(x[i])));
y4_4[k]:= floattostr(strtofloat(y[i])+((abs(ma1)/cos(ma9*pi/180))/ma18)*(strtofloat(y[l])-strtofloat(y[i])));
z4_4[k]:= floattostr(strtofloat(z[i])+((abs(ma1)/cos(ma9*pi/180))/ma18)*(strtofloat(z[l])-strtofloat(z[i])));


x_int[k]:=  floattostr(strtofloat(xc[k]) - ((ma4*cos(strtofloat(variab_z[k][3])*pi/180)) /  (ma1*tan(ma9*pi/180)))*  (strtofloat(x4_4[k]) - strtofloat(xc[k])));
y_int[k]:=  floattostr(strtofloat(yc[k]) - ((ma4*cos(strtofloat(variab_z[k][3])*pi/180)) /  (ma1*tan(ma9*pi/180)))*  (strtofloat(y4_4[k]) - strtofloat(yc[k])));
z_int[k]:=  floattostr(strtofloat(zc[k]) - ((ma4*cos(strtofloat(variab_z[k][3])*pi/180)) /  (ma1*tan(ma9*pi/180)))*  (strtofloat(z4_4[k]) - strtofloat(zc[k])));


xf[k]:=floattostr(2*strtofloat(x_int[k]));
yf[k]:=floattostr(2*strtofloat(y_int[k]));
zf[k]:=floattostr(2*strtofloat(z_int[k]));

end;




//showmessage(inttostr(k));
end;


if p_pr=2 then begin
for p:=1 to k-1 do
if (atom[k][2]+atom[k][3]=atom[k-p][1]+atom[k-p][2]) or (atom[k][2]+atom[k][3]=atom[k-p][2]+atom[k-p][1]) then ma7:=strtofloat(variab_z[k-p][1]);  //1-2-3-4 (���������� 2-3 ��������� � ��������� ma7)
if res=true then  ma7:=sqrt   (power(strtofloat(x[i])-strtofloat(x[j]),2)+ power((strtofloat(y[i])-strtofloat(y[j])),2)+power((strtofloat(z[i])-strtofloat(z[j])),2));
res1:=true;
for p:=1 to k-1 do
if (atom[k][3]+atom[k][4]=atom[k-p][1]+atom[k-p][2]) or (atom[k][3]+atom[k][4]=atom[k-p][2]+atom[k-p][1]) then
begin
ma8:=strtofloat(variab_z[k-p][1]);  //1-2-3-4 (���������� 3-4 ��������� � ��������� ma8)
res1:=false;
end;
if res1=true then ma8:=sqrt   (power(strtofloat(x[j])-strtofloat(x[l]),2)+ power((strtofloat(y[j])-strtofloat(y[l])),2)+power((strtofloat(z[j])-strtofloat(z[l])),2));
res1:=true;
for p:=1 to k-1 do
if (atom[k][2]+atom[k][3]+atom[k][4]=atom[k-p][1]+atom[k-p][2]+atom[k-p][3]) or (atom[k][2]+atom[k][3]+atom[k][4]=atom[k-p][3]+atom[k-p][2]+atom[k-p][1]) then
begin
ma9:=strtofloat(variab_z[k-p][2]);  //1-2-3-4 (���� 2-3-4 ��������� � ��������� ma9)
res1:=false;
end;
if (res=true) or (res1=true) then  begin
ma20:= (power(ma7,2)+    power(ma8,2)-    power((strtofloat(x[i])-strtofloat(x[l])),2)- power((strtofloat(y[i])-strtofloat(y[l])),2)-power((strtofloat(z[i])-strtofloat(z[l])),2))/(2*ma8*ma7);
if abs(ma20)>1 then goto 11;
ma9:=arccos(ma20);
//ma9:=    arccos((power(ma7,2)+    power(ma8,2)-     power((strtofloat(x[i])-strtofloat(x[l])),2)- power((strtofloat(y[i])-strtofloat(y[l])),2)-power((strtofloat(z[i])-strtofloat(z[l])),2))/(2*ma8*ma7));     //�������
ma9:=  ma9*180/pi;      //�������
end;
ma1:=ma7+ma8*sin((ma9-90)*pi/180)+rab[k][1]*cos((180-strtofloat(variab_z[k][2]))*pi/180);   //������
ma1_con:=rab[k][1]*cos((180-strtofloat(variab_z[k][2]))*pi/180);     //������ ������
ma10:=rab[k][1]*sin((180-strtofloat(variab_z[k][2]))*pi/180);                //����� � ��������� ���������� (������ ������)
ma11:=ma8*cos((90-ma9)*pi/180);
//showmessage(inttostr(k)+'   '+ floattostr(power(ma10,2)+power(ma11,2)-2*ma10*ma11*cos(strtofloat(variab_z[k][3])*pi/180)));
ma12:=sqrt(abs(power(ma10,2)+power(ma11,2)-2*ma10*ma11*cos(strtofloat(variab_z[k][3])*pi/180)));

rab[k][3]:=sqrt(power(ma1,2)+power(ma12,2));


//*****************************************************************************************




for p:=1 to k-1 do begin
for p1:=1 to k-1 do begin
if  (atom[k][2]=atom[k-p][1]) and (atom[k][3]=atom[k-p1][1]) then  begin

if  (k-p1>k-p) and (atom[k-p1][1]+atom[k-p1][2]=atom[k-p1][1]+atom[k-p][1]) then  begin
xc[k]:=floattostr(strtofloat(x[k-p1])+((ma7+ma1_con)/ma7)*(strtofloat(x[k-p])-strtofloat(x[k-p1])));
yc[k]:=floattostr(strtofloat(y[k-p1])+((ma7+ma1_con)/ma7)*(strtofloat(y[k-p])-strtofloat(y[k-p1])));
zc[k]:=floattostr(strtofloat(z[k-p1])+((ma7+ma1_con)/ma7)*(strtofloat(z[k-p])-strtofloat(z[k-p1])));
tret:=k-p1;
end;
if  (k-p1<k-p) and (atom[k-p][1]+atom[k-p][2]=atom[k-p][1]+atom[k-p1][1]) then  begin
xc[k]:=floattostr(strtofloat(x[k-p1])+((ma7+ma1_con)/ma7)*(strtofloat(x[k-p])-strtofloat(x[k-p1])));
yc[k]:=floattostr(strtofloat(y[k-p1])+((ma7+ma1_con)/ma7)*(strtofloat(y[k-p])-strtofloat(y[k-p1])));
zc[k]:=floattostr(strtofloat(z[k-p1])+((ma7+ma1_con)/ma7)*(strtofloat(z[k-p])-strtofloat(z[k-p1])));
tret:=k-p1;
end;
end;
end;
end;

if res=true then begin
xc[k]:=floattostr(strtofloat(x[j])+((ma7+ma1_con)/ma7)*(strtofloat(x[i])-strtofloat(x[j])));
yc[k]:=floattostr(strtofloat(y[j])+((ma7+ma1_con)/ma7)*(strtofloat(y[i])-strtofloat(y[j])));
zc[k]:=floattostr(strtofloat(z[j])+((ma7+ma1_con)/ma7)*(strtofloat(z[i])-strtofloat(z[j])));
tret:=j;
end;




for p:=1 to k-1 do  begin
if atom[k][4]=atom[k-p][1] then begin
x_x[k]:=x[k-p];
y_y[k]:=y[k-p];
z_z[k]:=z[k-p];
break;
end;
end;





ma2:=ma7+ma1_con;  //������ ������+����� ����� 2-3
ma3:=ma2/cos((180-ma9)*pi/180); //���������� ������������� ������������ ��� ����������� ����� 1-2
if abs(ma3)<1E+8 then begin
if ma3>0 then begin
x4_4[k]:=floattostr(strtofloat(x_x[k])+((ma3+ma8)/ma8)*(strtofloat(x[tret])-strtofloat(x_x[k])));
y4_4[k]:=floattostr(strtofloat(y_y[k])+((ma3+ma8)/ma8)*(strtofloat(y[tret])-strtofloat(y_y[k])));
z4_4[k]:=floattostr(strtofloat(z_z[k])+((ma3+ma8)/ma8)*(strtofloat(z[tret])-strtofloat(z_z[k])));
end;
if ma3<0 then begin
x4_4[k]:=floattostr(strtofloat(x[j])+((abs(ma3))/ma8)*(strtofloat(x[l])-strtofloat(x[j])));
y4_4[k]:=floattostr(strtofloat(y[j])+((abs(ma3))/ma8)*(strtofloat(y[l])-strtofloat(y[j])));
z4_4[k]:=floattostr(strtofloat(z[j])+((abs(ma3))/ma8)*(strtofloat(z[l])-strtofloat(z[j])));
end;
ma4:=(ma3*sin((180-ma9)*pi/180)); //����� ���������������� ������������
ma5:=ma4-ma10*cos((180-strtofloat(variab_z[k][3]))*pi/180); //���������� �� ����� ����������� ���������� ���������������� ������������ �� ����������� ��������� ������
if abs(strtofloat(variab_z[k][3]))>=90 then x_int[k]:=floattostr(strtofloat(x4_4[k])+(ma5/ma4)*(strtofloat(xc[k])-strtofloat(x4_4[k])))
else  x_int[k]:=floattostr(strtofloat(x4_4[k])+(ma5/ma4)*(strtofloat(xc[k])-strtofloat(x4_4[k])));
if abs(strtofloat(variab_z[k][3]))>=90 then y_int[k]:=floattostr(strtofloat(y4_4[k])+(ma5/ma4)*(strtofloat(yc[k])-strtofloat(y4_4[k])))
else  y_int[k]:=floattostr(strtofloat(y4_4[k])+(ma5/ma4)*(strtofloat(yc[k])-strtofloat(y4_4[k])));
if abs(strtofloat(variab_z[k][3]))>=90 then z_int[k]:=floattostr(strtofloat(z4_4[k])+(ma5/ma4)*(strtofloat(zc[k])-strtofloat(z4_4[k])))
else  z_int[k]:=floattostr(strtofloat(z4_4[k])+(ma5/ma4)*(strtofloat(zc[k])-strtofloat(z4_4[k])));
end
else begin
ma3:= abs(ma10-ma10*abs(cos(strtofloat(variab_z[k][3])*pi/180)));
if ma3>0.000000000001 then
ma3:=(ma7/(ma10-ma10*abs(cos(strtofloat(variab_z[k][3])*pi/180))))*ma10 //����� ������������ ������������ (�������� ����������� ��� �����)



else begin

if  (rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180))<=ma8) and  (strtofloat(variab_z[k][3])<=90)   then begin
x4_4[k]:=floattostr(strtofloat(x[j])+(( rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma8)*(strtofloat(x[l])-strtofloat(x[j])));
y4_4[k]:=floattostr(strtofloat(y[j])+(( rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma8)*(strtofloat(y[l])-strtofloat(y[j])));
z4_4[k]:=floattostr(strtofloat(z[j])+(( rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma8)*(strtofloat(z[l])-strtofloat(z[j])));


ma13:= sqrt(power(ma2,2)+power(ma8,2)-2*ma2*ma8*cos(ma9*pi/180));  //������������ ����������
ma14:=   arccos((power(ma8,2)+power(ma13,2)-power(ma2,2))/(2*ma8*ma13))  *(180/pi);
ma15:=ma8-rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180));
ma16:= ma15/cos(ma14*pi/180);
ma17:= ma15*tan(ma14*pi/180);

if (abs(ma13)<1E-10) or (abs(ma17)<1E-10) then goto 11;

x4_4_4[k]:=floattostr(strtofloat(x[l])+(ma16/ma13)*(strtofloat(xc[k])-strtofloat(x[l])));
y4_4_4[k]:=floattostr(strtofloat(y[l])+(ma16/ma13)*(strtofloat(yc[k])-strtofloat(y[l])));
z4_4_4[k]:=floattostr(strtofloat(z[l])+(ma16/ma13)*(strtofloat(zc[k])-strtofloat(z[l])));

x_int[k]:=floattostr(strtofloat(x4_4[k])+(ma2/ma17)*(strtofloat(x4_4_4[k])-strtofloat(x4_4[k])));
y_int[k]:=floattostr(strtofloat(y4_4[k])+(ma2/ma17)*(strtofloat(y4_4_4[k])-strtofloat(y4_4[k])));
z_int[k]:=floattostr(strtofloat(z4_4[k])+(ma2/ma17)*(strtofloat(z4_4_4[k])-strtofloat(z4_4[k])));
end;

if  (rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180))>ma8) and  (strtofloat(variab_z[k][3])<=90) then begin
x4_4[k]:=floattostr(strtofloat(x[j])+(( rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma8)*(strtofloat(x[l])-strtofloat(x[j])));
y4_4[k]:=floattostr(strtofloat(y[j])+(( rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma8)*(strtofloat(y[l])-strtofloat(y[j])));
z4_4[k]:=floattostr(strtofloat(z[j])+(( rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180)*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma8)*(strtofloat(z[l])-strtofloat(z[j])));


ma13:= sqrt(power(ma2,2)+power(ma8,2)-2*ma2*ma8*cos(ma9*pi/180));  //������������ ����������
ma14:=   arccos((power(ma8,2)+power(ma13,2)-power(ma2,2))/(2*ma8*ma13))  *(180/pi);
ma15:=ma8-rab[k][1]*cos((strtofloat(variab_z[k][2])-90)*pi/180);
ma16:= ma15/cos(ma14*pi/180);
ma17:= ma15*tan(ma14*pi/180);


x4_4_4[k]:=floattostr(strtofloat(xc[k])+((abs(ma16)+ma13)/ma13) *(strtofloat(x[l])-strtofloat(xc[k])));
y4_4_4[k]:=floattostr(strtofloat(yc[k])+((abs(ma16)+ma13)/ma13)*(strtofloat(y[l])-strtofloat(yc[k])));
z4_4_4[k]:=floattostr(strtofloat(zc[k])+((abs(ma16)+ma13)/ma13)*(strtofloat(z[l])-strtofloat(zc[k])));

x_int[k]:=floattostr(strtofloat(x4_4_4[k])+((ma2+abs(ma17))/abs(ma17))*(strtofloat(x4_4[k])-strtofloat(x4_4_4[k])));
y_int[k]:=floattostr(strtofloat(y4_4_4[k])+((ma2+abs(ma17))/abs(ma17))*(strtofloat(y4_4[k])-strtofloat(y4_4_4[k])));
z_int[k]:=floattostr(strtofloat(z4_4_4[k])+((ma2+abs(ma17))/abs(ma17))*(strtofloat(z4_4[k])-strtofloat(z4_4_4[k])));
end;



if    strtofloat(variab_z[k][3])>90 then begin

ma11:=ma10*abs(cos(strtofloat(variab_z[k][3])*pi/180))+ma8;
ma12:=sqrt(power(ma2,2)+power(ma11,2));
ma13:= arccos((power(ma12,2)+power(ma11,2)-power(ma2,2))/(2*ma11*ma12))*(180/pi);
ma14:= ma10*abs(cos(strtofloat(variab_z[k][3])*pi/180))*tan(ma13*pi/180);
ma15:= ma10*abs(cos(strtofloat(variab_z[k][3])*pi/180))/cos(ma13*pi/180);
x4_4[k]:=floattostr(strtofloat(xc[k])+((ma14)/(ma2)) *(strtofloat(x[j])-strtofloat(xc[k])));
y4_4[k]:=floattostr(strtofloat(yc[k])+((ma14)/(ma2)) *(strtofloat(y[j])-strtofloat(yc[k])));
z4_4[k]:=floattostr(strtofloat(zc[k])+((ma14)/(ma2)) *(strtofloat(z[j])-strtofloat(zc[k])));
x_int[k]:=floattostr(strtofloat(x[l])+(ma12/(ma12-ma15)) *(strtofloat(x4_4[k])-strtofloat(x[l])));
y_int[k]:=floattostr(strtofloat(y[l])+(ma12/(ma12-ma15)) *(strtofloat(y4_4[k])-strtofloat(y[l])));
z_int[k]:=floattostr(strtofloat(z[l])+(ma12/(ma12-ma15)) *(strtofloat(z4_4[k])-strtofloat(z[l])));


end;


xf[k]:=floattostr(2*strtofloat(x_int[k]));
yf[k]:=floattostr(2*strtofloat(y_int[k]));
zf[k]:=floattostr(2*strtofloat(z_int[k]));






goto 11;
end;
x4_4[k]:=floattostr(strtofloat(x[i])+(ma3/ma7)*(strtofloat(x[j])-strtofloat(x[i])));     //��������������� ���������� ������������ �����
y4_4[k]:=floattostr(strtofloat(y[i])+(ma3/ma7)*(strtofloat(y[j])-strtofloat(y[i])));
z4_4[k]:=floattostr(strtofloat(z[i])+(ma3/ma7)*(strtofloat(z[j])-strtofloat(z[i])));
x_x[k]:=floattostr(strtofloat(x[j])+((ma10*cos(strtofloat(variab_z[k][3])*pi/180))/ma8)*(strtofloat(x[l])-strtofloat(x[j]))); //���������� ����� �� ����� j-l, ���������� ��� ��������� ����������� ������������� ������� ��� ����� i-j
y_y[k]:=floattostr(strtofloat(y[j])+((ma10*cos(strtofloat(variab_z[k][3])*pi/180))/ma8)*(strtofloat(y[l])-strtofloat(y[j])));
z_z[k]:=floattostr(strtofloat(z[j])+((ma10*cos(strtofloat(variab_z[k][3])*pi/180))/ma8)*(strtofloat(z[l])-strtofloat(z[j])));
ma13:=sqrt(power((ma3-ma7),2)+ power(ma10*cos(strtofloat(variab_z[k][3])*pi/180),2));     //���������� ������������� ������������
ma14:=sqrt(power(ma3,2)+power(ma10,2)); //���������� ������� ������������ ������������
x4_4_4[k]:=floattostr(strtofloat(x4_4[k])+(ma14/ma13)* (strtofloat(x_x[k])-strtofloat(x4_4[k])));
y4_4_4[k]:=floattostr(strtofloat(y4_4[k])+(ma14/ma13)* (strtofloat(y_y[k])-strtofloat(y4_4[k])));
z4_4_4[k]:=floattostr(strtofloat(z4_4[k])+(ma14/ma13)* (strtofloat(z_z[k])-strtofloat(z4_4[k])));
x_int[k]:= floattostr(strtofloat(x[i])+ ((ma10*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma10)*(strtofloat(x4_4_4[k])-strtofloat(x[i]))) ;
y_int[k]:= floattostr(strtofloat(y[i])+ ((ma10*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma10)*(strtofloat(y4_4_4[k])-strtofloat(y[i]))) ;
z_int[k]:= floattostr(strtofloat(z[i])+ ((ma10*abs(cos(strtofloat(variab_z[k][3])*pi/180)))/ma10)*(strtofloat(z4_4_4[k])-strtofloat(z[i]))) ;

x_int[k]:= floattostr(strtofloat(x_x[k])+ ((ma7 + rab[k][1]*cos((180-strtofloat(variab_z[k][2]))*pi/180))/ma7)*(strtofloat(x_int[k])-strtofloat(x_x[k]))) ;
y_int[k]:= floattostr(strtofloat(y_y[k])+ ((ma7 + rab[k][1]*cos((180-strtofloat(variab_z[k][2]))*pi/180))/ma7)*(strtofloat(y_int[k])-strtofloat(y_y[k]))) ;
z_int[k]:= floattostr(strtofloat(z_z[k])+ ((ma7 + rab[k][1]*cos((180-strtofloat(variab_z[k][2]))*pi/180))/ma7)*(strtofloat(z_int[k])-strtofloat(z_z[k]))) ;

end;



xf[k]:=floattostr(2*strtofloat(x_int[k]));
yf[k]:=floattostr(2*strtofloat(y_int[k]));
zf[k]:=floattostr(2*strtofloat(z_int[k]));



//*****************************************************************************************



end;





11:



///////////////////////�������� ����������////////////////////////////////////////////
if (rab[k][3]>0) or (rab[k][3]<=0) then begin
ma1_con:=rab[k][1]*cos((180-strtofloat(variab_z[k][2]))*pi/180);
ma18:=   sqrt(power((strtofloat(x[i])-strtofloat(x[l])),2)+ power((strtofloat(y[i])-strtofloat(y[l])),2)+power((strtofloat(z[i])-strtofloat(z[l])),2));
ma19:=   sqrt(power((strtofloat(x[i])-strtofloat(x[j])),2)+ power((strtofloat(y[i])-strtofloat(y[j])),2)+power((strtofloat(z[i])-strtofloat(z[j])),2));
ma20:=   sqrt(power((strtofloat(x[l])-strtofloat(x[j])),2)+ power((strtofloat(y[l])-strtofloat(y[j])),2)+power((strtofloat(z[l])-strtofloat(z[j])),2));
ma9:=  (arccos((power(ma18,2)+power(ma19,2)-power(ma20,2))/(2*ma18*ma19)) )*180/pi;
ma17:=  (arccos((power(ma19,2)+power(ma20,2)-power(ma18,2))/(2*ma19*ma20)) )*180/pi;
if power(ma18,2)+power(rab[k][1],2)-2*ma18*rab[k][1]*cos((360-ma9-strtofloat(variab_z[k][2]))*pi/180)<0 then ma16:=0
else ma16:= sqrt(power(ma18,2)+power(rab[k][1],2)-2*ma18*rab[k][1]*cos((360-ma9-strtofloat(variab_z[k][2]))*pi/180));
ma15:=strtofloat(variab_z[k][1])*sin((180-strtofloat(variab_z[k][2]))*pi/180);   //������
ma14:=ma18*cos((ma9-90)*pi/180);  //�������� ����� 1-3 �� ��������� ������
if power(ma14,2)+power(ma15,2)-2*ma14*ma15*cos((strtofloat(variab_z[k][3]))*pi/180)<0 then ma13:=0
else ma13:=sqrt(power(ma14,2)+power(ma15,2)-2*ma14*ma15*cos((strtofloat(variab_z[k][3]))*pi/180));   //�����������
if ma1_con>0 then begin
if (ma18*cos((180-ma9)*pi/180)>=0) and (ma18*cos((180-ma9)*pi/180)>ma1_con)  then ma12:=ma18*cos((180-ma9)*pi/180)-ma1_con;    //������������ �����
if (ma18*cos((180-ma9)*pi/180)>=0) and (ma18*cos((180-ma9)*pi/180)<=ma1_con)  then ma12:=ma1_con-ma18*cos((180-ma9)*pi/180);   //������������ �����
if ma18*cos((180-ma9)*pi/180)<0  then ma12:=ma1_con-ma18*cos((180-ma9)*pi/180);
end;
if ma1_con<0 then begin
if ma18*cos((180-ma9)*pi/180)>=0 then ma12:=ma18*cos((180-ma9)*pi/180)-ma1_con;
if (ma18*cos((180-ma9)*pi/180)<0) and (ma18*cos((180-ma9)*pi/180)<=abs(ma1_con)) then ma12:=ma18*cos((180-ma9)*pi/180)-ma1_con;
if (ma18*cos((180-ma9)*pi/180)<0) and (ma18*cos((180-ma9)*pi/180)>abs(ma1_con)) then ma12:=ma1_con-ma18*cos((180-ma9)*pi/180);
end;



rab[k][3]:= sqrt(power(ma12,2)+power(ma13,2));


end;

////////////////////����� �������� ����������/////////////////////////////////////////


if (zflag[nomer_atoma]<>'0') and (zflag[nomer_atoma]<>'') then  begin    //�������������� ������� z-�������
ma20:= sqrt(power((strtofloat(x[l])-strtofloat(x[i])),2)+ power((strtofloat(y[l])-strtofloat(y[i])),2)+power((strtofloat(z[l])-strtofloat(z[i])),2));
if power(rab[k][1],2)+power(ma20,2)-2*rab[k][1]*ma20*cos(strtofloat(variab_z[k][3])*pi/180)>=0 then rab[k][3]:=sqrt(power(rab[k][1],2)+power(ma20,2)-2*rab[k][1]*ma20*cos(strtofloat(variab_z[k][3])*pi/180))
else rab[k][3]:=0;
end;





ma2:=(power(rab[k][1],2)-power(rab[k][2],2)-power(strtofloat(x[i]),2)+power(strtofloat(x[j]),2)-power(strtofloat(y[i]),2)+power(strtofloat(y[j]),2)-power(strtofloat(z[i]),2)+power(strtofloat(z[j]),2))/2; //������������� ��������� ��� ������� ������� � ����� ������������
ma3:=(power(rab[k][2],2)-power(rab[k][3],2)-power(strtofloat(x[j]),2)+power(strtofloat(x[l]),2)-power(strtofloat(y[j]),2)+power(strtofloat(y[l]),2)-power(strtofloat(z[j]),2)+power(strtofloat(z[l]),2))/2; //������������� ��������� ��� ������� ������� � ����� ������������
//������������� ��������� ��� ������� ������� � ����� ������������
//�������!!!if p_pr=1 then ma4:=(power(rab[k][3],2)-power(rab[k][4],2)-power(strtofloat(x[l]),2)+power(strtofloat(xc[k]),2)-power(strtofloat(y[l]),2)+power(strtofloat(yc[k]),2)-power(strtofloat(z[l]),2)+power(strtofloat(zc[k]),2))/2;
//�������!!!if p_pr=2 then ma4:=(power(rab[k][1],2)-power(rab[k][3],2)-power(strtofloat(x[i]),2)+power(strtofloat(x[l]),2)-power(strtofloat(y[i]),2)+power(strtofloat(y[l]),2)-power(strtofloat(z[i]),2)+power(strtofloat(z[l]),2))/2;   //������ ���������

//�������!!!if p_pr=2 then ma5:=((((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))-(strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i])))*((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[i]))-(strtofloat(y[l])-strtofloat(y[i]))*(strtofloat(x[j])-strtofloat(x[i]))))-(((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))-(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i])))*((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[i]))-(strtofloat(z[l])-strtofloat(z[i]))*(strtofloat(x[j])-strtofloat(x[i])))));


//if p_pr=1 then ma5:=((strtofloat(x[j])-strtofloat(x[i]))*(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(zc[k])-strtofloat(z[l])))   +    ((strtofloat(x[l])-strtofloat(x[j]))*(strtofloat(yc[k])-strtofloat(y[l]))*(strtofloat(z[j])-strtofloat(z[i])))  +     ((strtofloat(xc[k])-strtofloat(x[l]))*(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(z[l])-strtofloat(z[j])))   -            ((strtofloat(xc[k])-strtofloat(x[l]))*(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(z[j])-strtofloat(z[i])))   -       ((strtofloat(x[l])-strtofloat(x[j]))*(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(zc[k])-strtofloat(z[l])))    -                ((strtofloat(x[j])-strtofloat(x[i]))*(strtofloat(yc[k])-strtofloat(y[l]))*(strtofloat(z[l])-strtofloat(z[j])));

//if (ma5=0) or (abs(ma5)<0.01) then begin
//ma6:=(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(z[l])-strtofloat(z[j]))-(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(z[j])-strtofloat(z[i])); //������������ ��� ������ ������������� �������

//if ma6<>0 then
//begin

//end;
//if abs(ma6)<0.01 then
//begin
//ma6:=(strtofloat(x[j])-strtofloat(x[i]))*(strtofloat(y[l])-strtofloat(y[j]))-(strtofloat(x[l])-strtofloat(x[j]))*(strtofloat(y[j])-strtofloat(y[i]));


//end;







///////////////////////////������������ ����� (������ �������)/////////////////////////
Application.ProcessMessages;


res:=false;
res1:=false;
if k>3 then begin
mx:=1.0E50;
my:=1.0E50;
mz:=1.0E50;
ma7:=0.0;
ma10:=0.0;



for p1:=-2 to 20 do begin
for p:=-9 to 9 do begin


x[k]:=floattostr(ma10+p/power(10,p1));
if abs((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])) - (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i])))>0.000000001  then
y[k]:=floattostr((ma3*(strtofloat(z[j])-strtofloat(z[i]))  - ma2*(strtofloat(z[l])-strtofloat(z[j]))  +  (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k])  -   (strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k]))  /   ((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])) - (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i]))))
else begin
y[k]:=x[k];
res:=true;
res1:=false;
if abs((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i])))>0.00000001 then
x[k]:=floattostr((strtofloat(y[k])* ((strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i])) -(strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])))+(strtofloat(z[j])-strtofloat(z[i]))*ma3-(strtofloat(z[l])-strtofloat(z[j]))*ma2)   /  ((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i]))));
if abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001 then begin
z[k]:= floattostr((ma2-(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(y[k])-(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k]))/ (strtofloat(z[j])-strtofloat(z[i])));
goto 8;
end;
if abs(strtofloat(z[l])-strtofloat(z[j]))>0.0000001 then begin
z[k]:= floattostr((ma3-(strtofloat(y[l])-strtofloat(y[j]))*strtofloat(y[k])-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k]))/ (strtofloat(z[l])-strtofloat(z[j])));
goto 8;
end;
end;


if   (abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001) then
if abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001 then begin
z[k]:= floattostr((ma2-(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(y[k])-(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k]))/ (strtofloat(z[j])-strtofloat(z[i])));
goto  8;
end;
if abs(strtofloat(z[l])-strtofloat(z[j]))>0.0000001 then begin
z[k]:= floattostr((ma3-(strtofloat(y[l])-strtofloat(y[j]))*strtofloat(y[k])-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k]))/ (strtofloat(z[l])-strtofloat(z[j])));
goto  8;
end;

if (abs(strtofloat(z[j])-strtofloat(z[i]))<0.0000001)  and  (abs(strtofloat(z[l])-strtofloat(z[j]))<0.0000001) then begin
z[k]:=x[k];
res1:=true;
res:=false;
if  abs((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i])))>0.000001 then
x[k]:=  floattostr((strtofloat(z[k])* ((strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(z[j])-strtofloat(z[i])) -(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(z[l])-strtofloat(z[j])))+(strtofloat(y[j])-strtofloat(y[i]))*ma3-(strtofloat(y[l])-strtofloat(y[j]))*ma2)   /  ((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i]))));
if  abs(strtofloat(y[l])-strtofloat(y[j]))>0.0000001 then  begin
y[k]:=  floattostr((ma3-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k])-(strtofloat(z[l])-strtofloat(z[j]))*strtofloat(z[k]))/ (strtofloat(y[l])-strtofloat(y[j])));
goto 8;
end;
if  abs(strtofloat(y[j])-strtofloat(y[i]))>0.0000001 then  y[k]:= floattostr((ma2-(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k])-(strtofloat(z[j])-strtofloat(z[i]))*strtofloat(z[k]))/ (strtofloat(y[j])-strtofloat(y[i])));

end;
8:




ma1:=sqrt(power((strtofloat(x[k])-strtofloat(x[i])),2)+power((strtofloat(y[k])-strtofloat(y[i])),2)+power((strtofloat(z[k])-strtofloat(z[i])),2));
ma8:=sqrt(power((strtofloat(x[k])-strtofloat(x[j])),2)+power((strtofloat(y[k])-strtofloat(y[j])),2)+power((strtofloat(z[k])-strtofloat(z[j])),2));
ma9:=sqrt(power((strtofloat(x[k])-strtofloat(x[l])),2)+power((strtofloat(y[k])-strtofloat(y[l])),2)+power((strtofloat(z[k])-strtofloat(z[l])),2));






ma41:=abs(ma1-rab[k][1]);
ma5:=abs(ma8-rab[k][2]);
ma6:=abs(ma9-rab[k][3]);


if sqrt(power(ma41,2)+power(ma5,2)+power(ma6,2))<sqrt(power(mx,2)+power(my,2)+power(mz,2)) then begin
mx:=ma41;
my:=ma5;
mz:=ma6;
iter:=p;

if (res=false) and (res1=false) then ma7:=strtofloat(x[k]);
if (res=true) and (res1=false)  then ma7:=strtofloat(y[k]);
if (res1=true) and (res=false) then  ma7:=strtofloat(z[k]);

end;
end;
ma10:=ma7;
end;
end;

////////////////////////////����� ������������ �����/////////////////////////////////////////

//**************************************************************************************/////

////////////////////////////�������� ���������� ������ ��������/////////////////////////////

Det:=  (strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]))  +  (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]))  +  (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i])) - (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i])) - (strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));

///////////////////////////////////////////////////////////////////////////////////////////


if (zflag[k]='0') or (zflag[k]='') then  begin    //�������������� ������� z-�������
if (Det<0) and (sin(strtofloat(variab_z[k][3])*pi/180)<=0)    then  goto 6;
if (Det>0) and (sin(strtofloat(variab_z[k][3])*pi/180)>=0)    then goto 6;
//if (abs(Det)<1E-2) and (abs(strtofloat(variab_z[k][3]))<0.00001) then goto 6;
//if (abs(Det)<1E-2) and (abs(strtofloat(variab_z[k][3])-180)<0.00001) then goto 6;
end;

if (zflag[k]<>'0') and (zflag[k]<>'') then  begin    //�������������� ������� z-�������
if (Det<0) and (strtoint(zflag[k])>0) then  goto 6;
if (Det>0) and (strtoint(zflag[k])<0) then goto 6;
end;



if (xf[k]<>'') and  (yf[k]<>'') and (zf[k]<>'') then begin
x[k]:=floattostr(strtofloat(xf[k])-strtofloat(x[k]));
y[k]:=floattostr(strtofloat(yf[k])-strtofloat(y[k]));
z[k]:=floattostr(strtofloat(zf[k])-strtofloat(z[k]));
end
else goto 17;


if  ( abs(sqrt(power((strtofloat(x[k])-strtofloat(x[i])),2)+power((strtofloat(y[k])-strtofloat(y[i])),2)+power((strtofloat(z[k])-strtofloat(z[i])),2))-rab[k][1])<0.00000001) and

    (abs(sqrt(power((strtofloat(x[k])-strtofloat(x[j])),2)+power((strtofloat(y[k])-strtofloat(y[j])),2)+power((strtofloat(z[k])-strtofloat(z[j])),2))-rab[k][2])<0.00000001)  and

    (abs(sqrt(power((strtofloat(x[k])-strtofloat(x[l])),2)+power((strtofloat(y[k])-strtofloat(y[l])),2)+power((strtofloat(z[k])-strtofloat(z[l])),2))-rab[k][3])<0.00000001) then goto 6;






/////////////////////////////������ ������ ��������//////////////////////////////////////////////


Application.ProcessMessages;
res:=false;
res1:=false;
if k>3 then begin
mx:=1.0E50;
my:=1.0E50;
mz:=1.0E50;
ma7:=0.0;
ma10:=0.0;
Det_2:=1E+50;



for p1:=-2 to 20 do begin
for p:=-9 to 9 do begin


x[k]:=floattostr((ma10+p/power(10,p1)));
if abs((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])) - (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i])))>0.000000001  then
y[k]:=floattostr((ma3*(strtofloat(z[j])-strtofloat(z[i]))  - ma2*(strtofloat(z[l])-strtofloat(z[j]))  +  (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k])  -   (strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k]))  /   ((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])) - (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i]))))
else begin
y[k]:=x[k];
res:=true;
res1:=false;
if abs((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i])))>0.00000001 then
x[k]:=floattostr((strtofloat(y[k])* ((strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i])) -(strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])))+(strtofloat(z[j])-strtofloat(z[i]))*ma3-(strtofloat(z[l])-strtofloat(z[j]))*ma2)   /  ((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i]))));
if abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001 then begin
z[k]:= floattostr((ma2-(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(y[k])-(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k]))/ (strtofloat(z[j])-strtofloat(z[i])));
goto 15;
end;
if abs(strtofloat(z[l])-strtofloat(z[j]))>0.0000001 then begin
z[k]:= floattostr((ma3-(strtofloat(y[l])-strtofloat(y[j]))*strtofloat(y[k])-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k]))/ (strtofloat(z[l])-strtofloat(z[j])));
goto 15;
end;
end;


if   (abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001) then
if abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001 then begin
z[k]:= floattostr((ma2-(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(y[k])-(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k]))/ (strtofloat(z[j])-strtofloat(z[i])));
goto  15;
end;
if abs(strtofloat(z[l])-strtofloat(z[j]))>0.0000001 then begin
z[k]:= floattostr((ma3-(strtofloat(y[l])-strtofloat(y[j]))*strtofloat(y[k])-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k]))/ (strtofloat(z[l])-strtofloat(z[j])));
goto  15;
end;

if (abs(strtofloat(z[j])-strtofloat(z[i]))<0.0000001)  and  (abs(strtofloat(z[l])-strtofloat(z[j]))<0.0000001) then begin
z[k]:=x[k];
res1:=true;
res:=false;
if  abs((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i])))>0.000001 then
x[k]:=  floattostr((strtofloat(z[k])* ((strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(z[j])-strtofloat(z[i])) -(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(z[l])-strtofloat(z[j])))+(strtofloat(y[j])-strtofloat(y[i]))*ma3-(strtofloat(y[l])-strtofloat(y[j]))*ma2)   /  ((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i]))));
if  abs(strtofloat(y[l])-strtofloat(y[j]))>0.0000001 then  begin
y[k]:=  floattostr((ma3-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k])-(strtofloat(z[l])-strtofloat(z[j]))*strtofloat(z[k]))/ (strtofloat(y[l])-strtofloat(y[j])));
goto 15;
end;
if  abs(strtofloat(y[j])-strtofloat(y[i]))>0.0000001 then  y[k]:= floattostr((ma2-(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k])-(strtofloat(z[j])-strtofloat(z[i]))*strtofloat(z[k]))/ (strtofloat(y[j])-strtofloat(y[i])));

end;
15:




ma1:=sqrt(power((strtofloat(x[k])-strtofloat(x[i])),2)+power((strtofloat(y[k])-strtofloat(y[i])),2)+power((strtofloat(z[k])-strtofloat(z[i])),2));
ma8:=sqrt(power((strtofloat(x[k])-strtofloat(x[j])),2)+power((strtofloat(y[k])-strtofloat(y[j])),2)+power((strtofloat(z[k])-strtofloat(z[j])),2));
ma9:=sqrt(power((strtofloat(x[k])-strtofloat(x[l])),2)+power((strtofloat(y[k])-strtofloat(y[l])),2)+power((strtofloat(z[k])-strtofloat(z[l])),2));
Detx:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]))  +  (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]))  +  (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i])) - (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i])) - (strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));




ma41:=abs(ma1-rab[k][1]);
ma5:=abs(ma8-rab[k][2]);
ma6:=abs(ma9-rab[k][3]);
Det_1:=abs(Detx*(-1.0)-Det);


if (sqrt(power(ma41,2)+power(ma5,2)+power(ma6,2))<sqrt(power(mx,2)+power(my,2)+power(mz,2))) and  (Det_1< Det_2) then begin


mx:=ma41;
my:=ma5;
mz:=ma6;
Det_2:=Det_1;
iter:=p;

if (res=false) and (res1=false) then ma7:=strtofloat(x[k]);
if (res=true) and (res1=false)  then ma7:=strtofloat(y[k]);
if (res1=true) and (res=false) then  ma7:=strtofloat(z[k]);


end;
end;
ma10:=ma7;
end;
end;


//////////////////////////////////����� ������� ������������� ��������///////////////////////





if  ( abs(sqrt(power((strtofloat(x[k])-strtofloat(x[i])),2)+power((strtofloat(y[k])-strtofloat(y[i])),2)+power((strtofloat(z[k])-strtofloat(z[i])),2))-rab[k][1])<0.00001) and

    (abs(sqrt(power((strtofloat(x[k])-strtofloat(x[j])),2)+power((strtofloat(y[k])-strtofloat(y[j])),2)+power((strtofloat(z[k])-strtofloat(z[j])),2))-rab[k][2])<0.00001)  and

    (abs(sqrt(power((strtofloat(x[k])-strtofloat(x[l])),2)+power((strtofloat(y[k])-strtofloat(y[l])),2)+power((strtofloat(z[k])-strtofloat(z[l])),2))-rab[k][3])<0.00001) and (abs(Detx*(-1.0)-Det)<0.00001) then goto 6


else  begin





////////////////////////////////////////////������ ���� ��������////////////////////////////////////////////////////////

17:
Application.ProcessMessages;
res:=false;
res1:=false;
if k>3 then begin
mx:=1.0E50;
my:=1.0E50;
mz:=1.0E50;
ma7:=0.0;
ma10:=0.0;
Det_2:=1E+50;



for p1:=-2 to 20 do begin
for p:=-9 to 9 do begin


x[k]:=floattostr((ma10+p/power(10,p1)));
if abs((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])) - (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i])))>0.000000001  then  begin
y[k]:=floattostr((ma3*(strtofloat(z[j])-strtofloat(z[i]))  - ma2*(strtofloat(z[l])-strtofloat(z[j]))  +  (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k])  -   (strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k]))  /   ((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])) - (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i]))));

ma16:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma11:=(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma12:=(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
ma13:=-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma14:=-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma15:=-(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));

if abs((strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) )>0.0000001 then
z[k]:=floattostr((Det*(-1)-ma16-ma12-ma14-ma15 + (strtofloat(x[l])-strtofloat(x[i]))*(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(z[i])   +  (-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i]))*strtofloat(z[i]))) /      ((strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) )    )
else begin
if (abs(strtofloat(x[l])-strtofloat(x[j]))<1E-5) and  (abs(strtofloat(y[l])-strtofloat(y[j]))<1E-5) then
z[k]:=floattostr(ma3/(strtofloat(z[l])-strtofloat(z[j])));
goto 16;
end;







//***************************************************************************************

if abs((strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) )<=0.0000001 then
begin
z[k]:=x[k];
res1:=true;
res:=false;
if  abs((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i])))>0.000001 then
x[k]:=  floattostr((strtofloat(z[k])* ((strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(z[j])-strtofloat(z[i])) -(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(z[l])-strtofloat(z[j])))+(strtofloat(y[j])-strtofloat(y[i]))*ma3-(strtofloat(y[l])-strtofloat(y[j]))*ma2)   /  ((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i]))));

if  abs((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i])))<=0.000001 then begin
//y[k]:=floattostr((ma3*(strtofloat(z[j])-strtofloat(z[i]))  - ma2*(strtofloat(z[l])-strtofloat(z[j]))  +  (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k])  -   (strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k]))  /   ((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])) - (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i]))));
//y[k]:=  floattostr((ma3-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k])-(strtofloat(z[l])-strtofloat(z[j]))*strtofloat(z[k]))/ (strtofloat(y[l])-strtofloat(y[j])));
if  abs((strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i]))-(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j])))>0.000001 then
y[k]:=  floattostr((ma3*(strtofloat(x[j])-strtofloat(x[i]))-ma2*(strtofloat(x[l])-strtofloat(x[j])) + strtofloat(z[k])* ((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))- (strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i]))))  /  ((strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i]))-(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))));

ma16:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma11:=(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma12:=(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
ma13:=-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma14:=-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma15:=-(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
x[k]:=  floattostr((Det*(-1)-ma11-ma12-ma13-ma14 + (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]))* strtofloat(x[i]) + (-(strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]))* strtofloat(x[i])))/ ((strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]))  -   (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i])))    );

goto 16;
end;
/////y[k]:=floattostr((Det*(-1)-ma16-ma11-ma13-ma15 + (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(z[l])-strtofloat(z[i])) *strtofloat(y[i])   +  (-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(z[j])-strtofloat(z[i])) *strtofloat(y[i]))) /      (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(z[l])-strtofloat(z[i])) - (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(z[j])-strtofloat(z[i]))    )
/////z[k]:=floattostr((Det*(-1)-ma16-ma12-ma14-ma15 + (strtofloat(x[l])-strtofloat(x[i]))*(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(z[i])   +  (-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i]))*strtofloat(z[i]))) /      ((strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) )    );











if  abs(strtofloat(y[l])-strtofloat(y[j]))>0.0000001 then  begin

ma16:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma11:=(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma12:=(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
ma13:=-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma14:=-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma15:=-(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));

if (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(z[l])-strtofloat(z[i])) - (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(z[j])-strtofloat(z[i]))<>0 then
y[k]:=  floattostr((Det*(-1)-ma16-ma11-ma13-ma15 + (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(z[l])-strtofloat(z[i])) *strtofloat(y[i])   +  (-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(z[j])-strtofloat(z[i])) *strtofloat(y[i]))) /      (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(z[l])-strtofloat(z[i])) - (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(z[j])-strtofloat(z[i]))    )
else  y[k]:=  floattostr((ma3-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k])-(strtofloat(z[l])-strtofloat(z[j]))*strtofloat(z[k]))/ (strtofloat(y[l])-strtofloat(y[j])));



//y[k]:=  floattostr((ma3-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k])-(strtofloat(z[l])-strtofloat(z[j]))*strtofloat(z[k]))/ (strtofloat(y[l])-strtofloat(y[j])));
goto 16;
end;
end;


//****************************************************************************************























goto 16;
end
else begin
y[k]:=x[k];
res:=true;
res1:=false;
if abs((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i])))>0.00000001 then
x[k]:=floattostr((strtofloat(y[k])* ((strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(y[j])-strtofloat(y[i])) -(strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(y[l])-strtofloat(y[j])))+(strtofloat(z[j])-strtofloat(z[i]))*ma3-(strtofloat(z[l])-strtofloat(z[j]))*ma2)   /  ((strtofloat(z[j])-strtofloat(z[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(z[l])-strtofloat(z[j]))*(strtofloat(x[j])-strtofloat(x[i]))));
if abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001 then begin
ma16:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma11:=(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma12:=(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
ma13:=-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma14:=-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma15:=-(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
z[k]:=floattostr((Det*(-1)-ma16-ma12-ma14-ma15 + (strtofloat(x[l])-strtofloat(x[i]))*(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(z[i])   +  (-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i]))*strtofloat(z[i]))) /      ((strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) )    );
goto 16;
end;
if abs(strtofloat(z[l])-strtofloat(z[j]))>0.0000001 then begin
ma16:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma11:=(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma12:=(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
ma13:=-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma14:=-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma15:=-(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
z[k]:=floattostr((Det*(-1)-ma16-ma12-ma14-ma15 + (strtofloat(x[l])-strtofloat(x[i]))*(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(z[i])   +  (-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i]))*strtofloat(z[i]))) /      ((strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) )    );
goto 16;
end;
end;


if   (abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001) then
if abs(strtofloat(z[j])-strtofloat(z[i]))>0.0000001 then begin
ma16:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma11:=(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma12:=(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
ma13:=-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma14:=-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma15:=-(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
z[k]:=floattostr((Det*(-1)-ma16-ma12-ma14-ma15 + (strtofloat(x[l])-strtofloat(x[i]))*(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(z[i])   +  (-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i]))*strtofloat(z[i]))) /      ((strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) )    );

goto  16;
end;
if abs(strtofloat(z[l])-strtofloat(z[j]))>0.0000001 then begin
ma16:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma11:=(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma12:=(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
ma13:=-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma14:=-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma15:=-(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
z[k]:=floattostr((Det*(-1)-ma16-ma12-ma14-ma15 + (strtofloat(x[l])-strtofloat(x[i]))*(strtofloat(y[j])-strtofloat(y[i]))*strtofloat(z[i])   +  (-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i]))*strtofloat(z[i]))) /      ((strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) )    );

goto  16;
end;

if (abs(strtofloat(z[j])-strtofloat(z[i]))<0.0000001)  and  (abs(strtofloat(z[l])-strtofloat(z[j]))<0.0000001) then begin
z[k]:=x[k];
res1:=true;
res:=false;
if  abs((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i])))>0.000001 then
x[k]:=  floattostr((strtofloat(z[k])* ((strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(z[j])-strtofloat(z[i])) -(strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(z[l])-strtofloat(z[j])))+(strtofloat(y[j])-strtofloat(y[i]))*ma3-(strtofloat(y[l])-strtofloat(y[j]))*ma2)   /  ((strtofloat(y[j])-strtofloat(y[i]))*(strtofloat(x[l])-strtofloat(x[j]))  -(strtofloat(y[l])-strtofloat(y[j]))*(strtofloat(x[j])-strtofloat(x[i]))));
if  abs(strtofloat(y[l])-strtofloat(y[j]))>0.0000001 then  begin

ma16:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma11:=(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma12:=(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));
ma13:=-(strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]));
ma14:=-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]));
ma15:=-(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));

if (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(z[l])-strtofloat(z[i])) - (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(z[j])-strtofloat(z[i]))<>0 then
y[k]:=  floattostr((Det*(-1)-ma16-ma11-ma13-ma15 + (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(z[l])-strtofloat(z[i])) *strtofloat(y[i])   +  (-(strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(z[j])-strtofloat(z[i])) *strtofloat(y[i]))) /      (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(z[l])-strtofloat(z[i])) - (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(z[j])-strtofloat(z[i]))    )
else  y[k]:=  floattostr((ma3-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k])-(strtofloat(z[l])-strtofloat(z[j]))*strtofloat(z[k]))/ (strtofloat(y[l])-strtofloat(y[j])));



//y[k]:=  floattostr((ma3-(strtofloat(x[l])-strtofloat(x[j]))*strtofloat(x[k])-(strtofloat(z[l])-strtofloat(z[j]))*strtofloat(z[k]))/ (strtofloat(y[l])-strtofloat(y[j])));
goto 16;
end;
if  abs(strtofloat(y[j])-strtofloat(y[i]))>0.0000001 then  y[k]:= floattostr((ma2-(strtofloat(x[j])-strtofloat(x[i]))*strtofloat(x[k])-(strtofloat(z[j])-strtofloat(z[i]))*strtofloat(z[k]))/ (strtofloat(y[j])-strtofloat(y[i])));

end;
16:


//showmessage(inttostr(k)+'   '+floattostr(power((strtofloat(x[k])-strtofloat(x[i])),2)+power((strtofloat(y[k])-strtofloat(y[i])),2)+power((strtofloat(z[k])-strtofloat(z[i])),2)));


ma1:=sqrt(power((strtofloat(x[k])-strtofloat(x[i])),2)+power((strtofloat(y[k])-strtofloat(y[i])),2)+power((strtofloat(z[k])-strtofloat(z[i])),2));
ma8:=sqrt(power((strtofloat(x[k])-strtofloat(x[j])),2)+power((strtofloat(y[k])-strtofloat(y[j])),2)+power((strtofloat(z[k])-strtofloat(z[j])),2));
ma9:=sqrt(power((strtofloat(x[k])-strtofloat(x[l])),2)+power((strtofloat(y[k])-strtofloat(y[l])),2)+power((strtofloat(z[k])-strtofloat(z[l])),2));
Detx:=(strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i]))  +  (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i]))  +  (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i])) - (strtofloat(x[j])-strtofloat(x[i])) * (strtofloat(y[l])-strtofloat(y[i])) *(strtofloat(z[k])-strtofloat(z[i])) - (strtofloat(x[l])-strtofloat(x[i])) * (strtofloat(y[k])-strtofloat(y[i])) *(strtofloat(z[j])-strtofloat(z[i])) - (strtofloat(x[k])-strtofloat(x[i])) * (strtofloat(y[j])-strtofloat(y[i])) *(strtofloat(z[l])-strtofloat(z[i]));




ma41:=abs(ma1-rab[k][1]);
ma5:=abs(ma8-rab[k][2]);
ma6:=abs(ma9-rab[k][3]);
Det_1:=abs(Detx*(-1.0)-Det);


if (sqrt(power(ma41,2)+power(ma5,2)+power(ma6,2))<=sqrt(power(mx,2)+power(my,2)+power(mz,2))) then begin
mx:=ma41;
my:=ma5;
mz:=ma6;
Det_2:=Det_1;
iter:=p;
if (res=false) and (res1=false) then ma7:=strtofloat(x[k]);
if (res=true) and (res1=false)  then ma7:=strtofloat(y[k]);
if (res1=true) and (res=false) then  ma7:=strtofloat(z[k]);
if (abs((Detx*(-1)-Det))<1E-10) and (sqrt(power(mx,2)+power(my,2)+power(mz,2))<1E-12) then goto 6;
end;












end;
ma10:=ma7;
end;
end;




///////////////////////////////////////////////////////////////////////////////////////////////////////














end;







6:

rab[k][1]:=-1;
rab[k][2]:=-1;
rab[k][3]:=-1;










if (pos('.',x[k])=0) and (pos('E',x[k])=0) then x[k]:=x[k]+'.000000000000';
if (pos('.',y[k])=0) and (pos('E',y[k])=0) then y[k]:=y[k]+'.000000000000';
if (pos('.',z[k])=0) and (pos('E',z[k])=0) then z[k]:=z[k]+'.000000000000';

if (abs(strtofloat(x[k]))<0.00000000000001) and (pos('E-',x[k])<>0) then x[k]:='0.000000000000';
if (abs(strtofloat(y[k]))<0.00000000000001) and (pos('E-',y[k])<>0) then y[k]:='0.000000000000';
if (abs(strtofloat(z[k]))<0.00000000000001) and (pos('E-',z[k])<>0) then z[k]:='0.000000000000';


if copy(x[k],1,1)='.' then x[k]:='0'+x[k];
if copy(y[k],1,1)='.' then y[k]:='0'+y[k];
if copy(z[k],1,1)='.' then z[k]:='0'+z[k];
if copy(x[k],1,2)='-.' then x[k]:='-0'+copy(x[k],2,length(x[k]));
if copy(y[k],1,2)='-.' then y[k]:='-0'+copy(y[k],2,length(y[k]));
if copy(z[k],1,2)='-.' then z[k]:='-0'+copy(z[k],2,length(z[k]));


if length(x[k])<10 then  x[k]:=x[k]+copy('000000000000',1,(12-length(copy(x[k],pos('.',x[k]),length(x[k])))));
if length(y[k])<10 then  y[k]:=y[k]+copy('000000000000',1,(12-length(copy(y[k],pos('.',y[k]),length(y[k])))));
if length(z[k])<10 then  z[k]:=z[k]+copy('000000000000',1,(12-length(copy(z[k],pos('.',z[k]),length(z[k])))));

112:
end;







StatusBAr1.Panels[0].Text:='Ready';
StatusBAr1.Panels[1].Text:=inttostr(nomer_atoma) +' atoms; ' + inttostr(nomer_variabl)+' variables';
pb.BackColor:=clBtnFace;
pb.ForeColor:=clBtnFace;
pb.Visible:=False;
pb.Progress:=0;
end;    //����� �������� � Z-��������
end;    //����� ������ �����
end;    //����� case 1


  //////
  //////   OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-OUT-
  //////



case Opendialog1.FilterIndex of   //out,log-�����   ************************************************************
2:   begin
Statusbar1.Panels[0].Text:='Reading Output';
//Px:=0;

////////////��������� ���������� ����������/////////////////////////////
atomout:=nil;
atomoutel:=nil;
xout:=nil;
yout:=nil;
zout:=nil;
x:=nil;
y:=nil;
z:=nil;
typeout:=nil;
src_start:=nil;
src_route:=nil;
src_title:=nil;
src_mult:=nil;
src_geom:=nil;
x_draw_out:=nil;  //����36 ����������
y_draw_out:=nil;
z_draw_out:=nil;
nc:=0;
scr_x:=nil;  // ��������� ���������� ���������� �������� ��������� ��� ������ ������
scr_y:=nil;  // ��������� ���������� ���������� �������� ���������
scr_z:=nil;  // ��������� ���������� ���������� �������� ��������� (Unit36)
x_1:=nil;
y_1:=nil;
z_1:=nil;
scale_atom:=1.5;
scale_panorama:=0.05;
translatx:=0;
translaty:=0;
xinv:=0;
yinv:=0;
zinv:=0;
anglex:=0;
angley:=0;
anglez:=0;
scal:=0;
opt:=0;
ux:=0;
uy:=0;
uz:=0;
ugolx:=0;
ugoly:=0;
ugolz:=0;
trxyz:=nil;
bonds_painted:=false;
are_bonds:=nil;
Red:=nil;
Green:=nil;
Blue:=nil;
dx:=nil;
dy:=nil;
dz:=nil;
x_tr:=nil;
y_tr:=nil;
z_tr:=nil;
IINc:=0;
ISTc:=0;
IZMc:=0;
D1:=0;
////////////////////////////////////////////////////////////////////////
identificator:=4;
nomer_cycla:=0;
probel:='';
for i:=0 to 100 do
probel:=probel+' ';
siz:=0;


 ///*************************************************************************************
while not Eof(f) do begin
Readln(f,str);
if Pos(' Input orientation:',str)<>0 then begin
IIN:=True;
IINc:=IINc+1;
end;
if Pos(' Standard orientation:',str)<>0 then  begin
IST:=True;
ISTc:=ISTc+1;
end;
if Pos(' Z-Matrix orientation:',str)<>0 then  begin
IZM:=True;
IZMc:=IZMc+1;
end;
end;
CloseFile(f);

ISZ:='';
IAZ:='';
constrain:=0;

if (IIN=True) and (IST=False) and (IZM=False) then begin
ISZ:='Input orientation:';
constrain:=1;
end;
if (IIN=false) and (IST=True) and (IZM=False) then begin
ISZ:='Standard orientation:';
constrain:=1;
end;
if (IIN=false) and (IST=false) and (IZM=true) then ISZ:='Z-Matrix orientation:';

if (IIN=true) and (IST=true) and (IZM=false) then  begin
  if ABS(IINc-ISTc)<2 then  ISZ:='Standard orientation:'
  else begin
  if IINc>ISTc then begin
  ISZ:='Input orientation:';
  IAZ:='Standard orientation:';
  end
  else  ISZ:='Standard orientation:';
  end;
end;
if (IIN=true) and (IST=false) and (IZM=true) then begin
  if ABS(IINc-IZMc)<2 then ISZ:='Input orientation:'
  else begin
  if IINc>IZMc then begin
  ISZ:='Input orientation:';
  constrain:=0;
  end
  else ISZ:='Z-Matrix orientation:';
  end;
end;
if (IIN=false) and (IST=true) and (IZM=true) then begin
  if ABS(ISTc-IZMc)<2 then  ISZ:='Standard orientation:'
  else begin
  if ISTc>IZMc then   ISZ:='Standard orientation:'
  else ISZ:='Z-Matrix orientation:';
  end;
end;

if (IIN=true) and (IST=true) and (IZM=true) then begin
if (IINc>ISTc) and (IINc>IZMc) then  ISZ:='Input orientation:';
if (ISTc>IINc) and (ISTc>IZMc) then  ISZ:='Standard orientation:';
if (IZMc>IINc) and (IZMc>ISTc) then  ISZ:='Z-Matrix orientation:';
end;

if IAZ='' then IAZ:=ISZ;


 AssignFile(f,copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');
 Reset(f);



 ///***********************************************************************************




while not Eof(f) do begin
//Application.ProcessMessages;
24: ReadLn(f,str);
Application.ProcessMessages;  ///////////////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! razkomentiroval


/////////////////////////if pos(ISZ,str)<>0 then siz:=siz+1;    !!!!!!!!!!!!!!!!!!!  zakomentiroval


/////������ ��������� � ������ ������� ��� �� ��������������
if length(src_route)<>0 then goto 2718;
if pos(' *********************************',str)<>0 then begin
ReadLn(f,str);
if pos('Gaussian',str)=0 then begin
if ish_geom_ne<>true then showmessage('�������� ��������� �� ����� ���� ���������!');
ish_geom_ne:=true;
goto 2718;
end;
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
if pos('---------------------',str)<>0 then begin  //���� ��� ��������� ������, � ����� ���������� ����������
setlength(src_start,20);
src_start[0]:='';
goto 1515;
end;
i:=0;
repeat
setlength(src_start,1+i);
if pos(' Will use up',str)=0  then src_start[i]:=str;
if pos(' Will use up',str)=0  then i:=i+1;
ReadLn(f,str);
until pos(' --------------------------',str)<>0;
1515: ReadLn(f,str);
i:=0;
repeat
setlength(src_route,1+i);
src_route[i]:=str;
i:=i+1;
ReadLn(f,str);
until pos(' --------------------------',str)<>0;
ReadLn(f,str);
While pos(' --',str)=0 do begin
ReadLn(f,str);
end;
ReadLn(f,str);
i:=0;
repeat
setlength(src_title,1+i);
src_title[i]:=str;
i:=i+1;
ReadLn(f,str);
until pos(' --',str)<>0;
ReadLn(f,str);
ReadLn(f,str);
setlength(src_mult,1);
src_mult[0]:=copy(str,10,3)+' '+ copy(str,28,3);
if copy(src_mult[0],1,2)='  ' then src_mult[0]:=copy(src_mult[0],2,length(src_mult[0]));
end;
//////////////////////////////////////////////////////////////

if (length(src_route)<>0)  and (length(src_geom)=0) then begin
ReadLn(f,str);    //����� ������������ ������� ��������� �� out
i:=0;
repeat
setlength(src_geom,1+i);
src_geom[i]:=str;
ReadLn(f,str);
i:=i+1;
until (str='') or (pos('Input orientation',str)<>0) or (pos(' Remove',str)<>0) or (pos('Stoichiometry',str)<>0);
end;





2718:







if (pos(ISZ,str)<>0) or (pos(IAZ,str)<>0) then  begin
with pb do begin
Application.ProcessMessages;
Statusbar1.Panels[0].Text:='Reading Output';
Parent:= Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
if Cx*Px=0 then pb.Progress:=0
else pb.Progress:=Round((Px*nomer_cycla)/(Cx*Px)*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := StatusBar1.Panels[0].Width+1;
   Height:= StatusBar1.Height - Top-3;
   Width:= StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;
Application.ProcessMessages;
nomer_cycla:=nomer_cycla+1;
ReadLn(f,str);
ReadLn(f,str);
if pos('.',str)<>0 then goto  130;
ReadLn(f,str);
ReadLn(f,str);    //4 ������ ��������� � ��������, ������� � ����� - ������ � �����������
/////////////////////�������� ������ ����������////////////////////////////////////////////////////////
130: ReadLn(f,str);
nomer_atoma:=0;
if NProp=false then begin
while pos('------',str)=0 do begin
Px:=Px+1;
ReadLn(f,str);
end;
NProp:=true;
while not Eof(f) do begin
ReadLn(f,str);
if (pos(ISZ,str)<>0) or (pos(IAZ,str)<>0)
then begin
Cx:=Cx+1;
end;
if (pos('Normal termination',str)<>0) or (pos('Job cpu time:',str)<>0) or (pos('Link1',str)<>0) then break;

end;
CloseFile(f);
//ish_geom_ne:=false;
goto 25;
end;


23: if pos('---------',str)=0  then begin
for i:=1 to 12 do
cn[i]:=0;


for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //���� ��� 1-�� ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //2-��
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=',') then cn[9]:=cn[9]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>',') then cn[10]:=cn[10]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+p,1)=',') then cn[11]:=cn[11]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+p,1)<>',') then cn[12]:=cn[12]+1
else break;
end;


cart[1]:= copy(str,cn[1]+1,cn[2]);   //����� ������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //������� �����
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //������� ���
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // ���������� �
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]); //���������� Y
cart[6]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+1,cn[12]); // ���������� Z

if cart[2]<>'-1' then begin   //��� ������� ��������� �������� ������ ������ ������ (XX, Bq)
nomer_atoma:=nomer_atoma+1;

with pb do begin
Application.ProcessMessages;
Statusbar1.Panels[0].Text:='Reading Output';
Parent:= Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
 if Cx<2 then pb.Progress:=Round(nomer_atoma/Px*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := StatusBar1.Panels[0].Width+1;
   Height:= StatusBar1.Height - Top-3;
   Width:= StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;






///////������������ ������ - ������������� �����///////////////////////////
if nomer_atoma>=nomer_atoma_max then begin
Setlength(atomout,nomer_cycla+1,nomer_atoma+2);
Setlength(atomoutel,nomer_cycla+1,nomer_atoma+2);
Setlength(typeout,nomer_cycla+1,nomer_atoma+2);
Setlength(xout,nomer_cycla+1,nomer_atoma+2);
Setlength(yout,nomer_cycla+1,nomer_atoma+2);
Setlength(zout,nomer_cycla+1,nomer_atoma+2);
end
else begin
Setlength(atomout,nomer_cycla+1,nomer_atoma_max+2);
Setlength(atomoutel,nomer_cycla+1,nomer_atoma_max+2);
Setlength(typeout,nomer_cycla+1,nomer_atoma_max+2);
Setlength(xout,nomer_cycla+1,nomer_atoma_max+2);
Setlength(yout,nomer_cycla+1,nomer_atoma_max+2);
Setlength(zout,nomer_cycla+1,nomer_atoma_max+2);
end;
///////////////////////////////////////////////////////////////////////////
atomout[nomer_cycla][nomer_atoma]:=cart[2];
atomoutel[nomer_cycla][nomer_atoma]:=center[strtoint(cart[2])];
typeout[nomer_cycla][nomer_atoma]:=cart[3];
xout[nomer_cycla][nomer_atoma]:=cart[4];
yout[nomer_cycla][nomer_atoma]:=cart[5];
zout[nomer_cycla][nomer_atoma]:=cart[6];
if nomer_atoma_max<=nomer_atoma then nomer_atoma_max:=nomer_atoma;
end;
ReadLn(f,str);
goto 23;



end;
goto 24;
end;
end;
end;
end;  //********************************************************************************************************



case Opendialog1.FilterIndex of   //XYZ-�����   ************************************************************
3: begin

atomout:=nil;
atomoutel:=nil;
xout:=nil;
yout:=nil;
zout:=nil;
x:=nil;
y:=nil;
z:=nil;
typeout:=nil;
src_start:=nil;
src_route:=nil;
src_title:=nil;
src_mult:=nil;
src_geom:=nil;
x_draw_out:=nil;  //����36 ����������
y_draw_out:=nil;
z_draw_out:=nil;
nc:=0;
scr_x:=nil;  // ��������� ���������� ���������� �������� ��������� ��� ������ ������
scr_y:=nil;  // ��������� ���������� ���������� �������� ���������
scr_z:=nil;  // ��������� ���������� ���������� �������� ��������� (Unit36)
x_1:=nil;
y_1:=nil;
z_1:=nil;
scale_atom:=1.5;
scale_panorama:=0.05;
translatx:=0;
translaty:=0;
xinv:=0;
yinv:=0;
zinv:=0;
anglex:=0;
angley:=0;
anglez:=0;
scal:=0;
opt:=0;
ux:=0;
uy:=0;
uz:=0;
ugolx:=0;
ugoly:=0;
ugolz:=0;
trxyz:=nil;
bonds_painted:=false;
are_bonds:=nil;
Red:=nil;
Green:=nil;
Blue:=nil;
dx:=nil;
dy:=nil;
dz:=nil;
x_tr:=nil;
y_tr:=nil;
z_tr:=nil;
IINc:=0;
ISTc:=0;
IZMc:=0;
D1:=0;

//Statusbar1.Panels[0].Text:='Reading XYZ';
//CloseFile(f);
Form39.Show;


end;
end;

{
k:=1;
for i:=1 to nomer_atoma-1 do begin
for j:=i+1 to nomer_atoma do begin
Dist[nomer_cycla][k]:=floattostr(sqrt(power((strtofloat(xout[nomer_cycla][i])-strtofloat(xout[nomer_cycla][j])),2)+ power((strtofloat(yout[nomer_cycla][i])-strtofloat(yout[nomer_cycla][j])),2) + power((strtofloat(zout[nomer_cycla][i])-strtofloat(zout[nomer_cycla][j])),2)));
k:=k+1;
end;
end;

ma1:=a;  //��� ���������� �����������
ma2:=b; //������ ���������
//a:=strtoint(Form3.Edit3.Text); //����� ����� (�� ����������� ����� ���������, �������� ������ � ���������������� ���������� �������)


for j:=1 to c do  begin
id[j]:=0;       //�������������� ������� �����
for i:=1 to k-1 do  begin
if (strtofloat(Dist[nomer_cycla][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist[nomer_cycla][i])<ma2+ma1*j) then id[j]:=id[j]+1;
end;
end;


AssignFile(t,'DATA.txt');
Rewrite(t);
WriteLn(t,'   BOND LENGTH (A)        COUNT');
WriteLn(t,'');
WriteLn(t, copy(probel,1,8)+  floattostr(ma2)+ copy(probel,1,20-length(floattostr(ma2)))+'0');
for j:=1 to c do
WriteLn(t, copy(probel,1,8) + floattostr(ma2+ma1*j)+ copy(probel,1,21-length(inttostr(id[j]))-length(floattostr(ma2+ma1*j)))  +  inttostr(id[j]));
WriteLn(t,'');
CloseFile(t);

}

0:

{
if (Dial=True) and (OpenDialog1.FilterIndex=2) and (nomer_cycla=0) and (Cx=0) and (siz>0) then begin     //���� ����������� �� input-�����������, �� ��� ������������ ������
InpStd:='Input orientation:';
CloseFile(f);
goto 25;
end;   }  ////////////////////////////////////!!!!!!!!


razryd:=9;    //razryd-1   --- ����� ������ ����� ������� � ���������� �����������  (���������� �� 6 �� 10 ������������)


if (OpenDialog1.FilterIndex=2) and (ish_geom_ne=false) then begin
if (nomer_cycla=0) and (nomer_atoma=0) then
showmessage('�������� ��������� � ����� '+Opendialog1.FileName+ ' �� ����� ���� ���������!');
end;
if (OpenDialog1.FilterIndex=1) and (ish_geom_ne=false) then begin
if atom_store[1]='' then
showmessage('��������� � ����� '+Opendialog1.FileName+ ' �� ����� ���� ���������!');
end;


CloseFile(f);

//pb.BackColor:=clBtnFace;
//pb.ForeColor:=clBtnFace;
//StatusBAr1.Panels[1].Text:=inttostr(nomer_atoma-1) +' atoms; ' + inttostr(nomer_variabl)+' variables';


if Opendialog1.FilterIndex<>3 then
DeleteFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');

if Opendialog1.FilterIndex=3 then begin
identificator:=5;
setlength(typeout,nomer_cycla+1,nomer_atoma+1);
//for p:=1 to nomer_atoma do
end;




//probel:='                                                  ';

//AssignFile(t,'jjj.gjf');
//Rewrite(t);
//WriteLn(t,'# mp2/6-31g pop=full');
//WriteLn(t,'');
//WriteLn(t,'title');
//WriteLn(t,'');
//WriteLn(t,'0 1');
//if (nomer_cycla=0) or (OpenDialog1.FilterIndex=1) then nomer_cycla:=1;
//for p:=1 to nomer_cycla do begin
//if nomer_cycla>1 then WriteLn(t,'');
//for k:=1 to nomer_atoma do begin
//if identificator=1 then WriteLn(t,atom_store[k]+   copy(probel,1,20-length(atom_store[k]+flag[k]))   +  flag[k] + copy(probel,1,16-length(copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)))  +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,16-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,16-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=2 then WriteLn(t,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=3 then WriteLn(t,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=4 then WriteLn(t,atomoutel[p][k]+   copy(probel,1,20-length(atomoutel[p][k]+typeout[p][k]))   +  typeout[p][k] + copy(probel,1,16-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
//if identificator=5 then WriteLn(t,atomoutel[p][k]+   copy(probel,1,8-length(atomoutel[p][k]+typeout[p][k]))   +  typeout[p][k] + copy(probel,1,12-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
//end;
//end;
//WriteLn(t,'');
//WriteLn(t,'');
//WriteLn(t,'');
//CloseFile(t);
100:

if (identificator=1) and (nomer_z=0) then begin
StatusBAr1.Panels[0].Text:='Ready';
StatusBAr1.Panels[1].Text:=inttostr(nomer_atoma-1) +' atoms; ' + inttostr(nomer_variabl)+' variables';
pb.BackColor:=clBtnFace;
pb.ForeColor:=clBtnFace;
pb.Visible:=False;
pb.Progress:=0;
end;
if (identificator=1) and (nomer_z<>0) then begin
StatusBAr1.Panels[0].Text:='Ready';
StatusBAr1.Panels[1].Text:=inttostr(nomer_atoma-1) +' atoms; ' + inttostr(nomer_variabl-1)+' variables';
pb.BackColor:=clBtnFace;
pb.ForeColor:=clBtnFace;
pb.Visible:=False;
pb.Progress:=0;
end;
if identificator=3  then begin
StatusBAr1.Panels[0].Text:='Ready';
StatusBAr1.Panels[1].Text:=inttostr(nomer_atoma) +' atoms; ' + inttostr(nomer_variabl-1)+' variables';
pb.BackColor:=clBtnFace;
pb.ForeColor:=clBtnFace;
pb.Visible:=False;
pb.Progress:=0;
end;
if identificator=4  then begin
StatusBAr1.Panels[0].Text:='Ready';
StatusBAr1.Panels[1].Text:=inttostr(nomer_atoma) +' atoms; ' + inttostr(nomer_cycla)+' cycles';
pb.BackColor:=clBtnFace;
pb.ForeColor:=clBtnFace;
pb.Visible:=False;
pb.Progress:=0;
end;
//StatusBAr1.Panels[0].Text:='Ready';
//pb.BackColor:=clBtnFace;
//pb.ForeColor:=clBtnFace;
//StatusBAr1.Panels[1].Text:=inttostr(nomer_atoma) +' atoms; ' + inttostr(nomer_variabl)+' variables';
//pb.FreeOnRelease;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.N3D2Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm1.N7Click(Sender: TObject);
var identificator,p,i,nomer_cycla_max,nomer_atoma_max,s_i: integer;
cart: array[0..15] of string;
cn: array[1..30] of integer;
f: TextFile;
pb: TGauge;
probel,str,IsInp,ISZ: widestring;
ish_geom_ne,IIN,IST,IZM: boolean;
IINc,ISTc,IZMc: Integer;
label 23,24,100,2718,1515,444;
begin
pb:= TGauge.Create(Statusbar1);
////////////��������� ���������� ����������/////////////////////////////
nomer_cycla_mult:=nil;
nomer_atoma_mult:=nil;
atomout_mult:=nil;
atomoutel_mult:=nil;
xout_mult:=nil;
yout_mult:=nil;
zout_mult:=nil;
typeout_mult:=nil;
src_start_mult:=nil;
src_route_mult:=nil;
src_title_mult:=nil;
src_mult_mult:=nil;
src_geom_mult:=nil;
step_mult:=nil;
////////////////////////////////////////////////////////////////////////
OpenDialog2.Options:= [ofAllowMultiSelect];    //������� ��������� ������
dial:=false;
s_i:=0;
//OpenDialog2.InitialDir:=0;    //��������� ��������� ����������� ����� � ������������ �������
if OpenDialog2.Execute then begin
for nf:=0 to OpenDialog2.Files.Count-1 do  begin
Application.ProcessMessages;

with pb do begin
Application.ProcessMessages;
Statusbar1.Panels[0].Text:='Reading Output';
Parent:= Statusbar1;
pb.Visible:=False;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
if OpenDialog2.Files.Count=1 then pb.Progress:=100
else      pb.Progress:=Round (100*(nf+1)/(OpenDialog2.Files.Count));
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := StatusBar1.Panels[0].Width+1;
   Height:= StatusBar1.Height - Top-3;
   Width:= StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;

IIN:=False;
IST:=False;
IZM:=False;

IINc:=0;
ISTc:=0;
IZMc:=0;


CopyFile(PChar(OpenDialog2.Files[nf]),PChar(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr'),false);
SetFileAttributes(PChar(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr'),FILE_ATTRIBUTE_NORMAL);

AssignFile(f,copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');
Reset(f);
while not Eof(f) do begin
Readln(f,str);
if Pos(' Input orientation:',str)<>0 then begin
IIN:=True;
IINc:=IINc+1;
end;
if Pos(' Standard orientation:',str)<>0 then  begin
IST:=True;
ISTc:=ISTc+1;
end;
if Pos(' Z-Matrix orientation:',str)<>0 then  begin
IZM:=True;
IZMc:=IZMc+1;
end;
end;
CloseFile(f);

ISZ:='';
IAZ:='';

if (IIN=True) and (IST=False) and (IZM=False) then ISZ:='Input orientation:';
if (IIN=false) and (IST=True) and (IZM=False) then ISZ:='Standard orientation:';
if (IIN=false) and (IST=false) and (IZM=true) then ISZ:='Z-Matrix orientation:';
if (IIN=true) and (IST=true) and (IZM=false) then  begin
  if ABS(IINc-ISTc)<2 then  ISZ:='Standard orientation:'
  else begin
  if IINc>ISTc then  begin                 //ISZ:='Input orientation:'
  ISZ:='Input orientation:';
  IAZ:='Standard orientation:';
  end
  else  ISZ:='Standard orientation:';
  end;
end;
if (IIN=true) and (IST=false) and (IZM=true) then begin
  if ABS(IINc-IZMc)<2 then ISZ:='Input orientation:'
  else begin
  if IINc>IZMc then ISZ:='Input orientation:'
  else ISZ:='Z-Matrix orientation:';
  end;
end;
if (IIN=false) and (IST=true) and (IZM=true) then begin
  if ABS(ISTc-IZMc)<2 then  ISZ:='Standard orientation:'
  else begin
  if ISTc>IZMc then   ISZ:='Standard orientation:'
  else ISZ:='Z-Matrix orientation:';
  end;
end;

if (IIN=true) and (IST=true) and (IZM=true) then begin
if (IINc>ISTc) and (IINc>IZMc) then  ISZ:='Input orientation:';
if (ISTc>IINc) and (ISTc>IZMc) then  ISZ:='Standard orientation:';
if (IZMc>IINc) and (IZMc>ISTc) then  ISZ:='Z-Matrix orientation:';
end;

if IAZ='' then IAZ:=ISZ;

AssignFile(f,copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');
Reset(f);


case Opendialog2.FilterIndex of       //out, log-�����
1:   begin
  StatusBar1.Panels[0].Text:='Reading Multiple Files';

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
identificator:=4;
SetLength(nomer_cycla_mult,nf+2);
SetLength(nomer_atoma_mult,nf+2);
nomer_cycla_mult[nf]:=0;
probel:='';
for i:=0 to 100 do
probel:=probel+' ';
while not Eof(f) do begin
24: ReadLn(f,str);
Application.ProcessMessages;



/////������ ��������� � ������ ������� ��� �� ��������������
setlength(src_route_mult,nf+1);
setlength(src_geom_mult,nf+1);
if length(src_route_mult[nf])<>0 then goto 2718;
if pos(' *********************************',str)<>0 then begin
ReadLn(f,str);
if pos('Gaussian',str)=0 then begin
if ish_geom_ne<>true then showmessage('�������� ��������� � ����� '+Opendialog2.Files[nf]+ ' �� ����� ���� ���������!');
ish_geom_ne:=true;
goto 2718;
end;
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
if pos(' ---',str)<>0 then begin  //���� ��� ��������� ������, � ����� ���������� ����������
setlength(src_start_mult,nf+1,20);
src_start_mult[nf,0]:='';
goto 1515;
end;
i:=0;
repeat
setlength(src_start_mult,nf+1,20);
if (pos(' Will use up',str)=0) and (Pos(' Default route: ',str)=0) then src_start_mult[nf,i]:=str;
if (pos(' Will use up',str)=0) and (Pos(' Default route: ',str)=0)  then i:=i+1;
ReadLn(f,str);
until pos(' --',str)<>0;
1515: ReadLn(f,str);
i:=0;
repeat
setlength(src_route_mult,nf+1,10);
src_route_mult[nf,i]:=str;
i:=i+1;
ReadLn(f,str);
until pos(' --',str)<>0;
ReadLn(f,str);
While pos(' --',str)=0 do begin
ReadLn(f,str);
end;
ReadLn(f,str);
i:=0;
repeat
setlength(src_title_mult,nf+1,30);
src_title_mult[nf,i]:=str;
i:=i+1;
ReadLn(f,str);
until pos(' --',str)<>0;
ReadLn(f,str);
ReadLn(f,str);
setlength(src_mult_mult,nf+1,1);
src_mult_mult[nf,0]:=copy(str,10,3)+' '+ copy(str,28,3);
if copy(src_mult_mult[nf,0],1,2)='  ' then src_mult_mult[nf,0]:=copy(src_mult_mult[nf,0],2,length(src_mult_mult[nf,0]));
end;
//////////////////////////////////////////////////////////////




if (length(src_route_mult[nf])<>0)  and (length(src_geom_mult[nf])=0) then begin
ReadLn(f,str);    //����� ������������ ������� ��������� �� out
i:=0;
repeat
if s_i>=i then setlength(src_geom_mult,nf+1,s_i+1)
else  setlength(src_geom_mult,nf+1,i+1);
src_geom_mult[nf,i]:=str;
ReadLn(f,str);
i:=i+1;
until (str='') or (pos('Input orientation',str)<>0) or (pos(' Remove',str)<>0) or (pos('Stoichiometry',str)<>0) or (pos('IRC-IRC-IRC-',str)<>0)  ;
s_i:=i; //����� ������ ��������� ���������� (���������� ������, ���������� � ����.) ��� ������ ����� ���������� �������
end;




2718:











if (pos(ISZ,str)<>0)  or  (pos(IAZ,str)<>0)    then  begin
444: nomer_cycla_mult[nf]:=nomer_cycla_mult[nf]+1;
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);    //4 ������ ��������� � ��������, ������� � ����� - ������ � �����������
/////////////////////�������� ������ ����������////////////////////////////////////////////////////////
ReadLn(f,str);
nomer_atoma_mult[nf]:=0;


23: if pos('---------',str)=0  then begin
for i:=1 to 12 do
cn[i]:=0;


for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //������� �������-���� ��� �������-������ ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //���� ��� 1-�� ����������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //2-��
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=',') then cn[9]:=cn[9]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>',') then cn[10]:=cn[10]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+p,1)=',') then cn[11]:=cn[11]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+p,1)<>',') then cn[12]:=cn[12]+1
else break;
end;




cart[1]:= copy(str,cn[1]+1,cn[2]);   //����� ������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //������� �����
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //������� ���
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // ���������� �
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]); //���������� Y
cart[6]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+1,cn[12]); // ���������� Z

if cart[2]<>'-1' then begin              //���� ��� ������� ������, �� ����� ����������� ������ ������ ������
nomer_atoma_mult[nf]:=nomer_atoma_mult[nf]+1;
///////������������ ������ - ������������� �����///////////////////////////
Setlength(atomout_mult,nf+2,nomer_cycla_max+2,nomer_atoma_max+2);
Setlength(atomoutel_mult,nf+2,nomer_cycla_max+2,nomer_atoma_max+2);
Setlength(typeout_mult,nf+2,nomer_cycla_max+2,nomer_atoma_max+2);
Setlength(xout_mult,nf+2,nomer_cycla_max+2,nomer_atoma_max+2);
Setlength(yout_mult,nf+2,nomer_cycla_max+2,nomer_atoma_max+2);
Setlength(zout_mult,nf+2,nomer_cycla_max+2,nomer_atoma_max+2);
///////////////////////////////////////////////////////////////////////////


atomout_mult[nf][nomer_cycla_mult[nf]][nomer_atoma_mult[nf]]:=cart[2];
atomoutel_mult[nf][nomer_cycla_mult[nf]][nomer_atoma_mult[nf]]:=center[strtoint(cart[2])];
typeout_mult[nf][nomer_cycla_mult[nf]][nomer_atoma_mult[nf]]:=cart[3];
xout_mult[nf][nomer_cycla_mult[nf]][nomer_atoma_mult[nf]]:=cart[4];
yout_mult[nf][nomer_cycla_mult[nf]][nomer_atoma_mult[nf]]:=cart[5];
zout_mult[nf][nomer_cycla_mult[nf]][nomer_atoma_mult[nf]]:=cart[6];
if nomer_atoma_max<=nomer_atoma_mult[nf] then nomer_atoma_max:=nomer_atoma_mult[nf];
if nomer_cycla_max<=nomer_cycla_mult[nf] then nomer_cycla_max:=nomer_cycla_mult[nf];
end;


ReadLn(f,str);
goto 23;



end;
goto 24;
end;



//if (Pos('Input orientation',str)<>0) and (IsStandOr=False) then goto 444;






end;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
end;
end;



//if (ish_geom_ne=false) and (src_route_mult=nil) and (src_title_mult=nil) and (src_mult_mult=nil) then  showmessage('�������� ��������� � ����� '+Opendialog2.Files[nf]+ ' �� ����� ���� ���������!');
//if (ish_geom_ne=false) and (src_route_mult[nf]<>nil) and (src_title_mult[nf]<>nil) and (src_mult_mult[nf]<>nil) then  begin
//if  (src_route_mult[nf,0]='')  or (src_mult_mult[nf,0]='')  then
if  ish_geom_ne=false then begin
if (xout_mult=nil) and (yout_mult=nil) and (zout_mult=nil) then
showmessage('�������� ��������� � ����� '+Opendialog2.Files[nf]+ ' �� ����� ���� ���������!');
if (xout_mult<>nil) and (yout_mult<>nil) and (zout_mult<>nil) then  begin
if (xout_mult[nf]<>nil) and (yout_mult[nf]<>nil) and (zout_mult[nf]<>nil) then  begin
if (xout_mult[nf,1]<>nil) and (yout_mult[nf,1]<>nil) and (zout_mult[nf,1]<>nil) then  begin
if (xout_mult[nf,1,1]='') and (yout_mult[nf,1,1]='') and (zout_mult[nf,1,1]='') then
showmessage('�������� ��������� � ����� '+Opendialog2.Files[nf]+ ' �� ����� ���� ���������!');
end;
end;
end;
end;




CloseFile(f);
ish_geom_ne:=false;
DeleteFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');
end;
OpenDialog2.FreeOnRelease;
dial:=false;
StatusBar1.Panels[0].Text:='Ready';
StatusBar1.Panels[1].Text:=IntToStr(OpenDialog2.Files.Count)+' systems';
pb.ForeColor:=clBtnFace;
pb.BackColor:=clBtnFace;
pb.Visible:=False;
pb.Progress:=0;
end;

//DeleteFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');



end;

procedure TForm1.N36Click(Sender: TObject);
begin
Form4.SHowmodal;
end;

procedure TForm1.N26Click(Sender: TObject);
begin
Form6.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
var f: TextFile;
str: widestring;
cn: array[1..14] of integer;
cart: array[1..10] of widestring;
i,p,k: integer;
label 1,2,3;
begin
AssignFile(f,'SYSTEMSPAR.prm');
Reset(f);
while not Eof(f) do begin
ReadLn(f,str);
if pos('Section 2',str)<>0 then  goto 2;
if pos('Section 1',str)<>0 then  begin
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);  //��������� 3 ������

/////////////////////�������� ������ ���������////////////////////////////////////////////////////////
ReadLn(f,str);
k:=0;


1: if pos('---------',str)=0  then begin
for i:=1 to 12 do
cn[i]:=0;


for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=';') then cn[1]:=cn[1]+1         //������� �� ��������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>';') then cn[2]:=cn[2]+1       //�������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=';') then cn[3]:=cn[3]+1      //������� �������-���������� �����
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>';') then cn[4]:=cn[4]+1   //���������� �����
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=';') then cn[5]:=cn[5]+1     //������� ���������� �����-�����
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>';') then cn[6]:=cn[6]+1  //������������ �����
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=';') then cn[7]:=cn[7]+1   //������ �����-������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>';') then cn[8]:=cn[8]+1    //������
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=';') then cn[9]:=cn[9]+1   //������ ������-����
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>';') then cn[10]:=cn[10]+1    //����
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+p,1)=';') then cn[11]:=cn[11]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+p,1)<>';') then cn[12]:=cn[12]+1
else break;
end;


cart[1]:= copy(str,cn[1]+1,cn[2]);   //�������
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //���������� �����
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //������������ �����
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // ������
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]); //����
cart[6]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+cn[10]+cn[11]+1,cn[12]); // ?????????????????


k:=k+1;
center[k]:=cart[1];
num[k]:=cart[2];
molmass[k]:=cart[3];
radius[k]:=cart[4];
colour[k]:=cart[5];

ReadLn(f,str);
goto 1;




//end;
end;  //********************************************************************************************************


2:
while pos('.',str)=0 do
ReadLn(f,str);

k:=0;

3: if (pos('---------',str)=0) and (str<>'') then begin
for i:=1 to 12 do
cn[i]:=0;


for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=';') then cn[1]:=cn[1]+1         //������� �� �����
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>';') then cn[2]:=cn[2]+1       //�����
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=';') then cn[3]:=cn[3]+1      //������� �����-�����1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>';') then cn[4]:=cn[4]+1   //�����1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=';') then cn[5]:=cn[5]+1     //������� �����1-�����2
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>';') then cn[6]:=cn[6]+1  //�����2
else break;
end;



cart[1]:= copy(str,cn[1]+1,cn[2]);   //�����
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //�����1
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //�����2

k:=k+1;

setlength(bond_type,k+1);
setlength(thresh1,k+1);
setlength(thresh2,k+1);

bond_type[k]:=cart[1];
thresh1[k]:=cart[2];
thresh2[k]:=cart[3];


ReadLn(f,str);
goto 3;




end;
end;  //********************************************************************************************************



end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
Form9.Show;
end;

procedure TForm1.N43Click(Sender: TObject);
begin
Form10.Show;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
Form11.Show;
end;

procedure TForm1.Opt1Click(Sender: TObject);
begin
Form12.Show;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
Form14.Show;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
Form19.Showmodal;
end;

procedure TForm1.Freq1Click(Sender: TObject);
begin
Form24.Show;
end;

procedure TForm1.N14Click(Sender: TObject);
label 0;
begin
if ((x=nil) and (y=nil) and (z=nil)) and  ((xout=nil) and (yout=nil) and (zout=nil)) then goto 0;
Qcolor:=nil;
Form36.Show;
0:
end;

procedure TForm1.IRC1Click(Sender: TObject);
begin
Form37.Show;
end;

procedure TForm1.Scan1Click(Sender: TObject);
begin
Form44.Show;
end;

procedure TForm1.ADMPBOMD1Click(Sender: TObject);
begin
Form49.Show;
end;

procedure TForm1.UVVis1Click(Sender: TObject);
begin
 Form52.Show;
end;

procedure TForm1.N44Click(Sender: TObject);            /////  Mult OUT --------------> Decart
var a,probel: widestring;
f: TextFile;
i,p,k,s,j,razryd: integer;
src_start_temp,src_route_temp,src_title_temp,src_mult_temp: array of widestring;
povtor: boolean;
aa_nomer_cycla: integer;
label 0;
begin
probel:='                                                             ';
razryd:=8;

if dial=false then begin
for j:=0 to nf-1 do begin
if (src_route_mult<>nil) then begin
  if (src_route_mult[j]<>nil) then begin
AssignFile(f,copy(Opendialog2.Files[j],1,pos('.',Opendialog2.Files[j])-1)+'_NewGJF.gjf');
Rewrite(f);
if src_start_mult<>nil then begin
  if src_start_mult[j]<>nil then begin
for i:=0 to length(src_start_mult[j])-1 do
if src_start_mult[j,i]<>'' then WriteLn(f,src_start_mult[j,i]);   //��������� ������
end;
end;
if src_route_mult<>nil then begin
  if src_route_mult[j]<>nil then begin
for i:=0 to length(src_route_mult[j])-1 do
if src_route_mult[j,i]<>'' then WriteLn(f,src_route_mult[j,i]);   //���������� ������
end;
end;
WriteLn(f,'');
if src_title_mult<>nil then begin
if src_title_mult[j]<>nil then begin
for i:=0 to length(src_title_mult[j])-1 do
if src_title_mult[j,i]<>'' then WriteLn(f,src_title_mult[j,i]);   //���������
end;
end;
WriteLn(f,'');
if src_mult_mult<>nil then begin
  if src_mult_mult[j]<>nil then begin
for i:=0 to length(src_mult_mult[j])-1 do
if src_mult_mult[j,i]<>'' then WriteLn(f,src_mult_mult[j,i]);     //��������������� � �����
end;
end;
//WriteLn(f,'');
//WriteLn(f,'Geometry 1');

for p:=nomer_cycla_mult[j] to nomer_cycla_mult[j] do begin
//if nomer_cycla>1 then WriteLn(f,'');

for k:=1 to nomer_atoma_mult[j] do begin
//if identificator=1 then WriteLn(f,atom_store[k]+   copy(probel,1,20-length(atom_store[k]+flag[k]))   +  flag[k] + copy(probel,1,16-length(copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)))  +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,16-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,16-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=2 then WriteLn(f,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=3 then WriteLn(f,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
WriteLn(f,atomoutel_mult[j,p,k] + copy(probel,1,20-length((FloatToStrF(StrToFloat(xout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(xout_mult[j,p,k]),ffFixed,10,razryd)   +    copy(probel,1,16-length((FloatToStrF(StrToFloat(yout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(yout_mult[j,p,k]),ffFixed,10,razryd)  +    copy(probel,1,16-length((FloatToStrF(StrToFloat(zout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(zout_mult[j,p,k]),ffFixed,10,razryd));
//if identificator=4 then WriteLn(f,atomoutel[p][k]+   copy(probel,1,16-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
//if identificator=5 then WriteLn(f,atomoutel[p][k]+   copy(probel,1,8-length(atomoutel[p][k]+typeout[p][k]))   +  typeout[p][k] + copy(probel,1,12-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
end;
//WriteLn(f,'Geometry '+inttostr(p+1));
end;
WriteLn(f,'');



CloseFile(f);


end;


end;
end;
end;



if dial=true then begin
if OpenDialog1.FilterIndex=3 then begin
ShowMessage('����� ���� XYZ ����� ���� ��������� ������ ����� ������ ������');
goto 0;
end;

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_start)-1 do begin
if i=0 then begin
SetLength(src_start_temp,length(src_start_temp)+1);
src_start_temp[length(src_start_temp)-1]:=src_start[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_start[i]=src_start[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_start_temp,length(src_start_temp)+1);
src_start_temp[length(src_start_temp)-1]:=src_start[i];
end;
end;
end;
Setlength(src_start,length(src_start_temp));
for i:=0 to length(src_start)-1 do
src_start[i]:=src_start_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_route)-1 do begin
if i=0 then begin
SetLength(src_route_temp,length(src_route_temp)+1);
src_route_temp[length(src_route_temp)-1]:=src_route[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_route[i]=src_route[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_route_temp,length(src_route_temp)+1);
src_route_temp[length(src_route_temp)-1]:=src_route[i];
end;
end;
end;
Setlength(src_route,length(src_route_temp));
for i:=0 to length(src_route)-1 do
src_route[i]:=src_route_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_title)-1 do begin
if i=0 then begin
SetLength(src_title_temp,length(src_title_temp)+1);
src_title_temp[length(src_title_temp)-1]:=src_title[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_title[i]=src_title[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_title_temp,length(src_title_temp)+1);
src_title_temp[length(src_title_temp)-1]:=src_title[i];
end;
end;
end;
Setlength(src_title,length(src_title_temp));
for i:=0 to length(src_title)-1 do
src_title[i]:=src_title_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_mult)-1 do begin
if i=0 then begin
SetLength(src_mult_temp,length(src_mult_temp)+1);
src_mult_temp[length(src_mult_temp)-1]:=src_mult[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_mult[i]=src_mult[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_mult_temp,length(src_mult_temp)+1);
src_mult_temp[length(src_mult_temp)-1]:=src_mult[i];
end;
end;
end;
Setlength(src_mult,length(src_mult_temp));
for i:=0 to length(src_mult)-1 do
src_mult[i]:=src_mult_temp[i];
////////////////////////////////////////////////////////////////



if (x<>nil) or (xout<>nil) then begin
if SaveDialog1.Execute=true then begin
if  pos('.gjf',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.gjf';
AssignFile(f,a);
Rewrite(f);
if src_start<>nil then begin
for i:=0 to length(src_start)-1 do
if src_start[i]<>'' then WriteLn(f,src_start[i]);   //��������� ������
end;
if src_route<>nil then begin
for i:=0 to length(src_route)-1 do
if src_route[i]<>'' then WriteLn(f,src_route[i]);   //���������� ������
end;
WriteLn(f,'');
if src_title<>nil then begin
for i:=0 to length(src_title)-1 do
if src_title[i]<>'' then WriteLn(f,src_title[i]);   //���������
end;
WriteLn(f,'');
if src_mult<>nil then begin
for i:=0 to length(src_mult)-1 do
if src_mult[i]<>'' then WriteLn(f,src_mult[i]);     //��������������� � �����
end;

if xout<>nil then  begin
aa_nomer_cycla:=strtointdef(InputBox('����� ���� ��� ����������','���������� ������� ����� ����',inttostr(nomer_cycla)),nomer_cycla);
if aa_nomer_cycla>nomer_cycla then begin
showmessage('����� ����� �� ������ ��������� '+inttostr(nomer_cycla) + #13 + '����� ��������� ��������� ���������!');
aa_nomer_cycla:=nomer_cycla;
end;
if aa_nomer_cycla<1 then begin
showmessage('����� ����� ��������� �������� �� 1 �� '+inttostr(nomer_cycla) +' �����������!' + #13 + '����� ��������� ��������� ���������!');
aa_nomer_cycla:=1;
end;
end;


if (nomer_cycla=0) or (OpenDialog1.FilterIndex=1) then aa_nomer_cycla:=1;
for p:=aa_nomer_cycla to aa_nomer_cycla do begin
//if nomer_cycla>1 then WriteLn(f,'');
for k:=1 to nomer_atoma do begin
//if identificator=1 then WriteLn(f,atom_store[k]+   copy(probel,1,20-length(atom_store[k]+flag[k]))   +  flag[k] + copy(probel,1,16-length(copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)))  +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,16-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,16-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=2 then WriteLn(f,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=3 then WriteLn(f,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
if (identificator=1) and (x[k]<>'') then WriteLn(f,atom_store[k] + copy(probel,1,16-length(atom_store[k]+flag[k]))   +  flag[k] + copy(probel,1,12-length((FloatToStrF(StrToFloat(x[k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(x[k]),ffFixed,10,razryd)   +    copy(probel,1,16-length((FloatToStrF(StrToFloat(y[k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(y[k]),ffFixed,10,razryd)  +    copy(probel,1,16-length((FloatToStrF(StrToFloat(z[k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(z[k]),ffFixed,10,razryd));
if (identificator=3) or (identificator=2) and (x[k]<>'') then WriteLn(f,atom_store[k] + copy(probel,1,16-length((FloatToStrF(StrToFloat(x[k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(x[k]),ffFixed,10,razryd)   +    copy(probel,1,16-length((FloatToStrF(StrToFloat(y[k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(y[k]),ffFixed,10,razryd)  +    copy(probel,1,16-length((FloatToStrF(StrToFloat(z[k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(z[k]),ffFixed,10,razryd));
if identificator=4 then WriteLn(f,atomoutel[p,k] + copy(probel,1,16-length((FloatToStrF(StrToFloat(xout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(xout[p,k]),ffFixed,10,razryd)   +    copy(probel,1,16-length((FloatToStrF(StrToFloat(yout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(yout[p,k]),ffFixed,10,razryd)  +    copy(probel,1,16-length((FloatToStrF(StrToFloat(zout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(zout[p,k]),ffFixed,10,razryd));
//if identificator=4 then WriteLn(f,atomoutel[p][k]+   copy(probel,1,20-length(atomoutel[p][k]+typeout[p][k]))   +  typeout[p][k] + copy(probel,1,16-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
//if identificator=5 then WriteLn(f,atomoutel[p][k]+   copy(probel,1,8-length(atomoutel[p][k]+typeout[p][k]))   +  typeout[p][k] + copy(probel,1,12-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
end;
end;
WriteLn(f,'');



CloseFile(f);
SaveDialog1.FreeOnRelease;
end;
end;
end;
0:
end;

procedure TForm1.XYZ1Click(Sender: TObject);
var a,probel: widestring;
f: TextFile;
i,p,k,s,j,razryd: integer;
src_start_temp,src_route_temp,src_title_temp,src_mult_temp: array of widestring;
povtor: boolean;
label 0;
begin
probel:='                                                             ';
razryd:=6;
if dial=false then begin
for j:=0 to nf-1 do begin
if (src_route_mult<>nil) then begin
  if (src_route_mult[j]<>nil) then begin
AssignFile(f,copy(Opendialog2.Files[j],1,pos('.',Opendialog2.Files[j])-1)+'_NewXYZ.xyz');
Rewrite(f);
if src_start_mult<>nil then begin
  if src_start_mult[j]<>nil then begin
for i:=0 to length(src_start_mult[j])-1 do
if src_start_mult[j,i]<>'' then WriteLn(f,src_start_mult[j,i]);   //��������� ������
end;
end;
if src_route_mult<>nil then begin
  if src_route_mult[j]<>nil then begin
for i:=0 to length(src_route_mult[j])-1 do
if src_route_mult[j,i]<>'' then WriteLn(f,src_route_mult[j,i]);   //���������� ������
end;
end;
WriteLn(f,'');
if src_title_mult<>nil then begin
if src_title_mult[j]<>nil then begin
for i:=0 to length(src_title_mult[j])-1 do
if src_title_mult[j,i]<>'' then WriteLn(f,src_title_mult[j,i]);   //���������
end;
end;
WriteLn(f,'');
if src_mult_mult<>nil then begin
  if src_mult_mult[j]<>nil then begin
for i:=0 to length(src_mult_mult[j])-1 do
if src_mult_mult[j,i]<>'' then WriteLn(f,src_mult_mult[j,i]);     //��������������� � �����
end;
end;
//WriteLn(f,'');
//WriteLn(f,'Geometry 1');

for p:=1 to nomer_cycla_mult[j] do begin
//if nomer_cycla>1 then WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'Geometry '+inttostr(p));
for k:=1 to nomer_atoma_mult[j] do begin
//if identificator=1 then WriteLn(f,atom_store[k]+   copy(probel,1,20-length(atom_store[k]+flag[k]))   +  flag[k] + copy(probel,1,16-length(copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)))  +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,16-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,16-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=2 then WriteLn(f,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=3 then WriteLn(f,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
WriteLn(f,atomoutel_mult[j,p,k] + copy(probel,1,16-length((FloatToStrF(StrToFloat(xout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(xout_mult[j,p,k]),ffFixed,10,razryd)   +    copy(probel,1,16-length((FloatToStrF(StrToFloat(yout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(yout_mult[j,p,k]),ffFixed,10,razryd)  +    copy(probel,1,16-length((FloatToStrF(StrToFloat(zout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(zout_mult[j,p,k]),ffFixed,10,razryd));
//if identificator=4 then WriteLn(f,atomoutel[p][k]+   copy(probel,1,16-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
//if identificator=5 then WriteLn(f,atomoutel[p][k]+   copy(probel,1,8-length(atomoutel[p][k]+typeout[p][k]))   +  typeout[p][k] + copy(probel,1,12-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
end;
WriteLn(f,'');
//WriteLn(f,'Geometry '+inttostr(p+1));
end;
WriteLn(f,'');



CloseFile(f);


end;


end;
end;
end;




if dial=true then begin
if OpenDialog1.FilterIndex=3 then begin
ShowMessage('����� ���� XYZ ����� ���� ��������� ������ ����� ������ ������');
goto 0;
end;

if OpenDialog1.FilterIndex=1 then begin
ShowMessage('� XYZ ����� ���� ��������� ������ OUT/LOG-�����');
goto 0;
end;

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_start)-1 do begin
if i=0 then begin
SetLength(src_start_temp,length(src_start_temp)+1);
src_start_temp[length(src_start_temp)-1]:=src_start[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_start[i]=src_start[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_start_temp,length(src_start_temp)+1);
src_start_temp[length(src_start_temp)-1]:=src_start[i];
end;
end;
end;
Setlength(src_start,length(src_start_temp));
for i:=0 to length(src_start)-1 do
src_start[i]:=src_start_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_route)-1 do begin
if i=0 then begin
SetLength(src_route_temp,length(src_route_temp)+1);
src_route_temp[length(src_route_temp)-1]:=src_route[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_route[i]=src_route[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_route_temp,length(src_route_temp)+1);
src_route_temp[length(src_route_temp)-1]:=src_route[i];
end;
end;
end;
Setlength(src_route,length(src_route_temp));
for i:=0 to length(src_route)-1 do
src_route[i]:=src_route_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_title)-1 do begin
if i=0 then begin
SetLength(src_title_temp,length(src_title_temp)+1);
src_title_temp[length(src_title_temp)-1]:=src_title[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_title[i]=src_title[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_title_temp,length(src_title_temp)+1);
src_title_temp[length(src_title_temp)-1]:=src_title[i];
end;
end;
end;
Setlength(src_title,length(src_title_temp));
for i:=0 to length(src_title)-1 do
src_title[i]:=src_title_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_mult)-1 do begin
if i=0 then begin
SetLength(src_mult_temp,length(src_mult_temp)+1);
src_mult_temp[length(src_mult_temp)-1]:=src_mult[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_mult[i]=src_mult[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_mult_temp,length(src_mult_temp)+1);
src_mult_temp[length(src_mult_temp)-1]:=src_mult[i];
end;
end;
end;
Setlength(src_mult,length(src_mult_temp));
for i:=0 to length(src_mult)-1 do
src_mult[i]:=src_mult_temp[i];
////////////////////////////////////////////////////////////////



if (x<>nil) or (xout<>nil) then begin
if SaveDialog2.Execute=true then begin
if  pos('.xyz',Savedialog2.Filename)<>0 then a:=Savedialog2.Filename
else a:=Savedialog2.Filename+'.xyz';
AssignFile(f,a);
Rewrite(f);
if src_start<>nil then begin
for i:=0 to length(src_start)-1 do
if src_start[i]<>'' then WriteLn(f,src_start[i]);   //��������� ������
end;
if src_route<>nil then begin
for i:=0 to length(src_route)-1 do
if src_route[i]<>'' then WriteLn(f,src_route[i]);   //���������� ������
end;
WriteLn(f,'');
if src_title<>nil then begin
for i:=0 to length(src_title)-1 do
if src_title[i]<>'' then WriteLn(f,src_title[i]);   //���������
end;
WriteLn(f,'');
if src_mult<>nil then begin
for i:=0 to length(src_mult)-1 do
if src_mult[i]<>'' then WriteLn(f,src_mult[i]);     //��������������� � �����
end;
//WriteLn(f,'');
//WriteLn(f,'Geometry 1');

for p:=1 to nomer_cycla do begin
//if nomer_cycla>1 then WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'Geometry '+inttostr(p));
for k:=1 to nomer_atoma do begin
//if identificator=1 then WriteLn(f,atom_store[k]+   copy(probel,1,20-length(atom_store[k]+flag[k]))   +  flag[k] + copy(probel,1,16-length(copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)))  +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,16-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,16-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=2 then WriteLn(f,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
//if identificator=3 then WriteLn(f,atom_store[k]+   copy(probel,1,22-length(copy(x[k],1,pos('.',x[k])-1)+ copy(x[k],pos('.',x[k]),razryd) +atom_store[k]))      +  copy(x[k],1,pos('.',x[k])-1) + copy(x[k],pos('.',x[k]),razryd)   +    copy(probel,1,18-length( copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)))          + copy(y[k],1,pos('.',y[k])-1)  +  copy(y[k],pos('.',y[k]),razryd)+ copy(probel,1,18-length(copy(z[k],1,pos('.',z[k])-1) +  copy(z[k],pos('.',z[k]),razryd)))                    + copy(z[k],1,pos('.',z[k])-1)  +  copy(z[k],pos('.',z[k]),razryd));
if identificator=4 then WriteLn(f,atomoutel[p,k] + copy(probel,1,16-length((FloatToStrF(StrToFloat(xout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(xout[p,k]),ffFixed,10,razryd)   +    copy(probel,1,16-length((FloatToStrF(StrToFloat(yout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(yout[p,k]),ffFixed,10,razryd)  +    copy(probel,1,16-length((FloatToStrF(StrToFloat(zout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(zout[p,k]),ffFixed,10,razryd));
//if identificator=4 then WriteLn(f,atomoutel[p][k]+   copy(probel,1,16-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
//if identificator=5 then WriteLn(f,atomoutel[p][k]+   copy(probel,1,8-length(atomoutel[p][k]+typeout[p][k]))   +  typeout[p][k] + copy(probel,1,12-length(copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)))  +  copy(xout[p][k],1,pos('.',xout[p][k])-1) + copy(xout[p][k],pos('.',xout[p][k]),razryd)   +    copy(probel,1,16-length( copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)))          + copy(yout[p][k],1,pos('.',yout[p][k])-1)  +  copy(yout[p][k],pos('.',yout[p][k]),razryd)+ copy(probel,1,16-length(copy(zout[p][k],1,pos('.',zout[p][k])-1) +  copy(zout[p][k],pos('.',zout[p][k]),razryd)))                    + copy(zout[p][k],1,pos('.',zout[p][k])-1)  +  copy(zout[p][k],pos('.',zout[p][k]),razryd));
end;
WriteLn(f,'');
//WriteLn(f,'Geometry '+inttostr(p+1));
end;
WriteLn(f,'');



CloseFile(f);
SaveDialog2.FreeOnRelease;
end;
end;
end;
0:




end;

procedure TForm1.Z2Click(Sender: TObject);
var f: TextFile;
i,j,k,reo1,reo2,reo3,reo4,reo5,p,reo_tmp,aa_nomer_cycla,L,t: integer;
rr,aaa,dddd: array of string;
r_ab,a_abc,d_abcd: real;
parameterx,parametery,parameterz,parameter,parameter12,parameter23,parameter13: real;
parameter1,parameter2,parameter3,parameter4,parameter5,parameter6,parameterx23,parametery23,parameterz23: real;
parameterx43,parametery43,parameterz43,parameterx45,parametery45,parameterz45,parH,parR,BD,DetX: real;
src_start_temp,src_route_temp,src_title_temp,src_mult_temp: array of widestring;
par_t1,par_t2,par_t3,par_t4,par_t5: real;
radius_sys: array of real;
povtor,ABC,BCD,reo_check: boolean;
a,probel: widestring;
atom_store_save: array of string;
arr_reo: array of integer;
label 0,1,6,10,60,600,100,140,150;
begin
povtor:=false;

if dial=false then begin
for L:=0 to nf-1 do begin
if (src_route_mult<>nil) then begin
  if (src_route_mult[L]<>nil) then begin
AssignFile(f,copy(Opendialog2.Files[L],1,pos('.',Opendialog2.Files[L])-1)+'_NewGJF.gjf');
Rewrite(f);
if src_start_mult<>nil then begin
  if src_start_mult[L]<>nil then begin
for i:=0 to length(src_start_mult[L])-1 do
if src_start_mult[L,i]<>'' then WriteLn(f,src_start_mult[L,i]);   //��������� ������
end;
end;
if src_route_mult<>nil then begin
  if src_route_mult[L]<>nil then begin
for i:=0 to length(src_route_mult[L])-1 do
if src_route_mult[L,i]<>'' then WriteLn(f,src_route_mult[L,i]);   //���������� ������
end;
end;
WriteLn(f,'');
if src_title_mult<>nil then begin
if src_title_mult[L]<>nil then begin
for i:=0 to length(src_title_mult[L])-1 do
if src_title_mult[L,i]<>'' then WriteLn(f,src_title_mult[L,i]);   //���������
end;
end;
WriteLn(f,'');
if src_mult_mult<>nil then begin
  if src_mult_mult[L]<>nil then begin
for i:=0 to length(src_mult_mult[L])-1 do
if src_mult_mult[L,i]<>'' then WriteLn(f,src_mult_mult[L,i]);     //��������������� � �����
end;
end;

rr:=nil;
aaa:=nil;
dddd:=nil;

aa_nomer_cycla:=nomer_cycla_mult[L];
if  (aa_nomer_cycla=0) or  (nomer_atoma_mult[L]=0) then begin
showmessage('���� '+OpenDialog2.Files[L] +'�� ����� ���� �������� ���������: ��������� �� ����������!');
goto 140;
end;
probel:='                                                          ';
if nomer_atoma_mult[L]>1 then SetLength(rr,nomer_atoma_mult[L]-1);
if nomer_atoma_mult[L]>2 then SetLength(aaa,nomer_atoma_mult[L]-2);
if nomer_atoma_mult[L]>3 then SetLength(dddd,nomer_atoma_mult[L]-3);


for i:=1 to nomer_atoma_mult[L] do begin
///WriteLn(f,atomoutel_mult[j,p,k] + copy(probel,1,16-length((FloatToStrF(StrToFloat(xout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(xout_mult[j,p,k]),ffFixed,10,razryd)   +    copy(probel,1,16-length((FloatToStrF(StrToFloat(yout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(yout_mult[j,p,k]),ffFixed,10,razryd)  +    copy(probel,1,16-length((FloatToStrF(StrToFloat(zout_mult[j,p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(zout_mult[j,p,k]),ffFixed,10,razryd));

///*******************************begin
if i=1 then WriteLn(f,atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i));
if i=2 then begin
if xout_mult[L,aa_nomer_cycla,i]='' then goto 100;
WriteLn(f,atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i)))+ atomoutel_mult[L,aa_nomer_cycla,i-1] +inttostr(i-1)+ Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i-1]+inttostr(i-1))) +  'r'+inttostr(i-1));
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-1]));
parameter:=sqrt(parameterx+parametery+parameterz);
rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(parameter,ffFixed,10,6);
end;
if i=3 then begin
if xout_mult[L,aa_nomer_cycla,i]='' then goto 100;


parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-1]));
par_t1:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-2]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-2]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-2]));
par_t2:=sqrt(parameterx+parametery+parameterz);


SetLength(radius_sys,nomer_atoma+1);
//���������� ���������� ���� � ������ �������� ���������
for j:=1 to nomer_atoma do
for t:=1 to length(radius)-2 do
if atomoutel_mult[L,aa_nomer_cycla,j]=center[t] then begin
if radius[t]<>'' then  radius_sys[j]:=strtofloat(radius[t]);
Break;
end;




if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then WriteLn(f,atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i)))+ atomoutel_mult[L,aa_nomer_cycla,i-1]+inttostr(i-1) + Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i-1]+inttostr(i-1))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i))) + atomoutel_mult[L,aa_nomer_cycla,i-2] +inttostr(i-2)+  Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i-2]+inttostr(i-2))) + 'a'+inttostr(i-2))
else  WriteLn(f,atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i)))+ atomoutel_mult[L,aa_nomer_cycla,i-2]+inttostr(i-2) + Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i-2]+inttostr(i-2))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i))) + atomoutel_mult[L,aa_nomer_cycla,i-1] +inttostr(i-1)+  Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i-1]+inttostr(i-1))) + 'a'+inttostr(i-2));

if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(par_t1,fffixed,10,6)
else  rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(par_t2,fffixed,10,6);


if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then begin
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-1]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i-1])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-2]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i-1])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-2]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i-1])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-2]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-2]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-2]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-2]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);
end
else begin
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-2]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-2]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-2]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i-2])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i-2])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i-2])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-1]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-1]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);
end;
end;




if i>=4 then begin
if xout_mult[L,aa_nomer_cycla,i]='' then Break;

////���� ��������� ����
par_t2:=100000000;
for j:=1 to i-1 do  begin
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,i-j]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,i-j]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,i-j]));
parameter:=sqrt(parameterx+parametery+parameterz);
if parameter-(radius_sys[i]+radius_sys[i-j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[i]+radius_sys[i-j]);                 // ������������� ���������� ����� �������
par_t1:=parameter;
reo1:=i-j;                           // ����� ���� ����� (i-j), ������� ����� ������ � ������ i
end;
end;

//������ ���� ��������� ���� � ����������, �.�. ���� ��� i-j-���� �����
par_t2:=10000000000;
for j:=1 to i-1 do begin
if j<>reo1 then begin
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,reo1])  -    strtofloat(xout_mult[L,aa_nomer_cycla,j]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,reo1])  -    strtofloat(yout_mult[L,aa_nomer_cycla,j]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,reo1])  -    strtofloat(zout_mult[L,aa_nomer_cycla,j]));
parameter:=sqrt(parameterx+parametery+parameterz);
//if parameter=0 then parameter:=10000000000;       //������� ��� ���� ���� � ���-����� �����������, �� �������� ��� ����������� ���� ����������
if parameter-(radius_sys[reo1]+radius_sys[j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[reo1]+radius_sys[j]);                 // ������������� ���������� ����� �������
par_t3:=parameter;
reo2:=j;                           // ����� ���� �����, ������� ����� ������ � ������ # reo1
end;
end;
end;


//������� ���������� 4-�� ���� � ������� - reo3:
par_t2:=10000000000;
for j:=1 to i-1 do begin
if (j<>reo1) and (j<>reo2) then begin
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,reo2])  -    strtofloat(xout_mult[L,aa_nomer_cycla,j]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,reo2])  -    strtofloat(yout_mult[L,aa_nomer_cycla,j]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,reo2])  -    strtofloat(zout_mult[L,aa_nomer_cycla,j]));
parameter:=sqrt(parameterx+parametery+parameterz);
if parameter-(radius_sys[reo2]+radius_sys[j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[reo2]+radius_sys[j]);                 // ������������� ���������� ����� �������
par_t4:=parameter;
reo3:=j;                           // ����� ���� �����, ������� ����� ������ � ������ # reo2
end;
end;
end;


/// i-reo1-reo2-reo3 - �������� ������� ���������� ������ - ����������
/// ���� ����� �������� ��������� ����� �������, �� ����� ������� ���������
// ��� ������  parameter-(radius_sys[reo2]+radius_sys[j]) ������, �������� 0.2 �� Break;
// ��� ��� ����� ���������, ����  parameter<=(radius_sys[reo2]+radius_sys[j])*0.1 then Break;
// ��� ������� ��� ������� �� ���������� ����� ������

// ���������� ����� �� ��������� ���������� ���������� ��� ����������� ����
// ���� DetX=0 �� �������� �������� ���� ������ ������



600: DetX:=(strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,i])) * (strtofloat(yout_mult[L,aa_nomer_cycla,reo3])-strtofloat(yout_mult[L,aa_nomer_cycla,i])) * (strtofloat(zout_mult[L,aa_nomer_cycla,reo1])-strtofloat(zout_mult[L,aa_nomer_cycla,i]))  +
         (strtofloat(xout_mult[L,aa_nomer_cycla,reo3])-strtofloat(xout_mult[L,aa_nomer_cycla,i])) * (strtofloat(yout_mult[L,aa_nomer_cycla,reo1])-strtofloat(yout_mult[L,aa_nomer_cycla,i])) * (strtofloat(zout_mult[L,aa_nomer_cycla,reo2])-strtofloat(zout_mult[L,aa_nomer_cycla,i]))  +
         (strtofloat(xout_mult[L,aa_nomer_cycla,reo1])-strtofloat(xout_mult[L,aa_nomer_cycla,i])) * (strtofloat(yout_mult[L,aa_nomer_cycla,reo2])-strtofloat(yout_mult[L,aa_nomer_cycla,i])) * (strtofloat(zout_mult[L,aa_nomer_cycla,reo3])-strtofloat(zout_mult[L,aa_nomer_cycla,i]))  -
         (strtofloat(xout_mult[L,aa_nomer_cycla,reo1])-strtofloat(xout_mult[L,aa_nomer_cycla,i])) * (strtofloat(yout_mult[L,aa_nomer_cycla,reo3])-strtofloat(yout_mult[L,aa_nomer_cycla,i])) * (strtofloat(zout_mult[L,aa_nomer_cycla,reo2])-strtofloat(zout_mult[L,aa_nomer_cycla,i]))  -
         (strtofloat(xout_mult[L,aa_nomer_cycla,reo3])-strtofloat(xout_mult[L,aa_nomer_cycla,i])) * (strtofloat(yout_mult[L,aa_nomer_cycla,reo2])-strtofloat(yout_mult[L,aa_nomer_cycla,i])) * (strtofloat(zout_mult[L,aa_nomer_cycla,reo1])-strtofloat(zout_mult[L,aa_nomer_cycla,i]))  -
         (strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,i])) * (strtofloat(yout_mult[L,aa_nomer_cycla,reo1])-strtofloat(yout_mult[L,aa_nomer_cycla,i])) * (strtofloat(zout_mult[L,aa_nomer_cycla,reo3])-strtofloat(zout_mult[L,aa_nomer_cycla,i]));



// ���� ����� ��������� ��� DetX=0 - ��������� ����� ABCD �� ������� �������������� ����� ������
ABC:=false;
BCD:=false;

if DetX=0 then  begin
//��������� ����� ABC
if (strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,i])<>0) and  (strtofloat(yout_mult[L,aa_nomer_cycla,reo2])-strtofloat(yout_mult[L,aa_nomer_cycla,i])<>0)  and  (strtofloat(zout_mult[L,aa_nomer_cycla,reo2])-strtofloat(zout_mult[L,aa_nomer_cycla,i])<>0) then begin
if ((strtofloat(xout_mult[L,aa_nomer_cycla,reo1])-strtofloat(xout_mult[L,aa_nomer_cycla,i]))/(strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,i]))=(strtofloat(yout_mult[L,aa_nomer_cycla,reo1])-strtofloat(yout_mult[L,aa_nomer_cycla,i]))/(strtofloat(yout_mult[L,aa_nomer_cycla,reo2])-strtofloat(yout_mult[L,aa_nomer_cycla,i]))) and ((strtofloat(xout_mult[L,aa_nomer_cycla,reo1])-strtofloat(xout_mult[L,aa_nomer_cycla,i]))/(strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,i]))=(strtofloat(zout_mult[L,aa_nomer_cycla,reo1])-strtofloat(zout_mult[L,aa_nomer_cycla,i]))/(strtofloat(zout_mult[L,aa_nomer_cycla,reo2])-strtofloat(zout_mult[L,aa_nomer_cycla,i]))) then
//ABC ����� �� ����� ������
ABC:=true;
end;
if (strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,i])=0) or  (strtofloat(yout_mult[L,aa_nomer_cycla,reo2])-strtofloat(yout_mult[L,aa_nomer_cycla,i])=0)  or  (strtofloat(zout_mult[L,aa_nomer_cycla,reo2])-strtofloat(zout_mult[L,aa_nomer_cycla,i])=0) then begin
if (strtofloat(xout_mult[L,aa_nomer_cycla,reo1])-strtofloat(xout_mult[L,aa_nomer_cycla,i])=strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,i])) and  (strtofloat(yout_mult[L,aa_nomer_cycla,reo1])-strtofloat(yout_mult[L,aa_nomer_cycla,i])=strtofloat(yout_mult[L,aa_nomer_cycla,reo2])-strtofloat(yout_mult[L,aa_nomer_cycla,i])) and  (strtofloat(zout_mult[L,aa_nomer_cycla,reo1])-strtofloat(zout_mult[L,aa_nomer_cycla,i])=strtofloat(zout_mult[L,aa_nomer_cycla,reo2])-strtofloat(zout_mult[L,aa_nomer_cycla,i]))  then
//ABC ����� �� ����� ������
ABC:=true;
end;
//��������� ����� BCD
if (strtofloat(xout_mult[L,aa_nomer_cycla,reo3])-strtofloat(xout_mult[L,aa_nomer_cycla,reo1])<>0) and  (strtofloat(yout_mult[L,aa_nomer_cycla,reo3])-strtofloat(yout_mult[L,aa_nomer_cycla,reo1])<>0)  and  (strtofloat(zout_mult[L,aa_nomer_cycla,reo3])-strtofloat(zout_mult[L,aa_nomer_cycla,reo1])<>0) then begin
if ((strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,reo1]))/(strtofloat(xout_mult[L,aa_nomer_cycla,reo3])-strtofloat(xout_mult[L,aa_nomer_cycla,reo1]))=(strtofloat(yout_mult[L,aa_nomer_cycla,reo2])-strtofloat(yout_mult[L,aa_nomer_cycla,reo1]))/(strtofloat(yout_mult[L,aa_nomer_cycla,reo3])-strtofloat(yout_mult[L,aa_nomer_cycla,reo1]))) and ((strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,reo1]))/(strtofloat(xout_mult[L,aa_nomer_cycla,reo3])-strtofloat(xout_mult[L,aa_nomer_cycla,reo1]))=(strtofloat(zout_mult[L,aa_nomer_cycla,reo2])-strtofloat(zout_mult[L,aa_nomer_cycla,reo1]))/(strtofloat(zout_mult[L,aa_nomer_cycla,reo3])-strtofloat(zout_mult[L,aa_nomer_cycla,reo1]))) then
//BCD ����� �� ����� ������
BCD:=true;
end;
if (strtofloat(xout_mult[L,aa_nomer_cycla,reo3])-strtofloat(xout_mult[L,aa_nomer_cycla,reo1])=0) or  (strtofloat(yout_mult[L,aa_nomer_cycla,reo3])-strtofloat(yout_mult[L,aa_nomer_cycla,reo1])=0)  or  (strtofloat(zout_mult[L,aa_nomer_cycla,reo3])-strtofloat(zout_mult[L,aa_nomer_cycla,reo1])=0) then begin
if (strtofloat(xout_mult[L,aa_nomer_cycla,reo2])-strtofloat(xout_mult[L,aa_nomer_cycla,reo1])=strtofloat(xout_mult[L,aa_nomer_cycla,reo3])-strtofloat(xout_mult[L,aa_nomer_cycla,reo1])) and  (strtofloat(yout_mult[L,aa_nomer_cycla,reo2])-strtofloat(yout_mult[L,aa_nomer_cycla,reo1])=strtofloat(yout_mult[L,aa_nomer_cycla,reo3])-strtofloat(yout_mult[L,aa_nomer_cycla,reo1])) and  (strtofloat(zout_mult[L,aa_nomer_cycla,reo2])-strtofloat(zout_mult[L,aa_nomer_cycla,reo1])=strtofloat(zout_mult[L,aa_nomer_cycla,reo3])-strtofloat(zout_mult[L,aa_nomer_cycla,reo1]))  then
//BCD ����� �� ����� ������
BCD:=true;
end;
end;


//���� ��������� ��� 3 ����� �� ����� ������, �� ������� ���������� ���� �������� ������� ���������� ������
if (ABC=true) and (BCD=false) then begin
// ABCD ----> ABDC  =  reo3 <-----> reo2
reo_tmp:=reo3;
reo3:=reo2;
reo2:=reo_tmp;
goto 600;               // ����� ���� �� ������������ � ������ ������������
end;

//���� ��������� ��� 3 ����� �� ����� ������, �� ������� ���������� ���� �������� ������� ���������� ������
if (ABC=false) and (BCD=true) then begin
reo_check:=false;
// ABCD ----> BACD  =  reo1 <-----> i  // ��� ������ - ���� i - ������
// ���� ������ ������ ����� ����� D - ABC - ���������
setlength(arr_reo,length(arr_reo)+1);
arr_reo[length(arr_reo)-1]:=reo3;
for j:=1 to i-1 do  begin
if  j<>reo3 then begin
for t:=0 to length(arr_reo)-1 do
if arr_reo[t]<>j then  begin
reo_check:=true;
Break;
end;
end;
if reo_check=true then begin
reo3:=j;
goto 600;
end;
end;               // ����� ���� �� ������������ � ������ ������������
if reo_check=false then  begin
showmessage('���������� �������� Z-�������! ��� ������ �� ����� ������! ��������� � ���������� ����������� ��� ��������� ���������� ������� �������, ��������������� Z-�������!');
goto 0;
end;
end;




if (ABC=true) and (BCD=true) then begin   //������ ����� �� ����� ������
//�������� ������ ������� ������ ����� ����� ����� �������
//���� ����� ������� �� �����, ����� ������ ��������� ,,������������� � ���������� �����������,,
//����� ����� i � ����� ������ �������� � ��������

// ��������� ��� � ���������� ������ - ����� ����������� ������ � ���������������� 1 ����
reo_check:=false;
setlength(arr_reo,length(arr_reo)+1);
arr_reo[length(arr_reo)-1]:=reo3;
for j:=1 to i-1 do  begin
if  j<>reo3 then begin
for t:=0 to length(arr_reo)-1 do
if arr_reo[t]<>j then  begin
reo_check:=true;
Break;
end;
end;
if reo_check=true then begin
reo3:=j;
goto 600;
end;
end;               // ����� ���� �� ������������ � ������ ������������
if reo_check=false then  begin
showmessage('���������� �������� Z-�������! ��� ������ �� ����� ������! ��������� � ���������� ����������� ��� ��������� ���������� ������� �������, ��������������� Z-�������!');
goto 0;
end;
end;




WriteLn(f,atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,i]+inttostr(i)))+ atomoutel_mult[L,aa_nomer_cycla,reo1] +inttostr(reo1)+ Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,reo1]+inttostr(reo1))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i-1))) + atomoutel_mult[L,aa_nomer_cycla,reo2] +inttostr(reo2)+  Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,reo2]+inttostr(reo2))) + 'a'+inttostr(i-2)  +   Copy(probel,1,8-length('a'+inttostr(i-2))) + atomoutel_mult[L,aa_nomer_cycla,reo3]+inttostr(reo3) + Copy(probel,1,8-length(atomoutel_mult[L,aa_nomer_cycla,reo3]+inttostr(reo3)))  + 'd'+inttostr(i-3));
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,reo1]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,reo1]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,reo1]));
parameter:=sqrt(parameterx+parametery+parameterz);
rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(parameter,fffixed,10,6);

parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,reo1]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,reo1]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,reo1]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,reo1])  -    strtofloat(xout_mult[L,aa_nomer_cycla,reo2]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,reo1])  -    strtofloat(yout_mult[L,aa_nomer_cycla,reo2]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,reo1])  -    strtofloat(zout_mult[L,aa_nomer_cycla,reo2]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,reo2]));
parametery:= sqr(  strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,reo2]));
parameterz:= sqr(  strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,reo2]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);


parameterx23:= strtofloat(xout_mult[L,aa_nomer_cycla,i])  -    strtofloat(xout_mult[L,aa_nomer_cycla,reo1]);
parametery23:= strtofloat(yout_mult[L,aa_nomer_cycla,i])  -    strtofloat(yout_mult[L,aa_nomer_cycla,reo1]);
parameterz23:= strtofloat(zout_mult[L,aa_nomer_cycla,i])  -    strtofloat(zout_mult[L,aa_nomer_cycla,reo1]);

parameterx43:= strtofloat(xout_mult[L,aa_nomer_cycla,reo2])  -   strtofloat(xout_mult[L,aa_nomer_cycla,reo1]);
parametery43:= strtofloat(yout_mult[L,aa_nomer_cycla,reo2])  -   strtofloat(yout_mult[L,aa_nomer_cycla,reo1]);
parameterz43:= strtofloat(zout_mult[L,aa_nomer_cycla,reo2])  -   strtofloat(zout_mult[L,aa_nomer_cycla,reo1]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(xout_mult[L,aa_nomer_cycla,reo3])  -    strtofloat(xout_mult[L,aa_nomer_cycla,reo2]);
parametery45:= strtofloat(yout_mult[L,aa_nomer_cycla,reo3])  -    strtofloat(yout_mult[L,aa_nomer_cycla,reo2]);
parameterz45:= strtofloat(zout_mult[L,aa_nomer_cycla,reo3])  -    strtofloat(zout_mult[L,aa_nomer_cycla,reo2]);

parameter4:= parametery43*parameterz45-parametery45*parameterz43; // A
parameter5:= parameterz43*parameterx45-parameterx43*parameterz45; // B
parameter6:= parameterx43*parametery45-parametery43*parameterx45; // B

parH:=parameter1*parameter4+parameter2*parameter5+parameter3*parameter6;
parR:=sqrt(sqr(parameter1)+ sqr(parameter2)+  sqr(parameter3));
BD:=sqrt(sqr(parameter4)+ sqr(parameter5)+  sqr(parameter6));


if DetX>0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:=180 - ArcCos( parH/(parR*BD))*180/pi;
  if abs(parH/(parR*BD))>1 then parameter:=180 - ArcCos(Round(parH/(parR*BD)))*180/pi;
end;
if DetX<0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:= ArcCos( parH/(parR*BD))*180/pi - 180;
  if abs(parH/(parR*BD))>1 then  parameter:= ArcCos(Round(parH/(parR*BD)))*180/pi - 180;
end;
if DetX=0 then  begin
//showmessage('��� ������� ������ ����� �� ����� ������. ���������� ���� �� ���������'+#13 +'���������� ������������ ������ ����� ��� ��������� ����������������!');
if (ABC=false) and (BCD=false) then begin
if parH>0 then parameter:= 180.000000;
if parH<0 then parameter:= 0.000000;
end
end;

dddd[i-4]:='d'+inttostr(i-3)+' = ' +floattostrf(parameter,fffixed,10,4);


end;






////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

///*******************************end

end;
100:
WriteLn(f,'Variables:');
for i:=0 to length(rr)-1 do
if rr[i]<>'' then WriteLn(f,rr[i]);
for i:=0 to length(aaa)-1 do
if aaa[i]<>'' then WriteLn(f,aaa[i]);
for i:=0 to length(dddd)-1 do
if dddd[i]<>'' then WriteLn(f,dddd[i]);
WriteLn(f,'');

140:

CloseFile(f);


end;








end;
end;



end;
/////////////////////////////////////////////
//////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////





































if (dial=true) and (OpenDialog1.FilterIndex=3) then begin
ShowMessage('����� ���� XYZ ����� ���� ��������� ������ ����� ������ ������');
goto 0;
end;

if (dial=true) and (OpenDialog1.FilterIndex=1) then begin
if (x<>nil) and (y<>nil) and (z<>nil) then begin

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_start)-1 do begin
if i=0 then begin
SetLength(src_start_temp,length(src_start_temp)+1);
src_start_temp[length(src_start_temp)-1]:=src_start[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_start[i]=src_start[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_start_temp,length(src_start_temp)+1);
src_start_temp[length(src_start_temp)-1]:=src_start[i];
end;
end;
end;
Setlength(src_start,length(src_start_temp));
for i:=0 to length(src_start)-1 do
src_start[i]:=src_start_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_route)-1 do begin
if i=0 then begin
SetLength(src_route_temp,length(src_route_temp)+1);
src_route_temp[length(src_route_temp)-1]:=src_route[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_route[i]=src_route[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_route_temp,length(src_route_temp)+1);
src_route_temp[length(src_route_temp)-1]:=src_route[i];
end;
end;
end;
Setlength(src_route,length(src_route_temp));
for i:=0 to length(src_route)-1 do
src_route[i]:=src_route_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_title)-1 do begin
if i=0 then begin
SetLength(src_title_temp,length(src_title_temp)+1);
src_title_temp[length(src_title_temp)-1]:=src_title[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_title[i]=src_title[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_title_temp,length(src_title_temp)+1);
src_title_temp[length(src_title_temp)-1]:=src_title[i];
end;
end;
end;
Setlength(src_title,length(src_title_temp));
for i:=0 to length(src_title)-1 do
src_title[i]:=src_title_temp[i];
////////////////////////////////////////////////////////////////

/////////////////�������� ��������///////////////////////////
for i:=0 to length(src_mult)-1 do begin
if i=0 then begin
SetLength(src_mult_temp,length(src_mult_temp)+1);
src_mult_temp[length(src_mult_temp)-1]:=src_mult[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_mult[i]=src_mult[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_mult_temp,length(src_mult_temp)+1);
src_mult_temp[length(src_mult_temp)-1]:=src_mult[i];
end;
end;
end;
Setlength(src_mult,length(src_mult_temp));
for i:=0 to length(src_mult)-1 do
src_mult[i]:=src_mult_temp[i];
////////////////////////////////////////////////////////////////





if SaveDialog1.Execute=true then begin
if  pos('.gjf',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.gjf';
AssignFile(f,a);
Rewrite(f);
if src_start<>nil then begin
for i:=0 to length(src_start)-1 do
if src_start[i]<>'' then WriteLn(f,src_start[i]);   //��������� ������
end;
if src_route<>nil then begin
for i:=0 to length(src_route)-1 do
if src_route[i]<>'' then WriteLn(f,src_route[i]);   //���������� ������
end;
WriteLn(f,'');
if src_title<>nil then begin
for i:=0 to length(src_title)-1 do
if src_title[i]<>'' then WriteLn(f,src_title[i]);   //���������
end;
WriteLn(f,'');
if src_mult<>nil then begin
for i:=0 to length(src_mult)-1 do
if src_mult[i]<>'' then WriteLn(f,src_mult[i]);     //��������������� � �����
end;

if atom_store[1]='' then begin
showmessage('���� '+OpenDialog1.FileName +'�� ����� ���� �������� ���������: ��������� �� ����������!');
goto 150;
end;

probel:='                                                          ';
if nomer_atoma>1 then SetLength(rr,nomer_atoma-1);
if nomer_atoma>2 then SetLength(aaa,nomer_atoma-2);
if nomer_atoma>3 then SetLength(dddd,nomer_atoma-3);


SetLength(atom_store_save,length(atom_store));

for k:=1 to length(atom_store)-1 do
for p:=1 to length(atom_store[k]) do begin
if atom_store[k][p] in ['A'..'Z','a'..'z'] then atom_store_save[k]:=atom_store_save[k]+atom_store[k][p] //������ ����� ���� ���� Mg1, Br_1,...
else break;
end;




for i:=1 to nomer_atoma do begin
if i=1 then WriteLn(f,atom_store_save[i]+inttostr(i));
if i=2 then begin
if x[i]='' then goto 1;
WriteLn(f,atom_store_save[i]+inttostr(i)+Copy(probel,1,8-length(atom_store_save[i]+inttostr(i)))+ atom_store_save[i-1] +inttostr(i-1)+ Copy(probel,1,8-length(atom_store_save[i-1]+inttostr(i-1))) +  'r'+inttostr(i-1));
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[i-1]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[i-1]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[i-1]));
parameter:=sqrt(parameterx+parametery+parameterz);
rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(parameter,ffFixed,10,6);
end;
if i=3 then begin
if x[i]='' then goto 1;


parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[i-1]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[i-1]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[i-1]));
par_t1:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[i-2]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[i-2]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[i-2]));
par_t2:=sqrt(parameterx+parametery+parameterz);


SetLength(radius_sys,nomer_atoma+1);
//���������� ���������� ���� � ������ �������� ���������
for j:=1 to nomer_atoma do
for k:=1 to length(radius)-2 do
if atom_store_save[j]=center[k] then begin
if radius[k]<>'' then  radius_sys[j]:=strtofloat(radius[k]);
Break;
end;









if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then WriteLn(f,atom_store_save[i]+inttostr(i)+Copy(probel,1,8-length(atom_store_save[i]+inttostr(i)))+ atom_store_save[i-1]+inttostr(i-1) + Copy(probel,1,8-length(atom_store_save[i-1]+inttostr(i-1))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i))) + atom_store_save[i-2] +inttostr(i-2)+  Copy(probel,1,8-length(atom_store_save[i-2]+inttostr(i-2))) + 'a'+inttostr(i-2))
else  WriteLn(f,atom_store_save[i]+inttostr(i)+Copy(probel,1,8-length(atom_store_save[i]+inttostr(i)))+ atom_store_save[i-2]+inttostr(i-2) + Copy(probel,1,8-length(atom_store_save[i-2]+inttostr(i-2))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i))) + atom_store_save[i-1] +inttostr(i-1)+  Copy(probel,1,8-length(atom_store_save[i-1]+inttostr(i-1))) + 'a'+inttostr(i-2));

if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(par_t1,fffixed,10,6)
else  rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(par_t2,fffixed,10,6);


if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then begin
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[i-1]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[i-1]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[i-1]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(x[i-1])  -    strtofloat(x[i-2]));
parametery:= sqr(  strtofloat(y[i-1])  -    strtofloat(y[i-2]));
parameterz:= sqr(  strtofloat(z[i-1])  -    strtofloat(z[i-2]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[i-2]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[i-2]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[i-2]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);
end
else begin
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[i-2]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[i-2]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[i-2]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(x[i-2])  -    strtofloat(x[i-1]));
parametery:= sqr(  strtofloat(y[i-2])  -    strtofloat(y[i-1]));
parameterz:= sqr(  strtofloat(z[i-2])  -    strtofloat(z[i-1]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[i-1]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[i-1]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[i-1]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);
end;
end;



if i>=4 then begin
if x[i]='' then Break;

////���� ��������� ����
par_t2:=100000000;
for j:=1 to i-1 do  begin
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[i-j]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[i-j]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[i-j]));
parameter:=sqrt(parameterx+parametery+parameterz);
if parameter-(radius_sys[i]+radius_sys[i-j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[i]+radius_sys[i-j]);                 // ������������� ���������� ����� �������
par_t1:=parameter;
reo1:=i-j;                           // ����� ���� ����� (i-j), ������� ����� ������ � ������ i
end;
end;

//������ ���� ��������� ���� � ����������, �.�. ���� ��� i-j-���� �����
par_t2:=10000000000;
for j:=1 to i-1 do begin
if j<>reo1 then begin
parameterx:= sqr(  strtofloat(x[reo1])  -    strtofloat(x[j]));
parametery:= sqr(  strtofloat(y[reo1])  -    strtofloat(y[j]));
parameterz:= sqr(  strtofloat(z[reo1])  -    strtofloat(z[j]));
parameter:=sqrt(parameterx+parametery+parameterz);
//if parameter=0 then parameter:=10000000000;       //������� ��� ���� ���� � ���-����� �����������, �� �������� ��� ����������� ���� ����������
if parameter-(radius_sys[reo1]+radius_sys[j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[reo1]+radius_sys[j]);                 // ������������� ���������� ����� �������
par_t3:=parameter;
reo2:=j;                           // ����� ���� �����, ������� ����� ������ � ������ # reo1
end;
end;
end;


//������� ���������� 4-�� ���� � ������� - reo3:
par_t2:=10000000000;
for j:=1 to i-1 do begin
if (j<>reo1) and (j<>reo2) then begin
parameterx:= sqr(  strtofloat(x[reo2])  -    strtofloat(x[j]));
parametery:= sqr(  strtofloat(y[reo2])  -    strtofloat(y[j]));
parameterz:= sqr(  strtofloat(z[reo2])  -    strtofloat(z[j]));
parameter:=sqrt(parameterx+parametery+parameterz);
if parameter-(radius_sys[reo2]+radius_sys[j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[reo2]+radius_sys[j]);                 // ������������� ���������� ����� �������
par_t4:=parameter;
reo3:=j;                           // ����� ���� �����, ������� ����� ������ � ������ # reo2
end;
end;
end;


/// i-reo1-reo2-reo3 - �������� ������� ���������� ������ - ����������
/// ���� ����� �������� ��������� ����� �������, �� ����� ������� ���������
// ��� ������  parameter-(radius_sys[reo2]+radius_sys[j]) ������, �������� 0.2 �� Break;
// ��� ��� ����� ���������, ����  parameter<=(radius_sys[reo2]+radius_sys[j])*0.1 then Break;
// ��� ������� ��� ������� �� ���������� ����� ������

// ���������� ����� �� ��������� ���������� ���������� ��� ����������� ����
// ���� DetX=0 �� �������� �������� ���� ������ ������



6: DetX:=(strtofloat(x[reo2])-strtofloat(x[i])) * (strtofloat(y[reo3])-strtofloat(y[i])) * (strtofloat(z[reo1])-strtofloat(z[i]))  +
         (strtofloat(x[reo3])-strtofloat(x[i])) * (strtofloat(y[reo1])-strtofloat(y[i])) * (strtofloat(z[reo2])-strtofloat(z[i]))  +
         (strtofloat(x[reo1])-strtofloat(x[i])) * (strtofloat(y[reo2])-strtofloat(y[i])) * (strtofloat(z[reo3])-strtofloat(z[i]))  -
         (strtofloat(x[reo1])-strtofloat(x[i])) * (strtofloat(y[reo3])-strtofloat(y[i])) * (strtofloat(z[reo2])-strtofloat(z[i]))  -
         (strtofloat(x[reo3])-strtofloat(x[i])) * (strtofloat(y[reo2])-strtofloat(y[i])) * (strtofloat(z[reo1])-strtofloat(z[i]))  -
         (strtofloat(x[reo2])-strtofloat(x[i])) * (strtofloat(y[reo1])-strtofloat(y[i])) * (strtofloat(z[reo3])-strtofloat(z[i]));

// ���� ����� ��������� ��� DetX=0 - ��������� ����� ABCD �� ������� �������������� ����� ������
ABC:=false;
BCD:=false;

if DetX=0 then  begin
//��������� ����� ABC
if (strtofloat(x[reo2])-strtofloat(x[i])<>0) and  (strtofloat(y[reo2])-strtofloat(y[i])<>0)  and  (strtofloat(z[reo2])-strtofloat(z[i])<>0) then begin
if ((strtofloat(x[reo1])-strtofloat(x[i]))/(strtofloat(x[reo2])-strtofloat(x[i]))=(strtofloat(y[reo1])-strtofloat(y[i]))/(strtofloat(y[reo2])-strtofloat(y[i]))) and ((strtofloat(x[reo1])-strtofloat(x[i]))/(strtofloat(x[reo2])-strtofloat(x[i]))=(strtofloat(z[reo1])-strtofloat(z[i]))/(strtofloat(z[reo2])-strtofloat(z[i]))) then
//ABC ����� �� ����� ������
ABC:=true;
end;
if (strtofloat(x[reo2])-strtofloat(x[i])=0) or  (strtofloat(y[reo2])-strtofloat(y[i])=0)  or  (strtofloat(z[reo2])-strtofloat(z[i])=0) then begin
if (strtofloat(x[reo1])-strtofloat(x[i])=strtofloat(x[reo2])-strtofloat(x[i])) and  (strtofloat(y[reo1])-strtofloat(y[i])=strtofloat(y[reo2])-strtofloat(y[i])) and  (strtofloat(z[reo1])-strtofloat(z[i])=strtofloat(z[reo2])-strtofloat(z[i]))  then
//ABC ����� �� ����� ������
ABC:=true;
end;
//��������� ����� BCD
if (strtofloat(x[reo3])-strtofloat(x[reo1])<>0) and  (strtofloat(y[reo3])-strtofloat(y[reo1])<>0)  and  (strtofloat(z[reo3])-strtofloat(z[reo1])<>0) then begin
if ((strtofloat(x[reo2])-strtofloat(x[reo1]))/(strtofloat(x[reo3])-strtofloat(x[reo1]))=(strtofloat(y[reo2])-strtofloat(y[reo1]))/(strtofloat(y[reo3])-strtofloat(y[reo1]))) and ((strtofloat(x[reo2])-strtofloat(x[reo1]))/(strtofloat(x[reo3])-strtofloat(x[reo1]))=(strtofloat(z[reo2])-strtofloat(z[reo1]))/(strtofloat(z[reo3])-strtofloat(z[reo1]))) then
//BCD ����� �� ����� ������
BCD:=true;
end;
if (strtofloat(x[reo3])-strtofloat(x[reo1])=0) or  (strtofloat(y[reo3])-strtofloat(y[reo1])=0)  or  (strtofloat(z[reo3])-strtofloat(z[reo1])=0) then begin
if (strtofloat(x[reo2])-strtofloat(x[reo1])=strtofloat(x[reo3])-strtofloat(x[reo1])) and  (strtofloat(y[reo2])-strtofloat(y[reo1])=strtofloat(y[reo3])-strtofloat(y[reo1])) and  (strtofloat(z[reo2])-strtofloat(z[reo1])=strtofloat(z[reo3])-strtofloat(z[reo1]))  then
//BCD ����� �� ����� ������
BCD:=true;
end;
end;

//���� ��������� ��� 3 ����� �� ����� ������, �� ������� ���������� ���� �������� ������� ���������� ������
if (ABC=true) and (BCD=false) then begin
// ABCD ----> ABDC  =  reo3 <-----> reo2
reo_tmp:=reo3;
reo3:=reo2;
reo2:=reo_tmp;
goto 6;               // ����� ���� �� ������������ � ������ ������������
end;

//���� ��������� ��� 3 ����� �� ����� ������, �� ������� ���������� ���� �������� ������� ���������� ������
if (ABC=false) and (BCD=true) then begin
reo_check:=false;
// ABCD ----> BACD  =  reo1 <-----> i  // ��� ������ - ���� i - ������
// ���� ������ ������ ����� ����� D - ABC - ���������
setlength(arr_reo,length(arr_reo)+1);
arr_reo[length(arr_reo)-1]:=reo3;
for j:=1 to i-1 do  begin
if  j<>reo3 then begin
for k:=0 to length(arr_reo)-1 do
if arr_reo[k]<>j then  begin
reo_check:=true;
Break;
end;
end;
if reo_check=true then begin
reo3:=j;
goto 6;
end;
end;               // ����� ���� �� ������������ � ������ ������������
if reo_check=false then  begin
showmessage('���������� �������� Z-�������! ��� ������ �� ����� ������! ��������� � ���������� ����������� ��� ��������� ���������� ������� �������, ��������������� Z-�������!');
goto 0;
end;
end;










if (ABC=true) and (BCD=true) then begin   //������ ����� �� ����� ������
//�������� ������ ������� ������ ����� ����� ����� �������
//���� ����� ������� �� �����, ����� ������ ��������� ,,������������� � ���������� �����������,,
//����� ����� i � ����� ������ �������� � ��������

// ��������� ��� � ���������� ������ - ����� ����������� ������ � ���������������� 1 ����
reo_check:=false;
setlength(arr_reo,length(arr_reo)+1);
arr_reo[length(arr_reo)-1]:=reo3;
for j:=1 to i-1 do  begin
if  j<>reo3 then begin
for k:=0 to length(arr_reo)-1 do
if arr_reo[k]<>j then  begin
reo_check:=true;
Break;
end;
end;
if reo_check=true then begin
reo3:=j;
goto 6;
end;
end;               // ����� ���� �� ������������ � ������ ������������
if reo_check=false then  begin
showmessage('���������� �������� Z-�������! ��� ������ �� ����� ������! ��������� � ���������� ����������� ��� ��������� ���������� ������� �������, ��������������� Z-�������!');
goto 0;
end;




end;
















WriteLn(f,atom_store_save[i]+inttostr(i)+Copy(probel,1,8-length(atom_store_save[i]+inttostr(i)))+ atom_store_save[reo1] +inttostr(reo1)+ Copy(probel,1,8-length(atom_store_save[reo1]+inttostr(reo1))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i-1))) + atom_store_save[reo2] +inttostr(reo2)+  Copy(probel,1,8-length(atom_store_save[reo2]+inttostr(reo2))) + 'a'+inttostr(i-2)  +   Copy(probel,1,8-length('a'+inttostr(i-2))) + atom_store_save[reo3]+inttostr(reo3) + Copy(probel,1,8-length(atom_store_save[reo3]+inttostr(reo3)))  + 'd'+inttostr(i-3));
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[reo1]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[reo1]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[reo1]));
parameter:=sqrt(parameterx+parametery+parameterz);
rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(parameter,fffixed,10,6);

parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[reo1]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[reo1]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[reo1]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(x[reo1])  -    strtofloat(x[reo2]));
parametery:= sqr(  strtofloat(y[reo1])  -    strtofloat(y[reo2]));
parameterz:= sqr(  strtofloat(z[reo1])  -    strtofloat(z[reo2]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(x[i])  -    strtofloat(x[reo2]));
parametery:= sqr(  strtofloat(y[i])  -    strtofloat(y[reo2]));
parameterz:= sqr(  strtofloat(z[i])  -    strtofloat(z[reo2]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);


parameterx23:= strtofloat(x[i])  -    strtofloat(x[reo1]);
parametery23:= strtofloat(y[i])  -    strtofloat(y[reo1]);
parameterz23:= strtofloat(z[i])  -    strtofloat(z[reo1]);

parameterx43:= strtofloat(x[reo2])  -   strtofloat(x[reo1]);
parametery43:= strtofloat(y[reo2])  -   strtofloat(y[reo1]);
parameterz43:= strtofloat(z[reo2])  -   strtofloat(z[reo1]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(x[reo3])  -    strtofloat(x[reo2]);
parametery45:= strtofloat(y[reo3])  -    strtofloat(y[reo2]);
parameterz45:= strtofloat(z[reo3])  -    strtofloat(z[reo2]);

parameter4:= parametery43*parameterz45-parametery45*parameterz43; // A
parameter5:= parameterz43*parameterx45-parameterx43*parameterz45; // B
parameter6:= parameterx43*parametery45-parametery43*parameterx45; // B

parH:=parameter1*parameter4+parameter2*parameter5+parameter3*parameter6;
parR:=sqrt(sqr(parameter1)+ sqr(parameter2)+  sqr(parameter3));
BD:=sqrt(sqr(parameter4)+ sqr(parameter5)+  sqr(parameter6));


//DetX:=(strtofloat(x[i-2])-strtofloat(x[i])) * (strtofloat(y[i-3])-strtofloat(y[i])) *(strtofloat(z[i-1])-strtofloat(
//z[i]))  +  (strtofloat(x[i-3])-strtofloat(x[i])) * (strtofloat(y[i-1])-strtofloat(y[i])) *(strtofloat(z[i-2])-strtofloat(z[i]))  +  (strtofloat(
//x[i-1])-strtofloat(x[i])) * (strtofloat(y[i-2])-strtofloat(y[i])) *(strtofloat(z[i-3])-strtofloat(z[i])) - (strtofloat(x[i-1])-strtofloat(x[i])) * (strtofloat(y[i-3])-strtofloat(
//y[i])) *(strtofloat(z[i-2])-strtofloat(z[i])) - (strtofloat(x[i-3])-strtofloat(x[i])) * (strtofloat(y[i-2])-strtofloat(y[i])) *(strtofloat(z[i-1])-strtofloat(z[i])) - (strtofloat(x[i-2])-strtofloat(x[i])) * (strtofloat(
//y[i-1])-strtofloat(y[i])) *(strtofloat(z[i-3])-strtofloat(z[i]));

if DetX>0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:=180 - ArcCos( parH/(parR*BD))*180/pi;
  if abs(parH/(parR*BD))>1 then parameter:=180 - ArcCos(Round(parH/(parR*BD)))*180/pi;
end;
if DetX<0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:= ArcCos( parH/(parR*BD))*180/pi - 180;
  if abs(parH/(parR*BD))>1 then  parameter:= ArcCos(Round(parH/(parR*BD)))*180/pi - 180;
end;
if DetX=0 then  begin
//showmessage('��� ������� ������ ����� �� ����� ������. ���������� ���� �� ���������'+#13 +'���������� ������������ ������ ����� ��� ��������� ����������������!');
if (ABC=false) and (BCD=false) then begin
if parH>0 then parameter:= 180.000000;
if parH<0 then parameter:= 0.000000;
end
end;

dddd[i-4]:='d'+inttostr(i-3)+' = ' +floattostrf(parameter,fffixed,10,4);


end;


end;


1:
WriteLn(f,'Variables:');
for i:=0 to length(rr)-1 do
if rr[i]<>'' then WriteLn(f,rr[i]);
for i:=0 to length(aaa)-1 do
if aaa[i]<>'' then WriteLn(f,aaa[i]);
for i:=0 to length(dddd)-1 do
if dddd[i]<>'' then WriteLn(f,dddd[i]);

WriteLn(f,'');
WriteLn(f,'');


 150:

CloseFile(f);
end;

end;
end;


if (dial=true) and (OpenDialog1.FilterIndex=2) then begin
if (xout<>nil) and (yout<>nil) and (zout<>nil) then begin


if SaveDialog1.Execute=true then begin
if  pos('.gjf',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.gjf';
AssignFile(f,a);
Rewrite(f);
if src_start<>nil then begin
for i:=0 to length(src_start)-1 do
if src_start[i]<>'' then WriteLn(f,src_start[i]);   //��������� ������
end;
if src_route<>nil then begin
for i:=0 to length(src_route)-1 do
if src_route[i]<>'' then WriteLn(f,src_route[i]);   //���������� ������
end;
WriteLn(f,'');
if src_title<>nil then begin
for i:=0 to length(src_title)-1 do
if src_title[i]<>'' then WriteLn(f,src_title[i]);   //���������
end;
WriteLn(f,'');
if src_mult<>nil then begin
for i:=0 to length(src_mult)-1 do
if src_mult[i]<>'' then WriteLn(f,src_mult[i]);     //��������������� � �����
end;




probel:='                                                          ';
if nomer_atoma>1 then SetLength(rr,nomer_atoma-1);
if nomer_atoma>2 then SetLength(aaa,nomer_atoma-2);
if nomer_atoma>3 then SetLength(dddd,nomer_atoma-3);



aa_nomer_cycla:=strtointdef(InputBox('����� ���� ��� ����������','���������� ������� ����� ����',inttostr(nomer_cycla)),nomer_cycla);
if aa_nomer_cycla>nomer_cycla then begin
showmessage('����� ����� �� ������ ��������� '+inttostr(nomer_cycla) + #13 + '����� ��������� ��������� ���������!');
aa_nomer_cycla:=nomer_cycla;
end;
if aa_nomer_cycla<1 then begin
showmessage('����� ����� ��������� �������� �� 1 �� '+inttostr(nomer_cycla) +' �����������!' + #13 + '����� ��������� ��������� ���������!');
aa_nomer_cycla:=1;
end;




for i:=1 to nomer_atoma do begin
if i=1 then WriteLn(f,atomoutel[aa_nomer_cycla,i]+inttostr(i));
if i=2 then begin
if xout[aa_nomer_cycla,i]='' then goto 10;
WriteLn(f,atomoutel[aa_nomer_cycla,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i]+inttostr(i)))+ atomoutel[aa_nomer_cycla,i-1] +inttostr(i-1)+ Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i-1]+inttostr(i-1))) +  'r'+inttostr(i-1));
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,i-1]));
parameter:=sqrt(parameterx+parametery+parameterz);
rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(parameter,ffFixed,10,6);
end;
if i=3 then begin
if xout[aa_nomer_cycla,i]='' then goto 10;


parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,i-1]));
par_t1:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,i-2]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,i-2]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,i-2]));
par_t2:=sqrt(parameterx+parametery+parameterz);


SetLength(radius_sys,nomer_atoma+1);
//���������� ���������� ���� � ������ �������� ���������
for j:=1 to nomer_atoma do
for k:=1 to length(radius)-2 do
if atomoutel[aa_nomer_cycla,j]=center[k] then begin
if radius[k]<>'' then  radius_sys[j]:=strtofloat(radius[k]);
Break;
end;




if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then WriteLn(f,atomoutel[aa_nomer_cycla,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i]+inttostr(i)))+ atomoutel[aa_nomer_cycla,i-1]+inttostr(i-1) + Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i-1]+inttostr(i-1))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i))) + atomoutel[aa_nomer_cycla,i-2] +inttostr(i-2)+  Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i-2]+inttostr(i-2))) + 'a'+inttostr(i-2))
else  WriteLn(f,atomoutel[aa_nomer_cycla,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i]+inttostr(i)))+ atomoutel[aa_nomer_cycla,i-2]+inttostr(i-2) + Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i-2]+inttostr(i-2))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i))) + atomoutel[aa_nomer_cycla,i-1] +inttostr(i-1)+  Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i-1]+inttostr(i-1))) + 'a'+inttostr(i-2));

if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(par_t1,fffixed,10,6)
else  rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(par_t2,fffixed,10,6);


if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then begin
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,i-1]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i-1])  -    strtofloat(xout[aa_nomer_cycla,i-2]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i-1])  -    strtofloat(yout[aa_nomer_cycla,i-2]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i-1])  -    strtofloat(zout[aa_nomer_cycla,i-2]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,i-2]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,i-2]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,i-2]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);
end
else begin
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,i-2]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,i-2]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,i-2]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i-2])  -    strtofloat(xout[aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i-2])  -    strtofloat(yout[aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i-2])  -    strtofloat(zout[aa_nomer_cycla,i-1]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,i-1]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,i-1]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,i-1]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);
end;
end;




if i>=4 then begin
if xout[aa_nomer_cycla,i]='' then Break;

////���� ��������� ����
par_t2:=100000000;
for j:=1 to i-1 do  begin
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,i-j]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,i-j]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,i-j]));
parameter:=sqrt(parameterx+parametery+parameterz);
if parameter-(radius_sys[i]+radius_sys[i-j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[i]+radius_sys[i-j]);                 // ������������� ���������� ����� �������
par_t1:=parameter;
reo1:=i-j;                           // ����� ���� ����� (i-j), ������� ����� ������ � ������ i
end;
end;

//������ ���� ��������� ���� � ����������, �.�. ���� ��� i-j-���� �����
par_t2:=10000000000;
for j:=1 to i-1 do begin
if j<>reo1 then begin
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,reo1])  -    strtofloat(xout[aa_nomer_cycla,j]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,reo1])  -    strtofloat(yout[aa_nomer_cycla,j]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,reo1])  -    strtofloat(zout[aa_nomer_cycla,j]));
parameter:=sqrt(parameterx+parametery+parameterz);
//if parameter=0 then parameter:=10000000000;       //������� ��� ���� ���� � ���-����� �����������, �� �������� ��� ����������� ���� ����������
if parameter-(radius_sys[reo1]+radius_sys[j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[reo1]+radius_sys[j]);                 // ������������� ���������� ����� �������
par_t3:=parameter;
reo2:=j;                           // ����� ���� �����, ������� ����� ������ � ������ # reo1
end;
end;
end;


//������� ���������� 4-�� ���� � ������� - reo3:
par_t2:=10000000000;
for j:=1 to i-1 do begin
if (j<>reo1) and (j<>reo2) then begin
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,reo2])  -    strtofloat(xout[aa_nomer_cycla,j]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,reo2])  -    strtofloat(yout[aa_nomer_cycla,j]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,reo2])  -    strtofloat(zout[aa_nomer_cycla,j]));
parameter:=sqrt(parameterx+parametery+parameterz);
if parameter-(radius_sys[reo2]+radius_sys[j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[reo2]+radius_sys[j]);                 // ������������� ���������� ����� �������
par_t4:=parameter;
reo3:=j;                           // ����� ���� �����, ������� ����� ������ � ������ # reo2
end;
end;
end;


/// i-reo1-reo2-reo3 - �������� ������� ���������� ������ - ����������
/// ���� ����� �������� ��������� ����� �������, �� ����� ������� ���������
// ��� ������  parameter-(radius_sys[reo2]+radius_sys[j]) ������, �������� 0.2 �� Break;
// ��� ��� ����� ���������, ����  parameter<=(radius_sys[reo2]+radius_sys[j])*0.1 then Break;
// ��� ������� ��� ������� �� ���������� ����� ������

// ���������� ����� �� ��������� ���������� ���������� ��� ����������� ����
// ���� DetX=0 �� �������� �������� ���� ������ ������



60: DetX:=(strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,i])) * (strtofloat(yout[aa_nomer_cycla,reo3])-strtofloat(yout[aa_nomer_cycla,i])) * (strtofloat(zout[aa_nomer_cycla,reo1])-strtofloat(zout[aa_nomer_cycla,i]))  +
         (strtofloat(xout[aa_nomer_cycla,reo3])-strtofloat(xout[aa_nomer_cycla,i])) * (strtofloat(yout[aa_nomer_cycla,reo1])-strtofloat(yout[aa_nomer_cycla,i])) * (strtofloat(zout[aa_nomer_cycla,reo2])-strtofloat(zout[aa_nomer_cycla,i]))  +
         (strtofloat(xout[aa_nomer_cycla,reo1])-strtofloat(xout[aa_nomer_cycla,i])) * (strtofloat(yout[aa_nomer_cycla,reo2])-strtofloat(yout[aa_nomer_cycla,i])) * (strtofloat(zout[aa_nomer_cycla,reo3])-strtofloat(zout[aa_nomer_cycla,i]))  -
         (strtofloat(xout[aa_nomer_cycla,reo1])-strtofloat(xout[aa_nomer_cycla,i])) * (strtofloat(yout[aa_nomer_cycla,reo3])-strtofloat(yout[aa_nomer_cycla,i])) * (strtofloat(zout[aa_nomer_cycla,reo2])-strtofloat(zout[aa_nomer_cycla,i]))  -
         (strtofloat(xout[aa_nomer_cycla,reo3])-strtofloat(xout[aa_nomer_cycla,i])) * (strtofloat(yout[aa_nomer_cycla,reo2])-strtofloat(yout[aa_nomer_cycla,i])) * (strtofloat(zout[aa_nomer_cycla,reo1])-strtofloat(zout[aa_nomer_cycla,i]))  -
         (strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,i])) * (strtofloat(yout[aa_nomer_cycla,reo1])-strtofloat(yout[aa_nomer_cycla,i])) * (strtofloat(zout[aa_nomer_cycla,reo3])-strtofloat(zout[aa_nomer_cycla,i]));



// ���� ����� ��������� ��� DetX=0 - ��������� ����� ABCD �� ������� �������������� ����� ������
ABC:=false;
BCD:=false;

if DetX=0 then  begin
//��������� ����� ABC
if (strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,i])<>0) and  (strtofloat(yout[aa_nomer_cycla,reo2])-strtofloat(yout[aa_nomer_cycla,i])<>0)  and  (strtofloat(zout[aa_nomer_cycla,reo2])-strtofloat(zout[aa_nomer_cycla,i])<>0) then begin
if ((strtofloat(xout[aa_nomer_cycla,reo1])-strtofloat(xout[aa_nomer_cycla,i]))/(strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,i]))=(strtofloat(yout[aa_nomer_cycla,reo1])-strtofloat(yout[aa_nomer_cycla,i]))/(strtofloat(yout[aa_nomer_cycla,reo2])-strtofloat(yout[aa_nomer_cycla,i]))) and ((strtofloat(xout[aa_nomer_cycla,reo1])-strtofloat(xout[aa_nomer_cycla,i]))/(strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,i]))=(strtofloat(zout[aa_nomer_cycla,reo1])-strtofloat(zout[aa_nomer_cycla,i]))/(strtofloat(zout[aa_nomer_cycla,reo2])-strtofloat(zout[aa_nomer_cycla,i]))) then
//ABC ����� �� ����� ������
ABC:=true;
end;
if (strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,i])=0) or  (strtofloat(yout[aa_nomer_cycla,reo2])-strtofloat(yout[aa_nomer_cycla,i])=0)  or  (strtofloat(zout[aa_nomer_cycla,reo2])-strtofloat(zout[aa_nomer_cycla,i])=0) then begin
if (strtofloat(xout[aa_nomer_cycla,reo1])-strtofloat(xout[aa_nomer_cycla,i])=strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,i])) and  (strtofloat(yout[aa_nomer_cycla,reo1])-strtofloat(yout[aa_nomer_cycla,i])=strtofloat(yout[aa_nomer_cycla,reo2])-strtofloat(yout[aa_nomer_cycla,i])) and  (strtofloat(zout[aa_nomer_cycla,reo1])-strtofloat(zout[aa_nomer_cycla,i])=strtofloat(zout[aa_nomer_cycla,reo2])-strtofloat(zout[aa_nomer_cycla,i]))  then
//ABC ����� �� ����� ������
ABC:=true;
end;
//��������� ����� BCD
if (strtofloat(xout[aa_nomer_cycla,reo3])-strtofloat(xout[aa_nomer_cycla,reo1])<>0) and  (strtofloat(yout[aa_nomer_cycla,reo3])-strtofloat(yout[aa_nomer_cycla,reo1])<>0)  and  (strtofloat(zout[aa_nomer_cycla,reo3])-strtofloat(zout[aa_nomer_cycla,reo1])<>0) then begin
if ((strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,reo1]))/(strtofloat(xout[aa_nomer_cycla,reo3])-strtofloat(xout[aa_nomer_cycla,reo1]))=(strtofloat(yout[aa_nomer_cycla,reo2])-strtofloat(yout[aa_nomer_cycla,reo1]))/(strtofloat(yout[aa_nomer_cycla,reo3])-strtofloat(yout[aa_nomer_cycla,reo1]))) and ((strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,reo1]))/(strtofloat(xout[aa_nomer_cycla,reo3])-strtofloat(xout[aa_nomer_cycla,reo1]))=(strtofloat(zout[aa_nomer_cycla,reo2])-strtofloat(zout[aa_nomer_cycla,reo1]))/(strtofloat(zout[aa_nomer_cycla,reo3])-strtofloat(zout[aa_nomer_cycla,reo1]))) then
//BCD ����� �� ����� ������
BCD:=true;
end;
if (strtofloat(xout[aa_nomer_cycla,reo3])-strtofloat(xout[aa_nomer_cycla,reo1])=0) or  (strtofloat(yout[aa_nomer_cycla,reo3])-strtofloat(yout[aa_nomer_cycla,reo1])=0)  or  (strtofloat(zout[aa_nomer_cycla,reo3])-strtofloat(zout[aa_nomer_cycla,reo1])=0) then begin
if (strtofloat(xout[aa_nomer_cycla,reo2])-strtofloat(xout[aa_nomer_cycla,reo1])=strtofloat(xout[aa_nomer_cycla,reo3])-strtofloat(xout[aa_nomer_cycla,reo1])) and  (strtofloat(yout[aa_nomer_cycla,reo2])-strtofloat(yout[aa_nomer_cycla,reo1])=strtofloat(yout[aa_nomer_cycla,reo3])-strtofloat(yout[aa_nomer_cycla,reo1])) and  (strtofloat(zout[aa_nomer_cycla,reo2])-strtofloat(zout[aa_nomer_cycla,reo1])=strtofloat(zout[aa_nomer_cycla,reo3])-strtofloat(zout[aa_nomer_cycla,reo1]))  then
//BCD ����� �� ����� ������
BCD:=true;
end;
end;


//���� ��������� ��� 3 ����� �� ����� ������, �� ������� ���������� ���� �������� ������� ���������� ������
if (ABC=true) and (BCD=false) then begin
// ABCD ----> ABDC  =  reo3 <-----> reo2
reo_tmp:=reo3;
reo3:=reo2;
reo2:=reo_tmp;
goto 60;               // ����� ���� �� ������������ � ������ ������������
end;

//���� ��������� ��� 3 ����� �� ����� ������, �� ������� ���������� ���� �������� ������� ���������� ������
if (ABC=false) and (BCD=true) then begin
reo_check:=false;
// ABCD ----> BACD  =  reo1 <-----> i  // ��� ������ - ���� i - ������
// ���� ������ ������ ����� ����� D - ABC - ���������
setlength(arr_reo,length(arr_reo)+1);
arr_reo[length(arr_reo)-1]:=reo3;
for j:=1 to i-1 do  begin
if  j<>reo3 then begin
for k:=0 to length(arr_reo)-1 do
if arr_reo[k]<>j then  begin
reo_check:=true;
Break;
end;
end;
if reo_check=true then begin
reo3:=j;
goto 60;
end;
end;               // ����� ���� �� ������������ � ������ ������������
if reo_check=false then  begin
showmessage('���������� �������� Z-�������! ��� ������ �� ����� ������! ��������� � ���������� ����������� ��� ��������� ���������� ������� �������, ��������������� Z-�������!');
goto 0;
end;
end;




if (ABC=true) and (BCD=true) then begin   //������ ����� �� ����� ������
//�������� ������ ������� ������ ����� ����� ����� �������
//���� ����� ������� �� �����, ����� ������ ��������� ,,������������� � ���������� �����������,,
//����� ����� i � ����� ������ �������� � ��������

// ��������� ��� � ���������� ������ - ����� ����������� ������ � ���������������� 1 ����
reo_check:=false;
setlength(arr_reo,length(arr_reo)+1);
arr_reo[length(arr_reo)-1]:=reo3;
for j:=1 to i-1 do  begin
if  j<>reo3 then begin
for k:=0 to length(arr_reo)-1 do
if arr_reo[k]<>j then  begin
reo_check:=true;
Break;
end;
end;
if reo_check=true then begin
reo3:=j;
goto 60;
end;
end;               // ����� ���� �� ������������ � ������ ������������
if reo_check=false then  begin
showmessage('���������� �������� Z-�������! ��� ������ �� ����� ������! ��������� � ���������� ����������� ��� ��������� ���������� ������� �������, ��������������� Z-�������!');
goto 0;
end;
end;




WriteLn(f,atomoutel[aa_nomer_cycla,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,i]+inttostr(i)))+ atomoutel[aa_nomer_cycla,reo1] +inttostr(reo1)+ Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,reo1]+inttostr(reo1))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i-1))) + atomoutel[aa_nomer_cycla,reo2] +inttostr(reo2)+  Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,reo2]+inttostr(reo2))) + 'a'+inttostr(i-2)  +   Copy(probel,1,8-length('a'+inttostr(i-2))) + atomoutel[aa_nomer_cycla,reo3]+inttostr(reo3) + Copy(probel,1,8-length(atomoutel[aa_nomer_cycla,reo3]+inttostr(reo3)))  + 'd'+inttostr(i-3));
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,reo1]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,reo1]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,reo1]));
parameter:=sqrt(parameterx+parametery+parameterz);
rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(parameter,fffixed,10,6);

parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,reo1]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,reo1]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,reo1]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,reo1])  -    strtofloat(xout[aa_nomer_cycla,reo2]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,reo1])  -    strtofloat(yout[aa_nomer_cycla,reo2]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,reo1])  -    strtofloat(zout[aa_nomer_cycla,reo2]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,reo2]));
parametery:= sqr(  strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,reo2]));
parameterz:= sqr(  strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,reo2]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);


parameterx23:= strtofloat(xout[aa_nomer_cycla,i])  -    strtofloat(xout[aa_nomer_cycla,reo1]);
parametery23:= strtofloat(yout[aa_nomer_cycla,i])  -    strtofloat(yout[aa_nomer_cycla,reo1]);
parameterz23:= strtofloat(zout[aa_nomer_cycla,i])  -    strtofloat(zout[aa_nomer_cycla,reo1]);

parameterx43:= strtofloat(xout[aa_nomer_cycla,reo2])  -   strtofloat(xout[aa_nomer_cycla,reo1]);
parametery43:= strtofloat(yout[aa_nomer_cycla,reo2])  -   strtofloat(yout[aa_nomer_cycla,reo1]);
parameterz43:= strtofloat(zout[aa_nomer_cycla,reo2])  -   strtofloat(zout[aa_nomer_cycla,reo1]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(xout[aa_nomer_cycla,reo3])  -    strtofloat(xout[aa_nomer_cycla,reo2]);
parametery45:= strtofloat(yout[aa_nomer_cycla,reo3])  -    strtofloat(yout[aa_nomer_cycla,reo2]);
parameterz45:= strtofloat(zout[aa_nomer_cycla,reo3])  -    strtofloat(zout[aa_nomer_cycla,reo2]);

parameter4:= parametery43*parameterz45-parametery45*parameterz43; // A
parameter5:= parameterz43*parameterx45-parameterx43*parameterz45; // B
parameter6:= parameterx43*parametery45-parametery43*parameterx45; // B

parH:=parameter1*parameter4+parameter2*parameter5+parameter3*parameter6;
parR:=sqrt(sqr(parameter1)+ sqr(parameter2)+  sqr(parameter3));
BD:=sqrt(sqr(parameter4)+ sqr(parameter5)+  sqr(parameter6));


if DetX>0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:=180 - ArcCos( parH/(parR*BD))*180/pi;
  if abs(parH/(parR*BD))>1 then parameter:=180 - ArcCos(Round(parH/(parR*BD)))*180/pi;
end;
if DetX<0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:= ArcCos( parH/(parR*BD))*180/pi - 180;
  if abs(parH/(parR*BD))>1 then  parameter:= ArcCos(Round(parH/(parR*BD)))*180/pi - 180;
end;
if DetX=0 then  begin
//showmessage('��� ������� ������ ����� �� ����� ������. ���������� ���� �� ���������'+#13 +'���������� ������������ ������ ����� ��� ��������� ����������������!');
if (ABC=false) and (BCD=false) then begin
if parH>0 then parameter:= 180.000000;
if parH<0 then parameter:= 0.000000;
end
end;

dddd[i-4]:='d'+inttostr(i-3)+' = ' +floattostrf(parameter,fffixed,10,4);


end;


end;


10:
WriteLn(f,'Variables:');
for i:=0 to length(rr)-1 do
if rr[i]<>'' then WriteLn(f,rr[i]);
for i:=0 to length(aaa)-1 do
if aaa[i]<>'' then WriteLn(f,aaa[i]);
for i:=0 to length(dddd)-1 do
if dddd[i]<>'' then WriteLn(f,dddd[i]);

WriteLn(f,'');
WriteLn(f,'');




CloseFile(f);


end;   //     if (xout<>nil) and (yout<>nil) and (zout<>nil) then begin
end;   //     if dial=true and OpenDialog1.FilterIndex=2 then begin
end;

0:
end;

procedure TForm1.NMR1Click(Sender: TObject);
begin
Form58.Show;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
Form64.Show;
end;

procedure TForm1.N35Click(Sender: TObject);
begin
ShellExecute(handle,nil,'Magellan 1.4 - Manual.pdf',nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.N19Click(Sender: TObject);
begin
Form72.Show;
end;

procedure TForm1.N46Click(Sender: TObject);
begin
Form73.Show;
end;

end.
