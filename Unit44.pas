unit Unit44;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Math, ExtCtrls, MMSystem, ComObj, OleServer, ExcelXP, ActiveX;

type
  TForm44 = class(TForm)
    ListView1: TListView;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
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
    Timer1: TTimer;
    Label15: TLabel;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form44: TForm44;
  Great,Little: Boolean;
  en_for_st: array of Double;
  timed: Boolean;
  pressed: string;
  stepcount_mult:array of array of Integer;
  type_of_scan_mult,z_mult: array of Boolean;
  energyscan_mult: array of array of string;
  allenergy_mult: array of array of string;
  initialval_mult: array of array of Real;
  stepsize_mult: array of array of Real;
  scanpoint_mult,scanpoint_r_mult: array of array of string;
  rvar: integer;
  stepcount: array of Integer;
  scanpoint: array of string;
  energyscan: array of string;  //Энергия
  allenergy: array of string;   //Все энергии в релаксационном сканировании
  initialval: array of Real;    //начальное значение реакционной координаты
  stepsize: array of Real;  // размеры шагов (массив, потому что для каждой координаты свой шаг)
  aver: Real;
  type_of_scan,zrez: Boolean;
  counter_cy,counter_po: Integer;


implementation

uses Unit1, Unit12, Unit18, Unit24, Unit37, Unit45, Unit46, Unit47, Unit49;

{$R *.dfm}



procedure TForm44.FormShow(Sender: TObject);
var str,str1,str2,str3,str4,str5,spnt,task: WideString;   //str1-5 - вспомогательные переменные
i,j,k,l,p,ps,TC,TC1,TC2,TC3,TC4,TC5,TC6,TC7,j1: Integer;
i_mult: array of Integer;
f: TextFile;
v: Real;
s: array of Integer; //Число шагов для каждой координаты - массив
cn: array[1..10] of Integer;
cart: array[1..5] of string;
scanpoint_r: array of string;
allstepcount,pr1,pr2: Integer;
scaned,init: Boolean;
scanned_mult: array of Boolean;
itm: TListItem;
label 0,55,555;
begin
ListView1.Clear;
ComboBox1.Clear;
scaned:=False;
type_of_scan:=False;
zrez:=False;
en_for_st:=nil;
stepcount:=nil;
scanpoint:=nil;
energyscan:=nil;
allenergy:=nil;
initialval:=nil;
stepsize:=nil;
Label15.Caption:='';

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

////////////////////////////


while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

if dial=true  then begin  // открыт диалог чтения одного файла
Form44.ComboBox1.Clear;
AssignFile(f,Form1.OpenDialog1.FileName);
Reset(f);
while not Eof(f) do begin
ReadLn(f,str);

//#########################################################################################
//   ищем сколько переменных сканировалось т.е. сколько добавлять столбцов в ListView     #
//#########################################################################################



//в// самом начале выдачи у релаксационного сканирования и модредутданта есть информация о начальной координате
//размере шага, число шагов, различие между модредундант и Z-матрицей есть, надо обрабатывать отдельно

//1.Z-матричное сканирование
if Pos('       Variables:',str)<>0 then begin
while (Pos(' GradGradGradGradGrad',str)=0)   and  (Pos(' NEF-NEF-NEF-NEF-NEF-',str)=0) and (Pos('following ModRedundant input section has been read',str)=0) do begin
Readln(f,str);
if Pos(' potential surface.',str)<>0 then break;
if Pos(' Scan',str)<>0 then begin
for i:=1 to 10 do
cn[i]:=0;
for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //имя переменной
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //начальное значение
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1  //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //слово SCAN
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1  //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1  //число шагов
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=',') then cn[9]:=cn[9]+1   //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>',') then cn[10]:=cn[10]+1  //размер шага
else break;
end;
cart[1]:= copy(str,cn[1]+1,cn[2]);   //имя переменной
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //начальное значение
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //слово SCAN
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // число шагов
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]); //размер шага
//все это хозяйство передаем в массивы данных параметров
Setlength(initialval,Length(initialval)+1);
initialval[Length(initialval)-1]:=StrToFloat(cart[2]);
Setlength(stepcount,Length(stepcount)+1);
stepcount[Length(stepcount)-1]:=StrToInt(cart[4]);
Setlength(stepsize,Length(stepsize)+1);
stepsize[Length(stepsize)-1]:=StrToFloat(cart[5]);
end;
end;
end;

//2. Opt=Modredundant
if Pos('following ModRedundant input section has been read:',str)<>0 then begin
while Pos(' GradGradGradGradGrad',str)=0 do begin
Readln(f,str);
if Pos(' S ',str)<>0 then begin
str1:=Copy(Str,Pos('S',str)+1,Length(str));

for i:=1 to 4 do
cn[i]:=0;
for p:=1 to length(str1) do begin
if (copy(str1,p,1)=' ') or  (copy(str1,p,1)=',') then cn[1]:=cn[1]+1         //пробелы
else break;
end;
for p:=1 to length(str1) do  begin
if (copy(str1,cn[1]+p,1)<>' ') and  (copy(str1,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //число шагов
else break;
end;
for p:=1 to length(str1) do  begin
if (copy(str1,cn[1]+cn[2]+p,1)=' ') or  (copy(str1,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы
else break;
end;
for p:=1 to length(str1) do  begin
if (copy(str1,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str1,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //размер шага
else break;
end;

cart[1]:= copy(str1,cn[1]+1,cn[2]);   //число шагов
cart[2]:= copy(str1,cn[1]+cn[2]+cn[3]+1,cn[4]);    //размер шага
Setlength(stepcount,Length(stepcount)+1);
stepcount[Length(stepcount)-1]:=StrToInt(cart[1]);
Setlength(stepsize,Length(stepsize)+1);
stepsize[Length(stepsize)-1]:=StrToFloat(cart[2]);
end;
end;
end;



//Случай простого (нерелаксационного) сканирования
if Pos(' Scan the potential surface.',str)<>0 then begin
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str); //прочитали 2 строки
i:=0;
while Pos(' ------------------------------',str)=0 do begin
if Pos('total of ',str)=0 then begin

for j:=1 to 8 do
cn[j]:=0;
for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //номер переменной в Z-матрице
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //начальное значение координаты
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1       //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //число шагов
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1     //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1   //сам шаг
else break;
end;


cart[1]:= copy(str,cn[1]+1,cn[2]);   //номер переменной
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //начальное значение
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //число шагов
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // размер шага

//все это хозяйство передаем в массивы данных параметров
//Setlength(initialval,Length(initialval)+1);
//initialval[Length(initialval)-1]:=StrToFloat(cart[2]);
//Setlength(stepcount,Length(stepcount)+1);
//stepcount[Length(stepcount)-1]:=StrToInt(cart[3]);
//Setlength(stepsize,Length(stepsize)+1);
//stepsize[Length(stepsize)-1]:=StrToFloat(cart[4]);
end;
i:=i+1;
Readln(f,str);
end;
scaned:=True;
type_of_scan:=True;
end;
i:=i-1;
////////// i - число переменных







//Случай релаксационного сканирования
if Pos('!    Initial Parameters    !',str)<>0 then begin
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str); //прочитали 5 строк
i:=0;
while Pos(' ------------------------------',str)=0 do begin
if Pos('   Scan    ',str)<>0 then begin
i:=i+1;
for p:=1 to Length(str) do
if Copy(str,Pos('Scan',str)-p,1)<>' ' then Break;
for l:=1 to Length(str) do
if Copy(str,Pos('Scan',str)-p-l,1)=' ' then Break;
Setlength(initialval,Length(initialval)+1);
initialval[Length(initialval)-1]:=StrToFloat(Copy(str,Pos('Scan',str)-p-l,l+1));



end;
Readln(f,str);
end;
scaned:=True;
end;
////////// i - число переменных




//Добавление колонок (в самом начале все удалили, а теперь добавляем):

if (i>=1) and (scaned=True) and (ListView1.Columns.Count=0) then begin
  ListView1.Columns.Add;   //Добавляем общие номера
  ListView1.Columns.Items[0].Caption:='#';
  ListView1.Columns.Items[0].Alignment:=taCenter;


  for j:=1 to 2*i do    //Добавляем колонку с номерами и величиной координаты
  ListView1.Columns.Add;

  ListView1.Columns.Add;  //Добавляем энергии
  ListView1.Columns.Add;
  ListView1.Columns.Add;

  ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=110;
  ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Ei-E0, ккал';
  ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
  ListView1.Columns.Items[ListView1.Columns.Count-2].Width:=110;
  ListView1.Columns.Items[ListView1.Columns.Count-2].Caption:='E(i+1)-Ei, ккал';
  ListView1.Columns.Items[ListView1.Columns.Count-2].Alignment:=taCenter;
  ListView1.Columns.Items[ListView1.Columns.Count-3].Width:=135;
  ListView1.Columns.Items[ListView1.Columns.Count-3].Caption:='E(total), a.u.';
  ListView1.Columns.Items[ListView1.Columns.Count-3].Alignment:=taCenter;
  for j:=1 to 2*i do begin
  ListView1.Columns.Items[j].Width:=70;
  if j/2<>Round(j/2) then ListView1.Columns.Items[j].Caption:='#('+inttostr(Round((((j-1)/2)+1)))+')'
  else  ListView1.Columns.Items[j].Caption:='Coord.'+inttostr(Round((j)/2));
  ListView1.Columns.Items[j].Alignment:=taCenter;
  end;
end;


///Итак i - число переменных, по которым ведется сканирование

//Простое сканирование - надо поместить в массив координаты сканирования и энергии
//Если type_of_scan=true - простое сканирование, иначе - релаксационное


//####################################################################################
//####################                                                     ###########
//####################    #############  ####        ###  #############    ###########
//####################    #############  ### #       ###  #############    ###########
//####################    ####           ###  #      ###  ####             ###########
//####################    #########      ###   #     ###  #########        ###########
//####################    #########      ###    #    ###  #########        ###########
//####################    #########      ###     #   ###  #########        ###########
//####################    ####           ###      #  ###  ####             ###########
//####################    #############  ###       # ###  #############    ###########
//####################    #############  ###        ####  #############    ###########
//####################                                                     ###########
//####################################################################################



if scaned=True then begin     //столбцы добавлены, тип сканирования определен
if type_of_scan=True then begin  //простое сканирование
if (Pos('SCF Done:',str)<>0) and (Pos('=',str)<>0)  then begin
str1:=Copy(str,Pos('=',str)+1,Length(str));
for p:=0 to Length(str1) do
if Copy(str1,p,1)<>' ' then Break;
for l:=1 to Length(str1) do
if Copy(str1,p+l,1)=' ' then Break;
SetLength(energyscan,Length(energyscan)+1);
energyscan[Length(energyscan)-1]:=Copy(str1,p,l);
end;
end          // конец простого сканирования
else begin   //начало релаксационного сканирования
if Pos(' on scan point ',str)<>0 then begin     //Ищем все точки сканирования, по ним будем сличать с энергиями
str1:=Copy(str,Pos(' on scan point ',str)+15,Length(str));
for p:=0 to Length(str1) do
if Copy(str1,p,1)<>' ' then Break;
for l:=1 to Length(str1) do
if Copy(str1,p+l,1)=' ' then Break;
SetLength(scanpoint,Length(scanpoint)+1);
if Length(scanpoint)=1 then  begin
scanpoint[Length(scanpoint)-1]:=Copy(str1,p,l);
spnt:='1';
end;
if Length(scanpoint)>1 then begin
if Copy(str1,p,l)=spnt then  begin
scanpoint[Length(scanpoint)-2]:='';
scanpoint[Length(scanpoint)-1]:=Copy(str1,p,l);
end
else begin
scanpoint[Length(scanpoint)-1]:=Copy(str1,p,l);
spnt:=Copy(str1,p,l);
end;


end;



end;
if (Pos('SCF Done:',str)<>0) and (Pos('=',str)<>0)  then begin
str1:=Copy(str,Pos('=',str)+1,Length(str));
for p:=0 to Length(str1) do
if Copy(str1,p,1)<>' ' then Break;
for l:=1 to Length(str1) do
if Copy(str1,p+l,1)=' ' then Break;
SetLength(allenergy,Length(allenergy)+1);       //все значения энергии релаксационного сканирования записали в массив
allenergy[Length(allenergy)-1]:=Copy(str1,p,l);
end;
end;   //конец релаксационного сканирования
end;
if Pos('Normal termination of Gaussian',str)<>0 then zrez:=True;

end;       //конец чтения файла


 if Length(stepcount)=0 then begin
 ShowMessage('В прочитанном файле не обнаружены результаты сканирования!');
 goto 0;
 end;

 if (energyscan=nil) and (allenergy=nil) then begin
 ShowMessage('В прочитанном файле не обнаружены результаты сканирования!');
 goto 0;
 end;

 if  energyscan<>nil then begin
  if energyscan[0]='' then begin
   ShowMessage('В прочитанном файле не обнаружены результаты сканирования!');
   goto 0;
  end;
 end;




if type_of_scan=False then begin
allstepcount:=1;
for i:=0 to Length(stepcount)-1 do
allstepcount:=allstepcount*(stepcount[i]+1);




j:=0;
SetLength(energyscan,allstepcount);
for i:=0 to Length(allenergy)-1 do begin
//if i=0 then   energyscan[i]:=allenergy[0];
//if i>0 then  begin
if i=Length(scanpoint) then Break;
if scanpoint[i]<>'' then  begin
energyscan[j]:=allenergy[i];

 //Step number   1 out of a maximum of   20 on scan point     1 out of   121
j:=j+1;
end;
//end;
end;
end;


//Теперь пора заполнять данными форму
ComboBox1.Items.Add(Form1.OpenDialog1.FileName);
Combobox1.ItemIndex:=0;

////////////////ищем название задачи без полного пути///////////////
ps:=0;
for i:=0 to length(Form1.OpenDialog1.FileName) do
if copy(Form1.OpenDialog1.FileName,i,1)='\'   then ps:=i;
task:=copy(Form1.OpenDialog1.FileName,ps+1,100);
////////////////////////////////////////////////////////////////////

Label2.Caption:='Наименование системы: '+task;
if type_of_scan=True then Label3.Caption:='Тип сканирования: простой'
else  Label3.Caption:='Тип сканирования: релаксационный';
Label4.Caption:='Варьируется координат: '+inttostr(Length(stepcount));
if type_of_scan=True then Label5.Caption:='Число точек: ' + IntToStr(length(energyscan))
else Label5.Caption:='Число точек: ' + IntToStr(allstepcount) + '; всего шагов: '+ inttostr(Length(allenergy));

if zrez=true then begin
Label6.Font.Color:=clblack;
Label6.Caption:='Результат: PES Scaned successfully';
end
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='Результат: WARNING! Scan calculation NOT complete!';
for i:=0 to Length(energyscan)-1 do
if energyscan[i]='' then break;
Label15.Font.Color:=clRed;
Label15.Caption:='(Реально просканировано: '+inttostr(i)+' точек)';
end;


SetLength(en_for_st,Length(energyscan));
for i:=0 to Length(energyscan)-1 do
if energyscan[i]<>'' then  en_for_st[i]:=strtofloat(energyscan[i]);

for i:=0 to Length(en_for_st)-1 do
if en_for_st[i]=0 then Break;
SetLength(en_for_st,i);



aver:=0;
for i:=0 to Length(en_for_st)-1 do
aver:=aver+en_for_st[i];
aver:=aver/length(en_for_st);





Label7.Caption:='Emax = '+floattostr(MaxValue(en_for_st));
Label8.Caption:='Emin = '+floattostr(MinValue(en_for_st));
Label9.Caption:='Eaver = '+floattostrf(aver,ffFixed,10,10);
Label10.Caption:='Emax-Emin = '+floattostrf(((MaxValue(en_for_st)-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label11.Caption:='Emax-Eaver = '+floattostrf(((MaxValue(en_for_st)-aver)*27.21*23.06),ffFixed,5,3) + ' ккал';
Label12.Caption:='Eaver-Emin = '+floattostrf(((aver-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label13.Caption:='Einf-Emin = '+ floattostrf(((en_for_st[Length(en_for_st)-1]-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label14.Caption:='Emax-Einf = '+ floattostrf(((MaxValue(en_for_st) - en_for_st[Length(en_for_st)-1])*27.21*23.06),ffFixed,5,3) + ' ккал';
//Заполняем ListView1
/////////////////////////////////////////LIST VIEW1 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


for p:=0 to Length(stepcount)-1 do
stepcount[p]:=stepcount[p]+1;


SetLength(s,Length(stepcount));
for i:=0 to Length(energyscan)-1 do begin

if  energyscan[i]='' then break;
itm:=ListView1.Items.Add;

if type_of_scan=False then begin
  if i=0 then begin
   itm.Caption:='St.En.';
   for l:=0 to Length(stepcount)-1 do begin
    itm.SubItems.Append('-');
    itm.SubItems.Append('-');
   end;
   itm.SubItems.Append(allenergy[0]);
   itm.SubItems.Append('-');
   itm.SubItems.Append('-');
  end;
end;


if i=0 then  itm:=ListView1.Items.Add;


itm.Caption:=IntToStr(i+1);
for j:=Length(stepcount)-1 downto 0 do begin

// a=trunc(n/(bmax*cmax*...*xmax*ymax))+1 или n/(bmax*cmax*...*xmax*ymax) if Integer
//...
// c=trunc( [n mod (cmax*...*xmax*ymax)]/(dmax*...*xmax*ymax))+1 или  [n mod (cmax*...*xmax*ymax)]/(dmax*...*xmax*ymax) if Integer
//...
// x=trunc( [n mod (xmax*ymax)]/ymax)+1  или [n mod (xmax*ymax)]/ymax if Integer
// y=n mod ymax или ymax if Integer

//Находим произведения
pr1:=1;
pr2:=1;
for l:=Length(stepcount)-1 downto j do begin
if l>j then pr1:=pr1*stepcount[l];  //знаменатель
pr2:=pr2*stepcount[l];   //числитель (знаменатель числителя, где берется остаток)
end;

if (((i+1) mod pr2) = 0) and ((i+1)<>0) then v:=pr2
else v:= ((i+1) mod pr2);

if  (v/pr1=Trunc(v/pr1)) and (v/pr1<>0) then s[j]:=Trunc(v/pr1)-1;
if  v/pr1<>Trunc(v/pr1) then  s[j]:=Trunc(v/pr1);
if v/pr1=0 then s[j]:=0;
end;

for j:=0 to Length(stepcount)-1 do begin
itm.SubItems.Append(IntToStr(s[j]));
itm.SubItems.Append(FloatToStr(initialval[j]+s[j]*stepsize[j]));
end;

itm.SubItems.Append(energyscan[i]);
if (i>0) and (energyscan[i]<>'')  then itm.SubItems.Append(FloatToStrF(((strtofloat(energyscan[i])-strtofloat(energyscan[i-1]))*27.21*23.06),ffFixed,5,3))
else  itm.SubItems.Append('-');
itm.SubItems.Append(FloatToStrF(((strtofloat(energyscan[i])-strtofloat(energyscan[0]))*27.21*23.06),ffFixed,5,3));
end;


 if type_of_scan=True then ListView1.Items.Delete(0);





end    //конец диалога открытия одного файла

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////     ###############   ####        ####   ##################   //////////////////////////////////////////
///////////////     ###############   ####        ####   ##################   //////////////////////////////////////////
///////////////     ####       ####   ####        ####          #####         //////////////////////////////////////////
///////////////     ####       ####   ####        ####          #####         //////////////////////////////////////////
///////////////     ####       ####   ####        ####          #####         //////////////////////////////////////////
///////////////     ####       ####   ####        ####          #####         //////////////////////////////////////////
///////////////     ####       ####   ####        ####          #####         //////////////////////////////////////////
///////////////     ###############   ################          #####         //////////////////////////////////////////
///////////////     ###############   ################          #####         //////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

else begin
stepcount_mult:=nil;
stepsize_mult:=nil;
initialval_mult:=nil;
energyscan_mult:=nil;
allenergy_mult:=nil;
en_for_st:=nil;
scanpoint_mult:=nil;
scanpoint_r_mult:=nil;
scanned_mult:=nil;
type_of_scan_mult:=nil;
scanpoint_mult:=nil;
scanpoint_r_mult:=nil;
basket:=nil;
for j:=0 to nf-1 do  begin
AssignFile(f,Form1.OpenDialog2.Files[j]);
Reset(f);
init:=False;
TC:=0;
TC1:=0;
TC2:=0;
TC3:=0;
TC4:=0;
TC5:=0;
TC6:=0;
TC7:=0;
while not Eof(f) do begin
ReadLn(f,str);
SetLength(type_of_scan_mult,j+1);
SetLength(z_mult,j+1);
Setlength(i_mult,j+1);
//#########################################################################################
//   ищем сколько переменных сканировалось т.е. сколько добавлять столбцов в ListView     #
//#########################################################################################



//в// самом начале выдачи у релаксационного сканирования и модредутданта есть информация о начальной координате
//размере шага, число шагов, различие между модредундант и Z-матрицей есть, надо обрабатывать отдельно

//1.Z-матричное сканирование
if Pos('       Variables:',str)<>0 then begin
while (Pos(' GradGradGradGradGrad',str)=0) and  (Pos(' NEF-NEF-NEF-NEF-NEF-',str)=0) and (Pos('following ModRedundant input section has been read',str)=0) do begin
Readln(f,str);
if Pos(' potential surface.',str)<>0 then break;
if Pos(' Scan',str)<>0 then begin
for i:=1 to 10 do
cn[i]:=0;
for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //имя переменной
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //начальное значение
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1  //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //слово SCAN
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1  //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1  //число шагов
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=',') then cn[9]:=cn[9]+1   //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>',') then cn[10]:=cn[10]+1  //размер шага
else break;
end;
cart[1]:= copy(str,cn[1]+1,cn[2]);   //имя переменной
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //начальное значение
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //слово SCAN
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // число шагов
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]); //размер шага
//все это хозяйство передаем в массивы данных параметров
if j>0 then  SetLength(stepcount_mult,j+1,Length(stepcount_mult[0]));
if j>0 then  SetLength(stepsize_mult,j+1,Length(stepsize_mult[0]));
if j>0 then  SetLength(initialval_mult,j+1,Length(initialval_mult[0]));
Setlength(initialval_mult,j+1);
if  TC+1>length(initialval_mult[0]) then  SetLength(initialval_mult,j+1,TC+1);
Setlength(stepcount_mult,j+1);
if  TC+1>length(stepcount_mult[0]) then  SetLength(stepcount_mult,j+1,TC+1);
Setlength(stepsize_mult,j+1);
if  TC+1>length(stepsize_mult[0]) then  SetLength(stepsize_mult,j+1,TC+1);

initialval_mult[j,TC]:=StrToFloat(cart[2]);
stepcount_mult[j,TC]:=StrToInt(cart[4]);
stepsize_mult[j,TC]:=StrToFloat(cart[5]);
TC:=TC+1;
init:=True;
end;
end;
end;


//2. Opt=Modredundant
if Pos('following ModRedundant input section has been read:',str)<>0 then begin
while Pos(' GradGradGradGradGrad',str)=0 do begin
Readln(f,str);
if Pos(' S ',str)<>0 then begin
str1:=Copy(Str,Pos('S',str)+1,Length(str));

for i:=1 to 4 do
cn[i]:=0;
for p:=1 to length(str1) do begin
if (copy(str1,p,1)=' ') or  (copy(str1,p,1)=',') then cn[1]:=cn[1]+1         //пробелы
else break;
end;
for p:=1 to length(str1) do  begin
if (copy(str1,cn[1]+p,1)<>' ') and  (copy(str1,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //число шагов
else break;
end;
for p:=1 to length(str1) do  begin
if (copy(str1,cn[1]+cn[2]+p,1)=' ') or  (copy(str1,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы
else break;
end;
for p:=1 to length(str1) do  begin
if (copy(str1,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str1,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //размер шага
else break;
end;

cart[1]:= copy(str1,cn[1]+1,cn[2]);   //число шагов
cart[2]:= copy(str1,cn[1]+cn[2]+cn[3]+1,cn[4]);    //размер шага

if j>0 then  SetLength(stepcount_mult,j+1,Length(stepcount_mult[0]));
if j>0 then  SetLength(stepsize_mult,j+1,Length(stepsize_mult[0]));
Setlength(stepcount_mult,j+1);
if  TC+1>length(stepcount_mult[0]) then SetLength(stepcount_mult,j+1,TC+1);
Setlength(stepsize_mult,j+1);
if  TC+1>length(stepsize_mult[0]) then SetLength(stepsize_mult,j+1,TC+1);

stepcount_mult[j,TC]:=StrToInt(cart[1]);
stepsize_mult[j,TC]:=StrToFloat(cart[2]);
TC:=TC+1;
end;
end;
end;


//Случай простого (нерелаксационного) сканирования
if Pos(' Scan the potential surface.',str)<>0 then begin
  SetLength(i_mult,j+1);
  type_of_scan_mult[j]:=True;
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str); //прочитали 2 строки
i_mult[j]:=0;
while Pos(' ------------------------------',str)=0 do begin
if Pos('total of ',str)=0 then begin

for p:=1 to 8 do
cn[p]:=0;
for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //номер переменной в Z-матрице
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //начальное значение координаты
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1       //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //число шагов
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1     //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1   //сам шаг
else break;
end;


cart[1]:= copy(str,cn[1]+1,cn[2]);   //номер переменной
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //начальное значение
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //число шагов
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // размер шага


end;
i_mult[j]:=i_mult[j]+1;
Readln(f,str);
end;
scaned:=True;
type_of_scan_mult[j]:=True;
end;
i_mult[j]:=i_mult[j]-1;
////////// i - число переменных


//Случай релаксационного сканирования
if Pos('!    Initial Parameters    !',str)<>0 then begin
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str); //прочитали 5 строк
i_mult[j]:=0;
while Pos(' ------------------------------',str)=0 do begin
if Pos('   Scan    ',str)<>0 then begin
i_mult[j]:=i_mult[j]+1;
for p:=1 to Length(str) do
if Copy(str,Pos('Scan',str)-p,1)<>' ' then Break;
for l:=1 to Length(str) do
if Copy(str,Pos('Scan',str)-p-l,1)=' ' then Break;

if init=false then begin
if j>0 then  SetLength(initialval_mult,j+1,Length(initialval_mult[0]));
Setlength(initialval_mult,j+1);

if  TC4+1>length(initialval_mult[0]) then SetLength(initialval_mult,j+1,TC4+1);

initialval_mult[j,TC4]:=StrToFloat(Copy(str,Pos('Scan',str)-p-l,l+1));
TC4:=TC4+1;
end;
end;
Readln(f,str);
end;
scaned:=True;
end;
////////// i - число переменных


///Итак i - число переменных, по которым ведется сканирование

//Простое сканирование - надо поместить в массив координаты сканирования и энергии
//Если type_of_scan=true - простое сканирование, иначе - релаксационное


//####################################################################################
//####################                                                     ###########
//####################    #############  ####        ###  #############    ###########
//####################    #############  ### #       ###  #############    ###########
//####################    ####           ###  #      ###  ####             ###########
//####################    #########      ###   #     ###  #########        ###########
//####################    #########      ###    #    ###  #########        ###########
//####################    #########      ###     #   ###  #########        ###########
//####################    ####           ###      #  ###  ####             ###########
//####################    #############  ###       # ###  #############    ###########
//####################    #############  ###        ####  #############    ###########
//####################                                                     ###########
//####################################################################################



if scaned=True then begin     //столбцы добавлены, тип сканирования определен
if type_of_scan_mult[j]=True then begin  //простое сканирование
if (Pos('SCF Done:',str)<>0) and (Pos('=',str)<>0)  then begin
str1:=Copy(str,Pos('=',str)+1,Length(str));
for p:=0 to Length(str1) do
if Copy(str1,p,1)<>' ' then Break;
for l:=1 to Length(str1) do
if Copy(str1,p+l,1)=' ' then Break;
if j>0 then  SetLength(energyscan_mult,j+1,Length(energyscan_mult[0]));
SetLength(energyscan_mult,j+1);
if  TC5+1>length(energyscan_mult[0]) then SetLength(energyscan_mult,j+1,TC5+1);
energyscan_mult[j,TC5]:=Copy(str1,p,l);
TC5:=TC5+1;
end;
end          // конец простого сканирования
else begin   //начало релаксационного сканирования
if Pos(' on scan point ',str)<>0 then begin     //Ищем все точки сканирования, по ним будем сличать с энергиями
str1:=Copy(str,Pos(' on scan point ',str)+15,Length(str));
for p:=0 to Length(str1) do
if Copy(str1,p,1)<>' ' then Break;
for l:=1 to Length(str1) do
if Copy(str1,p+l,1)=' ' then Break;
if j>0 then  SetLength(scanpoint_mult,j+1,Length(scanpoint_mult[0]));
SetLength(scanpoint_mult,j+1);
if  TC6+1>length(scanpoint_mult[0]) then SetLength(scanpoint_mult,j+1,TC6+1);

if Length(scanpoint_mult[j])=1 then  begin
scanpoint_mult[j,Length(scanpoint_mult[0])-1]:=Copy(str1,p,l);
spnt:='1';
end;
if Length(scanpoint_mult[j])>1 then begin
if Copy(str1,p,l)=spnt then  begin
scanpoint_mult[j,TC6-1]:='';                          // was Length(scanpoint_mult[0])-2
scanpoint_mult[j,TC6]:=Copy(str1,p,l);   ///!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end
else begin
scanpoint_mult[j,TC6]:=Copy(str1,p,l);       // was Length(scanpoint_mult[0])-1
spnt:=Copy(str1,p,l);
end;


end;

TC6:=TC6+1;

end;
if (Pos('SCF Done:',str)<>0) and (Pos('=',str)<>0)  then begin
str1:=Copy(str,Pos('=',str)+1,Length(str));
for p:=0 to Length(str1) do
if Copy(str1,p,1)<>' ' then Break;
for l:=1 to Length(str1) do
if Copy(str1,p+l,1)=' ' then Break;
if j>0 then  SetLength(allenergy_mult,j+1,Length(allenergy_mult[0]));
SetLength(allenergy_mult,j+1);
if  TC7+1>length(allenergy_mult[0]) then SetLength(allenergy_mult,j+1,TC7+1);       //все значения энергии релаксационного сканирования записали в массив
allenergy_mult[j,TC7]:=Copy(str1,p,l);
TC7:=TC7+1;
end;
end;   //конец релаксационного сканирования
end;
if Pos('Normal termination of Gaussian',str)<>0 then z_mult[j]:=True;

end;


if  (type_of_scan_mult[j]=False)  and  (stepcount_mult=nil) then  begin
//ShowMessage('В файле '+Form1.OpenDialog2.Files[j] + ' результаты сканирования не обнаружены!');
goto 55;
end;
if (type_of_scan_mult[j]=False) and  (Length(stepcount_mult)<j+1) then  begin
//ShowMessage('В файле '+Form1.OpenDialog2.Files[j] + ' результаты сканирования не обнаружены!');
goto 55;
end;



if Length(allenergy_mult)>0 then begin
if Length(allenergy_mult)<j+1 then SetLength(allenergy_mult,j+1,length(allenergy_mult[0]));
if Length(allenergy_mult[j])>0 then begin
for p:=0 to length(allenergy_mult[j])-1 do begin
if type_of_scan_mult[j]=False then begin
allstepcount:=1;
for i:=0 to Length(stepcount_mult[j])-1 do
allstepcount:=allstepcount*(stepcount_mult[j,i]+1);
j1:=0;
if (j=0) and (allstepcount<>0) then SetLength(energyscan_mult,j+1,allstepcount);
if j>0 then if length(energyscan_mult[j-1])<=allstepcount then  SetLength(energyscan_mult,j+1,allstepcount) else SetLength(energyscan_mult,j+1,length(energyscan_mult[j-1]));
for i:=0 to Length(allenergy_mult[j])-1 do begin
//if i=0 then   energyscan[i]:=allenergy[0];
//if i>0 then  begin
if (energyscan_mult[j,0]<>'') or (allenergy_mult[j,0]<>'') then begin
if scanpoint_mult[j,i]<>'' then  begin
energyscan_mult[j,j1]:=allenergy_mult[j,i];
j1:=j1+1;
end;
end;
end;
end;
end;
end;
end;

55:
if j=0 then begin
if stepcount_mult=nil then  SetLength(stepcount_mult,j+1,1);
if stepcount_mult<>nil then if Length(stepcount_mult)<j+1 then SetLength(stepcount_mult,j+1,1);
if energyscan_mult=nil then  SetLength(energyscan_mult,j+1,1);
if energyscan_mult<>nil then if Length(energyscan_mult)<j+1 then SetLength(energyscan_mult,j+1,1);
if scanpoint_mult=nil then  SetLength(scanpoint_mult,j+1,1);
if scanpoint_mult<>nil then if Length(scanpoint_mult)<j+1 then SetLength(scanpoint_mult,j+1,1);
if allenergy_mult=nil then  SetLength(allenergy_mult,j+1,1);
if allenergy_mult<>nil then if Length(allenergy_mult)<j+1 then SetLength(allenergy_mult,j+1,1);
if stepsize_mult=nil then  SetLength(stepsize_mult,j+1,1);
if stepsize_mult<>nil then if Length(stepsize_mult)<j+1 then SetLength(stepsize_mult,j+1,1);
if initialval_mult=nil then  SetLength(initialval_mult,j+1,1);
if initialval_mult<>nil then if Length(initialval_mult)<j+1 then SetLength(initialval_mult,j+1,1);
end;
if j>0 then begin
if stepcount_mult=nil then  SetLength(stepcount_mult,j+1,1);
if stepcount_mult<>nil then if Length(stepcount_mult)<j+1 then SetLength(stepcount_mult,j+1,Length(stepcount_mult[j-1]));
if energyscan_mult=nil then  SetLength(energyscan_mult,j+1,1);
if energyscan_mult<>nil then if Length(energyscan_mult)<j+1 then SetLength(energyscan_mult,j+1,Length(energyscan_mult[j-1]));
if scanpoint_mult=nil then  SetLength(scanpoint_mult,j+1,1);
if scanpoint_mult<>nil then if Length(scanpoint_mult)<j+1 then SetLength(scanpoint_mult,j+1,Length(scanpoint_mult[j-1]));
if allenergy_mult=nil then  SetLength(allenergy_mult,j+1,1);
if allenergy_mult<>nil then if Length(allenergy_mult)<j+1 then SetLength(allenergy_mult,j+1,Length(allenergy_mult[j-1]));
if stepsize_mult=nil then  SetLength(stepsize_mult,j+1,1);
if stepsize_mult<>nil then if Length(stepsize_mult)<j+1 then SetLength(stepsize_mult,j+1,Length(stepsize_mult[j-1]));
if initialval_mult=nil then  SetLength(initialval_mult,j+1,1);
if initialval_mult<>nil then if Length(initialval_mult)<j+1 then SetLength(initialval_mult,j+1,Length(initialval_mult[j-1]));
end;







end;    //конец чтения




                               ///BASKET   !!!!!!!!!!!!!!!!!!!!!!!!!!!

i:=0;
str:='' ;
for j:=0 to nf-1 do  begin
if (stepcount_mult[j,0]<>0) and ((energyscan_mult<>nil) or  (allenergy_mult<>nil)) then begin
if energyscan_mult<>nil then if energyscan_mult[j]<>nil then str:=energyscan_mult[j,0];

if str='' then begin
ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных сканирования!');
goto 555;
end;



SetLength(basket,i+1);
basket[i]:=j;
Combobox1.Items.Add(Form1.OpenDialog2.Files[j]);
i:=i+1;

end
else  ShowMessage('Файл '+Form1.Opendialog2.Files[j] + ' не содержит данных сканирования!');
555: str:='';
end;

ComboBox1.ItemIndex:=0;

////////////////////////////////////////////////////////////
////////////////////Отображение на форме////////////////////
////////////////////////////////////////////////////////////



rvar:=0;                                                          //!!!
//определим таки реальное число переменных......................... //!!!
if basket<>nil then begin
for p:=0 to length(stepcount_mult[basket[0]])-1 do                  //!!!
if stepcount_mult[basket[0],p]<>0 then rvar:=rvar+1;                //!!!
end;
////////////////////ДОбавляем колонки - руководствоваться будем размером массива stepcount

if basket<>nil then begin

if (rvar>=1) and (ListView1.Columns.Count=0) then begin       //!!!
  ListView1.Columns.Add;   //Добавляем общие номера
  ListView1.Columns.Items[0].Caption:='#';
  ListView1.Columns.Items[0].Alignment:=taCenter;


  for j:=1 to 2*rvar do    //Добавляем колонку с номерами и величиной координаты    //!!!!
  ListView1.Columns.Add;

  ListView1.Columns.Add;  //Добавляем энергии
  ListView1.Columns.Add;
  ListView1.Columns.Add;

  ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=110;
  ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Ei-E0, ккал';
  ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
  ListView1.Columns.Items[ListView1.Columns.Count-2].Width:=110;
  ListView1.Columns.Items[ListView1.Columns.Count-2].Caption:='E(i+1)-Ei, ккал';
  ListView1.Columns.Items[ListView1.Columns.Count-2].Alignment:=taCenter;
  ListView1.Columns.Items[ListView1.Columns.Count-3].Width:=135;
  ListView1.Columns.Items[ListView1.Columns.Count-3].Caption:='E(total), a.u.';
  ListView1.Columns.Items[ListView1.Columns.Count-3].Alignment:=taCenter;
  for j:=1 to 2*rvar do begin                                     //!!!!
  ListView1.Columns.Items[j].Width:=70;
  if j/2<>Round(j/2) then ListView1.Columns.Items[j].Caption:='#('+inttostr(Round((((j-1)/2)+1)))+')'
  else  ListView1.Columns.Items[j].Caption:='Coord.'+inttostr(Round((j)/2));
  ListView1.Columns.Items[j].Alignment:=taCenter;
  end;
end;

end
else begin
//ShowMessage('Прочитанные файлы не содержат результатов сканирования!');
goto 0;
end;






{
if Length(allenergy_mult)>0 then begin
if Length(allenergy_mult[basket[0]])>0 then begin
for p:=0 to length(allenergy_mult[basket[0]])-1 do begin
if type_of_scan_mult[basket[0]]=False then begin
allstepcount:=1;
for i:=0 to Length(stepcount_mult[basket[0]])-1 do
allstepcount:=allstepcount*(stepcount_mult[basket[0],i]+1);
j:=0;
SetLength(energyscan_mult,basket[0]+1,allstepcount);
for i:=0 to Length(allenergy_mult[basket[0]])-1 do begin
//if i=0 then   energyscan[i]:=allenergy[0];
//if i>0 then  begin
if scanpoint_mult[basket[0],i]<>'' then  begin
energyscan_mult[basket[0],j]:=allenergy_mult[basket[0],i];
j:=j+1;
end;
end;
end;
end;
end;
end;   }



//Теперь пора заполнять данными форму


////////////////ищем название задачи без полного пути///////////////
ps:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[0]]) do
if copy(Form1.OpenDialog2.Files[basket[0]],i,1)='\'   then ps:=i;
task:=copy(Form1.OpenDialog2.Files[basket[0]],ps+1,100);
////////////////////////////////////////////////////////////////////

//if type_of_scan_mult[basket[0]]=False then begin
counter_cy:=0;
counter_po:=0;
for p:=0 to Length(energyscan_mult[basket[0]])-1 do
if  energyscan_mult[basket[0],p]<>'' then counter_po:=counter_po+1
else Break;
for p:=0 to Length(allenergy_mult[basket[0]])-1 do
if  allenergy_mult[basket[0],p]<>'' then counter_cy:=counter_cy+1
else Break;
//end;



Label2.Caption:='Наименование системы: '+task;
if type_of_scan_mult[basket[0]]=True then Label3.Caption:='Тип сканирования: простой'
else  Label3.Caption:='Тип сканирования: релаксационный';
Label4.Caption:='Варьируется координат: '+inttostr(rvar);                                           //!!!!!!
if type_of_scan_mult[basket[0]]=True then Label5.Caption:='Число точек: ' + IntToStr(counter_po)     //!!!!!
else Label5.Caption:='Число точек: ' + IntToStr(counter_po) + '; всего шагов: '+ inttostr(counter_cy);

if z_mult[basket[0]]=true then begin
Label6.Font.Color:=clblack;
Label6.Caption:='Результат: PES Scaned successfully';
end
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='Результат: WARNING! Scan calculation NOT complete!'
end;


SetLength(en_for_st,Length(energyscan_mult[basket[0]]));
for i:=0 to Length(energyscan_mult[basket[0]])-1 do
if  energyscan_mult[basket[0],i]<>'' then  en_for_st[i]:=strtofloat(energyscan_mult[basket[0],i]);


//вычистим нули из en_for_st
for p:=0 to Length(en_for_st)-1 do
if en_for_st[p]=0 then Break;
SetLength(en_for_st,p);




aver:=0;
for i:=0 to Length(en_for_st)-1 do
aver:=aver+en_for_st[i];

aver:=aver/length(en_for_st);



Label7.Caption:='Emax = '+floattostr(MaxValue(en_for_st));
Label8.Caption:='Emin = '+floattostr(MinValue(en_for_st));
Label9.Caption:='Eaver = '+floattostrf(aver,ffFixed,10,10);
Label10.Caption:='Emax-Emin = '+floattostrf(((MaxValue(en_for_st)-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label11.Caption:='Emax-Eaver = '+floattostrf(((MaxValue(en_for_st)-aver)*27.21*23.06),ffFixed,5,3) + ' ккал';
Label12.Caption:='Eaver-Emin = '+floattostrf(((aver-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label13.Caption:='Einf-Emin = '+ floattostrf(((en_for_st[Length(en_for_st)-1]-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label14.Caption:='Emax-Einf = '+ floattostrf(((MaxValue(en_for_st) - en_for_st[Length(en_for_st)-1])*27.21*23.06),ffFixed,5,3) + ' ккал';


//Заполняем ListView1
/////////////////////////////////////////LIST VIEW1 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


for p:=0 to rvar-1 do                                         //!!!!!!
stepcount_mult[basket[0],p]:=stepcount_mult[basket[0],p]+1;


SetLength(s,Length(stepcount_mult[basket[0]]));
for i:=0 to Length(energyscan_mult[basket[0]])-1 do begin
  if  energyscan_mult[basket[0],i]='' then Break;
itm:=ListView1.Items.Add;

if type_of_scan_mult[basket[0]]=False then begin
  if i=0 then begin
   itm.Caption:='St.En.';
   for l:=0 to rvar-1 do begin
    itm.SubItems.Append('-');
    itm.SubItems.Append('-');
   end;
   itm.SubItems.Append(allenergy_mult[basket[0],0]);
   itm.SubItems.Append('-');
   itm.SubItems.Append('-');
  end;
end;


if i=0 then  itm:=ListView1.Items.Add;


itm.Caption:=IntToStr(i+1);
for j:=rvar-1 downto 0 do begin         //!!!!!!!

// a=trunc(n/(bmax*cmax*...*xmax*ymax))+1 или n/(bmax*cmax*...*xmax*ymax) if Integer
//...
// c=trunc( [n mod (cmax*...*xmax*ymax)]/(dmax*...*xmax*ymax))+1 или  [n mod (cmax*...*xmax*ymax)]/(dmax*...*xmax*ymax) if Integer
//...
// x=trunc( [n mod (xmax*ymax)]/ymax)+1  или [n mod (xmax*ymax)]/ymax if Integer
// y=n mod ymax или ymax if Integer

//Находим произведения
pr1:=1;
pr2:=1;
for l:=rvar-1 downto j do begin               //!!!!
if l>j then pr1:=pr1*stepcount_mult[basket[0],l];  //знаменатель
pr2:=pr2*stepcount_mult[basket[0],l];   //числитель (знаменатель числителя, где берется остаток)
end;

if (((i+1) mod pr2) = 0) and ((i+1)<>0) then v:=pr2
else v:= ((i+1) mod pr2);

if  (v/pr1=Trunc(v/pr1)) and (v/pr1<>0) then s[j]:=Trunc(v/pr1)-1;
if  v/pr1<>Trunc(v/pr1) then  s[j]:=Trunc(v/pr1);
if v/pr1=0 then s[j]:=0;
end;
                                             //!!!!
for j:=0 to rvar-1 do begin
itm.SubItems.Append(IntToStr(s[j]));
itm.SubItems.Append(FloatToStr(initialval_mult[basket[0],j]+s[j]*stepsize_mult[basket[0],j]));
end;

itm.SubItems.Append(energyscan_mult[basket[0],i]);
if i>0 then itm.SubItems.Append(FloatToStrF(((strtofloat(energyscan_mult[basket[0],i])-strtofloat(energyscan_mult[basket[0],i-1]))*27.21*23.06),ffFixed,5,3))
else  itm.SubItems.Append('-');
itm.SubItems.Append(FloatToStrF(((strtofloat(energyscan_mult[basket[0],i])-strtofloat(energyscan_mult[basket[0],0]))*27.21*23.06),ffFixed,5,3));
end;

if type_of_scan_mult[basket[Combobox1.ItemIndex]]=True then ListView1.Items.Delete(0);
end;    //  конец секции out / lof



0:

CloseFile(f);
end;

procedure TForm44.FormCreate(Sender: TObject);
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
end;

procedure TForm44.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var i: Integer;
begin
 if Great=True then begin
  for i:=0 to Length(en_for_st)-1 do
  if en_for_st[i]=MaxValue(en_for_st) then Break;

  if dial=true then begin
  if type_of_scan=false then  begin
  if (Item.Index=i+1) and (Great=True) then  Sender.Canvas.Brush.Color:=RGB(250,128,114);
  end;
  if type_of_scan=true then  begin
  if (Item.Index=i) and (Great=True) then  Sender.Canvas.Brush.Color:=RGB(250,128,114);
  end;
  end
  else begin
  if type_of_scan_mult[basket[Combobox1.ItemIndex]]=false then begin
  if (Item.Index=i+1) and (Great=True) then  Sender.Canvas.Brush.Color:=RGB(250,128,114);
  end;
  if type_of_scan_mult[basket[Combobox1.ItemIndex]]=true then begin
  if (Item.Index=i) and (Great=True) then  Sender.Canvas.Brush.Color:=RGB(250,128,114);
  end;
  end;

  end;
 if Little=True then begin
  for i:=0 to Length(en_for_st)-1 do
  if en_for_st[i]=MinValue(en_for_st) then Break;

  if dial=true then begin
  if type_of_scan=false then  begin
  if (Item.Index=i+1) and (Little=True) then  Sender.Canvas.Brush.Color:=RGB(0,255,127);
  end;
  if type_of_scan=true then  begin
  if (Item.Index=i) and (Little=True) then  Sender.Canvas.Brush.Color:=RGB(0,255,127);
  end;
  end
  else begin
  if type_of_scan_mult[basket[Combobox1.ItemIndex]]=false then begin
  if (Item.Index=i+1) and (Little=True) then  Sender.Canvas.Brush.Color:=RGB(0,255,127);
  end;
  if type_of_scan_mult[basket[Combobox1.ItemIndex]]=true then begin
  if (Item.Index=i) and (Little=True) then  Sender.Canvas.Brush.Color:=RGB(0,255,127);
  end;
  end;

  end;
  if ((Great=True) or (Little=True)) and (timed=False)  then  begin
   Timer1.Enabled:=True;
   Timed:=True;
  end;
end;


procedure TForm44.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  label 0;
begin
if (key=ord('G')) or (Key=ord('П'))  then begin
  pressed:='G';
  PlaySound(0, 0, SND_PURGE);
  SystemParametersInfo(SPI_SETBEEP,0,nil,SPIF_SENDWININICHANGE);
  timed:=False;
if Great=False then begin
Great:=True;
goto 0;
end;
if Great=True then  begin
Great:=False;
goto 0;
end;
end;
if (key=ord('L')) or (Key=ord('Д')) then begin
  pressed:='L';
  PlaySound(0, 0, SND_PURGE);
  SystemParametersInfo(SPI_SETBEEP,0,nil,SPIF_SENDWININICHANGE);
  timed:=False;
if Little=False then   begin
Little:=True;
goto 0;
end;
if Little=True then  begin
Little:=False;
goto 0;
end;
end;

 0:
 if (timed=True) and (Little=False) and (Great=False) then ListView1.Scroll(0,-1000000000);
 ListView1.Repaint;
end;

procedure TForm44.Timer1Timer(Sender: TObject);
var i: Integer;
label 0,1;
begin

if Great=True then begin
if pressed='L' then goto 1;
for i:=0 to Length(en_for_st)-1 do
if en_for_st[i]=MaxValue(en_for_st) then Break;
if dial=true then begin
if type_of_scan=false then ListView1.Items.Item[i+1].MakeVisible(True)  else ListView1.Items.Item[i].MakeVisible(True);
end
else begin
if type_of_scan_mult[basket[Combobox1.ItemIndex]]=false then ListView1.Items.Item[i+1].MakeVisible(True)  else ListView1.Items.Item[i].MakeVisible(True);
end;
end;

1:
if Little=True then begin
if pressed='G' then goto 0;
for i:=0 to Length(en_for_st)-1 do
if en_for_st[i]=MinValue(en_for_st) then Break;
if dial=true then begin
if type_of_scan=false then ListView1.Items.Item[i+1].MakeVisible(True)  else ListView1.Items.Item[i].MakeVisible(True);
end
else begin
if type_of_scan_mult[basket[Combobox1.ItemIndex]]=false then ListView1.Items.Item[i+1].MakeVisible(True)  else ListView1.Items.Item[i].MakeVisible(True);
end;
if pressed='L' then goto 0;
end;

 0:

Timer1.Enabled:=False;
end;

procedure TForm44.ComboBox1Change(Sender: TObject);
var probel,task: widestring;
aver: Real;
i,j,ps,p,l,pr1,pr2,v,rvar: Integer;
s: array of Integer;
itm: TListItem;
label 0;
begin
if dial=True then goto 0;
if (dial=False) and (ComboBox1.Items.Count=1) then goto 0;
ListView1.Clear;                                                    //Очистили
probel:='                                                                    ';
 en_for_st:=nil;
while ListView1.Columns.Count>0 do                                  //Удалили колонки (каждый файл может иметь разное число переменных)
ListView1.Columns.Delete(ListView1.Columns.Count-1);




rvar:=0;                                                          //!!!
//определим таки реальное число переменных......................... //!!!
for p:=0 to length(stepcount_mult[basket[ComboBox1.ItemIndex]])-1 do                  //!!!
if stepcount_mult[basket[ComboBox1.ItemIndex],p]<>0 then rvar:=rvar+1;                //!!!




////////////////////ДОбавляем колонки - руководствоваться будем размером массива stepcount

if basket<>nil then begin

if (rvar>=1) and (ListView1.Columns.Count=0) then begin
  ListView1.Columns.Add;   //Добавляем общие номера
  ListView1.Columns.Items[0].Caption:='#';
  ListView1.Columns.Items[0].Alignment:=taCenter;


  for j:=1 to 2*rvar do    //Добавляем колонку с номерами и величиной координаты
  ListView1.Columns.Add;

  ListView1.Columns.Add;  //Добавляем энергии
  ListView1.Columns.Add;
  ListView1.Columns.Add;

  ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=110;
  ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Ei-E0, ккал';
  ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
  ListView1.Columns.Items[ListView1.Columns.Count-2].Width:=110;
  ListView1.Columns.Items[ListView1.Columns.Count-2].Caption:='E(i+1)-Ei, ккал';
  ListView1.Columns.Items[ListView1.Columns.Count-2].Alignment:=taCenter;
  ListView1.Columns.Items[ListView1.Columns.Count-3].Width:=135;
  ListView1.Columns.Items[ListView1.Columns.Count-3].Caption:='E(total), a.u.';
  ListView1.Columns.Items[ListView1.Columns.Count-3].Alignment:=taCenter;
  for j:=1 to 2*rvar do begin
  ListView1.Columns.Items[j].Width:=70;
  if j/2<>Round(j/2) then ListView1.Columns.Items[j].Caption:='#('+inttostr(Round((((j-1)/2)+1)))+')'
  else  ListView1.Columns.Items[j].Caption:='Coord.'+inttostr(Round((j)/2));
  ListView1.Columns.Items[j].Alignment:=taCenter;
  end;
end;
end;


//if type_of_scan_mult[basket[Combobox1.ItemIndex]]=False then begin
counter_cy:=0;
counter_po:=0;
for p:=0 to Length(energyscan_mult[basket[Combobox1.ItemIndex]])-1 do
if  energyscan_mult[basket[Combobox1.ItemIndex],p]<>'' then counter_po:=counter_po+1
else Break;
for p:=0 to Length(allenergy_mult[basket[Combobox1.ItemIndex]])-1 do
if  allenergy_mult[basket[Combobox1.ItemIndex],p]<>'' then counter_cy:=counter_cy+1
else Break;
//end;


////////////////ищем название задачи без полного пути///////////////
ps:=0;
for i:=0 to length(Form1.OpenDialog2.Files[basket[ComboBox1.ItemIndex]]) do
if copy(Form1.OpenDialog2.Files[basket[ComboBox1.ItemIndex]],i,1)='\'   then ps:=i;
task:=copy(Form1.OpenDialog2.Files[basket[ComboBox1.ItemIndex]],ps+1,100);
////////////////////////////////////////////////////////////////////



Label2.Caption:='Наименование системы: '+task;
if type_of_scan_mult[basket[Combobox1.ItemIndex]]=True then Label3.Caption:='Тип сканирования: простой'
else  Label3.Caption:='Тип сканирования: релаксационный';
Label4.Caption:='Варьируется координат: '+inttostr(rvar);
if type_of_scan_mult[basket[Combobox1.ItemIndex]]=True then Label5.Caption:='Число точек: ' + IntToStr(counter_po)
else Label5.Caption:='Число точек: ' + IntToStr(counter_po) + '; всего шагов: '+ inttostr(counter_cy);

if z_mult[basket[Combobox1.ItemIndex]]=true then begin
Label6.Font.Color:=clblack;
Label6.Caption:='Результат: PES Scaned successfully';
end
else  begin
Label6.Font.Color:=clred;
Label6.Caption:='Результат: WARNING! Scan calculation NOT complete!'
end;

SetLength(en_for_st,Length(energyscan_mult[basket[Combobox1.ItemIndex]]));
for i:=0 to Length(energyscan_mult[basket[Combobox1.ItemIndex]])-1 do
if  energyscan_mult[basket[Combobox1.ItemIndex],i]<>'' then  en_for_st[i]:=strtofloat(energyscan_mult[basket[Combobox1.ItemIndex],i]);

//вычистим нули из en_for_st
for p:=0 to Length(en_for_st)-1 do
if en_for_st[p]=0 then Break;
SetLength(en_for_st,p);

aver:=0;
for i:=0 to Length(en_for_st)-1 do
aver:=aver+en_for_st[i];

aver:=aver/length(en_for_st);


Label7.Caption:='Emax = '+floattostr(MaxValue(en_for_st));
Label8.Caption:='Emin = '+floattostr(MinValue(en_for_st));
Label9.Caption:='Eaver = '+floattostrf(aver,ffFixed,10,10);
Label10.Caption:='Emax-Emin = '+floattostrf(((MaxValue(en_for_st)-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label11.Caption:='Emax-Eaver = '+floattostrf(((MaxValue(en_for_st)-aver)*27.21*23.06),ffFixed,5,3) + ' ккал';
Label12.Caption:='Eaver-Emin = '+floattostrf(((aver-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label13.Caption:='Einf-Emin = '+ floattostrf(((en_for_st[Length(en_for_st)-1]-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' ккал';
Label14.Caption:='Emax-Einf = '+ floattostrf(((MaxValue(en_for_st) - en_for_st[Length(en_for_st)-1])*27.21*23.06),ffFixed,5,3) + ' ккал';



//Заполняем ListView1
//Заполняем ListView1
//Заполняем ListView1
//Заполняем ListView1
//Заполняем ListView1
//Заполняем ListView1
//Заполняем ListView1
//Заполняем ListView1
//Заполняем ListView1
//Заполняем ListView1
/////////////////////////////////////////LIST VIEW1 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


for p:=0 to rvar-1 do
stepcount_mult[basket[ComboBox1.ItemIndex],p]:=stepcount_mult[basket[ComboBox1.ItemIndex],p]+1;


SetLength(s,Length(stepcount_mult[basket[ComboBox1.ItemIndex]]));
for i:=0 to Length(energyscan_mult[basket[ComboBox1.ItemIndex]])-1 do begin
  if  energyscan_mult[basket[ComboBox1.ItemIndex],i]='' then Break;
itm:=ListView1.Items.Add;

if type_of_scan_mult[basket[ComboBox1.ItemIndex]]=False then begin
  if i=0 then begin
   itm.Caption:='St.En.';
   for l:=0 to rvar-1 do begin
    itm.SubItems.Append('-');
    itm.SubItems.Append('-');
   end;
   itm.SubItems.Append(allenergy_mult[basket[ComboBox1.ItemIndex],0]);
   itm.SubItems.Append('-');
   itm.SubItems.Append('-');
  end;
end;


if i=0 then  itm:=ListView1.Items.Add;


itm.Caption:=IntToStr(i+1);
for j:=rvar-1 downto 0 do begin

// a=trunc(n/(bmax*cmax*...*xmax*ymax))+1 или n/(bmax*cmax*...*xmax*ymax) if Integer
//...
// c=trunc( [n mod (cmax*...*xmax*ymax)]/(dmax*...*xmax*ymax))+1 или  [n mod (cmax*...*xmax*ymax)]/(dmax*...*xmax*ymax) if Integer
//...
// x=trunc( [n mod (xmax*ymax)]/ymax)+1  или [n mod (xmax*ymax)]/ymax if Integer
// y=n mod ymax или ymax if Integer

//Находим произведения
pr1:=1;
pr2:=1;
for l:=rvar-1 downto j do begin
if l>j then pr1:=pr1*stepcount_mult[basket[ComboBox1.ItemIndex],l];  //знаменатель
pr2:=pr2*stepcount_mult[basket[ComboBox1.ItemIndex],l];   //числитель (знаменатель числителя, где берется остаток)
end;

if (((i+1) mod pr2) = 0) and ((i+1)<>0) then v:=pr2
else v:= ((i+1) mod pr2);

if  (v/pr1=Trunc(v/pr1)) and (v/pr1<>0) then s[j]:=Trunc(v/pr1)-1;
if  v/pr1<>Trunc(v/pr1) then  s[j]:=Trunc(v/pr1);
if v/pr1=0 then s[j]:=0;
end;

for j:=0 to rvar-1 do begin
itm.SubItems.Append(IntToStr(s[j]));
itm.SubItems.Append(FloatToStr(initialval_mult[basket[ComboBox1.ItemIndex],j]+s[j]*stepsize_mult[basket[ComboBox1.ItemIndex],j]));
end;

itm.SubItems.Append(energyscan_mult[basket[ComboBox1.ItemIndex],i]);
if i>0 then itm.SubItems.Append(FloatToStrF(((strtofloat(energyscan_mult[basket[ComboBox1.ItemIndex],i])-strtofloat(energyscan_mult[basket[ComboBox1.ItemIndex],i-1]))*27.21*23.06),ffFixed,5,3))
else  itm.SubItems.Append('-');
itm.SubItems.Append(FloatToStrF(((strtofloat(energyscan_mult[basket[ComboBox1.ItemIndex],i])-strtofloat(energyscan_mult[basket[ComboBox1.ItemIndex],0]))*27.21*23.06),ffFixed,5,3));
end;
if type_of_scan_mult[basket[Combobox1.ItemIndex]]=True then ListView1.Items.Delete(0);


0:
end;

procedure TForm44.BitBtn1Click(Sender: TObject);
begin
Form45.Show;
end;

procedure TForm44.BitBtn2Click(Sender: TObject);
begin
  if dial=True then begin
   if type_of_scan=False then Form46.Show
   else ShowMessage('Подробная информация доступна только для релаксационного сканирования!');
  end
  else begin
if type_of_scan_mult[basket[ComboBox1.ItemIndex]]=False then Form46.Show
else ShowMessage('Подробная информация доступна только для релаксационного сканирования!');
end;
end;

procedure TForm44.BitBtn3Click(Sender: TObject);
var N,i: integer;
label 0;
begin
  if dial=true then begin
    if length(stepcount)<>2 then begin
      showmessage('Опция РЕЛЬЕФ доступна только для сканирования двух координат!');
      goto 0;
    end;
    end
    else begin
    if stepcount_mult<>nil then begin
      N:=0;
      for i:=0 to length(stepcount_mult[basket[Form44.ComboBox1.ItemIndex]])-1 do
      if stepcount_mult[basket[Form44.ComboBox1.ItemIndex],i]<>0 then N:=N+1;
      if N<>2 then begin
      showmessage('Опция РЕЛЬЕФ доступна только для сканирования двух координат!');
      goto 0;
      end;
    end;
    end;
Form47.Show;
0:
end;

procedure TForm44.BitBtn4Click(Sender: TObject);
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
WriteLn(f,' *              Scan of potential energy surface              *');
WriteLn(f,' *                      Energy evolution                      *');
WriteLn(f,' *                                                            *');
WriteLn(f,' *                          Magellan                          *');
WriteLn(f,' **************************************************************');
WriteLn(f,'');
WriteLn(f,' File: ' +Combobox1.Items[Combobox1.ItemIndex]);
if dial=True then begin
if type_of_scan=True then WriteLn(f,' Type of scan: Simple') else  WriteLn(f,' Type of scan: Relax');
WriteLn(f,' Number of variable coordinates: ' + inttostr(Length(stepcount)));
if type_of_scan=True then WriteLn(f,' Number of points: ' + inttostr(Length(energyscan)))
else WriteLn(f,' Number of points: ' + inttostr(Length(stepcount)) +'; Number of steps: '+ inttostr(Length(allenergy)));
if zrez=True then WriteLn(f,' Result of scan: Complete') else WriteLn(f,' Result of scan: WARNING! Scan calculation NOT complete!');
if zrez=False then begin
for i:=0 to Length(energyscan)-1 do
if energyscan[i]='' then break;
WriteLn(f,' *** ATTENTION! HAS SCANNED '+inttostr(i)+' POINTS ONLY!');
end;
WriteLn(f,'');
WriteLn(f,' *********************** ENERGY SUMMARIES *********************');
WriteLn(f,'');
WriteLn(f,' Emax = '+floattostr(MaxValue(en_for_st)));
WriteLn(f,' Emin = '+floattostr(MinValue(en_for_st)));
WriteLn(f,' Eaver = '+floattostrf(aver,ffFixed,10,10));
WriteLn(f,' Emax - Emin = '+floattostrf(((MaxValue(en_for_st)-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - Eaver = '+floattostrf(((MaxValue(en_for_st)-aver)*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Eaver - Emin = '+floattostrf(((aver-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Einf - Emin = '+floattostrf(((en_for_st[Length(en_for_st)-1]-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - Einf = '+floattostrf(((MaxValue(en_for_st) - en_for_st[Length(en_for_st)-1])*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - E0 = '+floattostrf(((MaxValue(en_for_st) - en_for_st[0])*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' E0 - Emin = '+floattostrf((en_for_st[0] - MinValue(en_for_st))*27.21*23.06,ffFixed,5,3) + ' kcal');
WriteLn(f,'');
WriteLn(f,' Notes: Emax - maximum of energy, Emin - minimum of energy,');
WriteLn(f,'        Eaver - average mean of energy, Einf - last point on curve,');
WriteLn(f,'        E0 - first point on curve');
WriteLn(f,'');
WriteLn(f,'');
write(f, '    ');
for i:=0 to Form44.ListView1.Columns.Count-1 do
write(f, Form44.ListView1.Column[i].Caption+ '    ');

WriteLn(f,'');

for i:=0 to Form44.ListView1.Items.Count-1 do begin
if Length(Form44.ListView1.Items[i].Caption)<5 then write(f, Copy(probel,1,5-length(Form44.ListView1.Items[i].Caption)) +Form44.ListView1.Items[i].Caption+ ' ');
if (i=0) and  (Length(Form44.ListView1.Items[i].Caption)>=5) then  write(f, Copy(probel,1,5-length('S.P.')) +'S.P.'+ ' ');
for j:=0 to Form44.ListView1.Columns.Count-2 do begin
if  j=0  then write(f, Copy(probel,1,5-length(Form44.ListView1.Items[i].SubItems[j])) +  Form44.ListView1.Items[i].SubItems[j]+ '    ');
if (j>0) and (j<ListView1.Columns.Count-3) and (Pos('Coord',ListView1.Column[j].Caption)<>0) and  (Pos('Coord',ListView1.Column[j+2].Caption)<>0) then  write(f, Copy(probel,1,3-length(Form44.ListView1.Items[i].SubItems[j])) +  Form44.ListView1.Items[i].SubItems[j]+ '    ');
if (j= ListView1.Columns.Count-3) or (j= ListView1.Columns.Count-2) then   write(f, Copy(probel,1,11-length(Form44.ListView1.Items[i].SubItems[j])) +  Form44.ListView1.Items[i].SubItems[j]+ '      ');

if (Pos('Coord',ListView1.Column[j+1].Caption)<>0) and  (Pos('-',Form44.ListView1.Items[i].SubItems[j])=0)  then   write(f, Copy(probel,1,8-length(floattostrf(strtofloat(Form44.ListView1.Items[i].SubItems[j]),ffFixed,8,3))) +  floattostrf(strtofloat(Form44.ListView1.Items[i].SubItems[j]),ffFixed,8,3)+ '    ');
if (Pos('Coord',ListView1.Column[j+1].Caption)<>0) and  (Pos('-',Form44.ListView1.Items[i].SubItems[j])<>0) then   write(f, Copy(probel,1,7) +  Form44.ListView1.Items[i].SubItems[j]+ '    ');
if (j>1) and (Length(Form44.ListView1.Items[i].SubItems[j])>=9) then write(f, Copy(probel,1,14-length(floattostrf(strtofloat(Form44.ListView1.Items[i].SubItems[j]),ffFixed,16,10))) +  floattostrf(strtofloat(Form44.ListView1.Items[i].SubItems[j]),ffFixed,16,10)+ '    ');
end;
WriteLn(f,'');
end;

WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,' **** END **** / '+Datetostr(Now)+' /');

end
else begin /////////////////////out-files
if type_of_scan_mult[basket[ComboBox1.ItemIndex]]=True then WriteLn(f,' Type of scan: Simple') else  WriteLn(f,' Type of scan: Relax');
WriteLn(f,' Number of variable coordinates: ' + inttostr(rvar));
if type_of_scan_mult[basket[ComboBox1.ItemIndex]]=True then WriteLn(f,' Number of points: ' + inttostr(counter_po))
else WriteLn(f,' Number of points: ' + inttostr(counter_po) +'; Number of steps: '+ inttostr(counter_cy));
if z_mult[basket[ComboBox1.ItemIndex]]=True then WriteLn(f,' Result of scan: Complete') else WriteLn(f,' Result of scan: WARNING! Scan calculation NOT complete!');
WriteLn(f,'');
WriteLn(f,' *********************** ENERGY SUMMARIES *********************');
WriteLn(f,'');
WriteLn(f,' Emax = '+floattostr(MaxValue(en_for_st)));
WriteLn(f,' Emin = '+floattostr(MinValue(en_for_st)));
WriteLn(f,' Eaver = '+floattostrf(aver,ffFixed,10,10));
WriteLn(f,' Emax - Emin = '+floattostrf(((MaxValue(en_for_st)-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - Eaver = '+floattostrf(((MaxValue(en_for_st)-aver)*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Eaver - Emin = '+floattostrf(((aver-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Einf - Emin = '+floattostrf(((en_for_st[Length(en_for_st)-1]-MinValue(en_for_st))*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - Einf = '+floattostrf(((MaxValue(en_for_st) - en_for_st[Length(en_for_st)-1])*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' Emax - E0 = '+floattostrf(((MaxValue(en_for_st) - en_for_st[0])*27.21*23.06),ffFixed,5,3) + ' kcal');
WriteLn(f,' E0 - Emin = '+floattostrf((en_for_st[0] - MinValue(en_for_st))*27.21*23.06,ffFixed,5,3) + ' kcal');
WriteLn(f,'');
WriteLn(f,' Notes: Emax - maximum of energy, Emin - minimum of energy,');
WriteLn(f,'        Eaver - average mean of energy, Einf - last point on curve,');
WriteLn(f,'        E0 - first point on curve');
WriteLn(f,'');
WriteLn(f,'');
write(f, '    ');
for i:=0 to Form44.ListView1.Columns.Count-1 do
write(f, Form44.ListView1.Column[i].Caption+ '    ');

WriteLn(f,'');

for i:=0 to Form44.ListView1.Items.Count-1 do begin
if Length(Form44.ListView1.Items[i].Caption)<5 then write(f, Copy(probel,1,5-length(Form44.ListView1.Items[i].Caption)) +Form44.ListView1.Items[i].Caption+ ' ');
if (i=0) and  (Length(Form44.ListView1.Items[i].Caption)>=5) then  write(f, Copy(probel,1,5-length('S.P.')) +'S.P.'+ ' ');
for j:=0 to Form44.ListView1.Columns.Count-2 do begin
if j=0 then  write(f, Copy(probel,1,5-length(Form44.ListView1.Items[i].SubItems[j])) +  Form44.ListView1.Items[i].SubItems[j]+ '    ');
if (j>0) and (j<ListView1.Columns.Count-3) and (Pos('Coord',ListView1.Column[j].Caption)<>0) and  (Pos('Coord',ListView1.Column[j+2].Caption)<>0) then  write(f, Copy(probel,1,3-length(Form44.ListView1.Items[i].SubItems[j])) +  Form44.ListView1.Items[i].SubItems[j]+ '    ');
if (j= ListView1.Columns.Count-3) or (j= ListView1.Columns.Count-2) then   write(f, Copy(probel,1,11-length(Form44.ListView1.Items[i].SubItems[j])) +  Form44.ListView1.Items[i].SubItems[j]+ '      ');

if (Pos('Coord',ListView1.Column[j+1].Caption)<>0) and  (Pos('-',Form44.ListView1.Items[i].SubItems[j])=0)  then   write(f, Copy(probel,1,8-length(floattostrf(strtofloat(Form44.ListView1.Items[i].SubItems[j]),ffFixed,8,3))) +  floattostrf(strtofloat(Form44.ListView1.Items[i].SubItems[j]),ffFixed,8,3)+ '    ');
if (Pos('Coord',ListView1.Column[j+1].Caption)<>0) and  (Pos('-',Form44.ListView1.Items[i].SubItems[j])<>0) then   write(f, Copy(probel,1,7) +  Form44.ListView1.Items[i].SubItems[j]+ '    ');
if (j>1) and (Length(Form44.ListView1.Items[i].SubItems[j])>=9) then write(f, Copy(probel,1,14-length(floattostrf(strtofloat(Form44.ListView1.Items[i].SubItems[j]),ffFixed,16,10))) +  floattostrf(strtofloat(Form44.ListView1.Items[i].SubItems[j]),ffFixed,16,10)+ '    ');
end;
WriteLn(f,'');
end;

WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,' **** END **** / '+Datetostr(Now)+' /');








end;           //////////////////end-of-out-files














CloseFile(f);
end;











end;

procedure TForm44.BitBtn5Click(Sender: TObject);
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


for j:=0 to ListView1.Columns.Count-2 do begin
if  Pos('Coord', ListView1.Column[j+1].Caption)<>0 then MSExcel.ActiveWorkbook.ActiveSheet.Columns[3+j].ColumnWidth := 10;
if  Pos('tot', ListView1.Column[j+1].Caption)<>0 then MSExcel.ActiveWorkbook.ActiveSheet.Columns[3+j].ColumnWidth := 17;
end;

MSExcel.ActiveWorkbook.ActiveSheet.Columns[2+ListView1.Columns.Count-2].ColumnWidth := 14;
MSExcel.ActiveWorkbook.ActiveSheet.Columns[2+ListView1.Columns.Count-1].ColumnWidth := 14;



for i:=0 to ListView1.Items.Count-1 do   begin
MSExcel.Cells[i+2,2]:=ListView1.Items[i].Caption;
for j:=0 to ListView1.Columns.Count-2 do begin
MSExcel.Cells[i+2,3+j]:=ListView1.Items[i].SubItems[j];
end;


end;










 0:

end;

procedure TForm44.BitBtn6Click(Sender: TObject);
begin
if dial=True then
begin
//SetLength(step,nomer_cycla);




end;








Form18.Show;




end;

end.
