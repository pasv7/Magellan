unit Unit49;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Math, Gauges, ComObj, OleServer, ExcelXP, ActiveX;

type
  TForm49 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListView1: TListView;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ComboBox2: TComboBox;
    Label17: TLabel;
    BitBtn5: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form49: TForm49;
  trj,trjn: integer;
  trj_mult,trjn_mult: array of integer;
  stpmax,nmax1: integer;
  escfreal_mult: array of double;
  ekin_mult,epot_mult,etot_mult,escf_mult: array of array of string;
  escfbomd_mult: array of array of array of string;
  maxsteps_mult,timestep_mult: array of widestring;
  stepdyn_mult: array of integer;
  z_mlt: array of boolean;
  ekinbomd_mult,epotbomd_mult,etotbomd_mult: array of array of array of string;
  stepdynbomd_mult: array of array of Integer;
  timebomd_mult: array of array of array of string;
  sett: TStringList;
  sett_mult: array of TStringList;
  ekin,epot,etot,escf: array of string;
  timestep: widestring;
  escfreal: array of double;
  ekinbomd,epotbomd,etotbomd,escfbomd: array of array of string;
  stepdynbomd: array of integer;
  timebomd: array of array of string;
  maxsteps,stepdyn: widestring;
  z_fin: boolean;
  start_of_new_trj: array of integer;
  fb_mult: array of string;

implementation

uses Unit1, Unit12, Unit24, Unit36, Unit37, Unit44, Unit50, Unit51, Unit18;

{$R *.dfm}

procedure TForm49.FormCreate(Sender: TObject);
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
Label15.Caption:='';
Label16.Caption:='';
end;

procedure TForm49.FormShow(Sender: TObject);
var f: textfile;
i,j,k,l,m,m1,n,in_: integer;      //in_ - counter of input orientation for boundariew between trj in xout,yout,etc
str,str1,str2,str3,task,fb: widestring;
aver: double;
Rea: boolean;
itm: TListItem;
label 0;
begin
ListView1.Clear;
Combobox1.Clear;
Combobox2.Clear;
Rea:=false;
fb:='';
Combobox2.Enabled:=True;
z_fin:=false;
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
Label15.Caption:='';
Label16.Caption:='';
sett:=nil;
sett_mult:=nil;
in_:=0;
start_of_new_trj:=nil;
////////////////////////////Очистка  глобальных переменных IRC,Opt,Scan,,,
//Opt
  step:=nil;
  energy:=nil;
  delta:=nil;
  step_mult:=nil;
  energy_mult:=nil;
  delta_mult:=nil;
  Nsteps:=nil;
  z_found:=nil;
//Scan
  Great:=False;
  Little:=False;
  en_for_st:=nil;
  timed:=False;
  pressed:='';
  stepcount_mult:=nil;
  type_of_scan_mult:=nil;
  z_mult:=nil;
  energyscan_mult:=nil;
  allenergy_mult:=nil;
  initialval_mult:=nil;
  stepsize_mult:=nil;
  scanpoint_mult:=nil;
  scanpoint_r_mult:=nil;
  rvar:=0;
  stepcount:=nil;
  scanpoint:=nil;
  energyscan:=nil;
  allenergy:=nil;
  initialval:=nil;
  stepsize:=nil;
  aver:=0;
  type_of_scan:=False;
  zrez:=False;
  counter_cy:=0;
  counter_po:=0;
//IRC
  step_irc_path1:=nil;
  step_irc_path2:=nil;
  energy_irc_path1:=nil;
  energy_irc_path2:=nil;
  energy_irc_path2b:=nil;
  delta_irc_path1:=nil;
  delta_irc_path2:=nil;
  raznost_irc:=nil;
  step_irc_path2b:=nil;
  step_mult_irc_path1:=nil;
  step_mult_irc_path2:=nil;
  energy_mult_irc_path1:=nil;
  energy_mult_irc_path2:=nil;
  delta_mult_irc_path1:=nil;
  delta_mult_irc_path2:=nil;
  raznost_mult_irc:=nil;
  energy_mult_irc_path2b:=nil;
  step_mult_irc_path2b:=nil;
  nsteps_f:=nil;
  nsteps_r:=nil;
  nsteps_f_st:=nil;
  nsteps_r_st:=nil;
  direction1:='';
  direction2:='';
  direction1_mult:=nil;
  direction2_mult:=nil;
  irc_found:=nil;
  task_mult:=nil;
  npath1_mult:=nil;
  npath2_mult:=nil;
  irc_fin:=nil;
  modi2:=nil;
  Rx:=nil;
  Rx_show:=nil;
  Rx_mult:=nil;
  Rx_mult_show:=nil;

//////////////////////////////

if dial=true then begin
  ekin:=nil;
  epot:=nil;
  etot:=nil;
  escf:=nil;
  escfreal:=nil;
  stepdynbomd:=nil;
  timebomd:=nil;
  maxsteps:='';
  stepdyn:='';
  z_fin:=false;
if Form1.OpenDialog1.FilterIndex=1 then goto 0;
AssignFile(f,Form1.OpenDialog1.Filename);
Reset(f);
trj:=0;
trjn:=0;
stpmax:=0;
sett:=TStringList.Create;
while not eof(f) do begin
ReadLn(f,str);


/////////////////////////////////////////////////////////
if pb=nil then pb:= TGauge.Create(Form1.Statusbar1);
with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='ADMP/BOMD';
Parent:= Form1.Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
if (trj=0) and (trjn=0) then begin
if stepdyn='' then pb.Progress:=0 else pb.Progress:=Round(strtoint(stepdyn)/(nomer_cycla)*100);
end
else begin
if stepdynbomd<>nil then begin
 if stepdynbomd[Combobox2.ItemIndex]<>0 then pb.Progress:=Round(in_/(nomer_cycla)*100);
end;
end;
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-3;
   Width:= Form1.StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;
////////////////////////////////////////////////////////


{
//////////////////////ADMP CONDITIONS/////////////////////////
if pos(' General parameters:',str)<>0 then sett.Add(str);
if pos(' Maximum Steps ',str)<>0 then sett.Add(str);
if pos(' Random Number Generator Seed ',str)<>0 then sett.Add(str);
if pos(' Time Step ',str)<>0 then sett.Add(str);
if pos(' Ficticious electronic mass ',str)<>0 then sett.Add(str);
if pos(' MW individual basis funct. ',str)<>0 then sett.Add(str);
if pos(' Initial nuclear kin. energy ',str)<>0 then sett.Add(str);
if pos(' Initial electr. kin. energy ',str)<>0 then sett.Add(str);
if pos(' Initial electr. KE scheme ',str)<>0 then sett.Add(str);
if pos(' Multitime step - NDtrC ',str)<>0 then sett.Add(str);
if pos(' Multitime step - NDtrP ',str)<>0 then sett.Add(str);
if pos(' control nuclear temperature',str)<>0 then
begin
sett.Add(str);
sett.Add('');
end;
if pos(' Thermostat chosen for nuclear motion',str)<>0 then sett.Add(str);
if pos(' Thermostat temperature ',str)<>0 then sett.Add(str);
if pos(' Thermostat range ',str)<>0 then
begin
sett.Add(str);
sett.Add('');
end;
if pos(' Integration parameters:',str)<>0 then
begin
sett.Add(str);
if trj=0 then  sett.Add('');
end;
if pos(' Follow Rxn Path ',str)<>0 then sett.Add(str);
if pos(' Read in converged density',str)<>0 then sett.Add(str);
if pos(' Constraint Scheme ',str)<>0 then sett.Add(str);
if pos(' Projection of angular mom. ',str)<>0 then sett.Add(str);
if pos(' Rotate density with nuclei ',str)<>0 then sett.Add(str);

//////////////////////END OF ADMP CONDITIONS/////////////////////////

//////////////////////BOMD CONDITIONS////////////////////////////////
if pos(' Max. points for each Traj',str)<>0 then sett.Add(str);
if pos(' Total Number of Trajectories ',str)<>0 then sett.Add(str);
if pos(' Trajectory Step Size ',str)<>0 then
begin
sett.Add(str);
sett.Add('');
end;
if pos(' Sampling parameters:',str)<>0 then sett.Add(str);
if pos(' Vib Energy Sampling Option ',str)<>0 then sett.Add(str);
if pos(' TS Sampling direction ',str)<>0 then sett.Add(str);
if pos(' Vib Sampling Temperature ',str)<>0 then sett.Add(str);
if pos(' Rot Energy Sampling Option ',str)<>0 then sett.Add(str);
if pos(' Rot Sampling Temperature ',str)<>0 then sett.Add(str);
if pos(' Start point scaling criteria ',str)<>0 then
begin
sett.Add(str);
sett.Add('');
end;
if pos(' Correction Scheme ',str)<>0 then sett.Add(str);
if pos(' Project trans/rot in grad',str)<>0 then sett.Add(str);
if pos(' Project in prediction step ',str)<>0 then sett.Add(str);
if pos(' Project in correction step ',str)<>0 then sett.Add(str);
if pos(' Integration Scheme ',str)<>0 then sett.Add(str);
if pos(' Integration Step Size ',str)<>0 then sett.Add(str);
if pos(' Truncation Error Criteria ',str)<>0 then sett.Add(str);
if pos(' Energy Error Criteria ',str)<>0 then sett.Add(str);
if pos(' Hessian evaluation ',str)<>0 then sett.Add(str);
///////////////////////END OF BOMD CONDITIONS///////////////////////
}

if pos(' ------------------',str)<>0 then Rea:=False;

if (pos(' INPUT DATA FOR L118',str)<>0) or (pos(' INPUT DATA FOR L121',str)<>0) then begin
  ReadLn(f,str);
  ReadLn(f,str);
  ReadLn(f,str);
  Rea:=True;
end;

if Rea=True then sett.Add(str);






////ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP

if pos(' Maximum Steps ',str)<>0 then  begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
maxsteps:=copy(str1,i,length(str1));
end;
if pos(' Time Step ',str)<>0 then  begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
str2:=copy(str1,i,length(str1));
for i:=0 to length(str2) do
if copy(str2,i,1)=' ' then Break;
timestep:=copy(str2,1,i-1);
fb:='фс';
end;
if pos(' ADMP step ',str)<>0 then begin
str1:= Copy(str,pos('ADMP step',str)+9,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then break;
stepdyn:=copy(str1,i,length(str1));
end;

////BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD

if Pos(' Max. points for each Traj. ',str)<>0 then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
maxsteps:=copy(str1,i,length(str1));
end;
if Pos(' Total Number of Trajectories ',str)<>0 then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
trj:=strtoint(copy(str1,i,length(str1)));
end;
if Pos(' Trajectory Step Size ',str)<>0 then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
timestep:=copy(str2,1,pos(' ',str2)-1);
fb:='sqrt(а.е.)*Бор';
end;
if Pos(' Trajectory Number ',str)<>0 then begin
str1:=Copy(str,pos(' Trajectory Number ',str)+19,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
trjn:=strtoint(copy(str2,1,pos(' ',str2)-1));
end;
if (pos(' Step Number ',str)<>0) and (pos('-',str)=0) then begin
str1:= Copy(str,pos(' Step Number ',str)+13,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then break;
setlength(stepdynbomd,trjn);
stepdynbomd[trjn-1]:=strtoint(copy(str1,i,length(str1)));
end;
if (trj<>0) and (trjn<>0) then begin
if pos(' Time (fs) ',str)<>0 then begin
str1:= Copy(str,pos(' Time (fs) ',str)+11,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then break;
setlength(timebomd,trjn);
setlength(timebomd,trjn,MaxIntValue(stepdynbomd));
if pos(' Kinetic (au)',str1)=0 then timebomd[trjn-1,stepdynbomd[trjn-1]-1]:=copy(str1,i,length(str1));
end;
end;
if Pos(' Predicted information for step ',str)<>0 then begin
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
end;




if (Pos(' EKin ',str)<>0) and (pos(' EPot ',str)<>0) and (pos(' ETot ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if (copy(str2,i,1)=';') or (copy(str2,i,1)=' ') then Break;
if (trj=0) and (trjn=0) then begin
setlength(ekin,length(ekin)+1);
ekin[length(ekin)-1]:=Copy(str2,1,i-1);
end
else begin
setlength(ekinbomd,trjn);
setlength(ekinbomd,trjn,MaxIntValue(stepdynbomd));
ekinbomd[trjn-1,stepdynbomd[trjn-1]-1]:=Copy(str2,1,i-1);
{
if trjn=1 then begin
setlength(ekinbomd,trjn,length(ekinbomd[trjn-1])+1);
ekinbomd[trjn-1,length(ekinbomd[0])-1]:=Copy(str2,1,i-1);
stpmax:=length(ekinbomd[trjn-1])+1;
end;
if trjn>1 then begin
if stpmax>length(ekinbomd[trjn-1])+1 then setlength(ekinbomd,trjn,stpmax) else  begin
setlength(ekinbomd,trjn,length(ekinbomd[trjn-1])+1) ;
stpmax:=length(ekinbomd[trjn-1])+1;
end;
if length(ekinbomd[trjn-1])>stpmax then stpmax:=length(ekinbomd[trjn-1]);
ekinbomd[trjn-1,length(ekinbomd[trjn-1])-1]:=Copy(str2,1,i-1);
end;  }

end;
str1:=copy(str, pos('EPot',str)+5,length(str));
for i:=0 to length(str1) do
if (Copy(str1,i,1)<>' ') and  (Copy(str1,i,1)<>'=') then break;
str2:=copy(str1,i,length(str1));
for i:=0 to length(str2) do
if (copy(str2,i,1)=';') or (copy(str2,i,1)=' ') then Break;
if (trj=0) and (trjn=0) then begin
setlength(epot,length(epot)+1);
epot[length(epot)-1]:=Copy(str2,1,i-1);
end
else begin
setlength(epotbomd,trjn);
setlength(epotbomd,trjn,MaxIntValue(stepdynbomd));
epotbomd[trjn-1,stepdynbomd[trjn-1]-1]:=Copy(str2,1,i-1);
end;
str1:=copy(str, pos('ETot',str)+5,length(str));
for i:=0 to length(str1) do
if (Copy(str1,i,1)<>' ') and  (Copy(str1,i,1)<>'=') then break;
str2:=copy(str1,i,length(str1));
if (trj=0) and (trjn=0) then begin
setlength(etot,length(etot)+1);
etot[length(etot)-1]:=str2;
end
else begin
setlength(etotbomd,trjn);
setlength(etotbomd,trjn,MaxIntValue(stepdynbomd));
etotbomd[trjn-1,stepdynbomd[trjn-1]-1]:=Copy(str2,1,pos(' ',str2)-1);
end;
end;


if pos(ISZ,str)<>0 then in_:=in_+1;
if pos(' Start new trajectory calculation ',str)<>0 then begin
  setlength(start_of_new_trj,length(start_of_new_trj)+1);
  start_of_new_trj[length(start_of_new_trj)-1]:=in_+1;
end;





if (pos(' SCF Done: ',str)<>0) or (pos(' Energy= ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);
if (trj=0) and (trjn=0) then begin
setlength(escf,length(escf)+1);
escf[length(escf)-1]:=str3;
end
else begin
if trjn=0 then begin
setlength(escfbomd,1);
setlength(escfbomd,1,1);
escfbomd[0,0]:=str3;
end;
if (trj>0) and (trjn>0) then begin                                                                   //if trjn=0 then trjx:=1 else trjx:=trjn;
setlength(escfbomd,trjn);
setlength(escfbomd,trjn,MaxIntValue(stepdynbomd)+1);
//setlength(escfbomd,trjn,length(etotbomd[0]));
if (trjn>1) and (stepdynbomd[trjn-1]=1) then escfbomd[trjn-1,stepdynbomd[trjn-1]-1]:=Copy(str2,1,i-1);
escfbomd[trjn-1,stepdynbomd[trjn-1]]:=str3;
if escfbomd[length(escfbomd)-1,MaxIntValue(stepdynbomd)]='' then setlength(escfbomd,trjn,MaxIntValue(stepdynbomd));
if length(escfbomd[trjn-1])>2 then begin
  if escfbomd[trjn-1,stepdynbomd[trjn-1]-1]='' then escfbomd[trjn-1,stepdynbomd[trjn-1]-1]:=escfbomd[trjn-1,stepdynbomd[trjn-1]-2];
end;
end;
end;
end;

if Pos('Normal termination of Gaussian',str)<>0 then z_fin:=True;

end;

CloseFile(f);
if (ekin=nil) and (epot=nil) and (etot=nil) and (ekinbomd=nil) and (epotbomd=nil) and (etotbomd=nil) then
begin
  showmessage('Файл не содержит данных молекулярной динамики!');
  goto 0;
end;


if (trj<>0) and (trjn<>0) then begin
 setlength(start_of_new_trj,length(start_of_new_trj)+1);
 start_of_new_trj[length(start_of_new_trj)-1]:=start_of_new_trj[length(start_of_new_trj)-2]+stepdynbomd[length(stepdynbomd)-1]-1;
end;



if (trj=0) and (trjn=0) then begin
setlength(escfreal,length(escf));
for i:=0 to length(escf)-1 do
if escf[i]<>'' then escfreal[i]:=StrToFloat(escf[i]);
end
else begin
setlength(escfreal,length(escfbomd[0]));
for i:=0 to length(escfbomd[0])-1 do
if escfbomd[0,i]<>'' then escfreal[i]:=StrToFloat(escfbomd[0,i]);
end;


for i:=0 to length(escfreal)-1 do
if escfreal[i]=0 then Break;
if i>0 then SetLength(escfreal,i);    // Обрезка нулей в случае чего



Combobox1.Items.Add(Form1.OpenDialog1.FileName);
Combobox1.ItemIndex:=0;

if (trj<>0) and (trjn<>0) then  begin
for i:=1 to trjn do
Combobox2.Items.Add('TRJ ' +inttostr(i));
Combobox2.ItemIndex:=0;
end
else  begin
Combobox2.Items.Add('TRJ 1');
Combobox2.ItemIndex:=0;
Combobox2.Enabled:=False;
end;


////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog1.FileName) do
if copy(Form1.OpenDialog1.FileName,i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog1.FileName,j+1,100);
////////////////////////////////////////////////////////////////////

Label2.Caption:='Наименование системы: '+task;
if (trj=0) and (trjn=0) then  Label3.Caption:='Молекулярная динамика: ADMP' else Label3.Caption:='Молекулярная динамика: BOMD';
if (trj=0) and (trjn=0) then  Label4.Caption:='Общее число шагов, задано / исполнено: ' +maxsteps+' / '+stepdyn
else Label4.Caption:='Число траекторий, задано / исполнено: ' +inttostr(trj)+' / '+inttostr(trjn);

if (trj=0) and (trjn=0) then  Label5.Caption:='Временное разрешение: '+timestep +' '+fb
else Label5.Caption:='Величина шага: '+timestep +' '+fb;
if z_fin=true then  begin
Label6.Font.Color:=clblack;
Label6.Caption:='Результат: Normal termination' ;
end
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='Результат: Dynamic calculation not finished!'
end;

aver:=0;
for i:=0 to Length(escfreal)-1 do
aver:=aver+escfreal[i];
aver:=aver/length(escfreal);

Label7.Caption:='Emax = '+floattostr(MaxValue(escfreal));
Label8.Caption:='Emin = '+floattostr(MinValue(escfreal));
Label9.Caption:='Eaver = '+floattostrf(aver,ffFixed,10,10);
Label10.Caption:='Emax-Emin = '+floattostrf(((MaxValue(escfreal)-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label11.Caption:='Emax-Eaver = '+floattostrf(((MaxValue(escfreal)-aver)*27.21*23.06),ffFixed,5,3) + ' ккал';
Label12.Caption:='Eaver-Emin = '+floattostrf(((aver-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label13.Caption:='Einf-Emin = '+ floattostrf(((escfreal[Length(escfreal)-1]-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label14.Caption:='Emax-Einf = '+ floattostrf(((MaxValue(escfreal) - escfreal[Length(escfreal)-1])*27.21*23.06),ffFixed,5,3) + ' ккал';
Label15.Caption:='E0-Emin = '+ floattostrf(((escfreal[0]-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label16.Caption:='Emax-E0 = '+ floattostrf(((MaxValue(escfreal) - escfreal[0])*27.21*23.06),ffFixed,5,3) + ' ккал';

//Заполняем ListView1

if (trj=0) and (trjn=0) then begin
for i:=0 to strtoint(stepdyn) do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i);
itm.SubItems.Append(floattostrf(i*strtofloat(timestep),ffFixed,8,3));
itm.SubItems.Append(ekin[i]);
itm.SubItems.Append(epot[i]);
itm.SubItems.Append(etot[i]);
itm.SubItems.Append(escf[i]);
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal[i]-escfreal[i-1])*27.2116*23.06,ffFixed,8,4));
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal[i]-escfreal[0])*27.2116*23.06,ffFixed,8,4));
end;
end
else begin
for i:=0 to stepdynbomd[0]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i);
itm.SubItems.Append(timebomd[0,i]);
itm.SubItems.Append(ekinbomd[0,i]);
itm.SubItems.Append(epotbomd[0,i]);
itm.SubItems.Append(etotbomd[0,i]);
itm.SubItems.Append(escfbomd[0,i]);
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal[i]-escfreal[i-1])*27.2116*23.06,ffFixed,8,4));
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal[i]-escfreal[0])*27.2116*23.06,ffFixed,8,4));
end;
ListView1.Items.Delete(0);
end;

/////////////////////////Определим границы перехода из одной траектории в другую///////////////////
//////////////////Это надо для того, чтобы эти границы обозначить в модели/////////////////////////
//////////////////Имеется ввиду границы в координатах//////////////////////////////////////////////
//start_of_new_trj:=nil;
//l:=0;
//for i:=2 to length(xout)-1 do
//if (xout[i,1]=xout[2,1]) and (yout[i,1]=yout[2,1]) and (zout[i,1]=zout[2,1])  then begin
//setlength(start_of_new_trj,l+1);
//start_of_new_trj[l]:=i;
//l:=l+1;
//end;
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////






Form1.StatusBar1.Panels[0].Text:='Ready';
pb.Visible:=false;
Form1.StatusBar1.Panels[1].Text:=inttostr(nomer_atoma)+' atoms; '+ inttostr(nomer_cycla) +' cycles';

end

///  multiple output     multiple output     multiple output     multiple output
///  multiple output     multiple output     multiple output     multiple output
///  multiple output     multiple output     multiple output     multiple output
///  multiple output     multiple output     multiple output     multiple output
///  multiple output     multiple output     multiple output     multiple output
///  multiple output     multiple output     multiple output     multiple output

else begin
escfreal_mult:=nil;
ekin_mult:=nil;
epot_mult:=nil;
etot_mult:=nil;
escf_mult:=nil;
escfbomd_mult:=nil;
maxsteps_mult:=nil;
timestep_mult:=nil;
stepdyn_mult:=nil;
stepdynbomd_mult:=nil;
z_mlt:=nil;
ekinbomd_mult:=nil;
epotbomd_mult:=nil;
etotbomd_mult:=nil;
fb_mult:=nil;
Setlength(z_mlt,nf);
SetLength(maxsteps_mult,nf);
SetLength(timestep_mult,nf);
SetLength(stepdyn_mult,nf);
SetLength(sett_mult,nf);
SetLength(fb_mult,nf);
m:=0;
n:=0;
l:=0;
stpmax:=0;
nmax1:=0;
trj_mult:=nil;
trjn_mult:=nil;
SetLength(trj_mult,nf);
SetLength(trjn_mult,nf);
for j:=0 to nf-1 do  begin
  n:=0;
  l:=0;
AssignFile(f,Form1.OpenDialog2.Files[j]);
z_mlt[j]:=false;
Reset(f);
trj_mult[j]:=0;
trjn_mult[j]:=0;
sett_mult[j]:=TStringList.Create;
while not eof(f) do begin
ReadLn(f,str);


/////////////////////////////////////////////////////////
if pb=nil then pb:= TGauge.Create(Form1.Statusbar1);

with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='ADMP/BOMD';
Parent:= Form1.Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
pb.Progress:=Round(((j+1)/nf)*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-3;
   Width:= Form1.StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;
////////////////////////////////////////////////////////

{

///////////////////////////////ADMP CONDITIONS//////////////////////////////////
if pos(' General parameters:',str)<>0 then sett_mult[j].Add(str);
if pos(' Maximum Steps ',str)<>0 then sett_mult[j].Add(str);
if pos(' Random Number Generator Seed ',str)<>0 then sett_mult[j].Add(str);
if pos(' Time Step ',str)<>0 then sett_mult[j].Add(str);
if pos(' Ficticious electronic mass ',str)<>0 then sett_mult[j].Add(str);
if pos(' MW individual basis funct. ',str)<>0 then sett_mult[j].Add(str);
if pos(' Initial nuclear kin. energy ',str)<>0 then sett_mult[j].Add(str);
if pos(' Initial electr. kin. energy ',str)<>0 then sett_mult[j].Add(str);
if pos(' Initial electr. KE scheme ',str)<>0 then sett_mult[j].Add(str);
if pos(' Multitime step - NDtrC ',str)<>0 then sett_mult[j].Add(str);
if pos(' Multitime step - NDtrP ',str)<>0 then sett_mult[j].Add(str);
if pos(' control nuclear temperature',str)<>0 then
begin sett_mult[j].Add(str);
sett_mult[j].Add('');
end;
if pos(' Thermostat chosen for nuclear motion',str)<>0 then sett_mult[j].Add(str);
if pos(' Thermostat temperature ',str)<>0 then sett_mult[j].Add(str);
if pos(' Thermostat range ',str)<>0 then
begin
sett_mult[j].Add(str);
sett_mult[j].Add('');
end;
if pos(' Integration parameters:',str)<>0 then
begin
sett_mult[j].Add(str);
if trj_mult[j]=0 then  sett_mult[j].Add('');
end;
if pos(' Follow Rxn Path ',str)<>0 then sett_mult[j].Add(str);
if pos(' Read in converged density',str)<>0 then sett_mult[j].Add(str);
if pos(' Constraint Scheme ',str)<>0 then sett_mult[j].Add(str);
if pos(' Projection of angular mom. ',str)<>0 then sett_mult[j].Add(str);
if pos(' Rotate density with nuclei ',str)<>0 then sett_mult[j].Add(str);

//////////////////////END OF ADMP CONDITIONS/////////////////////////

//////////////////////BOMD CONDITIONS////////////////////////////////
if pos(' Max. points for each Traj',str)<>0 then sett_mult[j].Add(str);
if pos(' Total Number of Trajectories ',str)<>0 then sett_mult[j].Add(str);
if pos(' Trajectory Step Size ',str)<>0 then
begin
sett_mult[j].Add(str);
sett_mult[j].Add('');
end;
if pos(' Sampling parameters:',str)<>0 then sett_mult[j].Add(str);
if pos(' Vib Energy Sampling Option ',str)<>0 then sett_mult[j].Add(str);
if pos(' TS Sampling direction ',str)<>0 then sett_mult[j].Add(str);
if pos(' Vib Sampling Temperature ',str)<>0 then sett_mult[j].Add(str);
if pos(' Rot Energy Sampling Option ',str)<>0 then sett_mult[j].Add(str);
if pos(' Rot Sampling Temperature ',str)<>0 then sett_mult[j].Add(str);
if pos(' Start point scaling criteria ',str)<>0 then
begin
sett_mult[j].Add(str);
sett_mult[j].Add('');
end;
if pos(' Correction Scheme ',str)<>0 then sett_mult[j].Add(str);
if pos(' Project trans/rot in grad',str)<>0 then sett_mult[j].Add(str);
if pos(' Project in prediction step ',str)<>0 then sett_mult[j].Add(str);
if pos(' Project in correction step ',str)<>0 then sett_mult[j].Add(str);
if pos(' Integration Scheme ',str)<>0 then sett_mult[j].Add(str);
if pos(' Integration Step Size ',str)<>0 then sett_mult[j].Add(str);
if pos(' Truncation Error Criteria ',str)<>0 then sett_mult[j].Add(str);
if pos(' Energy Error Criteria ',str)<>0 then sett_mult[j].Add(str);
if pos(' Hessian evaluation ',str)<>0 then sett_mult[j].Add(str);
///////////////////////END OF BOMD CONDITIONS///////////////////////

}


if pos(' ------------------',str)<>0 then Rea:=False;

if (pos(' INPUT DATA FOR L118',str)<>0) or (pos(' INPUT DATA FOR L121',str)<>0) then begin
  ReadLn(f,str);
  ReadLn(f,str);
  ReadLn(f,str);
  Rea:=True;
end;

if Rea=True then sett_mult[j].Add(str);





////ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP-ADMP
if pos(' Maximum Steps ',str)<>0 then  begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
maxsteps_mult[j]:=copy(str1,i,length(str1));
end;
if pos(' Time Step ',str)<>0 then  begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
str2:=copy(str1,i,length(str1));
for i:=0 to length(str2) do
if copy(str2,i,1)=' ' then Break;
timestep_mult[j]:=copy(str2,1,i-1);
fb_mult[j]:='фс';
end;
if pos(' ADMP step ',str)<>0 then begin
str1:= Copy(str,pos('ADMP step',str)+9,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then break;
stepdyn_mult[j]:=strtoint(copy(str1,i,length(str1)));
if nmax1=0 then nmax1:=1;
if nmax1<=MaxIntValue(stepdyn_mult) then nmax1:=MaxIntValue(stepdyn_mult)+1;
end;


////BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD-BOMD

if Pos(' Max. points for each Traj. ',str)<>0 then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
maxsteps_mult[j]:=copy(str1,i,length(str1));
end;
if Pos(' Total Number of Trajectories ',str)<>0 then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
trj_mult[j]:=strtoint(copy(str1,i,length(str1)));
end;
if Pos(' Trajectory Step Size ',str)<>0 then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
timestep_mult[j]:=copy(str2,1,pos(' ',str2)-1);
fb_mult[j]:='sqrt(а.е.)*Бор';
end;
if Pos(' Trajectory Number ',str)<>0 then begin
str1:=Copy(str,pos(' Trajectory Number ',str)+19,length(str));
for i:=0 to length(str1) do
if copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
trjn_mult[j]:=strtoint(copy(str2,1,pos(' ',str2)-1));
end;
if (pos(' Step Number ',str)<>0) and (pos('-',str)=0) then begin
str1:= Copy(str,pos(' Step Number ',str)+13,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then break;
setlength(stepdynbomd_mult,nf,MaxIntValue(trjn_mult));
stepdynbomd_mult[j,trjn_mult[j]-1]:=strtoint(copy(str1,i,length(str1)));
if stpmax<MaxIntValue(stepdynbomd_mult[j]) then stpmax:= MaxIntValue(stepdynbomd_mult[j]);
end;
if (trj_mult[j]<>0) and (trjn_mult[j]<>0) then begin
if pos(' Time (fs) ',str)<>0 then begin
str1:= Copy(str,pos(' Time (fs) ',str)+11,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then break;
setlength(timebomd_mult,nf,MaxIntValue(trjn_mult));
setlength(timebomd_mult,nf,MaxIntValue(trjn_mult),stpmax);
if pos(' Kinetic (au)',str1)=0 then timebomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]-1]:=copy(str1,i,length(str1));
end;
end;
if Pos(' Predicted information for step ',str)<>0 then begin
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
end;


//=========================ENERGY=============================================================

if (Pos(' EKin ',str)<>0) and (pos(' EPot ',str)<>0) and (pos(' ETot ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if (copy(str2,i,1)=';') or (copy(str2,i,1)=' ') then Break;
if (trj_mult[j]=0) and (trjn_mult[j]=0) then begin
setlength(ekin_mult,nf);
if nmax1>0 then setlength(ekin_mult,nf,nmax1) else  setlength(ekin_mult,nf,1);
//if n+1<=m then setlength(ekin_mult[j],m) else  setlength(ekin_mult[j],n+1);    //zakomm.
ekin_mult[j,n]:=Copy(str2,1,i-1);    //zakomm.
end
else begin
setlength(ekinbomd_mult,nf);
setlength(ekinbomd_mult,nf,MaxIntValue(trjn_mult));
setlength(ekinbomd_mult,nf,MaxIntValue(trjn_mult),stpmax);
ekinbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]-1]:=Copy(str2,1,i-1);
end;

str1:=copy(str, pos('EPot',str)+5,length(str));
for i:=0 to length(str1) do
if (Copy(str1,i,1)<>' ') and  (Copy(str1,i,1)<>'=') then break;
str2:=copy(str1,i,length(str1));
for i:=0 to length(str2) do
if (copy(str2,i,1)=';') or (copy(str2,i,1)=' ') then Break;
if (trj_mult[j]=0) and (trjn_mult[j]=0) then begin
setlength(epot_mult,nf);
if nmax1>0 then setlength(epot_mult,nf,nmax1) else  setlength(epot_mult,nf,1);
epot_mult[j,n]:=Copy(str2,1,i-1);
end
else begin
//if n+1<=m then setlength(epot_mult[j],m) else  setlength(epot_mult[j],n+1);
//epot_mult[j,n]:=Copy(str2,1,i-1);
setlength(epotbomd_mult,nf);
setlength(epotbomd_mult,nf,MaxIntValue(trjn_mult));
setlength(epotbomd_mult,nf,MaxIntValue(trjn_mult),stpmax);
epotbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]-1]:=Copy(str2,1,i-1);
end;

str1:=copy(str, pos('ETot',str)+5,length(str));
for i:=0 to length(str1) do
if (Copy(str1,i,1)<>' ') and  (Copy(str1,i,1)<>'=') then break;
str2:=copy(str1,i,length(str1));
if (trj_mult[j]=0) and (trjn_mult[j]=0) then begin
setlength(etot_mult,nf);
if nmax1>0 then setlength(etot_mult,nf,nmax1) else  setlength(etot_mult,nf,1);
etot_mult[j,n]:=str2;
end
else begin
setlength(etotbomd_mult,nf);
setlength(etotbomd_mult,nf,MaxIntValue(trjn_mult));
setlength(etotbomd_mult,nf,MaxIntValue(trjn_mult),stpmax);
etotbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]-1]:=Copy(str2,1,pos(' ',str2)-1);
end;
//setlength(etot_mult,j+1);
//if n+1<=m then setlength(etot_mult[j],m) else  setlength(etot_mult[j],n+1);
//etot_mult[j,n]:=str2;
  n:=n+1;
end;


if (pos(' SCF Done: ',str)<>0) or (pos(' Energy= ',str)<>0) then begin
str1:=Copy(str,pos('=',str)+1,length(str));
for i:=0 to length(str1) do
if Copy(str1,i,1)<>' ' then Break;
str2:=Copy(str1,i,length(str1));
for i:=0 to length(str2) do
if Copy(str2,i,1)=' ' then Break;
str3:=Copy(str2,1,i-1);
if (trj_mult[j]=0) and (trjn_mult[j]=0) then begin
setlength(escf_mult,nf);
setlength(escf_mult,nf,nmax1+1);
escf_mult[j,n]:=Copy(str2,1,i-1);
end
else begin
setlength(escfbomd_mult,nf);
if MaxIntValue(trjn_mult)=0 then  setlength(escfbomd_mult,nf,MaxIntValue(trjn_mult)+1)
else setlength(escfbomd_mult,nf,MaxIntValue(trjn_mult));
if MaxIntValue(trjn_mult)=0 then   setlength(escfbomd_mult,nf,MaxIntValue(trjn_mult)+1,stpmax+1)
else setlength(escfbomd_mult,nf,MaxIntValue(trjn_mult),stpmax+1);
if (trjn_mult[j]>1) and (stepdynbomd_mult[j,trjn_mult[j]-1]=1) then escfbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]-1]:=Copy(str2,1,i-1);
if stepdynbomd_mult<>nil then begin
if trjn_mult[j]>0 then  escfbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]]:=Copy(str2,1,i-1)
else escfbomd_mult[j,trjn_mult[j],0]:=Copy(str2,1,i-1);
if trjn_mult[j]>0 then begin
if length(escfbomd_mult[j,trjn_mult[j]-1])>2 then begin
  if (escfbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]-1]='') and (escfbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]]<>'') then escfbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]-1]:=escfbomd_mult[j,trjn_mult[j]-1,stepdynbomd_mult[j,trjn_mult[j]-1]-2];
end
end;
end
else escfbomd_mult[j,trjn_mult[j],0]:=Copy(str2,1,i-1);
if escfbomd_mult[j,length(escfbomd_mult[j])-1,stpmax]='' then setlength(escfbomd_mult,nf,MaxIntValue(trjn_mult),stpmax);
end;
//setlength(escf_mult,j+1);
//if l+1<=m1 then setlength(escf_mult[j],m1) else  setlength(escf_mult[j],l+1);
//escf_mult[j,l]:=Copy(str2,1,i-1);
l:=l+1;
end;

if Pos('Normal termination of Gaussian',str)<>0 then z_mlt[j]:=True;


end;
CloseFile(f);
///if m<length(ekin_mult[j]) then m:=length(ekin_mult[j]);
///if m1<length(escf_mult[j]) then m1:=length(escf_mult[j]);

end;


//////////////Чтение всех файлов закончилось надо BASKET
basket:=nil;

i:=0;
for j:=0 to nf-1 do  begin
  if  (maxsteps_mult<>nil) and (timestep_mult<>nil) then begin
if (maxsteps_mult[j]<>'') and (timestep_mult[j]<>'') then begin
  if ekin_mult<>nil then begin
  if ekin_mult[j,0]<>'' then begin
SetLength(basket,i+1);
basket[i]:=j;
Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
i:=i+1;
end;
end;
if  ekinbomd_mult<>nil then begin
if ekinbomd_mult[j,0,0]<>'' then begin
SetLength(basket,i+1);
basket[i]:=j;
Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
i:=i+1;
end;
end;
end
else  ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных молекулярной динамики!');
end
else  begin
ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных молекулярной динамики!');
goto 0;
end;
end;

ComboBox1.ItemIndex:=0;

if (trj_mult[basket[0]]=0) and (trjn_mult[basket[0]]=0) then  begin
setlength(escfreal_mult,length(escf_mult[basket[0]]));
for i:=0 to length(escf_mult[basket[0]])-1 do
if escf_mult[basket[0],i]<>'' then escfreal_mult[i]:=StrToFloat(escf_mult[basket[0],i]);
end
else begin
setlength(escfreal_mult,length(escfbomd_mult[basket[0],0]));
for i:=0 to length(escfbomd_mult[basket[0],0])-1 do
if escfbomd_mult[basket[0],0,i]<>'' then escfreal_mult[i]:=StrToFloat(escfbomd_mult[basket[0],0,i]);
end;

for i:=0 to length(escfreal_mult)-1 do
if escfreal_mult[i]=0 then Break;
if i>0 then SetLength(escfreal_mult,i);    // Обрезка нулей в случае чего


if (trj_mult[basket[0]]<>0) and (trjn_mult[basket[0]]<>0) then  begin
for i:=1 to trjn_mult[basket[0]] do
Combobox2.Items.Add('TRJ ' +inttostr(i));
Combobox2.ItemIndex:=0;
end
else  begin
Combobox2.Items.Add('TRJ 1');
Combobox2.ItemIndex:=0;
Combobox2.Enabled:=False;
end;



////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[0]]) do
if copy(Form1.OpenDialog2.Files[basket[0]],i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog2.Files[basket[0]],j+1,100);
////////////////////////////////////////////////////////////////////

Label2.Caption:='Наименование системы: '+task;
if (trj_mult[basket[0]]=0) and (trjn_mult[basket[0]]=0) then  Label3.Caption:='Молекулярная динамика: ADMP' else Label3.Caption:='Молекулярная динамика: BOMD';
if (trj_mult[basket[0]]=0) and (trjn_mult[basket[0]]=0) then  Label4.Caption:='Общее число шагов, задано / исполнено: ' +maxsteps_mult[basket[0]]+' / '+inttostr(stepdyn_mult[basket[0]])
else Label4.Caption:='Общее число траекторий, задано / исполнено: ' + inttostr(trj_mult[basket[0]])+' / '+inttostr(trjn_mult[basket[0]]);
if (trj_mult[basket[0]]=0) and (trjn_mult[basket[0]]=0) then  Label5.Caption:='Временное разрешение: '+timestep_mult[basket[0]] +' '+fb_mult[basket[0]]
else Label5.Caption:='Величина шага: '+timestep_mult[basket[0]] +' '+fb_mult[basket[0]];;
if z_mlt[basket[0]]=true then  begin
Label6.Font.Color:=clblack;
Label6.Caption:='Результат: Normal termination' ;
end
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='Результат: Dynamic calculation not finished!'
end;

aver:=0;
for i:=0 to Length(escfreal_mult)-1 do
aver:=aver+escfreal_mult[i];
aver:=aver/length(escfreal_mult);

Label7.Caption:='Emax = '+floattostr(MaxValue(escfreal_mult));
Label8.Caption:='Emin = '+floattostr(MinValue(escfreal_mult));
Label9.Caption:='Eaver = '+floattostrf(aver,ffFixed,10,10);
Label10.Caption:='Emax-Emin = '+floattostrf(((MaxValue(escfreal_mult)-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label11.Caption:='Emax-Eaver = '+floattostrf(((MaxValue(escfreal_mult)-aver)*27.21*23.06),ffFixed,5,3) + ' ккал';
Label12.Caption:='Eaver-Emin = '+floattostrf(((aver-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label13.Caption:='Einf-Emin = '+ floattostrf(((escfreal_mult[Length(escfreal_mult)-1]-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label14.Caption:='Emax-Einf = '+ floattostrf(((MaxValue(escfreal_mult) - escfreal_mult[Length(escfreal_mult)-1])*27.21*23.06),ffFixed,5,3) + ' ккал';
Label15.Caption:='E0-Emin = '+ floattostrf(((escfreal_mult[0]-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label16.Caption:='Emax-E0 = '+ floattostrf(((MaxValue(escfreal_mult) - escfreal_mult[0])*27.21*23.06),ffFixed,5,3) + ' ккал';


//Заполняем ListView1

if (trj_mult[basket[0]]=0) and (trjn_mult[basket[0]]=0) then  begin
for i:=0 to stepdyn_mult[basket[0]] do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i);
itm.SubItems.Append(floattostrf(i*strtofloat(timestep_mult[basket[0]]),ffFixed,8,3));
itm.SubItems.Append(ekin_mult[basket[0],i]);
itm.SubItems.Append(epot_mult[basket[0],i]);
itm.SubItems.Append(etot_mult[basket[0],i]);
itm.SubItems.Append(escf_mult[basket[0],i]);
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[i-1])*27.2116*23.06,ffFixed,8,4));
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[0])*27.2116*23.06,ffFixed,8,4));
end;
end
else begin
for i:=0 to stepdynbomd_mult[basket[0],0]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i);
itm.SubItems.Append(timebomd_mult[basket[0],0,i]);
itm.SubItems.Append(ekinbomd_mult[basket[0],0,i]);
itm.SubItems.Append(epotbomd_mult[basket[0],0,i]);
itm.SubItems.Append(etotbomd_mult[basket[0],0,i]);
itm.SubItems.Append(escfbomd_mult[basket[0],0,i]);
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[i-1])*27.2116*23.06,ffFixed,8,4));
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[0])*27.2116*23.06,ffFixed,8,4));
end;

ListView1.Items.Delete(0);

end;



















Form1.StatusBar1.Panels[0].Text:='Ready';
pb.Visible:=False;
Form1.StatusBar1.Panels[1].Text:=inttostr(nf) +' systems';




end;
pb.Visible:=False;
0:
end;

procedure TForm49.ComboBox1Change(Sender: TObject);
var i,j: integer;
task: widestring;
aver: double;
itm: TListItem;
label 0;
begin
if Combobox1.Items.Count<=1 then goto 0;

ListView1.Clear;
Combobox2.Clear;
Combobox2.Enabled:=True;
Combobox2.ItemIndex:=0;
escfreal_mult:=nil;

if (trj_mult[basket[Combobox1.ItemIndex]]=0) and (trjn_mult[basket[Combobox1.ItemIndex]]=0) then  begin
setlength(escfreal_mult,length(escf_mult[basket[Combobox1.ItemIndex]]));
for i:=0 to length(escf_mult[basket[Combobox1.ItemIndex]])-1 do
if escf_mult[basket[Combobox1.ItemIndex],i]<>'' then escfreal_mult[i]:=StrToFloat(escf_mult[basket[Combobox1.ItemIndex],i]);
end
else begin
setlength(escfreal_mult,length(escfbomd_mult[basket[Combobox1.ItemIndex],0]));
for i:=0 to length(escfbomd_mult[basket[Combobox1.ItemIndex],0])-1 do
if escfbomd_mult[basket[Combobox1.ItemIndex],0,i]<>'' then escfreal_mult[i]:=StrToFloat(escfbomd_mult[basket[Combobox1.ItemIndex],0,i]);
end;

for i:=0 to length(escfreal_mult)-1 do
if escfreal_mult[i]=0 then Break;
if i>0 then SetLength(escfreal_mult,i);    // Обрезка нулей в случае чего


if (trj_mult[basket[Combobox1.ItemIndex]]<>0) and (trjn_mult[basket[Combobox1.ItemIndex]]<>0) then  begin
for i:=1 to trjn_mult[basket[Combobox1.ItemIndex]] do
Combobox2.Items.Add('TRJ ' +inttostr(i));
Combobox2.ItemIndex:=0;
end
else  begin
Combobox2.Items.Add('TRJ 1');
Combobox2.ItemIndex:=0;
Combobox2.Enabled:=False;
end;



////////////////ищем название задачи без полного пути///////////////
j:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]]) do
if copy(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]],i,1)='\'   then j:=i;
task:=copy(Form1.OpenDialog2.Files[basket[Combobox1.ItemIndex]],j+1,200);
////////////////////////////////////////////////////////////////////


Label2.Caption:='Наименование системы: '+task;
if (trj_mult[basket[Combobox1.ItemIndex]]=0) and (trjn_mult[basket[Combobox1.ItemIndex]]=0) then  Label3.Caption:='Молекулярная динамика: ADMP' else Label3.Caption:='Молекулярная динамика: BOMD';
if (trj_mult[basket[Combobox1.ItemIndex]]=0) and (trjn_mult[basket[Combobox1.ItemIndex]]=0) then  Label4.Caption:='Общее число шагов, задано / исполнено: ' +maxsteps_mult[basket[Combobox1.ItemIndex]]+' / '+inttostr(stepdyn_mult[basket[Combobox1.ItemIndex]])
else Label4.Caption:='Общее число траекторий, задано / исполнено: ' + inttostr(trj_mult[basket[Combobox1.ItemIndex]])+' / '+inttostr(trjn_mult[basket[Combobox1.ItemIndex]]);
if (trj_mult[basket[Combobox1.ItemIndex]]=0) and (trjn_mult[basket[Combobox1.ItemIndex]]=0) then  Label5.Caption:='Временное разрешение: '+timestep_mult[basket[Combobox1.ItemIndex]] +' '+fb_mult[basket[Combobox1.ItemIndex]]
else Label5.Caption:='Величина шага: '+timestep_mult[basket[Combobox1.ItemIndex]] +' '+fb_mult[basket[Combobox1.ItemIndex]];
if z_mlt[basket[Combobox1.ItemIndex]]=true then  begin
Label6.Font.Color:=clblack;
Label6.Caption:='Результат: Normal termination' ;
end
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='Результат: Dynamic calculation not finished!'
end;

aver:=0;
for i:=0 to Length(escfreal_mult)-1 do
aver:=aver+escfreal_mult[i];
aver:=aver/length(escfreal_mult);

Label7.Caption:='Emax = '+floattostr(MaxValue(escfreal_mult));
Label8.Caption:='Emin = '+floattostr(MinValue(escfreal_mult));
Label9.Caption:='Eaver = '+floattostrf(aver,ffFixed,10,10);
Label10.Caption:='Emax-Emin = '+floattostrf(((MaxValue(escfreal_mult)-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label11.Caption:='Emax-Eaver = '+floattostrf(((MaxValue(escfreal_mult)-aver)*27.21*23.06),ffFixed,5,3) + ' ккал';
Label12.Caption:='Eaver-Emin = '+floattostrf(((aver-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label13.Caption:='Einf-Emin = '+ floattostrf(((escfreal_mult[Length(escfreal_mult)-1]-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label14.Caption:='Emax-Einf = '+ floattostrf(((MaxValue(escfreal_mult) - escfreal_mult[Length(escfreal_mult)-1])*27.21*23.06),ffFixed,5,3) + ' ккал';
Label15.Caption:='E0-Emin = '+ floattostrf(((escfreal_mult[0]-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label16.Caption:='Emax-E0 = '+ floattostrf(((MaxValue(escfreal_mult) - escfreal_mult[0])*27.21*23.06),ffFixed,5,3) + ' ккал';


//Заполняем ListView1

if (trj_mult[basket[Combobox1.ItemIndex]]=0) and (trjn_mult[basket[Combobox1.ItemIndex]]=0) then  begin
for i:=0 to stepdyn_mult[basket[Combobox1.ItemIndex]] do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i);
itm.SubItems.Append(floattostrf(i*strtofloat(timestep_mult[basket[Combobox1.ItemIndex]]),ffFixed,8,3));
itm.SubItems.Append(ekin_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(epot_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(etot_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(escf_mult[basket[Combobox1.ItemIndex],i]);
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[i-1])*27.2116*23.06,ffFixed,8,4));
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[0])*27.2116*23.06,ffFixed,8,4));
end;
end
else begin
for i:=0 to stepdynbomd_mult[basket[Combobox1.ItemIndex],0]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i);
itm.SubItems.Append(timebomd_mult[basket[Combobox1.ItemIndex],0,i]);
itm.SubItems.Append(ekinbomd_mult[basket[Combobox1.ItemIndex],0,i]);
itm.SubItems.Append(epotbomd_mult[basket[Combobox1.ItemIndex],0,i]);
itm.SubItems.Append(etotbomd_mult[basket[Combobox1.ItemIndex],0,i]);
itm.SubItems.Append(escfbomd_mult[basket[Combobox1.ItemIndex],0,i]);
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[i-1])*27.2116*23.06,ffFixed,8,4));
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[0])*27.2116*23.06,ffFixed,8,4));
end;
ListView1.Items.Delete(0);
end;





















0:
end;

procedure TForm49.ComboBox2Change(Sender: TObject);
var i: integer;
aver: double;
itm: TListItem;
label 0;
begin
if Combobox2.Items.Count=1 then goto 0;

ListView1.Clear;

if dial=true then begin
escfreal:=nil;


setlength(escfreal,length(escfbomd[Combobox2.ItemIndex]));
for i:=0 to length(escfbomd[Combobox2.ItemIndex])-1 do
if escfbomd[Combobox2.ItemIndex,i]<>'' then escfreal[i]:=StrToFloat(escfbomd[Combobox2.ItemIndex,i]);


for i:=0 to length(escfreal)-1 do
if escfreal[i]=0 then Break;
if i>0 then SetLength(escfreal,i);    // Обрезка нулей в случае чего

aver:=0;
for i:=0 to Length(escfreal)-1 do
aver:=aver+escfreal[i];
aver:=aver/length(escfreal);

Label7.Caption:='Emax = '+floattostr(MaxValue(escfreal));
Label8.Caption:='Emin = '+floattostr(MinValue(escfreal));
Label9.Caption:='Eaver = '+floattostrf(aver,ffFixed,10,10);
Label10.Caption:='Emax-Emin = '+floattostrf(((MaxValue(escfreal)-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label11.Caption:='Emax-Eaver = '+floattostrf(((MaxValue(escfreal)-aver)*27.21*23.06),ffFixed,5,3) + ' ккал';
Label12.Caption:='Eaver-Emin = '+floattostrf(((aver-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label13.Caption:='Einf-Emin = '+ floattostrf(((escfreal[Length(escfreal)-1]-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label14.Caption:='Emax-Einf = '+ floattostrf(((MaxValue(escfreal) - escfreal[Length(escfreal)-1])*27.21*23.06),ffFixed,5,3) + ' ккал';
Label15.Caption:='E0-Emin = '+ floattostrf(((escfreal[0]-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label16.Caption:='Emax-E0 = '+ floattostrf(((MaxValue(escfreal) - escfreal[0])*27.21*23.06),ffFixed,5,3) + ' ккал';


//Заполняем ListView1
for i:=0 to stepdynbomd[Combobox2.ItemIndex]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i);
itm.SubItems.Append(timebomd[Combobox2.ItemIndex,i]);
itm.SubItems.Append(ekinbomd[Combobox2.ItemIndex,i]);
itm.SubItems.Append(epotbomd[Combobox2.ItemIndex,i]);
itm.SubItems.Append(etotbomd[Combobox2.ItemIndex,i]);
itm.SubItems.Append(escfbomd[Combobox2.ItemIndex,i]);
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal[i]-escfreal[i-1])*27.2116*23.06,ffFixed,8,4));
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal[i]-escfreal[0])*27.2116*23.06,ffFixed,8,4));
end;

ListView1.Items.Delete(0);

end
else begin
escfreal_mult:=nil;


setlength(escfreal_mult,length(escfbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex]));
for i:=0 to length(escfbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex])-1 do
if escfbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex,i]<>'' then escfreal_mult[i]:=StrToFloat(escfbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex,i]);


for i:=0 to length(escfreal_mult)-1 do
if escfreal_mult[i]=0 then Break;
if i>0 then SetLength(escfreal_mult,i);    // Обрезка нулей в случае чего


aver:=0;
for i:=0 to Length(escfreal_mult)-1 do
aver:=aver+escfreal_mult[i];
aver:=aver/length(escfreal_mult);

Label7.Caption:='Emax = '+floattostr(MaxValue(escfreal_mult));
Label8.Caption:='Emin = '+floattostr(MinValue(escfreal_mult));
Label9.Caption:='Eaver = '+floattostrf(aver,ffFixed,10,10);
Label10.Caption:='Emax-Emin = '+floattostrf(((MaxValue(escfreal_mult)-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label11.Caption:='Emax-Eaver = '+floattostrf(((MaxValue(escfreal_mult)-aver)*27.21*23.06),ffFixed,5,3) + ' ккал';
Label12.Caption:='Eaver-Emin = '+floattostrf(((aver-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label13.Caption:='Einf-Emin = '+ floattostrf(((escfreal_mult[Length(escfreal_mult)-1]-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label14.Caption:='Emax-Einf = '+ floattostrf(((MaxValue(escfreal_mult) - escfreal_mult[Length(escfreal_mult)-1])*27.21*23.06),ffFixed,5,3) + ' ккал';
Label15.Caption:='E0-Emin = '+ floattostrf(((escfreal_mult[0]-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label16.Caption:='Emax-E0 = '+ floattostrf(((MaxValue(escfreal_mult) - escfreal_mult[0])*27.21*23.06),ffFixed,5,3) + ' ккал';


//Заполняем ListView1


for i:=0 to stepdynbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex]-1 do begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i);
itm.SubItems.Append(timebomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex,i]);
itm.SubItems.Append(ekinbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex,i]);
itm.SubItems.Append(epotbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex,i]);
itm.SubItems.Append(etotbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex,i]);
itm.SubItems.Append(escfbomd_mult[basket[Combobox1.ItemIndex],Combobox2.ItemIndex,i]);
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[i-1])*27.2116*23.06,ffFixed,8,4));
if i=0 then itm.SubItems.Append('-') else itm.SubItems.Append(floattostrf((escfreal_mult[i]-escfreal_mult[0])*27.2116*23.06,ffFixed,8,4));
end;
ListView1.Items.Delete(0);
end;

if Form36.Showing then  begin
  trxyz:=nil;
  ugolx:=0;
  ugoly:=0;
  ugolz:=0;
  anglex:=0;
  angley:=0;
  anglez:=0;
Form36.PaintBox1.Repaint;
end;

0:
end;

procedure TForm49.BitBtn5Click(Sender: TObject);
begin
Form50.Show;
end;

procedure TForm49.FormClose(Sender: TObject; var Action: TCloseAction);
begin
sett:=nil;
sett_mult:=nil;
end;

procedure TForm49.BitBtn1Click(Sender: TObject);
begin
Form51.Show;
end;

procedure TForm49.BitBtn2Click(Sender: TObject);
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
WriteLn(f,' *            ADMP/BOMD Molecular Dynamic Simulation          *');
WriteLn(f,' *                      Energy evolution                      *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                          Magellan                          *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,' File: ' +Combobox1.Items[Combobox1.ItemIndex]);


if dial=true then begin

if (trj=0) and (trjn=0) then  WriteLn(f,' Molecular Dynamic Simulation: ADMP') else WriteLn(f,' Molecular Dynamic Simulation: BOMD');
if (trj=0) and (trjn=0) then   WriteLn(f,' Number of steps, set / executed: ' +maxsteps+' / '+stepdyn)
else WriteLn(f,' Number of trajectories, set / executed: ' +inttostr(trj)+' / '+inttostr(trjn));
WriteLn(f,' Current trajectory: ' + Form49.Combobox2.Text);
if (trj=0) and (trjn=0) then  WriteLn(f,' Time step (resolution): '+timestep +' fs')
else WriteLn(f,' Stepsize: '+timestep +' sqrt(a.m.u.)*Bohr');
if z_fin=true then WriteLn(f,' Result: Normal termination')  else  WriteLn(f,' Result: Dynamic calculation not finished!');


aver:=0;
for i:=0 to Length(escfreal)-1 do
aver:=aver+escfreal[i];
aver:=aver/length(escfreal);

WriteLn(f,'');
WriteLn(f,' *********************** ENERGY SUMMARIES *********************');
WriteLn(f,'');

WriteLn(f,' Emax = '+floattostr(MaxValue(escfreal)));
WriteLn(f,' Emin = '+floattostr(MinValue(escfreal)));
WriteLn(f,' Eaver = '+floattostrf(aver,ffFixed,10,10));
WriteLn(f,' Emax - Emin = '+floattostrf(((MaxValue(escfreal)-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - Eaver = '+floattostrf(((MaxValue(escfreal)-aver)*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Eaver - Emin = '+floattostrf(((aver-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Einf - Emin = '+ floattostrf(((escfreal[Length(escfreal)-1]-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - Einf = '+ floattostrf(((MaxValue(escfreal) - escfreal[Length(escfreal)-1])*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' E0 - Emin = '+ floattostrf(((escfreal[0]-MinValue(escfreal))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - E0 = '+ floattostrf(((MaxValue(escfreal) - escfreal[0])*27.21*23.06),ffFixed,5,3) + ' kcal');
end
else begin
if (trj_mult[basket[Combobox1.ItemIndex]]=0) and (trjn_mult[basket[Combobox1.ItemIndex]]=0) then  WriteLn(f,' Molecular Dynamic Simulation: ADMP') else WriteLn(f,' Molecular Dynamic Simulation: BOMD');
if (trj_mult[basket[Combobox1.ItemIndex]]=0) and (trjn_mult[basket[Combobox1.ItemIndex]]=0) then   WriteLn(f,' Number of steps, set / executed: ' +maxsteps_mult[basket[Combobox1.ItemIndex]]+' / '+IntToStr(stepdyn_mult[basket[Combobox1.ItemIndex]]))
else WriteLn(f,' Number of trajectories, set / executed: ' +inttostr(trj_mult[basket[Combobox1.ItemIndex]])+' / '+inttostr(trjn_mult[basket[Combobox1.ItemIndex]]));
WriteLn(f,' Current trajectory: ' + Form49.Combobox2.Text);
if (trj_mult[basket[Combobox1.ItemIndex]]=0) and (trjn_mult[basket[Combobox1.ItemIndex]]=0) then  WriteLn(f,' Time step (resolution): '+timestep_mult[basket[Combobox1.ItemIndex]] +' fs')
else WriteLn(f,' Stepsize: '+timestep_mult[basket[Combobox1.ItemIndex]] +' sqrt(a.m.u.)*Bohr');
if z_mlt[basket[Combobox1.ItemIndex]]=true then WriteLn(f,' Result: Normal termination')  else  WriteLn(f,' Result: Dynamic calculation not finished!');


aver:=0;
for i:=0 to Length(escfreal_mult)-1 do
aver:=aver+escfreal_mult[i];
aver:=aver/length(escfreal_mult);

WriteLn(f,'');
WriteLn(f,' *********************** ENERGY SUMMARIES *********************');
WriteLn(f,'');

WriteLn(f,' Emax = '+floattostr(MaxValue(escfreal_mult)));
WriteLn(f,' Emin = '+floattostr(MinValue(escfreal_mult)));
WriteLn(f,' Eaver = '+floattostrf(aver,ffFixed,10,10));
WriteLn(f,' Emax - Emin = '+floattostrf(((MaxValue(escfreal_mult)-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - Eaver = '+floattostrf(((MaxValue(escfreal_mult)-aver)*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Eaver - Emin = '+floattostrf(((aver-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Einf - Emin = '+ floattostrf(((escfreal_mult[Length(escfreal_mult)-1]-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - Einf = '+ floattostrf(((MaxValue(escfreal_mult) - escfreal[Length(escfreal_mult)-1])*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' E0 - Emin = '+ floattostrf(((escfreal_mult[0]-MinValue(escfreal_mult))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - E0 = '+ floattostrf(((MaxValue(escfreal_mult) - escfreal_mult[0])*27.21*23.06),ffFixed,5,3) + ' kcal');
end;



WriteLn(f,'');
WriteLn(f,' Notes: Emax - maximum of energy, Emin - minimum of energy,');
WriteLn(f,'        Eaver - average mean of energy, Einf - last point on curve,');
WriteLn(f,'        E0 - first point on curve');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'    # st.   Time, fs   Ekin, a.m.u.   Epot, a.m.u.    Etot, a.m.u.   E(SCF/MM), a.m.u.   E(i+1)-Ei, kcal   Ei-E0, kcal');
WriteLn(f,'');
for i:=0 to ListView1.Items.Count-1 do
WriteLn(f,' '+ copy(probel,1,6-length(ListView1.Items[i].Caption)) + ListView1.Items[i].Caption + copy(probel,1,13-length(ListView1.Items[i].SubItems[0])) +
ListView1.Items[i].SubItems[0] + copy(probel,1,13-length(ListView1.Items[i].SubItems[1])) +  ListView1.Items[i].SubItems[1] +
copy(probel,1,16-length(ListView1.Items[i].SubItems[2])) + ListView1.Items[i].SubItems[2] +
copy(probel,1,16-length(ListView1.Items[i].SubItems[3])) + ListView1.Items[i].SubItems[3] +
copy(probel,1,20-length(ListView1.Items[i].SubItems[4])) + ListView1.Items[i].SubItems[4] +
copy(probel,1,16-length(ListView1.Items[i].SubItems[5])) + ListView1.Items[i].SubItems[5] +
copy(probel,1,16-length(ListView1.Items[i].SubItems[6])) + ListView1.Items[i].SubItems[6]);

WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,' **** END **** / '+Datetostr(Now)+' /');
CloseFile(f);
end;



SaveDialog1.FreeOnRelease;

end;

procedure TForm49.BitBtn3Click(Sender: TObject);
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

for i:=0 to ListView1.Columns.Count-1 do   begin
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2+i].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2+i].HorizontalAlignment := xlRight;
MSExcel.Cells[1,2+i]:=ListView1.Column[i].Caption;
end;

MSExcel.ActiveWorkbook.ActiveSheet.Columns[2].ColumnWidth := 10;     //#
MSExcel.ActiveWorkbook.ActiveSheet.Columns[3].ColumnWidth := 13;     //время
MSExcel.ActiveWorkbook.ActiveSheet.Columns[4].ColumnWidth := 13;     //кинетическая энергия
MSExcel.ActiveWorkbook.ActiveSheet.Columns[5].ColumnWidth := 13;     //потенциальная энергия
MSExcel.ActiveWorkbook.ActiveSheet.Columns[6].ColumnWidth := 13;     //общая энергия
MSExcel.ActiveWorkbook.ActiveSheet.Columns[7].ColumnWidth := 16;     //полная энергия
MSExcel.ActiveWorkbook.ActiveSheet.Columns[8].ColumnWidth := 14;     //разность1
MSExcel.ActiveWorkbook.ActiveSheet.Columns[9].ColumnWidth := 14;     //разность2


for i:=0 to ListView1.Items.Count-1 do  begin
MSExcel.Cells[i+2,2]:=ListView1.Items[i].Caption;
for j:=0 to ListView1.Columns.Count-2 do
MSExcel.Cells[i+2,3+j]:=ListView1.Items[i].SubItems[j];
end;
























0:
end;

procedure TForm49.BitBtn4Click(Sender: TObject);
begin
Form18.Show;
end;

end.
