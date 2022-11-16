unit Unit52;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ComObj, OleServer, ExcelXP, ActiveX;

type
  TForm52 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListView1: TListView;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form52: TForm52;
  transit: array of array of TStringList;
  transit_mult: array of array of array of TStringList;
  real_num_cy: integer;
  nom_ex_mult,state_mult,energ_mult,wave_mult,forc_mult,s2_mult,etotsac_mult,energex_mult,inten1_mult,inten2_mult,ip1_mult,ip2_mult: array of array of array of string;
  z_mlt: array of boolean;
  nom_ex,state,energ,wave,forc,s2,etotsac,energex,inten1,inten2,ip1,ip2: array of array of string;
  real_num_st,ip_nomer: integer;

implementation

uses Unit1, Unit24, Unit53, Unit54, Unit56;

{$R *.dfm}

procedure TForm52.FormShow(Sender: TObject);
var i,j,k,k1,l,m,n,lmax,p,t,s,NoGS,saccount,m1,m2,m3,m4,m5,m6,kmax: integer;
str,str1,str2,str3,str4,task,method: widestring;
method_mult: array of widestring;
tempforc: array of string;
f: TextFile;
itm: TListItem;
z_end,ip1already,optmod: boolean;
label 0,1,2,3,4,5,6,7,8,100,10,20,30,40,50,60,70,80,1000;
begin
ListView1.Clear;
Combobox1.Clear;
ip1already:=false;
optmod:=false;
real_num_st:=0;
ip_nomer:=0;
//transit:=nil;
if dial=true then begin
if Form1.OpenDialog1.FilterIndex=1 then goto 0;
if Form1.OpenDialog1.FilterIndex=3 then goto 0;
nom_ex:=nil;
state:=nil;
energ:=nil;
wave:=nil;
forc:=nil;
s2:=nil;
etotsac:=nil;
energex:=nil;
inten1:=nil;
inten2:=nil;
ip1:=nil;
ip2:=nil;
AssignFile(f,Form1.OpenDialog1.Filename);
Reset(f);
k:=-1;
k1:=0;
l:=0;
s:=0;
z_end:=false;
for p:=0 to length(src_route)-1 do
if (pos('EOMCCSD',UpperCase(src_route[p]))<>0) or (pos('EOM-CCSD',UpperCase(src_route[p]))<>0) then method:='EOM-CCSD' ;

while not eof(f) do begin
ReadLn(f,str);

if (Pos(' Forces (Hartrees/Bohr)',str)<>0) and (Pos(' Atomic',str)<>0) and (etotsac<>nil) then begin
l:=0;
k1:=k1+1;
end;


if lmax<=l then lmax:=l;

if (pos(' Excited State ',str)<>0) and (pos(' nm ',str)<>0) then begin
str1:=copy(str,pos('Excited State',str)+14,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
str2:=copy(str1,i,length(str1));
str3:=copy(str2,1,pos(':',str2)-1);  // Это номер возбужденного состояния
setlength(nom_ex,k+1);
setlength(nom_ex,k+1,lmax+1);
nom_ex[k,l]:=str3;
str1:=Copy(str,pos(':',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));      // Строка State-A   285.12 eV ... (дальше с ней работаем)
str3:=Copy(str2,1,pos(' ',str2)-1);
setlength(state,k+1);
setlength(state,k+1,lmax+1);
state[k,l]:=str3;
str:=str2;          // Присвоиле строке подстроку (для удобства работы)
for i:=0 to length(str) do
if Copy(str,i,1)=' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));      // Строка 285.12 eV  582.12 nm ... (дальше с ней работаем)
str3:=Copy(str2,1,pos(' ',str2)-1);
setlength(energ,k+1);
setlength(energ,k+1,lmax+1);
energ[k,l]:=str3;
str:=str2;          // Присвоиле строке подстроку (для удобства работы)
str1:=Copy(str,pos('eV',str)+3,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));      // Строка 582.12 nm ... (дальше с ней работаем)
str3:=Copy(str2,1,pos(' ',str2)-1);
setlength(wave,k+1);
setlength(wave,k+1,lmax+1);
wave[k,l]:=str3;
str:=str2;          // Присвоиле строке подстроку (для удобства работы)
str1:=Copy(str,pos('f=',str)+2,length(str));  //  Строка 0.0175  <S**2>=2.000 (дальше с ней работаем)
if pos(' ',str1)<>0 then str2:=Copy(str1,1,pos(' ',str1)-1) else str2:=str1;
setlength(forc,k+1);
setlength(forc,k+1,lmax+1);
forc[k,l]:=str2;
str:=str1;
if pos('>=',str)<>0 then str1:=Copy(str,pos('>=',str)+2,length(str)) else str1:='@@@@';
setlength(s2,k+1);
setlength(s2,k+1,lmax+1);
s2[k,l]:=str1;
setlength(transit,k+1);
setlength(transit,k+1,lmax+1);
transit[k,l]:=TStringList.Create;
ReadLn(f,str);

if method='EOM-CCSD' then begin
While (str<>' ') and (pos(' Ground to excited state transition',str)=0) and (str<>'') do begin
transit[k,l].Add(str);
ReadLn(f,str);
end;
goto 1;
end;


                         // Читаем строку после основной строчки с данными о возбужденном состоянии
While {((pos('->',str)<>0) or (pos('<-',str)<>0)) and} (str<>' ') and (str<>'') and (pos(' SavETr: ',str)=0)  do begin
if (pos('->',str)<>0) or (pos('<-',str)<>0) or (pos(' Total Energy',str)<>0) then  transit[k,l].Add(str);
ReadLn(f,str);
end;


1:

l:=l+1;
end;     // конец if (pos(' Excited State ',str)<>0) and (pos('S**2',str)<>0) then begin
         // Прочитано одно возбужденное состояние с коэффициентами CI



if pos(' Excitation energies and oscillator strengths:',str)<>0 then begin
k:=k+1;
l:=0;
end;



//////////////////////ДЛЯ SAC-CI НУЖЕН ОТДЕЛЬНЫЙ БЛОК//////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

if (pos(' ENERGY AND WAVE FUNCTION OF SAC-CI METHOD',str)<>0) then begin
ReadLn(f,str);
if pos(' *************************************',str)<>0 then begin
ReadLn(f,str);
if pos(' ********************************************',str)<>0 then begin
ReadLn(f,str);
if pos(' ********************************************',str)<>0 then begin
  saccount:=0;
3: for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,1,i-1);   // Это слово Singlet, Triplet и т.д.
str3:=Copy(str1,i,length(str1));
for i:=0 to length(str3) do
if Copy(str3,i,1)<>' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)=' ' then Break;
str4:=Copy(str4,1,i-1);  // Это неприводимое представление
setlength(state,k1+1);
setlength(state,k1+1,lmax+1);
state[k1,l]:=str2+'-'+str4;
ReadLn(f,str);
2:   ReadLn(f,str);  // Это строка содержит полную энергию
if pos('This state is being used for optimizations',str)<>0 then optmod:=true;
if pos(' Total energy ',str)=0 then ReadLn(f,str);
if (pos('Caution',str)<>0) and (pos(' NOT CONVERGED',str)<>0) then begin
for i:=0 to 100 do begin
if (pos('Caution',str)=0) and (pos(' NOT CONVERGED',str)=0) then Break;
ReadLn(f,str);
end;
end;
if pos(' Total energy ',str)=0 then ReadLn(f,str);
if (pos(' Total energy ',str)<>0) and  (pos(' = ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
setlength(etotsac,k1+1);
setlength(etotsac,k1+1,lmax+1);
etotsac[k1,l]:=str2;
end;
ReadLn(f,str);
ReadLn(f,str);  // Это строка содержит  энергию возбуждения в эВ
if (pos(' Excitation energy ',str)<>0) and  (pos(' = ',str)<>0) and  (pos('eV',str)<>0) then begin
str1:=Copy(str,pos('eV',str)+2,length(str));
for i:=0 to length(str1) do
if (Copy(str1,i,1)<>' ') and ( Copy(str1,i,1)<>'=') then Break;
str2:=copy(str1,i,length(str1));
setlength(energ,k1+1);
setlength(energ,k1+1,lmax+1);
energ[k1,l]:=FloatToStrF(StrToFloat(str2),ffFixed,8,4);
setlength(wave,k1+1);        // Длины волны нет в SAC-CI выдаче, поэтому просто рассчитываем ее
setlength(wave,k1+1,lmax+1);
wave[k1,l]:=FloatToStrF((6.62607E-34)*299792458*(1E+9)/(1.6021766208E-19*strtofloat(energ[k1,l])),ffFixed,8,2);
saccount:=saccount+1;
ReadLn(f,str);
setlength(transit,k1+1);
setlength(transit,k1+1,lmax+1);
transit[k1,l]:=TStringList.Create;
while (pos(' ### ',str)=0) and (pos(' =================',str)=0) and  (pos(' ****************************************',str)=0) and (pos(' Omega= ',str)=0) do begin
transit[k1,l].Add(str);
ReadLn(f,str);
end;
if pos(' ### ',str)<>0 then begin
l:=l+1;
if lmax<l then lmax:=l;
setlength(state,k1+1);
setlength(state,k1+1,lmax+1);
state[k1,l]:=state[k1,l-1];
goto 2;
end;

if pos(' Omega= ',str)<>0 then begin
l:=l+1;
if lmax<l then lmax:=l;
goto 100;
end;

if pos(' =================',str)<>0 then begin

if optmod=true then begin
l:=l+1;
if lmax<l then lmax:=l;
goto 100;
end;


7: ReadLn(f,str);
for i:=0 to 1000 do  begin
if (pos(' Symmetry',str)<>0) and (pos(' Solution Excitation ',str)<>0) and (pos(' moment ',str)<>0) and (pos(' Osc.',str)<>0) then Break;
if (pos(' Symmetry  State ',str)<>0) and (pos(' I.P.',str)<>0) and  (pos(' Intensity',str)<>0) then goto 6;
ReadLn(f,str);
end;
8: ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
while pos(' --------------------------------',str)=0 do begin
if  pos(' Excitations are from this state.',str)=0 then  begin
str1:=Copy(str,pos('.',str)+6,length(str));
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
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));      // Это искомая сила осциллятора
SetLength(tempforc,length(tempforc)+1);
tempforc[length(tempforc)-1]:=str1;
//setlength(forc,k1+1);
//setlength(forc,k1+1,lmax+1);
//forc[k1,t]:=str1;
//t:=t+1;
end;
if  pos(' Excitations are from this state.',str)<>0 then  begin
SetLength(tempforc,length(tempforc)+1);
tempforc[length(tempforc)-1]:='G.S.';            // Ground State
NoGS:=length(tempforc)-1;
end;
ReadLn(f,str);
end;        // конец while pos(' --------------------------------',str)=0 do begin
end;        // конец  if pos(' =================',str)=0) then begin





/////////////////Потенциал ионизации и интенсивность - только для катион-дублета///////////////////////
6: if (pos(' Symmetry  State ',str)<>0) and (pos(' I.P.',str)<>0) and  (pos(' Intensity',str)<>0) then begin

SetLength(inten2,k1+1);
SetLength(inten2,k1+1,lmax+1);
SetLength(ip2,k1+1);
SetLength(ip2,k1+1,lmax+1);
s:=t;
ReadLn(f,str);
ReadLn(f,str);

4: while pos(' ==============================',str)=0 do begin
if pos(' --------------------------',str)=0 then begin
str1:=Copy(str,2,length(str));
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
str2:=Copy(str1,1,pos(' ',str1)-1); // Это потенциал ионизации
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));    // Это интенсивность
ip2[k1,s]:=str2;
inten2[k1,s]:=str1;
s:=s+1;
end;
ReadLn(f,str);
end;
if ip1already=true then goto 5;


ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
for i:=0 to 1000 do begin
if ( (pos(' Symmetry  State ',str)<>0) and (pos(' I.P.',str)<>0) and  (pos(' Intensity',str)<>0)) or
(Pos(' =================================',str)<>0) or ( (pos(' Symmetry',str)<>0) and (pos(' Solution Excitation ',str)<>0) and (pos(' moment ',str)<>0) and (pos(' Osc.',str)<>0) ) then Break;
ReadLn(f,str);
end;

if  (pos(' Symmetry',str)<>0) and (pos(' Solution Excitation ',str)<>0) and (pos(' moment ',str)<>0) and (pos(' Osc.',str)<>0)  then goto 8;

if (pos(' Symmetry  State ',str)<>0) and (pos(' I.P.',str)<>0) and  (pos(' Intensity',str)<>0) then begin
SetLength(inten1,k1+1);
SetLength(inten1,k1+1,lmax+1);
SetLength(ip1,k1+1);
SetLength(ip1,k1+1,lmax+1);
for i:=0 to length(ip2[k1])-1 do  begin
ip1[k1,i]:=ip2[k1,i];
inten1[k1,i]:=inten2[k1,i];
end;
ip1already:=true;
ReadLn(f,str);
s:=t;
goto 4;
end;
end;


5:
if (ip1<>nil) and (ip1already=true) then begin
ip1already:=false;
goto 7;
end;


if tempforc<>nil then begin
if length(tempforc)>saccount then begin // Это основное состояние молекулы и все нормально
setlength(forc,k1+1);
setlength(forc,k1+1,lmax+1);
for i:=1 to length(tempforc)-1 do begin
forc[k1,t]:=tempforc[i];
t:=t+1;
end;
end;
if length(tempforc)=saccount then begin // Это не основное состояние молекулы и надо искать ноль
setlength(forc,k1+1);
setlength(forc,k1+1,lmax+1);
for i:=0 to length(tempforc)-1 do begin
forc[k1,t]:=tempforc[i];
t:=t+1;
end;
end;

if  length(tempforc)>saccount then begin
  setlength(energex,k1+1);
  setlength(energex,k1+1,lmax+1);
for i:=0 to saccount-1 do
energex[k1,length(energex[k1])-length(tempforc)+i+1]:=energ[k1,length(energ[k1])-length(tempforc)+i+1];
end;

if length(tempforc)=saccount then begin
  setlength(energex,k1+1);
  setlength(energex,k1+1,lmax+1);
for i:=0 to saccount-1 do
energex[k1,length(energex[k1])-length(tempforc)+i]:=FloatToStr(StrToFloat(energ[k1,length(energ[k1])-length(tempforc)+i])-StrToFloat(energ[k1,length(energ[k1])-length(tempforc)+NoGS]));

end;
end;







if pos(' ****************************************',str)<>0 then begin
ReadLn(f,str);
l:=l+1;
if lmax<l then lmax:=l;
goto 3;
end;




end;       // конец if (pos(' Excitation energy ',str)<>0) and  (pos(' = ',str)<>0) and  (pos('eV',str)<>0) then begin




end;
end;
end;
l:=l+1;
end;
100:

tempforc:=nil;
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////






if Pos('Normal termination of Gaussian',str)<>0 then z_end:=True;


end;    // конец  while not eof(f) do begin

CloseFile(f);


if (nom_ex=nil) and (state=nil) and (energ=nil)  then
begin
  showmessage('Файл '+ Form1.OpenDialog1.FileName+ ' не содержит данных о возбужденных состояниях!');
  goto 0;
end;


if k1>0 then begin
for i:=0 to length(state)-1 do
if state[i,0]<>'' then k1:=i;
end;


if etotsac=nil then begin
setlength(nom_ex,k+1,lmax);
setlength(state,k+1,lmax);
setlength(energ,k+1,lmax);
setlength(wave,k+1,lmax);
setlength(forc,k+1,lmax);
setlength(s2,k+1,lmax);
end
else begin
setlength(state,k1+1,lmax);
setlength(energ,k1+1,lmax);
setlength(wave,k1+1,lmax);
if forc<>nil then  setlength(forc,k1+1,lmax);
setlength(etotsac,k1+1,lmax);
if energex<>nil then  setlength(energex,k1+1,lmax);
if inten1<>nil then  setlength(inten1,k1+1,lmax);
if inten2<>nil then  setlength(inten2,k1+1,lmax);
if ip1<>nil then  setlength(ip1,k1+1,lmax);
if ip2<>nil then  setlength(ip2,k1+1,lmax);
end;




////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog1.FileName) do
if copy(Form1.OpenDialog1.FileName,i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog1.FileName,j+1,100);
////////////////////////////////////////////////////////////////////

ComboBox1.Items.Add(Form1.OpenDialog1.FileName);
ComboBox1.ItemIndex:=0;

Label2.Caption:='Наименование системы: '+task;
if etotsac=nil then Label3.Caption:='Число состояний: '+inttostr(length(nom_ex[0])) else Label3.Caption:='Число состояний: '+inttostr(length(etotsac[0]));

n:=0;
m:=0;
m1:=0;
m2:=0;
m3:=0;
m4:=0;
m5:=0;
m6:=0;
for i:=0 to length(state[length(state)-1])-1 do begin
if pos('Singlet',state[length(state)-1,i])<>0 then n:=n+1;
if pos('Triplet',state[length(state)-1,i])<>0 then m:=m+1;
if pos('CationDoublet',state[length(state)-1,i])<>0 then m1:=m1+1;
if pos('AnionDoublet',state[length(state)-1,i])<>0 then m2:=m2+1;
if pos('Quartet',state[length(state)-1,i])<>0 then m3:=m3+1;
if pos('Quintet',state[length(state)-1,i])<>0 then m4:=m4+1;
if pos('Sextet',state[length(state)-1,i])<>0 then m5:=m5+1;
if pos('Septet',state[length(state)-1,i])<>0 then m6:=m6+1;
end;

Label4.Caption:='     - синглетных: '+inttostr(n);
Label5.Caption:='     - триплетных: '+inttostr(m);

for i:=0 to length(src_route)-1 do begin
if (pos('EOMCCSD',UpperCase(src_route[i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route[i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route[i]))<>0) or (pos('CIS(D)',UpperCase(src_route[i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route[i]))<>0) or (pos('SACCI',UpperCase(src_route[i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route[i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route[i]))<>0) or (pos('CAS(',UpperCase(src_route[i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route[i]))<>0) or (pos('TD=(',UpperCase(src_route[i]))<>0) or (pos(' TD',UpperCase(src_route[i]))<>0) then method:='TD DFT / TD HF';
end;

Label6.Caption:='Использованный метод: '+method;
if z_end=true then  begin
Label7.Font.Color:=clblack;
Label7.Caption:='Результат: Normal termination' ;
end
else  begin
Label7.Font.Color:=clred;
Label7.Caption:='Результат: WARNING! Abnormal termination!'
end;


if method='SAC-CI' then begin
Label8.Font.Color:=clFuchsia;
Label8.Caption:='SAC-CI: высшие состояния';
Label9.Caption:=' - катион-дублеты: '+inttostr(m1);
Label10.Caption:=' - анион-дублеты: '+inttostr(m2);
Label11.Caption:=' - квадруплеты (4): '+inttostr(m3);
Label12.Caption:=' - квинтеты (5): '+inttostr(m4);
Label13.Caption:=' - секстеты (6): '+inttostr(m5);
Label14.Caption:=' - септеты (7): '+inttostr(m6);
if ip1<>nil then SetLength(ip1,length(etotsac),length(etotsac[0]));
if ip2<>nil then SetLength(ip2,length(etotsac),length(etotsac[0]));
if inten1<>nil then SetLength(inten1,length(etotsac),length(etotsac[0]));
if inten2<>nil then SetLength(inten2,length(etotsac),length(etotsac[0]));
end
else begin
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
end;











/// Из-за SAC-CI приходитсмя удалять строки и добавлять
while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

if method<>'SAC-CI' then begin
for i:=0 to 4 do
ListView1.Columns.Add;
if method<>'EOM-CCSD' then ListView1.Columns.Add;
ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=90;
ListView1.Columns.Items[2].Width:=100;
ListView1.Columns.Items[3].Width:=100;
ListView1.Columns.Items[4].Width:=100;
if ListView1.Columns.Count=6 then  ListView1.Columns.Items[5].Width:=80;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[3].Alignment:=taCenter;
ListView1.Columns.Items[4].Alignment:=taCenter;
if ListView1.Columns.Count=6 then ListView1.Columns.Items[5].Alignment:=taCenter;
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='Энергия, эВ';
ListView1.Columns.Items[3].Caption:='Дл. волны, нм';
ListView1.Columns.Items[4].Caption:='Сила осцилл.';
if ListView1.Columns.Count=6 then ListView1.Columns.Items[5].Caption:='S**2';
end;


if method='SAC-CI' then begin

if (ip1<>nil) and (ip2<>nil) then begin
for i:=0 to 10 do
ListView1.Columns.Add;
end;

if (ip1=nil) and (ip2<>nil) then begin
for i:=0 to 8 do
ListView1.Columns.Add;
end;

if (ip1=nil) and (ip2=nil) and (optmod=false) then begin
for i:=0 to 6 do
ListView1.Columns.Add;
end;

if optmod=true then begin
for i:=0 to 4 do
ListView1.Columns.Add;
end;



ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=110;
ListView1.Columns.Items[2].Width:=110;
ListView1.Columns.Items[3].Width:=100;
ListView1.Columns.Items[4].Width:=100;
if ListView1.Columns.Count>5 then ListView1.Columns.Items[5].Width:=100;
if ListView1.Columns.Count>6 then ListView1.Columns.Items[6].Width:=100;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Width:=80;
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Width:=80;
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Width:=80;
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Width:=80;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[3].Alignment:=taCenter;
ListView1.Columns.Items[4].Alignment:=taCenter;
if ListView1.Columns.Count>5 then ListView1.Columns.Items[5].Alignment:=taCenter;
if ListView1.Columns.Count>6 then ListView1.Columns.Items[6].Alignment:=taCenter;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Alignment:=taCenter;
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Alignment:=taCenter;
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Alignment:=taCenter;
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Alignment:=taCenter;
if optmod=false then begin
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='E(tot), X';
ListView1.Columns.Items[3].Caption:='Е(возб.), эВ';
ListView1.Columns.Items[4].Caption:='Е(возб.)*, эВ';
ListView1.Columns.Items[5].Caption:='Дл. волны, нм';
ListView1.Columns.Items[6].Caption:='Сила осцилл.';
end
else begin
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='E(tot), X';
ListView1.Columns.Items[3].Caption:='Е(возб.), эВ';
ListView1.Columns.Items[4].Caption:='Дл. волны, нм';
end;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Caption:='I, о.е.';
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Caption:='ПИ, эВ';
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Caption:='I*, о.е.';
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Caption:='ПИ*, эВ';
end;




// Заполняем ListView:
if method<>'SAC-CI' then begin
for i:=0 to length(nom_ex[length(nom_ex)-1])-1 do begin
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm:=ListView1.Items.Add;
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.Caption:=nom_ex[length(nom_ex)-1,i];
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(state[length(state)-1,i]);
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(energ[length(energ)-1,i]);
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(wave[length(wave)-1,i]);
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(forc[length(forc)-1,i]);
if method<>'EOM-CCSD' then if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(s2[length(s2)-1,i]);
end;
end
else begin
for i:=0 to length(etotsac[length(etotsac)-1])-1 do begin
if  etotsac[length(etotsac)-1,i]<>'' then   itm:=ListView1.Items.Add;
if  etotsac[length(etotsac)-1,i]<>'' then   itm.Caption:=inttostr(i+1);
if  etotsac[length(etotsac)-1,i]<>'' then   itm.SubItems.Append(state[length(state)-1,i]);
if  etotsac[length(etotsac)-1,i]<>'' then   itm.SubItems.Append(etotsac[length(etotsac)-1,i]);
if  etotsac[length(etotsac)-1,i]<>'' then   itm.SubItems.Append(energ[length(energ)-1,i]);
if  (etotsac[length(etotsac)-1,i]<>'') and (optmod=false) then   itm.SubItems.Append(energex[length(energex)-1,i]);
if  etotsac[length(etotsac)-1,i]<>'' then   itm.SubItems.Append(wave[length(wave)-1,i]);
if  (etotsac[length(etotsac)-1,i]<>'') and (optmod=false) then   itm.SubItems.Append(forc[length(forc)-1,i]);
if (ip1<>nil) and (inten1<>nil) and (ip2<>nil) and (inten2<>nil) then begin
if ListView1.Columns.Count>7  then   if  etotsac[length(etotsac)-1,i]<>'' then  if inten1[length(inten1)-1,i]<>'' then itm.SubItems.Append(inten1[length(inten1)-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac[length(etotsac)-1,i]<>'' then  if ip1[length(ip1)-1,i]<>''       then itm.SubItems.Append(ip1[length(ip1)-1,i])       else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>9  then   if  etotsac[length(etotsac)-1,i]<>'' then  if inten2[length(inten2)-1,i]<>'' then itm.SubItems.Append(inten2[length(inten2)-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>10 then   if  etotsac[length(etotsac)-1,i]<>'' then  if ip2[length(ip2)-1,i]<>''       then itm.SubItems.Append(ip2[length(ip2)-1,i])       else  itm.SubItems.Append('@@@');
end;
if (ip1=nil) and (inten1=nil) and (ip2<>nil) and (inten2<>nil) then begin
if ListView1.Columns.Count>7  then   if  etotsac[length(etotsac)-1,i]<>'' then  if inten2[length(inten2)-1,i]<>'' then itm.SubItems.Append(inten2[length(inten2)-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac[length(etotsac)-1,i]<>'' then  if ip2[length(ip2)-1,i]<>''       then itm.SubItems.Append(ip2[length(ip2)-1,i])       else  itm.SubItems.Append('@@@');
end;

end;
end;

Label3.Caption:='Число состояний: '+inttostr(ListView1.Items.Count);


end    // конец  if dial=true


//////////////////OUT-FILES------OUT-FILES-------OUT-FILES


else begin

z_mlt:=nil;
setlength(method_mult,nf);
setlength(z_mlt,nf);
nom_ex_mult:=nil;
state_mult:=nil;
energ_mult:=nil;
wave_mult:=nil;
forc_mult:=nil;
s2_mult:=nil;
etotsac_mult:=nil;
energex_mult:=nil;
inten1_mult:=nil;
inten2_mult:=nil;
ip1_mult:=nil;
ip2_mult:=nil;
kmax:=0;
for j:=0 to nf-1 do  begin
AssignFile(f,Form1.OpenDialog2.Files[j]);
Reset(f);
k:=-1;
k1:=0;
l:=0;
s:=0;
t:=0;
z_mlt[j]:=false;
optmod:=false;
for p:=0 to length(src_route_mult[j])-1 do
if (pos('EOMCCSD',UpperCase(src_route_mult[j,p]))<>0) or (pos('EOM-CCSD',UpperCase(src_route_mult[j,p]))<>0) then method_mult[j]:='EOM-CCSD' ;
while not eof(f) do begin
ReadLn(f,str);

if etotsac_mult<>nil then begin
if (Pos(' Forces (Hartrees/Bohr)',str)<>0) and (Pos(' Atomic',str)<>0) and (etotsac_mult[j]<>nil) then begin
l:=0;
k1:=k1+1;
if kmax<k1 then kmax:=k1;
end;
end;


if lmax<=l then lmax:=l;

if (pos(' Excited State ',str)<>0) and (pos(' nm ',str)<>0) then begin
str1:=copy(str,pos('Excited State',str)+14,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
str2:=copy(str1,i,length(str1));
str3:=copy(str2,1,pos(':',str2)-1);  // Это номер возбужденного состояния
setlength(nom_ex_mult,j+1);
setlength(nom_ex_mult,j+1,kmax+1);
setlength(nom_ex_mult,j+1,kmax+1,lmax+1);
nom_ex_mult[j,k,l]:=str3;
str1:=Copy(str,pos(':',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));      // Строка State-A   285.12 eV ... (дальше с ней работаем)
str3:=Copy(str2,1,pos(' ',str2)-1);
setlength(state_mult,j+1);
setlength(state_mult,j+1,kmax+1);
setlength(state_mult,j+1,kmax+1,lmax+1);
state_mult[j,k,l]:=str3;
str:=str2;          // Присвоиле строке подстроку (для удобства работы)
for i:=0 to length(str) do
if Copy(str,i,1)=' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));      // Строка 285.12 eV  582.12 nm ... (дальше с ней работаем)
str3:=Copy(str2,1,pos(' ',str2)-1);
setlength(energ_mult,j+1);
setlength(energ_mult,j+1,kmax+1);
setlength(energ_mult,j+1,kmax+1,lmax+1);
energ_mult[j,k,l]:=str3;
str:=str2;          // Присвоиле строке подстроку (для удобства работы)
str1:=Copy(str,pos('eV',str)+3,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));      // Строка 582.12 nm ... (дальше с ней работаем)
str3:=Copy(str2,1,pos(' ',str2)-1);
setlength(wave_mult,j+1);
setlength(wave_mult,j+1,kmax+1);
setlength(wave_mult,j+1,kmax+1,lmax+1);
wave_mult[j,k,l]:=str3;
str:=str2;          // Присвоиле строке подстроку (для удобства работы)
str1:=Copy(str,pos('f=',str)+2,length(str));  //  Строка 0.0175  <S**2>=2.000 (дальше с ней работаем)
if pos(' ',str1)<>0 then str2:=Copy(str1,1,pos(' ',str1)-1) else str2:=str1;
setlength(forc_mult,j+1);
setlength(forc_mult,j+1,kmax+1);
setlength(forc_mult,j+1,kmax+1,lmax+1);
forc_mult[j,k,l]:=str2;
str:=str1;
if pos('>=',str)<>0 then str1:=Copy(str,pos('>=',str)+2,length(str)) else str1:='@@@@';
setlength(s2_mult,j+1);
setlength(s2_mult,j+1,kmax+1);
setlength(s2_mult,j+1,kmax+1,lmax+1);
s2_mult[j,k,l]:=str1;
setlength(transit_mult,j+1);
setlength(transit_mult,j+1,kmax+1);
setlength(transit_mult,j+1,kmax+1,lmax+1);
transit_mult[j,k,l]:=TStringList.Create;
ReadLn(f,str);

if method_mult[j]='EOM-CCSD' then begin
While (str<>' ') and (pos(' Ground to excited state transition',str)=0) and (str<>'') do begin
transit_mult[j,k,l].Add(str);
ReadLn(f,str);
end;
goto 10;
end;


                         // Читаем строку после основной строчки с данными о возбужденном состоянии
While {((pos('->',str)<>0) or (pos('<-',str)<>0)) and} (str<>' ') and (str<>'') and (pos(' SavETr: ',str)=0)  do begin
if (pos('->',str)<>0) or (pos('<-',str)<>0) or (pos(' Total Energy',str)<>0) then  transit_mult[j,k,l].Add(str);
ReadLn(f,str);
end;


10:

l:=l+1;
if lmax<l then lmax:=l;
end;     // конец if (pos(' Excited State ',str)<>0) and (pos('S**2',str)<>0) then begin
         // Прочитано одно возбужденное состояние с коэффициентами CI



if pos(' Excitation energies and oscillator strengths:',str)<>0 then begin
k:=k+1;
if kmax<k then kmax:=k;
l:=0;
end;


//////////////////////ДЛЯ SAC-CI НУЖЕН ОТДЕЛЬНЫЙ БЛОК//////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

if (pos(' ENERGY AND WAVE FUNCTION OF SAC-CI METHOD',str)<>0) then begin
ReadLn(f,str);
if pos(' *************************************',str)<>0 then begin
ReadLn(f,str);
if pos(' ********************************************',str)<>0 then begin
ReadLn(f,str);
if pos(' ********************************************',str)<>0 then begin
  saccount:=0;
30: for i:=0 to length(str) do
if Copy(str,i,1)<>' ' then Break;
str1:=Copy(str,i,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str2:=Copy(str1,1,i-1);   // Это слово Singlet, Triplet и т.д.
str3:=Copy(str1,i,length(str1));
for i:=0 to length(str3) do
if Copy(str3,i,1)<>' ' then Break;
str4:=Copy(str3,i,length(str3));
for i:=0 to length(str4) do
if Copy(str4,i,1)=' ' then Break;
str4:=Copy(str4,1,i-1);  // Это неприводимое представление
setlength(state_mult,j+1);
setlength(state_mult,j+1,kmax+1);
setlength(state_mult,j+1,kmax+1,lmax+1);
state_mult[j,k1,l]:=str2+'-'+str4;
ReadLn(f,str);
20:   ReadLn(f,str);  // Это строка содержит полную энергию
if pos('This state is being used for optimizations',str)<>0 then optmod:=true;
if pos(' Total energy ',str)=0 then ReadLn(f,str);
if (pos('Caution',str)<>0) and (pos(' NOT CONVERGED',str)<>0) then begin
for i:=0 to 100 do begin
if (pos('Caution',str)=0) and (pos(' NOT CONVERGED',str)=0) then Break;
ReadLn(f,str);
end;
end;
if pos(' Total energy ',str)=0 then ReadLn(f,str);
if (pos(' Total energy ',str)<>0) and  (pos(' = ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
setlength(etotsac_mult,j+1);
setlength(etotsac_mult,j+1,kmax+1);
setlength(etotsac_mult,j+1,kmax+1,lmax+1);
etotsac_mult[j,k1,l]:=str2;
end;
ReadLn(f,str);
ReadLn(f,str);  // Это строка содержит  энергию возбуждения в эВ
if (pos(' Excitation energy ',str)<>0) and  (pos(' = ',str)<>0) and  (pos('eV',str)<>0) then begin
str1:=Copy(str,pos('eV',str)+2,length(str));
for i:=0 to length(str1) do
if (Copy(str1,i,1)<>' ') and ( Copy(str1,i,1)<>'=') then Break;
str2:=copy(str1,i,length(str1));
setlength(energ_mult,j+1);
setlength(energ_mult,j+1,kmax+1);
setlength(energ_mult,j+1,kmax+1,lmax+1);
energ_mult[j,k1,l]:=FloatToStrF(StrToFloat(str2),ffFixed,8,4);
setlength(wave_mult,j+1);
setlength(wave_mult,j+1,kmax+1);        // Длины волны нет в SAC-CI выдаче, поэтому просто рассчитываем ее
setlength(wave_mult,j+1,kmax+1,lmax+1);
wave_mult[j,k1,l]:=FloatToStrF((6.62607E-34)*299792458*(1E+9)/(1.6021766208E-19*strtofloat(energ_mult[j,k1,l])),ffFixed,8,2);
saccount:=saccount+1;
ReadLn(f,str);
setlength(transit_mult,j+1);
setlength(transit_mult,j+1,kmax+1);
setlength(transit_mult,j+1,kmax+1,lmax+1);
if transit_mult[j,k1,l]=nil then   transit_mult[j,k1,l]:=TStringList.Create;
while (pos(' ### ',str)=0) and (pos(' =================',str)=0) and  (pos(' ****************************************',str)=0) and (pos(' Omega= ',str)=0) do begin
transit_mult[j,k1,l].Add(str);
ReadLn(f,str);
end;
if pos(' ### ',str)<>0 then begin
l:=l+1;
if lmax<l then lmax:=l;
setlength(state_mult,j+1);
setlength(state_mult,j+1,kmax+1);
setlength(state_mult,j+1,kmax+1,lmax+1);
state_mult[j,k1,l]:=state_mult[j,k1,l-1];
goto 20;
end;

if pos(' Omega= ',str)<>0 then begin
l:=l+1;
if lmax<l then lmax:=l;
goto 1000;
end;

if pos(' =================',str)<>0 then begin

if optmod=true then begin
l:=l+1;
if lmax<l then lmax:=l;
goto 1000;
end;


70: ReadLn(f,str);
for i:=0 to 1000 do  begin
if (pos(' Symmetry',str)<>0) and (pos(' Solution Excitation ',str)<>0) and (pos(' moment ',str)<>0) and (pos(' Osc.',str)<>0) then Break;
if (pos(' Symmetry  State ',str)<>0) and (pos(' I.P.',str)<>0) and  (pos(' Intensity',str)<>0) then goto 60;
ReadLn(f,str);
end;
80: ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
while pos(' --------------------------------',str)=0 do begin
if  pos(' Excitations are from this state.',str)=0 then  begin
str1:=Copy(str,pos('.',str)+6,length(str));
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
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));      // Это искомая сила осциллятора
SetLength(tempforc,length(tempforc)+1);
tempforc[length(tempforc)-1]:=str1;
//setlength(forc,k1+1);
//setlength(forc,k1+1,lmax+1);
//forc[k1,t]:=str1;
//t:=t+1;
end;
if  pos(' Excitations are from this state.',str)<>0 then  begin
SetLength(tempforc,length(tempforc)+1);
tempforc[length(tempforc)-1]:='G.S.';            // Ground State
NoGS:=length(tempforc)-1;
end;
ReadLn(f,str);
end;        // конец while pos(' --------------------------------',str)=0 do begin
end;        // конец  if pos(' =================',str)=0) then begin





/////////////////Потенциал ионизации и интенсивность - только для катион-дублета///////////////////////
60: if (pos(' Symmetry  State ',str)<>0) and (pos(' I.P.',str)<>0) and  (pos(' Intensity',str)<>0) then begin

SetLength(inten2_mult,j+1);
SetLength(inten2_mult,j+1,kmax+1);
SetLength(inten2_mult,j+1,kmax+1,lmax+1);
SetLength(ip2_mult,j+1);
SetLength(ip2_mult,j+1,kmax+1);
SetLength(ip2_mult,j+1,kmax+1,lmax+1);
s:=t;
ReadLn(f,str);
ReadLn(f,str);

40: while pos(' ==============================',str)=0 do begin
if pos(' --------------------------',str)=0 then begin
str1:=Copy(str,2,length(str));
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
str2:=Copy(str1,1,pos(' ',str1)-1); // Это потенциал ионизации
for i:=0 to length(str1) do
if Copy(str1,i,1)=' ' then Break;
str1:=Copy(str1,i,length(str1));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str1:=Copy(str1,i,length(str1));    // Это интенсивность
ip2_mult[j,k1,s]:=str2;
inten2_mult[j,k1,s]:=str1;
s:=s+1;
end;
ReadLn(f,str);
end;
if ip1already=true then goto 50;


ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
for i:=0 to 1000 do begin
if ( (pos(' Symmetry  State ',str)<>0) and (pos(' I.P.',str)<>0) and  (pos(' Intensity',str)<>0)) or
(Pos(' =================================',str)<>0) or ( (pos(' Symmetry',str)<>0) and (pos(' Solution Excitation ',str)<>0) and (pos(' moment ',str)<>0) and (pos(' Osc.',str)<>0) ) then Break;
ReadLn(f,str);
end;

if  (pos(' Symmetry',str)<>0) and (pos(' Solution Excitation ',str)<>0) and (pos(' moment ',str)<>0) and (pos(' Osc.',str)<>0)  then goto 80;

if (pos(' Symmetry  State ',str)<>0) and (pos(' I.P.',str)<>0) and  (pos(' Intensity',str)<>0) then begin
SetLength(inten1_mult,j+1);
SetLength(inten1_mult,j+1,kmax+1);
SetLength(inten1_mult,j+1,kmax+1,lmax+1);
SetLength(ip1_mult,j+1);
SetLength(ip1_mult,j+1,kmax+1);
SetLength(ip1_mult,j+1,kmax+1,lmax+1);
for i:=0 to length(ip2_mult[j,kmax])-1 do  begin
ip1_mult[j,k1,i]:=ip2_mult[j,k1,i];
inten1_mult[j,k1,i]:=inten2_mult[j,k1,i];
end;
ip1already:=true;
ReadLn(f,str);
s:=t;
goto 40;
end;
end;


50:
if (ip1_mult<>nil) and (ip1already=true) then begin
if (ip1_mult[j]<>nil) and (ip1already=true) then begin
ip1already:=false;
goto 70;
end;
end;


if tempforc<>nil then begin
if length(tempforc)>saccount then begin // Это основное состояние молекулы и все нормально
setlength(forc_mult,j+1);
setlength(forc_mult,j+1,kmax+1);
setlength(forc_mult,j+1,kmax+1,lmax+1);
for i:=1 to length(tempforc)-1 do begin
forc_mult[j,k1,t]:=tempforc[i];
t:=t+1;
end;
end;
if length(tempforc)=saccount then begin // Это не основное состояние молекулы и надо искать ноль
setlength(forc_mult,j+1);
setlength(forc_mult,j+1,kmax+1);
setlength(forc_mult,j+1,kmax+1,lmax+1);
for i:=0 to length(tempforc)-1 do begin
forc_mult[j,k1,t]:=tempforc[i];
t:=t+1;
end;
end;

if  length(tempforc)>saccount then begin
  setlength(energex_mult,j+1);
  setlength(energex_mult,j+1,kmax+1);
  setlength(energex_mult,j+1,kmax+1,lmax+1);
for i:=0 to saccount-1 do
energex_mult[j,k1,t-length(tempforc)+i+1]:=energ_mult[j,k1,t-length(tempforc)+i+1];
//energex_mult[j,k1,length(energex_mult[j,kmax])-length(tempforc)+i+1]:=energ_mult[j,k1,length(energ_mult[j,kmax])-length(tempforc)+i+1];
end;

if length(tempforc)=saccount then begin
  setlength(energex_mult,j+1);
  setlength(energex_mult,j+1,kmax+1);
  setlength(energex_mult,j+1,kmax+1,lmax+1);
for i:=0 to saccount-1 do
 energex_mult[j,k1,t-length(tempforc)+i]:=FloatToStr(StrToFloat(energ_mult[j,k1,t-length(tempforc)+i])-StrToFloat(energ_mult[j,k1,t-length(tempforc)+NoGS]));
//energex_mult[j,k1,length(energex_mult[j,kmax])-length(tempforc)+i]:=FloatToStr(StrToFloat(energ_mult[j,k1,length(energ_mult[j,kmax])-length(tempforc)+i])-StrToFloat(energ_mult[j,k1,length(energ_mult[j,kmax])-length(tempforc)+NoGS]));

end;
end;







if pos(' ****************************************',str)<>0 then begin
ReadLn(f,str);
l:=l+1;
if lmax<l then lmax:=l;
goto 30;
end;




end;       // конец if (pos(' Excitation energy ',str)<>0) and  (pos(' = ',str)<>0) and  (pos('eV',str)<>0) then begin




end;
end;
end;
l:=l+1;
end;

1000:

tempforc:=nil;
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////






if Pos('Normal termination of Gaussian',str)<>0 then z_mlt[j]:=True;


end;    // конец  while not eof(f) do begin

CloseFile(f);

end;  // закончилось чтение всех файлов - надо basket





setlength(nom_ex_mult,j,kmax+1,lmax);
setlength(state_mult,j,kmax+1,lmax);
setlength(energ_mult,j,kmax+1,lmax);
setlength(wave_mult,j,kmax+1,lmax);
setlength(forc_mult,j,kmax+1,lmax);
setlength(s2_mult,j,kmax+1,lmax);
setlength(etotsac_mult,j,kmax+1,lmax);
setlength(energex_mult,j,kmax+1,lmax);
setlength(inten1_mult,j,kmax+1,lmax);
setlength(inten2_mult,j,kmax+1,lmax);
setlength(ip1_mult,j,kmax+1,lmax);
setlength(ip2_mult,j,kmax+1,lmax);





////////////////////////////////////////////////////////
//////////////Чтение всех файлов закончилось надо BASKET
basket:=nil;

i:=0;
for j:=0 to nf-1 do  begin
if state_mult<>nil then begin
if state_mult[j]<>nil then begin
 if state_mult[j,0]<>nil then begin
if state_mult[j,0,0]<>'' then begin
SetLength(basket,i+1);
basket[i]:=j;
Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
i:=i+1;
end
else  ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных о возбужденных состояниях!');
end
else  begin
ShowMessage('Прочитанные файлы не содержит данных о возбужденных состояниях!');
goto 0;
end;
end
else  begin
ShowMessage('Прочитанные файлы не содержит данных о возбужденных состояниях!');
goto 0;
end;
end;
end;   /////////////// end of Basket

Combobox1.ItemIndex:=0;


////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[0]]) do
if copy(Form1.OpenDialog2.Files[basket[0]],i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog2.Files[basket[0]],j+1,200);
////////////////////////////////////////////////////////////////////


Label2.Caption:='Наименование системы: '+task;



for i:=0 to length(state_mult[basket[0],0])-1 do
if state_mult[basket[0],0,i]='' then break;        // Число не пустых элементов (т.е. сколько реально состояний)
real_num_st:=i;

for i:=0 to length(state_mult[basket[0]])-1 do
if state_mult[basket[0],i,0]='' then break;        // Число не пустых элементов (т.е. сколько реально состояний)
real_num_cy:=i;


Label3.Caption:='Число состояний: '+inttostr(real_num_st);

n:=0;
m:=0;
m1:=0;
m2:=0;
m3:=0;
m4:=0;
m5:=0;
m6:=0;
for i:=0 to length(state_mult[basket[0],real_num_cy-1])-1 do begin
  if i>=real_num_st then break;
if pos('Singlet',state_mult[basket[0],real_num_cy-1,i])<>0 then n:=n+1;
if pos('Triplet',state_mult[basket[0],real_num_cy-1,i])<>0 then m:=m+1;
if pos('CationDoublet',state_mult[basket[0],real_num_cy-1,i])<>0 then m1:=m1+1;
if pos('AnionDoublet',state_mult[basket[0],real_num_cy-1,i])<>0 then m2:=m2+1;
if pos('Quartet',state_mult[basket[0],real_num_cy-1,i])<>0 then m3:=m3+1;
if pos('Quintet',state_mult[basket[0],real_num_cy-1,i])<>0 then m4:=m4+1;
if pos('Sextet',state_mult[basket[0],real_num_cy-1,i])<>0 then m5:=m5+1;
if pos('Septet',state_mult[basket[0],real_num_cy-1,i])<>0 then m6:=m6+1;
end;

Label4.Caption:='     - синглетных: '+inttostr(n);
Label5.Caption:='     - триплетных: '+inttostr(m);



for i:=0 to length(src_route_mult[basket[0]])-1 do begin
if (pos('EOMCCSD',UpperCase(src_route_mult[basket[0],i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route_mult[basket[0],i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route_mult[basket[0],i]))<>0) or (pos('CIS(D)',UpperCase(src_route_mult[basket[0],i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route_mult[basket[0],i]))<>0) or (pos('SACCI',UpperCase(src_route_mult[basket[0],i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route_mult[basket[0],i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route_mult[basket[0],i]))<>0) or (pos('CAS(',UpperCase(src_route_mult[basket[0],i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route_mult[basket[0],i]))<>0) or (pos('TD=(',UpperCase(src_route_mult[basket[0],i]))<>0) or (pos(' TD',UpperCase(src_route_mult[basket[0],i]))<>0) then method:='TD DFT / TD HF';
end;

Label6.Caption:='Использованный метод: '+method;
if z_mlt[basket[0]]=true then  begin
Label7.Font.Color:=clblack;
Label7.Caption:='Результат: Normal termination' ;
end
else  begin
Label7.Font.Color:=clred;
Label7.Caption:='Результат: WARNING! Abnormal termination!'
end;


if method='SAC-CI' then begin
Label8.Font.Color:=clFuchsia;
Label8.Caption:='SAC-CI: высшие состояния';
Label9.Caption:=' - катион-дублеты: '+inttostr(m1);
Label10.Caption:=' - анион-дублеты: '+inttostr(m2);
Label11.Caption:=' - квадруплеты (4): '+inttostr(m3);
Label12.Caption:=' - квинтеты (5): '+inttostr(m4);
Label13.Caption:=' - секстеты (6): '+inttostr(m5);
Label14.Caption:=' - септеты (7): '+inttostr(m6);
if ip1_mult<>nil then if ip1_mult[basket[0]]<>nil then SetLength(ip1_mult,length(etotsac_mult),length(etotsac_mult[0]),length(etotsac_mult[0,0]));
if ip2_mult<>nil then if ip2_mult[basket[0]]<>nil then SetLength(ip2_mult,length(etotsac_mult),length(etotsac_mult[0]),length(etotsac_mult[0,0]));
if inten1_mult<>nil then if inten1_mult[basket[0]]<>nil then SetLength(inten1_mult,length(etotsac_mult),length(etotsac_mult[0]),length(etotsac_mult[0,0]));
if inten2_mult<>nil then if inten2_mult[basket[0]]<>nil then SetLength(inten2_mult,length(etotsac_mult),length(etotsac_mult[0]),length(etotsac_mult[0,0]));
end
else begin
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
end;




/// Из-за SAC-CI приходитсмя удалять строки и добавлять
while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

if method<>'SAC-CI' then begin
for i:=0 to 4 do
ListView1.Columns.Add;
if method<>'EOM-CCSD' then ListView1.Columns.Add;
ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=90;
ListView1.Columns.Items[2].Width:=100;
ListView1.Columns.Items[3].Width:=100;
ListView1.Columns.Items[4].Width:=100;
if ListView1.Columns.Count=6 then  ListView1.Columns.Items[5].Width:=80;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[3].Alignment:=taCenter;
ListView1.Columns.Items[4].Alignment:=taCenter;
if ListView1.Columns.Count=6 then ListView1.Columns.Items[5].Alignment:=taCenter;
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='Энергия, эВ';
ListView1.Columns.Items[3].Caption:='Дл. волны, нм';
ListView1.Columns.Items[4].Caption:='Сила осцилл.';
if ListView1.Columns.Count=6 then ListView1.Columns.Items[5].Caption:='S**2';
end;


if method='SAC-CI' then begin




if (ip1_mult<>nil) and (ip2_mult<>nil) then begin
if (ip1_mult[basket[0]]<>nil) and (ip2_mult[basket[0]]<>nil) then begin
if (ip1_mult[basket[0],0]<>nil) and (ip2_mult[basket[0],0]<>nil) then begin

for i:=0 to length(ip2_mult[basket[0],0])-1 do
if ip2_mult[basket[0],0,i]<>'' then Break;        //В отличие от других данных IP1,IP2 могут начинать повляться не с нулевого элемента
ip_nomer:=i;                                                  //а в середине или в конце массива
if (ip1_mult[basket[0],0,i]<>'') and (ip2_mult[basket[0],0,i]<>'') and (i<length(ip2_mult[basket[0],0])) then begin
for i:=0 to 10 do
ListView1.Columns.Add;
end;
end;
end;
end;



if (ip1_mult<>nil) and (ip2_mult<>nil) then begin
if (ip1_mult[basket[0]]<>nil) and (ip2_mult[basket[0]]<>nil) then begin
if (ip1_mult[basket[0],0]<>nil) and (ip2_mult[basket[0],0]<>nil) then begin

for i:=0 to length(ip2_mult[basket[0],0])-1 do
if ip2_mult[basket[0],0,i]<>'' then Break;      //В отличие от других данных IP1,IP2 могут начинать повляться не с нулевого элемента
ip_nomer:=i;                                                //а в середине или в конце массива

if (ip1_mult[basket[0],0,i]='') and (ip2_mult[basket[0],0,i]<>'') and (i<length(ip2_mult[basket[0],0])) then begin
for i:=0 to 8 do
ListView1.Columns.Add;
end;
end;
end;
end;



if (ip1_mult<>nil) and (ip2_mult<>nil) and (forc_mult<>nil) then begin
if (ip1_mult[basket[0]]<>nil) and (ip2_mult[basket[0]]<>nil) and (forc_mult[basket[0]]<>nil) then begin
if (ip1_mult[basket[0],0]<>nil) and (ip2_mult[basket[0],0]<>nil) and (forc_mult[basket[0],0]<>nil) then begin

for i:=0 to length(ip2_mult[basket[0],0])-1 do
if ip2_mult[basket[0],0,i]<>'' then Break;      //В отличие от других данных IP1,IP2 могут начинать повляться не с нулевого элемента
ip_nomer:=i;                                                //а в середине или в конце массива

if {(ip1_mult[basket[0],0,i-1]='') and (ip2_mult[basket[0],0,i-1]='') and} (forc_mult[basket[0],0,0]<>'') and (i>=length(ip2_mult[basket[0],0])) then begin
for i:=0 to 6 do
ListView1.Columns.Add;
end;
end;
end;
end;



if (ip1_mult<>nil) and (ip2_mult<>nil) and (forc_mult<>nil) then begin
if (ip1_mult[basket[0]]<>nil) and (ip2_mult[basket[0]]<>nil) and (forc_mult[basket[0]]<>nil) then begin
if (ip1_mult[basket[0],0]<>nil) and (ip2_mult[basket[0],0]<>nil) and (forc_mult[basket[0],0]<>nil) then begin

for i:=0 to length(ip2_mult[basket[0],0])-1 do
if ip2_mult[basket[0],0,i]<>'' then Break;      //В отличие от других данных IP1,IP2 могут начинать повляться не с нулевого элемента
ip_nomer:=i;                                                //а в середине или в конце массива

if {(ip1_mult[basket[0],0,i-1]='') and (ip2_mult[basket[0],0,i-1]='') and }(forc_mult[basket[0],0,0]='') and (i>=length(ip2_mult[basket[0],0]))  then begin
for i:=0 to 4 do
ListView1.Columns.Add;
end;
end;
end;
end;



ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=110;
ListView1.Columns.Items[2].Width:=110;
ListView1.Columns.Items[3].Width:=100;
ListView1.Columns.Items[4].Width:=100;
if ListView1.Columns.Count>5 then ListView1.Columns.Items[5].Width:=100;
if ListView1.Columns.Count>6 then ListView1.Columns.Items[6].Width:=100;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Width:=80;
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Width:=80;
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Width:=80;
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Width:=80;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[3].Alignment:=taCenter;
ListView1.Columns.Items[4].Alignment:=taCenter;
if ListView1.Columns.Count>5 then ListView1.Columns.Items[5].Alignment:=taCenter;
if ListView1.Columns.Count>6 then ListView1.Columns.Items[6].Alignment:=taCenter;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Alignment:=taCenter;
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Alignment:=taCenter;
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Alignment:=taCenter;
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Alignment:=taCenter;
if forc_mult<>nil then begin
if forc_mult[basket[0]]<>nil then begin
if forc_mult[basket[0],0]<>nil then begin
if forc_mult[basket[0],0,0]<>'' then begin
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='E(tot), X';
ListView1.Columns.Items[3].Caption:='Е(возб.), эВ';
ListView1.Columns.Items[4].Caption:='Е(возб.)*, эВ';
ListView1.Columns.Items[5].Caption:='Дл. волны, нм';
ListView1.Columns.Items[6].Caption:='Сила осцилл.';
end
else begin
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='E(tot), X';
ListView1.Columns.Items[3].Caption:='Е(возб.), эВ';
ListView1.Columns.Items[4].Caption:='Дл. волны, нм';
end;
end;
end;
end;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Caption:='I, о.е.';
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Caption:='ПИ, эВ';
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Caption:='I*, о.е.';
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Caption:='ПИ*, эВ';
end;



// Заполняем ListView:
if method<>'SAC-CI' then begin
for i:=0 to length(nom_ex_mult[basket[0],real_num_cy-1])-1 do begin
  if i>=real_num_st then Break;
if  nom_ex_mult[basket[0],real_num_cy-1,i]<>'' then   itm:=ListView1.Items.Add;
if  nom_ex_mult[basket[0],real_num_cy-1,i]<>'' then   itm.Caption:=nom_ex_mult[basket[0],real_num_cy-1,i];
if  nom_ex_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(state_mult[basket[0],real_num_cy-1,i]);
if  nom_ex_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(energ_mult[basket[0],real_num_cy-1,i]);
if  nom_ex_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(wave_mult[basket[0],real_num_cy-1,i]);
if  nom_ex_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(forc_mult[basket[0],real_num_cy-1,i]);
if method<>'EOM-CCSD' then if  nom_ex_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(s2_mult[basket[0],real_num_cy-1,i]);
end;
end
else begin
for i:=0 to length(etotsac_mult[basket[0],real_num_cy-1])-1 do begin
if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then   itm:=ListView1.Items.Add;
if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then   itm.Caption:=inttostr(i+1);
if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(state_mult[basket[0],real_num_cy-1,i]);
if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(etotsac_mult[basket[0],real_num_cy-1,i]);
if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(energ_mult[basket[0],real_num_cy-1,i]);
if  (etotsac_mult[basket[0],real_num_cy-1,i]<>'') and (forc_mult[basket[0],real_num_cy-1,i]<>'') then   itm.SubItems.Append(energex_mult[basket[0],real_num_cy-1,i]);
if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then   itm.SubItems.Append(wave_mult[basket[0],real_num_cy-1,i]);
if  (etotsac_mult[basket[0],real_num_cy-1,i]<>'') and (forc_mult[basket[0],real_num_cy-1,i]<>'') then   itm.SubItems.Append(forc_mult[basket[0],real_num_cy-1,i]);
if (ip1_mult<>nil) and (inten1_mult<>nil) and (ip2_mult<>nil) and (inten2_mult<>nil) then begin
if (ip1_mult[basket[0]]<>nil) and (inten1_mult[basket[0]]<>nil) and (ip2_mult[basket[0]]<>nil) and (inten2_mult[basket[0]]<>nil) then begin
if (ip1_mult[basket[0],0]<>nil) and (inten1_mult[basket[0],0]<>nil) and (ip2_mult[basket[0],0]<>nil) and (inten2_mult[basket[0],0]<>nil) then begin
if (ip1_mult[basket[0],0,ip_nomer]<>'') and (ip2_mult[basket[0],0,ip_nomer]<>'') and (inten1_mult[basket[0],0,ip_nomer]<>'') and (inten2_mult[basket[0],0,ip_nomer]<>'')  then begin
if ListView1.Columns.Count>7  then   if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then  if inten1_mult[basket[0],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten1_mult[basket[0],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then  if ip1_mult[basket[0],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip1_mult[basket[0],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>9  then   if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then  if inten2_mult[basket[0],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten2_mult[basket[0],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>10 then   if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then  if ip2_mult[basket[0],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip2_mult[basket[0],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
end;
end;
end;
end;
if (ip1_mult<>nil) and (inten1_mult<>nil) and (ip2_mult<>nil) and (inten2_mult<>nil) then begin
if (ip1_mult[basket[0]]<>nil) and (inten1_mult[basket[0]]<>nil) and (ip2_mult[basket[0]]<>nil) and (inten2_mult[basket[0]]<>nil) then begin
if (ip1_mult[basket[0],0]<>nil) and (inten1_mult[basket[0],0]<>nil) and (ip2_mult[basket[0],0]<>nil) and (inten2_mult[basket[0],0]<>nil) then begin
if (ip1_mult[basket[0],0,ip_nomer]='') and (ip2_mult[basket[0],0,ip_nomer]<>'') and (inten1_mult[basket[0],0,ip_nomer]='') and (inten2_mult[basket[0],0,ip_nomer]<>'')  then begin
if ListView1.Columns.Count>7  then   if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then  if inten2_mult[basket[0],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten2_mult[basket[0],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac_mult[basket[0],real_num_cy-1,i]<>'' then  if ip2_mult[basket[0],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip2_mult[basket[0],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
end;
end;
end;
end;


end;
end;

Label3.Caption:='Число состояний: '+inttostr(ListView1.Items.Count);

end;



0:
end;

procedure TForm52.ListView1DblClick(Sender: TObject);
var i: integer;
s: widestring;
begin
if ListView1<>nil then begin
if ListView1.Selected<>nil then begin
if ListView1.Items[ListView1.ItemIndex].Selected then begin
Form53.Memo1.Clear;
form53.Show;
if dial=true then begin
For i:=0 to transit[length(transit)-1,ListView1.ItemIndex].Count-1 do
Form53.Memo1.Lines.Add(transit[length(transit)-1,ListView1.ItemIndex][i]);
end
else begin
For i:=0 to transit_mult[basket[Combobox1.ItemIndex],real_num_cy-1,ListView1.ItemIndex].Count-1 do
Form53.Memo1.Lines.Add(transit_mult[basket[Combobox1.ItemIndex],real_num_cy-1,ListView1.ItemIndex][i]);
end;






end;
end;
end;
end;

procedure TForm52.FormCreate(Sender: TObject);
begin
Label2.Caption:='';
Label3.Caption:='';
Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
end;

procedure TForm52.ComboBox1Change(Sender: TObject);
var task: widestring;
j,i,m,n,m1,m2,m3,m4,m5,m6,real_num_st,ip_nomer: integer;
method: string;
itm: TListItem;
label 0;
begin
ListView1.Clear;

if Combobox1.Items.Count<2 then goto 0;



////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]]) do
if copy(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]],i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]],j+1,200);
////////////////////////////////////////////////////////////////////


Label2.Caption:='Наименование системы: '+task;



for i:=0 to length(state_mult[basket[Combobox1.ItemIndex],0])-1 do
if state_mult[basket[Combobox1.ItemIndex],0,i]='' then break;        // Число не пустых элементов (т.е. сколько реально состояний)
real_num_st:=i;

for i:=0 to length(state_mult[basket[Combobox1.ItemIndex]])-1 do
if state_mult[basket[Combobox1.ItemIndex],i,0]='' then break;        // Число не пустых элементов (т.е. сколько реально состояний)
real_num_cy:=i;


Label3.Caption:='Число состояний: '+inttostr(real_num_st);

n:=0;
m:=0;
m1:=0;
m2:=0;
m3:=0;
m4:=0;
m5:=0;
m6:=0;
for i:=0 to length(state_mult[basket[Combobox1.ItemIndex],real_num_cy-1])-1 do begin
  if i>=real_num_st then break;
if pos('Singlet',state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i])<>0 then n:=n+1;
if pos('Triplet',state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i])<>0 then m:=m+1;
if pos('CationDoublet',state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i])<>0 then m1:=m1+1;
if pos('AnionDoublet',state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i])<>0 then m2:=m2+1;
if pos('Quartet',state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i])<>0 then m3:=m3+1;
if pos('Quintet',state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i])<>0 then m4:=m4+1;
if pos('Sextet',state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i])<>0 then m5:=m5+1;
if pos('Septet',state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i])<>0 then m6:=m6+1;
end;

Label4.Caption:='     - синглетных: '+inttostr(n);
Label5.Caption:='     - триплетных: '+inttostr(m);



for i:=0 to length(src_route_mult[basket[Combobox1.ItemIndex]])-1 do begin
if (pos('EOMCCSD',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) or (pos('CIS(D)',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) or (pos('SACCI',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) or (pos('CAS(',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) or (pos('TD=(',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) or (pos(' TD',UpperCase(src_route_mult[basket[Combobox1.ItemIndex],i]))<>0) then method:='TD DFT / TD HF';
end;

Label6.Caption:='Использованный метод: '+method;
if z_mlt[basket[Combobox1.ItemIndex]]=true then  begin
Label7.Font.Color:=clblack;
Label7.Caption:='Результат: Normal termination' ;
end
else  begin
Label7.Font.Color:=clred;
Label7.Caption:='Результат: WARNING! Abnormal termination!'
end;



if method='SAC-CI' then begin
Label8.Font.Color:=clFuchsia;
Label8.Caption:='SAC-CI: высшие состояния';
Label9.Caption:=' - катион-дублеты: '+inttostr(m1);
Label10.Caption:=' - анион-дублеты: '+inttostr(m2);
Label11.Caption:=' - квадруплеты (4): '+inttostr(m3);
Label12.Caption:=' - квинтеты (5): '+inttostr(m4);
Label13.Caption:=' - секстеты (6): '+inttostr(m5);
Label14.Caption:=' - септеты (7): '+inttostr(m6);
if ip1_mult<>nil then if ip1_mult[basket[Combobox1.ItemIndex]]<>nil then SetLength(ip1_mult,length(etotsac_mult),length(etotsac_mult[0]),length(etotsac_mult[0,0]));
if ip2_mult<>nil then if ip2_mult[basket[Combobox1.ItemIndex]]<>nil then SetLength(ip2_mult,length(etotsac_mult),length(etotsac_mult[0]),length(etotsac_mult[0,0]));
if inten1_mult<>nil then if inten1_mult[basket[Combobox1.ItemIndex]]<>nil then SetLength(inten1_mult,length(etotsac_mult),length(etotsac_mult[0]),length(etotsac_mult[0,0]));
if inten2_mult<>nil then if inten2_mult[basket[Combobox1.ItemIndex]]<>nil then SetLength(inten2_mult,length(etotsac_mult),length(etotsac_mult[0]),length(etotsac_mult[0,0]));
end
else begin
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
end;




/// Из-за SAC-CI приходитсмя удалять строки и добавлять
while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

if method<>'SAC-CI' then begin
for i:=0 to 4 do
ListView1.Columns.Add;
if method<>'EOM-CCSD' then ListView1.Columns.Add;
ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=90;
ListView1.Columns.Items[2].Width:=100;
ListView1.Columns.Items[3].Width:=100;
ListView1.Columns.Items[4].Width:=100;
if ListView1.Columns.Count=6 then  ListView1.Columns.Items[5].Width:=80;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[3].Alignment:=taCenter;
ListView1.Columns.Items[4].Alignment:=taCenter;
if ListView1.Columns.Count=6 then ListView1.Columns.Items[5].Alignment:=taCenter;
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='Энергия, эВ';
ListView1.Columns.Items[3].Caption:='Дл. волны, нм';
ListView1.Columns.Items[4].Caption:='Сила осцилл.';
if ListView1.Columns.Count=6 then ListView1.Columns.Items[5].Caption:='S**2';
end;




      
if method='SAC-CI' then begin

if (ip1_mult<>nil) and (ip2_mult<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex],0]<>nil) then begin

for i:=0 to length(ip2_mult[basket[Combobox1.ItemIndex],0])-1 do
if ip2_mult[basket[Combobox1.ItemIndex],0,i]<>'' then Break;        //В отличие от других данных IP1,IP2 могут начинать повляться не с нулевого элемента
ip_nomer:=i;                                                  //а в середине или в конце массива
if (ip1_mult[basket[Combobox1.ItemIndex],0,i]<>'') and (ip2_mult[basket[Combobox1.ItemIndex],0,i]<>'') and (i<length(ip2_mult[basket[Combobox1.ItemIndex],0])) then begin
for i:=0 to 10 do
ListView1.Columns.Add;
end;
end;
end;
end;



if (ip1_mult<>nil) and (ip2_mult<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex],0]<>nil) then begin

for i:=0 to length(ip2_mult[basket[Combobox1.ItemIndex],0])-1 do
if ip2_mult[basket[Combobox1.ItemIndex],0,i]<>'' then Break;      //В отличие от других данных IP1,IP2 могут начинать повляться не с нулевого элемента
ip_nomer:=i;                                                //а в середине или в конце массива

if (ip1_mult[basket[Combobox1.ItemIndex],0,i]='') and (ip2_mult[basket[Combobox1.ItemIndex],0,i]<>'') and (i<length(ip2_mult[basket[Combobox1.ItemIndex],0])) then begin
for i:=0 to 8 do
ListView1.Columns.Add;
end;
end;
end;
end;



if (ip1_mult<>nil) and (ip2_mult<>nil) and (forc_mult<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex]]<>nil) and (forc_mult[basket[Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex],0]<>nil) and (forc_mult[basket[Combobox1.ItemIndex],0]<>nil) then begin

for i:=0 to length(ip2_mult[basket[Combobox1.ItemIndex],0])-1 do
if ip2_mult[basket[Combobox1.ItemIndex],0,i]<>'' then Break;      //В отличие от других данных IP1,IP2 могут начинать повляться не с нулевого элемента
ip_nomer:=i;                                                //а в середине или в конце массива

if {(ip1_mult[basket[0],0,i-1]='') and (ip2_mult[basket[0],0,i-1]='') and} (forc_mult[basket[Combobox1.ItemIndex],0,0]<>'') and (i>=length(ip2_mult[basket[Combobox1.ItemIndex],0])) then begin
for i:=0 to 6 do
ListView1.Columns.Add;
end;
end;
end;
end;



if (ip1_mult<>nil) and (ip2_mult<>nil) and (forc_mult<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex]]<>nil) and (forc_mult[basket[Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex],0]<>nil) and (forc_mult[basket[Combobox1.ItemIndex],0]<>nil) then begin

for i:=0 to length(ip2_mult[basket[Combobox1.ItemIndex],0])-1 do
if ip2_mult[basket[Combobox1.ItemIndex],0,i]<>'' then Break;      //В отличие от других данных IP1,IP2 могут начинать повляться не с нулевого элемента
ip_nomer:=i;                                                //а в середине или в конце массива

if {(ip1_mult[basket[0],0,i-1]='') and (ip2_mult[basket[0],0,i-1]='') and }(forc_mult[basket[Combobox1.ItemIndex],0,0]='') and (i>=length(ip2_mult[basket[Combobox1.ItemIndex],0]))  then begin
for i:=0 to 4 do
ListView1.Columns.Add;
end;
end;
end;
end;



ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=110;
ListView1.Columns.Items[2].Width:=110;
ListView1.Columns.Items[3].Width:=100;
ListView1.Columns.Items[4].Width:=100;
if ListView1.Columns.Count>5 then ListView1.Columns.Items[5].Width:=100;
if ListView1.Columns.Count>6 then ListView1.Columns.Items[6].Width:=100;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Width:=80;
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Width:=80;
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Width:=80;
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Width:=80;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[3].Alignment:=taCenter;
ListView1.Columns.Items[4].Alignment:=taCenter;
if ListView1.Columns.Count>5 then ListView1.Columns.Items[5].Alignment:=taCenter;
if ListView1.Columns.Count>6 then ListView1.Columns.Items[6].Alignment:=taCenter;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Alignment:=taCenter;
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Alignment:=taCenter;
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Alignment:=taCenter;
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Alignment:=taCenter;
if forc_mult<>nil then begin
if forc_mult[basket[Combobox1.ItemIndex]]<>nil then begin
if forc_mult[basket[Combobox1.ItemIndex],0]<>nil then begin
if forc_mult[basket[Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='E(tot), X';
ListView1.Columns.Items[3].Caption:='Е(возб.), эВ';
ListView1.Columns.Items[4].Caption:='Е(возб.)*, эВ';
ListView1.Columns.Items[5].Caption:='Дл. волны, нм';
ListView1.Columns.Items[6].Caption:='Сила осцилл.';
end
else begin
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Тип';
ListView1.Columns.Items[2].Caption:='E(tot), X';
ListView1.Columns.Items[3].Caption:='Е(возб.), эВ';
ListView1.Columns.Items[4].Caption:='Дл. волны, нм';
end;
end;
end;
end;
if ListView1.Columns.Count>7 then ListView1.Columns.Items[7].Caption:='I, о.е.';
if ListView1.Columns.Count>8 then ListView1.Columns.Items[8].Caption:='ПИ, эВ';
if ListView1.Columns.Count>9 then ListView1.Columns.Items[9].Caption:='I*, о.е.';
if ListView1.Columns.Count>10 then ListView1.Columns.Items[10].Caption:='ПИ*, эВ';
end;



// Заполняем ListView:
if method<>'SAC-CI' then begin
for i:=0 to length(nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1])-1 do begin
  if i>=real_num_st then Break;
if  nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm:=ListView1.Items.Add;
if  nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.Caption:=nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i];
if  nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if  nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(energ_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if  nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(wave_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if  nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(forc_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if method<>'EOM-CCSD' then if  nom_ex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(s2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
end;
end
else begin
for i:=0 to length(etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1])-1 do begin
if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm:=ListView1.Items.Add;
if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.Caption:=inttostr(i+1);
if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(state_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(energ_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if  (etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'') and (forc_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'') then   itm.SubItems.Append(energex_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(wave_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if  (etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'') and (forc_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'') then   itm.SubItems.Append(forc_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]);
if (ip1_mult<>nil) and (inten1_mult<>nil) and (ip2_mult<>nil) and (inten2_mult<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex]]<>nil) and (inten1_mult[basket[Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex]]<>nil) and (inten2_mult[basket[Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex],0]<>nil) and (inten1_mult[basket[Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex],0]<>nil) and (inten2_mult[basket[Combobox1.ItemIndex],0]<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex],0,ip_nomer]<>'') and (ip2_mult[basket[Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten1_mult[basket[Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten2_mult[basket[Combobox1.ItemIndex],0,ip_nomer]<>'')  then begin
if ListView1.Columns.Count>7  then   if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if inten1_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten1_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if ip1_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip1_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>9  then   if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if inten2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>10 then   if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if ip2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
end;
end;
end;
end;
if (ip1_mult<>nil) and (inten1_mult<>nil) and (ip2_mult<>nil) and (inten2_mult<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex]]<>nil) and (inten1_mult[basket[Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex]]<>nil) and (inten2_mult[basket[Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex],0]<>nil) and (inten1_mult[basket[Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Combobox1.ItemIndex],0]<>nil) and (inten2_mult[basket[Combobox1.ItemIndex],0]<>nil) then begin
if (ip1_mult[basket[Combobox1.ItemIndex],0,ip_nomer]='') and (ip2_mult[basket[Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten1_mult[basket[Combobox1.ItemIndex],0,ip_nomer]='') and (inten2_mult[basket[Combobox1.ItemIndex],0,ip_nomer]<>'')  then begin
if ListView1.Columns.Count>7  then   if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if inten2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if ip2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip2_mult[basket[Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
end;
end;
end;
end;


end;
end;

Label3.Caption:='Число состояний: '+inttostr(ListView1.Items.Count);























0:
end;

procedure TForm52.BitBtn2Click(Sender: TObject);
begin
Form54.Show;
end;

procedure TForm52.BitBtn1Click(Sender: TObject);
var method: string;
i: integer;
label 0;
begin
if dial=true then begin

for i:=0 to length(src_route)-1 do begin
if (pos('EOMCCSD',UpperCase(src_route[i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route[i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route[i]))<>0) or (pos('CIS(D)',UpperCase(src_route[i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route[i]))<>0) or (pos('SACCI',UpperCase(src_route[i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route[i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route[i]))<>0) or (pos('CAS(',UpperCase(src_route[i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route[i]))<>0) or (pos('TD=(',UpperCase(src_route[i]))<>0) or (pos(' TD',UpperCase(src_route[i]))<>0) then method:='TD DFT / TD HF';
end;

if (method='SAC-CI') and (Form52.ListView1.Columns.Count<6) then begin
showmessage('Команда не доступна для эволюционных расчетов SAC-CI');
goto 0;
end;
end
else begin


for i:=0 to length(src_route_mult[basket[Form52.Combobox1.ItemIndex]])-1 do begin
if (pos('EOMCCSD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('CIS(D)',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('SACCI',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('CAS(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('TD=(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos(' TD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='TD DFT / TD HF';
end;

//for i:=0 to  length(wave_mult[basket[Form52.ComboBox1.ItemIndex]])-1 do
//if  wave_mult[basket[Form52.ComboBox1.ItemIndex],i,0]='' then Break;


if (method='SAC-CI') and (Form52.ListView1.Columns.Count<6) then begin
showmessage('Команда не доступна для эволюционных расчетов SAC-CI');
goto 0;
end;








end;











Form56.Show;
0:
end;

procedure TForm52.BitBtn3Click(Sender: TObject);
var f: TextFile;
i,j: integer;
aver: double;
probel,a,d,e: WideString;
begin
probel:='                                                                         ';
if SaveDialog1.Execute then begin
if  pos('.txt',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.txt';
AssignFile(f,a);
Rewrite(f);
WriteLn(f,' **************************************************************');
WriteLn(f,' *                      Excited states:                       *');
WriteLn(f,' *           Symmetry, exitation energy, wavelengths          *');
WriteLn(f,' *                   and oscilator strength                   *');
WriteLn(f,' *    (CIS, CIS(D), EOM-CCSD, ZINDO, TDDFT/TDHF and SAC-CI)   *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                          Magellan                          *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,' File: ' +Combobox1.Items[Combobox1.ItemIndex]);
WriteLn(f,' Method: ' + Copy(Label6.Caption,pos(':',Label6.Caption)+2,length(Label6.Caption)));
WriteLn(f,' Quantity of states: ' + Copy(Label3.Caption,pos(':',Label3.Caption)+2,length(Label3.Caption)));
WriteLn(f,' ******** Singlets: ' + Copy(Label4.Caption,pos(':',Label4.Caption)+2,length(Label4.Caption)));
WriteLn(f,' ******** Triplets: ' + Copy(Label5.Caption,pos(':',Label5.Caption)+2,length(Label5.Caption)));
if  Copy(Label6.Caption,pos(':',Label6.Caption)+2,length(Label6.Caption))='SAC-CI' then begin
WriteLn(f,' ******** Cation-Doublets: ' + Copy(Label9.Caption,pos(':',Label9.Caption)+2,length(Label9.Caption)));
WriteLn(f,' ******** Anion-Doublets: ' + Copy(Label10.Caption,pos(':',Label10.Caption)+2,length(Label10.Caption)));
WriteLn(f,' ******** Quartets: ' + Copy(Label11.Caption,pos(':',Label11.Caption)+2,length(Label11.Caption)));
WriteLn(f,' ******** Quintets: ' + Copy(Label12.Caption,pos(':',Label12.Caption)+2,length(Label12.Caption)));
WriteLn(f,' ******** Sextets: ' + Copy(Label13.Caption,pos(':',Label13.Caption)+2,length(Label13.Caption)));
WriteLn(f,' ******** Septets: ' + Copy(Label14.Caption,pos(':',Label14.Caption)+2,length(Label14.Caption)));
end;
WriteLn(f,' Result: ' + Copy(Label7.Caption,pos(':',Label7.Caption)+2,length(Label7.Caption)));


WriteLn(f,'');
WriteLn(f,'');
Write(f,'   ');
for i:=0 to ListView1.Columns.Count-1 do   begin
if pos('№',ListView1.Column[i].Caption)<>0 then Write(f, '№           ');
if (pos('волны',ListView1.Column[i].Caption)<>0) and (i<ListView1.Columns.Count-1) then Write(f, 'WL, nm         ');
if (pos('волны',ListView1.Column[i].Caption)<>0) and (i=ListView1.Columns.Count-1) then Write(f, '    WL, nm');
if pos('Энергия',ListView1.Column[i].Caption)<>0 then Write(f, 'Eex, eV      ');
if (pos('осцил',ListView1.Column[i].Caption)<>0) and  (i=ListView1.Columns.Count-1) then Write(f, 'F');
if (pos('осцил',ListView1.Column[i].Caption)<>0) and  (i<ListView1.Columns.Count-1) then Write(f, 'F        ');
if pos('S**2',ListView1.Column[i].Caption)<>0  then Write(f, '  S**2');
if pos('Тип',ListView1.Column[i].Caption)<>0  then Write(f, 'Type         ');
if pos('E(tot)',ListView1.Column[i].Caption)<>0  then Write(f, 'Etot, a.u.     ');
if pos('Е(возб.),',ListView1.Column[i].Caption)<>0  then Write(f, 'Eex, eV    ');
if pos('Е(возб.)*',ListView1.Column[i].Caption)<>0  then Write(f, 'Eex(*), eV     ');
if pos('I,',ListView1.Column[i].Caption)<>0  then Write(f, 'I, a.u.   ');
if pos('I*,',ListView1.Column[i].Caption)<>0  then Write(f, 'I(*), a.u.  ');
if pos('ПИ,',ListView1.Column[i].Caption)<>0  then Write(f, 'IP, eV   ');
if pos('ПИ*,',ListView1.Column[i].Caption)<>0  then Write(f, 'IP(*), eV');
end;



WriteLn(f,'');

for i:=0 to ListView1.Items.Count-1 do begin
Write(f, copy(probel,1,4-length(ListView1.Items[i].Caption))+ListView1.Items[i].Caption);
for j:=0 to ListView1.Columns.Count-2 do  begin
if j=0 then Write(f,copy(probel,1,18-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
if (pos('Евозб',ListView1.Columns[j+1].Caption)<>0) or  (pos('Энергия',ListView1.Columns[j+1].Caption)<>0) or (pos('Е(возб',ListView1.Columns[j+1].Caption)<>0)  then Write(f,copy(probel,1,12-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
if (pos('волны',ListView1.Columns[j+1].Caption)<>0) then Write(f,copy(probel,1,13-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
if (pos('Сила',ListView1.Columns[j+1].Caption)<>0) then Write(f,copy(probel,1,13-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
if (pos('S**2',ListView1.Columns[j+1].Caption)<>0) then Write(f,copy(probel,1,12-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
if (pos('E(tot)',ListView1.Columns[j+1].Caption)<>0) then Write(f,copy(probel,1,16-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
if (pos('I,',ListView1.Columns[j+1].Caption)<>0) or (pos('ПИ,',ListView1.Columns[j+1].Caption)<>0) or (pos('I*,',ListView1.Columns[j+1].Caption)<>0) then Write(f,copy(probel,1,10-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
if (pos('ПИ*,',ListView1.Columns[j+1].Caption)<>0) then Write(f,copy(probel,1,11-length(ListView1.Items[i].SubItems[j])) + ListView1.Items[i].SubItems[j]);
end;
WriteLn(f,'');
end;





WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,' **** END **** / '+Datetostr(Now)+' /');








CloseFIle(f);
end;

end;

procedure TForm52.BitBtn4Click(Sender: TObject);
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
if pos('Тип',ListView1.Columns[i].Caption)<>0 then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 18;     //#
if (pos('Энергия',ListView1.Columns[i].Caption)<>0) or (pos('возб',ListView1.Columns[i].Caption)<>0) then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 14;     //#
if pos('волны',ListView1.Columns[i].Caption)<>0  then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 15;     //#
if pos('tot',ListView1.Columns[i].Caption)<>0  then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 14;     //#
if pos('осцил',ListView1.Columns[i].Caption)<>0 then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 14;     //#
if pos('I',ListView1.Columns[i].Caption)<>0  then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 12;     //#
if pos('ПИ',ListView1.Columns[i].Caption)<>0  then  MSExcel.ActiveWorkbook.ActiveSheet.Columns[i+2].ColumnWidth := 12;     //#
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
