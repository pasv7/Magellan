unit Unit58;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ComObj, OleServer, ExcelXP, ActiveX;

type
  TForm58 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ComboBox2: TComboBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form58: TForm58;
  tenzor_giao,tenzor_csgt,tenzor_igaim,tenzor_so: array of TStringList;
  tenzor_giao_mult,tenzor_csgt_mult,tenzor_igaim_mult,tenzor_so_mult: array of array of TStringList;
  sus_giao,spsp_FC_K,spsp_FC_J,spsp_SD_K,spsp_SD_J,spsp_PSO_K,spsp_PSO_J,spsp_DSO_K,spsp_DSO_J,spsp_Tot_k,spsp_Tot_J: array of string;
  sus_giao_mult,spsp_FC_K_mult,spsp_FC_J_mult,spsp_SD_K_mult,spsp_SD_J_mult,spsp_PSO_K_mult,spsp_PSO_J_mult,spsp_DSO_K_mult,spsp_DSO_J_mult,spsp_Tot_k_mult,spsp_Tot_J_mult: array of array of string;
  z_mlt: array of boolean;
  nmr_methods: array of array of string;
  shield_giao,anis_giao,shield_csgt,anis_csgt,shield_igaim,anis_igaim,shield_so,anis_so: array of string;
  shield_giao_mult,anis_giao_mult,shield_csgt_mult,anis_csgt_mult,shield_igaim_mult,anis_igaim_mult,shield_so_mult,anis_so_mult: array of array of string;
  susc_csgt_mult,susc_igaim_mult,susc_so_mult: array of string;
  susc_csgt,susc_igaim,susc_so: string;
  degener_compos_giao,degener_compos_csgt,degener_compos_igaim,degener_compos_so: array of array of string;
  degener_compos_giao_mult,degener_compos_csgt_mult,degener_compos_igaim_mult,degener_compos_so_mult: array of array of array of string;
  degener_giao,degener_csgt,degener_igaim,degener_so: array of string;
  degener_giao_mult,degener_csgt_mult,degener_igaim_mult,degener_so_mult: array of array of string;

implementation

uses Unit1,Unit24, Unit59, Unit60, Unit61;

{$R *.dfm}

procedure TForm58.FormCreate(Sender: TObject);
begin
Label3.Caption:='';
Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
end;

procedure TForm58.FormShow(Sender: TObject);
var f: TextFile;
str,str1,str2,str3,task,x20,x40: widestring;
i,j,k,m,n,s,nlmax,p,b,NAmax,d: integer;
tol,summa_temp: real;
shield_temp,shield_temp1: array of string;
shield_temp_mult,shield_temp1_mult: array of array of string;
cut_temp: array of integer;
z_end,check_cut: boolean;
itm: TListItem;
label 0,1,2,3,4,10,20,30,40,25,26,27,28,250,260,270,280,222,220,500,300,2200,2220,5000,3000;
begin
ListView1.Clear;
Combobox1.Clear;
Combobox2.Clear;
Label3.Caption:='';
Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
tenzor_giao:=nil;
tenzor_csgt:=nil;
tenzor_igaim:=nil;
tenzor_so:=nil;
sus_giao:=nil;
spsp_FC_K:=nil;
spsp_FC_J:=nil;
spsp_SD_K:=nil;
spsp_SD_J:=nil;
spsp_PSO_K:=nil;
spsp_PSO_J:=nil;
spsp_DSO_K:=nil;
spsp_DSO_J:=nil;
spsp_Tot_k:=nil;
spsp_Tot_J:=nil;
shield_giao:=nil;
anis_giao:=nil;
shield_csgt:=nil;
anis_csgt:=nil;
shield_igaim:=nil;
anis_igaim:=nil;
shield_so:=nil;
anis_so:=nil;
degener_giao:=nil;
degener_csgt:=nil;
degener_igaim:=nil;
degener_so:=nil;
shield_temp:=nil;
shield_temp1:=nil;
shield_giao_mult:=nil;
anis_giao_mult:=nil;
shield_csgt_mult:=nil;
anis_csgt_mult:=nil;
shield_igaim_mult:=nil;
anis_igaim_mult:=nil;
shield_so_mult:=nil;
anis_so_mult:=nil;
degener_giao_mult:=nil;
degener_csgt_mult:=nil;
degener_igaim_mult:=nil;
degener_so_mult:=nil;
shield_temp_mult:=nil;
shield_temp1_mult:=nil;
susc_csgt_mult:=nil;
susc_igaim_mult:=nil;
susc_so_mult:=nil;
susc_csgt:='';
susc_igaim:='';
susc_so:='';
degener_compos_giao:=nil;
degener_compos_csgt:=nil;
degener_compos_igaim:=nil;
degener_compos_so:=nil;
degener_compos_giao_mult:=nil;
degener_compos_csgt_mult:=nil;
degener_compos_igaim_mult:=nil;
degener_compos_so_mult:=nil;
degener_giao:=nil;
degener_csgt:=nil;
degener_igaim:=nil;
degener_so:=nil;
degener_giao_mult:=nil;
degener_csgt_mult:=nil;
degener_igaim_mult:=nil;
degener_so_mult:=nil;
tol:=0.5;   // Толерантность объединения пиков расположенных близко друг к другу в вырождение (можно отразить в настройках)


if dial=true then begin
if Form1.OpenDialog1.FilterIndex=1 then goto 0;
if Form1.OpenDialog1.FilterIndex=3 then goto 0;
AssignFile(f,Form1.OpenDialog1.Filename);
Reset(f);
z_end:=false;
j:=0;
while not eof(f) do begin
ReadLn(f,str);

///////////////////////////// G I A O ///////////////////////////////////////////

if pos(' SCF GIAO Magnetic shielding tensor (ppm):',str)<>0 then begin
SetLength(shield_giao,nomer_atoma);
SetLength(anis_giao,nomer_atoma);
SetLength(tenzor_giao,nomer_atoma);
Combobox2.Items.Add('GIAO');
ReadLn(f,str);
while  (pos(' End of Minotr',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0) do begin
if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это сам химсдвиг
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропия
shield_giao[j]:=str3;
anis_giao[j]:=str2;
ReadLn(f,str);
tenzor_giao[j]:=TStringList.Create;
while  (pos(' Isotropic ',str)=0) and (pos(' Anisotropy ',str)=0) and (pos(' End of Minotr ',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0) do begin
tenzor_giao[j].Add(str);
ReadLn(f,str);
end;   //  while  (pos(' Isotropic ',srr)=0) and (pos(' Anisotropy ',str)=0) do begin
j:=j+1;
end;   // if (pos(' Isotropic ',srr)<>0) and (pos(' Anisotropy ',str)<>0) then begin
end;   // while  pos(' End of Minotr',str)=0 do begin
end; // if pos(' SCF GIAO Magnetic shielding tensor (ppm):',str)<>0 then begin

///////////////////////////////////////////////////////////////////////////////////////


//////////////////////////// C S G T //////////////////////////////////////////////
if pos(' Magnetic properties (CSGT method)',str)<>0 then begin
while (pos(' Isotropic ',str)=0) and (pos(' Anisotropy',str)=0) do
ReadLn(f,str);

if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это изотропная магнитная восприимчивость
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропная магнитная восприимчивость
susc_csgt:=str3+' / ' + str2;
end;

while pos(' Magnetic shielding (ppm):',str)=0 do
ReadLn(f,str);

if pos(' Magnetic shielding (ppm):',str)<>0 then begin
SetLength(shield_csgt,nomer_atoma);
SetLength(anis_csgt,nomer_atoma);
SetLength(tenzor_csgt,nomer_atoma);
Combobox2.Items.Add('CSGT');
ReadLn(f,str);
j:=0;
while  (pos(' Current density tensor (au):',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0) do begin
if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это сам химсдвиг
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропия
shield_csgt[j]:=str3;
anis_csgt[j]:=str2;
ReadLn(f,str);
tenzor_csgt[j]:=TStringList.Create;
while  (pos(' Isotropic ',str)=0) and (pos(' Anisotropy ',str)=0) and (pos(' Current density tensor (au):',str)=0) and (Pos(' Calculating ',str)=0) do begin
tenzor_csgt[j].Add(str);
ReadLn(f,str);
end;   //  while  (pos(' Isotropic ',srr)=0) and (pos(' Anisotropy ',str)=0) do begin
j:=j+1;
end;   // if (pos(' Isotropic ',srr)<>0) and (pos(' Anisotropy ',str)<>0) then begin
end;   // while  pos(' End of Minotr',str)=0 do begin
end; // if pos(' Magnetic shielding (ppm):',str)<>0 then begin
end;  // if pos(' Magnetic properties (CSGT method)',str)<>0 then begin
/////////////////////////////////////////////////////////////////////////////////


//////////////////////////// I G A I M //////////////////////////////////////////////
if pos(' Magnetic properties (IGAIM method)',str)<>0 then begin
while (pos(' Isotropic ',str)=0) and (pos(' Anisotropy',str)=0) do
ReadLn(f,str);

if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это изотропная магнитная восприимчивость
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропная магнитная восприимчивость
susc_igaim:=str3+' / ' + str2;
end;

while pos(' Magnetic shielding (ppm):',str)=0 do
ReadLn(f,str);

if pos(' Magnetic shielding (ppm):',str)<>0 then begin
SetLength(shield_igaim,nomer_atoma);
SetLength(anis_igaim,nomer_atoma);
SetLength(tenzor_igaim,nomer_atoma);
Combobox2.Items.Add('IGAIM');
ReadLn(f,str);
j:=0;
while (pos(' Current density tensor (au):',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0)  do begin
if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это сам химсдвиг
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропия
shield_igaim[j]:=str3;
anis_igaim[j]:=str2;
ReadLn(f,str);
tenzor_igaim[j]:=TStringList.Create;
while  (pos(' Isotropic ',str)=0) and (pos(' Anisotropy ',str)=0) and (pos(' Current density tensor (au):',str)=0) and (Pos(' Calculating ',str)=0) do begin
tenzor_igaim[j].Add(str);
ReadLn(f,str);
end;   //  while  (pos(' Isotropic ',srr)=0) and (pos(' Anisotropy ',str)=0) do begin
j:=j+1;
end;   // if (pos(' Isotropic ',srr)<>0) and (pos(' Anisotropy ',str)<>0) then begin
end;   // while  pos(' End of Minotr',str)=0 do begin
end; // if pos(' Magnetic shielding (ppm):',str)<>0 then begin
end;  // if pos(' Magnetic properties (CSGT method)',str)<>0 then begin
/////////////////////////////////////////////////////////////////////////////////


//////////////////////////// SINGLE ORIGIN //////////////////////////////////////////////
if pos(' Magnetic properties (single gauge origin)',str)<>0 then begin
while (pos(' Isotropic ',str)=0) and (pos(' Anisotropy',str)=0) do
ReadLn(f,str);

if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это изотропная магнитная восприимчивость
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропная магнитная восприимчивость
susc_so:=str3+' / ' + str2;
end;

while pos(' Magnetic shielding (ppm):',str)=0 do
ReadLn(f,str);

if pos(' Magnetic shielding (ppm):',str)<>0 then begin
SetLength(shield_so,nomer_atoma);
SetLength(anis_so,nomer_atoma);
SetLength(tenzor_so,nomer_atoma);
Combobox2.Items.Add('Single Origin');
ReadLn(f,str);
j:=0;
while (pos(' Current density tensor (au):',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0) do begin
if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это сам химсдвиг
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропия
shield_so[j]:=str3;
anis_so[j]:=str2;
ReadLn(f,str);
tenzor_so[j]:=TStringList.Create;
while  (pos(' Isotropic ',str)=0) and (pos(' Anisotropy ',str)=0) and (pos(' Current density tensor (au):',str)=0) and (Pos(' Calculating ',str)=0) do begin
tenzor_so[j].Add(str);
ReadLn(f,str);
end;   //  while  (pos(' Isotropic ',srr)=0) and (pos(' Anisotropy ',str)=0) do begin
j:=j+1;
end;   // if (pos(' Isotropic ',srr)<>0) and (pos(' Anisotropy ',str)<>0) then begin
end;   // while  pos(' End of Minotr',str)=0 do begin
end; // if pos(' Magnetic shielding (ppm):',str)<>0 then begin
end;  // if pos(' Magnetic properties (CSGT method)',str)<>0 then begin
/////////////////////////////////////////////////////////////////////////////////

if pos(' Diamagnetic susceptibility ten',str)<>0 then begin
SetLength(sus_giao,5);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это диамагнитная восприимчивость
sus_giao[0]:=str2;
ReadLn(f,str);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это парамагнитная восприимчивость
sus_giao[1]:=str2;
ReadLn(f,str);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это общая восприимчивость
sus_giao[2]:=str2;
ReadLn(f,str);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это изотропик (но в др. единицах) восприимчивость
sus_giao[3]:=str2;
ReadLn(f,str);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это изотропик (но в др. единицах) восприимчивость
sus_giao[4]:=str2;
end;


///////////Блок для чтения спин-спинового взаимодействия

if pos(' Fermi Contact (FC) contribution to K (Hz):',str)<>0 then begin
SetLength(spsp_FC_K,Round(nomer_atoma*(nomer_atoma+1)/2));   // сумма первых n членов арифметической прогресии
SetLength(spsp_FC_J,Round(nomer_atoma*(nomer_atoma+1)/2));
SetLength(spsp_SD_K,Round(nomer_atoma*(nomer_atoma+1)/2));
SetLength(spsp_SD_J,Round(nomer_atoma*(nomer_atoma+1)/2));
SetLength(spsp_PSO_K,Round(nomer_atoma*(nomer_atoma+1)/2));
SetLength(spsp_PSO_J,Round(nomer_atoma*(nomer_atoma+1)/2));
SetLength(spsp_DSO_K,Round(nomer_atoma*(nomer_atoma+1)/2));
SetLength(spsp_DSO_J,Round(nomer_atoma*(nomer_atoma+1)/2));
SetLength(spsp_Tot_K,Round(nomer_atoma*(nomer_atoma+1)/2));
SetLength(spsp_Tot_J,Round(nomer_atoma*(nomer_atoma+1)/2));
x40:='Fermi Contact (FC) contribution to K (Hz)';
222:
s:=0;
p:=0;
ReadLn(f,str);
ReadLn(f,str);
220: while (pos('.',str)<>0) and (pos(' End of Minotr',str)=0) do begin
if s=0 then begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));  // Это первое значение
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p]:=str3;
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p]:=str3;
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p]:=str3;
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p]:=str3;
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p]:=str3;
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p]:=str3;
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p]:=str3;
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p]:=str3;
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p]:=str3;
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p]:=str3;
s:=s+1;
ReadLn(f,str);
end;
if s=1 then begin
if (pos(' contribution ',str)<>0) or (pos(' coupling ',str)<>0)  or (pos(' End of Minotr ',str)<>0)  then goto 500;
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+2]:=str2;
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+2]:=str2;
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+2]:=str2;
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+2]:=str2;
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+2]:=str2;
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+2]:=str2;
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+2]:=str2;
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+2]:=str2;
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+2]:=str2;
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+2]:=str2;
s:=s+1;
ReadLn(f,str);
end;
if s=2 then begin
if (pos(' contribution ',str)<>0) or (pos(' coupling ',str)<>0)  or (pos(' End of Minotr ',str)<>0)  then goto 500;
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+3]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+4]:=Copy(str2,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+4]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+4]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+4]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+4]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+4]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+4]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+4]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+4]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+4]:=Copy(str2,1,i-1);
str3:=Copy(str2,i,length(str3));
for i:=0 to length(str3) do
if Copy(str3,i,1)<>' ' then Break;
str1:=Copy(str3,i,length(str3));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+5]:=str1;
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+5]:=str1;
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+5]:=str1;
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+5]:=str1;
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+5]:=str1;
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+5]:=str1;
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+5]:=str1;
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+5]:=str1;
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+5]:=str1;
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+5]:=str1;
s:=s+1;
ReadLn(f,str);
end;
if s=3 then begin
if (pos(' contribution ',str)<>0) or (pos(' coupling ',str)<>0)  or (pos(' End of Minotr ',str)<>0)  then goto 500;
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+6]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+7]:=Copy(str2,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+7]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+7]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+7]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+7]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+7]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+7]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+7]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+7]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+7]:=Copy(str2,1,i-1);
str3:=Copy(str2,i,length(str3));
for i:=0 to length(str3) do
if Copy(str3,i,1)<>' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+8]:=Copy(str1,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+8]:=Copy(str1,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+8]:=Copy(str1,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+8]:=Copy(str1,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+8]:=Copy(str1,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+8]:=Copy(str1,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+8]:=Copy(str1,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+8]:=Copy(str1,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+8]:=Copy(str1,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+8]:=Copy(str1,1,i-1);
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+9]:=str3;
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+9]:=str3;
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+9]:=str3;
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+9]:=str3;
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+9]:=str3;
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+9]:=str3;
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+9]:=str3;
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+9]:=str3;
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+9]:=str3;
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+9]:=str3;
s:=s+1;
p:=p+9;
ReadLn(f,str);
end;
if s>=4 then begin
if (pos(' contribution ',str)<>0) or (pos(' coupling ',str)<>0) or (pos(' End of Minotr ',str)<>0) then goto 500;
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+1]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+2]:=Copy(str2,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+2]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+2]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+2]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+2]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+2]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+2]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+2]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+2]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+2]:=Copy(str2,1,i-1);
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)<>' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+3]:=Copy(str1,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+3]:=Copy(str1,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+3]:=Copy(str1,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+3]:=Copy(str1,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+3]:=Copy(str1,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+3]:=Copy(str1,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+3]:=Copy(str1,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+3]:=Copy(str1,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+3]:=Copy(str1,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+3]:=Copy(str1,1,i-1);
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+4]:=Copy(str3,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+4]:=Copy(str3,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+4]:=Copy(str3,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+4]:=Copy(str3,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+4]:=Copy(str3,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+4]:=Copy(str3,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+4]:=Copy(str3,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+4]:=Copy(str3,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+4]:=Copy(str3,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+4]:=Copy(str3,1,i-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K[p+5]:=Copy(str1,i,length(str1));
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J[p+5]:=Copy(str1,i,length(str1));
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K[p+5]:=Copy(str1,i,length(str1));
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J[p+5]:=Copy(str1,i,length(str1));
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K[p+5]:=Copy(str1,i,length(str1));
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J[p+5]:=Copy(str1,i,length(str1));
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K[p+5]:=Copy(str1,i,length(str1));
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J[p+5]:=Copy(str1,i,length(str1));
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K[p+5]:=Copy(str1,i,length(str1));
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J[p+5]:=Copy(str1,i,length(str1));
p:=p+5;
ReadLn(f,str);
end;
end;

500:
if pos(' End of Minotr',str)<>0 then goto 300;


if pos(' Fermi Contact (FC) contribution to J (Hz):',str)<>0 then begin
x40:='Fermi Contact (FC) contribution to J (Hz)';
goto 222;
end;
if pos(' Spin-dipolar (SD) contribution to K (Hz):',str)<>0 then begin
x40:='Spin-dipolar (SD) contribution to K (Hz)';
goto 222;
end;
if pos(' Spin-dipolar (SD) contribution to J (Hz):',str)<>0 then begin
x40:='Spin-dipolar (SD) contribution to J (Hz)';
goto 222;
end;
if pos(' Paramagnetic spin-orbit (PSO) contribution to K (Hz):',str)<>0 then begin
x40:='Paramagnetic spin-orbit (PSO) contribution to K (Hz)';
goto 222;
end;
if pos(' Paramagnetic spin-orbit (PSO) contribution to J (Hz):',str)<>0 then begin
x40:='Paramagnetic spin-orbit (PSO) contribution to J (Hz)';
goto 222;
end;
if pos(' Diamagnetic spin-orbit (DSO) contribution to K (Hz):',str)<>0 then begin
x40:='Diamagnetic spin-orbit (DSO) contribution to K (Hz)';
goto 222;
end;
if pos(' Diamagnetic spin-orbit (DSO) contribution to J (Hz):',str)<>0 then begin
x40:='Diamagnetic spin-orbit (DSO) contribution to J (Hz)';
goto 222;
end;
if pos(' Total nuclear spin-spin coupling K (Hz):',str)<>0 then begin
x40:='Total nuclear spin-spin coupling K (Hz)';
goto 222;
end;
if pos(' Total nuclear spin-spin coupling J (Hz):',str)<>0 then begin
x40:='Total nuclear spin-spin coupling J (Hz)';
goto 222;
end;

if (pos('(',str)=0) and (pos(':',str)=0) then  begin
ReadLn(f,str);
s:=0;
p:=p+1;
goto 220;
end;
end;

300:















if Pos('Normal termination of Gaussian',str)<>0 then z_end:=True;

end; // while not eof(f) do begin


CloseFile(f);

if (shield_giao=nil) and (shield_csgt=nil) and (shield_igaim=nil) and (shield_so=nil) then
begin
  showmessage('Файл '+ Form1.OpenDialog1.FileName+ ' не содержит данных химических сдвигах');
  goto 0;
end;


////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog1.FileName) do
if copy(Form1.OpenDialog1.FileName,i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog1.FileName,j+1,200);
////////////////////////////////////////////////////////////////////

ComboBox1.Items.Add(Form1.OpenDialog1.FileName);
ComboBox1.ItemIndex:=0;
ComboBox2.ItemIndex:=0;
Label3.Caption:='Наименование системы: '+task;
Label4.Caption:='Метод получения химсдвигов: '+Combobox2.Text;


///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************

if Combobox2.Text='GIAO' then begin
Setlength(shield_temp,length(shield_giao));
for i:=0 to length(shield_giao)-1 do
shield_temp[i]:=shield_giao[i];
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////
nlmax:=0;
if Combobox2.Text='GIAO' then begin

1:  // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_giao,length(degener_giao)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_giao)-1 do
if shield_temp[cut_temp[m]]=shield_giao[p] then  begin
degener_compos_giao[length(degener_giao),m]:=shield_giao[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
b:=p+1;
Break;
end;
/////////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 1;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////

if length(shield_temp)=1 then begin
SetLength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_giao,length(degener_compos_giao)+1,nlmax);
for p:=0 to length(shield_giao)-1 do
if shield_temp[0]=shield_giao[p] then  Break;
degener_compos_giao[length(degener_compos_giao)-1,0]:=shield_giao[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
shield_temp:=nil;
end;



//###############################################################################################
//###############################################################################################
//###############################################################################################

if Combobox2.Text='CSGT' then begin
Setlength(shield_temp,length(shield_csgt));
for i:=0 to length(shield_csgt)-1 do
shield_temp[i]:=shield_csgt[i];
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='CSGT' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

2:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_csgt,length(degener_csgt)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_csgt)-1 do
if shield_temp[cut_temp[m]]=shield_csgt[p] then  begin
degener_compos_csgt[length(degener_csgt),m]:=shield_csgt[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 2;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_csgt,length(degener_compos_csgt)+1,nlmax);
for p:=0 to length(shield_csgt)-1 do
if shield_temp[0]=shield_csgt[p] then  Break;
degener_compos_csgt[length(degener_compos_csgt)-1,0]:=shield_csgt[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################



if Combobox2.Text='IGAIM' then begin
Setlength(shield_temp,length(shield_igaim));
for i:=0 to length(shield_igaim)-1 do
shield_temp[i]:=shield_igaim[i];
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='IGAIM' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

3:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_igaim,length(degener_igaim)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_igaim)-1 do
if shield_temp[cut_temp[m]]=shield_igaim[p] then  begin
degener_compos_igaim[length(degener_igaim),m]:=shield_igaim[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 3;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////

if length(shield_temp)=1 then begin
SetLength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_igaim,length(degener_compos_igaim)+1,nlmax);
for p:=0 to length(shield_igaim)-1 do
if shield_temp[0]=shield_igaim[p] then  Break;
degener_compos_igaim[length(degener_compos_igaim)-1,0]:=shield_igaim[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################




if Combobox2.Text='Single Origin' then begin
Setlength(shield_temp,length(shield_so));
for i:=0 to length(shield_so)-1 do
shield_temp[i]:=shield_so[i];
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='Single Origin' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

4:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_so,length(degener_so)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_so)-1 do
if shield_temp[cut_temp[m]]=shield_so[p] then  begin
degener_compos_so[length(degener_so),m]:=shield_so[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 4;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_so,length(degener_compos_so)+1,nlmax);
for p:=0 to length(shield_so)-1 do
if shield_temp[0]=shield_so[p] then  Break;
degener_compos_so[length(degener_compos_so)-1,0]:=shield_so[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_giao<>nil then begin
for p:=0 to length(degener_compos_giao)-1 do
if degener_compos_giao[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_giao[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_giao[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_giao[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_giao[p,j+1]='' then goto 25;
 if StrToFloat(Copy(degener_compos_giao[p,j],1,pos('=',degener_compos_giao[p,j])-1)) >  StrToFloat(Copy(degener_compos_giao[p,j+1],1,pos('=',degener_compos_giao[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_giao[p,j+1];                                   //  ######   Sorting of array   degener_compos_giao[i]
 degener_compos_giao[p,j+1] := degener_compos_giao[p,j];              //  ########################################
 degener_compos_giao[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
25:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_csgt<>nil then begin
for p:=0 to length(degener_compos_csgt)-1 do
if degener_compos_csgt[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_csgt[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_csgt[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_csgt[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_csgt[p,j+1]='' then goto 26;
 if StrToFloat(Copy(degener_compos_csgt[p,j],1,pos('=',degener_compos_csgt[p,j])-1)) >  StrToFloat(Copy(degener_compos_csgt[p,j+1],1,pos('=',degener_compos_csgt[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_csgt[p,j+1];                                   //  ######   Sorting of array   degener_compos_csgt[i]
 degener_compos_csgt[p,j+1] := degener_compos_csgt[p,j];              //  ########################################
 degener_compos_csgt[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
26:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_igaim<>nil then begin
for p:=0 to length(degener_compos_igaim)-1 do
if degener_compos_igaim[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_igaim[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_igaim[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_igaim[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_igaim[p,j+1]='' then goto 27;
 if StrToFloat(Copy(degener_compos_igaim[p,j],1,pos('=',degener_compos_igaim[p,j])-1)) >  StrToFloat(Copy(degener_compos_igaim[p,j+1],1,pos('=',degener_compos_igaim[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_igaim[p,j+1];                                   //  ######   Sorting of array   degener_compos_igaim[i]
 degener_compos_igaim[p,j+1] := degener_compos_igaim[p,j];             //  ########################################
 degener_compos_igaim[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
27:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_so<>nil then begin
for p:=0 to length(degener_compos_so)-1 do
if degener_compos_so[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_so[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_so[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_so[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_so[p,j+1]='' then goto 28;
 if StrToFloat(Copy(degener_compos_so[p,j],1,pos('=',degener_compos_so[p,j])-1)) >  StrToFloat(Copy(degener_compos_so[p,j+1],1,pos('=',degener_compos_so[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_so[p,j+1];                                   //  ######   Sorting of array   degener_compos_so[i]
 degener_compos_so[p,j+1] := degener_compos_so[p,j];                //  ########################################
 degener_compos_so[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
28:
j:=0;
end;
end;






if Combobox2.Text='GIAO' then
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_giao))+' / ' +inttostr(length(degener_giao));
if Combobox2.Text='CSGT' then
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_csgt))+' / ' +inttostr(length(degener_csgt));
if Combobox2.Text='IGAIM' then
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_igaim))+' / ' +inttostr(length(degener_igaim));
if Combobox2.Text='Single Origin' then
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_so))+' / ' +inttostr(length(degener_so));

if z_end=true then  begin
Label7.Font.Color:=clblack;
Label7.Caption:='Результат: Normal termination' ;
end
else  begin
Label7.Font.Color:=clred;
Label7.Caption:='Результат: WARNING! Abnormal termination!'
end;

if Combobox2.Text='CSGT' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_csgt;
if Combobox2.Text='IGAIM' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_igaim;
if Combobox2.Text='Single Origin' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_so;
if Combobox2.Text='GIAO' then Label6.Caption:='Магнитная восприимчивость, I / A: *** / ***';


// Заполняем ListView

if Combobox2.Text='GIAO' then begin
for i:=0 to length(shield_giao)-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(shield_giao[i]);
itm.SubItems.Append(anis_giao[i]);
end;
end;

if Combobox2.Text='CSGT' then begin
for i:=0 to length(shield_csgt)-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(shield_csgt[i]);
itm.SubItems.Append(anis_csgt[i]);
end;
end;

if Combobox2.Text='IGAIM' then begin
for i:=0 to length(shield_igaim)-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(shield_igaim[i]);
itm.SubItems.Append(anis_igaim[i]);
end;
end;

if Combobox2.Text='Single Origin' then begin
for i:=0 to length(shield_so)-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(shield_so[i]);
itm.SubItems.Append(anis_so[i]);
end;
end;






end  //  if dial=true then begin
else begin  ///////МНОЖЕСТВО ФАЙЛОВ ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,!!!!
z_mlt:=nil;
nmr_methods:=nil;
SetLength(nmr_methods,nf,4);
Setlength(z_mlt,nf);
susc_csgt_mult:=nil;
susc_igaim_mult:=nil;
susc_so_mult:=nil;

sus_giao_mult:=nil;
spsp_FC_K_mult:=nil;
spsp_FC_J_mult:=nil;
spsp_SD_K_mult:=nil;
spsp_SD_J_mult:=nil;
spsp_PSO_K_mult:=nil;
spsp_PSO_J_mult:=nil;
spsp_DSO_K_mult:=nil;
spsp_DSO_J_mult:=nil;
spsp_Tot_k_mult:=nil;
spsp_Tot_J_mult:=nil;

SetLength(susc_csgt_mult,nf);
SetLength(susc_igaim_mult,nf);
SetLength(susc_so_mult,nf);
for j:=0 to nf-1 do  begin

AssignFile(f,Form1.OpenDialog2.Files[j]);
Reset(f);

k:=0;
x40:='';
d:=0;
if NAmax<nomer_atoma_mult[j] then NAmax:=nomer_atoma_mult[j];
while not eof(f) do begin
ReadLn(f,str);

///////////////////////////// G I A O ///////////////////////////////////////////

if pos(' SCF GIAO Magnetic shielding tensor (ppm):',str)<>0 then begin
SetLength(shield_giao_mult,nf,NAmax);
SetLength(anis_giao_mult,nf,NAmax);
SetLength(tenzor_giao_mult,nf,NAmax);
nmr_methods[j,d]:='GIAO';
d:=d+1;
ReadLn(f,str);
while  (pos(' End of Minotr',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0) do begin
if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это сам химсдвиг
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропия
shield_giao_mult[j,k]:=str3;
anis_giao_mult[j,k]:=str2;
ReadLn(f,str);
tenzor_giao_mult[j,k]:=TStringList.Create;
while  (pos(' Isotropic ',str)=0) and (pos(' Anisotropy ',str)=0) and (pos(' End of Minotr ',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0) do begin
tenzor_giao_mult[j,k].Add(str);
ReadLn(f,str);
end;   //  while  (pos(' Isotropic ',srr)=0) and (pos(' Anisotropy ',str)=0) do begin
k:=k+1;
end;   // if (pos(' Isotropic ',srr)<>0) and (pos(' Anisotropy ',str)<>0) then begin
end;   // while  pos(' End of Minotr',str)=0 do begin
end; // if pos(' SCF GIAO Magnetic shielding tensor (ppm):',str)<>0 then begin

///////////////////////////////////////////////////////////////////////////////////////


//////////////////////////// C S G T //////////////////////////////////////////////
if pos(' Magnetic properties (CSGT method)',str)<>0 then begin
while (pos(' Isotropic ',str)=0) and (pos(' Anisotropy',str)=0) do
ReadLn(f,str);

if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это изотропная магнитная восприимчивость
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропная магнитная восприимчивость

susc_csgt_mult[j]:=str3+' / ' + str2;
end;

while pos(' Magnetic shielding (ppm):',str)=0 do
ReadLn(f,str);

if pos(' Magnetic shielding (ppm):',str)<>0 then begin
SetLength(shield_csgt_mult,nf,NAmax);
SetLength(anis_csgt_mult,nf,NAmax);
SetLength(tenzor_csgt_mult,nf,NAmax);
nmr_methods[j,d]:='CSGT';
d:=d+1;
ReadLn(f,str);
k:=0;
while  (pos(' Current density tensor (au):',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0) do begin
if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это сам химсдвиг
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропия
shield_csgt_mult[j,k]:=str3;
anis_csgt_mult[j,k]:=str2;
ReadLn(f,str);
tenzor_csgt_mult[j,k]:=TStringList.Create;
while  (pos(' Isotropic ',str)=0) and (pos(' Anisotropy ',str)=0) and (pos(' Current density tensor (au):',str)=0) and (Pos(' Calculating ',str)=0) do begin
tenzor_csgt_mult[j,k].Add(str);
ReadLn(f,str);
end;   //  while  (pos(' Isotropic ',srr)=0) and (pos(' Anisotropy ',str)=0) do begin
k:=k+1;
end;   // if (pos(' Isotropic ',srr)<>0) and (pos(' Anisotropy ',str)<>0) then begin
end;   // while  pos(' End of Minotr',str)=0 do begin
end; // if pos(' Magnetic shielding (ppm):',str)<>0 then begin
end;  // if pos(' Magnetic properties (CSGT method)',str)<>0 then begin
/////////////////////////////////////////////////////////////////////////////////


//////////////////////////// I G A I M //////////////////////////////////////////////
if pos(' Magnetic properties (IGAIM method)',str)<>0 then begin
while (pos(' Isotropic ',str)=0) and (pos(' Anisotropy',str)=0) do
ReadLn(f,str);

if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это изотропная магнитная восприимчивость
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропная магнитная восприимчивость
susc_igaim_mult[j]:=str3+' / ' + str2;
end;

while pos(' Magnetic shielding (ppm):',str)=0 do
ReadLn(f,str);

if pos(' Magnetic shielding (ppm):',str)<>0 then begin
SetLength(shield_igaim_mult,nf,NAmax);
SetLength(anis_igaim_mult,nf,NAmax);
SetLength(tenzor_igaim_mult,nf,NAmax);
nmr_methods[j,d]:='IGAIM';
d:=d+1;
ReadLn(f,str);
k:=0;
while (pos(' Current density tensor (au):',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0)  do begin
if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это сам химсдвиг
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропия
shield_igaim_mult[j,k]:=str3;
anis_igaim_mult[j,k]:=str2;
ReadLn(f,str);
tenzor_igaim_mult[j,k]:=TStringList.Create;
while  (pos(' Isotropic ',str)=0) and (pos(' Anisotropy ',str)=0) and (pos(' Current density tensor (au):',str)=0) and (Pos(' Calculating ',str)=0) do begin
tenzor_igaim_mult[j,k].Add(str);
ReadLn(f,str);
end;   //  while  (pos(' Isotropic ',srr)=0) and (pos(' Anisotropy ',str)=0) do begin
k:=k+1;
end;   // if (pos(' Isotropic ',srr)<>0) and (pos(' Anisotropy ',str)<>0) then begin
end;   // while  pos(' End of Minotr',str)=0 do begin
end; // if pos(' Magnetic shielding (ppm):',str)<>0 then begin
end;  // if pos(' Magnetic properties (CSGT method)',str)<>0 then begin
/////////////////////////////////////////////////////////////////////////////////


//////////////////////////// SINGLE ORIGIN //////////////////////////////////////////////
if pos(' Magnetic properties (single gauge origin)',str)<>0 then begin
while (pos(' Isotropic ',str)=0) and (pos(' Anisotropy',str)=0) do
ReadLn(f,str);

if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это изотропная магнитная восприимчивость
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропная магнитная восприимчивость
susc_so_mult[j]:=str3+' / ' + str2;
end;

while pos(' Magnetic shielding (ppm):',str)=0 do
ReadLn(f,str);

if pos(' Magnetic shielding (ppm):',str)<>0 then begin
SetLength(shield_so_mult,nf,NAmax);
SetLength(anis_so_mult,nf,NAmax);
SetLength(tenzor_so_mult,nf,NAmax);
nmr_methods[j,d]:='Single Origin';
d:=d+1;
ReadLn(f,str);
k:=0;
while (pos(' Current density tensor (au):',str)=0) and (pos(' There are ',str)=0) and (Pos(' Calculating ',str)=0) do begin
if (pos(' Isotropic ',str)<>0) and (pos(' Anisotropy ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);   // Это сам химсдвиг
str1:=Copy(str,pos('Anisotropy',str),length(str));
str2:=Copy(str1,pos('=',str1)+1,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str2:=Copy(str2,i,length(str2));   // Это анизотропия
shield_so_mult[j,k]:=str3;
anis_so_mult[j,k]:=str2;
ReadLn(f,str);
tenzor_so_mult[j,k]:=TStringList.Create;
while  (pos(' Isotropic ',str)=0) and (pos(' Anisotropy ',str)=0) and (pos(' Current density tensor (au):',str)=0) and (Pos(' Calculating ',str)=0) do begin
tenzor_so_mult[j,k].Add(str);
ReadLn(f,str);
end;   //  while  (pos(' Isotropic ',srr)=0) and (pos(' Anisotropy ',str)=0) do begin
k:=k+1;
end;   // if (pos(' Isotropic ',srr)<>0) and (pos(' Anisotropy ',str)<>0) then begin
end;   // while  pos(' End of Minotr',str)=0 do begin
end; // if pos(' Magnetic shielding (ppm):',str)<>0 then begin
end;  // if pos(' Magnetic properties (CSGT method)',str)<>0 then begin
/////////////////////////////////////////////////////////////////////////////////



if pos(' Diamagnetic susceptibility ten',str)<>0 then begin
SetLength(sus_giao_mult,j+1,5);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это диамагнитная восприимчивость
sus_giao_mult[j,0]:=str2;
ReadLn(f,str);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это парамагнитная восприимчивость
sus_giao_mult[j,1]:=str2;
ReadLn(f,str);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это общая восприимчивость
sus_giao_mult[j,2]:=str2;
ReadLn(f,str);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это изотропик (но в др. единицах) восприимчивость
sus_giao_mult[j,3]:=str2;
ReadLn(f,str);
while pos(' Isotropic',str)=0 do
ReadLn(f,str);
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));   // Это изотропик (но в др. единицах) восприимчивость
sus_giao_mult[j,4]:=str2;
end;




///////////Блок для чтения спин-спинового взаимодействия

if pos(' Fermi Contact (FC) contribution to K (Hz):',str)<>0 then begin
SetLength(spsp_FC_K_mult,j+1,Round(NAmax*(NAmax+1)/2));   // сумма первых n членов арифметической прогресии
SetLength(spsp_FC_J_mult,j+1,Round(NAmax*(NAmax+1)/2));
SetLength(spsp_SD_K_mult,j+1,Round(NAmax*(NAmax+1)/2));
SetLength(spsp_SD_J_mult,j+1,Round(NAmax*(NAmax+1)/2));
SetLength(spsp_PSO_K_mult,j+1,Round(NAmax*(NAmax+1)/2));
SetLength(spsp_PSO_J_mult,j+1,Round(NAmax*(NAmax+1)/2));
SetLength(spsp_DSO_K_mult,j+1,Round(NAmax*(NAmax+1)/2));
SetLength(spsp_DSO_J_mult,j+1,Round(NAmax*(NAmax+1)/2));
SetLength(spsp_Tot_K_mult,j+1,Round(NAmax*(NAmax+1)/2));
SetLength(spsp_Tot_J_mult,j+1,Round(NAmax*(NAmax+1)/2));
x40:='Fermi Contact (FC) contribution to K (Hz)';
2220:
s:=0;
p:=0;
ReadLn(f,str);
ReadLn(f,str);
2200: while (pos('.',str)<>0) and (pos(' End of Minotr',str)=0) do begin
if s=0 then begin
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));  // Это первое значение
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p]:=str3;
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p]:=str3;
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p]:=str3;
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p]:=str3;
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p]:=str3;
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p]:=str3;
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p]:=str3;
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p]:=str3;
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p]:=str3;
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p]:=str3;
s:=s+1;
ReadLn(f,str);
end;
if s=1 then begin
if (pos(' contribution ',str)<>0) or (pos(' coupling ',str)<>0)  or (pos(' End of Minotr ',str)<>0)  then goto 5000;
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+2]:=str2;
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+2]:=str2;
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+2]:=str2;
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+2]:=str2;
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+2]:=str2;
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+2]:=str2;
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+2]:=str2;
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+2]:=str2;
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+2]:=str2;
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+2]:=str2;
s:=s+1;
ReadLn(f,str);
end;
if s=2 then begin
if (pos(' contribution ',str)<>0) or (pos(' coupling ',str)<>0)  or (pos(' End of Minotr ',str)<>0)  then goto 5000;
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+3]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+4]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+4]:=Copy(str2,1,i-1);
str3:=Copy(str2,i,length(str3));
for i:=0 to length(str3) do
if Copy(str3,i,1)<>' ' then Break;
str1:=Copy(str3,i,length(str3));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+5]:=str1;
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+5]:=str1;
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+5]:=str1;
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+5]:=str1;
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+5]:=str1;
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+5]:=str1;
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+5]:=str1;
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+5]:=str1;
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+5]:=str1;
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+5]:=str1;
s:=s+1;
ReadLn(f,str);
end;
if s=3 then begin
if (pos(' contribution ',str)<>0) or (pos(' coupling ',str)<>0)  or (pos(' End of Minotr ',str)<>0)  then goto 5000;
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+6]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+7]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+7]:=Copy(str2,1,i-1);
str3:=Copy(str2,i,length(str3));
for i:=0 to length(str3) do
if Copy(str3,i,1)<>' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+8]:=Copy(str1,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+8]:=Copy(str1,1,i-1);
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+9]:=str3;
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+9]:=str3;
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+9]:=str3;
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+9]:=str3;
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+9]:=str3;
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+9]:=str3;
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+9]:=str3;
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+9]:=str3;
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+9]:=str3;
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+9]:=str3;
s:=s+1;
p:=p+9;
ReadLn(f,str);
end;
if s>=4 then begin
if (pos(' contribution ',str)<>0) or (pos(' coupling ',str)<>0) or (pos(' End of Minotr ',str)<>0) then goto 5000;
for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+1]:=Copy(str3,1,pos(' ',str3)-1);
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+2]:=Copy(str2,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+2]:=Copy(str2,1,i-1);
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)<>' ' then Break;
str1:=Copy(str3,i,length(str3));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+3]:=Copy(str1,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+3]:=Copy(str1,1,i-1);
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)<>' ' then Break;
str3:=Copy(str2,i,length(str2));
for i:=0 to length(str3) do
if Copy(str3,i,1)=' ' then Break;
str1:=Copy(str3,i,length(str3));
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+4]:=Copy(str3,1,i-1);
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+4]:=Copy(str3,1,i-1);
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
if x40='Fermi Contact (FC) contribution to K (Hz)' then spsp_FC_K_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Fermi Contact (FC) contribution to J (Hz)' then spsp_FC_J_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Spin-dipolar (SD) contribution to K (Hz)' then spsp_SD_K_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Spin-dipolar (SD) contribution to J (Hz)' then spsp_SD_J_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Paramagnetic spin-orbit (PSO) contribution to K (Hz)' then spsp_PSO_K_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Paramagnetic spin-orbit (PSO) contribution to J (Hz)' then spsp_PSO_J_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Diamagnetic spin-orbit (DSO) contribution to K (Hz)' then spsp_DSO_K_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Diamagnetic spin-orbit (DSO) contribution to J (Hz)' then spsp_DSO_J_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Total nuclear spin-spin coupling K (Hz)' then spsp_Tot_K_mult[j,p+5]:=Copy(str1,i,length(str1));
if x40='Total nuclear spin-spin coupling J (Hz)' then spsp_Tot_J_mult[j,p+5]:=Copy(str1,i,length(str1));
p:=p+5;
ReadLn(f,str);
end;
end;

5000:
if pos(' End of Minotr',str)<>0 then goto 3000;


if pos(' Fermi Contact (FC) contribution to J (Hz):',str)<>0 then begin
x40:='Fermi Contact (FC) contribution to J (Hz)';
goto 2220;
end;
if pos(' Spin-dipolar (SD) contribution to K (Hz):',str)<>0 then begin
x40:='Spin-dipolar (SD) contribution to K (Hz)';
goto 2220;
end;
if pos(' Spin-dipolar (SD) contribution to J (Hz):',str)<>0 then begin
x40:='Spin-dipolar (SD) contribution to J (Hz)';
goto 2220;
end;
if pos(' Paramagnetic spin-orbit (PSO) contribution to K (Hz):',str)<>0 then begin
x40:='Paramagnetic spin-orbit (PSO) contribution to K (Hz)';
goto 2220;
end;
if pos(' Paramagnetic spin-orbit (PSO) contribution to J (Hz):',str)<>0 then begin
x40:='Paramagnetic spin-orbit (PSO) contribution to J (Hz)';
goto 2220;
end;
if pos(' Diamagnetic spin-orbit (DSO) contribution to K (Hz):',str)<>0 then begin
x40:='Diamagnetic spin-orbit (DSO) contribution to K (Hz)';
goto 2220;
end;
if pos(' Diamagnetic spin-orbit (DSO) contribution to J (Hz):',str)<>0 then begin
x40:='Diamagnetic spin-orbit (DSO) contribution to J (Hz)';
goto 2220;
end;
if pos(' Total nuclear spin-spin coupling K (Hz):',str)<>0 then begin
x40:='Total nuclear spin-spin coupling K (Hz)';
goto 2220;
end;
if pos(' Total nuclear spin-spin coupling J (Hz):',str)<>0 then begin
x40:='Total nuclear spin-spin coupling J (Hz)';
goto 2220;
end;

if (pos('(',str)=0) and (pos(':',str)=0) then  begin
ReadLn(f,str);
s:=0;
p:=p+1;
goto 2200;
end;
end;

3000:




if Pos('Normal termination of Gaussian',str)<>0 then z_mlt[j]:=True;

end; // while not eof(f) do begin


CloseFile(f);

end;



i:=0;
j:=0;
if (shield_giao_mult<>nil) or (shield_csgt_mult<>nil) or (shield_igaim_mult<>nil) or (shield_so_mult<>nil) then begin
if i<length(shield_giao_mult) then i:=length(shield_giao_mult);
if i<length(shield_csgt_mult) then i:=length(shield_csgt_mult);
if i<length(shield_igaim_mult) then i:=length(shield_igaim_mult);
if i<length(shield_so_mult) then i:=length(shield_so_mult);
SetLength(shield_giao_mult,i);
SetLength(shield_csgt_mult,i);
SetLength(shield_igaim_mult,i);
SetLength(shield_so_mult,i);
if j<length(shield_giao_mult[0]) then j:=length(shield_giao_mult[0]);
if j<length(shield_csgt_mult[0]) then j:=length(shield_csgt_mult[0]);
if j<length(shield_igaim_mult[0]) then j:=length(shield_igaim_mult[0]);
if j<length(shield_so_mult[0]) then j:=length(shield_so_mult[0]);
SetLength(shield_giao_mult,i,j);
SetLength(shield_csgt_mult,i,j);
SetLength(shield_igaim_mult,i,j);
SetLength(shield_so_mult,i,j);
end;



if spsp_FC_K_mult<>nil then begin
if spsp_FC_K_mult[0]<>nil then begin
Setlength(spsp_FC_K_mult,nf,length(spsp_FC_K_mult[0]));
end;
end;


SetLength(sus_giao_mult,nf);




//////////////Чтение всех файлов закончилось надо BASKET
basket:=nil;

i:=0;
for j:=0 to nf-1 do  begin
if (shield_giao_mult<>nil) or (shield_csgt_mult<>nil) or (shield_igaim_mult<>nil) or (shield_so_mult<>nil) then begin
if (shield_giao_mult[j]<>nil) or (shield_csgt_mult[j]<>nil) or (shield_igaim_mult[j]<>nil) or (shield_so_mult[j]<>nil) then begin
if (shield_giao_mult[j,0]<>'') or (shield_csgt_mult[j,0]<>'') or (shield_igaim_mult[j,0]<>'') or (shield_so_mult[j,0]<>'') then begin
SetLength(basket,i+1);
basket[i]:=j;
Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
i:=i+1;
end;
if (shield_giao_mult[j,0]='') and (shield_csgt_mult[j,0]='') and (shield_igaim_mult[j,0]='') and (shield_so_mult[j,0]='') then ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных о химсдвигах!');
end
else  ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных о химсдвигах!');
end
else  begin
ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных о химсдвигах!');
goto 0;
end;

end;

ComboBox1.ItemIndex:=0;


////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[0]]) do
if copy(Form1.OpenDialog2.Files[basket[0]],i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog2.Files[basket[0]],j+1,200);
////////////////////////////////////////////////////////////////////

//ComboBox1.Items.Add(Form1.OpenDialog2.Files[basket[0]]);
ComboBox1.ItemIndex:=0;
ComboBox2.ItemIndex:=0;
Label3.Caption:='Наименование системы: '+task;

for i:=0 to length(nmr_methods[basket[0]])-1 do
if nmr_methods[basket[0],i]<>'' then Combobox2.Items.Add(nmr_methods[basket[0],i]);
Combobox2.ItemIndex:=0;

Label4.Caption:='Метод получения химсдвигов: '+Combobox2.Text;


///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************



if Combobox2.Text='GIAO' then begin
for i:=0 to length(shield_giao_mult[basket[0]])-1 do begin
if shield_giao_mult[basket[0],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_giao_mult[basket[0],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////
nlmax:=0;
if Combobox2.Text='GIAO' then begin

10:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin

if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_giao,length(degener_giao)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_giao_mult[basket[0]])-1 do
if shield_temp[cut_temp[m]]=shield_giao_mult[basket[0],p] then  begin
degener_compos_giao[length(degener_giao),m]:=shield_giao_mult[basket[0],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[0],1,p+1];
b:=p+1;
Break;
end;
/////////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 10;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_giao,length(degener_compos_giao)+1,nlmax);
for p:=0 to length(shield_giao_mult[basket[0]])-1 do
if shield_temp[0]=shield_giao_mult[basket[0],p] then  Break;
degener_compos_giao[length(degener_compos_giao)-1,0]:=shield_giao_mult[basket[0],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[0],1,p+1];
shield_temp:=nil;
end;




//###############################################################################################
//###############################################################################################
//###############################################################################################

if Combobox2.Text='CSGT' then begin
for i:=0 to length(shield_csgt_mult[basket[0]])-1 do begin
if shield_csgt_mult[basket[0],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_csgt_mult[basket[0],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='CSGT' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

20:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_csgt,length(degener_csgt)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_csgt)-1 do
if shield_temp[cut_temp[m]]=shield_giao[p] then  begin
degener_compos_csgt[length(degener_csgt),m]:=shield_csgt_mult[basket[0],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[0],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 20;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_csgt,length(degener_compos_csgt)+1,nlmax);
for p:=0 to length(shield_csgt_mult[basket[0]])-1 do
if shield_temp[0]=shield_csgt_mult[basket[0],p] then  Break;
degener_compos_csgt[length(degener_compos_csgt)-1,0]:=shield_csgt_mult[basket[0],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[0],1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################



if Combobox2.Text='IGAIM' then begin
for i:=0 to length(shield_igaim_mult[basket[0]])-1 do begin
if shield_igaim_mult[basket[0],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_igaim_mult[basket[0],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='IGAIM' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

30:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_igaim,length(degener_igaim)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_igaim_mult[basket[0]])-1 do
if shield_temp[cut_temp[m]]=shield_igaim_mult[basket[0],p] then  begin
degener_compos_igaim[length(degener_igaim),m]:=shield_igaim_mult[basket[0],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[0],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 30;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_igaim,length(degener_compos_igaim)+1,nlmax);
for p:=0 to length(shield_igaim_mult[basket[0]])-1 do
if shield_temp[0]=shield_igaim_mult[basket[0],p] then  Break;
degener_compos_igaim[length(degener_compos_igaim)-1,0]:=shield_igaim_mult[basket[0],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[0],1,p+1];
shield_temp:=nil;
end;



//###############################################################################################
//###############################################################################################
//###############################################################################################




if Combobox2.Text='Single Origin' then begin
for i:=0 to length(shield_so_mult[basket[0]])-1 do begin
if shield_so_mult[basket[0],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_so_mult[basket[0],i];
end;
end;
end;


/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='Single Origin' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

40:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_so,length(degener_so)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_so_mult[basket[0]])-1 do
if shield_temp[cut_temp[m]]=shield_so_mult[basket[0],p] then  begin
degener_compos_so[length(degener_so),m]:=shield_so_mult[basket[0],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[0],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 40;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_so,length(degener_compos_so)+1,nlmax);
for p:=0 to length(shield_so_mult[basket[0]])-1 do
if shield_temp[0]=shield_so_mult[basket[0],p] then  Break;
degener_compos_so[length(degener_compos_so)-1,0]:=shield_so_mult[basket[0],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[0],1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_giao<>nil then begin
for p:=0 to length(degener_compos_giao)-1 do
if degener_compos_giao[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_giao[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_giao[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_giao[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_giao[p,j+1]='' then goto 250;
 if StrToFloat(Copy(degener_compos_giao[p,j],1,pos('=',degener_compos_giao[p,j])-1)) >  StrToFloat(Copy(degener_compos_giao[p,j+1],1,pos('=',degener_compos_giao[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_giao[p,j+1];                                   //  ######   Sorting of array   degener_compos_giao[i]
 degener_compos_giao[p,j+1] := degener_compos_giao[p,j];              //  ########################################
 degener_compos_giao[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
250:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_csgt<>nil then begin
for p:=0 to length(degener_compos_csgt)-1 do
if degener_compos_csgt[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_csgt[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_csgt[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_csgt[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_csgt[p,j+1]='' then goto 260;
 if StrToFloat(Copy(degener_compos_csgt[p,j],1,pos('=',degener_compos_csgt[p,j])-1)) >  StrToFloat(Copy(degener_compos_csgt[p,j+1],1,pos('=',degener_compos_csgt[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_csgt[p,j+1];                                   //  ######   Sorting of array   degener_compos_csgt[i]
 degener_compos_csgt[p,j+1] := degener_compos_csgt[p,j];              //  ########################################
 degener_compos_csgt[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
260:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_igaim<>nil then begin
for p:=0 to length(degener_compos_igaim)-1 do
if degener_compos_igaim[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_igaim[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_igaim[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_igaim[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_igaim[p,j+1]='' then goto 270;
 if StrToFloat(Copy(degener_compos_igaim[p,j],1,pos('=',degener_compos_igaim[p,j])-1)) >  StrToFloat(Copy(degener_compos_igaim[p,j+1],1,pos('=',degener_compos_igaim[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_igaim[p,j+1];                                   //  ######   Sorting of array   degener_compos_igaim[i]
 degener_compos_igaim[p,j+1] := degener_compos_igaim[p,j];             //  ########################################
 degener_compos_igaim[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
270:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_so<>nil then begin
for p:=0 to length(degener_compos_so)-1 do
if degener_compos_so[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_so[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_so[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_so[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_so[p,j+1]='' then goto 280;
 if StrToFloat(Copy(degener_compos_so[p,j],1,pos('=',degener_compos_so[p,j])-1)) >  StrToFloat(Copy(degener_compos_so[p,j+1],1,pos('=',degener_compos_so[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_so[p,j+1];                                   //  ######   Sorting of array   degener_compos_so[i]
 degener_compos_so[p,j+1] := degener_compos_so[p,j];                //  ########################################
 degener_compos_so[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
280:
j:=0;
end;
end;







if Combobox2.Text='GIAO' then  begin
for i:=0 to length(shield_giao_mult[basket[0]])-1 do
if shield_giao_mult[basket[0],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_giao));
end;

if Combobox2.Text='CSGT' then  begin
for i:=0 to length(shield_csgt_mult[basket[0]])-1 do
if shield_csgt_mult[basket[0],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_csgt));
end;


if Combobox2.Text='IGAIM' then  begin
for i:=0 to length(shield_igaim_mult[basket[0]])-1 do
if shield_igaim_mult[basket[0],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_igaim));
end;


if Combobox2.Text='Single Origin' then  begin
for i:=0 to length(shield_so_mult[basket[0]])-1 do
if shield_so_mult[basket[0],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_so_mult[basket[0]]))+' / ' +inttostr(length(degener_so));
end;


if z_mlt[basket[0]]=true then  begin
Label7.Font.Color:=clblack;
Label7.Caption:='Результат: Normal termination' ;
end
else  begin
Label7.Font.Color:=clred;
Label7.Caption:='Результат: WARNING! Abnormal termination!'
end;

if Combobox2.Text='CSGT' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_csgt_mult[basket[0]];
if Combobox2.Text='IGAIM' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_igaim_mult[basket[0]];
if Combobox2.Text='Single Origin' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_so_mult[basket[0]];
if Combobox2.Text='GIAO' then Label6.Caption:='Магнитная восприимчивость, I / A: *** / ***';


// Заполняем ListView

if Combobox2.Text='GIAO' then begin
for i:=0 to nomer_atoma_mult[basket[0]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(shield_giao_mult[basket[0],i]);
itm.SubItems.Append(anis_giao_mult[basket[0],i]);
end;
end;

if Combobox2.Text='CSGT' then begin
for i:=0 to nomer_atoma_mult[basket[0]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(shield_csgt_mult[basket[0],i]);
itm.SubItems.Append(anis_csgt_mult[basket[0],i]);
end;
end;

if Combobox2.Text='IGAIM' then begin
for i:=0 to nomer_atoma_mult[basket[0]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(shield_igaim_mult[basket[0],i]);
itm.SubItems.Append(anis_igaim_mult[basket[0],i]);
end;
end;

if Combobox2.Text='Single Origin' then begin
for i:=0 to nomer_atoma_mult[basket[0]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[0],1,i+1]);
itm.SubItems.Append(shield_so_mult[basket[0],i]);
itm.SubItems.Append(anis_so_mult[basket[0],i]);
end;
end;


end;
0:
end;









procedure TForm58.ListView1DblClick(Sender: TObject);
var i: integer;
s: widestring;
begin
if ListView1<>nil then begin
if ListView1.Selected<>nil then begin
if ListView1.Items[ListView1.ItemIndex].Selected then begin
Form59.Memo1.Clear;
form59.Show;
if dial=true then begin

if Combobox2.Text='GIAO' then begin
For i:=0 to tenzor_giao[ListView1.ItemIndex].Count-1 do
Form59.Memo1.Lines.Add(tenzor_giao[ListView1.ItemIndex][i]);
end;

if Combobox2.Text='CSGT' then begin
For i:=0 to tenzor_csgt[ListView1.ItemIndex].Count-1 do
Form59.Memo1.Lines.Add(tenzor_csgt[ListView1.ItemIndex][i]);
end;

if Combobox2.Text='IGAIM' then begin
For i:=0 to tenzor_igaim[ListView1.ItemIndex].Count-1 do
Form59.Memo1.Lines.Add(tenzor_igaim[ListView1.ItemIndex][i]);
end;

if Combobox2.Text='Single Origin' then begin
For i:=0 to tenzor_so[ListView1.ItemIndex].Count-1 do
Form59.Memo1.Lines.Add(tenzor_so[ListView1.ItemIndex][i]);
end;

end
else begin  ///////МНОЖЕСТВО ФАЙЛОВ ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,!!!!


if Combobox2.Text='GIAO' then begin
For i:=0 to tenzor_giao_mult[basket[Combobox1.ItemIndex],ListView1.ItemIndex].Count-1 do
Form59.Memo1.Lines.Add(tenzor_giao_mult[basket[Combobox1.ItemIndex],ListView1.ItemIndex][i]);
end;

if Combobox2.Text='CSGT' then begin
For i:=0 to tenzor_csgt_mult[basket[Combobox1.ItemIndex],ListView1.ItemIndex].Count-1 do
Form59.Memo1.Lines.Add(tenzor_csgt_mult[basket[Combobox1.ItemIndex],ListView1.ItemIndex][i]);
end;

if Combobox2.Text='IGAIM' then begin
For i:=0 to tenzor_igaim_mult[basket[Combobox1.ItemIndex],ListView1.ItemIndex].Count-1 do
Form59.Memo1.Lines.Add(tenzor_igaim_mult[basket[Combobox1.ItemIndex],ListView1.ItemIndex][i]);
end;

if Combobox2.Text='Single Origin' then begin
For i:=0 to tenzor_so_mult[basket[Combobox1.ItemIndex],ListView1.ItemIndex].Count-1 do
Form59.Memo1.Lines.Add(tenzor_so_mult[basket[Combobox1.ItemIndex],ListView1.ItemIndex][i]);
end;


end;



end;
end;
end;










end;

procedure TForm58.BitBtn4Click(Sender: TObject);
begin
Form60.Show;
end;

procedure TForm58.ComboBox1Change(Sender: TObject);
var i,j,nlmax,b,p,s,k,m,n: integer;
task,x20: widestring;
tol,summa_temp: real;
shield_temp,shield_temp1: array of string;
cut_temp: array of integer;
check_cut: boolean;
itm: TListItem;
label 10,20,30,40,250,260,270,280;
begin
if Combobox1.Items.Count>1 then begin

ListView1.Clear;
Combobox2.Clear;
Label3.Caption:='';
Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
degener_compos_giao:=nil;
degener_compos_csgt:=nil;
degener_compos_igaim:=nil;
degener_compos_so:=nil;
degener_compos_giao_mult:=nil;
degener_compos_csgt_mult:=nil;
degener_compos_igaim_mult:=nil;
degener_compos_so_mult:=nil;
degener_giao:=nil;
degener_csgt:=nil;
degener_igaim:=nil;
degener_so:=nil;
degener_giao_mult:=nil;
degener_csgt_mult:=nil;
degener_igaim_mult:=nil;
degener_so_mult:=nil;

tol:=0.5; // Толерантность выборки в вырождение

////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]]) do
if copy(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]],i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]],j+1,200);
////////////////////////////////////////////////////////////////////

//ComboBox1.Items.Add(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]]);
ComboBox2.ItemIndex:=0;
Label3.Caption:='Наименование системы: '+task;

for i:=0 to length(nmr_methods[basket[Combobox1.ItemIndex]])-1 do
if nmr_methods[basket[Combobox1.ItemIndex],i]<>'' then Combobox2.Items.Add(nmr_methods[basket[Combobox1.ItemIndex],i]);
Combobox2.ItemIndex:=0;

Label4.Caption:='Метод получения химсдвигов: '+Combobox2.Text;


///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************



if Combobox2.Text='GIAO' then begin
for i:=0 to length(shield_giao_mult[basket[Combobox1.ItemIndex]])-1 do begin
if shield_giao_mult[basket[Combobox1.ItemIndex],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_giao_mult[basket[Combobox1.ItemIndex],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////
nlmax:=0;
if Combobox2.Text='GIAO' then begin

10:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin

if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_giao,length(degener_giao)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_giao_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[cut_temp[m]]=shield_giao_mult[basket[Combobox1.ItemIndex],p] then  begin
degener_compos_giao[length(degener_giao),m]:=shield_giao_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
b:=p+1;
Break;
end;
/////////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 10;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_giao,length(degener_compos_giao)+1,nlmax);
for p:=0 to length(shield_giao_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[0]=shield_giao_mult[basket[Combobox1.ItemIndex],p] then  Break;
degener_compos_giao[length(degener_compos_giao)-1,0]:=shield_giao_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
shield_temp:=nil;
end;




//###############################################################################################
//###############################################################################################
//###############################################################################################

if Combobox2.Text='CSGT' then begin
for i:=0 to length(shield_csgt_mult[basket[Combobox1.ItemIndex]])-1 do begin
if shield_csgt_mult[basket[Combobox1.ItemIndex],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_csgt_mult[basket[Combobox1.ItemIndex],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='CSGT' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

20:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_csgt,length(degener_csgt)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_csgt)-1 do
if shield_temp[cut_temp[m]]=shield_giao[p] then  begin
degener_compos_csgt[length(degener_csgt),m]:=shield_csgt_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 20;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_csgt,length(degener_compos_csgt)+1,nlmax);
for p:=0 to length(shield_csgt_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[0]=shield_csgt_mult[basket[Combobox1.ItemIndex],p] then  Break;
degener_compos_csgt[length(degener_compos_csgt)-1,0]:=shield_csgt_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################



if Combobox2.Text='IGAIM' then begin
for i:=0 to length(shield_igaim_mult[basket[Combobox1.ItemIndex]])-1 do begin
if shield_igaim_mult[basket[Combobox1.ItemIndex],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_igaim_mult[basket[Combobox1.ItemIndex],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='IGAIM' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

30:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_igaim,length(degener_igaim)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_igaim_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[cut_temp[m]]=shield_igaim_mult[basket[Combobox1.ItemIndex],p] then  begin
degener_compos_igaim[length(degener_igaim),m]:=shield_igaim_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 30;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_igaim,length(degener_compos_igaim)+1,nlmax);
for p:=0 to length(shield_igaim_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[0]=shield_igaim_mult[basket[Combobox1.ItemIndex],p] then  Break;
degener_compos_igaim[length(degener_compos_igaim)-1,0]:=shield_igaim_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
shield_temp:=nil;
end;



//###############################################################################################
//###############################################################################################
//###############################################################################################




if Combobox2.Text='Single Origin' then begin
for i:=0 to length(shield_so_mult[basket[Combobox1.ItemIndex]])-1 do begin
if shield_so_mult[basket[Combobox1.ItemIndex],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_so_mult[basket[Combobox1.ItemIndex],i];
end;
end;
end;


/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='Single Origin' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

40:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_so,length(degener_so)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_so_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[cut_temp[m]]=shield_so_mult[basket[Combobox1.ItemIndex],p] then  begin
degener_compos_so[length(degener_so),m]:=shield_so_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 40;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_so,length(degener_compos_so)+1,nlmax);
for p:=0 to length(shield_so_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[0]=shield_so_mult[basket[Combobox1.ItemIndex],p] then  Break;
degener_compos_so[length(degener_compos_so)-1,0]:=shield_so_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################


/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_giao<>nil then begin
for p:=0 to length(degener_compos_giao)-1 do
if degener_compos_giao[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_giao[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_giao[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_giao[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_giao[p,j+1]='' then goto 250;
 if StrToFloat(Copy(degener_compos_giao[p,j],1,pos('=',degener_compos_giao[p,j])-1)) >  StrToFloat(Copy(degener_compos_giao[p,j+1],1,pos('=',degener_compos_giao[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_giao[p,j+1];                                   //  ######   Sorting of array   degener_compos_giao[i]
 degener_compos_giao[p,j+1] := degener_compos_giao[p,j];              //  ########################################
 degener_compos_giao[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
250:
j:=0;
end;                             
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_csgt<>nil then begin
for p:=0 to length(degener_compos_csgt)-1 do
if degener_compos_csgt[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_csgt[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_csgt[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_csgt[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_csgt[p,j+1]='' then goto 260;
 if StrToFloat(Copy(degener_compos_csgt[p,j],1,pos('=',degener_compos_csgt[p,j])-1)) >  StrToFloat(Copy(degener_compos_csgt[p,j+1],1,pos('=',degener_compos_csgt[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_csgt[p,j+1];                                   //  ######   Sorting of array   degener_compos_csgt[i]
 degener_compos_csgt[p,j+1] := degener_compos_csgt[p,j];              //  ########################################
 degener_compos_csgt[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
260:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_igaim<>nil then begin
for p:=0 to length(degener_compos_igaim)-1 do
if degener_compos_igaim[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_igaim[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_igaim[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_igaim[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_igaim[p,j+1]='' then goto 270;
 if StrToFloat(Copy(degener_compos_igaim[p,j],1,pos('=',degener_compos_igaim[p,j])-1)) >  StrToFloat(Copy(degener_compos_igaim[p,j+1],1,pos('=',degener_compos_igaim[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_igaim[p,j+1];                                   //  ######   Sorting of array   degener_compos_igaim[i]
 degener_compos_igaim[p,j+1] := degener_compos_igaim[p,j];             //  ########################################
 degener_compos_igaim[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
270:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_so<>nil then begin
for p:=0 to length(degener_compos_so)-1 do
if degener_compos_so[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_so[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_so[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_so[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_so[p,j+1]='' then goto 280;
 if StrToFloat(Copy(degener_compos_so[p,j],1,pos('=',degener_compos_so[p,j])-1)) >  StrToFloat(Copy(degener_compos_so[p,j+1],1,pos('=',degener_compos_so[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_so[p,j+1];                                   //  ######   Sorting of array   degener_compos_so[i]
 degener_compos_so[p,j+1] := degener_compos_so[p,j];                //  ########################################
 degener_compos_so[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
280:
j:=0;
end;
end;




                   


if Combobox2.Text='GIAO' then  begin
for i:=0 to length(shield_giao_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_giao_mult[basket[Combobox1.ItemIndex],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_giao));
end;

if Combobox2.Text='CSGT' then  begin
for i:=0 to length(shield_csgt_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_csgt_mult[basket[Combobox1.ItemIndex],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_csgt));
end;


if Combobox2.Text='IGAIM' then  begin
for i:=0 to length(shield_igaim_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_igaim_mult[basket[Combobox1.ItemIndex],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_igaim));
end;


if Combobox2.Text='Single Origin' then  begin
for i:=0 to length(shield_so_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_so_mult[basket[Combobox1.ItemIndex],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_so));
end;


if z_mlt[basket[Combobox1.ItemIndex]]=true then  begin
Label7.Font.Color:=clblack;
Label7.Caption:='Результат: Normal termination' ;
end
else  begin
Label7.Font.Color:=clred;
Label7.Caption:='Результат: WARNING! Abnormal termination!'
end;

if Combobox2.Text='CSGT' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_csgt_mult[basket[Combobox1.ItemIndex]];
if Combobox2.Text='IGAIM' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_igaim_mult[basket[Combobox1.ItemIndex]];
if Combobox2.Text='Single Origin' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_so_mult[basket[Combobox1.ItemIndex]];
if Combobox2.Text='GIAO' then Label6.Caption:='Магнитная восприимчивость, I / A: *** / ***';


// Заполняем ListView

if Combobox2.Text='GIAO' then begin
for i:=0 to nomer_atoma_mult[basket[Combobox1.ItemIndex]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(shield_giao_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(anis_giao_mult[basket[Combobox1.ItemIndex],i]);
end;
end;

if Combobox2.Text='CSGT' then begin
for i:=0 to nomer_atoma_mult[basket[Combobox1.ItemIndex]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(shield_csgt_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(anis_csgt_mult[basket[Combobox1.ItemIndex],i]);
end;
end;

if Combobox2.Text='IGAIM' then begin
for i:=0 to nomer_atoma_mult[basket[Combobox1.ItemIndex]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(shield_igaim_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(anis_igaim_mult[basket[Combobox1.ItemIndex],i]);
end;
end;

if Combobox2.Text='Single Origin' then begin
for i:=0 to nomer_atoma_mult[basket[Combobox1.ItemIndex]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(shield_so_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(anis_so_mult[basket[Combobox1.ItemIndex],i]);
end;
end;

end;
end;









procedure TForm58.ComboBox2Change(Sender: TObject);
var i,j,nlmax,b,p,s,k,m,n: integer;
task,x20: widestring;
tol,summa_temp: real;
shield_temp,shield_temp1: array of string;
cut_temp: array of integer;
check_cut: boolean;
itm: TListItem;
label 1,2,3,4,25,26,27,28,10,20,30,40,250,260,270,280;
begin
if Combobox2.Items.Count>1 then begin
ListView1.Clear;
Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
degener_compos_giao:=nil;
degener_compos_csgt:=nil;
degener_compos_igaim:=nil;
degener_compos_so:=nil;
degener_compos_giao_mult:=nil;
degener_compos_csgt_mult:=nil;
degener_compos_igaim_mult:=nil;
degener_compos_so_mult:=nil;
degener_giao:=nil;
degener_csgt:=nil;
degener_igaim:=nil;
degener_so:=nil;
degener_giao_mult:=nil;
degener_csgt_mult:=nil;
degener_igaim_mult:=nil;
degener_so_mult:=nil;

Label4.Caption:='Метод получения химсдвигов: '+Combobox2.Text;
tol:=0.5;


if dial=false then begin
///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************



if Combobox2.Text='GIAO' then begin
for i:=0 to length(shield_giao_mult[basket[Combobox1.ItemIndex]])-1 do begin
if shield_giao_mult[basket[Combobox1.ItemIndex],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_giao_mult[basket[Combobox1.ItemIndex],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////
nlmax:=0;
if Combobox2.Text='GIAO' then begin

10:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin

if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_giao,length(degener_giao)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_giao_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[cut_temp[m]]=shield_giao_mult[basket[Combobox1.ItemIndex],p] then  begin
degener_compos_giao[length(degener_giao),m]:=shield_giao_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
b:=p+1;
Break;
end;
/////////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 10;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_giao,length(degener_compos_giao)+1,nlmax);
for p:=0 to length(shield_giao_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[0]=shield_giao_mult[basket[Combobox1.ItemIndex],p] then  Break;
degener_compos_giao[length(degener_compos_giao)-1,0]:=shield_giao_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
shield_temp:=nil;
end;




//###############################################################################################
//###############################################################################################
//###############################################################################################

if Combobox2.Text='CSGT' then begin
for i:=0 to length(shield_csgt_mult[basket[Combobox1.ItemIndex]])-1 do begin
if shield_csgt_mult[basket[Combobox1.ItemIndex],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_csgt_mult[basket[Combobox1.ItemIndex],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='CSGT' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

20:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_csgt,length(degener_csgt)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_csgt)-1 do
if shield_temp[cut_temp[m]]=shield_giao[p] then  begin
degener_compos_csgt[length(degener_csgt),m]:=shield_csgt_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 20;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_csgt,length(degener_compos_csgt)+1,nlmax);
for p:=0 to length(shield_csgt_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[0]=shield_csgt_mult[basket[Combobox1.ItemIndex],p] then  Break;
degener_compos_csgt[length(degener_compos_csgt)-1,0]:=shield_csgt_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################



if Combobox2.Text='IGAIM' then begin
for i:=0 to length(shield_igaim_mult[basket[Combobox1.ItemIndex]])-1 do begin
if shield_igaim_mult[basket[Combobox1.ItemIndex],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_igaim_mult[basket[Combobox1.ItemIndex],i];
end;
end;
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='IGAIM' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

30:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_igaim,length(degener_igaim)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_igaim_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[cut_temp[m]]=shield_igaim_mult[basket[Combobox1.ItemIndex],p] then  begin
degener_compos_igaim[length(degener_igaim),m]:=shield_igaim_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 30;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_igaim,length(degener_compos_igaim)+1,nlmax);
for p:=0 to length(shield_igaim_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[0]=shield_igaim_mult[basket[Combobox1.ItemIndex],p] then  Break;
degener_compos_igaim[length(degener_compos_igaim)-1,0]:=shield_igaim_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
shield_temp:=nil;
end;



//###############################################################################################
//###############################################################################################
//###############################################################################################




if Combobox2.Text='Single Origin' then begin
for i:=0 to length(shield_so_mult[basket[Combobox1.ItemIndex]])-1 do begin
if shield_so_mult[basket[Combobox1.ItemIndex],i]<>'' then  begin
Setlength(shield_temp,length(shield_temp)+1);
shield_temp[i]:=shield_so_mult[basket[Combobox1.ItemIndex],i];
end;
end;
end;


/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='Single Origin' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

40:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_so,length(degener_so)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_so_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[cut_temp[m]]=shield_so_mult[basket[Combobox1.ItemIndex],p] then  begin
degener_compos_so[length(degener_so),m]:=shield_so_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 40;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_so,length(degener_compos_so)+1,nlmax);
for p:=0 to length(shield_so_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_temp[0]=shield_so_mult[basket[Combobox1.ItemIndex],p] then  Break;
degener_compos_so[length(degener_compos_so)-1,0]:=shield_so_mult[basket[Combobox1.ItemIndex],p]+'='+inttostr(p+1)+'='+atomoutel_mult[basket[Combobox1.ItemIndex],1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################


/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_giao<>nil then begin
for p:=0 to length(degener_compos_giao)-1 do
if degener_compos_giao[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_giao[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_giao[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_giao[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_giao[p,j+1]='' then goto 250;
 if StrToFloat(Copy(degener_compos_giao[p,j],1,pos('=',degener_compos_giao[p,j])-1)) >  StrToFloat(Copy(degener_compos_giao[p,j+1],1,pos('=',degener_compos_giao[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_giao[p,j+1];                                   //  ######   Sorting of array   degener_compos_giao[i]
 degener_compos_giao[p,j+1] := degener_compos_giao[p,j];              //  ########################################
 degener_compos_giao[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
250:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_csgt<>nil then begin
for p:=0 to length(degener_compos_csgt)-1 do
if degener_compos_csgt[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_csgt[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_csgt[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_csgt[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_csgt[p,j+1]='' then goto 260;
 if StrToFloat(Copy(degener_compos_csgt[p,j],1,pos('=',degener_compos_csgt[p,j])-1)) >  StrToFloat(Copy(degener_compos_csgt[p,j+1],1,pos('=',degener_compos_csgt[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_csgt[p,j+1];                                   //  ######   Sorting of array   degener_compos_csgt[i]
 degener_compos_csgt[p,j+1] := degener_compos_csgt[p,j];              //  ########################################
 degener_compos_csgt[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
260:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_igaim<>nil then begin
for p:=0 to length(degener_compos_igaim)-1 do
if degener_compos_igaim[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_igaim[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_igaim[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_igaim[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_igaim[p,j+1]='' then goto 270;
 if StrToFloat(Copy(degener_compos_igaim[p,j],1,pos('=',degener_compos_igaim[p,j])-1)) >  StrToFloat(Copy(degener_compos_igaim[p,j+1],1,pos('=',degener_compos_igaim[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_igaim[p,j+1];                                   //  ######   Sorting of array   degener_compos_igaim[i]
 degener_compos_igaim[p,j+1] := degener_compos_igaim[p,j];             //  ########################################
 degener_compos_igaim[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
270:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_so<>nil then begin
for p:=0 to length(degener_compos_so)-1 do
if degener_compos_so[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_so[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_so[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_so[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_so[p,j+1]='' then goto 280;
 if StrToFloat(Copy(degener_compos_so[p,j],1,pos('=',degener_compos_so[p,j])-1)) >  StrToFloat(Copy(degener_compos_so[p,j+1],1,pos('=',degener_compos_so[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_so[p,j+1];                                   //  ######   Sorting of array   degener_compos_so[i]
 degener_compos_so[p,j+1] := degener_compos_so[p,j];                //  ########################################
 degener_compos_so[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
280:
j:=0;
end;
end;







if Combobox2.Text='GIAO' then  begin
for i:=0 to length(shield_giao_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_giao_mult[basket[Combobox1.ItemIndex],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_giao));
end;

if Combobox2.Text='CSGT' then  begin
for i:=0 to length(shield_csgt_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_csgt_mult[basket[Combobox1.ItemIndex],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_csgt));
end;


if Combobox2.Text='IGAIM' then  begin
for i:=0 to length(shield_igaim_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_igaim_mult[basket[Combobox1.ItemIndex],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(i)+' / ' +inttostr(length(degener_igaim));
end;


if Combobox2.Text='Single Origin' then  begin
for i:=0 to length(shield_so_mult[basket[Combobox1.ItemIndex]])-1 do
if shield_so_mult[basket[Combobox1.ItemIndex],i]='' then Break;
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_so_mult[basket[Combobox1.ItemIndex]]))+' / ' +inttostr(length(degener_so));
end;



if Combobox2.Text='CSGT' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_csgt_mult[basket[Combobox1.ItemIndex]];
if Combobox2.Text='IGAIM' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_igaim_mult[basket[Combobox1.ItemIndex]];
if Combobox2.Text='Single Origin' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_so_mult[basket[Combobox1.ItemIndex]];
if Combobox2.Text='GIAO' then Label6.Caption:='Магнитная восприимчивость, I / A: *** / ***';


// Заполняем ListView

if Combobox2.Text='GIAO' then begin
for i:=0 to nomer_atoma_mult[basket[Combobox1.ItemIndex]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(shield_giao_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(anis_giao_mult[basket[Combobox1.ItemIndex],i]);
end;
end;

if Combobox2.Text='CSGT' then begin
for i:=0 to nomer_atoma_mult[basket[Combobox1.ItemIndex]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(shield_csgt_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(anis_csgt_mult[basket[Combobox1.ItemIndex],i]);
end;
end;

if Combobox2.Text='IGAIM' then begin
for i:=0 to nomer_atoma_mult[basket[Combobox1.ItemIndex]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(shield_igaim_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(anis_igaim_mult[basket[Combobox1.ItemIndex],i]);
end;
end;

if Combobox2.Text='Single Origin' then begin
for i:=0 to nomer_atoma_mult[basket[Combobox1.ItemIndex]]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(shield_so_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(anis_so_mult[basket[Combobox1.ItemIndex],i]);
end;
end;






end
else begin
Label4.Caption:='Метод получения химсдвигов: '+Combobox2.Text;


///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************
///////////***************************************************************************

if Combobox2.Text='GIAO' then begin
Setlength(shield_temp,length(shield_giao));
for i:=0 to length(shield_giao)-1 do
shield_temp[i]:=shield_giao[i];
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////
nlmax:=0;
if Combobox2.Text='GIAO' then begin

1:  // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_giao,length(degener_giao)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_giao)-1 do
if shield_temp[cut_temp[m]]=shield_giao[p] then  begin
degener_compos_giao[length(degener_giao),m]:=shield_giao[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
b:=p+1;
Break;
end;
/////////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 1;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////

if length(shield_temp)=1 then begin
SetLength(degener_giao,length(degener_giao)+1);
degener_giao[length(degener_giao)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_giao,length(degener_compos_giao)+1,nlmax);
for p:=0 to length(shield_giao)-1 do
if shield_temp[0]=shield_giao[p] then  Break;
degener_compos_giao[length(degener_compos_giao)-1,0]:=shield_giao[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
shield_temp:=nil;
end;



//###############################################################################################
//###############################################################################################
//###############################################################################################

if Combobox2.Text='CSGT' then begin
Setlength(shield_temp,length(shield_csgt));
for i:=0 to length(shield_csgt)-1 do
shield_temp[i]:=shield_csgt[i];
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='CSGT' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

2:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_csgt,length(degener_csgt)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_csgt)-1 do
if shield_temp[cut_temp[m]]=shield_csgt[p] then  begin
degener_compos_csgt[length(degener_csgt),m]:=shield_csgt[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////

for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 2;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_csgt,length(degener_csgt)+1);
degener_csgt[length(degener_csgt)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_csgt,length(degener_compos_csgt)+1,nlmax);
for p:=0 to length(shield_csgt)-1 do
if shield_temp[0]=shield_csgt[p] then  Break;
degener_compos_csgt[length(degener_compos_csgt)-1,0]:=shield_csgt[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################



if Combobox2.Text='IGAIM' then begin
Setlength(shield_temp,length(shield_igaim));
for i:=0 to length(shield_igaim)-1 do
shield_temp[i]:=shield_igaim[i];
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='IGAIM' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

3:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_igaim,length(degener_igaim)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_igaim)-1 do
if shield_temp[cut_temp[m]]=shield_igaim[p] then  begin
degener_compos_igaim[length(degener_igaim),m]:=shield_igaim[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 3;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////

if length(shield_temp)=1 then begin
SetLength(degener_igaim,length(degener_igaim)+1);
degener_igaim[length(degener_igaim)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_igaim,length(degener_compos_igaim)+1,nlmax);
for p:=0 to length(shield_igaim)-1 do
if shield_temp[0]=shield_igaim[p] then  Break;
degener_compos_igaim[length(degener_compos_igaim)-1,0]:=shield_igaim[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################




if Combobox2.Text='Single Origin' then begin
Setlength(shield_temp,length(shield_so));
for i:=0 to length(shield_so)-1 do
shield_temp[i]:=shield_so[i];
end;



/////////////////Блок для определения числа вырожденных линий //////////////////////////////////////

if Combobox2.Text='Single Origin' then begin
cut_temp:=nil;
summa_temp:=0;
shield_temp1:=nil;

4:   // Толерантность объединения сдвигов к одному пику (можно сделать пользовательскую настройку)
for i:=1 to length(shield_temp)-1 do  begin
j:=1;
summa_temp:=0;
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i-1;
for k:=0 to length(shield_temp)-i-1 do  begin
if abs(strtofloat(shield_temp[i-1])-strtofloat(shield_temp[i+k]))<=tol  then begin
SetLength(cut_temp,length(cut_temp)+1);
cut_temp[length(cut_temp)-1]:=i+k;
j:=j+1;
end;
end;

///////////подпроцедура поиска состава вырождения линии типа сдвиг-номер_атома-атом
b:=0;
if nlmax<length(cut_temp) then nlmax:=length(cut_temp);
Setlength(degener_compos_so,length(degener_so)+1,nlmax);
for m:=0 to length(cut_temp)-1 do
for p:=b to length(shield_so)-1 do
if shield_temp[cut_temp[m]]=shield_so[p] then  begin
degener_compos_so[length(degener_so),m]:=shield_so[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
b:=p+1;
Break;
end;
//////////////////////////////////////////////////////////////////////////////////


for m:=0 to length(cut_temp)-1 do
summa_temp:=summa_temp+StrToFloat(shield_temp[cut_temp[m]]);

setlength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=floattostr(summa_temp/j)+'='+inttostr(j);

SetLength(shield_temp1,length(shield_temp)-j);
s:=0;

for m:=0 to length(shield_temp)-1 do  begin
  check_cut:=false;
for n:=0 to length(cut_temp)-1 do
if m=cut_temp[n] then check_cut:=true;
if check_cut=false then begin
shield_temp1[s]:=shield_temp[m];
s:=s+1;
end;
end;
cut_temp:=nil;
summa_temp:=0;
setlength(shield_temp, length(shield_temp1));
for m:=0 to length(shield_temp1)-1 do
shield_temp[m]:=shield_temp1[m];
goto 4;
end;

end;
////////////Конец блока для определения числа вырожденных линий /////////////////////


if length(shield_temp)=1 then begin
SetLength(degener_so,length(degener_so)+1);
degener_so[length(degener_so)-1]:=shield_temp[0]+'=1';
SetLength(degener_compos_so,length(degener_compos_so)+1,nlmax);
for p:=0 to length(shield_so)-1 do
if shield_temp[0]=shield_so[p] then  Break;
degener_compos_so[length(degener_compos_so)-1,0]:=shield_so[p]+'='+inttostr(p+1)+'='+atomoutel[1,p+1];
shield_temp:=nil;
end;


//###############################################################################################
//###############################################################################################
//###############################################################################################



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_giao<>nil then begin
for p:=0 to length(degener_compos_giao)-1 do
if degener_compos_giao[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_giao[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_giao[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_giao[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_giao[p,j+1]='' then goto 25;
 if StrToFloat(Copy(degener_compos_giao[p,j],1,pos('=',degener_compos_giao[p,j])-1)) >  StrToFloat(Copy(degener_compos_giao[p,j+1],1,pos('=',degener_compos_giao[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_giao[p,j+1];                                   //  ######   Sorting of array   degener_compos_giao[i]
 degener_compos_giao[p,j+1] := degener_compos_giao[p,j];              //  ########################################
 degener_compos_giao[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
25:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_csgt<>nil then begin
for p:=0 to length(degener_compos_csgt)-1 do
if degener_compos_csgt[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_csgt[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_csgt[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_csgt[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_csgt[p,j+1]='' then goto 26;
 if StrToFloat(Copy(degener_compos_csgt[p,j],1,pos('=',degener_compos_csgt[p,j])-1)) >  StrToFloat(Copy(degener_compos_csgt[p,j+1],1,pos('=',degener_compos_csgt[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_csgt[p,j+1];                                   //  ######   Sorting of array   degener_compos_csgt[i]
 degener_compos_csgt[p,j+1] := degener_compos_csgt[p,j];              //  ########################################
 degener_compos_csgt[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
26:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_igaim<>nil then begin
for p:=0 to length(degener_compos_igaim)-1 do
if degener_compos_igaim[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_igaim[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_igaim[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_igaim[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_igaim[p,j+1]='' then goto 27;
 if StrToFloat(Copy(degener_compos_igaim[p,j],1,pos('=',degener_compos_igaim[p,j])-1)) >  StrToFloat(Copy(degener_compos_igaim[p,j+1],1,pos('=',degener_compos_igaim[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_igaim[p,j+1];                                   //  ######   Sorting of array   degener_compos_igaim[i]
 degener_compos_igaim[p,j+1] := degener_compos_igaim[p,j];             //  ########################################
 degener_compos_igaim[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
27:
j:=0;
end;
end;



/////////Теперь надо отсортировать массив вырождений по возрастанию сдвига
if degener_compos_so<>nil then begin
for p:=0 to length(degener_compos_so)-1 do
if degener_compos_so[p]<>nil then begin
//Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(degener_compos_so[p])>1 then begin                       //  ########################################
 for i:=0 to Length(degener_compos_so[p])-1 do                      //  ########################################
 for j:=0 to Length(degener_compos_so[p])-2 do  begin               //  ########################################                                              //  ########################################
 if degener_compos_so[p,j+1]='' then goto 28;
 if StrToFloat(Copy(degener_compos_so[p,j],1,pos('=',degener_compos_so[p,j])-1)) >  StrToFloat(Copy(degener_compos_so[p,j+1],1,pos('=',degener_compos_so[p,j+1])-1))  then begin           //  ######
 x20 := degener_compos_so[p,j+1];                                   //  ######   Sorting of array   degener_compos_so[i]
 degener_compos_so[p,j+1] := degener_compos_so[p,j];                //  ########################################
 degener_compos_so[p,j]:=x20;                                       //  ########################################
 end;
 end;
 end;
28:
j:=0;
end;
end;






if Combobox2.Text='GIAO' then
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_giao))+' / ' +inttostr(length(degener_giao));
if Combobox2.Text='CSGT' then
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_csgt))+' / ' +inttostr(length(degener_csgt));
if Combobox2.Text='IGAIM' then
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_igaim))+' / ' +inttostr(length(degener_igaim));
if Combobox2.Text='Single Origin' then
Label5.Caption:='Число линий (общее / с учетом вырождений): '+inttostr(length(shield_so))+' / ' +inttostr(length(degener_so));



if Combobox2.Text='CSGT' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_csgt;
if Combobox2.Text='IGAIM' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_igaim;
if Combobox2.Text='Single Origin' then Label6.Caption:='Магнитная восприимчивость, I / A: ' +susc_so;
if Combobox2.Text='GIAO' then Label6.Caption:='Магнитная восприимчивость, I / A: *** / ***';


// Заполняем ListView

if Combobox2.Text='GIAO' then begin
for i:=0 to length(shield_giao)-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(shield_giao[i]);
itm.SubItems.Append(anis_giao[i]);
end;
end;

if Combobox2.Text='CSGT' then begin
for i:=0 to length(shield_csgt)-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(shield_csgt[i]);
itm.SubItems.Append(anis_csgt[i]);
end;
end;

if Combobox2.Text='IGAIM' then begin
for i:=0 to length(shield_igaim)-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(shield_igaim[i]);
itm.SubItems.Append(anis_igaim[i]);
end;
end;

if Combobox2.Text='Single Origin' then begin
for i:=0 to length(shield_so)-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(shield_so[i]);
itm.SubItems.Append(anis_so[i]);
end;
end;

































end;










end;

end;

procedure TForm58.BitBtn3Click(Sender: TObject);
begin
Form61.Show;
end;

procedure TForm58.BitBtn1Click(Sender: TObject);
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
WriteLn(f,' *                            NMR:                            *');
WriteLn(f,' *        Shields, anisotropy, magnetic susceptibility        *');
WriteLn(f,' *                   and spin-spin coupling                   *');
WriteLn(f,' *       (SCF GIAO, CSGT, IGAIM and Single Origin gauge)      *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                        Magellan 1.4                        *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,' File: ' +Combobox1.Items[Combobox1.ItemIndex]);
WriteLn(f,' Method: ' +Combobox2.Items[Combobox1.ItemIndex]);
WriteLn(f,' Number of lines / degeneracy peaks: ' + Copy(Label5.Caption, pos(':',Label5.Caption)+2,length(Label5.Caption)));
WriteLn(f,' Magnetic susceptibility, Iso / Aniso: ' + Copy(Label6.Caption, pos(':',Label6.Caption)+2,length(Label6.Caption)));
WriteLn(f,' Result: ' + Copy(Label7.Caption, pos(':',Label7.Caption)+2,length(Label7.Caption)));
WriteLn(f,'');
WriteLn(f,'');
for i:=0 to ListView1.Columns.Count-1 do   begin
if pos('№',ListView1.Column[i].Caption)<>0 then Write(f, '   №      ');
if pos('Атом',ListView1.Column[i].Caption)<>0 then Write(f, 'Atom      ');
if pos('Сдвиг',ListView1.Column[i].Caption)<>0 then Write(f, 'Shielding, ppm     ');
if pos('Анизотропия',ListView1.Column[i].Caption)<>0 then Write(f, 'Anisotropy, ppm');
end;
WriteLn(f,'');
for i:=0 to ListView1.Items.Count-1 do begin
Write(f, copy(probel,1,4-length(ListView1.Items[i].Caption))+ListView1.Items[i].Caption);
for j:=0 to ListView1.Columns.Count-2 do  begin
if j=0 then Write(f,copy(probel,1,7) + ListView1.Items[i].SubItems[j]);
if j=1 then Write(f,copy(probel,1,20-length(ListView1.Items[i].SubItems[j])-length(ListView1.Items[i].SubItems[j-1])) + ListView1.Items[i].SubItems[j]);
if j=2 then Write(f,copy(probel,1,19-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
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

procedure TForm58.BitBtn2Click(Sender: TObject);
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
if pos('Сдвиг',ListView1.Columns[i].Caption)<>0 then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 15;     //#
if pos('Анизотропия',ListView1.Columns[i].Caption)<>0 then MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 18;     //#
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
