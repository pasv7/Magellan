unit Unit43;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Math;

type
  TForm43 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit4: TEdit;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form43: TForm43;
  Layers: array of string;

implementation

uses Unit1,Unit39,Unit36;

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






procedure TForm43.BitBtn1Click(Sender: TObject);
var str,str1,str2,str3,str4,str5,str_temp,lett,str_re: WideString;
what,i,j,k,l,t,x,cn1,cn2,p,g,s: Integer;   //это параметр, показывающий что делать с координатами в некоторых случаях
high,middle,Low,empty,at_in_high,at_in_middle,at_in_low,at_in_empty,tmp_r: array of Integer;
centr2: array of string;
were: boolean;
centr0: array of string;
popr1: Integer;
label 0,21,35,36,210,350,360,2100,3500,3600,21000,35000,36000,100,101,102,103,150,400,401,402,403;
begin


if atom_store<>nil then popr1:=1;
if atomoutel<>nil then popr1:=0;

Layers:=nil;
high:=nil;
middle:=nil;
low:=nil;
empty:=nil;
at_in_high:=nil;
at_in_middle:=nil;
at_in_low:=nil;
at_in_empty:=nil;
tmp_r:=nil;
centr0:=nil;
centr2:=nil;


//nomer_atoma - число атомов в системе
//читаем верхний слой
if (Edit1.Text='') and (Edit2.Text='') and (Edit3.Text='') and (Edit4.Text='') then begin
what:=0;
goto 0;
end;



// Layers - array (hight,hight,middle,low,low,low,...) - индексы - номера атомов
// High - верхний слой, middle - средний, low - нижний, empty - пустой
 if Dial=True then begin


  //##################################################################################################
  //              ##      ##   ##    #######   ##      ##   ############                       *******
  //              ##      ##   ##    ##        ##      ##   ############                       *******
  //              ##########   ##    ##   ###  ##########        ##                            *******
  //              ##      ##   ##    ##    ##  ##      ##        ##                            *******
  //              ##      ##   ##     #######  ##      ##        ##                            *******
   // ================================================================================================
 // ==================================================================================================

  str:=' ' + Edit1.Text + ' ';


  j:=0;
  //Определим типы центров, которые реально присутствуют в нашей системе
  if atom_store<>nil then begin    //случай, когда у нас GJF
   for i:=0 to Length(atom_store)-1 do
   if atom_store[i]<>'' then begin
   if i=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
   end
   else begin
    if Length(centr0)=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
   end
   else begin
     were:=false;
    for t:=0 to Length(centr0)-1 do
    if OnlyLet(atom_store[i])=centr0[t] then were:=true;
    if were=false then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
    end;
    end;
    end;
   end;
   end;

if atomoutel<>nil then begin    //случай, когда у нас out, xyz
if atomoutel[nc]<>nil then begin
   for i:=0 to Length(atomoutel[nc])-1 do
   if atomoutel[nc,i]<>'' then begin
   if i=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel[nc,i]);
    j:=j+1;
   end
   else begin
    if Length(centr0)=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel[nc,i]);
    j:=j+1;
   end
   else begin
     were:=false;
    for t:=0 to Length(centr0)-1 do
    if OnlyLet(atomoutel[nc,i])=centr0[t] then were:=true;
    if were=false then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atomoutel[nc,i]);
    j:=j+1;
    end;
    end;
    end;
   end;
   end;
   end;                    //centr0 - типы центров (Mg,C,Br...)


      j:=0;                                       //centr1 - все центры без номеров (Mg,Mg,Mg,Mg,...,Mg,Mg,Br,C,C,C,H,...)
  //Определим центры, которые реально присутствуют в нашей системе
  if atom_store<>nil then begin    //случай, когда у нас GJF
   for i:=0 to Length(atom_store)-1 do
   if atom_store[i]<>'' then begin
    SetLength(centr1,Length(centr1)+1);
    centr1[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
    end;
    end;


  if atomoutel<>nil then begin    //случай, когда у нас GJF
  if atomoutel[nc]<>nil then begin
   for i:=0 to Length(atomoutel[nc])-1 do
   if atomoutel[nc,i]<>'' then begin
    SetLength(centr1,Length(centr1)+1);
    centr1[j]:=OnlyLet(atomoutel[nc,i]);
    j:=j+1;
    end;
    end;
    end;










  if (Pos('%',str)<>0) or (Pos('IGNORE',str)<>0) or (Pos('?',str)<>0) or (Edit1.Text='') then  begin
   ShowMessage('ERROR! Основной слой должен быть определен!');
   goto 0;
   end;

  if (Pos('@',str)<>0) or (Pos('*',str)<>0) then begin
  SetLength(high,1);
  high[0]:=0;
  goto 100;
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
   ShowMessage('HIGH LAYER: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;
  were:=false;
  for j:=0 to Length(centr0)-1 do
  if centr2[i]=centr0[j] then  were:=True;
  end;
  if  were=False then begin
   ShowMessage('HIGH LAYER: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;



   //Определим центры, которые есть в совокупности


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

  if i=length(at_in_high)-2 then begin
   if (at_in_high[length(at_in_high)-1]=-1) and (at_in_high[length(at_in_high)-2]<>-1) then begin
   if length(high)=0 then t:=0 else t:=1;
   if length(high)+nomer_atoma-popr1-at_in_high[length(at_in_high)-2]+1<=0 then begin
   ShowMessage('HIGH LAYER: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
    SetLength(high,length(high)+nomer_atoma-popr1-at_in_high[length(at_in_high)-2]+1);
    for j:=0 to nomer_atoma-popr1-at_in_high[length(at_in_high)-2] do
    high[k+j+t]:=at_in_high[length(at_in_high)-2]+j;
    i:=i+2;
    k:=length(high)-1;
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
  if (length(at_in_high)-i=2) and (at_in_high[length(at_in_high)-1]=-1) then begin
    if length(high)+nomer_atoma-popr1-at_in_high[length(at_in_high)-2]+1<=0 then begin
   ShowMessage('HIGH LAYER: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
   36:  SetLength(high,length(high)+nomer_atoma-popr1-at_in_high[length(at_in_high)-2]+1);
   for j:=0 to nomer_atoma-popr1-at_in_high[length(at_in_high)-2] do
   high[k+j+1-g]:=at_in_high[i-1]+j+1-g;
   k:=length(high)-1;
   i:=i+1;
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
      goto 36;
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






 100:


  //##################################################################################################
  //           ###      ###   ##   ####      ####      ##        ########              ***************
  //           ## ##  ## ##   ##   ##  ##    ##  ##    ##        ##                    ***************
  //           ##   ##   ##   ##   ##   ##   ##   ##   ##        ######                ***************
  //           ##        ##   ##   ##  ##    ##  ##    ##        ##                    ***************
  //           ##        ##   ##   ####      ####      #######   ########              ***************
   // ================================================================================================
 // ==================================================================================================

  str:=' '+Edit2.Text + ' ';
  centr2:=nil;

  if (Pos('%',str)<>0) or (Pos('IGNORE',str)<>0) or (Pos('?',str)<>0) or (Edit2.Text='') then goto 101;
  if (Pos('@',str)<>0) or (Pos('*',str)<>0) then begin
  SetLength(middle,1);
  middle[0]:=0;
  goto 101;
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



  j:=0;                          //ЦЕнтры все те же, они уже определены в секции HIGH
  {
  //Определим типы центров, которые реально присутствуют в нашей системе
  if atom_store<>nil then begin    //случай, когда у нас GJF
   for i:=0 to Length(atom_store)-1 do
   if atom_store[i]<>'' then begin
   if i=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
   end
   else begin
    if Length(centr0)=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
   end
   else begin
     were:=false;
    for t:=0 to Length(centr0)-1 do
    if OnlyLet(atom_store[i])=centr0[t] then were:=true;
    if were=false then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
    end;
    end;
    end;
   end;
   end;   }
                                          //centr0 - типы центров (Mg,C,Br...)


   if (Length(centr2)=1) and (centr2[0]='') then begin
   centr2:=nil;
   goto 401;
   end;

    if centr2[length(centr2)-1]='' then SetLength(centr2,length(centr2)-1);    //////// !!!!!!!!!

   were:=False;
  for i:=0 to Length(centr2)-1 do begin
  if (i>0) and (were=False) then begin
   ShowMessage('MIDDLE LAYER: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;
  were:=false;
  for j:=0 to Length(centr0)-1 do
  if centr2[i]=centr0[j] then  were:=True;
  end;
  if  were=False then begin
   ShowMessage('MIDDLE LAYER: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;



   //Определим центры, которые есть в совокупности


    j:=0;
    {        //Это тоже было сделано в секции HIGH
                                         //centr1 - все центры без номеров (Mg,Mg,Mg,Mg,...,Mg,Mg,Br,C,C,C,H,...)
  //Определим центры, которые реально присутствуют в нашей системе
  if atom_store<>nil then begin    //случай, когда у нас GJF
   for i:=0 to Length(atom_store)-1 do
   if atom_store[i]<>'' then begin
    SetLength(centr1,Length(centr1)+1);
    centr1[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
    end;
    end;
    }





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
    ShowMessage('MIDDLE LAYER: Проверьте введенные данные, возможна ошибка!');
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

  if i=length(at_in_middle)-2 then begin
   if (at_in_middle[length(at_in_middle)-1]=-1) and (at_in_middle[length(at_in_middle)-2]<>-1) then begin
   if length(middle)=0 then t:=0 else t:=1;
   if length(middle)+nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2]+1<=0 then begin
   ShowMessage('MIDDLE LAYER: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
    SetLength(middle,length(middle)+nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2]+1);
    for j:=0 to nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2] do
    middle[k+j+t]:=at_in_middle[length(at_in_middle)-2]+j;
    i:=i+2;
    k:=length(middle)-1;
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
  if (length(at_in_middle)-i=2) and (at_in_middle[length(at_in_middle)-1]=-1) then begin
    if length(middle)+nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2]+1<=0 then begin
   ShowMessage('MIDDLE LAYER: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
   360:  SetLength(middle,length(middle)+nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2]+1);
   for j:=0 to nomer_atoma-popr1-at_in_middle[length(at_in_middle)-2] do
   middle[k+j+1-g]:=at_in_middle[i-1]+j+1-g;
   k:=length(middle)-1;
   i:=i+1;
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
      goto 360;
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


 if middle<>nil then begin
 if middle[Length(middle)-1]>nomer_atoma-popr1 then begin
   ShowMessage('MIDDLE LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;

 if middle<>nil then begin
   if MaxIntValue(middle)>nomer_atoma-popr1 then begin
   ShowMessage('MIDDLE LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;





  101:
 
  //##################################################################################################
  //                     ##         ########    ##             ##                     ****************
  //                     ##         ##    ##     ##     #     ##                      ****************
  //                     ##         ##    ##      ##   ###   ##                       ****************
  //                     ##         ##    ##       ## ## ## ##                        ****************
  //                     #######    ########        ##    ##                          ****************
   // ================================================================================================
 // ==================================================================================================

  str:=' '+Edit3.Text + ' ';
  centr2:=nil;


  if (Pos('%',str)<>0) or (Pos('IGNORE',str)<>0) or (Pos('?',str)<>0) or (Edit3.Text='') then goto 102;
  if (Pos('@',str)<>0) or (Pos('*',str)<>0) then begin
  SetLength(low,1);
  low[0]:=0;
  goto 102;
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



  j:=0;                          //ЦЕнтры все те же, они уже определены в секции HIGH
  {
  //Определим типы центров, которые реально присутствуют в нашей системе
  if atom_store<>nil then begin    //случай, когда у нас GJF
   for i:=0 to Length(atom_store)-1 do
   if atom_store[i]<>'' then begin
   if i=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
   end
   else begin
    if Length(centr0)=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
   end
   else begin
     were:=false;
    for t:=0 to Length(centr0)-1 do
    if OnlyLet(atom_store[i])=centr0[t] then were:=true;
    if were=false then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
    end;
    end;
    end;
   end;
   end;   }
                                          //centr0 - типы центров (Mg,C,Br...)

  if (Length(centr2)=1) and (centr2[0]='') then begin
   centr2:=nil;
   goto 402;
   end;

    if centr2[length(centr2)-1]='' then SetLength(centr2,length(centr2)-1);    //////// !!!!!!!!!

   were:=False;
  for i:=0 to Length(centr2)-1 do begin
  if (i>0) and (were=False) then begin
   ShowMessage('LOW LAYER: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;
  were:=false;
  for j:=0 to Length(centr0)-1 do
  if centr2[i]=centr0[j] then  were:=True;
  end;
  if  were=False then begin
   ShowMessage('LOW LAYER: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;



   //Определим центры, которые есть в совокупности


    j:=0;
    {        //Это тоже было сделано в секции HIGH
                                         //centr1 - все центры без номеров (Mg,Mg,Mg,Mg,...,Mg,Mg,Br,C,C,C,H,...)
  //Определим центры, которые реально присутствуют в нашей системе
  if atom_store<>nil then begin    //случай, когда у нас GJF
   for i:=0 to Length(atom_store)-1 do
   if atom_store[i]<>'' then begin
    SetLength(centr1,Length(centr1)+1);
    centr1[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
    end;
    end;
    }





  str5:='';
  // Сравниваем центры, которые реально есть в системе с затребованными и получаем номера затребованных
  for i:=0 to Length(centr1)-1 do
  for j:=0 to Length(centr2)-1 do
  if centr1[i]=centr2[j] then  str5:=str5+' '+ IntToStr(i+1);

  str5:=str5+' ';


  str:=Copy(str,1,Pos('(',str)-1)+str5+Copy(str,Pos(')',str)+1,Length(str));





  402:


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
 2100:
 for p:=1 to Length(str) do begin
   if (Copy(str,p+x,1)=' ') or (Copy(str,p+x,1)=',') or (Copy(str,p+x,1)=';') or (Copy(str,p+x,1)='-') then
   cn1:=cn1+1
   else Break;
 end;
 if (pos('-',Copy(str,p+x-cn1,cn1))<>0) and (cn1<>0) then begin
 SetLength(at_in_low,t+1);
 at_in_low[t]:=-1;
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
  SetLength(at_in_low,t+1);
  if (Pos('-',Copy(str,x+1,cn2))=0) and (Copy(str,x+1,cn2)<>'') then at_in_low[t]:=StrToInt(Copy(str,x+1,cn2))
  else if Copy(str,x+1,cn2)<>'' then at_in_low[t]:=-1;
  x:=x+cn2;
  t:=t+1;
  cn1:=0;
  if x<Length(str) then goto 2100;
 //================================================================================================
  if at_in_low[Length(at_in_low)-1]=0 then SetLength(at_in_low,Length(at_in_low)-1);

 //Получили совокупность групп и атомов для отображения


  if (Length(at_in_low)=1) and ((at_in_low[0]=-1)) then at_in_low:=nil;

  // Теперь тире заменяем на реальные значения из диапазоне


  //Атомы:

  i:=0;
  k:=0;
  while i<length(at_in_low) do begin


  if i>1 then goto 3500;
  if length(at_in_low)>1 then begin
   if (at_in_low[0]=-1) and (at_in_low[1]<>-1) then begin
    SetLength(low,at_in_low[1]);
    for j:=0 to at_in_low[1]-1 do
    low[j]:=j+1;
    i:=i+2;
    k :=length(low)-1;
    end;
  end;

  if i>=length(at_in_low) then Break;

  3500:
  if length(at_in_low)-i>=3 then begin
   if (at_in_low[i]<>-1) and (at_in_low[i+1]=-1) and (at_in_low[i+2]<>-1) then begin
    if length(low)=0 then t:=0 else t:=1;
    SetLength(low, length(low)+abs(at_in_low[i+2]-at_in_low[i])+1);
    for j:=0 to abs(at_in_low[i+2]-at_in_low[i]) do begin
     if at_in_low[i+2]>at_in_low[i] then low[k+j+t]:=at_in_low[i]+j;
     if at_in_low[i+2]<at_in_low[i] then low[k+j+t]:=at_in_low[i]-j;
     if at_in_low[i+2]=at_in_low[i] then low[k+j+t]:=at_in_low[i];
    end;
    i:=i+3;
    k:=length(low)-1;
   end;
  end;

   if i>=length(at_in_low) then Break;

  if length(at_in_low)-i>=2 then begin
   if (at_in_low[i]=-1) and (at_in_low[i+1]=-1) then begin
    ShowMessage('LOW LAYER: Проверьте введенные данные, возможна ошибка!');
    goto 0;
   end;
   if (at_in_low[i]<>-1) and (at_in_low[i+1]<>-1) then begin
    SetLength(low,length(low)+2);
    low[length(low)-2]:=at_in_low[i];
    low[length(low)-1]:=at_in_low[i+1];
    i:=i+2;
    k:=length(low)-1;
   end;
  end;

  if i>=length(at_in_low) then Break;

  if i=length(at_in_low)-2 then begin
   if (at_in_low[length(at_in_low)-1]=-1) and (at_in_low[length(at_in_low)-2]<>-1) then begin
   if length(low)=0 then t:=0 else t:=1;
   if length(low)+nomer_atoma-popr1-at_in_low[length(at_in_low)-2]+1<=0 then begin
   ShowMessage('LOW LAYER: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
    SetLength(low,length(low)+nomer_atoma-popr1-at_in_low[length(at_in_low)-2]+1);
    for j:=0 to nomer_atoma-popr1-at_in_low[length(at_in_low)-2] do
    low[k+j+t]:=at_in_low[length(at_in_low)-2]+j;
    i:=i+2;
    k:=length(low)-1;
   end;
  end;

  if i>=length(at_in_low) then Break;

  if (length(at_in_low)=1) and (at_in_low[0]<>-1) then begin
   SetLength(low,1);
   low[0]:=at_in_low[0];
   i:=i+1;
  end;

  if i>=length(at_in_low) then Break;

  if (length(at_in_low)-i=1) and (at_in_low[length(at_in_low)-1]<>-1) then begin
   Setlength(low,length(low)+1);
   low[length(low)-1]:=at_in_low[i];
   i:=i+1;
  end;

  if i>=length(at_in_low) then Break;

  g:=0;
  if (length(at_in_low)-i=2) and (at_in_low[length(at_in_low)-1]=-1) then begin
    if length(low)+nomer_atoma-popr1-at_in_low[length(at_in_low)-2]+1<=0 then begin
   ShowMessage('LOW LAYER: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
   3600:  SetLength(low,length(low)+nomer_atoma-popr1-at_in_low[length(at_in_low)-2]+1);
   for j:=0 to nomer_atoma-popr1-at_in_low[length(at_in_low)-2] do
   low[k+j+1-g]:=at_in_low[i-1]+j+1-g;
   k:=length(low)-1;
   i:=i+1;
  end;

  if i>=length(at_in_low) then Break;

  if i>1 then begin
  if Length(at_in_low)-i>=2 then begin
  if (at_in_low[i]=-1) and (at_in_low[i+1]<>-1) then begin
  i:=i-1;
  SetLength(low,Length(low)-1);
  k:=Length(low)-1;
  goto 3500;
  end;
  end;

  if Length(at_in_low)-i=1 then begin
    if at_in_low[i]=-1 then begin
     SetLength(low,Length(low)-1);
     g:=1;
    //  k:=Length(low)-1;
      goto 3600;
    end;
  end;
  end;
end;





  if Length(low)>1 then begin                   //  ########################################
 for i:=0 to Length(low)-1 do                   //  ########################################
 for j:=0 to Length(low)-2 do                   //  ########################################
 if  low[j]>low[j+1] then begin                 //  ######
  x := low[j+1];                                //  ######   Sorting of array  low
  low[j+1] := low[j];                           //  ######
  low[j]:=x;                                    //  ########################################
 end;                                           //  ########################################
 end;                                           //  ########################################

 //Отсортировали, теперь надо исключить повторения элементов


 //Атомы

 s:=0;
 tmp_r:=nil;
 SetLength(tmp_r,Length(low));
 SetLength(low,Length(low)+1);
 low[Length(low)-1]:=-1;
 if Length(low)>1 then begin
  for i:=0 to Length(low)-2 do
  if low[i+1]<>low[i] then  begin
    s:=s+1;
  tmp_r[i]:=low[i];
  end;
 end;



 SetLength(low,s);
 j:=0;
 for i:=0 to Length(tmp_r)-1 do begin
 if tmp_r[i]<>0 then begin  low[j]:=tmp_r[i];
 j:=j+1;
 end;
 end;


 if low<>nil then begin
 if low[Length(low)-1]>nomer_atoma-popr1 then begin
   ShowMessage('LOW LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;



  if low<>nil then begin
   if MaxIntValue(low)>nomer_atoma-popr1 then begin
   ShowMessage('LOW LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;






 102:

  //##################################################################################################
  //                #######       ###   ###      #######   ##########   ##    ##        **************
  //                ##           ## ## ## ##     ##   ##       ##       ##    ##        **************
  //                #####       ##   ##    ##    #######       ##        #######        **************
  //                ##         ##           ##   ##            ##             ##        **************
  //                #######   ##             ##  ##            ##        ######         **************
   // ================================================================================================
 // ==================================================================================================

  str:=' '+Edit4.Text + ' ';
  centr2:=nil;


  if (Pos('%',str)<>0) or (Pos('IGNORE',str)<>0) or (Pos('?',str)<>0) or (Edit4.Text='') then goto 103;
  if (Pos('@',str)<>0) or (Pos('*',str)<>0) then begin
  SetLength(empty,1);
  empty[0]:=0;
  goto 103;
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



  j:=0;                          //ЦЕнтры все те же, они уже определены в секции HIGH
  {
  //Определим типы центров, которые реально присутствуют в нашей системе
  if atom_store<>nil then begin    //случай, когда у нас GJF
   for i:=0 to Length(atom_store)-1 do
   if atom_store[i]<>'' then begin
   if i=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
   end
   else begin
    if Length(centr0)=0 then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
   end
   else begin
     were:=false;
    for t:=0 to Length(centr0)-1 do
    if OnlyLet(atom_store[i])=centr0[t] then were:=true;
    if were=false then begin
    SetLength(centr0,Length(centr0)+1);
    centr0[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
    end;
    end;
    end;
   end;
   end;   }
                                          //centr0 - типы центров (Mg,C,Br...)


  if (Length(centr2)=1) and (centr2[0]='') then begin
   centr2:=nil;
   goto 403;
   end;

    if centr2[length(centr2)-1]='' then SetLength(centr2,length(centr2)-1);    //////// !!!!!!!!!

   were:=False;
  for i:=0 to Length(centr2)-1 do begin
  if (i>0) and (were=False) then begin
   ShowMessage('EMPTY LAYER: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;
  were:=false;
  for j:=0 to Length(centr0)-1 do
  if centr2[i]=centr0[j] then  were:=True;
  end;
  if  were=False then begin
   ShowMessage('EMPTY LAYER: Один или несколько из указанных атомных центров не обнаружен в прочтенном файле.'+#13 +'Внимательно проверьте типы указанных атомных центров!');
   goto 0;
  end;



   //Определим центры, которые есть в совокупности


    j:=0;
    {        //Это тоже было сделано в секции HIGH
                                         //centr1 - все центры без номеров (Mg,Mg,Mg,Mg,...,Mg,Mg,Br,C,C,C,H,...)
  //Определим центры, которые реально присутствуют в нашей системе
  if atom_store<>nil then begin    //случай, когда у нас GJF
   for i:=0 to Length(atom_store)-1 do
   if atom_store[i]<>'' then begin
    SetLength(centr1,Length(centr1)+1);
    centr1[j]:=OnlyLet(atom_store[i]);
    j:=j+1;
    end;
    end;
    }





  str5:='';
  // Сравниваем центры, которые реально есть в системе с затребованными и получаем номера затребованных
  for i:=0 to Length(centr1)-1 do
  for j:=0 to Length(centr2)-1 do
  if centr1[i]=centr2[j] then  str5:=str5+' '+ IntToStr(i+1);

  str5:=str5+' ';


  str:=Copy(str,1,Pos('(',str)-1)+str5+Copy(str,Pos(')',str)+1,Length(str));




  403:



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
 21000:
 for p:=1 to Length(str) do begin
   if (Copy(str,p+x,1)=' ') or (Copy(str,p+x,1)=',') or (Copy(str,p+x,1)=';') or (Copy(str,p+x,1)='-') then
   cn1:=cn1+1
   else Break;
 end;
 if (pos('-',Copy(str,p+x-cn1,cn1))<>0) and (cn1<>0) then begin
 SetLength(at_in_empty,t+1);
 at_in_empty[t]:=-1;
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
  SetLength(at_in_empty,t+1);
  if (Pos('-',Copy(str,x+1,cn2))=0) and (Copy(str,x+1,cn2)<>'') then at_in_empty[t]:=StrToInt(Copy(str,x+1,cn2))
  else if Copy(str,x+1,cn2)<>'' then at_in_empty[t]:=-1;
  x:=x+cn2;
  t:=t+1;
  cn1:=0;
  if x<Length(str) then goto 21000;
 //================================================================================================
  if at_in_empty[Length(at_in_empty)-1]=0 then SetLength(at_in_empty,Length(at_in_empty)-1);

 //Получили совокупность групп и атомов для отображения


  if (Length(at_in_empty)=1) and ((at_in_empty[0]=-1)) then at_in_empty:=nil;

  // Теперь тире заменяем на реальные значения из диапазоне


  //Атомы:

  i:=0;
  k:=0;
  while i<length(at_in_empty) do begin


  if i>1 then goto 35000;
  if length(at_in_empty)>1 then begin
   if (at_in_empty[0]=-1) and (at_in_empty[1]<>-1) then begin
    SetLength(empty,at_in_empty[1]);
    for j:=0 to at_in_empty[1]-1 do
    empty[j]:=j+1;
    i:=i+2;
    k :=length(empty)-1;
    end;
  end;

  if i>=length(at_in_empty) then Break;

  35000:
  if length(at_in_empty)-i>=3 then begin
   if (at_in_empty[i]<>-1) and (at_in_empty[i+1]=-1) and (at_in_empty[i+2]<>-1) then begin
    if length(empty)=0 then t:=0 else t:=1;
    SetLength(empty, length(empty)+abs(at_in_empty[i+2]-at_in_empty[i])+1);
    for j:=0 to abs(at_in_empty[i+2]-at_in_empty[i]) do begin
     if at_in_empty[i+2]>at_in_empty[i] then empty[k+j+t]:=at_in_empty[i]+j;
     if at_in_empty[i+2]<at_in_empty[i] then empty[k+j+t]:=at_in_empty[i]-j;
     if at_in_empty[i+2]=at_in_empty[i] then empty[k+j+t]:=at_in_empty[i];
    end;
    i:=i+3;
    k:=length(empty)-1;
   end;
  end;

   if i>=length(at_in_empty) then Break;

  if length(at_in_empty)-i>=2 then begin
   if (at_in_empty[i]=-1) and (at_in_empty[i+1]=-1) then begin
    ShowMessage('EMPTY LAYER: Проверьте введенные данные, возможна ошибка!');
    goto 0;
   end;
   if (at_in_empty[i]<>-1) and (at_in_empty[i+1]<>-1) then begin
    SetLength(empty,length(empty)+2);
    empty[length(empty)-2]:=at_in_empty[i];
    empty[length(empty)-1]:=at_in_empty[i+1];
    i:=i+2;
    k:=length(empty)-1;
   end;
  end;

  if i>=length(at_in_empty) then Break;

  if i=length(at_in_empty)-2 then begin
   if (at_in_empty[length(at_in_empty)-1]=-1) and (at_in_empty[length(at_in_empty)-2]<>-1) then begin
   if length(empty)=0 then t:=0 else t:=1;
   if length(empty)+nomer_atoma-popr1-at_in_empty[length(at_in_empty)-2]+1<=0 then begin
   ShowMessage('EMPTY LAYER: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
    SetLength(empty,length(empty)+nomer_atoma-popr1-at_in_empty[length(at_in_empty)-2]+1);
    for j:=0 to nomer_atoma-popr1-at_in_empty[length(at_in_empty)-2] do
    empty[k+j+t]:=at_in_empty[length(at_in_empty)-2]+j;
    i:=i+2;
    k:=length(empty)-1;
   end;
  end;

  if i>=length(at_in_empty) then Break;

  if (length(at_in_empty)=1) and (at_in_empty[0]<>-1) then begin
   SetLength(empty,1);
   empty[0]:=at_in_empty[0];
   i:=i+1;
  end;

  if i>=length(at_in_empty) then Break;

  if (length(at_in_empty)-i=1) and (at_in_empty[length(at_in_empty)-1]<>-1) then begin
   Setlength(empty,length(empty)+1);
   empty[length(empty)-1]:=at_in_empty[i];
   i:=i+1;
  end;

  if i>=length(at_in_empty) then Break;

  g:=0;
  if (length(at_in_empty)-i=2) and (at_in_empty[length(at_in_empty)-1]=-1) then begin
    if length(empty)+nomer_atoma-popr1-at_in_empty[length(at_in_empty)-2]+1<=0 then begin
   ShowMessage('EMPTY LAYER: Проверьте число атомов в поле. Максимальное число атомов не должно превышать ' + IntToStr(nomer_atoma-popr1));
   goto 0;
   end;
   36000:  SetLength(empty,length(empty)+nomer_atoma-popr1-at_in_empty[length(at_in_empty)-2]+1);
   for j:=0 to nomer_atoma-popr1-at_in_empty[length(at_in_empty)-2] do
   empty[k+j+1-g]:=at_in_empty[i-1]+j+1-g;
   k:=length(empty)-1;
   i:=i+1;
  end;

  if i>=length(at_in_empty) then Break;

  if i>1 then begin
  if Length(at_in_empty)-i>=2 then begin
  if (at_in_empty[i]=-1) and (at_in_empty[i+1]<>-1) then begin
  i:=i-1;
  SetLength(empty,Length(empty)-1);
  k:=Length(empty)-1;
  goto 35000;
  end;
  end;

  if Length(at_in_empty)-i=1 then begin
    if at_in_empty[i]=-1 then begin
     SetLength(empty,Length(empty)-1);
     g:=1;
    //  k:=Length(empty)-1;
      goto 36000;
    end;
  end;
  end;
end;





  if Length(empty)>1 then begin                 //  ########################################
 for i:=0 to Length(empty)-1 do                 //  ########################################
 for j:=0 to Length(empty)-2 do                 //  ########################################
 if  empty[j]>empty[j+1] then begin             //  ######
  x := empty[j+1];                              //  ######   Sorting of array  empty
  empty[j+1] := empty[j];                       //  ######
  empty[j]:=x;                                  //  ########################################
 end;                                           //  ########################################
 end;                                           //  ########################################

 //Отсортировали, теперь надо исключить повторения элементов


 //Атомы

 s:=0;
 tmp_r:=nil;
 SetLength(tmp_r,Length(empty));
 SetLength(empty,Length(empty)+1);
 empty[Length(empty)-1]:=-1;
 if Length(empty)>1 then begin
  for i:=0 to Length(empty)-2 do
  if empty[i+1]<>empty[i] then  begin
    s:=s+1;
  tmp_r[i]:=empty[i];
  end;
 end;



 SetLength(empty,s);
 j:=0;
 for i:=0 to Length(tmp_r)-1 do begin
 if tmp_r[i]<>0 then begin  empty[j]:=tmp_r[i];
 j:=j+1;
 end;
 end;


 if empty<>nil then begin
 if empty[Length(empty)-1]>nomer_atoma-popr1 then begin
   ShowMessage('EMPTY LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;


  if empty<>nil then begin
   if MaxIntValue(empty)>nomer_atoma-popr1 then begin
   ShowMessage('EMPTY LAYER: Затребованное число атомов превышает реально существующее в системе!'+#13+'В системе обнаружено '+ IntToStr(nomer_atoma-popr1)+' атомов');
   goto 0;
 end;
 end;






 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 /////////////////      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 /////////////////      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 /////////////////      Теперь передаем номера атомов в массив Layers
 /////////////////      номера атомов - номера элементов массива
 /////////////////////////////////////////////////////////////////////////////////////////////////////////
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################
 //#######################################################################################################


 103:

 if (high=nil) and (middle=nil) and (low=nil) and (empty=nil) then goto 0;
 if (high<>nil) and (middle<>nil) then begin
 if ((high[0]=0) and (length(high)=1)) and ((middle[0]=0) and (length(middle)=1)) then begin
 showmessage('ERROR! Проигнорируйте секцию MIDDLE (символ ?) или заполните поле HIGH!');
 goto 0;
 end;
 end;
 if (high<>nil) and (low<>nil) then begin
 if ((high[0]=0) and (length(high)=1)) and ((low[0]=0) and (length(low)=1)) then begin
 showmessage('ERROR! Проигнорируйте секцию LOW (символ ?) или заполните поле HIGH!');
 goto 0;
 end;
 end;
 if (high<>nil) and (empty<>nil) then begin
 if ((high[0]=0) and (length(high)=1)) and ((empty[0]=0) and (length(empty)=1)) then begin
 showmessage('ERROR! Проигнорируйте секцию EMPTY (символ ?) или заполните поле HIGH!');
 goto 0;
 end;
 end;
 if (low<>nil) and (middle<>nil) then begin
 if ((middle[0]=0) and (length(middle)=1)) and ((low[0]=0) and (length(low)=1)) then begin
 showmessage('ERROR! MIDDLE-LOW conflict: Заполните одну из секций (или обе) или проигнорируйте (символ ?)');
 goto 0;
 end;
 end;
 if (empty<>nil) and (middle<>nil) then begin
 if ((middle[0]=0) and (length(middle)=1)) and ((empty[0]=0) and (length(empty)=1)) then begin
 showmessage('ERROR! MIDDLE-EMPTY conflict: Заполните одну из секций (или обе) или проигнорируйте (символ ?)');
 goto 0;
 end;
 end;
 if (low<>nil) and (empty<>nil) then begin
 if ((empty[0]=0) and (length(empty)=1)) and ((low[0]=0) and (length(low)=1)) then begin
 showmessage('ERROR! LOW-EMPTY conflict: Заполните одну из секций (или обе) или проигнорируйте (символ ?)');
 goto 0;
 end;
 end;
 if (length(high)>0) and (middle=nil) and (low=nil) and (empty=nil) then goto 0;

  if (high<>nil) and (low<>nil) then begin
  if (high[0]<>0) and (low[0]<>0) then begin
  for i:=0 to length(high)-1 do
  for j:=0 to length(low)-1 do
  if high[i]=low[j] then begin
  showmessage('ERROR! HIGH-LOW conflict: К разным слоям приписаны одни и те же центры');
  goto 0;
  end;
  end;
  end;

  if (high<>nil) and (middle<>nil) then begin
  if (high[0]<>0) and (middle[0]<>0) then begin
  for i:=0 to length(high)-1 do
  for j:=0 to length(middle)-1 do
  if high[i]=middle[j] then begin
  showmessage('ERROR! HIGH-MIDDLE conflict: К разным слоям приписаны одни и те же центры');
  goto 0;
  end;
  end;
  end;

  if (high<>nil) and (empty<>nil) then begin
  if (high[0]<>0) and (empty[0]<>0) then begin
  for i:=0 to length(high)-1 do
  for j:=0 to length(empty)-1 do
  if high[i]=empty[j] then begin
  showmessage('ERROR! HIGH-EMPTY conflict: К разным слоям приписаны одни и те же центры');
  goto 0;
  end;
  end;
  end;

  if (middle<>nil) and (low<>nil) then begin
  if (middle[0]<>0) and (low[0]<>0) then begin
  for i:=0 to length(middle)-1 do
  for j:=0 to length(low)-1 do
  if middle[i]=low[j] then begin
  showmessage('ERROR! MIDDLE-LOW conflict: К разным слоям приписаны одни и те же центры');
  goto 0;
  end;
  end;
  end;

  if (middle<>nil) and (empty<>nil) then begin
  if (middle[0]<>0) and (empty[0]<>0) then begin
  for i:=0 to length(middle)-1 do
  for j:=0 to length(empty)-1 do
  if middle[i]=empty[j] then begin
  showmessage('ERROR! MIDDLE-EMPTY conflict: К разным слоям приписаны одни и те же центры');
  goto 0;
  end;
  end;
  end;

  if (low<>nil) and (empty<>nil) then begin
  if (low[0]<>0) and (empty[0]<>0) then begin
  for i:=0 to length(low)-1 do
  for j:=0 to length(empty)-1 do
  if low[i]=empty[j] then begin
  showmessage('ERROR! LOW-EMPTY conflict: К разным слоям приписаны одни и те же центры');
  goto 0;
  end;
  end;
  end;


  if (length(high)+length(middle)+length(low)+length(empty))<nomer_atoma-popr1 then begin
   if high<>nil then if high[0]=0 then goto 150;
   if middle<>nil then if middle[0]=0 then goto 150;
   if low<>nil then if low[0]=0 then goto 150;
   if empty<>nil then if empty[0]=0 then goto 150;
   showmessage('WARNING! Некоторые атомы не приписаны ни к одному слою!');
   goto 0;
  end;

  150:

  if high<>nil then begin
    if high[0]=0 then begin
      if (length(middle)+length(low)+length(empty))=nomer_atoma-popr1 then begin
       showmessage('ERROR! В слой HIGH не попало не одного атома!');
       goto 0;
      end;
    end;
  end;

  if middle<>nil then begin
    if middle[0]=0 then begin
      if (length(high)+length(low)+length(empty))=nomer_atoma-popr1 then begin
       showmessage('WARNING! В слой MIDDLE не попало не одного атома!');
      end;
    end;
  end;

  if low<>nil then begin
    if low[0]=0 then begin
      if (length(high)+length(middle)+length(empty))=nomer_atoma-popr1 then begin
       showmessage('WARNING! В слой LOW не попало не одного атома!');
      end;
    end;
  end;

  if empty<>nil then begin
    if empty[0]=0 then begin
      if (length(high)+length(low)+length(middle))=nomer_atoma-popr1 then begin
       showmessage('WARNING! В слой EMPTY не попало не одного атома!');
      end;
    end;
  end;



  if high<>nil then begin
    if high[0]=0 then begin
    if (length(empty)+length(middle)+length(low))>nomer_atoma-popr1   then begin
     showmessage('WARNING! Указаны атомы не обнаруженные в прочитанной системе!');
     goto 0;
     end;
    end;
  end;

  if middle<>nil then begin
    if middle[0]=0 then begin
    if (length(empty)+length(high)+length(low))>nomer_atoma-popr1   then begin
     showmessage('WARNING! Указаны атомы не обнаруженные в прочитанной системе!');
     goto 0;
     end;
    end;
  end;

  if low<>nil then begin
    if low[0]=0 then begin
    if (length(empty)+length(high)+length(middle))>nomer_atoma-popr1   then begin
     showmessage('WARNING! Указаны атомы не обнаруженные в прочитанной системе!');
     goto 0;
     end;
    end;
  end;

  if empty<>nil then begin
    if empty[0]=0 then begin
    if (length(low)+length(high)+length(middle))>nomer_atoma-popr1   then begin
     showmessage('WARNING! Указаны атомы не обнаруженные в прочитанной системе!');
     goto 0;
     end;
    end;
  end;



  /////////////////////////////////////////////////////////////////////////////////////
  /////////////////////                                            ////////////////////
  /////////////////////                                            ////////////////////
  /////////////////////   ТЕПЕРЬ ЗАПОЛНЯЕМ ОСНОВНОЙ МАССИВ LAYERS  ////////////////////
  /////////////////////                                            ////////////////////
  /////////////////////                                            ////////////////////
  /////////////////////////////////////////////////////////////////////////////////////

  if atom_store<>nil then SetLength(Layers,nomer_atoma-1)
  else if atomoutel<>nil then Setlength(Layers,nomer_atoma);

  if high<>nil then begin
  if high[0]<>0 then begin
  for i:=0 to length(high)-1 do
  Layers[high[i]-1]:='high';
  end;
  end;

  if middle<>nil then begin
  if middle[0]<>0 then begin
  for i:=0 to length(middle)-1 do
  Layers[middle[i]-1]:='middle';
  end;
  end;

  if low<>nil then begin
  if low[0]<>0 then begin
  for i:=0 to length(low)-1 do
  Layers[low[i]-1]:='low';
  end;
  end;

  if empty<>nil then begin
  if empty[0]<>0 then begin
  for i:=0 to length(empty)-1 do
  Layers[empty[i]-1]:='empty';
  end;
  end;

  /// Заполняем то, что приписано как оставшееся

  if high<>nil then begin
  if (high[0]=0) and (length(high)=1) then begin
  for i:=0 to length(Layers) do
  if Layers[i]='' then Layers[i]:='high';
  end;
  end;

  if middle<>nil then begin
  if (middle[0]=0) and (length(middle)=1) then begin
  for i:=0 to length(Layers) do
  if Layers[i]='' then Layers[i]:='middle';
  end;
  end;

  if low<>nil then begin
  if (low[0]=0) and (length(low)=1) then begin
  for i:=0 to length(Layers) do
  if Layers[i]='' then Layers[i]:='low';
  end;
  end;

  if empty<>nil then begin
  if (empty[0]=0) and (length(empty)=1) then begin
  for i:=0 to length(Layers) do
  if Layers[i]='' then Layers[i]:='empty';
  end;
  end;



 end;

 Form36.PaintBox1.Invalidate;
 0:
end;

procedure TForm43.BitBtn3Click(Sender: TObject);
begin
Layers:=nil;
Form36.PaintBox1.Repaint;
end;

procedure TForm43.BitBtn2Click(Sender: TObject);
begin
Form43.Close;
end;

end.
