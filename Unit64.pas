unit Unit64;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Math, ComObj, OleServer, ExcelXP, ActiveX ;

type
  TForm64 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListView1: TListView;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label8: TLabel;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



   type MyType = array of array of string;
   type MyType1 = array of array of array of string;


var
  Form64: TForm64;
  z_mlt: array of boolean;

  mull,mull_h: MyType;
  mull_spin,mull_spin_h: MyType;
  n_he,at_he: MyType;

  mull_mult,mull_h_mult: array of MyType;       //////////
  mull_spin_mult,mull_spin_h_mult: array of MyType;
  n_he_mult,at_he_mult: array of MyType;

  mbs_mull,mbs_mull_h: MyType;
  mbs_mull_spin,mbs_mull_spin_h: MyType;
  mbs_n_he,mbs_at_he: MyType;

  mbs_mull_mult,mbs_mull_h_mult: array of MyType;         //////////
  mbs_mull_spin_mult,mbs_mull_spin_h_mult: array of MyType;
  mbs_n_he_mult,mbs_at_he_mult: array of MyType;

  esp,esp_h: MyType;
  esp_spin,esp_spin_h: MyType;
  esp_n_he,esp_at_he: MyType;

  esp_mult,esp_h_mult: array of MyType;                 ///////////
  esp_spin_mult,esp_spin_h_mult: array of MyType;
  esp_n_he_mult,esp_at_he_mult: array of MyType;

  bond_mull,bond_mull_h: MyType;
  bond_mull_spin,bond_mull_spin_h: MyType;
  bond_n_he,bond_at_he: MyType;

  bond_mull_mult,bond_mull_h_mult: array of MyType;    ///////////
  bond_mull_spin_mult,bond_mull_spin_h_mult: array of MyType;
  bond_n_he_mult,bond_at_he_mult: array of MyType;

  hir,hir_h: MyType;
  cm5,cm5_h: MyType;
  hir_spin: MyType;
  hir_n_he,hir_at_he: MyType;

  hir_mult,hir_h_mult: array of MyType;          /////////////
  cm5_mult,cm5_h_mult: array of MyType;
  hir_spin_mult: array of MyType;
  hir_n_he_mult,hir_at_he_mult: array of MyType;

  nbo,aim: MyType;
  nbo_mult,aim_mult: array of MyType;        ////////////

  lo,lo_h: MyType;
  lo_spin,lo_spin_h: MyType;
  lo_n_he,lo_at_he: MyType;

  lo_mult,lo_h_mult: array of MyType;         //////////////
  lo_spin_mult,lo_spin_h_mult: array of MyType;
  lo_n_he_mult,lo_at_he_mult: array of MyType;

  apt,apt_h: MyType;
  apt_spin,apt_spin_h: MyType;
  apt_n_he,apt_at_he: MyType;

  apt_mult,apt_h_mult: array of MyType;        ///////////////
  apt_spin_mult,apt_spin_h_mult: array of MyType;
  apt_n_he_mult,apt_at_he_mult: array of MyType;

  dip_mull,dip_lo,dip_esp,poten: MyType;
  dip_mull_mult,dip_lo_mult,dip_esp_mult,poten_mult: array of MyType;
 //********************************************************************  END OF GLOBAL VARIABLES

implementation

uses Unit1,Unit24, Unit65, Unit67, Unit68, Unit36, Unit70;

{$R *.dfm}


function Totchrg(var X: MyType): Real;
var s: real;
i,j: integer;
begin
for i:=0 to length(X)-1 do
if X[i,0]='' then Break;
s:=0;
for j:=0 to length(X[i-1])-1 do
if X[i-1,j]<>'' then   s:=s+strtofloat(X[i-1,j]);
Result:=s;
end;



function MinMaxChrg(var X: MyType): String;
var i,j: integer;
Y: array of double;
begin
for i:=0 to length(X)-1 do
if X[i,0]='' then Break;
for j:=0 to length(X[i-1])-1 do begin
if X[i-1,j]<>'' then begin
SetLength(Y,length(Y)+1);
Y[length(Y)-1]:=strtofloat(X[i-1,j]);
end;
end;
Result:=floattostr(MinValue(Y))+'='+floattostr(MaxValue(Y));
end;


function howlong(var X: MyType): Integer;
var i: integer;
begin
for i:=0 to length(X)-1 do
if X[i,0]='' then Break;
Result:=i-1;
end;






procedure TForm64.FormCreate(Sender: TObject);
begin
Label2.Caption:='';
Label3.Caption:='';
Label4.Caption:='';
Label5.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
end;

procedure TForm64.FormShow(Sender: TObject);
var f: TextFile;
str,str1,str2,str3,str4,str5,strx,task: widestring;
i,j,k,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,l,l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,m,n,p,fmax: integer;
kmax,kmax1,kmax2,kmax3,kmax4,kmax5,kmax6,kmax7,kmax8,kmax9,kmax10,kmax11,kmax12: integer;
lmax,lmax1,lmax2,lmax3,lmax4,lmax5,lmax6,lmax7,lmax8,lmax9,lmax10,lmax11,lmax12: integer;
z_end: boolean;
method: array of string;
//method_mult: array of array of string;
itm: TListItem;
label 0;
begin
ListView1.Clear;
Combobox1.Clear;
Combobox2.Clear;
Label2.Caption:='';
Label3.Caption:='';
Label4.Caption:='';
Label5.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
k:=0;
k1:=0;
k2:=0;
k3:=0;
k4:=0;
k5:=0;
k6:=0;
k7:=0;
k8:=0;
k9:=0;
k10:=0;
k11:=0;
k12:=0;
l:=0;
////////////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
z_mlt:=nil;
mull:=nil;
mull_h:=nil;
mull_spin:=nil;
mull_spin_h:=nil;
n_he:=nil;
at_he:=nil;
mull_mult:=nil;
mull_h_mult:=nil;
mull_spin_mult:=nil;
mull_spin_h_mult:=nil;
n_he_mult:=nil;
at_he_mult:=nil;
mbs_mull:=nil;
mbs_mull_h:=nil;
mbs_mull_spin:=nil;
mbs_mull_spin_h:=nil;
mbs_n_he:=nil;
mbs_at_he:=nil;
mbs_mull_mult:=nil;
mbs_mull_h_mult:=nil;
mbs_mull_spin_mult:=nil;
mbs_mull_spin_h_mult:=nil;
mbs_n_he_mult:=nil;
mbs_at_he_mult:=nil;
esp:=nil;
esp_h:=nil;
esp_spin:=nil;
esp_spin_h:=nil;
esp_n_he:=nil;
esp_at_he:=nil;
esp_mult:=nil;
esp_h_mult:=nil;
esp_spin_mult:=nil;
esp_spin_h_mult:=nil;
esp_n_he_mult:=nil;
esp_at_he_mult:=nil;
bond_mull:=nil;
bond_mull_h:=nil;
bond_mull_spin:=nil;
bond_mull_spin_h:=nil;
bond_n_he:=nil;
bond_at_he:=nil;
bond_mull_mult:=nil;
bond_mull_h_mult:=nil;
bond_mull_spin_mult:=nil;
bond_mull_spin_h_mult:=nil;
bond_n_he_mult:=nil;
bond_at_he_mult:=nil;
hir:=nil;
hir_h:=nil;
cm5:=nil;
cm5_h:=nil;
hir_spin:=nil;
hir_n_he:=nil;
hir_at_he:=nil;
hir_mult:=nil;
hir_h_mult:=nil;
cm5_mult:=nil;
cm5_h_mult:=nil;
hir_spin_mult:=nil;
hir_n_he_mult:=nil;
hir_at_he_mult:=nil;
nbo:=nil;
aim:=nil;
nbo_mult:=nil;
aim_mult:=nil;
lo:=nil;
lo_h:=nil;
lo_spin:=nil;
lo_spin_h:=nil;
lo_n_he:=nil;
lo_at_he:=nil;
lo_mult:=nil;
lo_h_mult:=nil;
lo_spin_mult:=nil;
lo_spin_h_mult:=nil;
lo_n_he_mult:=nil;
lo_at_he_mult:=nil;
apt:=nil;
apt_h:=nil;
apt_spin:=nil;
apt_spin_h:=nil;
apt_n_he:=nil;
apt_at_he:=nil;
apt_mult:=nil;
apt_h_mult:=nil;
apt_spin_mult:=nil;
apt_spin_h_mult:=nil;
apt_n_he_mult:=nil;
apt_at_he_mult:=nil;
dip_mull:=nil;
dip_lo:=nil;
dip_esp:=nil;
poten:=nil;
dip_mull_mult:=nil;
dip_lo_mult:=nil;
dip_esp_mult:=nil;
poten_mult:=nil;
/////////////////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

if dial=false then BitBtn6.Enabled:=False else BitBtn6.Enabled:=True;


if dial=true then begin
if Form1.OpenDialog1.FilterIndex=1 then goto 0;
if Form1.OpenDialog1.FilterIndex=3 then goto 0;
AssignFile(f,Form1.OpenDialog1.Filename);
Reset(f);
z_end:=false;
while not eof(f) do begin
ReadLn(f,str);


/////////////////////////
/////////////////////////   Mulliken
/////////////////////////


if ((pos(' Mulliken charges',str)<>0) or (pos(' Mulliken atomic charges',str)<>0)) and (pos('with hydrogens',str)=0) and (pos(' MBS ',str)=0) and (pos(' Bonding ',str)=0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of Mulliken charges',str)=0) and (pos(' Sum of Mulliken atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(mull,k+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  mull[k,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
mull[k,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(mull_spin,k+1,nomer_atoma);
mull_spin[k,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
ReadLn(f,str);
l:=0;
if (pos(' Mulliken ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of Mulliken',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(n_he,k+1,nomer_atoma);
n_he[k,l]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(at_he,k+1,nomer_atoma);
at_he[k,l]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(mull_h,k+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  mull_h[k,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
mull_h[k,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(mull_spin_h,k+1,nomer_atoma);
mull_spin_h[k,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
end;
k:=k+1;
end;
l:=0;

///////////////////
///////////////////  MBS Mulliken
///////////////////

if ((pos(' MBS Mulliken charges',str)<>0) or (pos(' MBS Mulliken atomic charges',str)<>0))  and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of MBS Mulliken charges',str)=0) and (pos(' Sum of MBS Mulliken atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(mbs_mull,k1+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  mbs_mull[k1,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
mbs_mull[k1,l]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(mbs_mull_spin,k1+1,nomer_atoma);
mbs_mull_spin[k1,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
ReadLn(f,str);
l:=0;
if (pos(' Mulliken ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(mbs_n_he,k1+1,nomer_atoma);
mbs_n_he[k1,l]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(mbs_at_he,k1+1,nomer_atoma);
mbs_at_he[k1,l]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(mbs_mull_h,k1+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  mbs_mull_h[k1,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
mbs_mull_h[k1,l]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(mbs_mull_spin_h,k1+1,nomer_atoma);
mbs_mull_spin_h[k1,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
end;
k1:=k1+1;
end;
l:=0;
////////////////////
////////////////////    ESP
////////////////////

if ((pos(' ESP charges',str)<>0) or (pos(' ESP atomic charges',str)<>0))  and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of ESP charges',str)=0) and (pos(' Sum of ESP atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(esp,k2+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  esp[k2,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
esp[k2,l]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(esp_spin,k2+1,nomer_atoma);
esp_spin[k2,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
ReadLn(f,str);
l:=0;
if (pos(' ESP ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Charge= ',str)=0) and (pos(' Dipole= ',str)=0)  and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(esp_n_he,k2+1,nomer_atoma);
esp_n_he[k2,l]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(esp_at_he,k2+1,nomer_atoma);
esp_at_he[k2,l]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(esp_h,k2+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  esp_h[k2,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
esp_h[k2,l]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(esp_spin_h,k2+1,nomer_atoma);
esp_spin_h[k2,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
end;
k2:=k2+1;
end;
l:=0;

/////////////////////////
/////////////////////////   Bonding Mulliken
/////////////////////////


if ((pos(' Bonding Mulliken charges',str)<>0) or (pos(' Bonding Mulliken atomic charges',str)<>0)) and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of Bonding Mulliken charges',str)=0) and (pos(' Sum of Bonding Mulliken atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(bond_mull,k3+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  bond_mull[k3,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
bond_mull[k3,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(bond_mull_spin,k3+1,nomer_atoma);
bond_mull_spin[k3,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
ReadLn(f,str);
l:=0;
if (pos(' Bonding Mulliken ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(bond_n_he,k3+1,nomer_atoma);
bond_n_he[k3,l]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(bond_at_he,k3+1,nomer_atoma);
bond_at_he[k3,l]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(bond_mull_h,k3+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  bond_mull_h[k3,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
bond_mull_h[k3,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(bond_mull_spin_h,k3+1,nomer_atoma);
bond_mull_spin_h[k3,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
end;
k3:=k3+1;
end;
l:=0;

//////////////////////
//////////////////////  Hirshfeld + CM5
//////////////////////

if ((pos(' Hirshfeld charges, spin densities, dipoles',str)<>0) or ((pos(' Hirshfeld atomic charges, spin densities, dipoles',str)<>0))) and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Tot ',str)=0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(hir,k4+1,nomer_atoma);
str5:=Copy(str4,i,length(str4));
hir[k4,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
SetLength(hir_spin,k4+1,nomer_atoma);
hir_spin[k4,l]:=Copy(str2,1,pos(' ',str2)-1);
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str1:=Copy(str2,i,length(str2));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1, i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1, i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1, i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(cm5,k4+1,nomer_atoma);
cm5[k4,l]:=str1;
ReadLn(f,str);
l:=l+1;
end;
ReadLn(f,str);
l:=0;
if (pos(' Hirshfeld ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(hir_n_he,k4+1,nomer_atoma);
hir_n_he[k4,l]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(hir_at_he,k4+1,nomer_atoma);
hir_at_he[k4,l]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(hir_h,k4+1,nomer_atoma);
str5:=Copy(str4,i,length(str4));
hir_h[k4,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(cm5_h,k4+1,nomer_atoma);
cm5_h[k4,l]:=Copy(str1,i,length(str1));
ReadLn(f,str);
l:=l+1;
end;
end;
k4:=k4+1;
end;
l:=0;


//////////////////////
//////////////////////  NBO 3.1
//////////////////////

if pos(' Summary of Natural Population Analysis:',str)<>0   then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
while pos(' ==============================',str)=0 do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(nbo,k5+1,nomer_atoma);
str5:=Copy(str4,i,length(str4));
nbo[k5,l]:=Copy(str5,1,pos(' ',str5)-1);
ReadLn(f,str);
l:=l+1;
end;
k5:=k5+1;
end;
l:=0;

////////////////////
////////////////////  Lowdin
////////////////////


if ((pos(' Lowdin Atomic Charges',str)<>0) or (pos(' Lowdin Charges',str)<>0)) and (pos('with hydrogens',str)=0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of Lowdin charges',str)=0) and (pos(' Sum of Lowdin atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(lo,k6+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  lo[k6,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
lo[k6,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(lo_spin,k6+1,nomer_atoma);
lo_spin[k,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
ReadLn(f,str);
l:=0;
if (pos(' Lowdin ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos(' Sum of Lowdin charges',str)=0) and (pos(' Sum of Lowdin atomic charges',str)=0)do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(lo_n_he,k6+1,nomer_atoma);
lo_n_he[k6,l]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(lo_at_he,k6+1,nomer_atoma);
lo_at_he[k6,l]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(lo_h,k6+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  lo_h[k6,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
lo_h[k6,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(lo_spin_h,k6+1,nomer_atoma);
lo_spin_h[k6,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
end;
k6:=k6+1;
end;
l:=0;


////////////////////
////////////////////  AIM
////////////////////


if pos(' III. PROPERTIES OF ATTRACTORS',str)<>0 then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
while pos(' --------------------',str)=0 do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(aim,k7+1,nomer_atoma);
aim[k7,l]:=Copy(str1,1,length(str1));
ReadLn(f,str);
l:=l+1;
end;
k7:=k7+1;
end;
l:=0;


///////////////////
///////////////////  APT
///////////////////

if ((pos(' APT charges',str)<>0) or  (pos(' APT atomic charges',str)<>0)) and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of APT charges',str)=0) and (pos(' Sum of APT atomic charges',str)=0)  do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(apt,k8+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  apt[k8,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
apt[k8,l]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(apt_spin,k8+1,nomer_atoma);
apt_spin[k8,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
ReadLn(f,str);
l:=0;
if (pos(' APT ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(apt_n_he,k8+1,nomer_atoma);
apt_n_he[k8,l]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(apt_at_he,k8+1,nomer_atoma);
apt_at_he[k8,l]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(apt_h,k8+1,nomer_atoma);
if pos(' and spin densities',strx)=0 then  apt_h[k8,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
apt_h[k8,l]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(apt_spin_h,k8+1,nomer_atoma);
apt_spin_h[k8,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
end;
end;
k8:=k8+1;
end;
l:=0;






/////////////////////////                     //////////////////////////
/////////////////////////  ДИПОЛЬНЫЕ МОМЕНТЫ  //////////////////////////
/////////////////////////                     //////////////////////////

if pos(' Dipole moment (field-independent basis, Debye)',str)<>0 then begin     //////  Mulliken
ReadLn(f,str);
str1:=Copy(str,pos('Tot=',str)+5,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(dip_mull,k9+1,1);
dip_mull[k9,0]:=str1;
k9:=k9+1;
end;
l:=0;

if pos(' Dipole moment from Lowdin charges (Debye)',str)<>0 then begin     //////  Lowdin
ReadLn(f,str);
str1:=Copy(str,pos('Tot=',str)+5,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(dip_lo,k10+1,1);
dip_lo[k10,0]:=str1;
k10:=k10+1;
end;
l:=0;

if (pos(' Charge=',str)<>0) and (pos(' Dipole=',str)<>0) and (pos(' Tot=',str)<>0) then begin     //////  ESP
str1:=Copy(str,pos('Tot=',str)+5,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(dip_esp,k11+1,1);
dip_esp[k11,0]:=str1;
k11:=k11+1;
end;
l:=0;


////////////////////////////////                     //////////////////////////////////
////////////////////////////////  Electr. Potential  //////////////////////////////////
////////////////////////////////                     //////////////////////////////////


if (pos(' Center ',str)<>0) and (pos('  Electric  ',str)<>0) and (pos(' Field ',str)<>0) then begin     //////  ESP
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
while pos(' --------------------',str)=0 do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(poten,k12+1,nomer_atoma);
if pos(' ',str1)=0 then poten[k12,l]:=str1
else poten[k12,l]:=Copy(str1,1,pos(' ',str1)-1);
ReadLn(f,str);
l:=l+1;
end;
k12:=k12+1;
end;
l:=0;



if Pos('Normal termination of Gaussian',str)<>0 then z_end:=True;
end;
CloseFIle(f);


/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

kmax:=0;
lmax:=0;

if length(mull)>kmax then kmax:=length(mull);
if length(mull_h)>kmax then kmax:=length(mull_h);
if length(mull_spin)>kmax then kmax:=length(mull_spin);
if length(mull_spin_h)>kmax then kmax:=length(mull_spin_h);
if length(n_he)>kmax then kmax:=length(n_he);
if length(at_he)>kmax then kmax:=length(at_he);

if length(mbs_mull)>kmax then kmax:=length(mbs_mull);
if length(mbs_mull_h)>kmax then kmax:=length(mbs_mull_h);
if length(mbs_mull_spin)>kmax then kmax:=length(mbs_mull_spin);
if length(mbs_mull_spin_h)>kmax then kmax:=length(mbs_mull_spin_h);
if length(mbs_n_he)>kmax then kmax:=length(mbs_n_he);
if length(mbs_at_he)>kmax then kmax:=length(mbs_at_he);

if length(esp)>kmax then kmax:=length(esp);
if length(esp_h)>kmax then kmax:=length(esp_h);
if length(esp_spin)>kmax then kmax:=length(esp_spin);
if length(esp_spin_h)>kmax then kmax:=length(esp_spin_h);
if length(esp_n_he)>kmax then kmax:=length(esp_n_he);
if length(esp_at_he)>kmax then kmax:=length(esp_at_he);

if length(bond_mull)>kmax then kmax:=length(bond_mull);
if length(bond_mull_h)>kmax then kmax:=length(bond_mull_h);
if length(bond_mull_spin)>kmax then kmax:=length(bond_mull_spin);
if length(bond_mull_spin_h)>kmax then kmax:=length(bond_mull_spin_h);
if length(bond_n_he)>kmax then kmax:=length(bond_n_he);
if length(bond_at_he)>kmax then kmax:=length(bond_at_he);

if length(hir)>kmax then kmax:=length(hir);
if length(hir_h)>kmax then kmax:=length(hir_h);
if length(cm5)>kmax then kmax:=length(cm5);
if length(cm5_h)>kmax then kmax:=length(cm5_h);
if length(hir_spin)>kmax then kmax:=length(hir_spin);
if length(hir_n_he)>kmax then kmax:=length(hir_n_he);
if length(hir_at_he)>kmax then kmax:=length(hir_at_he);

if length(nbo)>kmax then kmax:=length(nbo);
if length(aim)>kmax then kmax:=length(aim);
if length(poten)>kmax then kmax:=length(poten);

if length(lo)>kmax then kmax:=length(lo);
if length(lo_h)>kmax then kmax:=length(lo_h);
if length(lo_spin)>kmax then kmax:=length(lo_spin);
if length(lo_spin_h)>kmax then kmax:=length(lo_spin_h);
if length(lo_n_he)>kmax then kmax:=length(lo_n_he);
if length(lo_at_he)>kmax then kmax:=length(lo_at_he);

if length(apt)>kmax then kmax:=length(apt);
if length(apt_h)>kmax then kmax:=length(apt_h);
if length(apt_spin)>kmax then kmax:=length(apt_spin);
if length(apt_spin_h)>kmax then kmax:=length(apt_spin_h);
if length(apt_n_he)>kmax then kmax:=length(apt_n_he);
if length(apt_at_he)>kmax then kmax:=length(apt_at_he);

if length(dip_mull)>kmax then kmax:=length(dip_mull);
if length(dip_lo)>kmax then kmax:=length(dip_lo);
if length(dip_esp)>kmax then kmax:=length(dip_esp);


if kmax=0 then begin
showmessage('Файл '+Form1.OpenDialog1.FileName+ ' не содержит данных о зарядах');
goto 0;
end;

SetLength(mull,kmax);
SetLength(mull_h,kmax);
SetLength(mull_spin,kmax);
SetLength(mull_spin_h,kmax);
SetLength(n_he,kmax);
SetLength(at_he,kmax);

SetLength(mbs_mull,kmax);
SetLength(mbs_mull_h,kmax);
SetLength(mbs_mull_spin,kmax);
SetLength(mbs_mull_spin_h,kmax);
SetLength(mbs_n_he,kmax);
SetLength(mbs_at_he,kmax);

SetLength(esp,kmax);
SetLength(esp_h,kmax);
SetLength(esp_spin,kmax);
SetLength(esp_spin_h,kmax);
SetLength(esp_n_he,kmax);
SetLength(esp_at_he,kmax);

SetLength(bond_mull,kmax);
SetLength(bond_mull_h,kmax);
SetLength(bond_mull_spin,kmax);
SetLength(bond_mull_spin_h,kmax);
SetLength(bond_n_he,kmax);
SetLength(bond_at_he,kmax);

SetLength(hir,kmax);
SetLength(hir_h,kmax);
SetLength(cm5,kmax);
SetLength(cm5_h,kmax);
SetLength(hir_spin,kmax);
SetLength(hir_n_he,kmax);
SetLength(hir_at_he,kmax);

SetLength(nbo,kmax);
SetLength(aim,kmax);
SetLength(poten,kmax);

SetLength(lo,kmax);
SetLength(lo_h,kmax);
SetLength(lo_spin,kmax);
SetLength(lo_spin_h,kmax);
SetLength(lo_n_he,kmax);
SetLength(lo_at_he,kmax);

SetLength(apt,kmax);
SetLength(apt_h,kmax);
SetLength(apt_spin,kmax);
SetLength(apt_spin_h,kmax);
SetLength(apt_n_he,kmax);
SetLength(apt_at_he,kmax);

SetLength(dip_mull,kmax);
SetLength(dip_lo,kmax);
SetLength(dip_esp,kmax);


if length(mull[0])>lmax then lmax:=length(mull[0]);
if length(mull_h[0])>lmax then lmax:=length(mull_h[0]);
if length(mull_spin[0])>lmax then lmax:=length(mull_spin[0]);
if length(mull_spin_h[0])>lmax then lmax:=length(mull_spin_h[0]);
if length(n_he[0])>lmax then lmax:=length(n_he[0]);
if length(at_he[0])>lmax then lmax:=length(at_he[0]);

if length(mbs_mull[0])>lmax then lmax:=length(mbs_mull[0]);
if length(mbs_mull_h[0])>lmax then lmax:=length(mbs_mull_h[0]);
if length(mbs_mull_spin[0])>lmax then lmax:=length(mbs_mull_spin[0]);
if length(mbs_mull_spin_h[0])>lmax then lmax:=length(mbs_mull_spin_h[0]);
if length(mbs_n_he[0])>lmax then lmax:=length(mbs_n_he[0]);
if length(mbs_at_he[0])>lmax then lmax:=length(mbs_at_he[0]);

if length(esp[0])>lmax then lmax:=length(esp[0]);
if length(esp_h[0])>lmax then lmax:=length(esp_h[0]);
if length(esp_spin[0])>lmax then lmax:=length(esp_spin[0]);
if length(esp_spin_h[0])>lmax then lmax:=length(esp_spin_h[0]);
if length(esp_n_he[0])>lmax then lmax:=length(esp_n_he[0]);
if length(esp_at_he[0])>lmax then lmax:=length(esp_at_he[0]);

if length(bond_mull[0])>lmax then lmax:=length(bond_mull[0]);
if length(bond_mull_h[0])>lmax then lmax:=length(bond_mull_h[0]);
if length(bond_mull_spin[0])>lmax then lmax:=length(bond_mull_spin[0]);
if length(bond_mull_spin_h[0])>lmax then lmax:=length(bond_mull_spin_h[0]);
if length(bond_n_he[0])>lmax then lmax:=length(bond_n_he[0]);
if length(bond_at_he[0])>lmax then lmax:=length(bond_at_he[0]);

if length(hir[0])>lmax then lmax:=length(hir[0]);
if length(hir_h[0])>lmax then lmax:=length(hir_h[0]);
if length(cm5[0])>lmax then lmax:=length(cm5[0]);
if length(cm5_h[0])>lmax then lmax:=length(cm5_h[0]);
if length(hir_spin[0])>lmax then lmax:=length(hir_spin[0]);
if length(hir_n_he[0])>lmax then lmax:=length(hir_n_he[0]);
if length(hir_at_he[0])>lmax then lmax:=length(hir_at_he[0]);

if length(nbo[0])>lmax then lmax:=length(nbo[0]);
if length(aim[0])>lmax then lmax:=length(aim[0]);
if length(poten[0])>lmax then lmax:=length(poten[0]);

if length(lo[0])>lmax then lmax:=length(lo[0]);
if length(lo_h[0])>lmax then lmax:=length(lo_h[0]);
if length(lo_spin[0])>lmax then lmax:=length(lo_spin[0]);
if length(lo_spin_h[0])>lmax then lmax:=length(lo_spin_h[0]);
if length(lo_n_he[0])>lmax then lmax:=length(lo_n_he[0]);
if length(lo_at_he[0])>lmax then lmax:=length(lo_at_he[0]);

if length(apt[0])>lmax then lmax:=length(apt[0]);
if length(apt_h[0])>lmax then lmax:=length(apt_h[0]);
if length(apt_spin[0])>lmax then lmax:=length(apt_spin[0]);
if length(apt_spin_h[0])>lmax then lmax:=length(apt_spin_h[0]);
if length(apt_n_he[0])>lmax then lmax:=length(apt_n_he[0]);
if length(apt_at_he[0])>lmax then lmax:=length(apt_at_he[0]);

if length(dip_mull[0])>lmax then lmax:=length(dip_mull[0]);
if length(dip_lo[0])>lmax then lmax:=length(dip_lo[0]);
if length(dip_esp[0])>lmax then lmax:=length(dip_esp[0]);



SetLength(mull,kmax,lmax);
SetLength(mull_h,kmax,lmax);
SetLength(mull_spin,kmax,lmax);
SetLength(mull_spin_h,kmax,lmax);
SetLength(n_he,kmax,lmax);
SetLength(at_he,kmax,lmax);

SetLength(mbs_mull,kmax,lmax);
SetLength(mbs_mull_h,kmax,lmax);
SetLength(mbs_mull_spin,kmax,lmax);
SetLength(mbs_mull_spin_h,kmax,lmax);
SetLength(mbs_n_he,kmax,lmax);
SetLength(mbs_at_he,kmax,lmax);

SetLength(esp,kmax,lmax);
SetLength(esp_h,kmax,lmax);
SetLength(esp_spin,kmax,lmax);
SetLength(esp_spin_h,kmax,lmax);
SetLength(esp_n_he,kmax,lmax);
SetLength(esp_at_he,kmax,lmax);

SetLength(bond_mull,kmax,lmax);
SetLength(bond_mull_h,kmax,lmax);
SetLength(bond_mull_spin,kmax,lmax);
SetLength(bond_mull_spin_h,kmax,lmax);
SetLength(bond_n_he,kmax,lmax);
SetLength(bond_at_he,kmax,lmax);

SetLength(hir,kmax,lmax);
SetLength(hir_h,kmax,lmax);
SetLength(cm5,kmax,lmax);
SetLength(cm5_h,kmax,lmax);
SetLength(hir_spin,kmax,lmax);
SetLength(hir_n_he,kmax,lmax);
SetLength(hir_at_he,kmax,lmax);

SetLength(nbo,kmax,lmax);
SetLength(aim,kmax,lmax);
SetLength(poten,kmax,lmax);

SetLength(lo,kmax,lmax);
SetLength(lo_h,kmax,lmax);
SetLength(lo_spin,kmax,lmax);
SetLength(lo_spin_h,kmax,lmax);
SetLength(lo_n_he,kmax,lmax);
SetLength(lo_at_he,kmax,lmax);

SetLength(apt,kmax,lmax);
SetLength(apt_h,kmax,lmax);
SetLength(apt_spin,kmax,lmax);
SetLength(apt_spin_h,kmax,lmax);
SetLength(apt_n_he,kmax,lmax);
SetLength(apt_at_he,kmax,lmax);

SetLength(dip_mull,kmax,lmax);
SetLength(dip_lo,kmax,lmax);
SetLength(dip_esp,kmax,lmax);

if mull[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Mulliken';
end;
if mbs_mull[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='MBS Mulliken';
end;
if bond_mull[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Bonding Mulliken';
end;
if esp[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='ESP';
end;
if hir[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Hirshfeld';
end;
if cm5[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='CM5';
end;
if nbo[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='NBO';
end;
if aim[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='AIM';
end;
if lo[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Lowdin';
end;
if apt[0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='APT';
end;


////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog1.FileName) do
if copy(Form1.OpenDialog1.FileName,i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog1.FileName,j+1,200);
////////////////////////////////////////////////////////////////////

if method<>nil then begin
for i:=0 to length(method)-1 do
if method[i]<>'' then Combobox2.Items.Add(method[i]);
end;



ComboBox1.Items.Add(Form1.OpenDialog1.FileName);
ComboBox1.ItemIndex:=0;
ComboBox2.ItemIndex:=0;
Label2.Caption:='Наименование системы: '  + task;
Label3.Caption:='Схема расчета зарядов: ' + Combobox2.Text;
if Combobox2.Text='Mulliken'         then  if abs(Totchrg(mull))>=0.00001      then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mull),ffFixed,8,6)      else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='MBS Mulliken'     then if abs(Totchrg(mbs_mull))>=0.00001   then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mbs_mull),ffFixed,8,6)  else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Bonding Mulliken' then if abs(Totchrg(bond_mull))>=0.00001  then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(bond_mull),ffFixed,8,6) else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='ESP'              then if abs(Totchrg(esp))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(esp),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Hirshfeld'        then if abs(Totchrg(hir))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(hir),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='CM5'              then if abs(Totchrg(cm5))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(cm5),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='NBO'              then if abs(Totchrg(nbo))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(nbo),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='AIM'              then if abs(Totchrg(aim))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(aim),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Lowdin'           then if abs(Totchrg(lo))>=0.00001         then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(lo),ffFixed,8,6)        else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='APT'              then if abs(Totchrg(apt))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(apt),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';;


if Combobox2.Text='Mulliken'         then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1)            + ' / ' + Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull)));
if Combobox2.Text='MBS Mulliken'     then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1)    + ' / ' + Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull)));
if Combobox2.Text='Bonding Mulliken' then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1)  + ' / ' + Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull)));
if Combobox2.Text='ESP'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1)              + ' / ' + Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp)));
if Combobox2.Text='Hirshfeld'        then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1)              + ' / ' + Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir)));
if Combobox2.Text='CM5'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1)              + ' / ' + Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5)));
if Combobox2.Text='NBO'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1)              + ' / ' + Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo)));
if Combobox2.Text='AIM'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1)              + ' / ' + Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim)));
if Combobox2.Text='Lowdin'           then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1)                + ' / ' + Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo)));
if Combobox2.Text='APT'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1)              + ' / ' + Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt)));


Label7.Caption:='Дипольный момент: ****';
if pos('Mulliken',Combobox2.Text)<>0 then Label7.Caption:='Дипольный момент: '      + dip_mull[length(dip_mull)-1,0] +' D';
if pos('ESP',Combobox2.Text)<>0 then Label7.Caption:='Дипольный момент: '           + dip_esp[length(dip_esp)-1,0]   +' D';
if pos('Lowdin',Combobox2.Text)<>0 then Label7.Caption:='Дипольный момент: '        + dip_lo[length(dip_lo)-1,0]     +' D';


if z_end=true then  begin
Label8.Font.Color:=clblack;
Label8.Caption:='Результат: Normal termination' ;
end
else  begin
Label8.Font.Color:=clred;
Label8.Caption:='Результат: WARNING! Abnormal termination!'
end;


// ////////////////////////
// Заполняем ListView
// ////////////////////////

if Combobox2.Text='Mulliken' then begin
for i:=0 to length(mull[howlong(mull)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(mull[howlong(mull),i]);
if howlong(mull_spin)<0 then itm.SubItems.Append('****');
if howlong(mull_spin)>=0 then  if mull_spin[howlong(mull_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(mull_spin)>=0 then  if mull_spin[howlong(mull_spin),0]<>'' then  itm.SubItems.Append(mull_spin[howlong(mull_spin),i]);
end;
end;

if Combobox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull[howlong(mbs_mull)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(mbs_mull[howlong(mbs_mull),i]);
if howlong(mbs_mull_spin)<0 then itm.SubItems.Append('****');
if howlong(mbs_mull_spin)>=0 then  if mbs_mull_spin[howlong(mbs_mull_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(mbs_mull_spin)>=0 then  if mbs_mull_spin[howlong(mbs_mull_spin),0]<>'' then  itm.SubItems.Append(mbs_mull_spin[howlong(mbs_mull_spin),i]);
end;
end;

if Combobox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull[howlong(bond_mull)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(bond_mull[howlong(bond_mull),i]);
if howlong(bond_mull_spin)<0 then itm.SubItems.Append('****');
if howlong(bond_mull_spin)>=0 then  if bond_mull_spin[howlong(bond_mull_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(bond_mull_spin)>=0 then  if bond_mull_spin[howlong(bond_mull_spin),0]<>'' then  itm.SubItems.Append(bond_mull_spin[howlong(bond_mull_spin),i]);
end;
end;

if Combobox2.Text='ESP' then begin
for i:=0 to length(esp[howlong(esp)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(esp[howlong(esp),i]);
if howlong(esp_spin)<0 then itm.SubItems.Append('****');
if howlong(esp_spin)>=0 then  if esp_spin[howlong(esp_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(esp_spin)>=0 then  if esp_spin[howlong(esp_spin),0]<>'' then  itm.SubItems.Append(esp_spin[howlong(esp_spin),i]);
end;
end;

if Combobox2.Text='Hirshfeld' then begin
for i:=0 to length(hir[howlong(hir)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(hir[howlong(hir),i]);
if howlong(hir_spin)>=0 then  if hir_spin[howlong(hir_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin)>=0 then  if hir_spin[howlong(hir_spin),0]<>'' then  itm.SubItems.Append(hir_spin[howlong(hir_spin),i]);
end;
end;

if Combobox2.Text='CM5' then begin
for i:=0 to length(cm5[howlong(cm5)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(cm5[howlong(cm5),i]);         //// !!!!! СПИН ОСТАВЛЯЕМ ОТ ХИРШВЕЛЬДА - Т.К. СМ5 - ЭТО ЗАРЯДЫ, РАСЧИТАННЫЕ В МЕТОДЕ ХИРШВЕЛЬДА
if howlong(hir_spin)>=0 then  if hir_spin[howlong(hir_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin)>=0 then  if hir_spin[howlong(hir_spin),0]<>'' then  itm.SubItems.Append(hir_spin[howlong(hir_spin),i]);
end;
end;

if Combobox2.Text='NBO' then begin
for i:=0 to length(nbo[howlong(nbo)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(nbo[howlong(nbo),i]);
itm.SubItems.Append('****');
end;
end;

if Combobox2.Text='AIM' then begin
for i:=0 to length(aim[howlong(aim)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(aim[howlong(aim),i]);
itm.SubItems.Append('****');
end;
end;

if Combobox2.Text='Lowdin' then begin
for i:=0 to length(lo[howlong(lo)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(lo[howlong(lo),i]);
if howlong(lo_spin)<0 then itm.SubItems.Append('****');
if howlong(lo_spin)>=0 then  if lo_spin[howlong(lo_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(lo_spin)>=0 then  if lo_spin[howlong(lo_spin),0]<>'' then  itm.SubItems.Append(lo_spin[howlong(lo_spin),i]);
end;
end;

if Combobox2.Text='APT' then begin
for i:=0 to length(apt[howlong(apt)])-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(apt[howlong(apt),i]);
if howlong(apt_spin)<0 then itm.SubItems.Append('****');
if howlong(apt_spin)>=0 then  if apt_spin[howlong(apt_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(apt_spin)>=0 then  if apt_spin[howlong(apt_spin),0]<>'' then  itm.SubItems.Append(apt_spin[howlong(apt_spin),i]);
end;
end;





     //                          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end  // end of if dial=true      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else begin  //                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z_mlt:=nil;
SetLength(z_mlt,nf);
for j:=0 to nf-1 do  begin

AssignFile(f,Form1.OpenDialog2.Files[j]);
Reset(f);
while not eof(f) do begin
ReadLn(f,str);


/////////////////////////
/////////////////////////   Mulliken
/////////////////////////

if kmax=0 then kmax:=1;
if kmax<k+1 then kmax:=k+1;
if lmax=0 then lmax:=1;
if lmax<l+1 then lmax:=l+1;

if ((pos(' Mulliken charges',str)<>0) or (pos(' Mulliken atomic charges',str)<>0)) and (pos('with hydrogens',str)=0) and (pos(' MBS ',str)=0) and (pos(' Bonding ',str)=0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of Mulliken charges',str)=0) and (pos(' Sum of Mulliken atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(mull_mult,nf,kmax,lmax);
if pos(' and spin densities',strx)=0 then  mull_mult[j,k,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
mull_mult[j,k,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(mull_spin_mult,nf,kmax,lmax);
mull_spin_mult[j,k,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
if lmax=0 then lmax:=1;
if lmax<l+1 then lmax:=l+1;
end;
ReadLn(f,str);
l:=0;
if (pos(' Mulliken ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)=0)   do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(n_he_mult,nf,kmax,lmax);
n_he_mult[j,k,l]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(at_he_mult,nf,kmax,lmax);
at_he_mult[j,k,l]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(mull_h_mult,nf,kmax,lmax);
if pos(' and spin densities',strx)=0 then  mull_h_mult[j,k,l]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
mull_h_mult[j,k,l]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(mull_spin_h_mult,nf,kmax,lmax);
mull_spin_h_mult[j,k,l]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l:=l+1;
if lmax=0 then lmax:=1;
if lmax<l+1 then lmax:=l+1;
end;
end;
k:=k+1;
if kmax=0 then kmax:=1;
if kmax<k+1 then kmax:=k+1;
end;
l:=0;


/////////////////////////
/////////////////////////   MBS Mulliken
/////////////////////////

if kmax1=0 then kmax1:=1;
if kmax1<k1+1 then kmax1:=k1+1;
if lmax1=0 then lmax1:=1;
if lmax1<l1+1 then lmax1:=l1+1;

if ((pos(' MBS Mulliken charges',str)<>0) or (pos(' MBS Mulliken atomic charges',str)<>0)) and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of MBS Mulliken charges',str)=0) and (pos(' Sum of MBS Mulliken atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(mbs_mull_mult,nf,kmax1,lmax1);
if pos(' and spin densities',strx)=0 then  mbs_mull_mult[j,k1,l1]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
mbs_mull_mult[j,k1,l1]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(mbs_mull_spin_mult,nf,kmax1,lmax1);
mbs_mull_spin_mult[j,k1,l1]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l1:=l1+1;
if lmax1=0 then lmax1:=1;
if lmax1<l1+1 then lmax1:=l1+1;
end;
ReadLn(f,str);
l1:=0;
if (pos(' Mulliken ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(mbs_n_he_mult,nf,kmax1,lmax1);
mbs_n_he_mult[j,k1,l1]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(mbs_at_he_mult,nf,kmax1,lmax1);
mbs_at_he_mult[j,k1,l1]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(mbs_mull_h_mult,nf,kmax1,lmax1);
if pos(' and spin densities',strx)=0 then  mbs_mull_h_mult[j,k1,l1]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
mbs_mull_h_mult[j,k1,l1]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(mbs_mull_spin_h_mult,nf,kmax1,lmax1);
mbs_mull_spin_h_mult[j,k1,l1]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l1:=l1+1;
if lmax1=0 then lmax1:=1;
if lmax1<l1+1 then lmax1:=l1+1;
end;
end;
k1:=k1+1;
if kmax1=0 then kmax1:=1;
if kmax1<k1+1 then kmax1:=k1+1;
end;
l1:=0;


////////////////////
////////////////////    ESP
////////////////////

if kmax2=0 then kmax2:=1;
if kmax2<k2+1 then kmax2:=k2+1;
if lmax2=0 then lmax2:=1;
if lmax2<l2+1 then lmax2:=l2+1;

if ((pos(' ESP charges',str)<>0) or (pos(' ESP atomic charges',str)<>0)) and (pos('with hydrogens',str)=0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of ESP charges',str)=0) and (pos(' Sum of ESP atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(esp_mult,nf,kmax2,lmax2);
if pos(' and spin densities',strx)=0 then  esp_mult[j,k2,l2]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
esp_mult[j,k2,l2]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(esp_spin_mult,nf,kmax2,lmax2);
esp_spin_mult[j,k2,l2]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l2:=l2+1;
if lmax2=0 then lmax2:=1;
if lmax2<l2+1 then lmax2:=l2+1;
end;
ReadLn(f,str);
l2:=0;
if (pos(' ESP ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Charge= ',str)=0) and (pos(' Dipole= ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(esp_n_he_mult,nf,kmax2,lmax2);
esp_n_he_mult[j,k2,l2]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(esp_at_he_mult,nf,kmax2,lmax2);
esp_at_he_mult[j,k2,l2]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(esp_h_mult,nf,kmax2,lmax2);
if pos(' and spin densities',strx)=0 then  esp_h_mult[j,k2,l2]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
esp_h_mult[j,k2,l2]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(esp_spin_h_mult,nf,kmax2,lmax2);
esp_spin_h_mult[j,k2,l2]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l2:=l2+1;
if lmax2=0 then lmax2:=1;
if lmax2<l2+1 then lmax2:=l2+1;
end;
end;
k2:=k2+1;
if kmax2=0 then kmax2:=1;
if kmax2<k2+1 then kmax2:=k2+1;
end;
l2:=0;


/////////////////////////
/////////////////////////   Bonding Mulliken
/////////////////////////
if kmax3=0 then kmax3:=1;
if kmax3<k3+1 then kmax3:=k3+1;
if lmax3=0 then lmax3:=1;
if lmax3<l3+1 then lmax3:=l3+1;

if ((pos(' Bonding Mulliken charges',str)<>0) or (pos(' Bonding Mulliken atomic charges',str)<>0)) and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of Bonding Mulliken charges',str)=0) or (pos(' Sum of Bonding Mulliken atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(bond_mull_mult,nf,kmax3,lmax3);
if pos(' and spin densities',strx)=0 then  bond_mull_mult[j,k3,l3]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
bond_mull_mult[j,k3,l3]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(bond_mull_spin_mult,nf,kmax3,lmax3);
bond_mull_spin_mult[j,k3,l3]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l3:=l3+1;
if lmax3=0 then lmax3:=1;
if lmax3<l3+1 then lmax3:=l3+1;
end;
ReadLn(f,str);
l3:=0;
if (pos(' Bonding Mulliken ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(bond_n_he_mult,nf,kmax3,lmax3);
bond_n_he_mult[j,k3,l3]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(bond_at_he_mult,nf,kmax3,lmax3);
bond_at_he_mult[j,k3,l3]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(bond_mull_h_mult,nf,kmax3,lmax3);
if pos(' and spin densities',strx)=0 then  bond_mull_h_mult[j,k3,l3]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
bond_mull_h_mult[j,k3,l3]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(bond_mull_spin_h_mult,nf,kmax3,lmax3);
bond_mull_spin_h_mult[j,k3,l3]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l3:=l3+1;
if lmax3=0 then lmax3:=1;
if lmax3<l3+1 then lmax3:=l3+1;
end;
end;
k3:=k3+1;
if kmax3=0 then kmax3:=1;
if kmax3<k3+1 then kmax3:=k3+1;
end;
l3:=0;



//////////////////////
//////////////////////  Hirshfeld + CM5
//////////////////////
if kmax4=0 then kmax4:=1;
if kmax4<k4+1 then kmax4:=k4+1;
if lmax4=0 then lmax4:=1;
if lmax4<l4+1 then lmax4:=l4+1;

if ((pos(' Hirshfeld charges, spin densities, dipoles',str)<>0) or (pos(' Hirshfeld atomic charges, spin densities, dipoles',str)<>0)) and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Tot ',str)=0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(hir_mult,nf,kmax4,lmax4);
str5:=Copy(str4,i,length(str4));
hir_mult[j,k4,l4]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
SetLength(hir_spin_mult,nf,kmax4,lmax4);
hir_spin_mult[j,k4,l4]:=Copy(str2,1,pos(' ',str2)-1);
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str1:=Copy(str2,i,length(str2));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1, i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1, i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1, i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(cm5_mult,nf,kmax4,lmax4);
cm5_mult[j,k4,l4]:=str1;
ReadLn(f,str);
l4:=l4+1;
if lmax4=0 then lmax4:=1;
if lmax4<l4+1 then lmax4:=l4+1;
end;
ReadLn(f,str);
l4:=0;
if (pos(' Hirshfeld ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)<>0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(hir_n_he_mult,nf,kmax4,lmax4);
hir_n_he_mult[j,k4,l4]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(hir_at_he_mult,nf,kmax4,lmax4);
hir_at_he_mult[j,k4,l4]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(hir_h_mult,nf,kmax4,lmax4);
str5:=Copy(str4,i,length(str4));
hir_h_mult[j,k4,l4]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(cm5_h_mult,nf,kmax4,lmax4);
cm5_h_mult[j,k4,l4]:=Copy(str1,i,length(str1));
ReadLn(f,str);
l4:=l4+1;
if lmax4=0 then lmax4:=1;
if lmax4<l4+1 then lmax4:=l4+1;
end;
end;
k4:=k4+1;
if kmax4=0 then kmax4:=1;
if kmax4<k4+1 then kmax4:=k4+1;
end;
l4:=0;




//////////////////////
//////////////////////  NBO 3.1
//////////////////////
if kmax5=0 then kmax5:=1;
if kmax5<k5+1 then kmax5:=k5+1;
if lmax5=0 then lmax5:=1;
if lmax5<l5+1 then lmax5:=l5+1;

if pos(' Summary of Natural Population Analysis:',str)<>0   then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
while pos(' ==============================',str)=0 do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(nbo_mult,nf,kmax5,lmax5);
str5:=Copy(str4,i,length(str4));
nbo_mult[j,k5,l5]:=Copy(str5,1,pos(' ',str5)-1);
ReadLn(f,str);
l5:=l5+1;
if lmax5=0 then lmax5:=1;
if lmax5<l5+1 then lmax5:=l5+1;
end;
k5:=k5+1;
if kmax5=0 then kmax5:=1;
if kmax5<k5+1 then kmax5:=k5+1;
end;
l5:=0;



////////////////////
////////////////////  Lowdin
////////////////////
if kmax6=0 then kmax6:=1;
if kmax6<k6+1 then kmax6:=k6+1;
if lmax6=0 then lmax6:=1;
if lmax6<l6+1 then lmax6:=l6+1;

if ((pos(' Lowdin Atomic Charges',str)<>0) or (pos(' Lowdin Charges',str)<>0))  and (pos('with hydrogens',str)=0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of Lowdin charges',str)=0) and (pos(' Sum of Lowdin atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(lo_mult,nf,kmax6,lmax6);
if pos(' and spin densities',strx)=0 then  lo_mult[j,k6,l6]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
lo_mult[j,k6,l6]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(lo_spin_mult,nf,kmax6,lmax6);
lo_spin_mult[j,k6,l6]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l6:=l6+1;
if lmax6=0 then lmax6:=1;
if lmax6<l6+1 then lmax6:=l6+1;
end;
ReadLn(f,str);
l6:=0;
if (pos(' Lowdin ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos(' Sum of Lowdin charges',str)=0) and (pos(' Sum of Lowdin atomic charges',str)=0)do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(lo_n_he_mult,nf,kmax6,lmax6);
lo_n_he_mult[j,k6,l6]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(lo_at_he_mult,nf,kmax6,lmax6);
lo_at_he_mult[j,k6,l6]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(lo_h_mult,nf,kmax6,lmax6);
if pos(' and spin densities',strx)=0 then  lo_h_mult[j,k6,l6]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,i,length(str4));
lo_h_mult[j,k6,l6]:=Copy(str5,1,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(lo_spin_h_mult,nf,kmax6,lmax6);
lo_spin_h_mult[j,k6,l6]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l6:=l6+1;
if lmax6=0 then lmax6:=1;
if lmax6<l6+1 then lmax6:=l6+1;
end;
end;
k6:=k6+1;
if kmax6=0 then kmax6:=1;
if kmax6<k6+1 then kmax6:=k6+1;
end;
l6:=0;



////////////////////
////////////////////  AIM
////////////////////
if kmax7=0 then kmax7:=1;
if kmax7<k7+1 then kmax7:=k7+1;
if lmax7=0 then lmax7:=1;
if lmax7<l7+1 then lmax7:=l7+1;

if pos(' III. PROPERTIES OF ATTRACTORS',str)<>0 then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
while pos(' --------------------',str)=0 do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(aim_mult,nf,kmax7,lmax7);
aim_mult[j,k7,l7]:=Copy(str1,1,length(str1));
ReadLn(f,str);
l7:=l7+1;
if lmax7=0 then lmax7:=1;
if lmax7<l7+1 then lmax7:=l7+1;
end;
k7:=k7+1;
if kmax7=0 then kmax7:=1;
if kmax7<k7+1 then kmax7:=k7+1;
end;
l7:=0;



///////////////////
///////////////////  APT
///////////////////
if kmax8=0 then kmax8:=1;
if kmax8<k8+1 then kmax8:=k8+1;
if lmax8=0 then lmax8:=1;
if lmax8<l8+1 then lmax8:=l8+1;

if ((pos(' APT charges',str)<>0) or (pos(' APT atomic charges',str)<>0)) and (pos('with hydrogens',str)=0)  then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Sum of APT charges',str)=0) and (pos(' Sum of APT atomic charges',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(apt_mult,nf,kmax8,lmax8);
if pos(' and spin densities',strx)=0 then  apt_mult[j,k8,l8]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
apt_mult[j,k8,l8]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(apt_spin_mult,nf,kmax8,lmax8);
apt_spin_mult[j,k8,l8]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l8:=l8+1;
if lmax8=0 then lmax8:=1;
if lmax8<l8+1 then lmax8:=l8+1;
end;
ReadLn(f,str);
l8:=0;
if (pos(' APT ',str)<>0) and (pos('with hydrogens',str)<>0) and (pos(' charges',str)<>0) then begin
strx:=str;
ReadLn(f,str);
ReadLn(f,str);
while (pos(' Electronic spatial',str)=0) and (pos('.',str)<>0) and (pos(' Sum of ',str)=0) do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
SetLength(apt_n_he_mult,nf,kmax8,lmax8);
apt_n_he_mult[j,k8,l8]:=Copy(str1,1,pos(' ',str1)-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
For i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
SetLength(apt_at_he_mult,nf,kmax8,lmax8);
apt_at_he_mult[j,k8,l8]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)<>' ' then Break;
SetLength(apt_h_mult,nf,kmax8,lmax8);
if pos(' and spin densities',strx)=0 then  apt_h_mult[j,k8,l8]:=Copy(str4,i,length(str4))
else begin
str5:=Copy(str4,1,length(str4));
apt_h_mult[j,k8,l8]:=Copy(str5,i,pos(' ',str5)-1);
for i:=0 to length(str5) do
if Copy(str5,i,1)=' ' then Break;
str1:=Copy(str5,i,length(str5));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
SetLength(apt_spin_h_mult,nf,kmax8,lmax8);
apt_spin_h_mult[j,k8,l8]:=Copy(str1,i,length(str1));
end;
ReadLn(f,str);
l8:=l8+1;
if lmax8=0 then lmax8:=1;
if lmax8<l8+1 then lmax8:=l8+1;
end;
end;
k8:=k8+1;
if kmax8=0 then kmax8:=1;
if kmax8<k8+1 then kmax8:=k8+1;
end;
l8:=0;



/////////////////////////                     //////////////////////////
/////////////////////////  ДИПОЛЬНЫЕ МОМЕНТЫ  //////////////////////////
/////////////////////////                     //////////////////////////
if kmax9=0 then kmax9:=1;
if kmax9<k9+1 then kmax9:=k9+1;
if lmax9=0 then lmax9:=1;
if lmax9<l9+1 then lmax9:=l9+1;

if pos(' Dipole moment (field-independent basis, Debye)',str)<>0 then begin     //////  Mulliken
ReadLn(f,str);
str1:=Copy(str,pos('Tot=',str)+5,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(dip_mull_mult,nf,kmax9,1);
dip_mull_mult[j,k9,0]:=str1;
k9:=k9+1;
if kmax9=0 then kmax9:=1;
if kmax9<k9+1 then kmax9:=k9+1;
end;
l9:=0;

if kmax10=0 then kmax10:=1;
if kmax10<k10+1 then kmax10:=k10+1;
if lmax10=0 then lmax10:=1;
if lmax10<l10+1 then lmax10:=l10+1;

if pos(' Dipole moment from Lowdin charges (Debye)',str)<>0 then begin     //////  Lowdin
ReadLn(f,str);
str1:=Copy(str,pos('Tot=',str)+5,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(dip_lo_mult,nf,kmax10,1);
dip_lo_mult[j,k10,0]:=str1;
k10:=k10+1;
if kmax10=0 then kmax10:=1;
if kmax10<k10+1 then kmax10:=k10+1;
end;
l10:=0;

if kmax11=0 then kmax11:=1;
if kmax11<k11+1 then kmax11:=k11+1;
if lmax11=0 then lmax11:=1;
if lmax11<l11+1 then lmax11:=l11+1;

if (pos(' Charge=',str)<>0) and (pos(' Dipole=',str)<>0) and (pos(' Tot=',str)<>0) then begin     //////  ESP
str1:=Copy(str,pos('Tot=',str)+5,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(dip_esp_mult,nf,kmax11,1);
dip_esp_mult[j,k11,0]:=str1;
k11:=k11+1;
if kmax11=0 then kmax11:=1;
if kmax11<k11+1 then kmax11:=k11+1;
end;
l11:=0;


////////////////////////////////                     //////////////////////////////////
////////////////////////////////  Electr. Potential  //////////////////////////////////
////////////////////////////////                     //////////////////////////////////
if kmax12=0 then kmax12:=1;
if kmax12<k12+1 then kmax12:=k12+1;
if lmax12=0 then lmax12:=1;
if lmax12<l12+1 then lmax12:=l12+1;

if (pos(' Center ',str)<>0) and (pos('  Electric  ',str)<>0) and (pos(' Field ',str)<>0) then begin     //////  ESP
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
while pos(' --------------------',str)=0 do begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));
SetLength(poten_mult,nf,kmax12,lmax12);
if pos(' ',str1)=0 then poten_mult[j,k12,l12]:=str1
else poten_mult[j,k12,l12]:=Copy(str1,1,pos(' ',str1)-1);
ReadLn(f,str);
l12:=l12+1;
if lmax12=0 then lmax12:=1;
if lmax12<l12+1 then lmax12:=l12+1;
end;
k12:=k12+1;
if kmax12=0 then kmax12:=1;
if kmax12<k12+1 then kmax12:=k12+1;
end;
l12:=0;



if Pos('Normal termination of Gaussian',str)<>0 then z_mlt[j]:=True;
end;
CloseFile(f);

k:=0;
k1:=0;
k2:=0;
k3:=0;
k4:=0;
k5:=0;
k6:=0;
k7:=0;
k8:=0;
k9:=0;
k10:=0;
k11:=0;
k12:=0;
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////


fmax:=0;
kmax:=0;
lmax:=0;


if length(mull_mult)>fmax then fmax:=length(mull_mult);
if length(mull_h_mult)>fmax then fmax:=length(mull_h_mult);
if length(mull_spin_mult)>fmax then fmax:=length(mull_spin_mult);
if length(mull_spin_h_mult)>fmax then fmax:=length(mull_spin_h_mult);
if length(n_he_mult)>fmax then fmax:=length(n_he_mult);
if length(at_he_mult)>fmax then fmax:=length(at_he_mult);

if length(mbs_mull_mult)>fmax then fmax:=length(mbs_mull_mult);
if length(mbs_mull_h_mult)>fmax then fmax:=length(mbs_mull_h_mult);
if length(mbs_mull_spin_mult)>fmax then fmax:=length(mbs_mull_spin_mult);
if length(mbs_mull_spin_h_mult)>fmax then fmax:=length(mbs_mull_spin_h_mult);
if length(mbs_n_he_mult)>fmax then fmax:=length(mbs_n_he_mult);
if length(mbs_at_he_mult)>fmax then fmax:=length(mbs_at_he_mult);

if length(esp_mult)>fmax then fmax:=length(esp_mult);
if length(esp_h_mult)>fmax then fmax:=length(esp_h_mult);
if length(esp_spin_mult)>fmax then fmax:=length(esp_spin_mult);
if length(esp_spin_h_mult)>fmax then fmax:=length(esp_spin_h_mult);
if length(esp_n_he_mult)>fmax then fmax:=length(esp_n_he_mult);
if length(esp_at_he_mult)>fmax then fmax:=length(esp_at_he_mult);

if length(bond_mull_mult)>fmax then fmax:=length(bond_mull_mult);
if length(bond_mull_h_mult)>fmax then fmax:=length(bond_mull_h_mult);
if length(bond_mull_spin_mult)>fmax then fmax:=length(bond_mull_spin_mult);
if length(bond_mull_spin_h_mult)>fmax then fmax:=length(bond_mull_spin_h_mult);
if length(bond_n_he_mult)>fmax then fmax:=length(bond_n_he_mult);
if length(bond_at_he_mult)>fmax then fmax:=length(bond_at_he_mult);

if length(hir_mult)>fmax then fmax:=length(hir_mult);
if length(hir_h_mult)>fmax then fmax:=length(hir_h_mult);
if length(cm5_mult)>fmax then fmax:=length(cm5_mult);
if length(cm5_h_mult)>fmax then fmax:=length(cm5_h_mult);
if length(hir_spin_mult)>fmax then fmax:=length(hir_spin_mult);
if length(hir_n_he_mult)>fmax then fmax:=length(hir_n_he_mult);
if length(hir_at_he_mult)>fmax then fmax:=length(hir_at_he_mult);

if length(nbo_mult)>fmax then fmax:=length(nbo_mult);
if length(aim_mult)>fmax then fmax:=length(aim_mult);
if length(poten_mult)>fmax then fmax:=length(poten_mult);

if length(lo_mult)>fmax then fmax:=length(lo_mult);
if length(lo_h_mult)>fmax then fmax:=length(lo_h_mult);
if length(lo_spin_mult)>fmax then fmax:=length(lo_spin_mult);
if length(lo_spin_h_mult)>fmax then fmax:=length(lo_spin_h_mult);
if length(lo_n_he_mult)>fmax then fmax:=length(lo_n_he_mult);
if length(lo_at_he_mult)>fmax then fmax:=length(lo_at_he_mult);

if length(apt_mult)>fmax then fmax:=length(apt_mult);
if length(apt_h_mult)>fmax then fmax:=length(apt_h_mult);
if length(apt_spin_mult)>fmax then fmax:=length(apt_spin_mult);
if length(apt_spin_h_mult)>fmax then fmax:=length(apt_spin_h_mult);
if length(apt_n_he_mult)>fmax then fmax:=length(apt_n_he_mult);
if length(apt_at_he_mult)>fmax then fmax:=length(apt_at_he_mult);

if length(dip_mull_mult)>fmax then fmax:=length(dip_mull_mult);
if length(dip_lo_mult)>fmax then fmax:=length(dip_lo_mult);
if length(dip_esp_mult)>fmax then fmax:=length(dip_esp_mult);


if fmax=0 then begin
showmessage('ВНИМАНИЕ! Прочитанные файлы не содержат данных о зарядах!');
goto 0;
end;



SetLength(mull_mult,fmax);
SetLength(mull_h_mult,fmax);
SetLength(mull_spin_mult,fmax);
SetLength(mull_spin_h_mult,fmax);
SetLength(n_he_mult,fmax);
SetLength(at_he_mult,fmax);

SetLength(mbs_mull_mult,fmax);
SetLength(mbs_mull_h_mult,fmax);
SetLength(mbs_mull_spin_mult,fmax);
SetLength(mbs_mull_spin_h_mult,fmax);
SetLength(mbs_n_he_mult,fmax);
SetLength(mbs_at_he_mult,fmax);

SetLength(esp_mult,fmax);
SetLength(esp_h_mult,fmax);
SetLength(esp_spin_mult,fmax);
SetLength(esp_spin_h_mult,fmax);
SetLength(esp_n_he_mult,fmax);
SetLength(esp_at_he_mult,fmax);

SetLength(bond_mull_mult,fmax);
SetLength(bond_mull_h_mult,fmax);
SetLength(bond_mull_spin_mult,fmax);
SetLength(bond_mull_spin_h_mult,fmax);
SetLength(bond_n_he_mult,fmax);
SetLength(bond_at_he_mult,fmax);

SetLength(hir_mult,fmax);
SetLength(hir_h_mult,fmax);
SetLength(cm5_mult,fmax);
SetLength(cm5_h_mult,fmax);
SetLength(hir_spin_mult,fmax);
SetLength(hir_n_he_mult,fmax);
SetLength(hir_at_he_mult,fmax);

SetLength(nbo_mult,fmax);
SetLength(aim_mult,fmax);
SetLength(poten_mult,fmax);

SetLength(lo_mult,fmax);
SetLength(lo_h_mult,fmax);
SetLength(lo_spin_mult,fmax);
SetLength(lo_spin_h_mult,fmax);
SetLength(lo_n_he_mult,fmax);
SetLength(lo_at_he_mult,fmax);

SetLength(apt_mult,fmax);
SetLength(apt_h_mult,fmax);
SetLength(apt_spin_mult,fmax);
SetLength(apt_spin_h_mult,fmax);
SetLength(apt_n_he_mult,fmax);
SetLength(apt_at_he_mult,fmax);

SetLength(dip_mull_mult,fmax);
SetLength(dip_lo_mult,fmax);
SetLength(dip_esp_mult,fmax);



if length(mull_mult[0])>kmax then kmax:=length(mull_mult[0]);
if length(mull_h_mult[0])>kmax then kmax:=length(mull_h_mult[0]);
if length(mull_spin_mult[0])>kmax then kmax:=length(mull_spin_mult[0]);
if length(mull_spin_h_mult[0])>kmax then kmax:=length(mull_spin_h_mult[0]);
if length(n_he_mult[0])>kmax then kmax:=length(n_he_mult[0]);
if length(at_he_mult[0])>kmax then kmax:=length(at_he_mult[0]);

if length(mbs_mull_mult[0])>kmax then kmax:=length(mbs_mull_mult[0]);
if length(mbs_mull_h_mult[0])>kmax then kmax:=length(mbs_mull_h_mult[0]);
if length(mbs_mull_spin_mult[0])>kmax then kmax:=length(mbs_mull_spin_mult[0]);
if length(mbs_mull_spin_h_mult[0])>kmax then kmax:=length(mbs_mull_spin_h_mult[0]);
if length(mbs_n_he_mult[0])>kmax then kmax:=length(mbs_n_he_mult[0]);
if length(mbs_at_he_mult[0])>kmax then kmax:=length(mbs_at_he_mult[0]);

if length(esp_mult[0])>kmax then kmax:=length(esp_mult[0]);
if length(esp_h_mult[0])>kmax then kmax:=length(esp_h_mult[0]);
if length(esp_spin_mult[0])>kmax then kmax:=length(esp_spin_mult[0]);
if length(esp_spin_h_mult[0])>kmax then kmax:=length(esp_spin_h_mult[0]);
if length(esp_n_he_mult[0])>kmax then kmax:=length(esp_n_he_mult[0]);
if length(esp_at_he_mult[0])>kmax then kmax:=length(esp_at_he_mult[0]);

if length(bond_mull_mult[0])>kmax then kmax:=length(bond_mull_mult[0]);
if length(bond_mull_h_mult[0])>kmax then kmax:=length(bond_mull_h_mult[0]);
if length(bond_mull_spin_mult[0])>kmax then kmax:=length(bond_mull_spin_mult[0]);
if length(bond_mull_spin_h_mult[0])>kmax then kmax:=length(bond_mull_spin_h_mult[0]);
if length(bond_n_he_mult[0])>kmax then kmax:=length(bond_n_he_mult[0]);
if length(bond_at_he_mult[0])>kmax then kmax:=length(bond_at_he_mult[0]);

if length(hir_mult[0])>kmax then kmax:=length(hir_mult[0]);
if length(hir_h_mult[0])>kmax then kmax:=length(hir_h_mult[0]);
if length(cm5_mult[0])>kmax then kmax:=length(cm5_mult[0]);
if length(cm5_h_mult[0])>kmax then kmax:=length(cm5_h_mult[0]);
if length(hir_spin_mult[0])>kmax then kmax:=length(hir_spin_mult[0]);
if length(hir_n_he_mult[0])>kmax then kmax:=length(hir_n_he_mult[0]);
if length(hir_at_he_mult[0])>kmax then kmax:=length(hir_at_he_mult[0]);

if length(nbo_mult[0])>kmax then kmax:=length(nbo_mult[0]);
if length(aim_mult[0])>kmax then kmax:=length(aim_mult[0]);
if length(poten_mult[0])>kmax then kmax:=length(poten_mult[0]);

if length(lo_mult[0])>kmax then kmax:=length(lo_mult[0]);
if length(lo_h_mult[0])>kmax then kmax:=length(lo_h_mult[0]);
if length(lo_spin_mult[0])>kmax then kmax:=length(lo_spin_mult[0]);
if length(lo_spin_h_mult[0])>kmax then kmax:=length(lo_spin_h_mult[0]);
if length(lo_n_he_mult[0])>kmax then kmax:=length(lo_n_he_mult[0]);
if length(lo_at_he_mult[0])>kmax then kmax:=length(lo_at_he_mult[0]);

if length(apt_mult[0])>kmax then kmax:=length(apt_mult[0]);
if length(apt_h_mult[0])>kmax then kmax:=length(apt_h_mult[0]);
if length(apt_spin_mult[0])>kmax then kmax:=length(apt_spin_mult[0]);
if length(apt_spin_h_mult[0])>kmax then kmax:=length(apt_spin_h_mult[0]);
if length(apt_n_he_mult[0])>kmax then kmax:=length(apt_n_he_mult[0]);
if length(apt_at_he_mult[0])>kmax then kmax:=length(apt_at_he_mult[0]);

if length(dip_mull_mult[0])>kmax then kmax:=length(dip_mull_mult[0]);
if length(dip_lo_mult[0])>kmax then kmax:=length(dip_lo_mult[0]);
if length(dip_esp_mult[0])>kmax then kmax:=length(dip_esp_mult[0]);




SetLength(mull_mult,fmax,kmax);
SetLength(mull_h_mult,fmax,kmax);
SetLength(mull_spin_mult,fmax,kmax);
SetLength(mull_spin_h_mult,fmax,kmax);
SetLength(n_he_mult,fmax,kmax);
SetLength(at_he_mult,fmax,kmax);

SetLength(mbs_mull_mult,fmax,kmax);
SetLength(mbs_mull_h_mult,fmax,kmax);
SetLength(mbs_mull_spin_mult,fmax,kmax);
SetLength(mbs_mull_spin_h_mult,fmax,kmax);
SetLength(mbs_n_he_mult,fmax,kmax);
SetLength(mbs_at_he_mult,fmax,kmax);

SetLength(esp_mult,fmax,kmax);
SetLength(esp_h_mult,fmax,kmax);
SetLength(esp_spin_mult,fmax,kmax);
SetLength(esp_spin_h_mult,fmax,kmax);
SetLength(esp_n_he_mult,fmax,kmax);
SetLength(esp_at_he_mult,fmax,kmax);

SetLength(bond_mull_mult,fmax,kmax);
SetLength(bond_mull_h_mult,fmax,kmax);
SetLength(bond_mull_spin_mult,fmax,kmax);
SetLength(bond_mull_spin_h_mult,fmax,kmax);
SetLength(bond_n_he_mult,fmax,kmax);
SetLength(bond_at_he_mult,fmax,kmax);

SetLength(hir_mult,fmax,kmax);
SetLength(hir_h_mult,fmax,kmax);
SetLength(cm5_mult,fmax,kmax);
SetLength(cm5_h_mult,fmax,kmax);
SetLength(hir_spin_mult,fmax,kmax);
SetLength(hir_n_he_mult,fmax,kmax);
SetLength(hir_at_he_mult,fmax,kmax);

SetLength(nbo_mult,fmax,kmax);
SetLength(aim_mult,fmax,kmax);
SetLength(poten_mult,fmax,kmax);

SetLength(lo_mult,fmax,kmax);
SetLength(lo_h_mult,fmax,kmax);
SetLength(lo_spin_mult,fmax,kmax);
SetLength(lo_spin_h_mult,fmax,kmax);
SetLength(lo_n_he_mult,fmax,kmax);
SetLength(lo_at_he_mult,fmax,kmax);

SetLength(apt_mult,fmax,kmax);
SetLength(apt_h_mult,fmax,kmax);
SetLength(apt_spin_mult,fmax,kmax);
SetLength(apt_spin_h_mult,fmax,kmax);
SetLength(apt_n_he_mult,fmax,kmax);
SetLength(apt_at_he_mult,fmax,kmax);

SetLength(dip_mull_mult,fmax,kmax);
SetLength(dip_lo_mult,fmax,kmax);
SetLength(dip_esp_mult,fmax,kmax);



if length(mull_mult[0,0])>lmax then lmax:=length(mull_mult[0,0]);
if length(mull_h_mult[0,0])>lmax then lmax:=length(mull_h_mult[0,0]);
if length(mull_spin_mult[0,0])>lmax then lmax:=length(mull_spin_mult[0,0]);
if length(mull_spin_h_mult[0,0])>lmax then lmax:=length(mull_spin_h_mult[0,0]);
if length(n_he_mult[0,0])>lmax then lmax:=length(n_he_mult[0,0]);
if length(at_he_mult[0,0])>lmax then lmax:=length(at_he_mult[0,0]);

if length(mbs_mull_mult[0,0])>lmax then lmax:=length(mbs_mull_mult[0,0]);
if length(mbs_mull_h_mult[0,0])>lmax then lmax:=length(mbs_mull_h_mult[0,0]);
if length(mbs_mull_spin_mult[0,0])>lmax then lmax:=length(mbs_mull_spin_mult[0,0]);
if length(mbs_mull_spin_h_mult[0,0])>lmax then lmax:=length(mbs_mull_spin_h_mult[0,0]);
if length(mbs_n_he_mult[0,0])>lmax then lmax:=length(mbs_n_he_mult[0,0]);
if length(mbs_at_he_mult[0,0])>lmax then lmax:=length(mbs_at_he_mult[0,0]);

if length(esp_mult[0,0])>lmax then lmax:=length(esp_mult[0,0]);
if length(esp_h_mult[0,0])>lmax then lmax:=length(esp_h_mult[0,0]);
if length(esp_spin_mult[0,0])>lmax then lmax:=length(esp_spin_mult[0,0]);
if length(esp_spin_h_mult[0,0])>lmax then lmax:=length(esp_spin_h_mult[0,0]);
if length(esp_n_he_mult[0,0])>lmax then lmax:=length(esp_n_he_mult[0,0]);
if length(esp_at_he_mult[0,0])>lmax then lmax:=length(esp_at_he_mult[0,0]);

if length(bond_mull_mult[0,0])>lmax then lmax:=length(bond_mull_mult[0,0]);
if length(bond_mull_h_mult[0,0])>lmax then lmax:=length(bond_mull_h_mult[0,0]);
if length(bond_mull_spin_mult[0,0])>lmax then lmax:=length(bond_mull_spin_mult[0,0]);
if length(bond_mull_spin_h_mult[0,0])>lmax then lmax:=length(bond_mull_spin_h_mult[0,0]);
if length(bond_n_he_mult[0,0])>lmax then lmax:=length(bond_n_he_mult[0,0]);
if length(bond_at_he_mult[0,0])>lmax then lmax:=length(bond_at_he_mult[0,0]);

if length(hir_mult[0,0])>lmax then lmax:=length(hir_mult[0,0]);
if length(hir_h_mult[0,0])>lmax then lmax:=length(hir_h_mult[0,0]);
if length(cm5_mult[0,0])>lmax then lmax:=length(cm5_mult[0,0]);
if length(cm5_h_mult[0,0])>lmax then lmax:=length(cm5_h_mult[0,0]);
if length(hir_spin_mult[0,0])>lmax then lmax:=length(hir_spin_mult[0,0]);
if length(hir_n_he_mult[0,0])>lmax then lmax:=length(hir_n_he_mult[0,0]);
if length(hir_at_he_mult[0,0])>lmax then lmax:=length(hir_at_he_mult[0,0]);

if length(nbo_mult[0,0])>lmax then lmax:=length(nbo_mult[0,0]);
if length(aim_mult[0,0])>lmax then lmax:=length(aim_mult[0,0]);
if length(poten_mult[0,0])>lmax then lmax:=length(poten_mult[0,0]);

if length(lo_mult[0,0])>lmax then lmax:=length(lo_mult[0,0]);
if length(lo_h_mult[0,0])>lmax then lmax:=length(lo_h_mult[0,0]);
if length(lo_spin_mult[0,0])>lmax then lmax:=length(lo_spin_mult[0,0]);
if length(lo_spin_h_mult[0,0])>lmax then lmax:=length(lo_spin_h_mult[0,0]);
if length(lo_n_he_mult[0,0])>lmax then lmax:=length(lo_n_he_mult[0,0]);
if length(lo_at_he_mult[0,0])>lmax then lmax:=length(lo_at_he_mult[0,0]);

if length(apt_mult[0,0])>lmax then lmax:=length(apt_mult[0,0]);
if length(apt_h_mult[0,0])>lmax then lmax:=length(apt_h_mult[0,0]);
if length(apt_spin_mult[0,0])>lmax then lmax:=length(apt_spin_mult[0,0]);
if length(apt_spin_h_mult[0,0])>lmax then lmax:=length(apt_spin_h_mult[0,0]);
if length(apt_n_he_mult[0,0])>lmax then lmax:=length(apt_n_he_mult[0,0]);
if length(apt_at_he_mult[0,0])>lmax then lmax:=length(apt_at_he_mult[0,0]);

if length(dip_mull_mult[0,0])>lmax then lmax:=length(dip_mull_mult[0,0]);
if length(dip_lo_mult[0,0])>lmax then lmax:=length(dip_lo_mult[0,0]);
if length(dip_esp_mult[0,0])>lmax then lmax:=length(dip_esp_mult[0,0]);




SetLength(mull_mult,fmax,kmax,lmax);
SetLength(mull_h_mult,fmax,kmax,lmax);
SetLength(mull_spin_mult,fmax,kmax,lmax);
SetLength(mull_spin_h_mult,fmax,kmax,lmax);
SetLength(n_he_mult,fmax,kmax,lmax);
SetLength(at_he_mult,fmax,kmax,lmax);

SetLength(mbs_mull_mult,fmax,kmax,lmax);
SetLength(mbs_mull_h_mult,fmax,kmax,lmax);
SetLength(mbs_mull_spin_mult,fmax,kmax,lmax);
SetLength(mbs_mull_spin_h_mult,fmax,kmax,lmax);
SetLength(mbs_n_he_mult,fmax,kmax,lmax);
SetLength(mbs_at_he_mult,fmax,kmax,lmax);

SetLength(esp_mult,fmax,kmax,lmax);
SetLength(esp_h_mult,fmax,kmax,lmax);
SetLength(esp_spin_mult,fmax,kmax,lmax);
SetLength(esp_spin_h_mult,fmax,kmax,lmax);
SetLength(esp_n_he_mult,fmax,kmax,lmax);
SetLength(esp_at_he_mult,fmax,kmax,lmax);

SetLength(bond_mull_mult,fmax,kmax,lmax);
SetLength(bond_mull_h_mult,fmax,kmax,lmax);
SetLength(bond_mull_spin_mult,fmax,kmax,lmax);
SetLength(bond_mull_spin_h_mult,fmax,kmax,lmax);
SetLength(bond_n_he_mult,fmax,kmax,lmax);
SetLength(bond_at_he_mult,fmax,kmax,lmax);

SetLength(hir_mult,fmax,kmax,lmax);
SetLength(hir_h_mult,fmax,kmax,lmax);
SetLength(cm5_mult,fmax,kmax,lmax);
SetLength(cm5_h_mult,fmax,kmax,lmax);
SetLength(hir_spin_mult,fmax,kmax,lmax);
SetLength(hir_n_he_mult,fmax,kmax,lmax);
SetLength(hir_at_he_mult,fmax,kmax,lmax);

SetLength(nbo_mult,fmax,kmax,lmax);
SetLength(aim_mult,fmax,kmax,lmax);
SetLength(poten_mult,fmax,kmax,lmax);

SetLength(lo_mult,fmax,kmax,lmax);
SetLength(lo_h_mult,fmax,kmax,lmax);
SetLength(lo_spin_mult,fmax,kmax,lmax);
SetLength(lo_spin_h_mult,fmax,kmax,lmax);
SetLength(lo_n_he_mult,fmax,kmax,lmax);
SetLength(lo_at_he_mult,fmax,kmax,lmax);

SetLength(apt_mult,fmax,kmax,lmax);
SetLength(apt_h_mult,fmax,kmax,lmax);
SetLength(apt_spin_mult,fmax,kmax,lmax);
SetLength(apt_spin_h_mult,fmax,kmax,lmax);
SetLength(apt_n_he_mult,fmax,kmax,lmax);
SetLength(apt_at_he_mult,fmax,kmax,lmax);

SetLength(dip_mull_mult,fmax,kmax,lmax);
SetLength(dip_lo_mult,fmax,kmax,lmax);
SetLength(dip_esp_mult,fmax,kmax,lmax);



////////////////////////////////////////////////////////
//////////////Чтение всех файлов закончилось надо BASKET
basket:=nil;

i:=0;
for j:=0 to nf-1 do  begin
if mull_mult<>nil then begin
if mull_mult[j]<>nil then begin
 if mull_mult[j,0]<>nil then begin
if mull_mult[j,0,0]<>'' then begin
SetLength(basket,i+1);
basket[i]:=j;
Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
i:=i+1;
end
else  ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных о зарядах!');
end
else  begin
ShowMessage('Прочитанные файлы не содержит данных о зарядах!');
goto 0;
end;
end
else  begin
ShowMessage('Прочитанные файлы не содержит данных о зарядах!');
goto 0;
end;
end;
end;   /////////////// end of Basket

Combobox1.ItemIndex:=0;




if mull_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Mulliken';
end;
if mbs_mull_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='MBS Mulliken';
end;
if bond_mull_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Bonding Mulliken';
end;
if esp_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='ESP';
end;
if hir_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Hirshfeld';
end;
if cm5_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='CM5';
end;
if nbo_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='NBO';
end;
if aim_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='AIM';
end;
if lo_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Lowdin';
end;
if apt_mult[basket[0],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='APT';
end;


////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[0]]) do
if copy(Form1.OpenDialog2.Files[basket[0]],i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog2.Files[basket[0]],j+1,200);
////////////////////////////////////////////////////////////////////



if method<>nil then begin
for i:=0 to length(method)-1 do
if method[i]<>'' then Combobox2.Items.Add(method[i]);
end;



//ComboBox1.Items.Add(Form1.OpenDialog2.Files[basket[0]]);
ComboBox1.ItemIndex:=0;
ComboBox2.ItemIndex:=0;
Label2.Caption:='Наименование системы: '  + task;
Label3.Caption:='Схема расчета зарядов: ' + Combobox2.Text;
if Combobox2.Text='Mulliken'         then if abs(Totchrg(mull_mult[basket[0]]))>=0.00001       then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mull_mult[basket[0]]),ffFixed,8,6)      else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='MBS Mulliken'     then if abs(Totchrg(mbs_mull_mult[basket[0]]))>=0.00001   then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mbs_mull_mult[basket[0]]),ffFixed,8,6)  else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Bonding Mulliken' then if abs(Totchrg(bond_mull_mult[basket[0]]))>=0.00001  then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(bond_mull_mult[basket[0]]),ffFixed,8,6) else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='ESP'              then if abs(Totchrg(esp_mult[basket[0]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(esp_mult[basket[0]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Hirshfeld'        then if abs(Totchrg(hir_mult[basket[0]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(hir_mult[basket[0]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='CM5'              then if abs(Totchrg(cm5_mult[basket[0]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(cm5_mult[basket[0]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='NBO'              then if abs(Totchrg(nbo_mult[basket[0]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(nbo_mult[basket[0]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='AIM'              then if abs(Totchrg(aim_mult[basket[0]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(aim_mult[basket[0]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Lowdin'           then if abs(Totchrg(lo_mult[basket[0]]))>=0.00001         then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(lo_mult[basket[0]]),ffFixed,8,6)        else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='APT'              then if abs(Totchrg(apt_mult[basket[0]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(apt_mult[basket[0]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';;


if Combobox2.Text='Mulliken'         then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mull_mult[basket[0]]),1,pos('=',MinMaxChrg(mull_mult[basket[0]]))-1)            + ' / ' + Copy(MinMaxChrg(mull_mult[basket[0]]),pos('=',MinMaxChrg(mull_mult[basket[0]]))+1,length(MinMaxChrg(mull_mult[basket[0]])));
if Combobox2.Text='MBS Mulliken'     then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mbs_mull_mult[basket[0]]),1,pos('=',MinMaxChrg(mbs_mull_mult[basket[0]]))-1)    + ' / ' + Copy(MinMaxChrg(mbs_mull_mult[basket[0]]),pos('=',MinMaxChrg(mbs_mull_mult[basket[0]]))+1,length(MinMaxChrg(mbs_mull_mult[basket[0]])));
if Combobox2.Text='Bonding Mulliken' then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(bond_mull_mult[basket[0]]),1,pos('=',MinMaxChrg(bond_mull_mult[basket[0]]))-1)  + ' / ' + Copy(MinMaxChrg(bond_mull_mult[basket[0]]),pos('=',MinMaxChrg(bond_mull_mult[basket[0]]))+1,length(MinMaxChrg(bond_mull_mult[basket[0]])));
if Combobox2.Text='ESP'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(esp_mult[basket[0]]),1,pos('=',MinMaxChrg(esp_mult[basket[0]]))-1)              + ' / ' + Copy(MinMaxChrg(esp_mult[basket[0]]),pos('=',MinMaxChrg(esp_mult[basket[0]]))+1,length(MinMaxChrg(esp_mult[basket[0]])));
if Combobox2.Text='Hirshfeld'        then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(hir_mult[basket[0]]),1,pos('=',MinMaxChrg(hir_mult[basket[0]]))-1)              + ' / ' + Copy(MinMaxChrg(hir_mult[basket[0]]),pos('=',MinMaxChrg(hir_mult[basket[0]]))+1,length(MinMaxChrg(hir_mult[basket[0]])));
if Combobox2.Text='CM5'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(cm5_mult[basket[0]]),1,pos('=',MinMaxChrg(cm5_mult[basket[0]]))-1)              + ' / ' + Copy(MinMaxChrg(cm5_mult[basket[0]]),pos('=',MinMaxChrg(cm5_mult[basket[0]]))+1,length(MinMaxChrg(cm5_mult[basket[0]])));
if Combobox2.Text='NBO'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(nbo_mult[basket[0]]),1,pos('=',MinMaxChrg(nbo_mult[basket[0]]))-1)              + ' / ' + Copy(MinMaxChrg(nbo_mult[basket[0]]),pos('=',MinMaxChrg(nbo_mult[basket[0]]))+1,length(MinMaxChrg(nbo_mult[basket[0]])));
if Combobox2.Text='AIM'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(aim_mult[basket[0]]),1,pos('=',MinMaxChrg(aim_mult[basket[0]]))-1)              + ' / ' + Copy(MinMaxChrg(aim_mult[basket[0]]),pos('=',MinMaxChrg(aim_mult[basket[0]]))+1,length(MinMaxChrg(aim_mult[basket[0]])));
if Combobox2.Text='Lowdin'           then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(lo_mult[basket[0]]),1,pos('=',MinMaxChrg(lo_mult[basket[0]]))-1)                + ' / ' + Copy(MinMaxChrg(lo_mult[basket[0]]),pos('=',MinMaxChrg(lo_mult[basket[0]]))+1,length(MinMaxChrg(lo_mult[basket[0]])));
if Combobox2.Text='APT'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(apt_mult[basket[0]]),1,pos('=',MinMaxChrg(apt_mult[basket[0]]))-1)              + ' / ' + Copy(MinMaxChrg(apt_mult[basket[0]]),pos('=',MinMaxChrg(apt_mult[basket[0]]))+1,length(MinMaxChrg(apt_mult[basket[0]])));


Label7.Caption:='Дипольный момент: ****';
if pos('Mulliken',Combobox2.Text)<>0 then Label7.Caption:='Дипольный момент: '  + dip_mull_mult[basket[0],howlong(dip_mull_mult[basket[0]]),0] +' D';
if pos('ESP',Combobox2.Text)<>0      then Label7.Caption:='Дипольный момент: '  + dip_esp_mult[basket[0],length(dip_esp_mult[basket[0]]),0]    +' D';
if pos('Lowdin',Combobox2.Text)<>0   then Label7.Caption:='Дипольный момент: '  + dip_lo_mult[basket[0],length(dip_lo_mult[basket[0]]),0]      +' D';


if z_mlt[basket[0]]=true then  begin
Label8.Font.Color:=clblack;
Label8.Caption:='Результат: Normal termination' ;
end
else  begin
Label8.Font.Color:=clred;
Label8.Caption:='Результат: WARNING! Abnormal termination!'
end;




// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@
// Заполняем ListView                                                        @@@@@           @@@@@@@      @@@@@      @@@@@@@@@
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@

if Combobox2.Text='Mulliken' then begin
for i:=0 to length(mull_mult[basket[0],howlong(mull_mult[basket[0]])])-2 do begin
if mull_mult[basket[0],howlong(mull_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(mull_mult[basket[0],howlong(mull_mult[basket[0]]),i]);
if howlong(mull_spin_mult[basket[0]])<0 then itm.SubItems.Append('****');
if howlong(mull_spin_mult[basket[0]])>=0 then  if mull_spin_mult[basket[0],howlong(mull_spin_mult[basket[0]]),0]=''  then  itm.SubItems.Append('****');
if howlong(mull_spin_mult[basket[0]])>=0 then  if mull_spin_mult[basket[0],howlong(mull_spin_mult[basket[0]]),0]<>'' then  itm.SubItems.Append(mull_spin_mult[basket[0],howlong(mull_spin_mult[basket[0]]),i]);
end;
end;
end;

if Combobox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull_mult[basket[0],howlong(mbs_mull_mult[basket[0]])])-2 do begin
if mbs_mull_mult[basket[0],howlong(mbs_mull_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(mbs_mull_mult[basket[0],howlong(mbs_mull_mult[basket[0]]),i]);
if howlong(mbs_mull_spin_mult[basket[0]])<0 then itm.SubItems.Append('****');
if howlong(mbs_mull_spin_mult[basket[0]])>=0 then  if mbs_mull_spin_mult[basket[0],howlong(mbs_mull_spin_mult[basket[0]]),0]=''  then  itm.SubItems.Append('****');
if howlong(mbs_mull_spin_mult[basket[0]])>=0 then  if mbs_mull_spin_mult[basket[0],howlong(mbs_mull_spin_mult[basket[0]]),0]<>'' then  itm.SubItems.Append(mbs_mull_spin_mult[basket[0],howlong(mbs_mull_spin_mult[basket[0]]),i]);
end;
end;
end;

if Combobox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull_mult[basket[0],howlong(bond_mull_mult[basket[0]])])-2 do begin
if bond_mull_mult[basket[0],howlong(bond_mull_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(bond_mull_mult[basket[0],howlong(bond_mull_mult[basket[0]]),i]);
if howlong(bond_mull_spin_mult[basket[0]])<0 then itm.SubItems.Append('****');
if howlong(bond_mull_spin_mult[basket[0]])>=0 then  if bond_mull_spin_mult[basket[0],howlong(bond_mull_spin_mult[basket[0]]),0]=''  then  itm.SubItems.Append('****');
if howlong(bond_mull_spin_mult[basket[0]])>=0 then  if bond_mull_spin_mult[basket[0],howlong(bond_mull_spin_mult[basket[0]]),0]<>'' then  itm.SubItems.Append(bond_mull_spin_mult[basket[0],howlong(bond_mull_spin_mult[basket[0]]),i]);
end;
end;
end;

if Combobox2.Text='ESP' then begin
for i:=0 to length(esp_mult[basket[0],howlong(esp_mult[basket[0]])])-2 do begin
if esp_mult[basket[0],howlong(esp_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(esp_mult[basket[0],howlong(esp_mult[basket[0]]),i]);
if howlong(esp_spin_mult[basket[0]])<0 then itm.SubItems.Append('****');
if howlong(esp_spin_mult[basket[0]])>=0 then  if esp_spin_mult[basket[0],howlong(esp_spin_mult[basket[0]]),0]=''  then  itm.SubItems.Append('****');
if howlong(esp_spin_mult[basket[0]])>=0 then  if esp_spin_mult[basket[0],howlong(esp_spin_mult[basket[0]]),0]<>'' then  itm.SubItems.Append(esp_spin_mult[basket[0],howlong(esp_spin_mult[basket[0]]),i]);
end;
end;
end;

if Combobox2.Text='Hirshfeld' then begin
for i:=0 to length(hir_mult[basket[0],howlong(hir_mult[basket[0]])])-2 do begin
if hir_mult[basket[0],howlong(hir_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(hir_mult[basket[0],howlong(hir_mult[basket[0]]),i]);
if howlong(hir_spin_mult[basket[0]])>=0 then  if hir_spin_mult[basket[0],howlong(hir_spin_mult[basket[0]]),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin_mult[basket[0]])>=0 then  if hir_spin_mult[basket[0],howlong(hir_spin_mult[basket[0]]),0]<>'' then  itm.SubItems.Append(hir_spin_mult[basket[0],howlong(hir_spin_mult[basket[0]]),i]);
end;
end;
end;

if Combobox2.Text='CM5' then begin
for i:=0 to length(cm5_mult[basket[0],howlong(cm5_mult[basket[0]])])-2 do begin
if cm5_mult[basket[0],howlong(cm5_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(cm5_mult[basket[0],howlong(cm5_mult[basket[0]]),i]);         //// !!!!! СПИН ОСТАВЛЯЕМ ОТ ХИРШВЕЛЬДА - Т.К. СМ5 - ЭТО ЗАРЯДЫ, РАСЧИТАННЫЕ В МЕТОДЕ ХИРШВЕЛЬДА
if howlong(hir_spin_mult[basket[0]])>=0 then  if hir_spin_mult[basket[0],howlong(hir_spin_mult[basket[0]]),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin_mult[basket[0]])>=0 then  if hir_spin_mult[basket[0],howlong(hir_spin_mult[basket[0]]),0]<>'' then  itm.SubItems.Append(hir_spin_mult[basket[0],howlong(hir_spin_mult[basket[0]]),i]);
end;
end;
end;

if Combobox2.Text='NBO' then begin
for i:=0 to length(nbo_mult[basket[0],howlong(nbo_mult[basket[0]])])-2 do begin
if nbo_mult[basket[0],howlong(nbo_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(nbo_mult[basket[0],howlong(nbo_mult[basket[0]]),i]);
itm.SubItems.Append('****');
end;
end;
end;

if Combobox2.Text='AIM' then begin
for i:=0 to length(aim_mult[basket[0],howlong(aim_mult[basket[0]])])-2 do begin
if aim_mult[basket[0],howlong(aim_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(aim_mult[basket[0],howlong(aim_mult[basket[0]]),i]);
itm.SubItems.Append('****');
end;
end;
end;

if Combobox2.Text='Lowdin' then begin
for i:=0 to length(lo_mult[basket[0],howlong(lo_mult[basket[0]])])-2 do begin
if lo_mult[basket[0],howlong(lo_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(lo_mult[basket[0],howlong(lo_mult[basket[0]]),i]);
if howlong(lo_spin_mult[basket[0]])<0 then itm.SubItems.Append('****');
if howlong(lo_spin_mult[basket[0]])>=0 then  if lo_spin_mult[basket[0],howlong(lo_spin_mult[basket[0]]),0]=''  then  itm.SubItems.Append('****');
if howlong(lo_spin_mult[basket[0]])>=0 then  if lo_spin_mult[basket[0],howlong(lo_spin_mult[basket[0]]),0]<>'' then  itm.SubItems.Append(lo_spin_mult[basket[0],howlong(lo_spin_mult[basket[0]]),i]);
end;
end;
end;

if Combobox2.Text='APT' then begin
for i:=0 to length(apt_mult[basket[0],howlong(apt_mult[basket[0]])])-2 do begin
if apt_mult[basket[0],howlong(apt_mult[basket[0]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(apt_mult[basket[0],howlong(apt_mult[basket[0]]),i]);
if howlong(apt_spin_mult[basket[0]])<0 then itm.SubItems.Append('****');
if howlong(apt_spin_mult[basket[0]])>=0 then  if apt_spin_mult[basket[0],howlong(apt_spin_mult[basket[0]]),0]=''  then  itm.SubItems.Append('****');
if howlong(apt_spin_mult[basket[0]])>=0 then  if apt_spin_mult[basket[0],howlong(apt_spin_mult[basket[0]]),0]<>'' then  itm.SubItems.Append(apt_spin_mult[basket[0],howlong(apt_spin_mult[basket[0]]),i]);
end;
end;
end;

end; // end of else begin (multi)

0:
end;








procedure TForm64.ComboBox1Change(Sender: TObject);
var method: array of string;
i,j: integer;
task: widestring;
itm: TListItem;
begin
if Combobox1.Items.Count>1 then begin

ListView1.Clear;
Combobox2.Clear;


if mull_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Mulliken';
end;
if mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='MBS Mulliken';
end;
if bond_mull_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Bonding Mulliken';
end;
if esp_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='ESP';
end;
if hir_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Hirshfeld';
end;
if cm5_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='CM5';
end;
if nbo_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='NBO';
end;
if aim_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='AIM';
end;
if lo_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='Lowdin';
end;
if apt_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
SetLength(method,length(method)+1);
method[length(method)-1]:='APT';
end;


////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[Form64.Combobox1.ItemIndex]]) do
if copy(Form1.OpenDialog2.Files[basket[Form64.Combobox1.ItemIndex]],i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog2.Files[basket[Form64.Combobox1.ItemIndex]],j+1,200);
////////////////////////////////////////////////////////////////////



if method<>nil then begin
for i:=0 to length(method)-1 do
if method[i]<>'' then Combobox2.Items.Add(method[i]);
end;



ComboBox2.ItemIndex:=0;
Label2.Caption:='Наименование системы: '  + task;
Label3.Caption:='Схема расчета зарядов: ' + Combobox2.Text;
if Combobox2.Text='Mulliken'         then  if abs(Totchrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001      then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)      else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='MBS Mulliken'     then if abs(Totchrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001   then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)  else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Bonding Mulliken' then if abs(Totchrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001  then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6) else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='ESP'              then if abs(Totchrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Hirshfeld'        then if abs(Totchrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='CM5'              then if abs(Totchrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='NBO'              then if abs(Totchrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='AIM'              then if abs(Totchrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Lowdin'           then if abs(Totchrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001         then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)        else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='APT'              then if abs(Totchrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';;


if Combobox2.Text='Mulliken'         then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]))-1)            + ' / ' + Copy(MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='MBS Mulliken'     then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]))-1)    + ' / ' + Copy(MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='Bonding Mulliken' then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]))-1)  + ' / ' + Copy(MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='ESP'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='Hirshfeld'        then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='CM5'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='NBO'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='AIM'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='Lowdin'           then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]))-1)                + ' / ' + Copy(MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='APT'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]])));


Label7.Caption:='Дипольный момент: ****';
if pos('Mulliken',Combobox2.Text)<>0 then Label7.Caption:='Дипольный момент: '  + dip_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(dip_mull_mult[basket[Form64.Combobox1.ItemIndex]]),0] +' D';
if pos('ESP',Combobox2.Text)<>0      then Label7.Caption:='Дипольный момент: '  + dip_esp_mult[basket[Form64.Combobox1.ItemIndex],length(dip_esp_mult[basket[Form64.Combobox1.ItemIndex]]),0]    +' D';
if pos('Lowdin',Combobox2.Text)<>0   then Label7.Caption:='Дипольный момент: '  + dip_lo_mult[basket[Form64.Combobox1.ItemIndex],length(dip_lo_mult[basket[Form64.Combobox1.ItemIndex]]),0]      +' D';


if z_mlt[basket[Form64.Combobox1.ItemIndex]]=true then  begin
Label8.Font.Color:=clblack;
Label8.Caption:='Результат: Normal termination' ;
end
else  begin
Label8.Font.Color:=clred;
Label8.Caption:='Результат: WARNING! Abnormal termination!'
end;



// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@
// Заполняем ListView                                                        @@@@@           @@@@@@@      @@@@@      @@@@@@@@@
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@

if Combobox2.Text='Mulliken' then begin
for i:=0 to length(mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  bond_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(bond_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='ESP' then begin
for i:=0 to length(esp_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if esp_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(esp_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(esp_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='Hirshfeld' then begin
for i:=0 to length(hir_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  hir_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(hir_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='CM5' then begin
for i:=0 to length(cm5_mult[basket[Form64.Combobox1.ItemIndex],howlong(cm5_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  cm5_mult[basket[Form64.Combobox1.ItemIndex],howlong(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(cm5_mult[basket[Form64.Combobox1.ItemIndex],howlong(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),i]);         //// !!!!! СПИН ОСТАВЛЯЕМ ОТ ХИРШВЕЛЬДА - Т.К. СМ5 - ЭТО ЗАРЯДЫ, РАСЧИТАННЫЕ В МЕТОДЕ ХИРШВЕЛЬДА
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='NBO' then begin
for i:=0 to length(nbo_mult[basket[Form64.Combobox1.ItemIndex],howlong(nbo_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if nbo_mult[basket[Form64.Combobox1.ItemIndex],howlong(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(nbo_mult[basket[Form64.Combobox1.ItemIndex],howlong(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
itm.SubItems.Append('****');
end;
end;
end;

if Combobox2.Text='AIM' then begin
for i:=0 to length(aim_mult[basket[Form64.Combobox1.ItemIndex],howlong(aim_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  aim_mult[basket[Form64.Combobox1.ItemIndex],howlong(aim_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(aim_mult[basket[Form64.Combobox1.ItemIndex],howlong(aim_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
itm.SubItems.Append('****');
end;
end;
end;

if Combobox2.Text='Lowdin' then begin
for i:=0 to length(lo_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if lo_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(lo_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(lo_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='APT' then begin
for i:=0 to length(apt_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if apt_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(apt_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(apt_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;
end;

end;









procedure TForm64.ComboBox2Change(Sender: TObject);
var i: integer;
itm: TListItem;
begin
if Combobox2.Items.Count>1 then begin
ListView1.Clear;
Label3.Caption:='Схема расчета зарядов: ' + Combobox2.Text;
if dial=false then begin
if Combobox2.Text='Mulliken'         then if abs(Totchrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001       then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)      else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='MBS Mulliken'     then if abs(Totchrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001   then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)  else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Bonding Mulliken' then if abs(Totchrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001  then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6) else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='ESP'              then if abs(Totchrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Hirshfeld'        then if abs(Totchrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='CM5'              then if abs(Totchrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='NBO'              then if abs(Totchrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='AIM'              then if abs(Totchrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Lowdin'           then if abs(Totchrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001         then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)        else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='APT'              then if abs(Totchrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';;


if Combobox2.Text='Mulliken'         then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]))-1)            + ' / ' + Copy(MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(mull_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='MBS Mulliken'     then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]))-1)    + ' / ' + Copy(MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='Bonding Mulliken' then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]))-1)  + ' / ' + Copy(MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='ESP'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(esp_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='Hirshfeld'        then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(hir_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='CM5'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(cm5_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='NBO'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(nbo_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='AIM'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(aim_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='Lowdin'           then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]))-1)                + ' / ' + Copy(MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(lo_mult[basket[Form64.Combobox1.ItemIndex]])));
if Combobox2.Text='APT'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]),1,pos('=',MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]))-1)              + ' / ' + Copy(MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]),pos('=',MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]]))+1,length(MinMaxChrg(apt_mult[basket[Form64.Combobox1.ItemIndex]])));


Label7.Caption:='Дипольный момент: ****';
if pos('Mulliken',Combobox2.Text)<>0 then Label7.Caption:='Дипольный момент: '  + dip_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(dip_mull_mult[basket[Form64.Combobox1.ItemIndex]]),0] +' D';
if pos('ESP',Combobox2.Text)<>0      then Label7.Caption:='Дипольный момент: '  + dip_esp_mult[basket[Form64.Combobox1.ItemIndex],howlong(dip_esp_mult[basket[Form64.Combobox1.ItemIndex]]),0]   +' D';
if pos('Lowdin',Combobox2.Text)<>0   then Label7.Caption:='Дипольный момент: '  + dip_lo_mult[basket[Form64.Combobox1.ItemIndex],howlong(dip_lo_mult[basket[Form64.Combobox1.ItemIndex]]),0]     +' D';


// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@
// Заполняем ListView                                                        @@@@@           @@@@@@@      @@@@@      @@@@@@@@@
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@

if Combobox2.Text='Mulliken' then begin
for i:=0 to length(mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  bond_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(bond_mull_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='ESP' then begin
for i:=0 to length(esp_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if esp_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(esp_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(esp_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='Hirshfeld' then begin
for i:=0 to length(hir_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  hir_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(hir_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='CM5' then begin
for i:=0 to length(cm5_mult[basket[Form64.Combobox1.ItemIndex],howlong(cm5_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  cm5_mult[basket[Form64.Combobox1.ItemIndex],howlong(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(cm5_mult[basket[Form64.Combobox1.ItemIndex],howlong(cm5_mult[basket[Form64.Combobox1.ItemIndex]]),i]);         //// !!!!! СПИН ОСТАВЛЯЕМ ОТ ХИРШВЕЛЬДА - Т.К. СМ5 - ЭТО ЗАРЯДЫ, РАСЧИТАННЫЕ В МЕТОДЕ ХИРШВЕЛЬДА
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='NBO' then begin
for i:=0 to length(nbo_mult[basket[Form64.Combobox1.ItemIndex],howlong(nbo_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if nbo_mult[basket[Form64.Combobox1.ItemIndex],howlong(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(nbo_mult[basket[Form64.Combobox1.ItemIndex],howlong(nbo_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
itm.SubItems.Append('****');
end;
end;
end;

if Combobox2.Text='AIM' then begin
for i:=0 to length(aim_mult[basket[Form64.Combobox1.ItemIndex],howlong(aim_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if  aim_mult[basket[Form64.Combobox1.ItemIndex],howlong(aim_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(aim_mult[basket[Form64.Combobox1.ItemIndex],howlong(aim_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
itm.SubItems.Append('****');
end;
end;
end;

if Combobox2.Text='Lowdin' then begin
for i:=0 to length(lo_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if lo_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(lo_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(lo_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;

if Combobox2.Text='APT' then begin
for i:=0 to length(apt_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_mult[basket[Form64.Combobox1.ItemIndex]])])-2 do begin
if apt_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_mult[basket[Form64.Combobox1.ItemIndex]]),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(apt_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])<0 then itm.SubItems.Append('****');
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]=''  then  itm.SubItems.Append('****');
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]]),0]<>'' then  itm.SubItems.Append(apt_spin_mult[basket[Form64.Combobox1.ItemIndex],howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]]),i]);
end;
end;
end;
end
else begin
if Combobox2.Text='Mulliken'         then if abs(Totchrg(mull))>=0.00001       then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mull),ffFixed,8,6)      else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='MBS Mulliken'     then if abs(Totchrg(mbs_mull))>=0.00001   then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(mbs_mull),ffFixed,8,6)  else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Bonding Mulliken' then if abs(Totchrg(bond_mull))>=0.00001  then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(bond_mull),ffFixed,8,6) else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='ESP'              then if abs(Totchrg(esp))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(esp),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Hirshfeld'        then if abs(Totchrg(hir))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(hir),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='CM5'              then if abs(Totchrg(cm5))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(cm5),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='NBO'              then if abs(Totchrg(nbo))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(nbo),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='AIM'              then if abs(Totchrg(aim))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(aim),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='Lowdin'           then if abs(Totchrg(lo))>=0.00001         then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(lo),ffFixed,8,6)        else Label4.Caption:='Общий заряд системы: 0.000000';
if Combobox2.Text='APT'              then if abs(Totchrg(apt))>=0.00001        then    Label4.Caption:='Общий заряд системы: '  + floattostrf(Totchrg(apt),ffFixed,8,6)       else Label4.Caption:='Общий заряд системы: 0.000000';;


if Combobox2.Text='Mulliken'         then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1)            + ' / ' + Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull)));
if Combobox2.Text='MBS Mulliken'     then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1)    + ' / ' + Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull)));
if Combobox2.Text='Bonding Mulliken' then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1)  + ' / ' + Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull)));
if Combobox2.Text='ESP'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1)              + ' / ' + Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp)));
if Combobox2.Text='Hirshfeld'        then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1)              + ' / ' + Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir)));
if Combobox2.Text='CM5'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1)              + ' / ' + Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5)));
if Combobox2.Text='NBO'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1)              + ' / ' + Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo)));
if Combobox2.Text='AIM'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1)              + ' / ' + Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim)));
if Combobox2.Text='Lowdin'           then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1)                + ' / ' + Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo)));
if Combobox2.Text='APT'              then  Label5.Caption:='Наименьший / наибольший заряд: '  + Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1)              + ' / ' + Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt)));


Label7.Caption:='Дипольный момент: ****';
if pos('Mulliken',Combobox2.Text)<>0 then Label7.Caption:='Дипольный момент: '  + dip_mull[howlong(dip_mull),0] +' D';
if pos('ESP',Combobox2.Text)<>0      then Label7.Caption:='Дипольный момент: '  + dip_esp[howlong(dip_esp),0]   +' D';
if pos('Lowdin',Combobox2.Text)<>0   then Label7.Caption:='Дипольный момент: '  + dip_lo[howlong(dip_lo),0]     +' D';


// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@
// Заполняем ListView                                                        @@@@@           @@@@@@@      @@@@@      @@@@@@@@@
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@

if Combobox2.Text='Mulliken' then begin
for i:=0 to length(mull[howlong(mull)])-1 do begin
if mull[howlong(mull),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(mull[howlong(mull),i]);
if howlong(mull_spin)<0 then itm.SubItems.Append('****');
if howlong(mull_spin)>=0 then  if mull_spin[howlong(mull_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(mull_spin)>=0 then  if mull_spin[howlong(mull_spin),0]<>'' then  itm.SubItems.Append(mull_spin[howlong(mull_spin),i]);
end;
end;
end;

if Combobox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull[howlong(mbs_mull)])-1 do begin
if  mbs_mull[howlong(mbs_mull),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(mbs_mull[howlong(mbs_mull),i]);
if howlong(mbs_mull_spin)<0 then itm.SubItems.Append('****');
if howlong(mbs_mull_spin)>=0 then  if mbs_mull_spin[howlong(mbs_mull_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(mbs_mull_spin)>=0 then  if mbs_mull_spin[howlong(mbs_mull_spin),0]<>'' then  itm.SubItems.Append(mbs_mull_spin[howlong(mbs_mull_spin),i]);
end;
end;
end;

if Combobox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull[howlong(bond_mull)])-1 do begin
if  bond_mull[howlong(bond_mull),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(bond_mull[howlong(bond_mull),i]);
if howlong(bond_mull_spin)<0 then itm.SubItems.Append('****');
if howlong(bond_mull_spin)>=0 then  if bond_mull_spin[howlong(bond_mull_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(bond_mull_spin)>=0 then  if bond_mull_spin[howlong(bond_mull_spin),0]<>'' then  itm.SubItems.Append(bond_mull_spin[howlong(bond_mull_spin),i]);
end;
end;
end;

if Combobox2.Text='ESP' then begin
for i:=0 to length(esp[howlong(esp)])-1 do begin
if esp[howlong(esp),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(esp[howlong(esp),i]);
if howlong(esp_spin)<0 then itm.SubItems.Append('****');
if howlong(esp_spin)>=0 then  if esp_spin[howlong(esp_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(esp_spin)>=0 then  if esp_spin[howlong(esp_spin),0]<>'' then  itm.SubItems.Append(esp_spin[howlong(esp_spin),i]);
end;
end;
end;

if Combobox2.Text='Hirshfeld' then begin
for i:=0 to length(hir[howlong(hir)])-1 do begin
if  hir[howlong(hir),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(hir[howlong(hir),i]);
if howlong(hir_spin)>=0 then  if hir_spin[howlong(hir_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin)>=0 then  if hir_spin[howlong(hir_spin),0]<>'' then  itm.SubItems.Append(hir_spin[howlong(hir_spin),i]);
end;
end;
end;

if Combobox2.Text='CM5' then begin
for i:=0 to length(cm5[howlong(cm5)])-1 do begin
if  cm5[howlong(cm5),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(cm5[howlong(cm5),i]);         //// !!!!! СПИН ОСТАВЛЯЕМ ОТ ХИРШВЕЛЬДА - Т.К. СМ5 - ЭТО ЗАРЯДЫ, РАСЧИТАННЫЕ В МЕТОДЕ ХИРШВЕЛЬДА
if howlong(hir_spin)>=0 then  if hir_spin[howlong(hir_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(hir_spin)>=0 then  if hir_spin[howlong(hir_spin),0]<>'' then  itm.SubItems.Append(hir_spin[howlong(hir_spin),i]);
end;
end;
end;

if Combobox2.Text='NBO' then begin
for i:=0 to length(nbo[howlong(nbo)])-1 do begin
if nbo[howlong(nbo),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(nbo[howlong(nbo),i]);
itm.SubItems.Append('****');
end;
end;
end;

if Combobox2.Text='AIM' then begin
for i:=0 to length(aim[howlong(aim)])-1 do begin
if  aim[howlong(aim),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(aim[howlong(aim),i]);
itm.SubItems.Append('****');
end;
end;
end;

if Combobox2.Text='Lowdin' then begin
for i:=0 to length(lo[howlong(lo)])-1 do begin
if lo[howlong(lo),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(lo[howlong(lo),i]);
if howlong(lo_spin)<0 then itm.SubItems.Append('****');
if howlong(lo_spin)>=0 then  if lo_spin[howlong(lo_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(lo_spin)>=0 then  if lo_spin[howlong(lo_spin),0]<>'' then  itm.SubItems.Append(lo_spin[howlong(lo_spin),i]);
end;
end;
end;

if Combobox2.Text='APT' then begin
for i:=0 to length(apt[howlong(apt)])-1 do begin
if apt[howlong(apt),i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(apt[howlong(apt),i]);
if howlong(apt_spin)<0 then itm.SubItems.Append('****');
if howlong(apt_spin)>=0 then  if apt_spin[howlong(apt_spin),0]=''  then  itm.SubItems.Append('****');
if howlong(apt_spin)>=0 then  if apt_spin[howlong(apt_spin),0]<>'' then  itm.SubItems.Append(apt_spin[howlong(apt_spin),i]);
end;
end;
end;


end;
end;

end;

procedure TForm64.BitBtn1Click(Sender: TObject);
begin
Form65.Show;
end;

procedure TForm64.BitBtn4Click(Sender: TObject);
begin
Form67.Show;
end;

procedure TForm64.BitBtn5Click(Sender: TObject);
begin
Form68.Show;
end;



procedure TForm64.BitBtn6Click(Sender: TObject);
begin
Form70.Show;
end;

procedure TForm64.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Qcolor:=nil;
Qval:=nil;
bonds_painted:=false;
end;

procedure TForm64.BitBtn3Click(Sender: TObject);
var f: TextFile;
i,j: integer;
probel,a,d,e: WideString;
begin
probel:='                                                                         ';
if SaveDialog1.Execute then begin
if  pos('.txt',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.txt';
AssignFile(f,a);
Rewrite(f);
WriteLn(f,' **************************************************************');
WriteLn(f,' *                          CHARGES:                          *');
WriteLn(f,' *      Charges, spin densities, electrostatic potencials     *');
WriteLn(f,' *                for atoms and group of atoms                *');
WriteLn(f,' *            and dipole moments and their evolution          *');
WriteLn(f,' *       (Mulliken, MBS Mulliken, Bonding Mulliken, ESP,      *');
WriteLn(f,' *        Hirshfeld, CM5, NBO, AIM, Lowdin and APT)           *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                        Magellan 1.4                        *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,' File: ' +Combobox1.Items[Combobox1.ItemIndex]);
WriteLn(f,' Sheme of calculation: ' +Combobox2.Items[Combobox1.ItemIndex]);
WriteLn(f,' Total charge: ' + Copy(Label4.Caption,pos(':',Label4.Caption)+2,length(Label4.Caption)));
WriteLn(f,' Min / Max charge: ' + Copy(Label5.Caption,pos(':',Label5.Caption)+2,length(Label5.Caption)));
WriteLn(f,' Dipole moment: ' + Copy(Label7.Caption,pos(':',Label7.Caption)+2,length(Label7.Caption)));
WriteLn(f,' Result: ' + Copy(Label8.Caption, pos(':',Label8.Caption)+2,length(Label8.Caption)));
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f, '   №      Atom     Charge, a.u.    Spin density, a.u.');
WriteLn(f,'');
for i:=0 to ListView1.Items.Count-1 do begin
Write(f, copy(probel,1,4-length(ListView1.Items[i].Caption))+ListView1.Items[i].Caption);
for j:=0 to ListView1.Columns.Count-2 do  begin
if j=0 then Write(f,copy(probel,1,7) + ListView1.Items[i].SubItems[j]);
if j=1 then Write(f,copy(probel,1,18-length(ListView1.Items[i].SubItems[j])-length(ListView1.Items[i].SubItems[j-1])) + ListView1.Items[i].SubItems[j]);
if j=2 then Write(f,copy(probel,1,14-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
end;
WriteLn(f,'');
end;


WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,' **** END **** / '+Datetostr(Now)+' /');





CloseFile(f);
end;

SaveDialog1.FreeOnRelease;
end;

procedure TForm64.BitBtn2Click(Sender: TObject);
var MSExcel: OleVariant;
Rez: HRESULT;
ClassID: TCLSID;
probel: widestring;
i,j,ps: integer;
reagent,product: Array of widestring;
XLSeparator:string;
label 0;
begin
Rez := CLSIDFromProgID(PWideChar(WideString('Excel.Application')), ClassID);
if Rez <> S_OK then begin
MessageDlg('EXCEL не установлен',mtERROR,[mbok],0);
goto 0;
end;


MSExcel:=CreateOleObject('Excel.Application');
MSExcel.Workbooks.Add;
MSExcel.Visible:=True;
XLSeparator:= MSExcel.DecimalSeparator;

for i:=0 to ListView1.Columns.Count-1 do begin
if pos('№',ListView1.Columns[i].Caption)<>0  then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 10;     //#
if pos('Атом',ListView1.Columns[i].Caption)<>0 then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 10;     //#
if pos('Заряд',ListView1.Columns[i].Caption)<>0 then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 15;     //#
if pos('Спин',ListView1.Columns[i].Caption)<>0 then MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 18;     //#
end;

for i:=0 to ListView1.Columns.Count-1 do   begin
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2+i].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2+i].HorizontalAlignment := xlRight;
MSExcel.Cells[1,2+i]:=ListView1.Column[i].Caption;
end;


for i:=0 to ListView1.Items.Count-1 do  begin
MSExcel.Cells[i+2,2]:=ListView1.Items[i].Caption;
for j:=0 to ListView1.Columns.Count-2 do  begin
MSExcel.Cells[i+2,3+j]:=ListView1.Items[i].SubItems[j];
MSExcel.WorkBooks[1].WorkSheets[1].Cells[i+2,3+j].HorizontalAlignment := xlRight;
end;
end;



0:
end;

end.
