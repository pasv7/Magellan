unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, StdCtrls, Buttons, ComCtrls, math, ComObj, OleServer, ExcelXP, ActiveX;

type
  TForm12 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ListView1: TListView;
    SaveDialog1: TSaveDialog;
    Button1: TButton;
    ExcelApplication1: TExcelApplication;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  step,energy,delta: Array of string;
  step_mult,energy_mult,delta_mult: Array of array of string;
  Nsteps: array of word;
  z_found: array of boolean;

implementation

uses Unit1, Unit13, Unit18, Unit24, Unit37, Unit44, Unit49;

{$R *.dfm}

procedure TForm12.FormCreate(Sender: TObject);
begin
Form12.ListView1.Column[0].Caption:='Шаг';
Form12.ListView1.Column[1].Caption:='Энергия, а.е.';
Form12.ListView1.Column[2].Caption:='Разность, ккал';
end;

procedure TForm12.FormShow(Sender: TObject);
var f: TextFile;
itm: TListItem;
str,a,b,probel,task: widestring;    //a - промежуточная переменная для поиска подстроки "Номер шага"
i,k,k1,k2,cnt,ps,j,maxi: integer;
z: boolean;
label 0,1,2,3;
begin
ListView1.Clear;
Combobox1.Clear;

step:=nil;
energy:=nil;
delta:=nil;
step_mult:=nil;
energy_mult:=nil;
delta_mult:=nil;
////////////////////////////Очистка  глобальных переменных IRC,Trj,Scan,,,
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

/////////////////////////////


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
if pos('Stationary point found',str)<>0 then  z:=true;
if pos('Step number',str)<>0 then begin
i:=i+1;
setlength(step,i+2);
a:=copy(str,pos('Step number',str)+length('Step number'),50);
for k1:=0 to 20 do
if copy(a,k1,1)<>' ' then break;
for k2:=0 to 10 do
if copy(a,k2+k1,1)=' ' then break;
i:=i-1;
step[i+1]:=copy(a,k1,k2);
end;       ///////////////////////////  конец  if pos('Step number',str)<>0 then begin
if (pos('SCF Done',str)<>0) or ((pos(' Energy=',str)<>0) and (pos(' NIter=',str)<>0)) then  begin
i:=i+1;
setlength(energy,i+1);

{

a:=copy(str,pos('=',str)+1,100);
for  k:=0 to length(a) do
if copy(a,k,1)<>' ' then b:=copy(a,k,100);
for  k:=0 to length(b) do
if copy(b,k,1)=' ' then b:=copy(b,0,k-1);
}
                           ////////////ищем значение энергии//////////////
for  k:=0 to length(copy(str,pos('=',str)+1,100)) do begin
if copy(copy(str,pos('=',str)+1,100),k,1)<>' ' then begin b:=copy(copy(str,pos('=',str)+1,100),k,100);
break;
end;
end;
for  k:=0 to length(b) do
if copy(b,k,1)=' ' then begin b:=copy(b,0,k-1);
break;
end;
energy[i]:=b;





//energy[i]:=copy(str,pos('=',str)+3,pos('A.U.',str)-pos('=',str)-8);
end;       ///////////////////////////  конец  if pos('SCF Done',str)<>0 then  begin




end;      // конец while not eof(f) do begin
CloseFile(f);

if length(step)=0 then begin
showmessage('Файл '+ Form1.OpenDialog1.FileName +' не содержит данных по оптимизации геометрии!');
goto 0;
end;

cnt:=i;

probel:='                                                                    ';
step[0]:='0';

//itm:=Form12.ListView1.Items.Add;

setlength(delta,cnt+1);

for i:=0 to cnt do begin
itm:=Form12.ListView1.Items.Add;
itm.Caption:=copy(probel,0,8-length(step[i]))+step[i];
itm.SubItems.Append(copy(probel,0,18-length(energy[i]))+energy[i]);
if i=cnt then begin
itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy[cnt])- strtofloat(energy[cnt-1]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy[cnt])- strtofloat(energy[cnt-1]))*23.06*27.21,-2)));
delta[i]:=floattostr(RoundTo((strtofloat(energy[cnt])- strtofloat(energy[cnt-1]))*23.06*27.21,-2));
break;
end;
if i<>0 then begin
itm.SubItems.Append(copy(probel,0,14-length(floattostr(RoundTo((strtofloat(energy[i])- strtofloat(energy[i-1]))*23.06*27.21,-2))))+ floattostr(RoundTo((strtofloat(energy[i])- strtofloat(energy[i-1]))*23.06*27.21,-2)));
delta[i]:=floattostr(RoundTo((strtofloat(energy[i])- strtofloat(energy[i-1]))*23.06*27.21,-2));
end
else begin
itm.SubItems.Append(copy(probel,0,14-length('-'))+'-');
delta[i]:='-';
end;

end;


For k:=0 to Form12.ListView1.Items.Count-1 do begin
if  copy(Form12.ListView1.Items.Item[k].Caption,length(Form12.ListView1.Items.Item[k].Caption),1)=' ' then begin
ListView1.Items.Item[k].Caption:='SCF recalc';
end;
end;


k1:=0;
for k:=1 to Form12.ListView1.Items.Count-1 do begin
if step[k]='' then begin
step[k]:=step[k-1];
k1:=k1+1;
end;
end;


////////////////ищем название задачи без полного пути///////////////
ps:=0;
for i:=0 to length(Form1.OpenDialog1.FileName) do
if copy(Form1.OpenDialog1.FileName,i,1)='\'   then ps:=i;
task:=copy(Form1.OpenDialog1.FileName,ps+1,100);
////////////////////////////////////////////////////////////////////

Label2.Caption:='Наименование системы: '+task;
Label3.Caption:='Общее число шагов: ' +inttostr(cnt-k1);
Label4.Caption:='Общее понижение энергии: '+ Floattostr(RoundTo((strtofloat(energy[0])-strtofloat(energy[cnt]))*23.06*27.21,-2))+' ккал';
Label5.Caption:='Результат: ';
if z=true then Label6.Caption:='Stationary point found'
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='WARNING! Stationary point not found!'
end;

Combobox1.Items.Text:=Form1.OpenDialog1.FileName;
Combobox1.ItemIndex:=0;


end // конец открытия одного файла

///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// OUT (НЕСКОЛЬКО ФАЙЛОВ)///////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

// Теперь диалог открытия нескольких файлов

else begin
maxi:=0;
i:=0;
setlength(z_found,nf+1);
Label2.Caption:='';
Label3.Caption:='';
Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
Label6.Font.Color:=clBlack;
step_mult:=nil;
energy_mult:=nil;
Nsteps:=nil;
delta_mult:=nil;
setlength(Nsteps,nf);
if length(basket)=0 then setlength(basket,nf);
for j:=0 to nf-1 do  begin
AssignFile(f,Form1.OpenDialog2.Files[j]);
z_found[j]:=false;
Reset(f);

while not eof(f) do begin
ReadLn(f,str);
if (pos('Link1:',str)<>0) or (pos('Normal termination',str)<>0) and (length(step_mult)>=1) then goto 1;
if pos('Stationary point found',str)<>0 then  z_found[j]:=true;
if pos('Step number',str)<>0 then begin
//i:=i+1;
if maxi<i then begin
setlength(step_mult,nf,i+1);
maxi:=i;
end
else  setlength(step_mult,nf,maxi+1);

a:=copy(str,pos('Step number',str)+length('Step number'),50);
for k1:=0 to 20 do
if copy(a,k1,1)<>' ' then break;
for k2:=0 to 10 do
if copy(a,k2+k1,1)=' ' then break;
//i:=i-1;
step_mult[j,i]:=copy(a,k1,k2);
end;       ///////////////////////////  конец  if pos('Step number',str)<>0 then begin
if (pos('SCF Done',str)<>0) or ((pos(' Energy=',str)<>0) and (pos(' NIter=',str)<>0)) then  begin

if i=0 then begin
setlength(step_mult,nf,maxi+1);
step_mult[j,i]:='0';
end;



//i:=i+1;

if maxi<i then begin
setlength(energy_mult,nf,i+1);
maxi:=i;
end
else  setlength(energy_mult,nf,maxi+1);


for  k:=0 to length(copy(str,pos('=',str)+1,100)) do begin
if copy(copy(str,pos('=',str)+1,100),k,1)<>' ' then begin b:=copy(copy(str,pos('=',str)+1,100),k,100);
break;
end;
end;
for  k:=0 to length(b) do begin
if copy(b,k,1)=' ' then begin b:=copy(b,0,k-1);
break;
end;
end;
energy_mult[j,i]:=b;
if i>0 then begin
if maxi<i then begin
setlength(delta_mult,nf,i+1);
maxi:=i;
end
else  setlength(delta_mult,nf,maxi+1);

delta_mult[j,i]:=floattostr(RoundTo((strtofloat(energy_mult[j,i])- strtofloat(energy_mult[j,i-1]))*23.06*27.21,-2));
end;
i:=i+1;
end;
end;
//Nsteps[j]:=i;
1:
CloseFile(f);
if energy_mult=nil then begin
Nsteps[j]:=0;
goto 2;
end;
if energy_mult[j]=nil then begin
Nsteps[j]:=0;
goto 2;
end;
if maxi=0 then begin
goto 2;
end;
if (length(energy_mult[j])<length(step_mult[j])) or ((energy_mult[j,i]='') and (step_mult[j,i]<>''))  then  begin
setlength(energy_mult[j],length(step_mult[j]));
if i>0 then energy_mult[j,i]:= energy_mult[j,i-1];
end;
if delta_mult=nil then setlength(delta_mult,nf,maxi+1);
delta_mult[j,0]:='-';
setlength(energy_mult,nf,maxi+1);
setlength(delta_mult,nf,maxi+1);
if  energy_mult[j,maxi]='' then energy_mult[j,maxi]:=energy_mult[j,maxi-1];
if  delta_mult[j,maxi]='' then delta_mult[j,maxi]:='0';
if (delta_mult[j,i]='') and (energy_mult[j,i]<>'') then delta_mult[j,i]:='0';



for k1:=0 to length(step_mult[j])-1 do
if step_mult[j,length(step_mult[j])-1-k1]<>'' then break;

Nsteps[j]:=length(step_mult[j])-1-k1;



if (delta_mult[j,i]='') and (energy_mult[j,i]='') then Nsteps[j]:=0;
2: i:=0;
end;



basket:=nil;
k:=0;
setlength(basket,nf);
for j:=0 to nf-1 do   begin
if  (Nsteps[j]>=1) and (Nsteps[j]<=50000) then begin
basket[k]:=j;   // номер ненулевого элемента
Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
k:=k+1;
end
else showmessage('Файл '+ Form1.OpenDialog2.Files[j] +' не содержит данных по оптимизации геометрии!');
end;

Combobox1.ItemIndex:=0;


probel:='                                                                    ';


if Nsteps[basket[0]]>0 then begin

for i:=0 to Nsteps[basket[0]] do begin
if i<Nsteps[basket[0]] then
if (step_mult[basket[0],i]='') and (step_mult[basket[0],i+1]<>'') then step_mult[basket[0],i]:='SCF recalc';
itm:=Form12.ListView1.Items.Add;
itm.Caption:=copy(probel,0,8-length(step_mult[basket[0],i]))+step_mult[basket[0],i];
itm.SubItems.Append(copy(probel,0,18-length(energy_mult[basket[0],i]))+energy_mult[basket[0],i]);
itm.SubItems.Append(copy(probel,0,14-length(delta_mult[basket[0],i]))+delta_mult[basket[0],i]);
end;



////////////////ищем название задачи без полного пути///////////////
ps:=0;
for i:=0 to length(Combobox1.Items[Combobox1.Itemindex]) do
if copy(Combobox1.Items[Combobox1.Itemindex],i,1)='\'   then ps:=i;
task:=copy(Combobox1.Items[Combobox1.Itemindex],ps+1,100);
////////////////////////////////////////////////////////////////////

Label2.Caption:='Наименование системы: '+task;
Label3.Caption:='Общее число шагов: ' +inttostr(Nsteps[0]);
Label4.Caption:='Общее понижение энергии: '+ Floattostr(RoundTo((strtofloat(energy_mult[basket[0],0])-strtofloat(energy_mult[basket[0],Nsteps[basket[Combobox1.Itemindex]]]))*23.06*27.21,-2))+' ккал';
Label5.Caption:='Результат: ';
if z_found[basket[0]]=true then begin
Label6.Font.Color:=clBlack;
Label6.Caption:='Stationary point found' ;
end
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='WARNING! Stationary point not found!'
end;


end;





end;  // конец диалога открытия нескольких файлов
0: end;












procedure TForm12.BitBtn1Click(Sender: TObject);
begin
Form13.Show;
end;

procedure TForm12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form12.ListView1.Clear;
Label6.Font.Color:=clBlack;
end;

procedure TForm12.BitBtn2Click(Sender: TObject);
var f: TextFile;
i: integer;
probel,a: widestring;
begin
probel:='                                                                         ';
if SaveDialog1.Execute then begin
if  pos('.txt',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.txt';
AssignFile(f,a);
Rewrite(f);
WriteLn(f,' **************************************************************');
WriteLn(f,' *                Optimization of geometry                    *');
WriteLn(f,' *                    Energy evolution                        *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                         PANDORA                            *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,' File: ' +Combobox1.Items[Combobox1.ItemIndex]);
WriteLn(f,'');
WriteLn(f,'       Step #          Energy, a.u.        DeltaE, kcal');
WriteLn(f,'');
for i:=0 to Form12.ListView1.Items.Count-1 do begin
if dial=true then  begin
if delta[i]='-'  then delta[i]:='0';
WriteLn(f,copy(probel,0,10-length(step[i]))+step[i]+copy(probel,0,25-length(energy[i]))+energy[i]+copy(probel,0,15-length(floattostrf(strtofloat(delta[i]),ffFixed,10,2)))+floattostrf(strtofloat(delta[i]),ffFixed,10,2)         );
end;
if dial=false then begin
if delta_mult[basket[Combobox1.ItemIndex],i]='-'  then delta_mult[basket[Combobox1.ItemIndex],i]:='0';
WriteLn(f,copy(probel,0,10-length(step_mult[basket[Combobox1.ItemIndex],i]))+step_mult[basket[Combobox1.ItemIndex],i]+copy(probel,0,25-length(energy_mult[basket[Combobox1.ItemIndex],i]))+energy_mult[basket[Combobox1.ItemIndex],i]+copy(probel,0,15-length(floattostrf(strtofloat(delta_mult[basket[Combobox1.ItemIndex],i]),ffFixed,10,2)))+floattostrf(strtofloat(delta_mult[basket[Combobox1.ItemIndex],i]),ffFixed,10,2)        );
end;
end;
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,' **** END **** / '+Datetostr(Now)+' /');
CloseFile(f);
end;
end;


procedure TForm12.Button1Click(Sender: TObject);
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
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,2].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,3].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[1,4].HorizontalAlignment := xlRight;
MSExcel.WorkBooks[1].WorkSheets[1].Cells[2,4].HorizontalAlignment := xlRight;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['C:C'].ColumnWidth := 20;
MSExcel.ActiveWorkbook.ActiveSheet.Columns.Range['D:D'].ColumnWidth := 20;
MSExcel.Cells[1,2]:='Шаг';
MSExcel.Cells[1,3]:='Энергия, а.е.';
MSExcel.Cells[1,4]:='Разность, ккал';

for i:=0 to Form12.ListView1.Items.Count-1 do   begin

//MSExcel.Cells[i+2,3].NumberFormat:=Format('000%s00', [XLSeparator]);

if dial=true then begin
MSExcel.ActiveSheet.Range['C:C'].NumberFormat  := '0,00000000';
MSExcel.ActiveSheet.Range['D:D'].NumberFormat  := '0,00';
MSExcel.Cells[i+2,2]:=step[i];
MSExcel.Cells[i+2,3]:=energy[i];
MSExcel.Cells[i+2,4]:=delta[i];
end
else begin
MSExcel.ActiveSheet.Range['C:C'].NumberFormat  := '0,00000000';
MSExcel.ActiveSheet.Range['D:D'].NumberFormat  := '0,00';
MSExcel.Cells[i+2,2]:=step_mult[basket[Combobox1.Itemindex],i];
MSExcel.Cells[i+2,3]:=energy_mult[basket[Combobox1.Itemindex],i];
MSExcel.Cells[i+2,4]:=delta_mult[basket[Combobox1.Itemindex],i];
end;


end;

//WriteLn(f,copy(probel,0,10-length(step[i]))+step[i]+copy(probel,0,25-length(energy[i]))+energy[i]+copy(probel,0,15-length(delta[i]))+delta[i]         );













0: end;

procedure TForm12.Button2Click(Sender: TObject);
begin
Form18.Show;
end;

procedure TForm12.ComboBox1Change(Sender: TObject);
var probel,task: widestring;
i,ps: word;
itm: TListItem;
begin
if dial=false then begin

ListView1.Clear;
probel:='                                                                    ';


if NSteps[basket[Combobox1.ItemIndex]]>0 then begin
for i:=0 to Nsteps[basket[Combobox1.ItemIndex]] do begin
if i<Nsteps[basket[Combobox1.ItemIndex]] then
if (step_mult[basket[Combobox1.ItemIndex],i]='') and (step_mult[basket[Combobox1.ItemIndex],i+1]<>'') then step_mult[basket[Combobox1.ItemIndex],i]:='SCF recalc';
itm:=Form12.ListView1.Items.Add;
itm.Caption:=copy(probel,0,8-length(step_mult[basket[Combobox1.ItemIndex],i]))+step_mult[basket[Combobox1.ItemIndex],i];
itm.SubItems.Append(copy(probel,0,18-length(energy_mult[basket[Combobox1.ItemIndex],i]))+energy_mult[basket[Combobox1.ItemIndex],i]);
itm.SubItems.Append(copy(probel,0,14-length(delta_mult[basket[Combobox1.ItemIndex],i]))+delta_mult[basket[Combobox1.ItemIndex],i]);
end;



////////////////ищем название задачи без полного пути///////////////
ps:=0;
for i:=0 to length(Combobox1.Items[Combobox1.Itemindex]) do
if copy(Combobox1.Items[Combobox1.Itemindex],i,1)='\'   then ps:=i;
task:=copy(Combobox1.Items[Combobox1.Itemindex],ps+1,100);
////////////////////////////////////////////////////////////////////

Label2.Caption:='Наименование системы: '+task;
Label3.Caption:='Общее число шагов: ' +inttostr(Nsteps[basket[Combobox1.ItemIndex]]);
Label4.Caption:='Общее понижение энергии: '+ Floattostr(RoundTo((strtofloat(energy_mult[basket[Combobox1.Itemindex],0])-strtofloat(energy_mult[basket[Combobox1.Itemindex],Nsteps[basket[Combobox1.Itemindex]]]))*23.06*27.21,-2))+' ккал';
Label5.Caption:='Результат: ';
if z_found[basket[Combobox1.Itemindex]]=true then begin
Label6.Font.Color:=clBlack;
Label6.Caption:='Stationary point found';
end
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='WARNING! Stationary point not found!'
end;

end;














 end;


end;

end.
