unit Unit37;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Math, ComObj, OleServer, ExcelXP, ActiveX;

type
  TForm37 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
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
    SaveDialog1: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form37: TForm37;
  step_irc_path1,step_irc_path2,energy_irc_path1,energy_irc_path2,energy_irc_path2b,delta_irc_path1,delta_irc_path2,raznost_irc,step_irc_path2b: array of string;
  step_mult_irc_path1,step_mult_irc_path2,energy_mult_irc_path1,energy_mult_irc_path2,delta_mult_irc_path1,delta_mult_irc_path2,raznost_mult_irc,energy_mult_irc_path2b,step_mult_irc_path2b: array of array of string;
  nsteps_f,nsteps_r,nsteps_f_st,nsteps_r_st: array of Integer;
  direction1,direction2: string;
  direction1_mult,direction2_mult: array of string;
  irc_found: array of boolean;
  task_mult: array of WideString;
  npath1_mult,npath2_mult,irc_fin: array of Integer;
  modi2: array of Boolean;    //переменная которая определяет была ли сделана переброска последнего элемента от forward к reverse для случая когда обе ветви IRC
  Rx,Rx_show: array of Real;
  Rx_mult,Rx_mult_show: array of array of Real;


implementation

uses Unit1, Unit12, Unit18, Unit24, Unit36, Unit38, Unit39, Unit41, Unit44, Unit49 ;

{$R *.dfm}

function howlongs(var X: array of String): integer;
var i: integer;
begin
for i:=0 to length(X)-1 do
if X[length(X)-1-i]<>'' then Break;
Result:=length(X)-i;
end;

function howlongr(var X: array of Real): integer;
var i: integer;
begin
for i:=1 to length(X)-1 do
if X[length(X)-1-i]<>0 then Break;
Result:=length(X)-i;
end;


function howmuchs(var X: array of String): integer;
var i: integer;
s: integer;
begin
s:=0;
for i:=0 to length(X)-1 do
if X[i]<>'' then s:=s+1;
Result:=s;
end;







procedure TForm37.BitBtn1Click(Sender: TObject);
begin
Form38.Show;
end;

procedure TForm37.BitBtn2Click(Sender: TObject);
begin
Form41.Show;
end;

procedure TForm37.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form37.ListView1.Clear;
Label6.Font.Color:=clBlack;
end;

procedure TForm37.FormShow(Sender: TObject);
var f: TextFile;
itm: TListItem;
str,a,b,probel,task,d1,d2: widestring;    //a - промежуточная переменная для поиска подстроки "Номер шага"
i,k,k1,k2,cnt,ps,j,maxi,maxi2,npath1,npath2,mmm,Nif,h1,h2,h3,maxrx,h5,h6,podg,g: integer;    //mmm нужно для сброса счетчика path1 для начала нумерации path2
z: boolean;
path:  string;                          //maxi - переменная, определяет максимальную длину массива
path_mult: array of string;
label 0,1,2,3;
begin
ListView1.Clear;
Combobox1.Clear;

step_irc_path1:=nil;
step_irc_path2:=nil;
energy_irc_path1:=nil;
energy_irc_path2:=nil;
energy_irc_path2b:=nil;
delta_irc_path1:=nil;
delta_irc_path2:=nil;
raznost_irc:=nil;
step_mult_irc_path1:=nil;
step_mult_irc_path2:=nil;
energy_mult_irc_path1:=nil;
energy_mult_irc_path2:=nil;
delta_mult_irc_path1:=nil;
delta_mult_irc_path2:=nil;
raznost_mult_irc:=nil;
direction1:='';
direction2:='';
modi2:=nil;
Rx:=nil;
Rx_mult:=nil;

////////////////////////////Очистка  глобальных переменных IRC,Trj,Scan,,,
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
//Trj
  trj:=0;
  trjn:=0;
  trj_mult:=nil;
  trjn_mult:=nil;
  stpmax:=0;
  nmax1:=0;
  escfreal_mult:=nil;
  ekin_mult:=nil;
  epot_mult:=nil;
  etot_mult:=nil;
  escf_mult:=nil;
  escfbomd_mult:=nil;
  maxsteps_mult:=nil;
  timestep_mult:=nil;
  stepdyn_mult:=nil;
  z_mlt:=nil;
  ekinbomd_mult:=nil;
  epotbomd_mult:=nil;
  etotbomd_mult:=nil;
  stepdynbomd_mult:=nil;
  timebomd_mult:=nil;
  sett_mult:=nil;
  ekin:=nil;
  epot:=nil;
  etot:=nil;
  escf:=nil;
  timestep:='';
  escfreal:=nil;
  ekinbomd:=nil;
  epotbomd:=nil;
  etotbomd:=nil;
  escfbomd:=nil;
  stepdynbomd:=nil;
  timebomd:=nil;
  maxsteps:='';
  stepdyn:='';
  z_fin:=false;
  start_of_new_trj:=nil;
  fb_mult:=nil;

////////////////////////////

if dial=true then begin   //////////////////////////////// Диалог открытия одного файла
z:=false;
Label2.Caption:='';
Label3.Caption:='';
Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
Label6.Font.Color:=clBlack;

if Form1.OpenDialog1.FilterIndex=1 then goto 0;
AssignFile(f,Form1.OpenDialog1.Filename);
Reset(f);
i:=-1;
while not eof(f) do begin
ReadLn(f,str);
if pos('Reaction path calculation complete',str)<>0 then  z:=true;
if pos('Path Number',str)<>0 then path:=copy(str,length(str),1);
if pos('= Forward',str)<>0 then direction1:='Forward';
if pos('= Reverse',str)<>0 then direction2:='Reverse';
if pos('in both directions',str)<>0 then begin
direction1:='Forward';
direction2:='Reverse';
end;
if Pos('NET REACTION COORDINATE UP TO THIS POINT',str)<>0 then  begin
SetLength(Rx,Length(Rx)+1);
d1:=Copy(Str,Pos('=',str)+1,Length(str));
for h1:=0 to Length(d1) do
if Copy(d1,h1,1)<>' ' then Break;
Rx[Length(Rx)-1]:=strtofloat(Copy(d1,h1,Length(d1)));
end;







if pos('Point Number:',str)<>0 then begin
i:=i+1;
if path='1' then setlength(step_irc_path1,i+1);
if path='2' then setlength(step_irc_path2,i-mmm);
a:=copy(str,pos('Point Number:',str)+length('Point Number:'),50);
for k1:=0 to 20 do
if copy(a,k1,1)<>' ' then break;
for k2:=0 to 10 do
if copy(a,k2+k1,1)=' ' then break;
i:=i-1;
if path='1' then step_irc_path1[i]:=copy(a,k1,k2);
if path='2' then step_irc_path2[i-mmm]:=copy(a,k1,k2);
end;       ///////////////////////////  конец  if pos('Step number',str)<>0 then begin
if (pos('SCF Done',str)<>0) or (pos('Energy From Chk =',str)<>0)  then  begin
i:=i+1;
if i=0 then setlength(energy_irc_path1,i+1);

if path='1' then begin
setlength(energy_irc_path1,i+1);
mmm:=i;
end;
if path='2' then setlength(energy_irc_path2,i-mmm);


for  k:=0 to length(copy(str,pos('=',str)+1,100)) do begin
if copy(copy(str,pos('=',str)+1,100),k,1)<>' ' then
begin
b:=copy(copy(str,pos('=',str)+1,100),k,100);
break;
end;
end;
for  k:=0 to length(b) do
if copy(b,k,1)=' ' then begin b:=copy(b,0,k-1);
break;
end;
if i=0 then  energy_irc_path1[i]:=b;
if path='1' then energy_irc_path1[i]:=b;
if path='2' then energy_irc_path2[i-mmm-1]:=b;
end;

end;
CloseFile(f);



if energy_irc_path2=nil then begin
if  length(step_irc_path1)<length(energy_irc_path1) then  begin
Setlength(step_irc_path1,length(energy_irc_path1));
step_irc_path1[length(energy_irc_path1)-1]:=inttostr(length(Rx)+1);
SetLength(Rx,length(Rx)+1);
Rx[length(Rx)-1]:=-1;
end;
end;



if (length(energy_irc_path1)<1) or (path='') or (Rx=nil) then begin
showmessage('Файл '+ Form1.OpenDialog1.FileName +' не содержит данных по рассчету внутренней координаты реакции!');
Label1.Caption:='';
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
goto 0;
end;



//if (step_irc_path1[length(step_irc_path1)-1]='') and (step_irc_path1[length(step_irc_path1)-2]<>'') then setlength(step_irc_path1,length(step_irc_path1)-1);
//if length(step_irc_path2)>0 then
//if (step_irc_path2[length(step_irc_path2)-1]='') and (step_irc_path2[length(step_irc_path2)-2]<>'') then setlength(step_irc_path2,length(step_irc_path2)-1);



if (length(step_irc_path1)=0) and (length(step_irc_path2)=0) then begin
showmessage('Файл '+ Form1.OpenDialog1.FileName +' не содержит данных по рассчету внутренней координаты реакции!');
goto 0;
end;


Combobox1.Items.Add(Form1.OpenDialog1.FileName);
Combobox1.ItemIndex:=0;


////////////////ищем название задачи без полного пути///////////////
ps:=0;
for i:=0 to length(Form1.OpenDialog1.FileName) do
if copy(Form1.OpenDialog1.FileName,i,1)='\'   then ps:=i;
task:=copy(Form1.OpenDialog1.FileName,ps+1,100);
////////////////////////////////////////////////////////////////////

npath1:=0;
for i:=0 to length(step_irc_path1)-1 do
if step_irc_path1[i]<>'' then npath1:=npath1+1;

npath2:=0;
for i:=0 to length(step_irc_path2)-1 do
if step_irc_path2[i]<>'' then npath2:=npath2+1;



Label2.Caption:='Наименование системы: '+task;

//if (direction1='') and (direction2='') then  Label5.Caption:='Общее число точек: ' +inttostr(npath1-1);

//showmessage(inttostr(length(step_irc_path1)));
//showmessage(inttostr(length(energy_irc_path1)));

 //probel:='                                                 ';

if length(energy_irc_path1)<=length(step_irc_path1) then Nif:=length(energy_irc_path1)
else Nif:=length(step_irc_path1);
g:=0;
for i:=0 to Nif-1 do begin
if step_irc_path1[i]<>'' then  begin
itm:=ListView1.Items.Add;
itm.Caption:=copy('           ',0,8-length(step_irc_path1[i]))+step_irc_path1[i];
itm.SubItems.Append(copy(probel,0,18-length(energy_irc_path1[i]))+energy_irc_path1[i]);
//if i>1 then if Pos('-',floattostrf(RoundTo((strtofloat(energy_irc_path1[i])- strtofloat(energy_irc_path1[i-1]))*23.06*27.21,-2),ffFixed,5,2))<>0 then podg:=0 else podg:=1;
if  (direction1<>'') or (direction2<>'') then begin

if i=0 then itm.SubItems.Append('-');
if i>0 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_irc_path1[i])- strtofloat(energy_irc_path1[g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_irc_path1[i])- strtofloat(energy_irc_path1[g]))*23.06*27.21,-2)));
if i=0 then itm.SubItems.Append('TS')
else begin
if ((direction1='Forward') and (direction2='')) or  ((direction1='Forward') and (direction2='Reverse')) then itm.SubItems.Append('Forward');
if (direction1='') and (direction2='Reverse') then  itm.SubItems.Append('Reverse');
end;
end;
if  (direction1='') and (direction2='') then begin

if i=0 then itm.SubItems.Append('-');
if i>0 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_irc_path1[i])- strtofloat(energy_irc_path1[g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_irc_path1[i])- strtofloat(energy_irc_path1[g]))*23.06*27.21,-2)));
itm.SubItems.Append('Downhill');

end;
g:=i;
end;
end;




if length(energy_irc_path2)>0 then begin

SetLength(step_irc_path2b,Length(step_irc_path2)+(Length(energy_irc_path1)-length(step_irc_path1)));
for h5:=0 to  (Length(energy_irc_path1)-length(step_irc_path1))-1 do
step_irc_path2b[h5]:='';
for h3:=h5 to Length(step_irc_path2)+h5-1 do
step_irc_path2b[h3]:=step_irc_path2[h3-h5];
SetLength(step_irc_path2,Length(step_irc_path2b));
for h3:=0 to Length(step_irc_path2b)-1 do
step_irc_path2[h3]:=step_irc_path2b[h3];



setlength(energy_irc_path2b,length(energy_irc_path2)+1+(Length(energy_irc_path1)-length(step_irc_path1)));
for h3:=0 to (Length(energy_irc_path1)-length(step_irc_path1)) do
energy_irc_path2b[h3]:=energy_irc_path1[length(energy_irc_path1)-1-(Length(energy_irc_path1)-length(step_irc_path1))+h3];
for i:=0 to length(energy_irc_path2)-1 do
energy_irc_path2b[i+h3]:=energy_irc_path2[i];
setlength(energy_irc_path1,length(energy_irc_path1)-1-(Length(energy_irc_path1)-length(step_irc_path1)));


//**************************************************************
if energy_irc_path2b<>nil then begin
if  length(step_irc_path2)<length(energy_irc_path2b) then  begin
Setlength(step_irc_path2,length(energy_irc_path2b));
step_irc_path2[length(energy_irc_path2b)-1]:=IntToSTr(StrToInt(step_irc_path2[howlongs(step_irc_path2)-1])+1);
SetLength(Rx,length(Rx)+1);
Rx[length(Rx)-1]:=-1;
end;
end;
//**************************************************************



if length(energy_irc_path2b)<=length(step_irc_path2) then Nif:=length(energy_irc_path2b)
else Nif:=length(step_irc_path2);
g:=0;
for i:=0 to Nif-1 do begin
if step_irc_path2[i]<>'' then  begin
itm:=ListView1.Items.Add;
itm.Caption:=copy('           ',0,8-length(step_irc_path2[i]))+step_irc_path2[i];
itm.SubItems.Append(copy(probel,0,18-length(energy_irc_path2b[i]))+energy_irc_path2b[i]);
//if Pos('-',energy_irc_path2b[i])<>0 then podg:=0 else podg:=3;
if step_irc_path2[i]='1' then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_irc_path2b[i])- strtofloat(energy_irc_path1[0]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_irc_path2b[i])- strtofloat(energy_irc_path1[0]))*23.06*27.21,-2)));
if StrToInt(step_irc_path2[i])>1 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_irc_path2b[i])- strtofloat(energy_irc_path2b[g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_irc_path2b[i])- strtofloat(energy_irc_path2b[g]))*23.06*27.21,-2)));
itm.SubItems.Append('Reverse');
g:=i;
end;
end;
end;



if (direction1='Forward') and (direction2='') then Label3.Caption:='Число точек в направлении Forward: '+ inttostr(howmuchs(step_irc_path1)-1);
if (direction2='Reverse') and (direction1='') then Label3.Caption:='Число точек в направлении Forward: ---';
if (direction1='Forward') and (direction2='Reverse') then Label3.Caption:='Число точек в направлении Forward: '+ inttostr(howmuchs(step_irc_path1)-1);
if (direction1='') and (direction2='') then Label3.Caption:='Тип расчета: Downhill';

if (direction2='Reverse') and (direction1='') then Label4.Caption:='Число точек в направлении Reverse: '+ inttostr(howmuchs(step_irc_path1)-1);
if (direction2='') and (direction1='Forward') then Label4.Caption:='Число точек в направлении Reverse: ---';
if (direction2='Reverse') and (direction1='Forward') then Label4.Caption:='Число точек в направлении Reverse: '+ inttostr(howmuchs(step_irc_path2));
if (direction1='') and (direction2='') then Label4.Caption:='Число точек Downhill: '+ inttostr(howmuchs(step_irc_path1)-1);

Label5.Caption:='Общее число точек: ' +inttostr(howmuchs(step_irc_path1)+howmuchs(step_irc_path2)-1);


if (direction1='Forward') and (direction2='') then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(length(energy_irc_path1));
if (direction2='Reverse') and (direction1='') then Label6.Caption:='Общее число шагов в направлении Forward: ---';
if (direction1='Forward') and (direction2='Reverse') then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(length(energy_irc_path1));
if (direction1='Forward') and (direction2='Reverse') and  (length(energy_irc_path2)=0)  then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(length(energy_irc_path1));
if  length(step_irc_path1)=0 then Label6.Caption:='Общее число шагов в направлении Forward: 0';
if  (direction1='') and (direction2='') then  Label5.Caption:='Число шагов Downhill: '+ inttostr(length(energy_irc_path1));

if (direction2='Reverse') and (direction1='') then Label12.Caption:='Общее число шагов в направлении Reverse: ' +inttostr(length(energy_irc_path1));
if (direction2='') and (direction1='Forward') then Label12.Caption:='Общее число шагов в направлении Reverse: ---';
if (direction2='Reverse') and (direction1='Forward') then Label12.Caption:='Общее число шагов в направлении Reverse: ' +inttostr(length(energy_irc_path2b));
if (direction2='Reverse') and (direction1='Forward') and (length(energy_irc_path2)=0) then  Label12.Caption:='Общее число шагов в направлении Reverse: 0';
if (direction1<>'') or (direction2<>'') then  Label13.Caption:='Общее число шагов: '+  inttostr(length(energy_irc_path1)+ length(energy_irc_path2b));
if (direction1='') and (direction2='') then  begin
Label6.Caption:='************************************';
Label12.Caption:='************************************';
Label13.Caption:='************************************';
end;





if ((direction1='Forward') and (direction2='')) or  ((direction1='Forward') and (direction2='Reverse')) then  begin
if length(energy_irc_path1)>0 then Label7.Caption:='Е(Forw)-E(TS) = ' + Floattostr(-1*RoundTo((strtofloat(energy_irc_path1[0]) - strtofloat(energy_irc_path1[length(energy_irc_path1)-1]))*23.06*27.21,-2))+' ккал'
else Label7.Caption:='Е(Forw)-E(TS) = ---';
end;
if (direction1='') and (direction2='Reverse') then Label7.Caption:='Е(Forw)-E(TS) = ---';
if (direction1='') and (direction2='') then Label7.Caption:='E(P)-E(R) = '+ Floattostr(-1*RoundTo((strtofloat(energy_irc_path1[0]) - strtofloat(energy_irc_path1[length(energy_irc_path1)-1]))*23.06*27.21,-2))+' ккал';


if ((direction2='Reverse') and (direction1=''))  then begin
if length(energy_irc_path1)>0  then  Label8.Caption:='Е(TS)-E(Rev) = ' + Floattostr(-1*RoundTo((strtofloat(energy_irc_path1[length(energy_irc_path1)-1])-strtofloat(energy_irc_path1[0]))*23.06*27.21,-2))+' ккал';
end;
if (direction2='Reverse') and (direction1='Forward') then begin
if length(energy_irc_path2)>0  then  Label8.Caption:='Е(TS)-E(Rev) = ' + Floattostr(-1*RoundTo((strtofloat(energy_irc_path2[length(energy_irc_path2)-1])-strtofloat(energy_irc_path1[0]))*23.06*27.21,-2))+' ккал';
end;
if (direction2='Reverse') and (direction1='Forward') and  (length(energy_irc_path2)=0)  then Label8.Caption:='Е(TS)-E(Rev) = ---';
if (direction2='') and (direction1='Forward') then  Label8.Caption:='Е(TS)-E(Rev) = ---';



if (length(energy_irc_path1)>0) and (length(energy_irc_path2)>0) then  Label9.Caption:='Е(Forw)-E(Rev) = ' +Floattostr(-1*RoundTo((strtofloat(energy_irc_path2[length(energy_irc_path2)-1])-strtofloat(energy_irc_path1[length(energy_irc_path1)-1]))*23.06*27.21,-2))+' ккал'
else Label9.Caption:='Е(Forw)-E(Rev) = ---';

if (direction1='') and (direction2='') then begin
Label8.Caption:='';
Label9.Caption:='';
end;

Label10.Caption:='Результат: ';
if z=true then begin
Label11.Font.Color:=clblack;
Label11.Caption:='Reaction path calculation complete';
end
else  begin
Label11.Font.Color:=clred;
Label11.Caption:='WARNING! Reaction path calculation NOT complete!'
end;





end



/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////ДИАЛОГ ОТКРЫТИЯ НЕСКОЛЬКИХ ФАЙЛОВ /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////


else begin        //  Диалог открытия нескольких файлов
ComboBox1.Clear;
ListView1.Clear;
step_mult_irc_path1:=nil;
step_mult_irc_path2 :=nil;
direction1_mult:=nil;
direction2_mult:=nil;
path_mult:=nil;
energy_mult_irc_path1:=nil;
energy_mult_irc_path2:=nil;
nsteps_r:=nil;
nsteps_f:=nil;
task_mult:=nil;
energy_mult_irc_path2b:=nil;
modi2:=nil;
Rx_mult:=nil;
step_mult_irc_path2b:=nil;

SetLength(modi2,nf);
for i:=0 to nf-1 do
modi2[i]:=False;

setlength(irc_found,nf+1);
maxi:=0;
maxi2:=0;
maxrx:=0;
if length(basket)=0 then setlength(basket,nf);
for j:=0 to nf-1 do  begin
AssignFile(f,Form1.OpenDialog2.Files[j]);
//irc_found[j]:=false;
Reset(f);
i:=-1;
mmm:=0;
SetLength(path_mult,j+1);
SetLength(irc_found,j+1);
irc_found[j]:=false;
SetLength(direction1_mult,j+1);
SetLength(direction2_mult,j+1);
SetLength(nsteps_f_st,j+1);    ///
SetLength(nsteps_r_st,j+1);     ///
h5:=0;
while not eof(f) do begin
ReadLn(f,str);
if pos('Reaction path calculation complete',str)<>0 then  irc_found[j]:=true;
if pos('Path Number',str)<>0 then path_mult[j]:=copy(str,length(str),1);
if pos('= Forward',str)<>0 then direction1_mult[j]:='Forward';
if pos('= Reverse',str)<>0 then direction2_mult[j]:='Reverse';
if pos('in both directions',str)<>0 then begin
direction1_mult[j]:='Forward';
direction2_mult[j]:='Reverse';
end;

if Pos('NET REACTION COORDINATE UP TO THIS POINT',str)<>0 then  begin
  h5:=h5+1;
SetLength(Rx_mult,j+1);
if h5>=maxrx  then  begin
SetLength(Rx_mult,j+1,h5);
maxrx:=h5;
end
else SetLength(Rx_mult,j+1,maxrx);
d1:=Copy(Str,Pos('=',str)+1,Length(str));
for h1:=0 to Length(d1) do
if Copy(d1,h1,1)<>' ' then Break;
Rx_mult[j,h5-1]:=strtofloat(Copy(d1,h1,Length(d1)));
end;






if pos('Point Number:',str)<>0 then begin
i:=i+1;


if path_mult[j]='1' then begin           //Если в новопрочитанном файле больше циклов, то новая длина всего массива будет=Числу шагов во втором файле
 if maxi<i then begin                    //Maxi - определяет больше или меньше надо делать размер массива в зависимости от числа шагов в прочитанном файле №2
setlength(step_mult_irc_path1,j+1,i+1);
maxi:=i;
end
else  setlength(step_mult_irc_path1,j+1,maxi+1);  //Пока i не достигло значения maxi - наибольший размер будет = maxi
end;


if path_mult[j]='2' then  begin
  if maxi2<i-mmm then begin
setlength(step_mult_irc_path2,j+1,i-mmm);
maxi2:=i-mmm;
end
else  setlength(step_mult_irc_path2,j+1,maxi2+1);
end;







a:=copy(str,pos('Point Number:',str)+length('Point Number:'),50);
for k1:=0 to 20 do
if copy(a,k1,1)<>' ' then break;
for k2:=0 to 10 do
if copy(a,k2+k1,1)=' ' then break;
if i<>0 then i:=i-1;


if path_mult[j]='1' then begin
step_mult_irc_path1[j,i]:=copy(a,k1,k2);
nsteps_f_st[j]:=i+1;
end;
if path_mult[j]='2' then begin
if i-mmm<0 then mmm:=i;
step_mult_irc_path2[j,i-mmm]:=copy(a,k1,k2);
nsteps_r_st[j]:=i-mmm+1;
end;


end;       ///////////////////////////  конец  if pos('Step number',str)<>0 then begin
if (pos('SCF Done',str)<>0) or (pos('Energy From Chk =',str)<>0)    then  begin
i:=i+1;






if i=0 then begin
 if maxi<i then begin
setlength(energy_mult_irc_path1,j+1,i+1);
 maxi:=i;
 end
 else setlength(energy_mult_irc_path1,j+1,maxi+1);
 end;


if path_mult[j]='1' then begin
  if maxi<i then begin
setlength(energy_mult_irc_path1,j+1,i+1);
mmm:=i;
maxi:=i;
end
else begin
 setlength(energy_mult_irc_path1,j+1,maxi+1);
  mmm:=maxi;
end;
end;


if path_mult[j]='2' then  begin
 if maxi2<i-mmm then begin
setlength(energy_mult_irc_path2,j+1,i-mmm);
maxi2:=i-mmm;
end
else  setlength(energy_mult_irc_path2,j+1,maxi2);
end;



for  k:=0 to length(copy(str,pos('=',str)+1,100)) do begin
if copy(copy(str,pos('=',str)+1,100),k,1)<>' ' then
begin
b:=copy(copy(str,pos('=',str)+1,100),k,100);
break;
end;
end;
for  k:=0 to length(b) do
if copy(b,k,1)=' ' then begin b:=copy(b,0,k-1);
break;
end;
if i=0 then  energy_mult_irc_path1[j,i]:=b;
if path_mult[j]='1' then energy_mult_irc_path1[j,i]:=b;
if path_mult[j]='2' then energy_mult_irc_path2[j,i-mmm-1]:=b;

end;


end;

//SetLength(nsteps_f_st,j+1);    ///
//SetLength(nsteps_r_st,j+1);     ///

//nsteps_r_st[j]:=i-mmm+1;   ///







if Length(energy_mult_irc_path1)<j+1 then begin
if maxi<=1 then maxi:=2;
SetLength(energy_mult_irc_path1,j+1,maxi+1);
end;
if Length(energy_mult_irc_path2)<j+1 then begin
if maxi2<=1 then maxi2:=2;
SetLength(energy_mult_irc_path2,j+1,maxi2);  //// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Error
end;
if Length(step_mult_irc_path1)<j+1 then SetLength(step_mult_irc_path1,j+1,maxi+1);
if Length(step_mult_irc_path2)<j+1 then SetLength(step_mult_irc_path2,j+1,maxi2);


SetLength(nsteps_f,j+1);
if energy_mult_irc_path1[j,0]<>'' then  begin
for h1:=0 to Length(energy_mult_irc_path1[j])-1 do
if energy_mult_irc_path1[j,Length(energy_mult_irc_path1[j])-1-h1]<>'' then Break;
nsteps_f[j]:=Length(energy_mult_irc_path1[j])-h1;
end;
SetLength(nsteps_r,j+1);
if energy_mult_irc_path2[j,0]<>'' then  begin
for h2:=0 to Length(energy_mult_irc_path2[j])-1 do
if energy_mult_irc_path2[j,Length(energy_mult_irc_path2[j])-1-h2]<>'' then Break;
nsteps_r[j]:=Length(energy_mult_irc_path2[j])-h2;
end;




CloseFile(f);

{
for i:=0 to length(energy_mult_irc_path1)-1 do begin
if energy_mult_irc_path2[i]<>nil then begin
if energy_mult_irc_path2[i,0]='' then begin
if  howlongs(step_mult_irc_path1[i])+1<howlongs(energy_mult_irc_path1[i]) then  begin
Setlength(step_mult_irc_path1,length(step_mult_irc_path1),length(energy_mult_irc_path1[i]));
step_mult_irc_path1[i,howlongs(energy_mult_irc_path1[i])-1]:=inttostr(howlongr(Rx_mult[i])+2);
if length(Rx_mult[i])<howlongr(Rx_mult[i])+2 then  SetLength(Rx_mult,length(Rx_mult),length(Rx_mult[i])+1);
Rx_mult[i,howlongr(Rx_mult[i])]:=-1;
end;
end;
end;
end;
}





end;
if (energy_mult_irc_path1=nil) and (energy_mult_irc_path2=nil) then begin
  showmessage('Ни один из прочитанных файлов не содержит данных об IRC');
  goto 0;
end;

                               ///BASKET

i:=0;
for j:=0 to nf-1 do  begin
if (step_mult_irc_path1[j,0]<>'') or (step_mult_irc_path2[j,0]<>'') then begin
SetLength(basket,i+1);
basket[i]:=j;
Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
i:=i+1;
end
else ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных IRC');
end;

////////////////////////////////////////////////////////////
////////////////////Отображение на форме////////////////////
////////////////////////////////////////////////////////////


Combobox1.ItemIndex:=0;


////////////////ищем название задачи без полного пути///////////////
ps:=0;
SetLength(task_mult,Length(basket));
for j:=0 to Length(basket)-1 do begin
for i:=0 to length(Form1.OpenDialog2.Files[basket[j]]) do
if copy(Form1.OpenDialog2.Files[basket[j]],i,1)='\'   then ps:=i;
task_mult[j]:=copy(Form1.OpenDialog2.Files[basket[j]],ps+1,100);
ps:=0;
end;
////////////////////////////////////////////////////////////////////



SetLength(npath1_mult,Length(basket));
SetLength(npath2_mult,Length(basket));





for j:=0 to Length(basket)-1 do begin
npath1_mult[j]:=0;
for i:=0 to length(step_mult_irc_path1[basket[j]])-1 do
if step_mult_irc_path1[basket[j],i]<>'' then npath1_mult[j]:=npath1_mult[j]+1;
end;


for j:=0 to Length(basket)-1 do  begin
npath2_mult[j]:=0;
for i:=0 to length(step_mult_irc_path2[basket[j]])-1 do
if step_mult_irc_path2[basket[j],i]<>'' then npath2_mult[j]:=npath2_mult[j]+1;
end;


//****************************************************************************
if energy_mult_irc_path2[basket[0]]<>nil then begin
if energy_mult_irc_path2[basket[0],0]='' then begin
if  howlongs(step_mult_irc_path1[basket[0]])+1<howlongs(energy_mult_irc_path1[basket[0]]) then  begin
Setlength(step_mult_irc_path1,length(step_mult_irc_path1),length(energy_mult_irc_path1[basket[0]]));
step_mult_irc_path1[basket[0],howlongs(energy_mult_irc_path1[basket[0]])-1]:=inttostr(howlongr(Rx_mult[basket[0]])+2);
if length(Rx_mult[basket[0]])<howlongr(Rx_mult[basket[0]])+2 then  SetLength(Rx_mult,length(Rx_mult),length(Rx_mult[basket[0]])+1);
Rx_mult[basket[0],howlongr(Rx_mult[basket[0]])]:=-1;
end;
end;
end;

//***************************************************************************


Label2.Caption:='Наименование системы: '+task_mult[0];


if  Length(energy_mult_irc_path1[basket[0]])<=Length(step_mult_irc_path1[basket[0]]) then Nif:=Length(energy_mult_irc_path1[basket[0]])
else Nif:=Length(step_mult_irc_path1[basket[0]]);

g:=0;
for i:=0 to Nif-1 do begin
if step_mult_irc_path1[basket[0],i]<>'' then  begin
itm:=ListView1.Items.Add;
itm.Caption:=copy('           ',0,8-length(step_mult_irc_path1[basket[0],i]))+step_mult_irc_path1[basket[0],i];
itm.SubItems.Append(copy(probel,0,18-length(energy_mult_irc_path1[basket[0],i]))+energy_mult_irc_path1[basket[0],i]);
if (direction1_mult[basket[0]]<>'') or (direction2_mult[basket[0]]<>'') then begin
if i=0 then itm.SubItems.Append('-');
if i>0 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_mult_irc_path1[basket[0],i])- strtofloat(energy_mult_irc_path1[basket[0],g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_mult_irc_path1[basket[0],i])- strtofloat(energy_mult_irc_path1[basket[0],g]))*23.06*27.21,-2)));
if i=0 then itm.SubItems.Append('TS')
else begin
if ((direction1_mult[basket[0]]='Forward') and (direction2_mult[basket[0]]='')) or  ((direction1_mult[basket[0]]='Forward') and (direction2_mult[basket[0]]='Reverse')) then itm.SubItems.Append('Forward');
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='Reverse') then  itm.SubItems.Append('Reverse');
end;
end;
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then begin

if i=0 then itm.SubItems.Append('-');
if i>0 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_mult_irc_path1[basket[0],i])- strtofloat(energy_mult_irc_path1[basket[0],g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_mult_irc_path1[basket[0],i])- strtofloat(energy_mult_irc_path1[basket[0],g]))*23.06*27.21,-2)));
itm.SubItems.Append('Downhill');
end;
g:=i;
end;
end;



if (length(energy_mult_irc_path2[basket[0]])>0) and  (energy_mult_irc_path2[basket[0],0]<>'') then begin



SetLength(step_mult_irc_path2b,Length(step_mult_irc_path2), length(step_mult_irc_path2[basket[0]])+(nsteps_f[basket[0]]-nsteps_f_st[basket[0]])-1);
for h6:=0 to  (nsteps_f[basket[0]]-nsteps_f_st[basket[0]])-2 do
step_mult_irc_path2b[basket[0],h6]:='';
for h3:=h6 to Length(step_mult_irc_path2[basket[0]])+h6-1 do
step_mult_irc_path2b[basket[0],h3]:=step_mult_irc_path2[basket[0],h3-h6];
SetLength(step_mult_irc_path2,Length(step_mult_irc_path2b),length(step_mult_irc_path2b[basket[0]]));
for h3:=0 to Length(step_mult_irc_path2b[basket[0]])-1 do
step_mult_irc_path2[basket[0],h3]:=step_mult_irc_path2b[basket[0],h3];





setlength(energy_mult_irc_path2b,Length(energy_mult_irc_path2),length(energy_mult_irc_path2[basket[0]])+1+(nsteps_f[basket[0]]-nsteps_f_st[basket[0]]));
for h3:=0 to (nsteps_f[basket[0]]-nsteps_f_st[basket[0]])-1 do
energy_mult_irc_path2b[basket[0],h3]:=energy_mult_irc_path1[basket[0],nsteps_f[basket[0]]-(nsteps_f[basket[0]]-nsteps_f_st[basket[0]])+h3];
for i:=0 to nsteps_r[basket[0]]-1 do begin
if (i=length(energy_mult_irc_path2b[basket[0]])) or (i=length(energy_mult_irc_path2[basket[0]])) then Break;
energy_mult_irc_path2b[basket[0],i+h3]:=energy_mult_irc_path2[basket[0],i];
end;

for i:=0 to Length(energy_mult_irc_path1[basket[0]])-1 do
if energy_mult_irc_path1[basket[0],Length(energy_mult_irc_path1[basket[0]])-1-i]<>'' then Break;
setlength(energy_mult_irc_path1[basket[0]],length(energy_mult_irc_path1[basket[0]])-(nsteps_f[basket[0]]-nsteps_f_st[basket[0]])-i);

if energy_mult_irc_path2b[basket[0],length(energy_mult_irc_path2b[basket[0]])-1]='' then SetLength(energy_mult_irc_path2b,Length(energy_mult_irc_path2b),length(energy_mult_irc_path2b[basket[0]])-1);

{    //pattern only
if length(energy_irc_path2)>0 then begin
setlength(energy_irc_path2b,length(energy_irc_path2)+1+(Length(energy_irc_path1)-length(step_irc_path1)));
for h3:=0 to (Length(energy_irc_path1)-length(step_irc_path1)) do
energy_irc_path2b[h3]:=energy_irc_path1[length(energy_irc_path1)-1-(Length(energy_irc_path1)-length(step_irc_path1))+h3];
for i:=0 to length(energy_irc_path2)-1 do
energy_irc_path2b[i+h3]:=energy_irc_path2[i];
setlength(energy_irc_path1,length(energy_irc_path1)-1-(Length(energy_irc_path1)-length(step_irc_path1)));
}



//**************************************************************
if energy_mult_irc_path2b<>nil then begin
if energy_mult_irc_path2b[basket[0]]<>nil then begin
if  howlongs(step_mult_irc_path2[basket[0]])<howlongs(energy_mult_irc_path2b[basket[0]]) then  begin
Setlength(step_mult_irc_path2,length(step_mult_irc_path2),length(energy_mult_irc_path2b[basket[0]]));
step_mult_irc_path2[basket[0],howlongs(energy_mult_irc_path2b[basket[0]])-1]:=IntToSTr(StrToInt(step_mult_irc_path2[basket[0],howlongs(step_mult_irc_path2[basket[0]])-1])+1);
if  Rx_mult[basket[0], howlongr(Rx_mult[basket[0]])]<>-1  then begin
if  howlongr(Rx_mult[basket[0]])+1=length(Rx_mult[basket[0]]) then begin
SetLength(Rx_mult,length(Rx_mult),length(Rx_mult[basket[0]])+1);
Rx_mult[basket[0],howlongr(Rx_mult[basket[0]])]:=-1;
end;
if  howlongr(Rx_mult[basket[0]])+1<length(Rx_mult[basket[0]]) then
Rx_mult[basket[0],howlongr(Rx_mult[basket[0]])]:=-1;
end;
end;
end;
end;
//**************************************************************




modi2[basket[0]]:=True;



if  Length(energy_mult_irc_path2b[basket[0]])<=Length(step_mult_irc_path2[basket[0]]) then Nif:=Length(energy_mult_irc_path2b[basket[0]])
else Nif:=Length(step_mult_irc_path2[basket[0]]);
g:=0;
//if length(energy_irc_path2b)<=length(step_irc_path2) then Nif:=length(energy_irc_path2b)
//else Nif:=length(step_irc_path2);
for i:=0 to Length(energy_mult_irc_path2b[basket[0]])-1 do begin
  if i=length(step_mult_irc_path2[basket[0]]) then Break;
if step_mult_irc_path2[basket[0],i]<>'' then  begin
itm:=ListView1.Items.Add;
itm.Caption:=copy('           ',0,8-length(step_mult_irc_path2[basket[0],i]))+step_mult_irc_path2[basket[0],i];
itm.SubItems.Append(copy(probel,0,18-length(energy_mult_irc_path2b[basket[0],i]))+energy_mult_irc_path2b[basket[0],i]);
if step_mult_irc_path2[basket[0],i]='1' then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_mult_irc_path2b[basket[0],i])- strtofloat(energy_mult_irc_path1[basket[0],0]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_mult_irc_path2b[basket[0],i])- strtofloat(energy_mult_irc_path1[basket[0],0]))*23.06*27.21,-2)));
if StrToInt(step_mult_irc_path2[basket[0],i])>1 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_mult_irc_path2b[basket[0],i])- strtofloat(energy_mult_irc_path2b[basket[0],g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_mult_irc_path2b[basket[0],i])- strtofloat(energy_mult_irc_path2b[basket[0],g]))*23.06*27.21,-2)));
itm.SubItems.Append('Reverse');
g:=i;
end;
end;
end;



if (direction1_mult[basket[0]]='Forward') and (direction2_mult[basket[0]]='') then Label3.Caption:='Число точек в направлении Forward: '+ inttostr(howmuchs(step_mult_irc_path1[basket[0]])-1);
if (direction2_mult[basket[0]]='Reverse') and (direction1_mult[basket[0]]='') then Label3.Caption:='Число точек в направлении Forward: ---';
if (direction1_mult[basket[0]]='Forward') and (direction2_mult[basket[0]]='Reverse') then Label3.Caption:='Число точек в направлении Forward: '+ inttostr(howmuchs(step_mult_irc_path1[basket[0]])-1);
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then Label3.Caption:='Тип расчета: Downhill';


if (direction2_mult[basket[0]]='Reverse') and (direction1_mult[basket[0]]='') then Label4.Caption:='Число точек в направлении Reverse: '+ inttostr(howmuchs(step_mult_irc_path1[basket[0]])-1);
if (direction2_mult[basket[0]]='') and (direction1_mult[basket[0]]='Forward') then Label4.Caption:='Число точек в направлении Reverse: ---';
if (direction2_mult[basket[0]]='Reverse') and (direction1_mult[basket[0]]='Forward') then Label4.Caption:='Число точек в направлении Reverse: '+ inttostr(howmuchs(step_mult_irc_path2[basket[0]]));
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then  Label4.Caption:='Число точек Downhill: '+ inttostr(howlongr(Rx_mult[basket[0]])+1);

if (direction1_mult[basket[0]]<>'') or (direction2_mult[basket[0]]<>'') then Label5.Caption:='Общее число точек: ' +inttostr(howmuchs(step_mult_irc_path1[basket[0]])+howmuchs(step_mult_irc_path2[basket[0]])-1);
//if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then Label5.Caption:='Общее число точек: ' +inttostr(howlongr(Rx_mult[basket[0]])+1);


if (direction1_mult[basket[0]]='Forward') and (direction2_mult[basket[0]]='') then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(howlongs(energy_mult_irc_path1[basket[0]]));
if (direction2_mult[basket[0]]='Reverse') and (direction1_mult[basket[0]]='') then Label6.Caption:='Общее число шагов в направлении Forward: ---';
if (direction1_mult[basket[0]]='Forward') and (direction2_mult[basket[0]]='Reverse') then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(howlongs(energy_mult_irc_path1[basket[0]]));
if (nsteps_f[basket[0]]<>0) and (nsteps_r[basket[0]]<>0) then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(howlongs(energy_mult_irc_path1[basket[0]]));
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then Label5.Caption:='Число шагов Downhill: ' +inttostr(nsteps_f[basket[0]]);


if (direction2_mult[basket[0]]='Reverse') and (direction1_mult[basket[0]]='') then Label12.Caption:='Общее число шагов в направлении Reverse: ' +inttostr(howlongs(energy_mult_irc_path1[basket[0]]));
if (direction2_mult[basket[0]]='') and (direction1_mult[basket[0]]='Forward') then Label12.Caption:='Общее число шагов в направлении Reverse: ---';
if (direction2_mult[basket[0]]='Reverse') and (direction1_mult[basket[0]]='Forward') then Label12.Caption:='Общее число шагов в направлении Reverse: ' +inttostr(howlongs(energy_mult_irc_path2b[basket[0]]));
if (nsteps_f[basket[0]]<>0) and (nsteps_r[basket[0]]<>0) then Label12.Caption:='Общее число шагов в направлении Reverse: ' +inttostr(howlongs(energy_mult_irc_path2b[basket[0]]));

if energy_mult_irc_path2b<>nil then  begin
if (direction1_mult[basket[0]]<>'') or (direction2_mult[basket[0]]<>'') then Label13.Caption:='Общее число шагов: ' +inttostr(howlongs(energy_mult_irc_path1[basket[0]])+howlongs(energy_mult_irc_path2b[basket[0]]));
end
else  begin
if (direction1_mult[basket[0]]<>'') or (direction2_mult[basket[0]]<>'') then Label13.Caption:='Общее число шагов: ' +inttostr(howlongs(energy_mult_irc_path1[basket[0]]));
end;


if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then begin
Label6.Caption:='************************************';
Label12.Caption:='************************************';
Label13.Caption:='************************************';
end;


//Определяем номер такого элемента, у которого не ''
for i:=0 to Length(energy_mult_irc_path1[basket[0]])-1 do
if energy_mult_irc_path1[basket[0],Length(energy_mult_irc_path1[basket[0]])-1-i]<>'' then Break;


//Определяем номер такого элемента, у которого не ''
for j:=0 to Length(energy_mult_irc_path2[basket[0]])-1 do
if energy_mult_irc_path2[basket[0],Length(energy_mult_irc_path2[basket[0]])-1-j]<>'' then Break;




if ((direction1_mult[basket[0]]='Forward') and (direction2_mult[basket[0]]='')) or  ((direction1_mult[basket[0]]='Forward') and (direction2_mult[basket[0]]='Reverse')) then  begin
if (length(energy_mult_irc_path1[basket[0]])>0) and (energy_mult_irc_path1[basket[0],0]<>'') then Label7.Caption:='Е(Forw)-E(TS) = ' + Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path1[basket[0],0]) - strtofloat(energy_mult_irc_path1[basket[0],length(energy_mult_irc_path1[basket[0]])-1-i]))*23.06*27.21,-2))+' ккал'
else Label7.Caption:='Е(Forw)-E(TS) = ---';
end;
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='Reverse') then Label7.Caption:='Е(Forw)-E(TS) = ---';
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then Label7.Caption:='Е(P)-E(R) = '+  Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path1[basket[0],0]) - strtofloat(energy_mult_irc_path1[basket[0],length(energy_mult_irc_path1[basket[0]])-1-i]))*23.06*27.21,-2))+' ккал';

if ((direction2_mult[basket[0]]='Reverse') and (direction1_mult[basket[0]]=''))  then begin
if length(energy_mult_irc_path1[basket[0]])>0  then  Label8.Caption:='Е(TS)-E(Rev) = ' + Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path1[basket[0],length(energy_mult_irc_path1[basket[0]])-1-i])-strtofloat(energy_mult_irc_path1[basket[0],0]))*23.06*27.21,-2))+' ккал';
end;
if (direction2_mult[basket[0]]='Reverse') and (direction1_mult[basket[0]]='Forward') then begin
if (length(energy_mult_irc_path2[basket[0],0])>0) and (energy_mult_irc_path2[basket[0],0]<>'')  then  Label8.Caption:='Е(TS)-E(Rev) = ' + Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path2[basket[0],length(energy_mult_irc_path2[basket[0]])-1-j])-strtofloat(energy_mult_irc_path1[basket[0],0]))*23.06*27.21,-2))+' ккал';
if energy_mult_irc_path2[basket[0],0]='' then  Label8.Caption:='Е(TS)-E(Rev) = ---';
end;
if (direction2_mult[basket[0]]='') and (direction1_mult[basket[0]]='Forward') then  Label8.Caption:='Е(TS)-E(Rev) = ---';
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then  Label8.Caption:='';

if (length(energy_mult_irc_path1[basket[0]])>0) and (length(energy_mult_irc_path2[basket[0]])>0) and (energy_mult_irc_path1[basket[0],0]<>'') and (energy_mult_irc_path2[basket[0],0]<>'')  then  Label9.Caption:='Е(Forw)-E(Rev) = ' +Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path2[basket[0],length(energy_mult_irc_path2[basket[0]])-1-j])-strtofloat(energy_mult_irc_path1[basket[0],length(energy_mult_irc_path1[basket[0]])-1-i]))*23.06*27.21,-2))+' ккал'
else Label9.Caption:='Е(Forw)-E(Rev) = ---';
if (direction1_mult[basket[0]]='') and (direction2_mult[basket[0]]='') then  Label9.Caption:='';

Label10.Caption:='Результат: ';
if irc_found[basket[0]]=true then begin
Label11.Font.Color:=clblack;
Label11.Caption:='Reaction path calculation complete';
end
else  begin
Label11.Font.Color:=clred;
Label11.Caption:='WARNING! Reaction path calculation NOT complete!'
end;








end;




0: end;










procedure TForm37.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var i: integer;
begin
if Item.Index=0 then Sender.Canvas.Font.Style:=[fsBold];
if Item.Index>0 then begin
Sender.Canvas.Font.Style:=[];
if pos('Forward',ListView1.Items[Item.Index].Subitems[2])<>0 then Sender.Canvas.Brush.Color:=clYellow;         //       Font.Color:=clGreen;
if pos('Reverse',ListView1.Items[Item.Index].Subitems[2])<>0 then Sender.Canvas.Brush.Color:=clLime;          //       Font.Color:=clRed;
if pos('Downhill',ListView1.Items[Item.Index].Subitems[2])<>0 then Sender.Canvas.Brush.Color:=clWhite;
end;




end;

procedure TForm37.FormCreate(Sender: TObject);
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
end;



procedure TForm37.ComboBox1Change(Sender: TObject);
var i,j,Nif,h3,h6,g: Integer;
itm:  TListItem;
probel: WideString;
label 0;
begin
  if  dial=True then goto 0;
  ListView1.Clear;
  probel:='                                                                                        ';
Label2.Caption:='Наименование системы: '+task_mult[ComboBox1.ItemIndex];


//****************************************************************************
if energy_mult_irc_path2[basket[ComboBox1.ItemIndex]]<>nil then begin
if energy_mult_irc_path2[basket[ComboBox1.ItemIndex],0]='' then begin
if  howlongs(step_mult_irc_path1[basket[ComboBox1.ItemIndex]])+1<howlongs(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]]) then  begin
Setlength(step_mult_irc_path1,length(step_mult_irc_path1),length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]]));
step_mult_irc_path1[basket[ComboBox1.ItemIndex],howlongs(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1]:=inttostr(howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])+2);
if length(Rx_mult[basket[ComboBox1.ItemIndex]])<howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])+2 then  SetLength(Rx_mult,length(Rx_mult),length(Rx_mult[basket[ComboBox1.ItemIndex]])+1);
Rx_mult[basket[ComboBox1.ItemIndex],howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])]:=-1;
end;
end;
end;

//***************************************************************************



if  Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])<=Length(step_mult_irc_path1[basket[ComboBox1.ItemIndex]]) then Nif:=Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])
else Nif:=Length(step_mult_irc_path1[basket[ComboBox1.ItemIndex]]);

g:=0;
for i:=0 to Nif-1 do begin
if step_mult_irc_path1[basket[ComboBox1.ItemIndex],i]<>'' then  begin
itm:=ListView1.Items.Add;
itm.Caption:=copy('           ',0,8-length(step_mult_irc_path1[basket[ComboBox1.ItemIndex],i]))+step_mult_irc_path1[basket[ComboBox1.ItemIndex],i];
itm.SubItems.Append(copy(probel,0,18-length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],i]))+energy_mult_irc_path1[basket[ComboBox1.ItemIndex],i]);
if (direction1_mult[basket[ComboBox1.ItemIndex]]<>'') or (direction2_mult[basket[ComboBox1.ItemIndex]]<>'') then begin
if i=0 then itm.SubItems.Append('-');
if i>0 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],i])- strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],i])- strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],g]))*23.06*27.21,-2)));
if i=0 then itm.SubItems.Append('TS')
else begin
if ((direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[ComboBox1.ItemIndex]]='')) or  ((direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse')) then itm.SubItems.Append('Forward');
if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') then  itm.SubItems.Append('Reverse');
end;
end;
if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then begin
if i=0 then itm.SubItems.Append('-');
if i>0 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],i])- strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],i])- strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],g]))*23.06*27.21,-2)));
itm.SubItems.Append('Downhill');
end;
g:=i;
end;
end;


{
if modi2[basket[ComboBox1.ItemIndex]]=False then begin
if (length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])>0) and  (energy_mult_irc_path2[basket[ComboBox1.ItemIndex],0]<>'') then begin
setlength(energy_mult_irc_path2b,Length(energy_mult_irc_path2),length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])+1);
energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],0]:=energy_mult_irc_path1[basket[ComboBox1.ItemIndex],nsteps_f[basket[ComboBox1.ItemIndex]]-1];
for i:=0 to nsteps_r[basket[ComboBox1.ItemIndex]]-1 do
energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i+1]:=energy_mult_irc_path2[basket[ComboBox1.ItemIndex],i];
for i:=0 to Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1 do
if energy_mult_irc_path1[basket[ComboBox1.ItemIndex],Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i]<>'' then Break;

setlength(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]],length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i);
modi2[basket[ComboBox1.ItemIndex]]:=True;
end;
end; }


if modi2[basket[ComboBox1.ItemIndex]]=False then begin
if (length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])>0) and  (energy_mult_irc_path2[basket[ComboBox1.ItemIndex],0]<>'') then begin

h6:=0;

SetLength(step_mult_irc_path2b,Length(step_mult_irc_path2), length(step_mult_irc_path2[basket[ComboBox1.ItemIndex]])+(nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])-1);
for h6:=0 to  (nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])-2 do
step_mult_irc_path2b[basket[ComboBox1.ItemIndex],h6]:='';
if h6=-1 then h6:=0;
for h3:=h6 to Length(step_mult_irc_path2[basket[ComboBox1.ItemIndex]])+h6-1 do
step_mult_irc_path2b[basket[ComboBox1.ItemIndex],h3]:=step_mult_irc_path2[basket[ComboBox1.ItemIndex],h3-h6];
SetLength(step_mult_irc_path2,Length(step_mult_irc_path2b),length(step_mult_irc_path2b[basket[ComboBox1.ItemIndex]]));
for h3:=0 to Length(step_mult_irc_path2b[basket[ComboBox1.ItemIndex]])-1 do
step_mult_irc_path2[basket[ComboBox1.ItemIndex],h3]:=step_mult_irc_path2b[basket[ComboBox1.ItemIndex],h3];



{                  // Это блок дублирует следующий
setlength(energy_mult_irc_path2b,Length(energy_mult_irc_path2),length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])+1+(nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]]));
for h3:=0 to (nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])-1 do
energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],h3]:=energy_mult_irc_path1[basket[ComboBox1.ItemIndex],nsteps_f[basket[ComboBox1.ItemIndex]]-(nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])+h3];
for i:=0 to nsteps_r[basket[ComboBox1.ItemIndex]]-1 do
energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i+h3]:=energy_mult_irc_path2[basket[ComboBox1.ItemIndex],i];
for i:=0 to Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1 do
if energy_mult_irc_path1[basket[ComboBox1.ItemIndex],Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i]<>'' then Break;
setlength(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]],length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-(nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])-i);
if energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],length(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]])-1]='' then SetLength(energy_mult_irc_path2b,Length(energy_mult_irc_path2b),length(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]])-1);
}



if  energy_mult_irc_path2b=nil then SetLength(energy_mult_irc_path2b,nf);


if length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])+1+(nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])>Length(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]]) then
setlength(energy_mult_irc_path2b,Length(energy_mult_irc_path2),length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])+1+(nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]]));
for h3:=0 to (nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])-1 do
energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],h3]:=energy_mult_irc_path1[basket[ComboBox1.ItemIndex],nsteps_f[basket[ComboBox1.ItemIndex]]-(nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])+h3];
for i:=0 to nsteps_r[basket[ComboBox1.ItemIndex]]-1 do  begin
if (i=length(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]])) or (i=length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])) then Break;
energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i+h3]:=energy_mult_irc_path2[basket[ComboBox1.ItemIndex],i];
end;

for i:=0 to Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1 do
if energy_mult_irc_path1[basket[ComboBox1.ItemIndex],Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i]<>'' then Break;
setlength(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]],length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-(nsteps_f[basket[ComboBox1.ItemIndex]]-nsteps_f_st[basket[ComboBox1.ItemIndex]])-i);
modi2[basket[ComboBox1.ItemIndex]]:=True;
end;
end;




//**************************************************************
if energy_mult_irc_path2b<>nil then begin
if energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]]<>nil then begin
if energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],0]<>'' then begin
if  howlongs(step_mult_irc_path2[basket[ComboBox1.ItemIndex]])<howlongs(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]]) then  begin
Setlength(step_mult_irc_path2,length(step_mult_irc_path2),length(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]]));
step_mult_irc_path2[basket[ComboBox1.ItemIndex],howlongs(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]])-1]:=IntToSTr(StrToInt(step_mult_irc_path2[basket[ComboBox1.ItemIndex],howlongs(step_mult_irc_path2[basket[ComboBox1.ItemIndex]])-1])+1);
if  Rx_mult[basket[ComboBox1.ItemIndex], howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])]<>-1  then begin
if  howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])+1=length(Rx_mult[basket[ComboBox1.ItemIndex]]) then begin
SetLength(Rx_mult,length(Rx_mult),length(Rx_mult[basket[ComboBox1.ItemIndex]])+1);
Rx_mult[basket[ComboBox1.ItemIndex],howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])]:=-1;
end;
if  howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])+1<length(Rx_mult[basket[ComboBox1.ItemIndex]]) then
Rx_mult[basket[ComboBox1.ItemIndex],howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])]:=-1;
end;

end;
end;
end;
end;
//**************************************************************


if  energy_mult_irc_path2b=nil then SetLength(energy_mult_irc_path2b,nf);

if  Length(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]])<=Length(step_mult_irc_path2[basket[ComboBox1.ItemIndex]]) then Nif:=Length(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]])
else Nif:=Length(step_mult_irc_path2[basket[ComboBox1.ItemIndex]]);


//if length(energy_irc_path2b)<=length(step_irc_path2) then Nif:=length(energy_irc_path2b)
//else Nif:=length(step_irc_path2);
if (length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])>0) and  (energy_mult_irc_path2[basket[ComboBox1.ItemIndex],0]<>'') then begin
g:=0;
for i:=0 to Nif-1 do begin
if i=length(step_mult_irc_path2[basket[ComboBox1.ItemIndex]]) then Break;
if step_mult_irc_path2[basket[ComboBox1.ItemIndex],i]<>'' then  begin
itm:=ListView1.Items.Add;
itm.Caption:=copy('           ',0,8-length(step_mult_irc_path2[basket[ComboBox1.ItemIndex],i]))+step_mult_irc_path2[basket[ComboBox1.ItemIndex],i];
itm.SubItems.Append(copy(probel,0,18-length(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i]))+energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i]);
if step_mult_irc_path2[basket[ComboBox1.ItemIndex],i]='1' then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i])- strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],0]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i])- strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],0]))*23.06*27.21,-2)));
if StrToInt(step_mult_irc_path2[basket[ComboBox1.ItemIndex],i])>1 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i])- strtofloat(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],g]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],i])- strtofloat(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex],g]))*23.06*27.21,-2)));
itm.SubItems.Append('Reverse');
g:=i;
end;
end;
end;



if (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then Label3.Caption:='Число точек в направлении Forward: '+ inttostr(howmuchs(step_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1);
if (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') and (direction1_mult[basket[ComboBox1.ItemIndex]]='') then Label3.Caption:='Число точек в направлении Forward: ---';
if (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') then Label3.Caption:='Число точек в направлении Forward: '+ inttostr(howmuchs(step_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1);
if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then Label3.Caption:='Тип расчета: Downhill';


if (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') and (direction1_mult[basket[ComboBox1.ItemIndex]]='') then Label4.Caption:='Число точек в направлении Reverse: '+ inttostr(howmuchs(step_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1);
if (direction2_mult[basket[ComboBox1.ItemIndex]]='') and (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') then Label4.Caption:='Число точек в направлении Reverse: ---';
if (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') and (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') then Label4.Caption:='Число точек в направлении Reverse: '+ inttostr(howmuchs(step_mult_irc_path2[basket[ComboBox1.ItemIndex]]));
if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then  Label4.Caption:='Число точек Downhill: '+ inttostr(howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])+1);

if (direction1_mult[basket[ComboBox1.ItemIndex]]<>'') or (direction2_mult[basket[ComboBox1.ItemIndex]]<>'') then Label5.Caption:='Общее число точек: ' +inttostr(howmuchs(step_mult_irc_path1[basket[ComboBox1.ItemIndex]])+howmuchs(step_mult_irc_path2[basket[ComboBox1.ItemIndex]])-1);
//if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then Label5.Caption:='Общее число точек: ' +inttostr(howlongr(Rx_mult[basket[ComboBox1.ItemIndex]])+1);


if (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(howlongs(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]]));
if (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') and (direction1_mult[basket[ComboBox1.ItemIndex]]='') then Label6.Caption:='Общее число шагов в направлении Forward: ---';
if (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(howlongs(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]]));
if (nsteps_f[basket[ComboBox1.ItemIndex]]<>0) and (nsteps_r[basket[ComboBox1.ItemIndex]]<>0) then Label6.Caption:='Общее число шагов в направлении Forward: ' +inttostr(howlongs(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]]));
if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then Label5.Caption:='Число шагов Downhill: ' +inttostr(nsteps_f[basket[ComboBox1.ItemIndex]]);


if (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') and (direction1_mult[basket[ComboBox1.ItemIndex]]='') then Label12.Caption:='Общее число шагов в направлении Reverse: ' +inttostr(howlongs(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]]));
if (direction2_mult[basket[ComboBox1.ItemIndex]]='') and (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') then Label12.Caption:='Общее число шагов в направлении Reverse: ---';
if (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') and (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') then Label12.Caption:='Общее число шагов в направлении Reverse: ' +inttostr(howlongs(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]]));
if (nsteps_f[basket[ComboBox1.ItemIndex]]<>0) and (nsteps_r[basket[ComboBox1.ItemIndex]]<>0) then Label12.Caption:='Общее число шагов в направлении Reverse: ' +inttostr(howlongs(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]]));

if (direction1_mult[basket[ComboBox1.ItemIndex]]<>'') or (direction2_mult[basket[ComboBox1.ItemIndex]]<>'') then Label13.Caption:='Общее число шагов: ' +inttostr(howlongs(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])+howlongs(energy_mult_irc_path2b[basket[ComboBox1.ItemIndex]]));
if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then begin
Label6.Caption:='************************************';
Label12.Caption:='************************************';
Label13.Caption:='************************************';
end;





//Определяем номер такого элемента, у которого не ''
for i:=0 to Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1 do
if energy_mult_irc_path1[basket[ComboBox1.ItemIndex],Length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i]<>'' then Break;


//Определяем номер такого элемента, у которого не ''
for j:=0 to Length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])-1 do
if energy_mult_irc_path2[basket[ComboBox1.ItemIndex],Length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])-1-j]<>'' then Break;




if ((direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[ComboBox1.ItemIndex]]='')) or  ((direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse')) then  begin
if (length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])>0) and (energy_mult_irc_path1[basket[ComboBox1.ItemIndex],0]<>'') then Label7.Caption:='Е(Forw)-E(TS) = ' + Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],0]) - strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i]))*23.06*27.21,-2))+' ккал'
else Label7.Caption:='Е(Forw)-E(TS) = ---';
end;
if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') then Label7.Caption:='Е(Forw)-E(TS) = ---';
if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then  Label7.Caption:='E(P)-E(R) = '   + Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],0]) - strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i]))*23.06*27.21,-2))+' ккал';


if (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') and (direction1_mult[basket[ComboBox1.ItemIndex]]='')  then begin
if length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])>0  then  Label8.Caption:='Е(TS)-E(Rev) = ' + Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i])-strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],0]))*23.06*27.21,-2))+' ккал';
end;
if (direction2_mult[basket[ComboBox1.ItemIndex]]='Reverse') and (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') then begin
if (length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex],0])>0) and (energy_mult_irc_path2[basket[ComboBox1.ItemIndex],0]<>'')  then  Label8.Caption:='Е(TS)-E(Rev) = ' + Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path2[basket[ComboBox1.ItemIndex],length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])-1-j])-strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],0]))*23.06*27.21,-2))+' ккал';
if energy_mult_irc_path2[basket[ComboBox1.ItemIndex],0]='' then  Label8.Caption:='Е(TS)-E(Rev) = ---';
end;
if (direction2_mult[basket[ComboBox1.ItemIndex]]='') and (direction1_mult[basket[ComboBox1.ItemIndex]]='Forward') then  Label8.Caption:='Е(TS)-E(Rev) = ---';


if (length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])>0) and (length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])>0) and (energy_mult_irc_path1[basket[ComboBox1.ItemIndex],0]<>'') and (energy_mult_irc_path2[basket[ComboBox1.ItemIndex],0]<>'')  then  Label9.Caption:='Е(Forw)-E(Rev) = ' +Floattostr(-1*RoundTo((strtofloat(energy_mult_irc_path2[basket[ComboBox1.ItemIndex],length(energy_mult_irc_path2[basket[ComboBox1.ItemIndex]])-1-j])-strtofloat(energy_mult_irc_path1[basket[ComboBox1.ItemIndex],length(energy_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1-i]))*23.06*27.21,-2))+' ккал'
else Label9.Caption:='Е(Forw)-E(Rev) = ---';

if (direction1_mult[basket[ComboBox1.ItemIndex]]='') and (direction2_mult[basket[ComboBox1.ItemIndex]]='') then begin
Label8.Caption:='';
Label9.Caption:='';
end;

Label10.Caption:='Результат: ';
if irc_found[basket[ComboBox1.ItemIndex]]=true then begin
Label11.Font.Color:=clblack;
Label11.Caption:='Reaction path calculation complete';
end
else  begin
Label11.Font.Color:=clred;
Label11.Caption:='WARNING! Reaction path calculation NOT complete!'
end;


 if Form41.Showing then Form41.Show;





0: end;

procedure TForm37.BitBtn3Click(Sender: TObject);
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
WriteLn(f,' *                Intrinsic reaction coordinate               *');
WriteLn(f,' *                      Energy evolution                      *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                          Magellan                          *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,' File: ' +Combobox1.Items[Combobox1.ItemIndex]);
if pos('****',Label13.Caption)=0 then begin
WriteLn(f,' Number of FORWARD points: ' +Copy(Label3.Caption,Pos(':',Label3.Caption)+2,Length(Label3.Caption))); ///////////////////////////////////
WriteLn(f,' Number of REVERSE points: ' +Copy(Label4.Caption,Pos(':',Label4.Caption)+2,Length(Label4.Caption)));
WriteLn(f,' Number of ALL points: ' +Copy(Label5.Caption,Pos(':',Label5.Caption)+2,Length(Label5.Caption)));
WriteLn(f,' Number of FORWARD steps: ' +Copy(Label6.Caption,Pos(':',Label6.Caption)+2,Length(Label6.Caption)));
WriteLn(f,' Number of REVERSE steps: ' +Copy(Label12.Caption,Pos(':',Label12.Caption)+2,Length(Label12.Caption)));
WriteLn(f,' Number of ALL steps: ' +Copy(Label13.Caption,Pos(':',Label13.Caption)+2,Length(Label13.Caption)));
WriteLn(f,' Termination: ' + Label11.Caption);
WriteLn(f,' E(Forw)-E(TS): ' +Copy(Label7.Caption,Pos('=',Label7.Caption)+2,Length(Label7.Caption)));
WriteLn(f,' E(TS)-E(Rev): ' +Copy(Label8.Caption,Pos('=',Label8.Caption)+2,Length(Label8.Caption)));
WriteLn(f,' E(Forw)-E(Rev): ' +Copy(Label9.Caption,Pos('=',Label9.Caption)+2,Length(Label9.Caption)));
end
else begin
WriteLn(f,' Type of calculation: DOWNHILL');
WriteLn(f,' Number of DOWNHILL points: ' + Copy(Label4.Caption,Pos(':',Label4.Caption)+2,Length(Label4.Caption)));
WriteLn(f,' Number of DOWNHILL steps: '  + Copy(Label5.Caption,Pos(':',Label5.Caption)+2,Length(Label5.Caption)));
WriteLn(f,' Termination: ' + Label11.Caption);
WriteLn(f,' E(P)-E(R): '   + Copy(Label7.Caption,Pos('=',Label7.Caption)+2,Length(Label7.Caption)));
end;
WriteLn(f,'');
WriteLn(f,'       Step #          Energy, a.u.        DeltaE, kcal           Direction');
WriteLn(f,'');
for i:=0 to Form37.ListView1.Items.Count-1 do begin
  for j:=1 to Length(Form37.ListView1.Items[i].SubItems[1]) do
  if Copy(Form37.ListView1.Items[i].SubItems[1],j,1)<>'' then Break;
  e:=Copy(Form37.ListView1.Items[i].SubItems[1],j,Length(Form37.ListView1.Items[i].SubItems[1]));
  if e<>'-' then d:=floattostrf(strtofloat(e),ffFixed,5,2)
   else d:='0.00';
WriteLn(f,Copy(probel,1,10-length(Form37.ListView1.Items[i].Caption))+Form37.ListView1.Items[i].Caption+Copy(probel,1,25-length(Form37.ListView1.Items[i].SubItems[0]))+Form37.ListView1.Items[i].SubItems[0]+Copy(probel,1,16-length(d))+d+Copy(probel,1,23-length(Form37.ListView1.Items[i].SubItems[2]))+Form37.ListView1.Items[i].SubItems[2]);
end;
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,' **** END **** / '+Datetostr(Now)+' /');
CloseFile(f);
end;





end;

procedure TForm37.BitBtn4Click(Sender: TObject);
var MSExcel: OleVariant;
Rez: HRESULT;
ClassID: TCLSID;
probel: widestring;
i,j,ps: integer;
reagent,product: Array of widestring;
XLSeparator:string;
label 0;
begin

begin
Rez := CLSIDFromProgID(PWideChar(WideString('Excel.Application')), ClassID);
if Rez <> S_OK then begin
MessageDlg('EXCEL не установлен',mtERROR,[mbok],0);
goto 0;
end;
end;


MSExcel:=CreateOleObject('Excel.Application');
MSExcel.Workbooks.Add;
MSExcel.Visible:=True;
XLSeparator:= MSExcel.DecimalSeparator;


MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,3].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,4].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,5].Font.Bold := True;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,3].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,4].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,5].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[2,4].HorizontalAlignment := xlRight;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['C:C'].ColumnWidth := 20;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['D:D'].ColumnWidth := 20;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['E:E'].ColumnWidth := 20;
MSExcel.Cells[1,2]:='Точка #';
MSExcel.Cells[1,3]:='Энергия, а.е.';
MSExcel.Cells[1,4]:='Разность, ккал';
MSExcel.Cells[1,5]:='Направление';


for i:=0 to Form37.ListView1.Items.Count-1 do   begin
MSExcel.WorkBooks[1].WorkSheets[1].Cells[i+2,5].HorizontalAlignment := xlRight;
//MSExcel.Cells[i+2,3].NumberFormat:=Format('000%s00', [XLSeparator]);

//if dial=true then begin
MSExcel.ActiveSheet.Range['C:C'].NumberFormat  := '0,00000000';
MSExcel.ActiveSheet.Range['D:D'].NumberFormat  := '0,00';
MSExcel.Cells[i+2,2]:=Form37.ListView1.Items[i].Caption;
MSExcel.Cells[i+2,3]:=Form37.ListView1.Items[i].SubItems[0];
if Form37.ListView1.Items[i].SubItems[1]<>'-' then   MSExcel.Cells[i+2,4]:=Form37.ListView1.Items[i].SubItems[1]
else MSExcel.Cells[i+2,4]:='0.00';
MSExcel.Cells[i+2,5]:=Form37.ListView1.Items[i].SubItems[2]
end;

0: end;

procedure TForm37.BitBtn5Click(Sender: TObject);
var i,j,k,g: Integer;
minus: Boolean;
begin
if dial=True then begin
  j:=0;
  Rx_show:=nil;
  irc_fin:=nil;
  if Rx[length(Rx)-1]<>-1 then SetLength(Rx_show,Length(Rx)+1) else SetLength(Rx_show,Length(Rx));
  for i:=0 to Length(step_irc_path1)-1 do begin
  if step_irc_path1[i]<>'' then begin
  SetLength(irc_fin,Length(irc_fin)+1);
  irc_fin[j]:=i;
  j:=j+1;
  end;
  end;
  for k:=0 to Length(step_irc_path2)-1 do begin
  if step_irc_path2[k]<>'' then begin
  SetLength(irc_fin,Length(irc_fin)+1);
  irc_fin[j]:=i+k;
  j:=j+1;
  end;
  end;


  if Rx[length(Rx)-1]<>-1 then g:=0 else g:=1;
  minus:=False;
  Rx_show[0]:=0;
  for i:=0 to Length(Rx)-1-g do  begin
  if i=0 then Rx_show[i+1]:=Rx[i];
  if i>0 then  begin
  if (Rx[i]<Rx[i-1]) and (Rx[i]>0) then minus:=True;
  if minus=True then Rx_show[i+1]:=-1*Rx[i] else
  Rx_show[i+1]:=Rx[i];
  end;
  end;

end


else begin
  j:=0;
  Rx_show:=nil;
  irc_fin:=nil;
  SetLength(Rx_show,Length(Rx_mult[basket[ComboBox1.ItemIndex]])+1);
  for i:=0 to Length(step_mult_irc_path1[basket[ComboBox1.ItemIndex]])-1 do begin
  if step_mult_irc_path1[basket[ComboBox1.ItemIndex],i]<>'' then begin
  SetLength(irc_fin,Length(irc_fin)+1);
  irc_fin[j]:=i;
  j:=j+1;
  end;
  end;
  i:=irc_fin[length(irc_fin)-1]+2;
  for k:=0 to Length(step_mult_irc_path2[basket[ComboBox1.ItemIndex]])-1 do begin
  if step_mult_irc_path2[basket[ComboBox1.ItemIndex],k]<>'' then begin
  SetLength(irc_fin,Length(irc_fin)+1);
  irc_fin[j]:=i+k;
  j:=j+1;
  end;
  end;


  minus:=False;
  Rx_show[0]:=0;
  for i:=0 to Length(Rx_mult[basket[ComboBox1.ItemIndex]])-1 do  begin
  if Rx_mult[basket[ComboBox1.ItemIndex],i]=-1 then Break;
  if i=0 then Rx_show[i+1]:=Rx_mult[basket[ComboBox1.ItemIndex],i];
  if i>0 then  begin
  if (Rx_mult[basket[ComboBox1.ItemIndex],i]<Rx_mult[basket[ComboBox1.ItemIndex],i-1]) and (Rx_mult[basket[ComboBox1.ItemIndex],i]>0) then minus:=True;
  if minus=True then Rx_show[i+1]:=-1*Rx_mult[basket[ComboBox1.ItemIndex],i] else
  Rx_show[i+1]:=Rx_mult[basket[ComboBox1.ItemIndex],i];
  end;
  end;

  if Rx_show[length(Rx_show)-1]=0 then Rx_show[length(Rx_show)-1]:=-1;


end;

 if (cli=True) and (irc_nc<=0)  then irc_nc:=0;





if cli=false then Form18.Show;
end;

end.
