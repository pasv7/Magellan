unit Unit39;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, Math;

type
  TForm39 = class(TForm)
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton3: TRadioButton;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    RadioButton4: TRadioButton;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label3: TLabel;
    CheckBox2: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;
  c_at,c_gr,szf,sstrings: Integer;
  anal: Boolean;
  centr1: array of WideString;

implementation

uses Unit1,Unit36,Unit40,Unit18,Unit3;

{$R *.dfm}
{$MAXSTACKSIZE 1048576000}

type
RealArray = array of String;


function iscoord(str: widestring): RealArray;
var s,i,p: integer;
cn: array[0..11] of integer;
cart: array[0..3] of string;
a,b,c: extended;
begin
s:=0;
Result:=nil;
for i:=0 to length(str) do
if copy(str,i,1)='.' then s:=s+1;



for i:=0 to 11 do
cn[i]:=0;
for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //пробелы до элемента
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //элемент
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //1-ая координата
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+p,1)=',') then cn[5]:=cn[5]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+p,1)<>',') then cn[6]:=cn[6]+1  //2-ая
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+p,1)=',') then cn[7]:=cn[7]+1
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+p,1)<>',') then cn[8]:=cn[8]+1       //3-ая
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+cn[8]+p,1)=',') then cn[9]:=cn[9]+1
else break;
end;


cart[0]:= copy(str,cn[1]+1,cn[2]);   //номер центра
cart[1]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);    //X
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+1,cn[6]);   //Y
cart[3]:= copy(str,cn[1]+cn[2]+cn[3]+cn[4]+cn[5]+cn[6]+cn[7]+1,cn[8]);  // Z

if (s=3) and (cart[0]<>'') and (TryStrToFloat(cart[1],a)) and  (TryStrToFloat(cart[2],b))  and (TryStrToFloat(cart[3],c)) then begin
{
if pos('E+',cart[1])<>0  then xxx:=strtofloat(copy(cart[1],1,pos('E',cart[1])-1))*power(10,strtoint(copy(cart[1],pos('E',cart[1])+2,5)));
if pos('E-',cart[1])<>0  then xxx:=strtofloat(copy(cart[1],1,pos('E',cart[1])-1))/power(10,strtoint(copy(cart[1],pos('E',cart[1])+2,5)));
if pos('E',cart[1])<>0  then xxx:=strtofloat(copy(cart[1],1,pos('E',cart[1])-1))*power(10,strtoint(copy(cart[1],pos('E',cart[1])+1,5)));
if pos('E',cart[1])=0  then xxx:=strtofloat(cart[1]);

if pos('E+',cart[2])<>0  then yyy:=strtofloat(copy(cart[2],1,pos('E',cart[2])-1))*power(10,strtoint(copy(cart[2],pos('E',cart[2])+2,5)));
if pos('E-',cart[2])<>0  then yyy:=strtofloat(copy(cart[2],1,pos('E',cart[2])-1))/power(10,strtoint(copy(cart[2],pos('E',cart[2])+2,5)));
if pos('E',cart[2])<>0  then yyy:=strtofloat(copy(cart[2],1,pos('E',cart[2])-1))*power(10,strtoint(copy(cart[2],pos('E',cart[2])+1,5)));
if pos('E',cart[2])=0  then yyy:=strtofloat(cart[2]);

if pos('E+',cart[3])<>0  then zzz:=strtofloat(copy(cart[3],1,pos('E',cart[3])-1))*power(10,strtoint(copy(cart[3],pos('E',cart[3])+2,5)));
if pos('E-',cart[3])<>0  then zzz:=strtofloat(copy(cart[3],1,pos('E',cart[3])-1))/power(10,strtoint(copy(cart[3],pos('E',cart[3])+2,5)));
if pos('E',cart[3])<>0  then zzz:=strtofloat(copy(cart[3],1,pos('E',cart[3])-1))*power(10,strtoint(copy(cart[3],pos('E',cart[3])+1,5)));
if pos('E',cart[3])=0  then zzz:=strtofloat(cart[3]);
}
SetLength(Result,4);
Result[0]:=cart[0];
Result[1]:=FloatToStr(a);
Result[2]:=FloatToStr(b);
Result[3]:=FloatToStr(c);



end
else  begin
SetLength(Result,4);
Result[0]:='';
end;

end;























procedure TForm39.BitBtn1Click(Sender: TObject);
var i,j,k,s,Nat,t,x,p,cn1,cn2,g,l,u: Integer;      //c_gr - число групп, c_at - число атомов
stroka,centr2: array of WideString;
group,at_in_gr,group_r,at_in_gr_r,tmp_r: array of Integer;
str,str1,str2,str3,str4,str5,str_re,str_temp,lett: WideString;
f: TextFile;
Tr,Pv: boolean;
hFile, fileSize: Integer; 
fileName: String;
label 0,10,15,20,21,25,26,35,36;
begin

SetLength(xout,0);
SetLength(yout,0);
SetLength(zout,0);
SetLength(atomoutel,0);
SetLength(stroka,0);


x_draw_out:=nil;  //Юнит36 начинается
y_draw_out:=nil;
z_draw_out:=nil;
nc:=0;
scr_x:=nil;  // обнуление глобальных переменных экранных координат при выводе модели
scr_y:=nil;  // обнуление глобальных переменных экранных координат
scr_z:=nil;  // обнуление глобальных переменных экранных координат (Unit36)
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
order_z:=nil;
//rot_:=0;
are_bonds:=nil;
bonds_painted:=false;
Evolut:=false;
step1:=0;
xdraw:=nil;
ydraw:=nil;
zdraw:=nil;
native_x:=nil;
native_y:=nil;
native_z:=nil;
colour_atom:=nil;
x_draw :=nil;
y_draw:=nil;
z_draw:=nil;
at_in_gr:=nil;
at_in_gr_r:=nil;
group:=nil;
group_r:=nil;
stroka:=nil;
D1:=0;
Combobox1.Clear;
//if anal=False then centr1:=nil;


SetProcessWorkingSetSize(GetCurrentProcess,$FFFFFFFF,$FFFFFFFF);




pb:= TGauge.Create(Form1.Statusbar1);
pb.Visible:=False;

if centr1=nil then szf:=0;

if szf <=0 then begin
filename:=PChar(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');
hFile := FileOpen(filename, fmOpenRead);
fileSize := GetFileSize(hFile, nil);
szf:=fileSize;
FileClose(hFile);
end;

 

AssignFile(f,PChar(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr'));
Reset(f);

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//Сюда внедрим расчет числа атомов, типа атомов и числа циклов
//Оно будет общим для всех случаем

SetLength(stroka,2);
Pv:=False;

if (centr1<>nil) and (anal=true) then goto 0;

k:=0;
i:=1;
j:=1;
if centr1=nil then  sstrings:=0;
Nat:=0;

if centr1=nil then begin

while not Eof(f) do begin

sstrings:=sstrings+1;

Application.ProcessMessages;

if anal=True then begin
Form40.Gauge1.Progress:= Round(sstrings*8000/szf);
Form40.Label1.Caption:='Прочитано групп: '+inttostr(i);
end;


//=============================================================================
with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='Analyzing XYZ';
Parent:= Form1.Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
 pb.Progress:=Round(sstrings*8000/szf);     //List.Count - число строк в текстовом файле
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-3;
   Width:= Form1.StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;
//=============================================================================








Readln(f,stroka[k]);
if k>0 then begin
if (iscoord(stroka[k])[0]='') and (iscoord(stroka[k-1])[0]<>'') and (TryStrToInt(iscoord(stroka[k-1])[0],u)=False) then begin
i:=i+1;
if Pv=False then begin
setlength(centr1,length(centr1)+1);
centr1[length(centr1)-1]:=iscoord(stroka[k-1])[0];
end;
Pv:=True;
j:=1;
end;
if (iscoord(stroka[k])[0]<>'') and (iscoord(stroka[k-1])[0]<>'') and ((TryStrToInt(iscoord(stroka[k])[0],u)=False) and (TryStrToInt(iscoord(stroka[k-1])[0],u)=False)) then begin
if Pv=False then begin
SetLength(centr1,Length(centr1)+1);
centr1[j-1]:=iscoord(stroka[k-1])[0];
end;
j:=j+1;
if Nat<j+1 then Nat:=j+1;
end;
end;
k:=k+1;
if k=2 then begin k:=0;
stroka[k]:=stroka[1];
stroka[1]:='';
k:=k+1;
end;
end;

SetLength(centr1,Length(centr1)+1);
centr1[Length(centr1)-1]:=iscoord(stroka[0])[0];


if centr1[Length(centr1)-1]='' then SetLength(centr1,Length(centr1)-1); //////////// 15.12.18
c_at:=Length(centr1);
c_gr:=i-1;

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

 Pv:=False;
 stroka:=nil;
 if anal=True then goto 0;
 end;
 CloseFile(f);
 if anal=True then goto 0;

 AssignFile(f,PChar(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr'));
 Reset(f);




if  (RadioButton1.Checked)  and (Edit1.Text='') and (Edit2.Text='')    then  goto 10;
if  (RadioButton1.Checked)  and ((Edit1.Text<>'') or (Edit2.Text<>''))    then begin

if (Edit1.Text<>'') and (Edit2.Text<>'') and ((length(Edit1.Text)<=3) or (length(Edit2.Text)<=3))   then begin
ShowMessage('Флаги содержат менее 4 символов. Рекомендуется 4 и более символа');
end;

if (Edit1.Text='') and (Edit2.Text<>'') and (length(Edit2.Text)<=3)   then begin
ShowMessage('Флаг содержит менее 4 символов. Рекомендуется 4 и более символа');
end;

if (Edit2.Text='') and (Edit1.Text<>'') and (length(Edit1.Text)<=3)   then begin
ShowMessage('Флаг содержит менее 4 символов. Рекомендуется 4 и более символа');
end;



Tr:=false;

if (Edit1.Text='') and (Edit2.Text<>'')   then begin
Tr:=True;
end;



setlength(stroka,2);

Nat:=1;
k:=0;
i:=1;
j:=1;
while not EoF(f) do begin
//setlength(stroka,k+1);      ***
ReadLn(f,stroka[k]);




if Edit1.Text<>'' then if Pos(Edit1.Text,stroka[k])<>0 then Tr:=true;
if Tr=true then begin


//=============================================================================
with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='Reading XYZ';
Parent:= Form1.Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
 pb.Progress:=Round(i/c_gr*100);     //List.Count - число строк в текстовом файле
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-3;
   Width:= Form1.StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;
//=============================================================================




//k:=k+1;    ***
//setlength(stroka,k+1);  ***

//if k>1 then begin   ***
if k>0 then begin
//if (iscoord(stroka[k-1])[0]='') and (iscoord(stroka[k-2])[0]<>'') then begin       ***
if (iscoord(stroka[k])[0]='') and (iscoord(stroka[k-1])[0]<>'') and (TryStrToInt(iscoord(stroka[k-1])[0],u)=False) then begin
i:=i+1;
j:=1;
end;
if (iscoord(stroka[k])[0]<>'') and (iscoord(stroka[k-1])[0]<>'') and ((TryStrToInt(iscoord(stroka[k])[0],u)=False) and (TryStrToInt(iscoord(stroka[k-1])[0],u)=False)) then begin
j:=j+1;
if Nat<j+1 then Nat:=j+1;
end;
end;      //***
//k:=k+1;
//if k=2 then begin k:=0;
//stroka[0]:=stroka[1];
//stroka[1]:='';
//k:=k+1;
//end;


//if k=1 then k:=0;





if (iscoord(stroka[k])[0]<>'') and (TryStrToInt(iscoord(stroka[k])[0],u)=False) then begin
setlength(atomoutel,i+1,Nat+1);
setlength(xout,i+1,Nat+1);
setlength(yout,i+1,Nat+1);
setlength(zout,i+1,Nat+1);
atomoutel[i,j]:=iscoord(stroka[k])[0];
xout[i,j]:=iscoord(stroka[k])[1];
yout[i,j]:=iscoord(stroka[k])[2];
zout[i,j]:=iscoord(stroka[k])[3];
end;

k:=k+1;
if k=2 then begin k:=0;
stroka[0]:=stroka[1];
stroka[1]:='';
k:=k+1;
end;



end;
//end;
nomer_cycla:=i-1;
nomer_atoma:=Nat-1;
if Edit2.Text<>'' then begin
  if k>0 then  begin
if Pos(Edit2.Text,stroka[k-1])<>0 then begin
stroka:=nil;
Tr:=false;
Break;
end;
end;
end;
end;




end;



//end;




if (c_gr=0) and (c_at>=1) then begin
c_gr:=1;
nomer_cycla:=1;
end;



if (RadioButton3.Checked) and (Edit5.Text='') and (Edit6.Text='')    then begin     //Читать файл автоматически
10:
Nat:=1;
k:=0;
i:=1;
j:=1;
setlength(stroka,2);
while not EoF(f) do begin
//k:=k+1;     ***
//setlength(stroka,k+1);  ***
//stroka[0]:='';       //16.12.18
//stroka[1]:='';       //16.12.18
ReadLn(f,stroka[k]);

with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='Reading XYZ';
Parent:= Form1.Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
 pb.Progress:=Round(i/c_gr*100);
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-3;
   Width:= Form1.StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;

if k>0 then begin
if (iscoord(stroka[k])[0]='') and (iscoord(stroka[k-1])[0]<>'') and (TryStrToInt(iscoord(stroka[k-1])[0],u)=False) then begin
i:=i+1;
j:=1;
end;
if (iscoord(stroka[k])[0]<>'') and (iscoord(stroka[k-1])[0]<>'') and ((TryStrToInt(iscoord(stroka[k])[0],u)=False) and (TryStrToInt(iscoord(stroka[k-1])[0],u)=False)) then begin
j:=j+1;
if Nat<j+1 then Nat:=j+1;
end;
//if (iscoord(stroka[k])[0]<>'') and (iscoord(stroka[k-1])[0]='') then begin
//j:=j+0;
//if Nat<j+1 then Nat:=j+1;
//end;
//end;      //***




if (iscoord(stroka[k])[0]<>'') and (TryStrToInt(iscoord(stroka[k])[0],u)=False) then begin
setlength(atomoutel,i+1,Nat+1);
setlength(xout,i+1,Nat+1);
setlength(yout,i+1,Nat+1);
setlength(zout,i+1,Nat+1);
if iscoord(stroka[k-1])[0]<>'' then atomoutel[i,j-1]:= iscoord(stroka[k-1])[0]; // это если геометрия (описание) начинается с 0-вой строки
atomoutel[i,j]:=iscoord(stroka[k])[0];
if (iscoord(stroka[k-1])[1]<>'') and (iscoord(stroka[k-1])[2]<>'') and (iscoord(stroka[k-1])[3]<>'') then begin
xout[i,j-1]:=iscoord(stroka[k-1])[1];
yout[i,j-1]:=iscoord(stroka[k-1])[2];
zout[i,j-1]:=iscoord(stroka[k-1])[3];
end;
xout[i,j]:=iscoord(stroka[k])[1];
yout[i,j]:=iscoord(stroka[k])[2];
zout[i,j]:=iscoord(stroka[k])[3];
end;
end;
k:=k+1;
if k=2 then begin k:=0;
stroka[0]:=stroka[1];
stroka[1]:='';
k:=k+1;
end;




//end;
end;
nomer_cycla:=i-1;
nomer_atoma:=Nat-1;

goto 0;
end;


// #############################################################
// #############################################################
// #############################################################
// #############################################################





if (RadioButton3.Checked) and ((Edit5.Text<>'') or (Edit6.Text<>''))    then begin


Nat:=1;
k:=0;
i:=1;
j:=1;
SetLength(stroka,2);


if (Edit5.Text<>'') and (Edit6.Text<>'') and (CheckBox1.Checked=False) and
((StrToInt(Edit5.Text)>StrToInt(Edit6.Text)) or (copy(Edit6.Text,1,1)='0') or (copy(Edit5.Text,1,1)='0')) then begin
ShowMessage('Неверно введены параметры. Не задано ни одного цикла для чтения!');
goto 0;
end;



if (Edit5.Text<>'') and (Edit6.Text<>'') and (CheckBox1.Checked) and
((copy(Edit6.Text,1,1)='0') or (copy(Edit5.Text,1,1)='0'))  then begin
ShowMessage('Неверно заданы условия. Измените значения!');
goto 0;
end;

if (Edit5.Text<>'') and (CheckBox1.Checked) and
((copy(Edit6.Text,1,1)='0') or (copy(Edit5.Text,1,1)='0'))  then begin
ShowMessage('Неверно заданы условия. Измените значения!');
goto 0;
end;


if (Edit5.Text<>'') and (Edit6.Text<>'') and (CheckBox1.Checked=False) and
(StrToInt(Edit6.Text) - StrToInt(Edit5.Text)+1>c_gr)  then begin
ShowMessage('Затребованные номера циклов превышают действительное число циклов!'+#13+'Максимальное число циклов для данной системы ' +inttostr(c_gr));
goto 0;
end;


if (Edit6.Text<>'') and (Edit5.Text='') then begin
if strtoint(Edit6.Text)<=0   then begin
ShowMessage('Неверно заданы условия. Измените значения!');
goto 0;
end;
end;


if (Edit6.Text='') and (Edit5.Text<>'') then begin
if strtoint(Edit5.Text)<=0   then begin
ShowMessage('Неверно заданы условия. Измените значения!');
goto 0;
end;
end;




if Edit5.Text<>'' then begin
if strtoint(Edit5.Text)>c_gr   then begin
ShowMessage('Затребованные номера циклов превышают действительное число циклов!'+#13+'Максимальное число циклов для данной системы ' +inttostr(c_gr));
goto 0;
end;
end;

if (Edit6.Text<>'') and (Edit5.Text='') then begin
if strtoint(Edit6.Text)>c_gr   then begin
ShowMessage('Затребованные номера циклов превышают действительное число циклов!'+#13+'Максимальное число циклов для данной системы ' +inttostr(c_gr));
goto 0;
end;
end;


if (Edit6.Text<>'') and (Edit5.Text<>'') then begin
if (strtoint(Edit5.Text)+strtoint(Edit6.Text)-1>c_gr) and (CheckBox1.Checked=True)  then begin
ShowMessage('Затребованные номера циклов превышают действительное число циклов!'+#13+'Максимальное число циклов для данной системы ' +inttostr(c_gr));
goto 0;
end;
end;


while not EoF(f) do begin
//k:=k+1;
//setlength(stroka,k+1);


ReadLn(f,stroka[k]);


with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='Reading XYZ';
Parent:= Form1.Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
 if (Edit5.Text='') and (Edit6.Text<>'') then  pb.Progress:=Round(i/strtoint(Edit6.Text)*100);     //
 if (Edit5.Text<>'') and (Edit6.Text='') then  pb.Progress:=Round(i/(c_gr-strtoint(Edit5.Text))*100);     //
 if (Edit5.Text<>'') and (Edit6.Text<>'') and (CheckBox1.Checked=True) then  pb.Progress:=Round(i/strtoint(Edit6.Text)*100);     //
 if (Edit5.Text<>'') and (Edit6.Text<>'') and (CheckBox1.Checked=False) then  pb.Progress:=Round(i/(strtoint(Edit6.Text)-strtoint(Edit5.Text))*100);

 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-3;
   Width:= Form1.StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;

if k>0 then begin
if (iscoord(stroka[k])[0]='') and (iscoord(stroka[k-1])[0]<>'') then begin     //Текущая строка - не координаты, а прошлая была координаты
i:=i+1;                                                                        //увеличили счетчик групп на 1
j:=1;                                                                          //сбросили номер атома, т.к. перешли в другую группу
end;
if (iscoord(stroka[k])[0]<>'') and (iscoord(stroka[k-1])[0]<>'') then begin    //Если текущая строка атом и предыдущая тоже, то номер атома увеличиваем на 1
j:=j+1;
if Nat<j+1 then Nat:=j+1;
end;

if Edit5.Text<>'' then begin                   //Если в Edit5 что-то есть, то начинаем читать оттуда
if i>=strtoint(Edit5.Text) then begin          //+1 ***
if iscoord(stroka[k])[0]<>'' then begin
setlength(atomoutel,i-strtoint(Edit5.Text)+2,Nat+1);
setlength(xout,i-strtoint(Edit5.Text)+2,Nat+1);
setlength(yout,i-strtoint(Edit5.Text)+2,Nat+1);
setlength(zout,i-strtoint(Edit5.Text)+2,Nat+1);
atomoutel[i-strtoint(Edit5.Text)+1,j]:=iscoord(stroka[k])[0];
xout[i-strtoint(Edit5.Text)+1,j]:=iscoord(stroka[k])[1];
yout[i-strtoint(Edit5.Text)+1,j]:=iscoord(stroka[k])[2];
zout[i-strtoint(Edit5.Text)+1,j]:=iscoord(stroka[k])[3];
end;
end;
end
else begin
if i>=1 then begin           //Если ничего нет, то с самого начала (i=1)
if iscoord(stroka[k])[0]<>'' then begin
setlength(atomoutel,i+1,Nat+1);
setlength(xout,i+1,Nat+1);
setlength(yout,i+1,Nat+1);
setlength(zout,i+1,Nat+1);
atomoutel[i,j]:=iscoord(stroka[k])[0];
xout[i,j]:=iscoord(stroka[k])[1];
yout[i,j]:=iscoord(stroka[k])[2];
zout[i,j]:=iscoord(stroka[k])[3];
end;
end;
end;

end;


k:=k+1;
if k=2 then begin k:=0;
stroka[0]:=stroka[1];
stroka[1]:='';
k:=k+1;
end;





if  (Edit6.Text<>'') and (CheckBox1.Checked) and (Edit5.Text<>'') then begin          //Если читать количество групп
if i>=strtoint(Edit5.Text)+strtoint(Edit6.Text) then goto 0;
end;

if  (Edit6.Text<>'') and (CheckBox1.Checked) and (Edit5.Text='') then begin          //Если читать количество групп
if i>=1+strtoint(Edit6.Text) then goto 0;
end;



if  (Edit6.Text<>'') and (CheckBox1.Checked=False) then begin    //Если читать до группы с номером
if i>strtoint(Edit6.Text) then goto 0;
end;




if  Edit6.Text='' then  nomer_cycla:=i-strtoint(Edit5.Text);
if (Edit6.Text<>'') and (CheckBox1.Checked) then nomer_cycla:=StrToInt(Edit6.Text);
if (Edit6.Text<>'') and (CheckBox1.Checked=False) and (Edit5.Text<>'') then nomer_cycla:=StrToInt(Edit6.Text)-strtoint(Edit5.Text)+1;
if (Edit6.Text<>'') and (CheckBox1.Checked=False) and (Edit5.Text='') then nomer_cycla:=StrToInt(Edit6.Text);



nomer_atoma:=Nat-1;
end;
end;


// #############################################################
// #############################################################
// #############################################################
// #############################################################

if RadioButton4.Checked=True then begin

 if (Edit7.Text='') and (Edit8.Text='') then goto 10; // Читается весь файл и все атомы
 if (Edit7.Text<>'') or (Edit8.Text<>'') then begin
 if (Edit7.Text<>'') or (Edit8.Text<>'') then begin //надо считать номера затребованных групп
  str:=' '+Edit7.Text+' ';




  //Ищем спецификаторы типа D,E,S,T...    для групп
  // D = #10#
  // E = #2#
  // S = #100#
  // T = #1000#
  // R = #5#
  // Q = #20#
  // N = #50#
  // H = #200#
  // P = #500#
  // U = #5000#
  // X = #10000#

 i:=1;
 str_temp:='';
 lett:='';

 while i<Length(str) do begin
 t:=0;
 j:=0;
 lett:='';
 if (Copy(str,i,1)='D') or (Copy(str,i,1)='E') or (Copy(str,i,1)='S') or (Copy(str,i,1)='T') or (Copy(str,i,1)='R') or  (Copy(str,i,1)='Q') or (Copy(str,i,1)='N') or (Copy(str,i,1)='H') or (Copy(str,i,1)='P') or (Copy(str,i,1)='U') or (Copy(str,i,1)='X') then begin
 lett:= Copy(str,i,1);
 for j:=1 to 10 do
 if (Copy(str,i-j,1)=' ') or (Copy(str,i-j,1)=',') or (Copy(str,i-j,1)=';') or (Copy(str,i-j,1)='-') then Break;
 for t:=1 to 20 do
 if (Copy(str,i+t,1)=' ') or (Copy(str,i+t,1)=',') or (Copy(str,i+t,1)=';') or (Copy(str,i+t,1)='-') then Break;
 str_temp:=copy(str_temp,1,length(str_temp)-j+1);
 str1:=Copy(str,i-j+1,t+j-1);      // Вся спецификация
 str2:=Copy(str1,1,Pos(lett,str1)-1);   //До первой #
 str3:=copy(str1,Pos(str2+lett,str1)+Length(str2+lett),20);
 str4:=Copy(str3,1,Pos(lett,str3)-1);  //Между решетками
 str5:=Copy(str3,Pos(str4+lett,str3)+Length(str4+lett),20); //Последняя цифра
 str1:=str2;
 str2:=str4;
 str3:=str5;
 str_re:='';
 if lett='D' then str2:='10'; if lett='E' then str2:='2';  if lett='S' then str2:='1000';
 if lett='T' then str2:='1000'; if lett='R' then str2:='5'; if lett='Q' then str2:='20';
 if lett='N' then str2:='50'; if lett='H' then str2:='200'; if lett='P' then str2:='500';
 if lett='U' then str2:='5000'; if lett='X' then str2:='10000';

 for  p:=0 to StrToInt(str3) do
 if p=0 then str_re:=str1 else str_re:=str_re+','+ IntToStr(strtoint(str1)+strtoint(str2)*p);

 str_re:=str_re+' ';

 end;

 if (t=0) and (j=0) then i:=i+1
 else i:=i+t+1;
 if (t=0) and (j=0) then str_re:=Copy(str,i-1,1);
str_temp:=str_temp+str_re;
end;


str:=' '+str_temp+' ';




 //Ищем спецификаторы типа n#m#k 5D40 ... для групп

 i:=1;
 str_temp:='';

 while i<Length(str) do begin
 t:=0;
 j:=0;
 if Copy(str,i,1)='#' then begin
 for j:=1 to 10 do
 if (Copy(str,i-j,1)=' ') or (Copy(str,i-j,1)=',') or (Copy(str,i-j,1)=';') or (Copy(str,i-j,1)='-') then Break;
 for t:=1 to 20 do
 if (Copy(str,i+t,1)=' ') or (Copy(str,i+t,1)=',') or (Copy(str,i+t,1)=';') or (Copy(str,i+t,1)='-') then Break;
 str_temp:=copy(str_temp,1,length(str_temp)-j+1);
 str1:=Copy(str,i-j+1,t+j-1);      // Вся спецификация
 str2:=Copy(str1,1,Pos('#',str1)-1);   //До первой #
 str3:=copy(str1,Pos(str2+'#',str1)+Length(str2+'#'),20);
 str4:=Copy(str3,1,Pos('#',str3)-1);  //Между решетками
 str5:=Copy(str3,Pos(str4+'#',str3)+Length(str4+'#'),20); //Последняя цифра
 str1:=str2;
 str2:=str4;
 str3:=str5;
 str_re:='';
 for  p:=0 to StrToInt(str3) do
 if p=0 then str_re:=str1 else str_re:=str_re+','+ IntToStr(strtoint(str1)+strtoint(str2)*p);

 str_re:=str_re+' ';

 end;

 if (t=0) and (j=0) then i:=i+1
 else i:=i+t+1;
 if (t=0) and (j=0) then str_re:=Copy(str,i-1,1);
str_temp:=str_temp+str_re;
end;


 str:=' '+str_temp+' ';


 //Читаем строку групп
 //======================================================================================
 t:=0;
 x:=0;
 20:
 for p:=1 to Length(str) do begin
   if (Copy(str,p+x,1)=' ') or (Copy(str,p+x,1)=',') or (Copy(str,p+x,1)=';') or (Copy(str,p+x,1)='-') or (Copy(str,p+x,1)='') then
   cn1:=cn1+1
   else Break;
 end;
 if (pos('-',Copy(str,p+x-cn1,cn1))<>0) and (cn1<>0) then begin
 SetLength(group,t+1);
 group[t]:=-1;
 t:=t+1;
 end;
 x:=x+cn1;
 cn2:=0;
 for p:=1 to Length(str) do begin
   if (Copy(str,p+x,1)<>' ') and (Copy(str,p+x,1)<>',') and (Copy(str,p+x,1)<>';') and (Copy(str,p+x,1)<>'-') and (Copy(str,p+x,1)<>'') then
   cn2:=cn2+1
   else Break;
   if p+x=length(str) then break;
 end;
  SetLength(group,t+1);
  if (Pos('-',Copy(str,x+1,cn2))=0) and (Copy(str,x+1,cn2)<>'') then group[t]:=StrToInt(Copy(str,x+1,cn2))
  else if (Copy(str,x+1,cn2)<>'') then group[t]:=-1;
  x:=x+cn2;
  t:=t+1;
  cn1:=0;
  if x<Length(str) then goto 20;
 //================================================================================================
  if group[Length(group)-1]=0 then SetLength(group,Length(group)-1);


 // ==================================================================================================
 // ==================================================================================================

  str:=' '+Edit8.Text + ' ';

 // Ищем символы центров (C,O,Si,Mn,H,...)

 i:=1;
 t:=0;
 x:=0;
 str_temp:='';
 lett:='';

  for i:=1 to Length(str) do  begin
  if Copy(str,i,1)='(' then Break;     // Начинаем читать центры
  end;

  j:=i+1;

 while Copy(str,j+x,1)<>')' do begin

   for j:=i+1 to length(str) do begin
    if (Copy(str,j+x,1)=' ') or  (Copy(str,j+x,1)=',') or  (Copy(str,j+x,1)=';')  then cn1:=cn1+1
    else Break;
    end;

   x:=x+cn1;
   cn2:=0;
   for j:=i+1 to length(str) do begin
   if (Copy(str,j+x,1)<>' ') and (Copy(str,j+x,1)<>')') and (Copy(str,j+x,1)<>',') and (Copy(str,j+x,1)<>';') then cn2:=cn2+1
   else Break;
   end;

   SetLength(centr2,t+1);
   if Copy(str,i+x+1,cn2)<>'' then centr2[t]:=Copy(str,i+x+1,cn2);
   x:=x+cn2;
   t:=t+1;
   cn1:=0;

   if Copy(str,i+x+1,1)=')' then Break;
   if pos(')',str)=0 then break;

  end;


  str5:='';
  // Сравниваем центры, которые реально есть в системе с затребованными и получаем номера затребованных
  for i:=0 to Length(centr1)-1 do
  for j:=0 to Length(centr2)-1 do
  if centr1[i]=centr2[j] then  str5:=str5+' '+ IntToStr(i+1);

  str5:=str5+' ';


  str:=Copy(str,1,Pos('(',str)-1)+str5+Copy(str,Pos(')',str)+1,Length(str));



















  //Ищем спецификаторы типа D,E,S,T...    для атомов
  // D = #10#
  // E = #2#
  // S = #100#
  // T = #1000#
  // R = #5#
  // Q = #20#
  // N = #50#
  // H = #200#
  // P = #500#
  // U = #5000#
  // X = #10000#

 i:=1;
 str_temp:='';
 lett:='';

 while i<Length(str) do begin
 t:=0;
 j:=0;
 lett:='';
 if (Copy(str,i,1)='D') or (Copy(str,i,1)='E') or (Copy(str,i,1)='S') or (Copy(str,i,1)='T') or (Copy(str,i,1)='R') or  (Copy(str,i,1)='Q') or (Copy(str,i,1)='N') or (Copy(str,i,1)='H') or (Copy(str,i,1)='P') or (Copy(str,i,1)='U') or (Copy(str,i,1)='X') then begin
 lett:= Copy(str,i,1);
 for j:=1 to 10 do
 if (Copy(str,i-j,1)=' ') or (Copy(str,i-j,1)=',') or (Copy(str,i-j,1)=';') or (Copy(str,i-j,1)='-') then Break;
 for t:=1 to 20 do
 if (Copy(str,i+t,1)=' ') or (Copy(str,i+t,1)=',') or (Copy(str,i+t,1)=';') or (Copy(str,i+t,1)='-') then Break;
 str_temp:=copy(str_temp,1,length(str_temp)-j+1);
 str1:=Copy(str,i-j+1,t+j-1);      // Вся спецификация
 str2:=Copy(str1,1,Pos(lett,str1)-1);   //До первой #
 str3:=copy(str1,Pos(str2+lett,str1)+Length(str2+lett),20);
 str4:=Copy(str3,1,Pos(lett,str3)-1);  //Между решетками
 str5:=Copy(str3,Pos(str4+lett,str3)+Length(str4+lett),20); //Последняя цифра
 str1:=str2;
 str2:=str4;
 str3:=str5;
 str_re:='';
 if lett='D' then str2:='10'; if lett='E' then str2:='2';  if lett='S' then str2:='1000';
 if lett='T' then str2:='1000'; if lett='R' then str2:='5'; if lett='Q' then str2:='20';
 if lett='N' then str2:='50'; if lett='H' then str2:='200'; if lett='P' then str2:='500';
 if lett='U' then str2:='5000'; if lett='X' then str2:='10000';

 for  p:=0 to StrToInt(str3) do
 if p=0 then str_re:=str1 else str_re:=str_re+','+ IntToStr(strtoint(str1)+strtoint(str2)*p);

 str_re:=str_re+' ';

 end;

 if (t=0) and (j=0) then i:=i+1
 else i:=i+t+1;
 if (t=0) and (j=0) then str_re:=Copy(str,i-1,1);
str_temp:=str_temp+str_re;
end;


str:=' '+str_temp+' ';




 //Ищем спецификаторы типа n#m#k 5D40 ... для атомов

 i:=1;
 str_temp:='';

 while i<Length(str) do begin
 t:=0;
 j:=0;
 if Copy(str,i,1)='#' then begin
 for j:=1 to 10 do
 if (Copy(str,i-j,1)=' ') or (Copy(str,i-j,1)=',') or (Copy(str,i-j,1)=';') or (Copy(str,i-j,1)='-') then Break;
 for t:=1 to 20 do
 if (Copy(str,i+t,1)=' ') or (Copy(str,i+t,1)=',') or (Copy(str,i+t,1)=';') or (Copy(str,i+t,1)='-') then Break;
 str_temp:=copy(str_temp,1,length(str_temp)-j+1);
 str1:=Copy(str,i-j+1,t+j-1);      // Вся спецификация
 str2:=Copy(str1,1,Pos('#',str1)-1);   //До первой #
 str3:=copy(str1,Pos(str2+'#',str1)+Length(str2+'#'),20);
 str4:=Copy(str3,1,Pos('#',str3)-1);  //Между решетками
 str5:=Copy(str3,Pos(str4+'#',str3)+Length(str4+'#'),20); //Последняя цифра
 str1:=str2;
 str2:=str4;
 str3:=str5;
 str_re:='';
 for  p:=0 to StrToInt(str3) do
 if p=0 then str_re:=str1 else str_re:=str_re+','+ IntToStr(strtoint(str1)+strtoint(str2)*p);

 str_re:=str_re+' ';

 end;

 if (t=0) and (j=0) then i:=i+1
 else i:=i+t+1;
 if (t=0) and (j=0) then str_re:=Copy(str,i-1,1);
str_temp:=str_temp+str_re;
end;


 str:=' '+str_temp+' ';



 //Читаем строку атомов
 //================================================================================================
 t:=0;
 x:=0;
 21:
 for p:=1 to Length(str) do begin
   if (Copy(str,p+x,1)=' ') or (Copy(str,p+x,1)=',') or (Copy(str,p+x,1)=';') or (Copy(str,p+x,1)='-') then
   cn1:=cn1+1
   else Break;
 end;
 if (pos('-',Copy(str,p+x-cn1,cn1))<>0) and (cn1<>0) then begin
 SetLength(at_in_gr,t+1);
 at_in_gr[t]:=-1;
 t:=t+1;
 end;
 x:=x+cn1;
 cn2:=0;
 for p:=1 to Length(str) do begin
   if (Copy(str,p+x,1)<>' ') and (Copy(str,p+x,1)<>',') and (Copy(str,p+x,1)<>';') and (Copy(str,p+x,1)<>'-') then
   cn2:=cn2+1
   else Break;
   if p+x=length(str) then break;
 end;
  SetLength(at_in_gr,t+1);
  if (Pos('-',Copy(str,x+1,cn2))=0) and (Copy(str,x+1,cn2)<>'') then at_in_gr[t]:=StrToInt(Copy(str,x+1,cn2))
  else if Copy(str,x+1,cn2)<>'' then at_in_gr[t]:=-1;
  x:=x+cn2;
  t:=t+1;
  cn1:=0;
  if x<Length(str) then goto 21;
 //================================================================================================
  if at_in_gr[Length(at_in_gr)-1]=0 then SetLength(at_in_gr,Length(at_in_gr)-1);

 //Получили совокупность групп и атомов для отображения

  if (Length(group)=1) and (group[0]=-1) then group:=nil;
  if (Length(at_in_gr)=1) and ((at_in_gr[0]=-1)) then at_in_gr:=nil;
  if (Length(group)=0) and (Length(at_in_gr)=0) then goto 10;    // Если не задано не одной группы и ни одного атома читается весь файл

  // Теперь тире заменяем на реальные значения из диапазоне
  // Группы:


  i:=0;
  k:=0;
  while i<length(group) do begin


  if i>1 then goto 25;
  if length(group)>1 then begin
   if (group[0]=-1) and (group[1]<>-1) then begin
    SetLength(group_r,group[1]);
    for j:=0 to group[1]-1 do
    group_r[j]:=j+1;
    i:=i+2;
    k :=length(group_r)-1;
    end;
  end;

  if i>=length(group) then Break;

  25:
  if length(group)-i>=3 then begin
   if (group[i]<>-1) and (group[i+1]=-1) and (group[i+2]<>-1) then begin
    if length(group_r)=0 then t:=0 else t:=1;
    SetLength(group_r, length(group_r)+abs(group[i+2]-group[i])+1);
    for j:=0 to abs(group[i+2]-group[i]) do begin
     if group[i+2]>group[i] then group_r[k+j+t]:=group[i]+j;
     if group[i+2]<group[i] then group_r[k+j+t]:=group[i]-j;
     if group[i+2]=group[i] then group_r[k+j+t]:=group[i];
    end;
    i:=i+3;
    k:=length(group_r)-1;
   end;
  end;

   if i>=length(group) then Break;

  if length(group)-i>=2 then begin
   if (group[i]=-1) and (group[i+1]=-1) then begin
    ShowMessage('Проверьте введенные данные, возможна ошибка!');
    goto 0;
   end;
   if (group[i]<>-1) and (group[i+1]<>-1) then begin
    SetLength(group_r,length(group_r)+2);
    group_r[length(group_r)-2]:=group[i];
    group_r[length(group_r)-1]:=group[i+1];
    i:=i+2;
    k:=length(group_r)-1;
   end;
  end;

  if i>=length(group) then Break;

  if i=length(group)-2 then begin
   if (group[length(group)-1]=-1) and (group[length(group)-2]<>-1) then begin
   if length(group_r)=0 then t:=0 else t:=1;
   if length(group_r)+c_gr-group[length(group)-2]+1<=0 then begin
   ShowMessage('Проверьте число групп в поле. Максимальное число групп не должно превышать ' + IntToStr(c_gr));
   goto 0;
   end;
    SetLength(group_r,length(group_r)+c_gr-group[length(group)-2]+1);
    for j:=0 to c_gr-group[length(group)-2] do
    group_r[k+j+t]:=group[length(group)-2]+j;
    i:=i+2;
    k:=length(group_r)-1;
   end;
  end;

  if i>=length(group) then Break;

  if (length(group)=1) and (group[0]<>-1) then begin
   SetLength(group_r,1);
   group_r[0]:=group[0];
   i:=i+1;
  end;

  if i>=length(group) then Break;

  if (length(group)-i=1) and (group[length(group)-1]<>-1) then begin
   Setlength(group_r,length(group_r)+1);
   group_r[length(group_r)-1]:=group[i];
   i:=i+1;
  end;

  if i>=length(group) then Break;

  g:=0;
  if (length(group)-i=2) and (group[length(group)-1]=-1) then begin
    if length(group_r)+c_gr-group[length(group)-2]+1<=0 then begin
   ShowMessage('Проверьте число групп в поле. Максимальное число групп не должно превышать ' + IntToStr(c_gr));
   goto 0;
   end;
 26:  SetLength(group_r,length(group_r)+c_gr-group[length(group)-2]+1);
   for j:=0 to c_gr-group[length(group)-2] do
   group_r[k+j+1-g]:=group[i-1]+j+1-g;
   k:=length(group_r)-1;
   i:=i+1;
  end;

  if i>=length(group) then Break;

  if i>1 then begin
  if Length(group)-i>=2 then begin
  if (group[i]=-1) and (group[i+1]<>-1) then begin
  i:=i-1;
  SetLength(group_r,Length(group_r)-1);
  k:=Length(group_r)-1;
  goto 25;
  end;
  end;

  if Length(group)-i=1 then begin
    if group[i]=-1 then begin
     SetLength(group_r,Length(group_r)-1);
     g:=1;
    //  k:=Length(group_r)-1;
      goto 26;
    end;
  end;
  end;
end;



 //Атомы:

  i:=0;
  k:=0;
  while i<length(at_in_gr) do begin


  if i>1 then goto 35;
  if length(at_in_gr)>1 then begin
   if (at_in_gr[0]=-1) and (at_in_gr[1]<>-1) then begin
    SetLength(at_in_gr_r,at_in_gr[1]);
    for j:=0 to at_in_gr[1]-1 do
    at_in_gr_r[j]:=j+1;
    i:=i+2;
    k :=length(at_in_gr_r)-1;
    end;
  end;

  if i>=length(at_in_gr) then Break;

  35:
  if length(at_in_gr)-i>=3 then begin
   if (at_in_gr[i]<>-1) and (at_in_gr[i+1]=-1) and (at_in_gr[i+2]<>-1) then begin
    if length(at_in_gr_r)=0 then t:=0 else t:=1;
    SetLength(at_in_gr_r, length(at_in_gr_r)+abs(at_in_gr[i+2]-at_in_gr[i])+1);
    for j:=0 to abs(at_in_gr[i+2]-at_in_gr[i]) do begin
     if at_in_gr[i+2]>at_in_gr[i] then at_in_gr_r[k+j+t]:=at_in_gr[i]+j;
     if at_in_gr[i+2]<at_in_gr[i] then at_in_gr_r[k+j+t]:=at_in_gr[i]-j;
     if at_in_gr[i+2]=at_in_gr[i] then at_in_gr_r[k+j+t]:=at_in_gr[i];
    end;
    i:=i+3;
    k:=length(at_in_gr_r)-1;
   end;
  end;

   if i>=length(at_in_gr) then Break;

  if length(at_in_gr)-i>=2 then begin
   if (at_in_gr[i]=-1) and (at_in_gr[i+1]=-1) then begin
    ShowMessage('Проверьте введенные данные, возможна ошибка!');
    goto 0;
   end;
   if (at_in_gr[i]<>-1) and (at_in_gr[i+1]<>-1) then begin
    SetLength(at_in_gr_r,length(at_in_gr_r)+2);
    at_in_gr_r[length(at_in_gr_r)-2]:=at_in_gr[i];
    at_in_gr_r[length(at_in_gr_r)-1]:=at_in_gr[i+1];
    i:=i+2;
    k:=length(at_in_gr_r)-1;
   end;
  end;

  if i>=length(at_in_gr) then Break;

  if i=length(at_in_gr)-2 then begin
   if (at_in_gr[length(at_in_gr)-1]=-1) and (at_in_gr[length(at_in_gr)-2]<>-1) then begin
   if length(at_in_gr_r)=0 then t:=0 else t:=1;
   if length(at_in_gr_r)+c_at-at_in_gr[length(at_in_gr)-2]+1<=0 then begin
   ShowMessage('Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(c_at));
   goto 0;
   end;
    SetLength(at_in_gr_r,length(at_in_gr_r)+c_at-at_in_gr[length(at_in_gr)-2]+1);
    for j:=0 to c_at-at_in_gr[length(at_in_gr)-2] do
    at_in_gr_r[k+j+t]:=at_in_gr[length(at_in_gr)-2]+j;
    i:=i+2;
    k:=length(at_in_gr_r)-1;
   end;
  end;

  if i>=length(at_in_gr) then Break;

  if (length(at_in_gr)=1) and (at_in_gr[0]<>-1) then begin
   SetLength(at_in_gr_r,1);
   at_in_gr_r[0]:=at_in_gr[0];
   i:=i+1;
  end;

  if i>=length(at_in_gr) then Break;

  if (length(at_in_gr)-i=1) and (at_in_gr[length(at_in_gr)-1]<>-1) then begin
   Setlength(at_in_gr_r,length(at_in_gr_r)+1);
   at_in_gr_r[length(at_in_gr_r)-1]:=at_in_gr[i];
   i:=i+1;
  end;

  if i>=length(at_in_gr) then Break;

  g:=0;
  if (length(at_in_gr)-i=2) and (at_in_gr[length(at_in_gr)-1]=-1) then begin
    if length(at_in_gr_r)+c_at-at_in_gr[length(at_in_gr)-2]+1<=0 then begin
   ShowMessage('Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(c_at));
   goto 0;
   end;
   36:  SetLength(at_in_gr_r,length(at_in_gr_r)+c_at-at_in_gr[length(at_in_gr)-2]+1);
   for j:=0 to c_at-at_in_gr[length(at_in_gr)-2] do
   at_in_gr_r[k+j+1-g]:=at_in_gr[i-1]+j+1-g;
   k:=length(at_in_gr_r)-1;
   i:=i+1;
  end;

  if i>=length(at_in_gr) then Break;

  if i>1 then begin
  if Length(at_in_gr)-i>=2 then begin
  if (at_in_gr[i]=-1) and (at_in_gr[i+1]<>-1) then begin
  i:=i-1;
  SetLength(at_in_gr_r,Length(at_in_gr_r)-1);
  k:=Length(at_in_gr_r)-1;
  goto 35;
  end;
  end;

  if Length(at_in_gr)-i=1 then begin
    if at_in_gr[i]=-1 then begin
     SetLength(at_in_gr_r,Length(at_in_gr_r)-1);
     g:=1;
    //  k:=Length(at_in_gr_r)-1;
      goto 36;
    end;
  end;
  end;
end;



  //Теперь надо отсортировать массив значений по возрастанию для групп и атомов, заменить диапазоны на все номера атомов и групп
 if Length(group_r)>1 then begin                       //  ########################################
 for i:=0 to Length(group_r)-1 do                      //  ########################################
 for j:=0 to Length(group_r)-2 do                      //  ########################################                                              //  ########################################
 if  group_r[j]>group_r[j+1] then begin                //  ######
  x := group_r[j+1];                                   //  ######   Sorting of array  group_r
  group_r[j+1] := group_r[j];                          //  ######
  group_r[j]:=x;                                       //  ########################################
 end;                                                  //  ########################################
 end;                                                  //  ########################################


 if Length(at_in_gr_r)>1 then begin                    //  ########################################
 for i:=0 to Length(at_in_gr_r)-1 do                   //  ########################################
 for j:=0 to Length(at_in_gr_r)-2 do                   //  ########################################                                              //  ########################################
 if  at_in_gr_r[j]>at_in_gr_r[j+1] then begin          //  ######
  x := at_in_gr_r[j+1];                                //  ######   Sorting of array  at_in_gr_r
  at_in_gr_r[j+1] := at_in_gr_r[j];                    //  ######
  at_in_gr_r[j]:=x;                                    //  ########################################
 end;                                                  //  ########################################
 end;                                                  //  ########################################

 //Отсортировали, теперь надо исключить повторения элементов
 //Группы

 s:=0;
 SetLength(tmp_r,Length(group_r));
 SetLength(group_r,Length(group_r)+1);
 group_r[Length(group_r)-1]:=-1;
 if Length(group_r)>1 then begin
  for i:=0 to Length(group_r)-2 do
  if group_r[i+1]<>group_r[i] then  begin
    s:=s+1;
  tmp_r[i]:=group_r[i];
  end;
 end;


 SetLength(group_r,s);
 j:=0;
 for i:=0 to Length(tmp_r)-1 do begin
 if tmp_r[i]<>0 then begin  group_r[j]:=tmp_r[i];
 j:=j+1;
 end;
 end;



 //Атомы

 s:=0;
 tmp_r:=nil;
 SetLength(tmp_r,Length(at_in_gr_r));
 SetLength(at_in_gr_r,Length(at_in_gr_r)+1);
 at_in_gr_r[Length(at_in_gr_r)-1]:=-1;
 if Length(at_in_gr_r)>1 then begin
  for i:=0 to Length(at_in_gr_r)-2 do
  if at_in_gr_r[i+1]<>at_in_gr_r[i] then  begin
    s:=s+1;
  tmp_r[i]:=at_in_gr_r[i];
  end;
 end;



 SetLength(at_in_gr_r,s);
 j:=0;
 for i:=0 to Length(tmp_r)-1 do begin
 if tmp_r[i]<>0 then begin  at_in_gr_r[j]:=tmp_r[i];
 j:=j+1;
 end;
 end;


  //ЧТЕНИЕ
  //ЧТЕНИЕ
  //ЧТЕНИЕ




 if at_in_gr_r<>nil then begin
 if at_in_gr_r[Length(at_in_gr_r)-1]>c_at then begin
   ShowMessage('Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(c_at)+' атомов');
   goto 0;
 end;
 end;


  if group_r<>nil then begin
 if group_r[Length(group_r)-1]>c_gr then begin
   ShowMessage('Затребованное число групп превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(c_gr)+' групп');
   goto 0;
 end;
 end;

Nat:=1;
k:=0;
i:=1;
j:=1;
l:=0;
t:=0;
SetLength(stroka,2);
while not EoF(f) do begin
//k:=k+1;
//setlength(stroka,k+1);
ReadLn(f,stroka[k]);





with pb do begin
Application.ProcessMessages;
Form1.Statusbar1.Panels[0].Text:='Reading XYZ';
Parent:= Form1.Statusbar1;
pb.ForeColor:=RGB(0,220,50);
pb.BackColor:=clBtnFace;
 pb.Progress:=Round(i/c_gr*100);     //List.Count - число строк в текстовом файле
 pb.ShowText:=False;
   pb.BorderStyle:=bsNone;
   pb.Top:= 4;
   pb.Left := Form1.StatusBar1.Panels[0].Width+1;
   Height:= Form1.StatusBar1.Height - Top-3;
   Width:= Form1.StatusBar1.Panels[1].Width-4;
   pb.Visible:=True;
end;




if k>0 then begin
if (iscoord(stroka[k])[0]='') and (iscoord(stroka[k-1])[0]<>'') then begin     //Текущая строка - не координаты, а прошлая была координаты
i:=i+1;                                                                        //увеличили счетчик групп на 1
j:=1;
t:=0;                                                                          //сбросили номер атома, т.к. перешли в другую группу
end;
if (iscoord(stroka[k])[0]<>'') and (iscoord(stroka[k-1])[0]<>'') then begin    //Если текущая строка атом и предыдущая тоже, то номер атома увеличиваем на 1
j:=j+1;
if  group_r<>nil then  if i=group_r[l-1] then l:=l-1;
if Nat<j+1 then Nat:=j+1;
end;

if iscoord(stroka[k])[0]<>'' then begin
if (Length(group_r)>0) and (Length(at_in_gr)>0) then begin                   //Если в Edit,8 что-то есть, то начинаем читать оттуда
if i=group_r[l] then begin
if j=at_in_gr_r[t] then begin
setlength(atomoutel,length(group_r)+1,length(at_in_gr_r)+2);
setlength(xout,length(group_r)+1,length(at_in_gr_r)+2);
setlength(yout,length(group_r)+1,length(at_in_gr_r)+2);
setlength(zout,length(group_r)+1,length(at_in_gr_r)+2);
atomoutel[l+1,t+1]:=iscoord(stroka[k])[0];
xout[l+1,t+1]:=iscoord(stroka[k])[1];
yout[l+1,t+1]:=iscoord(stroka[k])[2];
zout[l+1,t+1]:=iscoord(stroka[k])[3];
if t<Length(at_in_gr_r)-1 then t:=t+1;
if j>at_in_gr_r[length(at_in_gr_r)-1] then Break;
//if j>length(at_in_gr_r) then Break;
end;
if l<=Length(group_r)-1 then l:=l+1;
end;
end;

if (Length(group_r)>0) and (Length(at_in_gr_r)=0) then begin                   //Если в Edit что-то есть, то начинаем читать оттуда
if i=group_r[l] then begin                                           //Все атомы
setlength(atomoutel,length(group_r)+1,Nat+1);
setlength(xout,length(group_r)+1,Nat+1);
setlength(yout,length(group_r)+1,Nat+1);
setlength(zout,length(group_r)+1,Nat+1);
atomoutel[l+1,j]:=iscoord(stroka[k])[0];
xout[l+1,j]:=iscoord(stroka[k])[1];
yout[l+1,j]:=iscoord(stroka[k])[2];
zout[l+1,j]:=iscoord(stroka[k])[3];
if t<Length(at_in_gr_r)-1 then t:=t+1;
if l<=Length(group_r)-1 then l:=l+1;
end;
end;


if (Length(group_r)=0) and (Length(at_in_gr_r)>0) then begin                   //Если в Edit что-то есть, то начинаем читать оттуда
if j=at_in_gr_r[t] then begin                                          //Все атомы
setlength(atomoutel,i+1,length(at_in_gr_r)+2);
setlength(xout,i+1,length(at_in_gr_r)+2);
setlength(yout,i+1,length(at_in_gr_r)+2);
setlength(zout,i+1,length(at_in_gr_r)+2);
atomoutel[i,t+1]:=iscoord(stroka[k])[0];
xout[i,t+1]:=iscoord(stroka[k])[1];
yout[i,t+1]:=iscoord(stroka[k])[2];
zout[i,t+1]:=iscoord(stroka[k])[3];
if t<Length(at_in_gr_r)-1 then t:=t+1;
end;
end;


















end
else begin
if i>=1 then begin           //Если ничего нет, то с самого начала (i=1)
if iscoord(stroka[k])[0]<>'' then begin
setlength(atomoutel,i,Nat+1);
setlength(xout,i,Nat+1);
setlength(yout,i,Nat+1);
setlength(zout,i,Nat+1);
atomoutel[i-1,j]:=iscoord(stroka[k])[0];
xout[i-1,j]:=iscoord(stroka[k])[1];
yout[i-1,j]:=iscoord(stroka[k])[2];
zout[i-1,j]:=iscoord(stroka[k])[3];
end;
end;
end;

end;

k:=k+1;
if k=2 then begin k:=0;
stroka[0]:=stroka[1];
stroka[1]:='';
k:=k+1;
end;



{


if  (Edit6.Text<>'') and (CheckBox1.Checked) and (Edit5.Text<>'') then begin          //Если читать количество групп
if i>=strtoint(Edit5.Text)+strtoint(Edit6.Text)+2 then goto 0;
end;

if  (Edit6.Text<>'') and (CheckBox1.Checked) and (Edit5.Text='') then begin          //Если читать количество групп
if i>=1+strtoint(Edit6.Text)+2 then goto 0;
end;



if  (Edit6.Text<>'') and (CheckBox1.Checked=False) then begin    //Если читать до группы с номером
if i>strtoint(Edit6.Text)+1 then goto 0;
end;


//nomer_cycla=strtoint(Edit5.Text)-1 then  goto 0;


if  Edit6.Text='' then  nomer_cycla:=i-strtoint(Edit5.Text)-1;
if (Edit6.Text<>'') and (CheckBox1.Checked) then nomer_cycla:=StrToInt(Edit6.Text);
if (Edit6.Text<>'') and (CheckBox1.Checked=False) then nomer_cycla:=StrToInt(Edit6.Text)-strtoint(Edit5.Text)+1;

}
if group_r<>nil then
if i>group_r[length(group_r)-1] then Break;

end;


if Length(at_in_gr_r)>0 then nomer_atoma:=Length(at_in_gr_r)
else nomer_atoma:=Nat-1;

if Length(group_r)>0 then nomer_cycla:=Length(group_r)
else nomer_cycla:=i-1;













end;
end;
end;
//end;







0:

 if length(xout)>=1 then begin
 for i:=1 to length(xout)-1 do
 ComboBox1.Items.Add(inttostr(i));
 Combobox1.ItemIndex:=0;
 end;

Form40.Gauge1.Progress:=100;
pb.Progress:=100;
SetLength(stroka,0);

pb.Free;
CloseFile(f);
anal:=False;
Form1.Statusbar1.Panels[0].Text:='Ready';


if atomoutel<>nil then begin
  if atomoutel[0]<>nil then begin
setlength(new_atomoutel,length(atomoutel),length(atomoutel[0]));
for i:=0 to length(atomoutel)-1 do
for j:=0 to length(atomoutel[0])-1 do
new_atomoutel[i,j]:=atomoutel[i,j];
end;
end;

if (xout<>nil) and (yout<>nil) and (zout<>nil) then begin
if nomer_cycla=0 then nomer_cycla:=1;
end;




//Form39.Close;
end;

procedure TForm39.CheckBox1Click(Sender: TObject);
begin
if  CheckBox1.checked=true then Label6.Caption:='Сколько групп следует читать'
else Label6.Caption:='До группы с каким номером читать';
end;

procedure TForm39.FormCreate(Sender: TObject);
begin
if  CheckBox1.checked=true then Label6.Caption:='Сколько групп следует читать'
else Label6.Caption:='До группы с каким номером читать';
end;

procedure TForm39.Edit5KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm39.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm39.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FileExists(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr') then
DeleteFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'WRK.pdr');
end;

procedure TForm39.BitBtn2Click(Sender: TObject);
var i: Integer;
probel: string;
begin
Form40.Gauge1.ForeColor:=RGB(0,0,255);
Form40.Memo1.Clear;
//Combobox1.Clear;
 Form40.Show;
 anal:=True;
 BitBtn1.Click;
 if (c_at>=1) and (c_gr=0) then c_gr:=1;
 probel:='                  ';
 if Form40.Gauge1.Progress=100 then begin
   Form40.Memo1.Lines.Add('Число групп: '+inttostr(c_gr));
   Form40.Memo1.Lines.Add('Число атомов: '+inttostr(c_at));
   Form40.Memo1.Lines.Add('');
   Form40.Memo1.Lines.Add('Атомы:');
   Form40.Memo1.Font.Name:='Courier New';
   for i:=0 to Length(centr1)-1 do
   Form40.Memo1.Lines.Add(Copy(probel,1,6-length(IntToStr(i+1))) + IntToStr(i+1)  +'   ' + centr1[i]);
   Form40.Memo1.Lines.Add('');
   Form40.Memo1.Lines.Add('Число строк в файле: '+inttostr(sstrings));
   Form40.Memo1.Lines.Add('Размер файла: '+inttostr(szf));
   Form40.Label1.Caption:='Прочитано групп: ' +inttostr(c_gr);
 end;

 //for i:=1 to c_gr do
 //ComboBox1.Items.Add(inttostr(i));

end;

procedure TForm39.BitBtn4Click(Sender: TObject);
begin
Form18.Show;
end;

procedure TForm39.BitBtn3Click(Sender: TObject);
var f: TextFile;
a,probel: widestring;
i,j,k,p,razryd: integer;
arr_reo: array of integer;
rr,aaa,dddd: array of string;
reo1,reo2,reo3,reo4,reo5,reo_tmp: integer;
parameterx,parametery,parameterz,parameter,parameter12,parameter23,parameter13: real;
parameter1,parameter2,parameter3,parameter4,parameter5,parameter6,parameterx23,parametery23,parameterz23: real;
parameterx43,parametery43,parameterz43,parameterx45,parametery45,parameterz45,parH,parR,BD,DetX: real;
par_t1,par_t2,par_t3,par_t4,par_t5: real;
radius_sys: array of real;
povtor,ABC,BCD,reo_check: boolean;
label 0,10,60;
begin
probel:='                                        ';
razryd:=8;
povtor:=false;
if Combobox1.ItemIndex=-1 then begin
showmessage('Не прочитано ни одной геометрии!');
goto 0;
end;


if Combobox1.Items.Count>=1 then begin

if SaveDialog1.Execute=true then begin
if  pos('.gjf',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.gjf';
p:=strtoint(Combobox1.Text);
AssignFile(f,a);
Rewrite(f);
WriteLn(f,' %chk=task.chk');
WriteLn(f,' # HF/3-21G SP');
WriteLn(f,'');
WriteLn(f,' Title');
WriteLn(f,'');
WriteLn(f,'0 1 ! *** Attention!!! ***: Check Charge and Multiplicity and change if need!');

if CheckBox2.Checked=True then begin    // СОХРАНЯЕМ В ДЕКАРТОВЫ КООРДИНАТЫ
for k:=1 to nomer_atoma do
WriteLn(f,atomoutel[p,k] + copy(probel,1,16-length((FloatToStrF(StrToFloat(xout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(xout[p,k]),ffFixed,10,razryd)   +    copy(probel,1,16-length((FloatToStrF(StrToFloat(yout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(yout[p,k]),ffFixed,10,razryd)  +    copy(probel,1,16-length((FloatToStrF(StrToFloat(zout[p,k]),ffFixed,10,razryd )))) +  FloatToStrF(StrToFloat(zout[p,k]),ffFixed,10,razryd));
end
else begin                              // СОХРАНЯЕМ В Z-МАТРИЦУ
if (xout<>nil) and (yout<>nil) and (zout<>nil) then begin
SetLength(rr,nomer_atoma-1);
SetLength(aaa,nomer_atoma-2);
SetLength(dddd,nomer_atoma-3);




for i:=1 to nomer_atoma do begin
if i=1 then WriteLn(f,atomoutel[p,i]+inttostr(i));
if i=2 then begin
if xout[p,i]='' then goto 10;
WriteLn(f,atomoutel[p,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel[p,i]+inttostr(i)))+ atomoutel[p,i-1] +inttostr(i-1)+ Copy(probel,1,8-length(atomoutel[p,i-1]+inttostr(i-1))) +  'r'+inttostr(i-1));
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,i-1]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,i-1]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,i-1]));
parameter:=sqrt(parameterx+parametery+parameterz);
rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(parameter,ffFixed,10,6);
end;
if i=3 then begin
if xout[p,i]='' then goto 10;


parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,i-1]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,i-1]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,i-1]));
par_t1:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,i-2]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,i-2]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,i-2]));
par_t2:=sqrt(parameterx+parametery+parameterz);


SetLength(radius_sys,nomer_atoma+1);
//Сравнивать расстояния надо с учетом радиусов элементов
for j:=1 to nomer_atoma do
for k:=1 to length(radius)-2 do
if atomoutel[p,j]=center[k] then begin
if radius[k]<>'' then  radius_sys[j]:=strtofloat(radius[k]);
Break;
end;




if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then WriteLn(f,atomoutel[p,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel[p,i]+inttostr(i)))+ atomoutel[p,i-1]+inttostr(i-1) + Copy(probel,1,8-length(atomoutel[p,i-1]+inttostr(i-1))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i))) + atomoutel[p,i-2] +inttostr(i-2)+  Copy(probel,1,8-length(atomoutel[p,i-2]+inttostr(i-2))) + 'a'+inttostr(i-2))
else  WriteLn(f,atomoutel[p,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel[p,i]+inttostr(i)))+ atomoutel[p,i-2]+inttostr(i-2) + Copy(probel,1,8-length(atomoutel[p,i-2]+inttostr(i-2))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i))) + atomoutel[p,i-1] +inttostr(i-1)+  Copy(probel,1,8-length(atomoutel[p,i-1]+inttostr(i-1))) + 'a'+inttostr(i-2));

if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(par_t1,fffixed,10,6)
else  rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(par_t2,fffixed,10,6);


if (par_t1-(radius_sys[i]+radius_sys[i-1])) <= (par_t2-(radius_sys[i]+radius_sys[i-2])) then begin
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,i-1]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,i-1]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,i-1]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[p,i-1])  -    strtofloat(xout[p,i-2]));
parametery:= sqr(  strtofloat(yout[p,i-1])  -    strtofloat(yout[p,i-2]));
parameterz:= sqr(  strtofloat(zout[p,i-1])  -    strtofloat(zout[p,i-2]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,i-2]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,i-2]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,i-2]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);
end
else begin
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,i-2]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,i-2]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,i-2]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[p,i-2])  -    strtofloat(xout[p,i-1]));
parametery:= sqr(  strtofloat(yout[p,i-2])  -    strtofloat(yout[p,i-1]));
parameterz:= sqr(  strtofloat(zout[p,i-2])  -    strtofloat(zout[p,i-1]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,i-1]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,i-1]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,i-1]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);
end;
end;




if i>=4 then begin
if xout[p,i]='' then Break;

////Ищем ближайший атом
par_t2:=100000000;
for j:=1 to i-1 do  begin
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,i-j]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,i-j]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,i-j]));
parameter:=sqrt(parameterx+parametery+parameterz);
if parameter-(radius_sys[i]+radius_sys[i-j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[i]+radius_sys[i-j]);                 // наикратчайшее расстояние между атомами
par_t1:=parameter;
reo1:=i-j;                           // номер того атома (i-j), который точно связан с атомом i
end;
end;

//Теперь ищем ближайший атом к ближайшему, т.е. атом для i-j-ного атома
par_t2:=10000000000;
for j:=1 to i-1 do begin
if j<>reo1 then begin
parameterx:= sqr(  strtofloat(xout[p,reo1])  -    strtofloat(xout[p,j]));
parametery:= sqr(  strtofloat(yout[p,reo1])  -    strtofloat(yout[p,j]));
parameterz:= sqr(  strtofloat(zout[p,reo1])  -    strtofloat(zout[p,j]));
parameter:=sqrt(parameterx+parametery+parameterz);
//if parameter=0 then parameter:=10000000000;       //условие что если атом с сам-собой коннектится, то обрезать ему возможность быть кратчайшим
if parameter-(radius_sys[reo1]+radius_sys[j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[reo1]+radius_sys[j]);                 // наикратчайшее расстояние между атомами
par_t3:=parameter;
reo2:=j;                           // номер того атома, который точно связан с атомом # reo1
end;
end;
end;


//Находим аналогично 4-ый атом в цепочке - reo3:
par_t2:=10000000000;
for j:=1 to i-1 do begin
if (j<>reo1) and (j<>reo2) then begin
parameterx:= sqr(  strtofloat(xout[p,reo2])  -    strtofloat(xout[p,j]));
parametery:= sqr(  strtofloat(yout[p,reo2])  -    strtofloat(yout[p,j]));
parameterz:= sqr(  strtofloat(zout[p,reo2])  -    strtofloat(zout[p,j]));
parameter:=sqrt(parameterx+parametery+parameterz);
if parameter-(radius_sys[reo2]+radius_sys[j]) <= par_t2 then begin
par_t2:=parameter-(radius_sys[reo2]+radius_sys[j]);                 // наикратчайшее расстояние между атомами
par_t4:=parameter;
reo3:=j;                           // номер того атома, который точно связан с атомом # reo2
end;
end;
end;


/// i-reo1-reo2-reo3 - истинный порядок связывания атомов - правильный
/// Если такой алгоритм потребует много времени, то можно сделать отсечения
// как только  parameter-(radius_sys[reo2]+radius_sys[j]) меньше, например 0.2 то Break;
// или еще более правильно, если  parameter<=(radius_sys[reo2]+radius_sys[j])*0.1 then Break;
// это полезно для молекул из нескольких сотен атомов

// необходимо сразу же проверять ориентацию плоскостей для двугранного угла
// если DetX=0 то придется выбирать иные группы атомов



60: DetX:=(strtofloat(xout[p,reo2])-strtofloat(xout[p,i])) * (strtofloat(yout[p,reo3])-strtofloat(yout[p,i])) * (strtofloat(zout[p,reo1])-strtofloat(zout[p,i]))  +
         (strtofloat(xout[p,reo3])-strtofloat(xout[p,i])) * (strtofloat(yout[p,reo1])-strtofloat(yout[p,i])) * (strtofloat(zout[p,reo2])-strtofloat(zout[p,i]))  +
         (strtofloat(xout[p,reo1])-strtofloat(xout[p,i])) * (strtofloat(yout[p,reo2])-strtofloat(yout[p,i])) * (strtofloat(zout[p,reo3])-strtofloat(zout[p,i]))  -
         (strtofloat(xout[p,reo1])-strtofloat(xout[p,i])) * (strtofloat(yout[p,reo3])-strtofloat(yout[p,i])) * (strtofloat(zout[p,reo2])-strtofloat(zout[p,i]))  -
         (strtofloat(xout[p,reo3])-strtofloat(xout[p,i])) * (strtofloat(yout[p,reo2])-strtofloat(yout[p,i])) * (strtofloat(zout[p,reo1])-strtofloat(zout[p,i]))  -
         (strtofloat(xout[p,reo2])-strtofloat(xout[p,i])) * (strtofloat(yout[p,reo1])-strtofloat(yout[p,i])) * (strtofloat(zout[p,reo3])-strtofloat(zout[p,i]));



// Если вдруг оказалось что DetX=0 - проверяем точки ABCD на условие принадлежности одной прямой
ABC:=false;
BCD:=false;

if DetX=0 then  begin
//Проверяем точки ABC
if (strtofloat(xout[p,reo2])-strtofloat(xout[p,i])<>0) and  (strtofloat(yout[p,reo2])-strtofloat(yout[p,i])<>0)  and  (strtofloat(zout[p,reo2])-strtofloat(zout[p,i])<>0) then begin
if ((strtofloat(xout[p,reo1])-strtofloat(xout[p,i]))/(strtofloat(xout[p,reo2])-strtofloat(xout[p,i]))=(strtofloat(yout[p,reo1])-strtofloat(yout[p,i]))/(strtofloat(yout[p,reo2])-strtofloat(yout[p,i]))) and ((strtofloat(xout[p,reo1])-strtofloat(xout[p,i]))/(strtofloat(xout[p,reo2])-strtofloat(xout[p,i]))=(strtofloat(zout[p,reo1])-strtofloat(zout[p,i]))/(strtofloat(zout[p,reo2])-strtofloat(zout[p,i]))) then
//ABC лежат на одной прямой
ABC:=true;
end;
if (strtofloat(xout[p,reo2])-strtofloat(xout[p,i])=0) or  (strtofloat(yout[p,reo2])-strtofloat(yout[p,i])=0)  or  (strtofloat(zout[p,reo2])-strtofloat(zout[p,i])=0) then begin
if (strtofloat(xout[p,reo1])-strtofloat(xout[p,i])=strtofloat(xout[p,reo2])-strtofloat(xout[p,i])) and  (strtofloat(yout[p,reo1])-strtofloat(yout[p,i])=strtofloat(yout[p,reo2])-strtofloat(yout[p,i])) and  (strtofloat(zout[p,reo1])-strtofloat(zout[p,i])=strtofloat(zout[p,reo2])-strtofloat(zout[p,i]))  then
//ABC лежат на одной прямой
ABC:=true;
end;
//Проверяем точки BCD
if (strtofloat(xout[p,reo3])-strtofloat(xout[p,reo1])<>0) and  (strtofloat(yout[p,reo3])-strtofloat(yout[p,reo1])<>0)  and  (strtofloat(zout[p,reo3])-strtofloat(zout[p,reo1])<>0) then begin
if ((strtofloat(xout[p,reo2])-strtofloat(xout[p,reo1]))/(strtofloat(xout[p,reo3])-strtofloat(xout[p,reo1]))=(strtofloat(yout[p,reo2])-strtofloat(yout[p,reo1]))/(strtofloat(yout[p,reo3])-strtofloat(yout[p,reo1]))) and ((strtofloat(xout[p,reo2])-strtofloat(xout[p,reo1]))/(strtofloat(xout[p,reo3])-strtofloat(xout[p,reo1]))=(strtofloat(zout[p,reo2])-strtofloat(zout[p,reo1]))/(strtofloat(zout[p,reo3])-strtofloat(zout[p,reo1]))) then
//BCD лежат на одной прямой
BCD:=true;
end;
if (strtofloat(xout[p,reo3])-strtofloat(xout[p,reo1])=0) or  (strtofloat(yout[p,reo3])-strtofloat(yout[p,reo1])=0)  or  (strtofloat(zout[p,reo3])-strtofloat(zout[p,reo1])=0) then begin
if (strtofloat(xout[p,reo2])-strtofloat(xout[p,reo1])=strtofloat(xout[p,reo3])-strtofloat(xout[p,reo1])) and  (strtofloat(yout[p,reo2])-strtofloat(yout[p,reo1])=strtofloat(yout[p,reo3])-strtofloat(yout[p,reo1])) and  (strtofloat(zout[p,reo2])-strtofloat(zout[p,reo1])=strtofloat(zout[p,reo3])-strtofloat(zout[p,reo1]))  then
//BCD лежат на одной прямой
BCD:=true;
end;
end;


//Если оказалось что 3 точки на одной прямой, то вопреки расстоянию надо изменить порядок следования точкам
if (ABC=true) and (BCD=false) then begin
// ABCD ----> ABDC  =  reo3 <-----> reo2
reo_tmp:=reo3;
reo3:=reo2;
reo2:=reo_tmp;
goto 60;               // снова идем на перепроверку в расчет детерминанта
end;

//Если оказалось что 3 точки на одной прямой, то вопреки расстоянию надо изменить порядок следования точкам
if (ABC=false) and (BCD=true) then begin
reo_check:=false;
// ABCD ----> BACD  =  reo1 <-----> i  // так нельзя - атом i - первый
// Надо искать другой центр среди D - ABC - фиксируем
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
end;               // снова идем на перепроверку в расчет детерминанта
if reo_check=false then  begin
showmessage('Невозможно записать Z-матрицу! Три центра на одной прямой! Сохраните в декартовых координатах или дополните координаты мнимыми атомами, реконструировав Z-матрицу!');
goto 0;
end;
end;




if (ABC=true) and (BCD=true) then begin   //Четыре атома на одной прямой
//придется менять порядок атомов через поиск новых центров
//если таких найдено не будет, тогда выдать сообщение ,,Пересохраните в декартовых координатах,,
//центр номер i в любом случае остается в качестве

// поступаем как в предыдущем случае - можно попробовать свести к неопределенности 1 рода
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
end;               // снова идем на перепроверку в расчет детерминанта
if reo_check=false then  begin
showmessage('Невозможно записать Z-матрицу! Три центра на одной прямой! Сохраните в декартовых координатах или дополните координаты мнимыми атомами, реконструировав Z-матрицу!');
goto 0;
end;
end;




WriteLn(f,atomoutel[p,i]+inttostr(i)+Copy(probel,1,8-length(atomoutel[p,i]+inttostr(i)))+ atomoutel[p,reo1] +inttostr(reo1)+ Copy(probel,1,8-length(atomoutel[p,reo1]+inttostr(reo1))) +  'r'+inttostr(i-1) +    Copy(probel,1,8-length('r'+inttostr(i-1))) + atomoutel[p,reo2] +inttostr(reo2)+  Copy(probel,1,8-length(atomoutel[p,reo2]+inttostr(reo2))) + 'a'+inttostr(i-2)  +   Copy(probel,1,8-length('a'+inttostr(i-2))) + atomoutel[p,reo3]+inttostr(reo3) + Copy(probel,1,8-length(atomoutel[p,reo3]+inttostr(reo3)))  + 'd'+inttostr(i-3));
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,reo1]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,reo1]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,reo1]));
parameter:=sqrt(parameterx+parametery+parameterz);
rr[i-2]:='r'+inttostr(i-1)+' = ' +floattostrf(parameter,fffixed,10,6);

parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,reo1]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,reo1]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,reo1]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[p,reo1])  -    strtofloat(xout[p,reo2]));
parametery:= sqr(  strtofloat(yout[p,reo1])  -    strtofloat(yout[p,reo2]));
parameterz:= sqr(  strtofloat(zout[p,reo1])  -    strtofloat(zout[p,reo2]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[p,i])  -    strtofloat(xout[p,reo2]));
parametery:= sqr(  strtofloat(yout[p,i])  -    strtofloat(yout[p,reo2]));
parameterz:= sqr(  strtofloat(zout[p,i])  -    strtofloat(zout[p,reo2]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
aaa[i-3]:='a'+inttostr(i-2)+' = ' +floattostrf(parameter,fffixed,10,4);


parameterx23:= strtofloat(xout[p,i])  -    strtofloat(xout[p,reo1]);
parametery23:= strtofloat(yout[p,i])  -    strtofloat(yout[p,reo1]);
parameterz23:= strtofloat(zout[p,i])  -    strtofloat(zout[p,reo1]);

parameterx43:= strtofloat(xout[p,reo2])  -   strtofloat(xout[p,reo1]);
parametery43:= strtofloat(yout[p,reo2])  -   strtofloat(yout[p,reo1]);
parameterz43:= strtofloat(zout[p,reo2])  -   strtofloat(zout[p,reo1]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(xout[p,reo3])  -    strtofloat(xout[p,reo2]);
parametery45:= strtofloat(yout[p,reo3])  -    strtofloat(yout[p,reo2]);
parameterz45:= strtofloat(zout[p,reo3])  -    strtofloat(zout[p,reo2]);

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
//showmessage('Три атомных центра лежат на одной прямой. Двугранный угол не определен'+#13 +'Необходимо использовать мнимые атомы для избежания неопределенности!');
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


end;
end;

WriteLn(f,'');
WriteLn(f,'');

CloseFile(f);
SaveDialog1.FreeOnRelease;
end;
end;


0:
end;

end.
