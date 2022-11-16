unit Unit68;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, Math;

type
  TForm68 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    CheckListBox1: TCheckListBox;
    Edit3: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form68: TForm68;
  ver: boolean;
  in_ex: array of integer;
  full_incl: array of integer;
  evol_chrg: array of real;

implementation

uses Unit1,Unit24,Unit64,Unit36,Unit39, Unit69;

{$R *.dfm}


function OnlyLet(str: String): String;
var str1: String;
p: Integer;
begin
str1:='';
for p:=1 to length(str) do
if str[p] in ['A'..'Z','a'..'z'] then str1:=str1+str[p]; //центры могут быть типа Mg1, Br_1,...
Result:=str1;
end;





procedure TForm68.FormShow(Sender: TObject);
var spin,pot: boolean;
i: integer;
begin
spin:=false;
pot:=false;
Combobox1.Clear;
Combobox2.Clear;
CheckListBox1.Clear;
Label2.Visible:=True;
if dial=true then begin
if  Form64.Combobox2.Text='Mulliken' then begin
if mull_spin[0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='MBS Mulliken' then begin
if mbs_mull_spin[0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='Bonding Mulliken' then begin
if bond_mull_spin[0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='ESP' then begin
if esp_spin[0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='Hirshfeld' then begin
if hir_spin[0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='Lowdin' then begin
if lo_spin[0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='APT' then begin
if apt_spin[0,0]<>'' then spin:=true;
end;
if poten[0,0]<>'' then pot:=true;

// ##########################################################

Combobox1.Items.Add('Заряд');
if spin=true then Combobox1.Items.Add('Спиновая плотность');
if pot=true then Combobox1.Items.Add('Электростатический потенциал');

Combobox1.ItemIndex:=0;

if Form64.Combobox2.Text='Mulliken'  then begin
if mull<>nil then begin
for i:=0 to length(mull)-1 do
if mull[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='MBS Mulliken'  then begin
if mbs_mull<>nil then begin
for i:=0 to length(mbs_mull)-1 do
if mbs_mull[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='Bonding Mulliken'  then begin
if bond_mull<>nil then begin
for i:=0 to length(bond_mull)-1 do
if bond_mull[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='ESP'  then begin
if esp<>nil then begin
for i:=0 to length(esp)-1 do
if esp[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='Hirshfeld'  then begin
if hir<>nil then begin
for i:=0 to length(hir)-1 do
if hir[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='CM5'  then begin
if cm5<>nil then begin
for i:=0 to length(cm5)-1 do
if cm5[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='NBO'  then begin
if nbo<>nil then begin
for i:=0 to length(nbo)-1 do
if nbo[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='AIM'  then begin
if aim<>nil then begin
for i:=0 to length(aim)-1 do
if aim[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='Lowdin'  then begin
if lo<>nil then begin
for i:=0 to length(lo)-1 do
if lo[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='APT'  then begin
if apt<>nil then begin
for i:=0 to length(apt)-1 do
if apt[i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;


for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then CheckListBox1.Items.Add(inttostr(i)+'('+atomoutel[1,i]+')');







end
else begin

if  Form64.Combobox2.Text='Mulliken' then begin
if mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='MBS Mulliken' then begin
if mbs_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='Bonding Mulliken' then begin
if bond_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='ESP' then begin
if esp_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='Hirshfeld' then begin
if hir_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='Lowdin' then begin
if lo_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='APT' then begin
if apt_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if poten_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then pot:=true;

// ##########################################################

Combobox1.Items.Add('Заряд');
if spin=true then Combobox1.Items.Add('Спиновая плотность');
if pot=true then Combobox1.Items.Add('Электростатический потенциал');

Combobox1.ItemIndex:=0;


if Form64.Combobox2.Text='Mulliken'  then begin
if mull_mult<>nil then begin
if mull_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='MBS Mulliken'  then begin
if mbs_mull_mult<>nil then begin
if mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]] <>nil then begin
for i:=0 to length(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='Bonding Mulliken'  then begin
if bond_mull_mult<>nil then begin
if bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='ESP'  then begin
if esp_mult<>nil then begin
if esp_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(esp_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if esp_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='Hirshfeld'  then begin
if hir_mult<>nil then begin
if hir_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(hir_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if hir_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='CM5'  then begin
if cm5_mult<>nil then begin
if cm5_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(cm5_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if cm5_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='NBO'  then begin
if nbo_mult<>nil then begin
if nbo_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(nbo_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if nbo_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='AIM'  then begin
if aim_mult<>nil then begin
if aim_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(aim_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if aim_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='Lowdin'  then begin
if lo_mult<>nil then begin
if lo_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(lo_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if lo_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='APT'  then begin
if apt_mult<>nil then begin
if apt_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(apt_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if apt_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox2.Items.Add(inttostr(i+1));
end;
end;
end;


for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then CheckListBox1.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]+')');

end;

Combobox2.ItemIndex:=Combobox2.Items.Count-1;
if Combobox2.Items.Count<2 then BitBtn2.Enabled:=False else BitBtn2.Enabled:=True;

end;



procedure TForm68.CheckListBox1ClickCheck(Sender: TObject);
var a: string;
b,c: widestring;
i: integer;
label 0;
begin
ver:=True;
if CheckListBox1.Checked[CheckListBox1.ItemIndex]=true then  begin
//Edit1.Text:=Edit1.Text+Copy(CheckListBox1.Items.Strings[CheckListBox1.ItemIndex],1,pos('(',CheckListBox1.Items.Strings[CheckListBox1.ItemIndex])-1);
for i:=0 to length(Edit1.Text) do begin
a:=Copy(CheckListBox1.Items.Strings[CheckListBox1.ItemIndex],1,pos('(',CheckListBox1.Items.Strings[CheckListBox1.ItemIndex])-1);
if Copy(Edit1.Text,i,length(a))=a then begin
if (Copy(Edit1.Text,i+length(a),1)=' ')  or  (Copy(Edit1.Text,i+length(a),1)=',')  or (Copy(Edit1.Text,i+length(a),1)=';') or (Copy(Edit1.Text,i+length(a),1)='') or (i+length(a)>length(Edit1.Text))   then begin
if (Copy(Edit1.Text,i-1,1)=' ')  or  (Copy(Edit1.Text,i-1,1)=',')  or (Copy(Edit1.Text,i-1,1)=';') or  (Copy(Edit1.Text,i-1,1)='') or (i-1<=0) then
goto 0;
end;
end;
end;
if Edit1.Text='' then Edit1.Text:=Edit1.Text+Copy(CheckListBox1.Items.Strings[CheckListBox1.ItemIndex],1,pos('(',CheckListBox1.Items.Strings[CheckListBox1.ItemIndex])-1)
else Edit1.Text:=Edit1.Text+' '+ Copy(CheckListBox1.Items.Strings[CheckListBox1.ItemIndex],1,pos('(',CheckListBox1.Items.Strings[CheckListBox1.ItemIndex])-1)
end
else begin
for i:=0 to length(Edit1.Text) do begin
a:=Copy(CheckListBox1.Items.Strings[CheckListBox1.ItemIndex],1,pos('(',CheckListBox1.Items.Strings[CheckListBox1.ItemIndex])-1);
if Copy(Edit1.Text,i,length(a))=a then begin
if (Copy(Edit1.Text,i+length(a),1)=' ')  or  (Copy(Edit1.Text,i+length(a),1)=',')  or (Copy(Edit1.Text,i+length(a),1)=';') or (Copy(Edit1.Text,i+length(a),1)='') or (i+length(a)>length(Edit1.Text))   then begin
if (Copy(Edit1.Text,i-1,1)=' ')  or  (Copy(Edit1.Text,i-1,1)=',')  or (Copy(Edit1.Text,i-1,1)=';') or  (Copy(Edit1.Text,i-1,1)='') or (i-1<=0) then  begin


b:=Copy(Edit1.Text,1,i-1);
c:=Copy(Edit1.Text,i+length(a)+1,length(Edit1.Text));
Edit1.Clear;
//showmessage('*'+Copy(b,length(b),1)+'*');
if (Copy(b,length(b),1)=' ') and  (Copy(c,1,1)=' ') then  c:=Copy(c,2,length(c));
if (Copy(b,length(b),1)<>' ') and  (Copy(c,1,1)<>' ') and (b<>'') then  c:=' '+Copy(c,1,length(c));
if (c='') and (Copy(b,length(b),1)=' ') then b:=Copy(b,1,length(b)-1);
Edit1.Text:=b+c;




end;
end;
end;
end;


end;



 ver:=False;

0:
end;




procedure TForm68.Edit1Change(Sender: TObject);
var i,j: integer;
spaces,elmn: array of integer;
chch: array of boolean;
begin
if ver=False then begin

if Edit1.Text='' then
for i:=0 to CheckListBox1.Items.Count-1 do
CheckListBox1.Checked[i]:=False;


if Edit1.Text<>'' then begin
for i:=0 to length(Edit1.Text) do
if (Copy(Edit1.Text,i,1)=' ') or (Copy(Edit1.Text,i,1)=',') or (Copy(Edit1.Text,i,1)=';') then begin
SetLength(spaces,length(spaces)+1);
spaces[length(spaces)-1]:=i;
end;

Setlength(spaces,length(spaces)+1);
spaces[length(spaces)-1]:=spaces[length(spaces)-1]+100;


for i:=0 to length(spaces)-1 do
if (Copy(Edit1.Text,spaces[i]-1,1)<>' ') and (Copy(Edit1.Text,spaces[i]-1,1)<>',') and (Copy(Edit1.Text,spaces[i]-1,1)<>';') then begin
for j:=0 to 100 do
if (Copy(Edit1.Text,spaces[i]-1-j,1)=' ') or (Copy(Edit1.Text,spaces[i]-1-j,1)=',') or (Copy(Edit1.Text,spaces[i]-1-j,1)=';') or (spaces[i]-1-j<=0) then Break;
SetLength(elmn,length(elmn)+1);
elmn[length(elmn)-1]:=StrToIntDef(Copy(Edit1.Text,spaces[i]-j,j),0);

end;
end;


SetLength(chch,CheckListBox1.Items.Count);

for i:=0 to CheckListBox1.Items.Count-1  do
for j:=0 to length(elmn)-1 do
if elmn[j]=StrToInt(Copy(CheckListBox1.Items.Strings[i],1,pos('(',CheckListBox1.Items.Strings[i])-1)) then chch[i]:=True;


for i:=0 to length(chch)-1 do
if chch[i]=True then CheckListBox1.Checked[i]:=True else CheckListBox1.Checked[i]:=False;



end;
end;




/////////////////// Нажатие кнопки/////////////////////////////////////////////////////////////////




procedure TForm68.BitBtn1Click(Sender: TObject);
var str,str1,str2,str3,str4,str5,str_temp,lett,str_re: WideString;
what,i,j,k,l,t,x,cn1,cn2,p,g,s: Integer;   //это параметр, показывающий что делать с координатами в некоторых случаях
high,middle,at_in_high,at_in_middle,tmp_r: array of Integer;
centr2: array of string;
were: boolean;
centr0: array of string;
popr1: Integer;
what_incl: array of boolean;
sum_chrg: real;
label 0,21,35,36,37,100,400,210,350,360,370,401;
begin

full_incl:=nil;

if dial=true then begin   /////////////////////////////DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

if atomoutel<>nil then popr1:=0;
high:=nil;
middle:=nil;
at_in_high:=nil;
at_in_middle:=nil;
tmp_r:=nil;
centr0:=nil;
centr2:=nil;
centr1:=nil;


  str:=' ' + Edit1.Text + ' ';
  j:=0;
  if atomoutel<>nil then begin    //случай, когда у нас out, xyz
 if atomoutel[1]<>nil then begin
   for i:=0 to Length(atomoutel[1])-1 do
   if atomoutel[1,i]<>'' then begin
   if i=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel[1,i]);
    j:=j+1;
   end
   else begin
    if Length(centr0)=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel[1,i]);
    j:=j+1;
   end
   else begin
     were:=false;
    for t:=0 to Length(centr0)-1 do
    if OnlyLet(atomoutel[1,i])=centr0[t] then were:=true;
    if were=false then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel[1,i]);
    j:=j+1;
    end;
    end;
    end;
   end;
   end;
   end;                    //centr0 - типы центров (Mg,C,Br...)

 end
 else begin
  if  atomoutel_mult<>nil then begin
 if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then popr1:=0;
 high:=nil;
 middle:=nil;
 at_in_high:=nil;
 at_in_middle:=nil;
 tmp_r:=nil;
 centr0:=nil;
 centr2:=nil;
 centr1:=nil;


  str:=' ' + Edit1.Text + ' ';
  j:=0;
  if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin    //случай, когда у нас out, xyz
 if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1]<>nil then begin
   for i:=0 to Length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
   if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
   if i=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]);
    j:=j+1;
   end
   else begin
    if Length(centr0)=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]);
    j:=j+1;
   end
   else begin
     were:=false;
    for t:=0 to Length(centr0)-1 do
    if OnlyLet(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i])=centr0[t] then were:=true;
    if were=false then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]);
    j:=j+1;
    end;
    end;
    end;
   end;
   end;
   end;                    //centr0 - типы центров (Mg,C,Br...)
 end;

 end;


//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////    ##  ####    ##  #######   ##       ##     ##   ####      ########    ////////////////////
/////////    ##  ##  #   ##  ##        ##       ##     ##   ##  ##    ##          ////////////////////
/////////    ##  ##   #  ##  ##        ##       ##     ##   ##   ##   ######      ////////////////////
/////////    ##  ##    # ##  ##        ##       ##     ##   ##  ##    ##          ////////////////////
/////////    ##  ##     ###  #######   #######   #######    ####      ########    ////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////






   j:=0;
    if dial=true then begin
   if atomoutel<>nil then begin
    if atomoutel[1]<>nil then begin
     for i:=0 to Length(atomoutel[1])-1 do
     if atomoutel[1,i]<>'' then begin
     SetLength(centr1,Length(centr1)+1);
     centr1[j]:=OnlyLet(atomoutel[1,i]);
     j:=j+1;
    end;
    end;
    end;
    end
    else begin
      if  atomoutel_mult<>nil then begin
    if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
    if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1]<>nil then begin
     for i:=0 to Length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
     if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
     SetLength(centr1,Length(centr1)+1);
     centr1[j]:=OnlyLet(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]);
     j:=j+1;
    end;
    end;
    end;
    end;
     end;






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


   if (Length(centr2)=1) and (centr2[0]='') then begin
   centr2:=nil;
   goto 400;
   end;


    if centr2[length(centr2)-1]='' then SetLength(centr2,length(centr2)-1);    //////// !!!!!!!!!

   were:=False;
  for i:=0 to Length(centr2)-1 do begin
  if (i>0) and (were=False) then begin
   ShowMessage('INCL_SEC: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;
  were:=false;
  for j:=0 to Length(centr0)-1 do
  if centr2[i]=centr0[j] then  were:=True;
  end;
  if  were=False then begin
   ShowMessage('INCL_SEC: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;

   //Определим центры, которые есть в совокупности

   while centr1[length(centr1)-1]='' do
   setlength(centr1,length(centr1)-1);


  str5:='';
  // Сравниваем центры, которые реально есть в системе с затребованными и получаем номера затребованных
  for i:=0 to Length(centr1)-1 do
  for j:=0 to Length(centr2)-1 do
  if centr1[i]=centr2[j] then  str5:=str5+' '+ IntToStr(i+1);

  str5:=str5+' ';


  str:=Copy(str,1,Pos('(',str)-1)+str5+Copy(str,Pos(')',str)+1,Length(str));

 400:

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
 SetLength(at_in_high,t+1);
 at_in_high[t]:=-1;
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
  SetLength(at_in_high,t+1);
  if (Pos('-',Copy(str,x+1,cn2))=0) and (Copy(str,x+1,cn2)<>'') then at_in_high[t]:=StrToInt(Copy(str,x+1,cn2))
  else if Copy(str,x+1,cn2)<>'' then at_in_high[t]:=-1;
  x:=x+cn2;
  t:=t+1;
  cn1:=0;
  if x<Length(str) then goto 21;
 //================================================================================================
  if at_in_high[Length(at_in_high)-1]=0 then SetLength(at_in_high,Length(at_in_high)-1);

 //Получили совокупность групп и атомов для отображения


  if (Length(at_in_high)=1) and ((at_in_high[0]=-1)) then at_in_high:=nil;

  // Теперь тире заменяем на реальные значения из диапазоне


  //Атомы:

  i:=0;
  k:=0;
  while i<length(at_in_high) do begin


  if i>1 then goto 35;
  if length(at_in_high)>1 then begin
   if (at_in_high[0]=-1) and (at_in_high[1]<>-1) then begin
    SetLength(high,at_in_high[1]);
    for j:=0 to at_in_high[1]-1 do
    high[j]:=j+1;
    i:=i+2;
    k :=length(high)-1;
    end;
  end;

  if i>=length(at_in_high) then Break;

  35:
  if length(at_in_high)-i>=3 then begin
   if (at_in_high[i]<>-1) and (at_in_high[i+1]=-1) and (at_in_high[i+2]<>-1) then begin
    if length(high)=0 then t:=0 else t:=1;
    SetLength(high, length(high)+abs(at_in_high[i+2]-at_in_high[i])+1);
    for j:=0 to abs(at_in_high[i+2]-at_in_high[i]) do begin
     if at_in_high[i+2]>at_in_high[i] then high[k+j+t]:=at_in_high[i]+j;
     if at_in_high[i+2]<at_in_high[i] then high[k+j+t]:=at_in_high[i]-j;
     if at_in_high[i+2]=at_in_high[i] then high[k+j+t]:=at_in_high[i];
    end;
    i:=i+3;
    k:=length(high)-1;
   end;
  end;

   if i>=length(at_in_high) then Break;

  if length(at_in_high)-i>=2 then begin
   if (at_in_high[i]=-1) and (at_in_high[i+1]=-1) then begin
    ShowMessage('HIGH LAYER: Проверьте введенные данные, возможна ошибка!');
    goto 0;
   end;
   if (at_in_high[i]<>-1) and (at_in_high[i+1]<>-1) then begin
    SetLength(high,length(high)+2);
    high[length(high)-2]:=at_in_high[i];
    high[length(high)-1]:=at_in_high[i+1];
    i:=i+2;
    k:=length(high)-1;
   end;
  end;

  if i>=length(at_in_high) then Break;


  if dial=true then begin
  if i=length(at_in_high)-2 then begin
   if (at_in_high[length(at_in_high)-1]=-1) and (at_in_high[length(at_in_high)-2]<>-1) then begin
   if length(high)=0 then t:=0 else t:=1;
   if length(high)+nomer_atoma-popr1-at_in_high[length(at_in_high)-2]+1<=0 then begin
   ShowMessage('INCL_SEC: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
    SetLength(high,length(high)+nomer_atoma-popr1-at_in_high[length(at_in_high)-2]+1);
    for j:=0 to nomer_atoma-popr1-at_in_high[length(at_in_high)-2] do
    high[k+j+t]:=at_in_high[length(at_in_high)-2]+j;
    i:=i+2;
    k:=length(high)-1;
   end;
  end;
  end
  else begin
  if i=length(at_in_high)-2 then begin
   if (at_in_high[length(at_in_high)-1]=-1) and (at_in_high[length(at_in_high)-2]<>-1) then begin
   if length(high)=0 then t:=0 else t:=1;
   if length(high)+nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_high[length(at_in_high)-2]+1<=0 then begin
   ShowMessage('INCL_SEC: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1));
   goto 0;
   end;
    SetLength(high,length(high)+nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_high[length(at_in_high)-2]+1);
    for j:=0 to nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_high[length(at_in_high)-2] do
    high[k+j+t]:=at_in_high[length(at_in_high)-2]+j;
    i:=i+2;
    k:=length(high)-1;
   end;
  end;

  end;








  if i>=length(at_in_high) then Break;

  if (length(at_in_high)=1) and (at_in_high[0]<>-1) then begin
   SetLength(high,1);
   high[0]:=at_in_high[0];
   i:=i+1;
  end;

  if i>=length(at_in_high) then Break;

  if (length(at_in_high)-i=1) and (at_in_high[length(at_in_high)-1]<>-1) then begin
   Setlength(high,length(high)+1);
   high[length(high)-1]:=at_in_high[i];
   i:=i+1;
  end;

  if i>=length(at_in_high) then Break;

  g:=0;

  if dial=true then begin
  if (length(at_in_high)-i=2) and (at_in_high[length(at_in_high)-1]=-1) then begin
    if length(high)+nomer_atoma-popr1-at_in_high[length(at_in_high)-2]+1<=0 then begin
   ShowMessage('INCL_SEC: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
   36:  SetLength(high,length(high)+nomer_atoma-popr1-at_in_high[length(at_in_high)-2]+1);
   for j:=0 to nomer_atoma-popr1-at_in_high[length(at_in_high)-2] do
   high[k+j+1-g]:=at_in_high[i-1]+j+1-g;
   k:=length(high)-1;
   i:=i+1;
  end;
  end
  else begin
  if (length(at_in_high)-i=2) and (at_in_high[length(at_in_high)-1]=-1) then begin
    if length(high)+nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_high[length(at_in_high)-2]+1<=0 then begin
   ShowMessage('INCL_SEC: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1));
   goto 0;
   end;
   37:  SetLength(high,length(high)+nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_high[length(at_in_high)-2]+1);
   for j:=0 to nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_high[length(at_in_high)-2] do
   high[k+j+1-g]:=at_in_high[i-1]+j+1-g;
   k:=length(high)-1;
   i:=i+1;
  end;
  end;




  if i>=length(at_in_high) then Break;

  if i>1 then begin
  if Length(at_in_high)-i>=2 then begin
  if (at_in_high[i]=-1) and (at_in_high[i+1]<>-1) then begin
  i:=i-1;
  SetLength(high,Length(high)-1);
  k:=Length(high)-1;
  goto 35;
  end;
  end;

  if Length(at_in_high)-i=1 then begin
    if at_in_high[i]=-1 then begin
     SetLength(high,Length(high)-1);
     g:=1;
    //  k:=Length(high)-1;
     if dial=true then goto 36 else goto 37;
    end;
  end;
  end;
end;


  if Length(high)>1 then begin                   //  ########################################
 for i:=0 to Length(high)-1 do                   //  ########################################
 for j:=0 to Length(high)-2 do                   //  ########################################
 if  high[j]>high[j+1] then begin                //  ######
  x := high[j+1];                                //  ######   Sorting of array  high
  high[j+1] := high[j];                          //  ######
  high[j]:=x;                                    //  ########################################
 end;                                            //  ########################################
 end;                                            //  ########################################

 //Отсортировали, теперь надо исключить повторения элементов


 //Атомы

 s:=0;
 tmp_r:=nil;
 SetLength(tmp_r,Length(high));
 SetLength(high,Length(high)+1);
 high[Length(high)-1]:=-1;
 if Length(high)>1 then begin
  for i:=0 to Length(high)-2 do
  if high[i+1]<>high[i] then  begin
    s:=s+1;
  tmp_r[i]:=high[i];
  end;
 end;

 SetLength(high,s);
 j:=0;
 for i:=0 to Length(tmp_r)-1 do begin
 if tmp_r[i]<>0 then begin  high[j]:=tmp_r[i];
 j:=j+1;
 end;
 end;

 if dial=true then begin
 if high<>nil then begin
 if high[Length(high)-1]>nomer_atoma-popr1 then begin
   ShowMessage('HIGH LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;

 if high<>nil then begin
   if MaxIntValue(high)>nomer_atoma-popr1 then begin
   ShowMessage('HIGH LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;
 end
 else begin
 if high<>nil then begin
 if high[Length(high)-1]>nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1 then begin
   ShowMessage('HIGH LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1)+' атомов');
   goto 0;
 end;
 end;

 if high<>nil then begin
   if MaxIntValue(high)>nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1 then begin
   ShowMessage('HIGH LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1)+' атомов');
   goto 0;
 end;
 end;
 end;


 100:


  //##################################################################################################
  //           #######    ##   ##   ########  ##         ##     ##  ####     #######   ***************
  //           ##          ## ##    ##        ##         ##     ##  ##   #   ##        ***************
  //           #####        ###     ##        ##         ##     ##  ##    #  #####     ***************
  //           ##          ## ##    ##        ########   ##     ##  ##   #   ##        ***************
  //           #######   ##    ##   ########  ########    #######   ####     #######   ***************
   // ================================================================================================
 // ==================================================================================================

  str:=' '+Edit2.Text + ' ';
  centr2:=nil;

  
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

  j:=0;

   if (Length(centr2)=1) and (centr2[0]='') then begin
    centr2:=nil;
    goto 401;
    end;


   if centr2[length(centr2)-1]='' then SetLength(centr2,length(centr2)-1);    //////// !!!!!!!!!


   were:=False;
  for i:=0 to Length(centr2)-1 do begin
  if (i>0) and (were=False) then begin
   ShowMessage('EXCL_SEC: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;
  were:=false;
  for j:=0 to Length(centr0)-1 do
  if centr2[i]=centr0[j] then  were:=True;
  end;
  if  were=False then begin
   ShowMessage('EXCL_SEC: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;

   //Определим центры, которые есть в совокупности

  j:=0;

  while centr1[length(centr1)-1]='' do
   setlength(centr1,length(centr1)-1);

  str5:='';
  // Сравниваем центры, которые реально есть в системе с затребованными и получаем номера затребованных
  for i:=0 to Length(centr1)-1 do
  for j:=0 to Length(centr2)-1 do
  if centr1[i]=centr2[j] then  str5:=str5+' '+ IntToStr(i+1);

  str5:=str5+' ';

  str:=Copy(str,1,Pos('(',str)-1)+str5+Copy(str,Pos(')',str)+1,Length(str));


  401:

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
 210:
 for p:=1 to Length(str) do begin
   if (Copy(str,p+x,1)=' ') or (Copy(str,p+x,1)=',') or (Copy(str,p+x,1)=';') or (Copy(str,p+x,1)='-') then
   cn1:=cn1+1
   else Break;
 end;
 if (pos('-',Copy(str,p+x-cn1,cn1))<>0) and (cn1<>0) then begin
 SetLength(at_in_middle,t+1);
 at_in_middle[t]:=-1;
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
  SetLength(at_in_middle,t+1);
  if (Pos('-',Copy(str,x+1,cn2))=0) and (Copy(str,x+1,cn2)<>'') then at_in_middle[t]:=StrToInt(Copy(str,x+1,cn2))
  else if Copy(str,x+1,cn2)<>'' then at_in_middle[t]:=-1;
  x:=x+cn2;
  t:=t+1;
  cn1:=0;
  if x<Length(str) then goto 210;
 //================================================================================================
  if at_in_middle[Length(at_in_middle)-1]=0 then SetLength(at_in_middle,Length(at_in_middle)-1);

 //Получили совокупность групп и атомов для отображения


  if (Length(at_in_middle)=1) and ((at_in_middle[0]=-1)) then at_in_middle:=nil;

  // Теперь тире заменяем на реальные значения из диапазоне


  //Атомы:

  i:=0;
  k:=0;
  while i<length(at_in_middle) do begin


  if i>1 then goto 350;
  if length(at_in_middle)>1 then begin
   if (at_in_middle[0]=-1) and (at_in_middle[1]<>-1) then begin
    SetLength(middle,at_in_middle[1]);
    for j:=0 to at_in_middle[1]-1 do
    middle[j]:=j+1;
    i:=i+2;
    k :=length(middle)-1;
    end;
  end;

  if i>=length(at_in_middle) then Break;

  350:
  if length(at_in_middle)-i>=3 then begin
   if (at_in_middle[i]<>-1) and (at_in_middle[i+1]=-1) and (at_in_middle[i+2]<>-1) then begin
    if length(middle)=0 then t:=0 else t:=1;
    SetLength(middle, length(middle)+abs(at_in_middle[i+2]-at_in_middle[i])+1);
    for j:=0 to abs(at_in_middle[i+2]-at_in_middle[i]) do begin
     if at_in_middle[i+2]>at_in_middle[i] then middle[k+j+t]:=at_in_middle[i]+j;
     if at_in_middle[i+2]<at_in_middle[i] then middle[k+j+t]:=at_in_middle[i]-j;
     if at_in_middle[i+2]=at_in_middle[i] then middle[k+j+t]:=at_in_middle[i];
    end;
    i:=i+3;
    k:=length(middle)-1;
   end;
  end;

   if i>=length(at_in_middle) then Break;

  if length(at_in_middle)-i>=2 then begin
   if (at_in_middle[i]=-1) and (at_in_middle[i+1]=-1) then begin
    ShowMessage('EXCL_SEC: Проверьте введенные данные, возможна ошибка!');
    goto 0;
   end;
   if (at_in_middle[i]<>-1) and (at_in_middle[i+1]<>-1) then begin
    SetLength(middle,length(middle)+2);
    middle[length(middle)-2]:=at_in_middle[i];
    middle[length(middle)-1]:=at_in_middle[i+1];
    i:=i+2;
    k:=length(middle)-1;
   end;
  end;

  if i>=length(at_in_middle) then Break;


  if dial=true then begin
  if i=length(at_in_middle)-2 then begin
   if (at_in_middle[length(at_in_middle)-1]=-1) and (at_in_middle[length(at_in_middle)-2]<>-1) then begin
   if length(middle)=0 then t:=0 else t:=1;
   if length(middle)+nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2]+1<=0 then begin
   ShowMessage('EXCL_SEC: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
    SetLength(middle,length(middle)+nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2]+1);
    for j:=0 to nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2] do
    middle[k+j+t]:=at_in_middle[length(at_in_middle)-2]+j;
    i:=i+2;
    k:=length(middle)-1;
   end;
  end;
  end
  else begin
  if i=length(at_in_middle)-2 then begin
   if (at_in_middle[length(at_in_middle)-1]=-1) and (at_in_middle[length(at_in_middle)-2]<>-1) then begin
   if length(middle)=0 then t:=0 else t:=1;
   if length(middle)+nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_middle[length(at_in_middle)-2]+1<=0 then begin
   ShowMessage('EXCL_SEC: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1));
   goto 0;
   end;
    SetLength(middle,length(middle)+nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_middle[length(at_in_middle)-2]+1);
    for j:=0 to nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_middle[length(at_in_middle)-2] do
    middle[k+j+t]:=at_in_middle[length(at_in_middle)-2]+j;
    i:=i+2;
    k:=length(middle)-1;
   end;
  end;
  end;





  if i>=length(at_in_middle) then Break;

  if (length(at_in_middle)=1) and (at_in_middle[0]<>-1) then begin
   SetLength(middle,1);
   middle[0]:=at_in_middle[0];
   i:=i+1;
  end;

  if i>=length(at_in_middle) then Break;

  if (length(at_in_middle)-i=1) and (at_in_middle[length(at_in_middle)-1]<>-1) then begin
   Setlength(middle,length(middle)+1);
   middle[length(middle)-1]:=at_in_middle[i];
   i:=i+1;
  end;

  if i>=length(at_in_middle) then Break;

  g:=0;

  if dial=true then begin
  if (length(at_in_middle)-i=2) and (at_in_middle[length(at_in_middle)-1]=-1) then begin
    if length(middle)+nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2]+1<=0 then begin
   ShowMessage('EXCL_SEC: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
   360:  SetLength(middle,length(middle)+nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2]+1);
   for j:=0 to nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2] do
   middle[k+j+1-g]:=at_in_middle[i-1]+j+1-g;
   k:=length(middle)-1;
   i:=i+1;
  end;
  end
  else begin
  if (length(at_in_middle)-i=2) and (at_in_middle[length(at_in_middle)-1]=-1) then begin
    if length(middle)+nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_middle[length(at_in_middle)-2]+1<=0 then begin
   ShowMessage('EXCL_SEC: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1));
   goto 0;
   end;
   370:  SetLength(middle,length(middle)+nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_middle[length(at_in_middle)-2]+1);
   for j:=0 to nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1-at_in_middle[length(at_in_middle)-2] do
   middle[k+j+1-g]:=at_in_middle[i-1]+j+1-g;
   k:=length(middle)-1;
   i:=i+1;
  end;
  end;







  if i>=length(at_in_middle) then Break;

  if i>1 then begin
  if Length(at_in_middle)-i>=2 then begin
  if (at_in_middle[i]=-1) and (at_in_middle[i+1]<>-1) then begin
  i:=i-1;
  SetLength(middle,Length(middle)-1);
  k:=Length(middle)-1;
  goto 350;
  end;
  end;

  if Length(at_in_middle)-i=1 then begin
    if at_in_middle[i]=-1 then begin
     SetLength(middle,Length(middle)-1);
     g:=1;
    //  k:=Length(middle)-1;
      if dial=true then goto 360 else goto 370;
    end;
  end;
  end;
end;





  if Length(middle)>1 then begin                   //  ########################################
 for i:=0 to Length(middle)-1 do                   //  ########################################
 for j:=0 to Length(middle)-2 do                   //  ########################################
 if  middle[j]>middle[j+1] then begin              //  ######
  x := middle[j+1];                                //  ######   Sorting of array  middle
  middle[j+1] := middle[j];                        //  ######
  middle[j]:=x;                                    //  ########################################
 end;                                              //  ########################################
 end;                                              //  ########################################

 //Отсортировали, теперь надо исключить повторения элементов


 //Атомы

 s:=0;
 tmp_r:=nil;
 SetLength(tmp_r,Length(middle));
 SetLength(middle,Length(middle)+1);
 middle[Length(middle)-1]:=-1;
 if Length(middle)>1 then begin
  for i:=0 to Length(middle)-2 do
  if middle[i+1]<>middle[i] then  begin
    s:=s+1;
  tmp_r[i]:=middle[i];
  end;
 end;



 SetLength(middle,s);
 j:=0;
 for i:=0 to Length(tmp_r)-1 do begin
 if tmp_r[i]<>0 then begin  middle[j]:=tmp_r[i];
 j:=j+1;
 end;
 end;

 if dial=true then begin
 if middle<>nil then begin
 if middle[Length(middle)-1]>nomer_atoma-popr1 then begin
   ShowMessage('EXCL_SEC: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;

 if middle<>nil then begin
   if MaxIntValue(middle)>nomer_atoma-popr1 then begin
   ShowMessage('EXCL_SEC: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;
 end
 else begin
 if middle<>nil then begin
 if middle[Length(middle)-1]>nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1 then begin
   ShowMessage('EXCL_SEC: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1)+' атомов');
   goto 0;
 end;
 end;

 if middle<>nil then begin
   if MaxIntValue(middle)>nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1 then begin
   ShowMessage('EXCL_SEC: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma_mult[basket[Form64.ComboBox1.ItemIndex]]-popr1)+' атомов');
   goto 0;
 end;
 end;
 end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     //
      //
       //
        //       КОНЕЦ ЧТЕНИЯ СЕКЦИЙ ВКЛЮЧИТЬ И ИСКЛЮЧИТЬ
          //
           //    !!!!!!!!                          !!!!!!!
            //    !!!!!!!!!!                         !!!!!!!!!
              ///

                // high - массив номеров атомов, которые включены в суммирование
                // middle - массив исключенных из суммирования атомов


SetLength(what_incl,length(high));

for i:=0 to length(high)-1 do
for j:=0 to length(middle)-1 do
if high[i]=middle[j] then what_incl[i]:=True;


For i:=0 to length(high)-1 do
if what_incl[i]=False then begin
SetLength(full_incl,length(full_incl)+1);
full_incl[length(full_incl)-1]:=high[i];      /////////////// в этом массиве номера тех, атомов к которым надо
end;                                                     //// применять операцию суммирования

sum_chrg:=0;

if dial=true then begin
if Combobox1.Text='Заряд' then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mull[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mbs_mull[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(bond_mull[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(esp[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(hir[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='CM5' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(cm5[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='NBO' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(nbo[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='AIM' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(aim[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(lo[Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(apt[Combobox2.ItemIndex,full_incl[i]-1]);
end;

Edit3.Text:='Charge = '+floattostrf(sum_chrg,ffFixed,8,4);

end;

sum_chrg:=0;

if pos('Спиновая плотность',Form68.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mull_spin[Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mbs_mull_spin[Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(bond_mull_spin[Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(esp_spin[Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(hir_spin[Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(lo_spin[Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(apt_spin[Combobox2.ItemIndex,full_incl[i]-1]);
end;

Edit3.Text:='Spin = '+floattostrf(sum_chrg,ffFixed,8,4);

end;

sum_chrg:=0;

if pos('Электростатический потенциал',Form68.ComboBox1.Text)<>0 then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(poten[Combobox2.ItemIndex,full_incl[i]-1]);

Edit3.Text:='Potencial = '+floattostrf(sum_chrg,ffFixed,8,4);
end;

end
else begin

if Combobox1.Text='Заряд' then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='CM5' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='NBO' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='AIM' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;

Edit3.Text:='Charge = '+floattostrf(sum_chrg,ffFixed,8,4);

end;

sum_chrg:=0;

if pos('Спиновая плотность',Form68.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mbs_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(bond_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(esp_spin_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(hir_spin_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(lo_spin_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(apt_spin_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);
end;

Edit3.Text:='Spin = '+floattostrf(sum_chrg,ffFixed,8,4);

end;

sum_chrg:=0;

if pos('Электростатический потенциал',Form68.ComboBox1.Text)<>0 then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(poten_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,full_incl[i]-1]);

Edit3.Text:='Potencial = '+floattostrf(sum_chrg,ffFixed,8,4);
end;

end;



0:
end;





procedure TForm68.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
end;

procedure TForm68.BitBtn2Click(Sender: TObject);
var sum_chrg: real;
i,j: integer;

begin
BitBtn1.Click;

evol_chrg:=nil;

for j:=0 to Combobox2.Items.Count-1 do begin
sum_chrg:=0;

if dial=true then begin
if Combobox1.Text='Заряд' then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mull[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mbs_mull[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(bond_mull[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(esp[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(hir[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='CM5' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(cm5[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='NBO' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(nbo[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='AIM' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(aim[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(lo[j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(apt[j,full_incl[i]-1]);
end;

Edit3.Text:='Charge = '+floattostrf(sum_chrg,ffFixed,8,4);

end;


if pos('Спиновая плотность',Form68.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mull_spin[j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mbs_mull_spin[j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(bond_mull_spin[j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(esp_spin[j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(hir_spin[j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(lo_spin[j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(apt_spin[j,full_incl[i]-1]);
end;

Edit3.Text:='Spin = '+floattostrf(sum_chrg,ffFixed,8,4);

end;


if pos('Электростатический потенциал',Form68.ComboBox1.Text)<>0 then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(poten[j,full_incl[i]-1]);

Edit3.Text:='Potencial = '+floattostrf(sum_chrg,ffFixed,8,4);
end;

end
else begin

if Combobox1.Text='Заряд' then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='CM5' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='NBO' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='AIM' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;


if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;

Edit3.Text:='Charge = '+floattostrf(sum_chrg,ffFixed,8,4);

end;


if pos('Спиновая плотность',Form68.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(mbs_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(bond_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(esp_spin_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(hir_spin_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(lo_spin_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;

if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(apt_spin_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);
end;

Edit3.Text:='Spin = '+floattostrf(sum_chrg,ffFixed,8,4);

end;


if pos('Электростатический потенциал',Form68.ComboBox1.Text)<>0 then begin
for i:=0 to length(full_incl)-1 do
sum_chrg:=sum_chrg + StrToFloat(poten_mult[basket[Form64.ComboBox1.ItemIndex],j,full_incl[i]-1]);

Edit3.Text:='Potencial = '+floattostrf(sum_chrg,ffFixed,8,4);
end;

end;

SetLength(evol_chrg,length(evol_chrg)+1);
evol_chrg[length(evol_chrg)-1]:=sum_chrg;


end;

Form69.Show;

end;

end.
