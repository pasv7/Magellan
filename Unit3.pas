unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Math, Gauges;

type
  TForm3 = class(TForm)
    ComboBox1: TComboBox;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }                  
  public
    { Public declarations }
  end;

  {$MAXSTACKSIZE 1048576000}

var
  Form3: TForm3;
  a,b: real;
  c,NAll: integer;
  center,num,molmass,radius,colour: array[1..120] of string;
  id,id_mult_summ: array of integer;
  Xhist: array of real;
  pb: TGauge;
  Dist_average: real;


implementation

uses Unit1, Unit5;

{$R *.dfm}


function RedNo(str: string): string;     // Превращает Mg1, Br12, Cr4 в Mg, Br, Cr (для GLOBUS'a)
var u,i: Integer;
r: string;
begin
r:='';
for i:=1 to Length(str) do
if TryStrToInt(Copy(str,i,1),u)=False then  r:=r+Copy(str,i,1);
Result:=r;
end;


procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9','.': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

procedure TForm3.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9','.': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

procedure TForm3.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

procedure TForm3.Edit2Change(Sender: TObject);
begin
if Edit1.Text='' then a:=0;
if Edit2.Text='' then b:=0;
if Edit3.Text='' then c:=0;
if Edit1.Text<>'' then a:=strtofloat(Edit1.Text);
if Edit2.Text<>'' then b:=strtofloat(Edit2.Text);
if Edit3.Text<>'' then c:=strtoint(Edit3.Text);
Form3.Label3.Caption:='Конец диапазона: '+ floattostr(b+a*c)+' A';
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
if Edit1.Text='' then a:=0;
if Edit2.Text='' then b:=0;
if Edit3.Text='' then c:=0;
if Edit1.Text<>'' then a:=strtofloat(Edit1.Text);
if Edit2.Text<>'' then b:=strtofloat(Edit2.Text);
if Edit3.Text<>'' then c:=strtoint(Edit3.Text);
Form3.Label3.Caption:='Конец диапазона: '+ floattostr(b+a*c)+' A';
end;

procedure TForm3.Edit3Change(Sender: TObject);
begin
if Edit1.Text='' then a:=0;
if Edit2.Text='' then b:=0;
if Edit3.Text='' then c:=0;
if Edit1.Text<>'' then a:=strtofloat(Edit1.Text);
if Edit2.Text<>'' then b:=strtofloat(Edit2.Text);
if Edit3.Text<>'' then c:=strtoint(Edit3.Text);
Form3.Label3.Caption:='Конец диапазона: '+ floattostr(b+a*c)+' A';
end;

procedure TForm3.FormShow(Sender: TObject);
var i,j,k,Nbnd,s: integer;
indx: array[0..9] of string;
label 0,1;
begin
pb:= TGauge.Create(Form1.Statusbar1);
Form3.ComboBox1.Clear;
Form3.ComboBox1.Text:='Все';
if (dial=true) and ((Form1.OpenDialog1.FilterIndex=2) Or (Form1.OpenDialog1.FilterIndex=3)) then begin
Form3.ComboBox1.Items.Add('Все');
for i:=1 to nomer_atoma-1 do begin
for j:=i+1 to nomer_atoma do begin

with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='Reading bonds';
Parent:= Form1.Statusbar1;
pb.BackColor:=clBtnFace;
pb.ForeColor:=RGB(0,220,50);
 pb.Progress:=round(i/(nomer_atoma-1)*50);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-4;
   Width:= Form1.StatusBar1.Panels[1].Width-3;
   pb.Visible:=True;
end;


if Form1.OpenDialog1.FilterIndex=3 then Form3.ComboBox1.Items.Add(RedNo(atomoutel[1,i])+'-'+RedNo(atomoutel[1,j]));
if Form1.OpenDialog1.FilterIndex=2 then Form3.ComboBox1.Items.Add(center[strtoint(atomout[1][i])]+'-'+center[strtoint(atomout[1][j])]);
Application.ProcessMessages;
end;
end;
end;


if (dial=true) and (Form1.OpenDialog1.FilterIndex=1) then begin
Form3.ComboBox1.Items.Add('Все');
for k:=0 to 9 do
indx[k]:=inttostr(k);
if atom_store[Length(atom_store)-1]=''  then s:=1 else s:=0;
for i:=1 to nomer_atoma-s do begin
for j:=i+1 to nomer_atoma-s do begin

with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='Reading bonds';
Parent:= Form1.Statusbar1;
pb.BackColor:=clBtnFace;
pb.ForeColor:=RGB(0,220,50);
 pb.Progress:=round(i/(nomer_atoma-1)*90);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-4;
   Width:= Form1.StatusBar1.Panels[1].Width-3;
   pb.Visible:=True;
end;
///////////////Если атомные центры заданы численно, например 12, 1, 1 и проч./////////////////////
for k:=1 to nomer_atoma do begin
Application.ProcessMessages;
if (copy(atom_store[k],1,1)='0') or (copy(atom_store[k],1,1)='1') or (copy(atom_store[k],1,1)='2')
or (copy(atom_store[k],1,1)='3') or (copy(atom_store[k],1,1)='4') or (copy(atom_store[k],1,1)='5')
or (copy(atom_store[k],1,1)='6') or (copy(atom_store[k],1,1)='7') or (copy(atom_store[k],1,1)='8')
or (copy(atom_store[k],1,1)='9') then begin
atom_store[k]:=center[strtoint(atom_store[k])];
end;
end;
//////////////////////////////////////////////////////////////////////////////////////////////////







if (copy(atom_store[i],2,1)='0') or (copy(atom_store[i],2,1)='1') or (copy(atom_store[i],2,1)='2')
or (copy(atom_store[i],2,1)='3') or (copy(atom_store[i],2,1)='4') or (copy(atom_store[i],2,1)='5')
or (copy(atom_store[i],2,1)='6') or (copy(atom_store[i],2,1)='7') or (copy(atom_store[i],2,1)='8')
or (copy(atom_store[i],2,1)='9') then begin
atom_store[i]:=copy(atom_store[i],1,1);
goto 0;
end;

if (copy(atom_store[i],3,1)='0') or (copy(atom_store[i],3,1)='1') or (copy(atom_store[i],3,1)='2')
or (copy(atom_store[i],3,1)='3') or (copy(atom_store[i],3,1)='4') or (copy(atom_store[i],3,1)='5')
or (copy(atom_store[i],3,1)='6') or (copy(atom_store[i],3,1)='7') or (copy(atom_store[i],3,1)='8')
or (copy(atom_store[i],3,1)='9') then begin
atom_store[i]:=copy(atom_store[i],1,2);
goto 0;
end;

0:
if (copy(atom_store[j],2,1)='0') or (copy(atom_store[j],2,1)='1') or (copy(atom_store[j],2,1)='2')
or (copy(atom_store[j],2,1)='3') or (copy(atom_store[j],2,1)='4') or (copy(atom_store[j],2,1)='5')
or (copy(atom_store[j],2,1)='6') or (copy(atom_store[j],2,1)='7') or (copy(atom_store[j],2,1)='8')
or (copy(atom_store[j],2,1)='9') then begin
atom_store[j]:=copy(atom_store[j],1,1);
goto 1;
end;
if (copy(atom_store[j],3,1)='0') or (copy(atom_store[j],3,1)='1') or (copy(atom_store[j],3,1)='2')
or (copy(atom_store[j],3,1)='3') or (copy(atom_store[j],3,1)='4') or (copy(atom_store[j],3,1)='5')
or (copy(atom_store[j],3,1)='6') or (copy(atom_store[j],3,1)='7') or (copy(atom_store[j],3,1)='8')
or (copy(atom_store[j],3,1)='9') then begin
atom_store[j]:=copy(atom_store[j],1,2);
goto 1;
end;





1: Form3.ComboBox1.Items.Add(atom_store[i]+'-'+atom_store[j]);
end;
end;
end;
//end;







if dial=false then begin
Nbnd:=0;
Form3.ComboBox1.Items.Add('Все');
for k:=0 to nf-1 do begin
Nbnd:=Nbnd+nomer_atoma_mult[k]*(nomer_atoma_mult[k]-1);
for i:=1 to nomer_atoma_mult[k]-1 do begin
for j:=i+1 to nomer_atoma_mult[k] do begin
with pb do begin
  Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='Reading bonds';
Parent:= Form1.Statusbar1;
pb.BackColor:=clBtnFace;
pb.ForeColor:=RGB(0,220,50);
 pb.Progress:=round(k/(nf-1)*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-4;
   Width:= Form1.StatusBar1.Panels[1].Width-3;
   pb.Visible:=True;
end;
Application.ProcessMessages;
Form3.ComboBox1.Items.Add(center[strtoint(atomout_mult[k][1][i])]+'-'+center[strtoint(atomout_mult[k][1][j])]);
end;
end;
end;
end;










for i:=0 to Form3.ComboBox1.Items.Count-1 do begin
k:=0;
for j:=i+1 to Form3.ComboBox1.Items.Count do begin

if i=0 then pb.Progress:=90+round((j/Form3.ComboBox1.Items.Count)*5) ;
if i=1 then pb.Progress:=95+round((j/Form3.ComboBox1.Items.Count)*5) ;

Application.ProcessMessages;
if (Form3.ComboBox1.Items.Strings[i]=Form3.ComboBox1.Items.Strings[j-k]) or  (Form3.ComboBox1.Items.Strings[i]=copy(Form3.ComboBox1.Items.Strings[j-k],pos('-',Form3.ComboBox1.Items.Strings[j-k])+1,20)+'-'+copy(Form3.ComboBox1.Items.Strings[j-k],1,pos('-',Form3.ComboBox1.Items.Strings[j-k])-1))             then begin
Form3.ComboBox1.Items.Delete(j-k);
k:=k+1;
end;
end;
end;
Form1.StatusBar1.Panels[0].Text:='Ready';
if dial=true then begin
if (identificator=2) or (identificator=4) then Form1.StatusBar1.Panels[1].Text:=inttostr(Round(nomer_atoma*(nomer_atoma-1)/2))+' bonds';
if identificator=1 then Form1.StatusBar1.Panels[1].Text:=inttostr(Round((nomer_atoma-1)*(nomer_atoma-2)/2))+' bonds';
if identificator=3 then Form1.StatusBar1.Panels[1].Text:=inttostr(Round((nomer_atoma-1)*(nomer_atoma-2)/2))+' bonds';
if identificator=5 then Form1.StatusBar1.Panels[1].Text:=inttostr(Round((nomer_atoma)*(nomer_atoma-1)/2))+' bonds';
end;
if dial=false then Form1.StatusBar1.Panels[1].Text:=inttostr(Round(Nbnd/2))+' bonds';
pb.BackColor:=clBtnFace;
pb.ForeColor:=clBtnFace;
pb.Visible:=False;
pb.Progress:=0;
end;



procedure TForm3.FormCreate(Sender: TObject);
var f: TextFile;
str: widestring;
cn: array[1..14] of integer;
cart: array[1..10] of widestring;
i,p,k: integer;
label 1;
begin

{
AssignFile(f,'SYSTEMSPAR.prm');
Reset(f);
while not Eof(f) do begin
ReadLn(f,str);
if pos('Section 1',str)<>0 then  begin
ReadLn(f,str);
ReadLn(f,str);
ReadLn(f,str);  //прочитали 3 строки




/////////////////////НАЧИНАЕМ ЧИТАТЬ ПАРАМЕТРЫ////////////////////////////////////////////////////////
ReadLn(f,str);
k:=0;


1: if pos('---------',str)=0  then begin
for i:=1 to 12 do
cn[i]:=0;


for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=';') then cn[1]:=cn[1]+1         //пробелы до элемента
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>';') then cn[2]:=cn[2]+1       //элемент
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=';') then cn[3]:=cn[3]+1      //пробелы элемент-порядковый номер
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>';') then cn[4]:=cn[4]+1   //порядковый номер
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=';') then cn[5]:=cn[5]+1     //пробелы порядковый номер-масса
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>';') then cn[6]:=cn[6]+1  //молекулярная масса
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=';') then cn[7]:=cn[7]+1   //пробел масса-радиус
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>';') then cn[8]:=cn[8]+1    //радиус
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=';') then cn[9]:=cn[9]+1   //пробел радиус-цвет
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+p,1)<>';') then cn[10]:=cn[10]+1    //цвет
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


cart[1]:= copy(str,cn[1]+1,cn[2]);   //элемент
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //порядковый номер
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //молекулярная масса
cart[4]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // радиус
cart[5]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+cn[9]+1,cn[10]); //цвет
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
//end;
//end;
end;
end;  //********************************************************************************************************









end;  }
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
var k,i,j,m,p,s,nomer_atoma_max,nomer_cycla_max: integer;
k_mult: array of integer;
id_mult:  array of array of integer;
Dist: array of array of string;
Dist_mult: array of array of array of string;
Dist_summ: real;
ma1, ma2: real;
probel: widestring;
t: TextFile;

begin

id:=nil;
k_mult:=nil;
id_mult:=nil;
Dist:=nil;
Dist_mult:=nil;
id_mult_summ:=nil;
NAll:=0;
Dist_summ:=0;
Dist_average:=0;
//Xhist:=nil;


SetLength(k_mult,nf+2);

SetLength(id,c+2);


probel:='';
for i:=0 to 100 do
probel:=probel+' ';

if dial=true then begin   //******************************************************


if Form1.Opendialog1.FilterIndex=1 then begin     //GJF
if Form3.ComboBox1.ItemIndex<=0 then begin   //Если все или All bonds
SetLength(Dist,2,Round((nomer_atoma*(nomer_atoma-1))/2)+1);
k:=1;
if identificator=2 then s:=1   else s:=0;
for i:=1 to nomer_atoma-1 do begin
for j:=i+1 to nomer_atoma-1+s do begin
Dist[1][k]:=floattostr(sqrt(power((strtofloat(x[i])-strtofloat(x[j])),2)+ power((strtofloat(y[i])-strtofloat(y[j])),2) + power((strtofloat(z[i])-strtofloat(z[j])),2)));
k:=k+1;
end;
end;

ma1:=a;  //шаг построения гистограммы
ma2:=b;  //начало диапазона

NAll:=0;
Dist_summ:=0;
for j:=1 to c do  begin
id[j]:=0;       //инициализируем счетчик групп
for i:=1 to k-1 do  begin
if (strtofloat(Dist[1][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist[1][i])<ma2+ma1*j) then begin
id[j]:=id[j]+1;
NAll:=NAll+1;
Dist_summ:=Dist_summ+strtofloat(Dist[1][i]);  //Вспомогательная функция для поиска суммы длин всех связей, чтобы поделив ее на NAll получить среднюю длину
end;
end;
end;
end;

Dist_average:=Dist_summ/NAll;

if Form3.ComboBox1.ItemIndex>0 then begin      //Конкретные связи
SetLength(Dist,2,Round((nomer_atoma*(nomer_atoma-1))/2)+1);
k:=1;
for i:=1 to nomer_atoma do begin
for j:=i+1 to nomer_atoma do begin
if  (Form3.ComboBox1.Text=atom_store[i]+'-'+atom_store[j]) or  (Form3.ComboBox1.Text=atom_store[j]+'-'+atom_store[i]) then begin
Dist[1][k]:=floattostr(sqrt(power((strtofloat(x[i])-strtofloat(x[j])),2)+ power((strtofloat(y[i])-strtofloat(y[j])),2) + power((strtofloat(z[i])-strtofloat(z[j])),2)));
k:=k+1;
end;
end;
end;
ma1:=a;  //шаг построения гистограммы
ma2:=b;  //начало диапазона

NAll:=0;
for j:=1 to c do  begin
id[j]:=0;       //инициализируем счетчик групп
for i:=1 to k-1 do  begin
if (strtofloat(Dist[1][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist[1][i])<ma2+ma1*j) then begin
id[j]:=id[j]+1;
NAll:=NAll+1;
Dist_summ:=Dist_summ+strtofloat(Dist[1][i]);
end;
end;


end;  // конец  if Form3.ComboBox1.ItemIndex>0
Dist_average:=Dist_summ/NAll;
end;  // конец  if Form1.Opendialog1.FilterIndex=1
end;





if (Form1.Opendialog1.FilterIndex=2) or (Form1.Opendialog1.FilterIndex=3) then begin          //OUT
if Form3.ComboBox1.ItemIndex<=0 then begin   //Если все или All bonds
k:=1;
SetLength(Dist,nomer_cycla+1,Round((nomer_atoma*(nomer_atoma-1))/2)+1);
for i:=1 to nomer_atoma-1 do begin
for j:=i+1 to nomer_atoma do begin
Dist[nomer_cycla][k]:=floattostr(sqrt(power((strtofloat(xout[nomer_cycla][i])-strtofloat(xout[nomer_cycla][j])),2)+ power((strtofloat(yout[nomer_cycla][i])-strtofloat(yout[nomer_cycla][j])),2) + power((strtofloat(zout[nomer_cycla][i])-strtofloat(zout[nomer_cycla][j])),2)));
k:=k+1;
end;
end;

ma1:=a;  //шаг построения гистограммы
ma2:=b; //начало диапазона
//a:=strtoint(Form3.Edit3.Text); //число шагов (не представляя конец диапазона, решается вопрос с целочисленностью последнего отрезка)

NAll:=0;
for j:=1 to c do  begin
id[j]:=0;       //инициализируем счетчик групп
for i:=1 to k-1 do  begin
if (strtofloat(Dist[nomer_cycla][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist[nomer_cycla][i])<ma2+ma1*j) then begin
id[j]:=id[j]+1;
NAll:=NAll+1;
Dist_summ:=Dist_summ+strtofloat(Dist[nomer_cycla][i]);
end;
end;
end;
end;
Dist_average:=Dist_summ/NAll;


if Form3.ComboBox1.ItemIndex>0 then begin   //Если конкретная связь
SetLength(Dist,nomer_cycla+1,Round((nomer_atoma*(nomer_atoma-1))/2)+1);
k:=1;


if Form1.OpenDialog1.FilterIndex=2 then begin
for i:=1 to nomer_atoma-1 do  begin
for j:=i+1 to nomer_atoma do  begin
if  (Form3.ComboBox1.Text=center[strtoint(atomout[nomer_cycla][i])]+'-'+center[strtoint(atomout[nomer_cycla][j])]) or  (Form3.ComboBox1.Text=center[strtoint(atomout[nomer_cycla][j])]+'-'+center[strtoint(atomout[nomer_cycla][i])]) then begin
Dist[nomer_cycla][k]:=floattostr(sqrt(power((strtofloat(xout[nomer_cycla][i])-strtofloat(xout[nomer_cycla][j])),2)+ power((strtofloat(yout[nomer_cycla][i])-strtofloat(yout[nomer_cycla][j])),2) + power((strtofloat(zout[nomer_cycla][i])-strtofloat(zout[nomer_cycla][j])),2)));
k:=k+1;
//if (strtofloat(Dist[nomer_cycla][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist[nomer_cycla][i])<ma2+ma1*j) then id[j]:=id[j]+1;
end;
end;
end;
end;

if Form1.OpenDialog1.FilterIndex=3 then begin
for i:=1 to nomer_atoma-1 do  begin
for j:=i+1 to nomer_atoma do  begin
if  (Form3.ComboBox1.Text=RedNo(atomoutel[nomer_cycla,i])+'-'+RedNo(atomoutel[nomer_cycla,j])) or  (Form3.ComboBox1.Text=RedNo(atomoutel[nomer_cycla,j])+'-'+RedNo(atomoutel[nomer_cycla,i])) then begin
Dist[nomer_cycla][k]:=floattostr(sqrt(power((strtofloat(xout[nomer_cycla][i])-strtofloat(xout[nomer_cycla][j])),2)+ power((strtofloat(yout[nomer_cycla][i])-strtofloat(yout[nomer_cycla][j])),2) + power((strtofloat(zout[nomer_cycla][i])-strtofloat(zout[nomer_cycla][j])),2)));
k:=k+1;
//if (strtofloat(Dist[nomer_cycla][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist[nomer_cycla][i])<ma2+ma1*j) then id[j]:=id[j]+1;
end;
end;
end;
end;









ma1:=a;  //шаг построения гистограммы
ma2:=b; //начало диапазона

NAll:=0;
for j:=1 to c do  begin
id[j]:=0;       //инициализируем счетчик групп
for i:=1 to k-1 do  begin
if (strtofloat(Dist[nomer_cycla][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist[nomer_cycla][i])<ma2+ma1*j) then begin
id[j]:=id[j]+1;
NAll:=NAll+1;
Dist_summ:=Dist_summ+strtofloat(Dist[nomer_cycla][i]);
end;
end;
end;
Dist_average:=Dist_summ/NAll;
end;
end;

SetLength(Xhist,c+2);

AssignFile(t,'DATA.txt');
Rewrite(t);
WriteLn(t,'   BOND LENGTH (A)        COUNT');
WriteLn(t,'');
if pos('.',floattostr(a))=0 then m:=0
else m:=length(floattostr(a))-pos('.',floattostr(a));
WriteLn(t, copy(probel,1,8)+  floattostrf(ma2,ffFixed,4,m)+ copy(probel,1,20-length(floattostrf(ma2,ffFixed,4,m)))+'0');
for j:=1 to c do begin
WriteLn(t, copy(probel,1,8) +  floattostrf(ma2+ma1*j,ffFixed,4,m) + copy(probel,1,21-length(inttostr(id[j]))-length(floattostrf(ma2+ma1*j,ffFixed,4,m)))  +  inttostr(id[j]));
Xhist[j]:=ma2+ma1*j;
end;
WriteLn(t,'');
CloseFile(t);

end;   //конец    if Form1.Opendialog1.FilterIndex=2

//************************************************************************************************





if dial=false then begin
k_mult:=nil;
Setlength(id_mult,nf+2,c+2);
Setlength(k_mult,nf+2);







if Form3.ComboBox1.ItemIndex<=0 then begin   //Если все или All bonds
nomer_cycla_max:=nomer_cycla_mult[0];
for p:=0 to nf-1 do begin
if nomer_atoma_max<=nomer_atoma_mult[p] then nomer_atoma_max:=nomer_atoma_mult[p];
if nomer_cycla_max<=nomer_cycla_mult[p] then nomer_cycla_max:=nomer_cycla_mult[p];
//SetLength(Dist_mult,nf+1,nomer_cycla_mult[p]+2,ABS(Round((nomer_atoma_max*(nomer_atoma_max-1))/2))+2);
k_mult[p]:=1;
for i:=1 to nomer_atoma_mult[p]-1 do begin
for j:=i+1 to nomer_atoma_mult[p] do begin

SetLength(Dist_mult,nf+1,nomer_cycla_max+2,ABS(Round((nomer_atoma_max*(nomer_atoma_max-1))/2))+2);
Dist_mult[p][nomer_cycla_mult[p]][k_mult[p]]:=floattostr(sqrt(power((strtofloat(xout_mult[p][nomer_cycla_mult[p]][i])-strtofloat(xout_mult[p][nomer_cycla_mult[p]][j])),2)+ power((strtofloat(yout_mult[p][nomer_cycla_mult[p]][i])-strtofloat(yout_mult[p][nomer_cycla_mult[p]][j])),2) + power((strtofloat(zout_mult[p][nomer_cycla_mult[p]][i])-strtofloat(zout_mult[p][nomer_cycla_mult[p]][j])),2)));
k_mult[p]:=k_mult[p]+1;
if nomer_atoma_max<=nomer_atoma_mult[p] then nomer_atoma_max:=nomer_atoma_mult[p];
if nomer_cycla_max<=nomer_cycla_mult[p] then nomer_cycla_max:=nomer_cycla_mult[p];
end;
end;
end;

ma1:=a;  //шаг построения гистограммы
ma2:=b; //начало диапазона
//a:=strtoint(Form3.Edit3.Text); //число шагов (не представляя конец диапазона, решается вопрос с целочисленностью последнего отрезка)

NAll:=0;
for p:=0 to nf-1 do  begin
for j:=1 to c do  begin
id_mult[p][j]:=0;       //инициализируем счетчик групп
for i:=1 to k_mult[p]-1 do  begin
if (strtofloat(Dist_mult[p][nomer_cycla_mult[p]][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist_mult[p][nomer_cycla_mult[p]][i])<ma2+ma1*j) then begin
id_mult[p][j]:=id_mult[p][j]+1;
NAll:=NAll+1;
Dist_summ:=Dist_summ+strtofloat(Dist_mult[p][nomer_cycla_mult[p]][i]);
end;
end;
end;
end; // конец Form3.ComboBox1.ItemIndex=0
Dist_average:=Dist_summ/NAll;
end;





if Form3.ComboBox1.ItemIndex>0 then begin   //Если конкретные связи
nomer_cycla_max:=nomer_cycla_mult[0];
for p:=0 to nf-1 do begin
if nomer_atoma_max<=nomer_atoma_mult[p] then nomer_atoma_max:=nomer_atoma_mult[p];
if nomer_cycla_max<=nomer_cycla_mult[p] then nomer_cycla_max:=nomer_cycla_mult[p];
//SetLength(Dist_mult,nf+1,nomer_cycla_mult[p]+1,Round((nomer_atoma_mult[p]*(nomer_atoma_mult[p]-1))/2)+1);
k_mult[p]:=1;
for i:=1 to nomer_atoma_mult[p]-1 do begin
for j:=i+1 to nomer_atoma_mult[p] do begin
if  (Form3.ComboBox1.Text=center[strtoint(atomout_mult[p][nomer_cycla_mult[p]][i])]+'-'+center[strtoint(atomout_mult[p][nomer_cycla_mult[p]][j])]) or  (Form3.ComboBox1.Text=center[strtoint(atomout_mult[p][nomer_cycla_mult[p]][j])]+'-'+center[strtoint(atomout_mult[p][nomer_cycla_mult[p]][i])]) then begin
SetLength(Dist_mult,nf+1,nomer_cycla_max+2,ABS(Round((nomer_atoma_max*(nomer_atoma_max-1))/2))+2);
Dist_mult[p][nomer_cycla_mult[p]][k_mult[p]]:=floattostr(sqrt(power((strtofloat(xout_mult[p][nomer_cycla_mult[p]][i])-strtofloat(xout_mult[p][nomer_cycla_mult[p]][j])),2)+ power((strtofloat(yout_mult[p][nomer_cycla_mult[p]][i])-strtofloat(yout_mult[p][nomer_cycla_mult[p]][j])),2) + power((strtofloat(zout_mult[p][nomer_cycla_mult[p]][i])-strtofloat(zout_mult[p][nomer_cycla_mult[p]][j])),2)));
k_mult[p]:=k_mult[p]+1;
if nomer_atoma_max<=nomer_atoma_mult[p] then nomer_atoma_max:=nomer_atoma_mult[p];
if nomer_cycla_max<=nomer_cycla_mult[p] then nomer_cycla_max:=nomer_cycla_mult[p];
end;
end;
end;
end;

ma1:=a;  //шаг построения гистограммы
ma2:=b; //начало диапазона

NAll:=0;
for p:=0 to nf-1 do  begin
for j:=1 to c do  begin
id_mult[p][j]:=0;       //инициализируем счетчик групп
for i:=1 to k_mult[p]-1 do  begin
if (strtofloat(Dist_mult[p][nomer_cycla_mult[p]][i])>=ma2+ma1*(j-1)) and (strtofloat(Dist_mult[p][nomer_cycla_mult[p]][i])<ma2+ma1*j) then begin
id_mult[p][j]:=id_mult[p][j]+1;
NAll:=NAll+1;
Dist_summ:=Dist_summ+strtofloat(Dist_mult[p][nomer_cycla_mult[p]][i]);
end;
end;
end; // конец Form3.ComboBox1.ItemIndex>0
end;  // конец Form3.ComboBox1.ItemIndex>0
Dist_average:=Dist_summ/NAll;
end;



SetLength(id_mult_summ,c+2);

id_mult_summ[j]:=0;
for j:=1 to c do begin
for i:=0 to nf-1 do begin
id_mult_summ[j]:=id_mult_summ[j]+id_mult[i][j];
end;
end;





SetLength(Xhist,c+2);

AssignFile(t,'DATA.txt');
Rewrite(t);
WriteLn(t,'   BOND LENGTH (A)        COUNT');
WriteLn(t,'');
if pos('.',floattostr(a))=0 then m:=0
else m:=length(floattostr(a))-pos('.',floattostr(a));
WriteLn(t, copy(probel,1,8)+  floattostrf(ma2,ffFixed,4,m)+ copy(probel,1,20-length(floattostrf(ma2,ffFixed,4,m)))+'0');
for j:=1 to c do begin
WriteLn(t, copy(probel,1,8) +  floattostrf(ma2+ma1*j,ffFixed,4,m) + copy(probel,1,21-length(inttostr(id_mult_summ[j]))-length(floattostrf(ma2+ma1*j,ffFixed,4,m)))  +  inttostr(id_mult_summ[j]));
Xhist[j]:=ma2+ma1*j;
end;
WriteLn(t,'');
CloseFile(t);

end;   // конец dial=false



end;















procedure TForm3.BitBtn3Click(Sender: TObject);
begin
Form3.Close;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
Form5.Show;
end;

end.
