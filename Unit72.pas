unit Unit72;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm72 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListView1: TListView;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form72: TForm72;
  Porog: Real;

   type ArrayOfString = array of String;


implementation

uses Unit1,Unit3,Unit36;

{$R *.dfm}

{
//Функция сравнения двух массивов координат для выявления "есть или нет" того или иного элемента симметрии
function ComparXYZ(arrX1: array of Real; var arrX2: array of Real; arrY1: array of Real;
                   var arrY2: array of Real; arrZ1: array of Real; var arrZ2: array of Real) : Boolean;
var i,j: Integer;
q: Real;    // Промежуточная переменная для сотртировки массивов
A1: Boolean;  // Проверяет, выполняются ли условия
Prg: Real; // Порог точности определения симметрии
label 0;
begin
A1:=False;
Prg:=0.001;
// Идея: отсортировать массивы координат до и после преобразования по возрастанию
// и проверить их по номерам, по идее д.б. совпадение в пределах точности, т.е. величины Prg
for i:=0 to Length(arrX1)-1 do
for j:=0 to Length(arrX1)-2 do
if arrX1[j] > arrX1[j+1] then begin
q:=arrX1[j+1];
arrX1[j+1]:= arrX1[j];
arrX1[j]:=q;                // Сортировка массива по возрастанию
end;
for i:=0 to Length(arrX2)-1 do
for j:=0 to Length(arrX2)-2 do
if arrX2[j] > arrX2[j+1] then begin
q:=arrX2[j+1];
arrX2[j+1]:= arrX2[j];
arrX2[j]:=q;                // Сортировка массива по возрастанию
end;
for i:=0 to Length(arrY1)-1 do
for j:=0 to Length(arrY1)-2 do
if arrY1[j] > arrY1[j+1] then begin
q:=arrY1[j+1];
arrY1[j+1]:= arrY1[j];
arrY1[j]:=q;                // Сортировка массива по возрастанию
end;
for i:=0 to Length(arrY2)-1 do
for j:=0 to Length(arrY2)-2 do
if arrY2[j] > arrY2[j+1] then begin
q:=arrY2[j+1];
arrY2[j+1]:= arrY2[j];
arrY2[j]:=q;                // Сортировка массива по возрастанию
end;
for i:=0 to Length(arrZ1)-1 do
for j:=0 to Length(arrZ1)-2 do
if arrZ1[j] > arrZ1[j+1] then begin
q:=arrZ1[j+1];
arrZ1[j+1]:= arrZ1[j];
arrZ1[j]:=q;                // Сортировка массива по возрастанию
end;
for i:=0 to Length(arrZ2)-1 do
for j:=0 to Length(arrZ2)-2 do
if arrZ2[j] > arrZ2[j+1] then begin
q:=arrZ2[j+1];
arrZ2[j+1]:= arrZ2[j];
arrZ2[j]:=q;                // Сортировка массива по возрастанию
end;
for i:=0 to Length(arrX1)-1 do begin
if ABS(arrX1[i]-arrX2[i])<=Prg then A1:=True else begin
A1:=False;
goto 0;
end;
end;
for i:=0 to Length(arrY1)-1 do begin
if ABS(arrY1[i]-arrY2[i])<=Prg then A1:=True else begin
A1:=False;
goto 0;
end;
end;
for i:=0 to Length(arrZ1)-1 do begin
if ABS(arrZ1[i]-arrZ2[i])<=Prg then A1:=True else begin
A1:=False;
goto 0;
end;
end;
0: Result:=A1;
end;

}

function CutNum(arr: array of string): ArrayOfString;  // Функция их массива центров {C1, C2, Mg3,...} создает массив {C,C,Mg...} для идентификации точечных групп
var i,j,k: Integer;
begin
Result:=nil;
for i:=0 to Length(arr)-1 do begin
SetLength(Result,Length(Result)+1);
if arr[i]='' then Result[i]:='';
if arr[i]<>'' then begin
for j:=0 to Length(arr[i]) do
if TryStrToInt(Copy(arr[i],j,1),k)=True then Break;
Result[i]:=Copy(arr[i],1,j-1);
end;
end;
end;








function GetNum(arr: array of string): ArrayOfString;  // Переводим ('','C', 'H',...,) в ('','6','1',...)
var i,j: Integer;
begin
SetLength(Result,1);
Result[0]:='';
for i:=0 to Length(atom_store)-1 do
for j:=0 to Length(center)-1 do
if (AnsiUpperCase(CutNum(atom_store)[i])= AnsiUpperCase(center[j])) and (atom_store[i]<>'') then begin
SetLength(Result,Length(Result)+1);
Result[Length(Result)-1]:=num[j];
end;
SetLength(Result,Length(Result)+1);
Result[Length(Result)-1]:='';
end;





function ComparXYZ(arrX1: array of Real; var arrX2: array of Real; arrY1: array of Real;
                   var arrY2: array of Real; arrZ1: array of Real; var arrZ2: array of Real) : Boolean;
var i,j,t1,t2: Integer;
prg: Real;
A: array of Boolean;
begin
A:=nil;
prg:=Porog;
for i:=0 to Length(arrX1)-1 do begin
for j:=0 to Length(arrX2)-1 do begin
if atomoutel<>nil then begin
if (Abs(arrX1[i]-arrX2[j])<=prg) and (atomoutel[Length(atomoutel)-1,i+1]=atomoutel[Length(atomoutel)-1,j+1]) then begin
t1:=i;
t2:=j;
if Abs(arrY1[t1]-arrY2[t2])<=prg then begin
if Abs(arrZ1[t1]-arrZ2[t2])<=prg then begin
SetLength(A,Length(A)+1);
//ShowMessage(FloatToStr(Abs(arrX1[i]-arrX2[j]))+'   '+FloatToStr(Abs(arrY1[t1]-arrY2[t2]))+'  '+FloatToStr(Abs(arrZ1[t1]-arrZ2[t2])));
end;
end;
end;
end
else begin
if (Abs(arrX1[i]-arrX2[j])<=prg) and (CutNum(atom_store)[i+1]=CutNum(atom_store)[j+1]) then begin
t1:=i;
t2:=j;
if Abs(arrY1[t1]-arrY2[t2])<=prg then begin
if Abs(arrZ1[t1]-arrZ2[t2])<=prg then begin
SetLength(A,Length(A)+1);
//ShowMessage(FloatToStr(Abs(arrX1[i]-arrX2[j]))+'   '+FloatToStr(Abs(arrY1[t1]-arrY2[t2]))+'  '+FloatToStr(Abs(arrZ1[t1]-arrZ2[t2])));
end;
end;
end;
end;
end;
end;
if Length(A)=Length(arrX1) then Result:=True else Result:=False;
end;




function PG(ar1: array of string; ar2: array of string; ar3: array of string; ar4: array of string): string;
var i,n: Integer;
label 0;
begin
if (Length(ar1)=0) and (Length(ar2)=0) and (Length(ar3)=0) then Result:='C1';
if (Length(ar1)=0) and (Length(ar2)=0) and (Length(ar3)=1) then begin
if ar3[0]='i' then Result:='Ci' else Result:='Cs';
end;
if (Length(ar1)=1) and (Length(ar2)=0) and (Length(ar3)=0) then Result:=Copy(ar1[0],1,Length(ar1[0])-1);
if (Length(ar1)>1) and (Length(ar2)=0) and (Length(ar3)=0) then
begin
Result:='C'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2);
end;

//=======================Cnv=========================================================
if (Length(ar1)>=1) and (Length(ar2)=0) and (Length(ar3)>0) then
begin
if ar3[0]<>'i' then begin
if Length(ar1)>=50 then Result:='C'+'(inf)'+'v' else Result:='C'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'v';
end;
end;

//======================Cnh=========================================================
if (Length(ar1)>=1) and (Length(ar2)=0) and (Length(ar3)=2) then
begin
if ar3[0]='i' then Result:='C'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'h';
end;
if (Length(ar1)>=1) and (Length(ar2)>=1) and (Length(ar3)=1) then
begin
Result:='C'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'h';
end;
if (Length(ar1)>=1) and (Length(ar2)>=1) and (Length(ar3)=2) then
begin
if (ar3[0]='i') and (Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2)=Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) then Result:='C'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'h';
end;

//========================Dn=========================================================
if (Length(ar1)>2) and (Length(ar2)=0) and (Length(ar3)=0) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)=Copy(ar1[1],2,length(ar1[1])-2)) and (Copy(ar1[1],2,length(ar1[1])-2)=Copy(ar1[2],2,length(ar1[2])-2)) and (Copy(ar1[0],2,length(ar1[0])-2)='2') then  Result:='D'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2);
end;
if (Length(ar1)>1) and (Length(ar2)=0) and (Length(ar3)=0) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)='2') and (Copy(ar1[0],2,length(ar1[0])-2)<>Copy(ar1[1],2,length(ar1[1])-2)) and (StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2  <> Round(StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2)) then  Result:='D'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2);
end;


//=======================Dnh=========================================================
if (Length(ar1)>2) and (Length(ar2)>=0) and (Length(ar3)>=2) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)=Copy(ar1[1],2,length(ar1[1])-2)) and (Copy(ar1[1],2,length(ar1[1])-2)=Copy(ar1[2],2,length(ar1[2])-2)) and (Copy(ar1[0],2,length(ar1[0])-2)='2') and (StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2  = Round(StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2)) and (ar3[0]='i') then  Result:='D'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'h';
end;
if (Length(ar1)>1) and (Length(ar2)>=0) and (Length(ar3)>=2) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)='2') and (Copy(ar1[0],2,length(ar1[0])-2)<>Copy(ar1[1],2,length(ar1[1])-2)) and (StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2  <> Round(StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2)) and (ar3[0]<>'i') and (length(ar2)>0) and (Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2)=Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) then  Result:='D'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'h';
end;
if (Length(ar1)>50) and (Length(ar2)>50) and (Length(ar3)>2) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)=Copy(ar1[1],2,length(ar1[1])-2)) and (Copy(ar1[1],2,length(ar1[1])-2)=Copy(ar1[2],2,length(ar1[2])-2)) and (Copy(ar1[0],2,length(ar1[0])-2)='2') and (StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2  = Round(StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2)) and (ar3[0]='i') then  Result:='D'+'(inf)'+'h';
end;

//=======================Dnd=========================================================
if (Length(ar1)>1) and (Length(ar2)>=1) and (Length(ar3)=0) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)=Copy(ar1[1],2,length(ar1[1])-2)) and (Copy(ar1[1],2,length(ar1[1])-2)=Copy(ar1[2],2,length(ar1[2])-2)) and (Copy(ar1[0],2,length(ar1[0])-2)='2') and  (StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2  = Round(StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2))  and (  StrToInt(Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2))=2*StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) )  then  Result:='D'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'d';
end;
if (Length(ar1)>1) and (Length(ar2)>=1) and (Length(ar3)=2) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)='2') and (Copy(ar1[0],2,length(ar1[0])-2)<>Copy(ar1[1],2,length(ar1[1])-2)) and (StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2  <> Round(StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2)) and (ar3[0]='i') and  (  StrToInt(Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2))=2*StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) )  then  Result:='D'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'d';
end;
if (Length(ar1)>0) and (Length(ar2)>=0) and (Length(ar3)=0) then begin
if (  StrToInt(Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2))=2*StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) )  then  Result:='D'+Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)+'d';
end;

//===================================Sn=================================================
if (Length(ar1)>=1) and (Length(ar2)>=1) and (Length(ar3)=0) then begin
if (  StrToInt(Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2))=2*StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) )  and  (Copy(ar1[0],2,length(ar1[0])-2)<>Copy(ar1[1],2,length(ar1[1])-2)) then Result:='S'+Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2);
end;
if (Length(ar1)>=1) and (Length(ar2)>=1) and (Length(ar3)=1) then begin
if (  StrToInt(Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2))=2*StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) ) and   (StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2  <> Round(StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) / 2))  and  (ar3[0]='i') then Result:='S'+Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2);
end;

//===================================Td=================================================
if (Length(ar1)=3) and (Length(ar2)>=2) and (Length(ar3)=0) then begin
 if (Copy(ar1[0],2,length(ar1[0])-2)=Copy(ar1[1],2,length(ar1[1])-2)) and (Copy(ar1[1],2,length(ar1[1])-2)=Copy(ar1[2],2,length(ar1[2])-2)) and (Copy(ar1[0],2,length(ar1[0])-2)='2')   and (  StrToInt(Copy(ar2[Length(ar2)-1],2,length(ar2[Length(ar2)-1])-2))=2*StrToInt(Copy(ar1[Length(ar1)-1],2,length(ar1[Length(ar1)-1])-2)) ) and        (Copy(ar2[0],2,length(ar2[0])-2)=Copy(ar2[1],2,length(ar2[1])-2)) and (Copy(ar2[1],2,length(ar2[1])-2)=Copy(ar2[2],2,length(ar2[2])-2)) and (Copy(ar2[0],2,length(ar2[0])-2)='4')  then  Result:='Td' ;
end;

//===================================Oh=================================================
if (Length(ar1)>3) and (Length(ar2)>=2) and (Length(ar3)>2) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)=Copy(ar1[1],2,length(ar1[1])-2)) and (Copy(ar1[1],2,length(ar1[1])-2)=Copy(ar1[2],2,length(ar1[2])-2)) and (Copy(ar1[0],2,length(ar1[0])-2)='2')  and (Copy(ar1[length(ar1)-1],2,length(ar1[length(ar1)-1])-2)='4')  and (Copy(ar2[0],2,length(ar2[0])-2)=Copy(ar2[1],2,length(ar2[1])-2)) and (Copy(ar2[1],2,length(ar2[1])-2)=Copy(ar2[2],2,length(ar2[2])-2)) and (Copy(ar2[0],2,length(ar2[0])-2)='4')  and (ar3[0]='i') then  Result:='Oh';
end;

//==================================Th=================================================
if Result='D2h' then begin
for i:=0 to Length(ar4)-1 do
if (ar4[i]='C3x') or (ar4[i]='C3y') or (ar4[i]='C3z') then Result:='Th';
end;

//==================================Ih=================================================
if Result='D5d' then begin
for i:=0 to Length(ar4)-1 do
if (ar4[i]='C3x') or (ar4[i]='C3y') or (ar4[i]='C3z') then Result:='Ih';
end;

//==================================Kh=================================================
if (Length(ar1)>50) and (Length(ar2)>50) and (Length(ar3)=4) then begin
 Result:='Kh';
end;

//================================T====================================================
if Result='D2' then begin
for i:=0 to Length(ar4)-1 do
if (ar4[i]='C3x') or (ar4[i]='C3y') or (ar4[i]='C3z') then Result:='T';
end;

//===============================I=====================================================
if (Length(ar1)=2) and (Length(ar2)=0) and (Length(ar3)=0) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)='2') and (Copy(ar1[1],2,length(ar1[1])-2)='5') then Result:='I';
end;

//===============================O=====================================================
if (Length(ar1)>4) and (Length(ar2)=0) and (Length(ar3)=0) then begin
if (Copy(ar1[0],2,length(ar1[0])-2)=Copy(ar1[1],2,length(ar1[1])-2)) and (Copy(ar1[1],2,length(ar1[1])-2)=Copy(ar1[2],2,length(ar1[2])-2)) and (Copy(ar1[0],2,length(ar1[0])-2)='2')  and (Copy(ar1[length(ar1)-1],2,length(ar1[length(ar1)-1])-2)='4') then Result:='O';
end;

end;



function TimeOfCalc(str: WideString): WideString;
var i: Integer;
st1,st2,st3: WideString;
d,h,m,s: string;
begin
for i:=0 to Length(str) do
if Copy(str,i,1)=':' then Break;
st1:=Copy(str,i+1,Length(str));
for i:=0 to Length(st1) do
if Copy(st1,i,1)<>' ' then Break;
st2:=Copy(st1,i,Length(st1));
for i:=0 to Length(st2) do
if Copy(st2,i,1)=' ' then Break;
d:=Copy(st2,1,i-1);

st1:=Copy(st2,Pos('days',st2)+5,Length(st2));
for i:=0 to Length(st1) do
if Copy(st1,i,1)<>' ' then Break;
st2:=Copy(st1,i,Length(st1));
for i:=0 to Length(st2) do
if Copy(st2,i,1)=' ' then Break;
h:=Copy(st2,1,i-1);

st1:=Copy(st2,Pos('hours',st2)+6,Length(st2));
for i:=0 to Length(st1) do
if Copy(st1,i,1)<>' ' then Break;
st2:=Copy(st1,i,Length(st1));
for i:=0 to Length(st2) do
if Copy(st2,i,1)=' ' then Break;
m:=Copy(st2,1,i-1);

st1:=Copy(st2,Pos('minutes',st2)+8,Length(st2));
for i:=0 to Length(st1) do
if Copy(st1,i,1)<>' ' then Break;
st2:=Copy(st1,i,Length(st1));
for i:=0 to Length(st2) do
if Copy(st2,i,1)=' ' then Break;
s:=Copy(st2,1,i-1);
if (d<>'') and (h<>'') and (m<>'') and (s<>'') then Result:=d+' '+'дн., ' + h + ' час., '+ m +' мин., ' + s + ' сек.'
else Result:='';
end;





procedure TForm72.FormShow(Sender: TObject);
var itm: TListItem;
met, bas,zs,ms,nel,molm,bf,dm,te: String;
subs1,subs2,subs3,str,termination: String;  // переменные-подстроки для поиска нужного куска в строках
timecalc: WideString;
i,j,q,s,k: Integer;
jf,x_min_s,x_max_s,y_min_s,y_max_s,z_min_s,z_max_s,min_abs_s,max_abs_s,xinv_s,yinv_s,zinv_s: Real;
brutto,elsymm,elsyc,elsys,elsyig,elsyoth: array of String;
massiv: array of Integer;
xout_symm,yout_symm,zout_symm,xout_symm_done,yout_symm_done,zout_symm_done,xout_symm_done1,yout_symm_done1,zout_symm_done1: array of Real;
x_symm,y_symm,z_symm,x_symm_done,y_symm_done,z_symm_done,x_symm_done1,y_symm_done1,z_symm_done1: array of Real;
f: TextFile;
chsy,th: Boolean;
label 0,1,10;
begin
ListView1.Clear;
DecimalSeparator:='.';
if (dial=True) and (Form1.OpenDialog1.FilterIndex=2) then begin // Читается один файл за раз


itm:=ListView1.Items.Add;
itm.Caption:='Тип файла';
itm.SubItems.Append('*.log');




itm:=ListView1.Items.Add;
itm.Caption:='Метод расчета';

if Pos('/',src_route[0])<>0 then begin
//for i:=1 to length(src_route) do
//if Copy(src_route,i,1)='/' then Break;
subs1:=Copy(src_route[0],1,Pos('/',src_route[0])-1);
for i:=0 to length(subs1) do
if Copy(subs1,length(subs1)-i,1)<>' ' then Break;
subs2:=Copy(subs1,1,length(subs1)-i);
for i:=0 to length(subs2) do
if (Copy(subs2,length(subs2)-i,1)=' ') or (Copy(subs2,length(subs2)-i,1)='#') then Break;
met:=Copy(subs2,length(subs2)-i+1,length(subs2));
//if met=' ' then met:=Copy(met,2,Length(met));
subs1:=Copy(src_route[0],Pos('/',src_route[0])+1,Length(src_route[0]));
for i:=0 to length(subs1) do
if Copy(subs1,i,1)=' ' then Break;
bas:=Copy(subs1,1,i);
if bas[Length(bas)]=' ' then bas:=Copy(bas,1,Length(bas)-1);
end;
itm.SubItems.Append(met);

itm:=ListView1.Items.Add;  // 2 строка
itm.Caption:='Базис';
itm.SubItems.Append(bas);

itm:=ListView1.Items.Add;  // 3 строка
itm.Caption:='Заголовок (комментарий)';
if Copy(src_title[0],1,1)=' ' then itm.SubItems.Append(Copy(src_title[0],2,Length(src_title[0])))
else itm.SubItems.Append(src_title[0]);


itm:=ListView1.Items.Add;  // 4 строка
itm.Caption:='Заряд системы';

for i:=0 to Length(src_mult[0]) do
if Copy(src_mult[0],i,1)<>' ' then Break;
subs1:=Copy(src_mult[0],i,Length(src_mult[0]));
for i:=0 to Length(subs1) do
if Copy(subs1,i,1)=' ' then Break;
zs:=Copy(subs1,1,i-1);                 // заряд системы
subs2:=Copy(subs1,i,Length(subs1));
for i:=0 to Length(subs2) do
if Copy(subs2,i,1)<>' ' then Break;
subs3:=Copy(subs2,i,Length(subs2));
for i:=0 to Length(subs3) do
if Copy(subs3,i,1)=' ' then Break;
ms:=Copy(subs3,1,i-1);                 // мультиплетность системы
itm.SubItems.Append(zs);

itm:=ListView1.Items.Add;  // 5 строка
itm.Caption:='Мультиплетность';
itm.SubItems.Append(ms);

itm:=ListView1.Items.Add;  // 6 строка
itm.Caption:='Число атомов';
itm.SubItems.Append(IntToStr(nomer_atoma));

itm:=ListView1.Items.Add;  // 7 строка
itm.Caption:='Число электронов';
j:=0;
for i:=1 to Length(atomout[1])-2 do
j:=j+StrToInt(atomout[1,i]);
nel:=IntToStr(j);
itm.SubItems.Append(nel);  //Число электронов в системе

itm:=ListView1.Items.Add;  // 8 строка
itm.Caption:='Молекулярная масса';
jf:=0;
for i:=1 to Length(atomout[1])-2 do
jf:=jf+StrToFloat(molmass[StrToInt(atomout[1,i])]);
molm:=FloatToStr(jf);
itm.SubItems.Append(molm);  //Молекулярная масса

itm:=ListView1.Items.Add;  // 9 строка
itm.Caption:='Брутто-формула';
SetLength(massiv,Length(atomout[1])-2);
for i:=1 to Length(atomout[1])-2 do
massiv[i-1]:=strtoint(atomout[1,i]);

for i:=0 to Length(massiv)-1 do
for j:=0 to Length(massiv)-2 do
if massiv[j] > massiv[j+1] then begin
q:= massiv[j+1];
massiv[j+1] := massiv[j];
massiv[j]:=q;                // Сортировка массива по возрастанию
end;

j:=0;
s:=1;
for i:=j to Length(massiv)-1 do begin
if massiv[i]<>massiv[i+1] then begin
j:=i;
SetLength(brutto,Length(brutto)+1);
brutto[Length(brutto)-1]:=center[massiv[i]]+inttostr(s);
s:=0;
end;
s:=s+1;
end;                 // brutto - массив частей (поэлементно) брутто-формулы

bf:='';
for i:=0 to Length(brutto)-1 do
bf:=bf+brutto[i];                     // брутто-формула
itm.SubItems.Append(bf);

termination:='Не завершен!!!';
itm:=ListView1.Items.Add;  // 10 строка
itm.Caption:='Дипольный момент';
AssignFile(f,Form1.OpenDialog1.FileName);
Reset(f);
while not EoF(f)  do begin
Readln(f,str);
if Pos(' Dipole moment (field-independent basis',str)<>0 then begin
Readln(f,str);
subs1:=Copy(str,Pos(' Tot=  ',str)+5,Length(str));
for i:=0 to Length(subs1) do
if Copy(subs1,i,1)<>' ' then Break;
dm:=Copy(subs1,i,Length(subs1));               // дипольный момент
end;
if Pos(' SCF Done: ',str)<>0 then begin
subs2:=Copy(str,Pos('=',str)+1,Length(str));
for j:=0 to Length(subs2) do
if Copy(subs2,j,1)<>' ' then Break;
subs3:=Copy(subs2,j,Length(subs2));
te:=Copy(subs3,1,Pos(' ',subs3)-1);   // полная энергия системы
end;
if Pos(' Job cpu time: ',str)<>0 then timecalc:=str;
if Pos(' Normal termination of Gaussian',str)<>0 then termination:='Нормальное завершение';

end;
CloseFile(f);
itm.SubItems.Append(dm);


itm:=ListView1.Items.Add;  // 11 строка
itm.Caption:='Полная энергия';
itm.SubItems.Append(te);

itm:=ListView1.Items.Add;  // 12 строка
itm.Caption:='Точечная группа';
//SetLength(elsymm,58);
//=============================================================================================
{

//1. Поиск наибольшего и наименьшего значения XOUT,YOUT и ZOUT:
x_min_s:=100000000;
x_max_s:=-100000000;
for i:=1 to Length(xout[nomer_cycla])-2 do begin   // - 4 чтобы не учитывать фиктивные центры при позиционировании
if x_min_s>=strtofloat(xout[nomer_cycla][i]) then x_min_s:=strtofloat(xout[nomer_cycla][i]);   // минимум
if x_max_s<=strtofloat(xout[nomer_cycla][i]) then x_max_s:=strtofloat(xout[nomer_cycla][i]);   // максимум
end;
//Y:
y_min_s:=100000000;
y_max_s:=-100000000;
for i:=1 to Length(xout[nomer_cycla])-2 do begin   // - 4 чтобы не учитывать фиктивные центры при позиционировании
if y_min_s>=strtofloat(yout[nomer_cycla][i]) then y_min_s:=strtofloat(yout[nomer_cycla][i]);   // минимум
if y_max_s<=strtofloat(yout[nomer_cycla][i]) then y_max_s:=strtofloat(yout[nomer_cycla][i]);   // максимум
end;
//Z:
z_min_s:=100000000;
z_max_s:=-100000000;
for i:=1 to Length(xout[nomer_cycla])-2 do begin    // - 4 чтобы не учитывать фиктивные центры при позиционировании
if z_min_s>=strtofloat(zout[nomer_cycla][i]) then z_min_s:=strtofloat(zout[nomer_cycla][i]);   // минимум
if z_max_s<=strtofloat(zout[nomer_cycla][i]) then z_max_s:=strtofloat(zout[nomer_cycla][i]);   // максимум
end;
//=====================================================================================================

//=====================================================================================================
//Поиск наименьшего и наибольшего значения из трех координат
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
min_abs_s:=100000000;
if min_abs_s>x_min_s then min_abs_s:=x_min_s;
if min_abs_s>y_min_s then min_abs_s:=y_min_s;
if min_abs_s>z_min_s then min_abs_s:=z_min_s;
max_abs_s:=-100000000;
if max_abs_s<x_max_s then max_abs_s:=x_max_s;
if max_abs_s<y_max_s then max_abs_s:=y_max_s;
if max_abs_s<z_max_s then max_abs_s:=z_max_s;
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
//=====================================================================================================


//=====================================================================================================
//теперь находим центр вращения молекулы - как середину между максимумом и минимумом
xinv_s:=(x_min_s+x_max_s)/2;
yinv_s:=(y_min_s+y_max_s)/2;
zinv_s:=(z_min_s+z_max_s)/2;
//=====================================================================================================

}
//находим иначе центр вращения (в модуле Вид - Модель реализация см. выше)
//ищется как сумма каждой координаты, деленная на число атомов
x_max_s:=0;
for i:=1 to Length(xout[nomer_cycla])-2 do
x_max_s:=x_max_s+StrToFloat(xout[nomer_cycla][i]);
xinv_s:=x_max_s/(Length(xout[nomer_cycla])-2);
y_max_s:=0;
for i:=1 to Length(yout[nomer_cycla])-2 do
y_max_s:=y_max_s+StrToFloat(yout[nomer_cycla][i]);
yinv_s:=y_max_s/(Length(yout[nomer_cycla])-2);
z_max_s:=0;
for i:=1 to Length(zout[nomer_cycla])-2 do
z_max_s:=z_max_s+StrToFloat(zout[nomer_cycla][i]);
zinv_s:=z_max_s/(Length(zout[nomer_cycla])-2);


//ShowMessage(FloatToStr(xinv_s)+'||'+FloatToStr(yinv_s)+'||'+FloatToStr(zinv_s));

//=====================================================================================================
// Смещаем все координаты относительно оси инверсии, т.е. точки с координатами xinv, yinv и zinv
// т.е. переносим в начало координат
//Это делается для того, чтобы манипулировать новыми нативными координатами
setlength(xout_symm,Length(xout[nomer_cycla])-2);
setlength(yout_symm,Length(xout[nomer_cycla])-2);
setlength(zout_symm,Length(xout[nomer_cycla])-2);
for i:=1 to Length(xout[nomer_cycla])-2 do begin
xout_symm[i-1]:=strtofloat(xout[nomer_cycla][i])-xinv_s;
yout_symm[i-1]:=strtofloat(yout[nomer_cycla][i])-yinv_s;
zout_symm[i-1]:=strtofloat(zout[nomer_cycla][i])-zinv_s;
end;

//====================================================================================================

//Инициализируем координаты после проверяемых операций симметричных преобразований
setlength(xout_symm_done,Length(xout_symm));
setlength(yout_symm_done,Length(yout_symm));
setlength(zout_symm_done,Length(zout_symm));

setlength(xout_symm_done1,Length(xout_symm));
setlength(yout_symm_done1,Length(yout_symm));
setlength(zout_symm_done1,Length(zout_symm));


Porog:=0.0001;

1:
//================================================================================
// Ищем произвольный элемент - ось n-го порядка и зеркально-поворотные оси
//
for j:=2 to 100 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/(j*180))+zout_symm[i]*sin(360*pi/(j*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/(j*180))+zout_symm[i]*cos(360*pi/(j*180));
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsyc,Length(elsyc)+1);
elsyc[Length(elsyc)-1]:='C'+inttostr(j)+'x';
end;
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+zout_symm[i]*sin(360*pi/(j*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))*(-1)+zout_symm[i]*cos(360*pi/(j*180));
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsyc,Length(elsyc)+1);
elsyc[Length(elsyc)-1]:='C'+inttostr(j)+'y';
end;
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+yout_symm[i]*sin(360*pi/(j*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))+yout_symm[i]*cos(360*pi/(j*180));
zout_symm_done[i]:=zout_symm[i];
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsyc,Length(elsyc)+1);
elsyc[Length(elsyc)-1]:='C'+inttostr(j)+'z';
end;
end;
//////////////////////////////////////////////////////////////////////////////////////
for j:=3 to 100 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/(j*180))+zout_symm[i]*sin(360*pi/(j*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/(j*180))+zout_symm[i]*cos(360*pi/(j*180));
xout_symm_done[i]:=xout_symm_done[i]*(-1);
yout_symm_done[i]:=yout_symm_done[i];
zout_symm_done[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsys,Length(elsys)+1);
elsys[Length(elsys)-1]:='S'+inttostr(j)+'x';
end;
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+zout_symm[i]*sin(360*pi/(j*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))*(-1)+zout_symm[i]*cos(360*pi/(j*180));
xout_symm_done[i]:=xout_symm_done[i];
yout_symm_done[i]:=yout_symm_done[i]*(-1);
zout_symm_done[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsys,Length(elsys)+1);
elsys[Length(elsys)-1]:='S'+inttostr(j)+'y';
end;
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+yout_symm[i]*sin(360*pi/(j*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))+yout_symm[i]*cos(360*pi/(j*180));
zout_symm_done[i]:=zout_symm[i];
xout_symm_done[i]:=xout_symm_done[i];
yout_symm_done[i]:=yout_symm_done[i];
zout_symm_done[i]:=zout_symm_done[i]*(-1);
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsys,Length(elsys)+1);
elsys[Length(elsys)-1]:='S'+inttostr(j)+'z';
end;
end;
//////////////////////////////////////////////////////////////////////////////////////
//Проверка центра инверсии
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i]*(-1);
yout_symm_done[i]:=yout_symm[i]*(-1);
zout_symm_done[i]:=zout_symm[i]*(-1);
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsyig,Length(elsyig)+1);
elsyig[Length(elsyig)-1]:='i';
end;
//Проверка зеркального отражения в плоскости XOY
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=zout_symm[i]*(-1);
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsyig,Length(elsyig)+1);
elsyig[Length(elsyig)-1]:='Gxoy';
end;
//Проверка зеркального отражения в плоскости YOZ
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i]*(-1);
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=zout_symm[i];
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
SetLength(elsyig,Length(elsyig)+1);
elsyig[Length(elsyig)-1]:='Gyoz';
end;
//Проверка зеркального отражения в плоскости XOZ
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*(-1);
zout_symm_done[i]:=zout_symm[i];
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then  begin
SetLength(elsyig,Length(elsyig)+1);
elsyig[Length(elsyig)-1]:='Gxoz';
end;
/////////////////////////////////////////////////////////////////////////////////////

//Проверка наличие элементов группы Th, чтобы отличить ее от D2h

if  (PG(elsyc,elsys,elsyig,elsyoth)='D2h') or (PG(elsyc,elsys,elsyig,elsyoth)='D5d')  then begin
for j:=2 to 35000 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/((1+j*0.001)*180))+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
{for k:=3 to 8 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm_done[i];
yout_symm_done[i]:=yout_symm_done[i]*cos(360*pi/(k*180))+zout_symm_done[i]*sin(360*pi/(k*180))*(-1);
zout_symm_done[i]:=yout_symm_done[i]*sin(360*pi/(k*180))+zout_symm_done[i]*cos(360*pi/(k*180));
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
th:=true;
Break;
end;
end;  }
for k:=3 to 3 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*cos(360*pi/(k*180))+zout_symm_done[i]*sin(360*pi/(k*180));
yout_symm_done1[i]:=yout_symm_done[i];
zout_symm_done1[i]:=xout_symm_done[i]*sin(360*pi/(k*180))*(-1)+zout_symm_done[i]*cos(360*pi/(k*180));
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
//if k=3 then ShowMessage(IntToStr(j));
//th:=true;
//ShowMessage(IntToStr(j)+'   !!!!');
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='C'+inttostr(k)+'y';
//goto 0;
//Break;
end;
for i:=0 to Length(xout_symm)-1 do begin    // восстановление
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/((1+j*0.001)*180))+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
end;
for k:=3 to 3 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*cos(360*pi/(k*180))+yout_symm_done[i]*sin(360*pi/(k*180))*(-1);
yout_symm_done1[i]:=xout_symm_done[i]*sin(360*pi/(k*180))+yout_symm_done[i]*cos(360*pi/(k*180));
zout_symm_done1[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
//ShowMessage(IntToStr(j)+'   !!!!!!!!!!!!!!!');
//if k=3 then ShowMessage(IntToStr(j));
//th:=true;
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='C'+inttostr(k)+'z';
//goto 0;
//Break;
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/((1+j*0.001)*180))+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
end;
end;

{
//Проверка центра инверсии
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*(-1);
yout_symm_done1[i]:=yout_symm_done[i]*(-1);
zout_symm_done1[i]:=zout_symm_done[i]*(-1);
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='i';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/((1+j*0.001)*180))+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
//Проверка зеркального отражения в плоскости XOY
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i];
yout_symm_done1[i]:=yout_symm_done[i];
zout_symm_done1[i]:=zout_symm_done[i]*(-1);
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gxoy';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/((1+j*0.001)*180))+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
//Проверка зеркального отражения в плоскости YOZ
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*(-1);
yout_symm_done1[i]:=yout_symm_done[i];
zout_symm_done1[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gyoz';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/((1+j*0.001)*180))+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
//Проверка зеркального отражения в плоскости XOZ
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i];
yout_symm_done1[i]:=yout_symm_done[i]*(-1);
zout_symm_done1[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then  begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gxoz';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i];
yout_symm_done[i]:=yout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
zout_symm_done[i]:=yout_symm[i]*sin(360*pi/((1+j*0.001)*180))+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
}
end;

//*********************************************************************************************

{
for j:=2 to 100000 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1)+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
}
{for k:=3 to 8 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm_done[i];
yout_symm_done[i]:=yout_symm_done[i]*cos(360*pi/(k*180))+zout_symm_done[i]*sin(360*pi/(k*180))*(-1);
zout_symm_done[i]:=yout_symm_done[i]*sin(360*pi/(k*180))+zout_symm_done[i]*cos(360*pi/(k*180));
end;
if ComparXYZ(xout_symm,xout_symm_done,yout_symm,yout_symm_done,zout_symm,zout_symm_done)=True then begin
th:=true;
Break;
end;
end;  }
{
for k:=3 to 3 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm_done[i];
yout_symm_done[i]:=yout_symm_done[i]*cos(360*pi/(k*180))+zout_symm_done[i]*sin(360*pi/(k*180))*(-1);
zout_symm_done[i]:=yout_symm_done[i]*sin(360*pi/(k*180))+zout_symm_done[i]*cos(360*pi/(k*180));
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
//th:=true;
ShowMessage(IntToStr(j)+'   ******');
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='C'+inttostr(k)+'x';
//goto 0;
//Break;
end;
for i:=0 to Length(xout_symm)-1 do begin    // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1)+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
end;
for k:=3 to 3 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*cos(360*pi/(k*180))+yout_symm_done[i]*sin(360*pi/(k*180))*(-1);
yout_symm_done1[i]:=xout_symm_done[i]*sin(360*pi/(k*180))+yout_symm_done[i]*cos(360*pi/(k*180));
zout_symm_done1[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
ShowMessage(IntToStr(j)+'   ******');
//th:=true;
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='C'+inttostr(k)+'z';
//goto 0;
//Break;
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/((1+j*0.001)*180))+zout_symm[i]*sin(360*pi/((1+j*0.001)*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1)+zout_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
end;
}


{
//Проверка центра инверсии
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*(-1);
yout_symm_done1[i]:=yout_symm_done[i]*(-1);
zout_symm_done1[i]:=zout_symm_done[i]*(-1);
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='i';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+zout_symm[i]*sin(360*pi/(j*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))*(-1)+zout_symm[i]*cos(360*pi/(j*180));
end;
//Проверка зеркального отражения в плоскости XOY
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i];
yout_symm_done1[i]:=yout_symm_done[i];
zout_symm_done1[i]:=zout_symm_done[i]*(-1);
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gxoy';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+zout_symm[i]*sin(360*pi/(j*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))*(-1)+zout_symm[i]*cos(360*pi/(j*180));
end;
//Проверка зеркального отражения в плоскости YOZ
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*(-1);
yout_symm_done1[i]:=yout_symm_done[i];
zout_symm_done1[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gyoz';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+zout_symm[i]*sin(360*pi/(j*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))*(-1)+zout_symm[i]*cos(360*pi/(j*180));
end;
//Проверка зеркального отражения в плоскости XOZ
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i];
yout_symm_done1[i]:=yout_symm_done[i]*(-1);
zout_symm_done1[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then  begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gxoz';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+zout_symm[i]*sin(360*pi/(j*180));
yout_symm_done[i]:=yout_symm[i];
zout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))*(-1)+zout_symm[i]*cos(360*pi/(j*180));
end;
}
//end;

//****************************************************************************************************

{
for j:=2 to 100000 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/((1+j*0.001)*180))+yout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/((1+j*0.001)*180))+yout_symm[i]*cos(360*pi/((1+j*0.001)*180));
zout_symm_done[i]:=zout_symm[i];
end;
for k:=3 to 3 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done[i]:=xout_symm_done[i];
yout_symm_done[i]:=yout_symm_done[i]*cos(360*pi/(k*180))+zout_symm_done[i]*sin(360*pi/(k*180))*(-1);
zout_symm_done[i]:=yout_symm_done[i]*sin(360*pi/(k*180))+zout_symm_done[i]*cos(360*pi/(k*180));
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
//th:=true;
//ShowMessage(IntToStr(j)+'   >>>>');
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='C'+inttostr(k)+'x';
//goto 0;
//Break;
end;
for i:=0 to Length(xout_symm)-1 do begin    // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/((1+j*0.001)*180))+yout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/((1+j*0.001)*180))+yout_symm[i]*cos(360*pi/((1+j*0.001)*180));
zout_symm_done[i]:=zout_symm[i];
end;
end;
for k:=3 to 3 do begin
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*cos(360*pi/(k*180))+zout_symm_done[i]*sin(360*pi/(k*180));
yout_symm_done1[i]:=yout_symm_done[i];
zout_symm_done1[i]:=xout_symm_done[i]*sin(360*pi/(k*180))*(-1)+zout_symm_done[i]*cos(360*pi/(k*180));
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
//th:=true;
//ShowMessage(IntToStr(j)+'   >>>>');
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='C'+inttostr(k)+'y';
//goto 0;
//Break;
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/((1+j*0.001)*180))+yout_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/((1+j*0.001)*180))+yout_symm[i]*cos(360*pi/((1+j*0.001)*180));
zout_symm_done[i]:=zout_symm[i];
end;
end;
}
{
//Проверка центра инверсии
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*(-1);
yout_symm_done1[i]:=yout_symm_done[i]*(-1);
zout_symm_done1[i]:=zout_symm_done[i]*(-1);
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='i';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+yout_symm[i]*sin(360*pi/(j*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))+yout_symm[i]*cos(360*pi/(j*180));
zout_symm_done[i]:=zout_symm[i];
end;
//Проверка зеркального отражения в плоскости XOY
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i];
yout_symm_done1[i]:=yout_symm_done[i];
zout_symm_done1[i]:=zout_symm_done[i]*(-1);
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gxoy';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+yout_symm[i]*sin(360*pi/(j*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))+yout_symm[i]*cos(360*pi/(j*180));
zout_symm_done[i]:=zout_symm[i];
end;
//Проверка зеркального отражения в плоскости YOZ
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i]*(-1);
yout_symm_done1[i]:=yout_symm_done[i];
zout_symm_done1[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gyoz';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+yout_symm[i]*sin(360*pi/(j*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))+yout_symm[i]*cos(360*pi/(j*180));
zout_symm_done[i]:=zout_symm[i];
end;
//Проверка зеркального отражения в плоскости XOZ
for i:=0 to Length(xout_symm)-1 do begin
xout_symm_done1[i]:=xout_symm_done[i];
yout_symm_done1[i]:=yout_symm_done[i]*(-1);
zout_symm_done1[i]:=zout_symm_done[i];
end;
if ComparXYZ(xout_symm_done,xout_symm_done1,yout_symm_done,yout_symm_done1,zout_symm_done,zout_symm_done1)=True then  begin
SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='Gxoz';
end;
for i:=0 to Length(xout_symm)-1 do begin   // восстановление
xout_symm_done[i]:=xout_symm[i]*cos(360*pi/(j*180))+yout_symm[i]*sin(360*pi/(j*180))*(-1);
yout_symm_done[i]:=xout_symm[i]*sin(360*pi/(j*180))+yout_symm[i]*cos(360*pi/(j*180));
zout_symm_done[i]:=zout_symm[i];
end;
}
//end;

0:
//if th=true then showmessage('j='+inttostr(j)+', '+'k='+inttostr(k));
itm.SubItems.Append(PG(elsyc,elsys,elsyig,elsyoth));
if Porog<0.01 then begin
itm:=ListView1.Items.Add;  // 13 строка
itm.Caption:='Симметрия (прибл.)';
Porog:=0.01;
elsyc:=nil;
elsys:=nil;
elsyig:=nil;
elsyoth:=nil;
goto 1;
end;

itm:=ListView1.Items.Add;  // 14 строка
itm.Caption:='Время расчета';
itm.SubItems.Append(TimeOfCalc(timecalc));

itm:=ListView1.Items.Add;  // 15 строка
itm.Caption:='Cтатус расчета';
itm.SubItems.Append(termination);

ComboBox1.Clear;
ComboBox1.Items.Add(Form1.OpenDialog1.FileName);
ComboBox1.ItemIndex:=0;
end;              //////////// конец  out (одиночный)

//=====================================================================================
//=====================================================================================
//==================GJF================================================================

if (dial=True) and (Form1.OpenDialog1.FilterIndex=1) then begin
itm:=ListView1.Items.Add;
itm.Caption:='Тип файла';
itm.SubItems.Append('*.gjf');

itm:=ListView1.Items.Add;
itm.Caption:='Метод расчета';

if Pos('/',src_route[0])<>0 then begin
//for i:=1 to length(src_route) do
//if Copy(src_route,i,1)='/' then Break;
subs1:=Copy(src_route[0],1,Pos('/',src_route[0])-1);
for i:=0 to length(subs1) do
if Copy(subs1,length(subs1)-i,1)<>' ' then Break;
subs2:=Copy(subs1,1,length(subs1)-i);
for i:=0 to length(subs2) do
if (Copy(subs2,length(subs2)-i,1)=' ') or (Copy(subs2,length(subs2)-i,1)='#') then Break;
met:=Copy(subs2,length(subs2)-i+1,length(subs2));
//if met=' ' then met:=Copy(met,2,Length(met));
subs1:=Copy(src_route[0],Pos('/',src_route[0])+1,Length(src_route[0]));
for i:=0 to length(subs1) do
if Copy(subs1,i,1)=' ' then Break;
bas:=Copy(subs1,1,i);
if bas[Length(bas)]=' ' then bas:=Copy(bas,1,Length(bas)-1);
end;
itm.SubItems.Append(met);

itm:=ListView1.Items.Add;  // 2 строка
itm.Caption:='Базис';
itm.SubItems.Append(bas);

itm:=ListView1.Items.Add;  // 3 строка
itm.Caption:='Заголовок (комментарий)';
if Copy(src_title[0],1,1)=' ' then itm.SubItems.Append(Copy(src_title[0],2,Length(src_title[0])))
else itm.SubItems.Append(src_title[0]);


itm:=ListView1.Items.Add;  // 4 строка
itm.Caption:='Заряд системы';

for i:=0 to Length(src_mult[0]) do
if Copy(src_mult[0],i,1)<>' ' then Break;
subs1:=Copy(src_mult[0],i,Length(src_mult[0]));
for i:=0 to Length(subs1) do
if Copy(subs1,i,1)=' ' then Break;
zs:=Copy(subs1,1,i-1);                 // заряд системы
subs2:=Copy(subs1,i,Length(subs1));
for i:=0 to Length(subs2) do
if Copy(subs2,i,1)<>' ' then Break;
subs3:=Copy(subs2,i,Length(subs2));
for i:=0 to Length(subs3) do
if Copy(subs3,i,1)=' ' then Break;
ms:=Copy(subs3,1,i-1);                 // мультиплетность системы
itm.SubItems.Append(zs);

itm:=ListView1.Items.Add;  // 5 строка
itm.Caption:='Мультиплетность';
itm.SubItems.Append(ms);

itm:=ListView1.Items.Add;  // 6 строка
itm.Caption:='Число атомов';
itm.SubItems.Append(IntToStr(nomer_atoma-1));

itm:=ListView1.Items.Add;  // 7 строка
itm.Caption:='Число электронов';
j:=0;
for i:=1 to Length(GetNum(atom_store))-2 do
j:=j+StrToInt(GetNum(atom_store)[i]);
nel:=IntToStr(j);
itm.SubItems.Append(nel);  //Число электронов в системе

itm:=ListView1.Items.Add;  // 8 строка
itm.Caption:='Молекулярная масса';
jf:=0;
for i:=1 to Length(GetNum(atom_store))-2 do
jf:=jf+StrToFloat(molmass[StrToInt(GetNum(atom_store)[i])]);
molm:=FloatToStr(jf);
itm.SubItems.Append(molm);  //Молекулярная масса

itm:=ListView1.Items.Add;  // 9 строка
itm.Caption:='Брутто-формула';
SetLength(massiv,Length(GetNum(atom_store))-2);
for i:=1 to Length(GetNum(atom_store))-2 do
massiv[i-1]:=strtoint(GetNum(atom_store)[i]);

for i:=0 to Length(massiv)-1 do
for j:=0 to Length(massiv)-2 do
if massiv[j] > massiv[j+1] then begin
q:= massiv[j+1];
massiv[j+1] := massiv[j];
massiv[j]:=q;                // Сортировка массива по возрастанию
end;

j:=0;
s:=1;
for i:=j to Length(massiv)-1 do begin
if massiv[i]<>massiv[i+1] then begin
j:=i;
SetLength(brutto,Length(brutto)+1);
brutto[Length(brutto)-1]:=center[massiv[i]]+inttostr(s);
s:=0;
end;
s:=s+1;
end;                 // brutto - массив частей (поэлементно) брутто-формулы

bf:='';
for i:=0 to Length(brutto)-1 do
bf:=bf+brutto[i];                     // брутто-формула
itm.SubItems.Append(bf);

itm:=ListView1.Items.Add;  // 9 строка
itm.Caption:='Описание геометрии';
if identificator=1 then itm.SubItems.Append('Декартовы координаты');
if identificator=2 then itm.SubItems.Append('Z-матрица');
if identificator=3 then itm.SubItems.Append('Смешанная форма');


//======================================Symmetry=======================================
itm:=ListView1.Items.Add;  // 12 строка
itm.Caption:='Точечная группа';

x_max_s:=0;
for i:=1 to Length(x)-2 do
x_max_s:=x_max_s+StrToFloat(x[i]);
xinv_s:=x_max_s/(Length(x)-2);
y_max_s:=0;
for i:=1 to Length(y)-2 do
y_max_s:=y_max_s+StrToFloat(y[i]);
yinv_s:=y_max_s/(Length(y)-2);
z_max_s:=0;
for i:=1 to Length(z)-2 do
z_max_s:=z_max_s+StrToFloat(z[i]);
zinv_s:=z_max_s/(Length(z)-2);



setlength(x_symm,Length(x)-2);
setlength(y_symm,Length(x)-2);
setlength(z_symm,Length(x)-2);
for i:=1 to Length(x)-2 do begin
x_symm[i-1]:=strtofloat(x[i])-xinv_s;
y_symm[i-1]:=strtofloat(y[i])-yinv_s;
z_symm[i-1]:=strtofloat(z[i])-zinv_s;
end;

setlength(x_symm_done,Length(x_symm));
setlength(y_symm_done,Length(y_symm));
setlength(z_symm_done,Length(z_symm));

setlength(x_symm_done1,Length(x_symm));
setlength(y_symm_done1,Length(y_symm));
setlength(z_symm_done1,Length(z_symm));


Porog:=0.001;

10:

//================================================================================
// Ищем произвольный элемент - ось n-го порядка и зеркально-поворотные оси
//
for j:=2 to 100 do begin
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i];
y_symm_done[i]:=y_symm[i]*cos(360*pi/(j*180))+z_symm[i]*sin(360*pi/(j*180))*(-1);
z_symm_done[i]:=y_symm[i]*sin(360*pi/(j*180))+z_symm[i]*cos(360*pi/(j*180));
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsyc,Length(elsyc)+1);
elsyc[Length(elsyc)-1]:='C'+inttostr(j)+'x';
end;
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i]*cos(360*pi/(j*180))+z_symm[i]*sin(360*pi/(j*180));
y_symm_done[i]:=y_symm[i];
z_symm_done[i]:=x_symm[i]*sin(360*pi/(j*180))*(-1)+z_symm[i]*cos(360*pi/(j*180));
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsyc,Length(elsyc)+1);
elsyc[Length(elsyc)-1]:='C'+inttostr(j)+'y';
end;
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i]*cos(360*pi/(j*180))+y_symm[i]*sin(360*pi/(j*180))*(-1);
y_symm_done[i]:=x_symm[i]*sin(360*pi/(j*180))+y_symm[i]*cos(360*pi/(j*180));
z_symm_done[i]:=z_symm[i];
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsyc,Length(elsyc)+1);
elsyc[Length(elsyc)-1]:='C'+inttostr(j)+'z';
end;
end;
//////////////////////////////////////////////////////////////////////////////////////
for j:=3 to 100 do begin
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i];
y_symm_done[i]:=y_symm[i]*cos(360*pi/(j*180))+z_symm[i]*sin(360*pi/(j*180))*(-1);
z_symm_done[i]:=y_symm[i]*sin(360*pi/(j*180))+z_symm[i]*cos(360*pi/(j*180));
x_symm_done[i]:=x_symm_done[i]*(-1);
y_symm_done[i]:=y_symm_done[i];
z_symm_done[i]:=z_symm_done[i];
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsys,Length(elsys)+1);
elsys[Length(elsys)-1]:='S'+inttostr(j)+'x';
end;
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i]*cos(360*pi/(j*180))+z_symm[i]*sin(360*pi/(j*180));
y_symm_done[i]:=y_symm[i];
z_symm_done[i]:=x_symm[i]*sin(360*pi/(j*180))*(-1)+z_symm[i]*cos(360*pi/(j*180));
x_symm_done[i]:=x_symm_done[i];
y_symm_done[i]:=y_symm_done[i]*(-1);
z_symm_done[i]:=z_symm_done[i];
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsys,Length(elsys)+1);
elsys[Length(elsys)-1]:='S'+inttostr(j)+'y';
end;
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i]*cos(360*pi/(j*180))+y_symm[i]*sin(360*pi/(j*180))*(-1);
y_symm_done[i]:=x_symm[i]*sin(360*pi/(j*180))+y_symm[i]*cos(360*pi/(j*180));
z_symm_done[i]:=z_symm[i];
x_symm_done[i]:=x_symm_done[i];
y_symm_done[i]:=y_symm_done[i];
z_symm_done[i]:=z_symm_done[i]*(-1);
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsys,Length(elsys)+1);
elsys[Length(elsys)-1]:='S'+inttostr(j)+'z';
end;
end;
//////////////////////////////////////////////////////////////////////////////////////
//Проверка центра инверсии
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i]*(-1);
y_symm_done[i]:=y_symm[i]*(-1);
z_symm_done[i]:=z_symm[i]*(-1);
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsyig,Length(elsyig)+1);
elsyig[Length(elsyig)-1]:='i';
end;
//Проверка зеркального отражения в плоскости XOY
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i];
y_symm_done[i]:=y_symm[i];
z_symm_done[i]:=z_symm[i]*(-1);
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsyig,Length(elsyig)+1);
elsyig[Length(elsyig)-1]:='Gxoy';
end;
//Проверка зеркального отражения в плоскости YOZ
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i]*(-1);
y_symm_done[i]:=y_symm[i];
z_symm_done[i]:=z_symm[i];
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then begin
SetLength(elsyig,Length(elsyig)+1);
elsyig[Length(elsyig)-1]:='Gyoz';
end;
//Проверка зеркального отражения в плоскости XOZ
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i];
y_symm_done[i]:=y_symm[i]*(-1);
z_symm_done[i]:=z_symm[i];
end;
if ComparXYZ(x_symm,x_symm_done,y_symm,y_symm_done,z_symm,z_symm_done)=True then  begin
SetLength(elsyig,Length(elsyig)+1);
elsyig[Length(elsyig)-1]:='Gxoz';
end;
/////////////////////////////////////////////////////////////////////////////////////

//Проверка наличие элементов группы Th, чтобы отличить ее от D2h

if  (PG(elsyc,elsys,elsyig,elsyoth)='D2h') or (PG(elsyc,elsys,elsyig,elsyoth)='D5d')  then begin
for j:=2 to 35000 do begin
for i:=0 to Length(x_symm)-1 do begin
x_symm_done[i]:=x_symm[i];
y_symm_done[i]:=y_symm[i]*cos(360*pi/((1+j*0.001)*180))+z_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
z_symm_done[i]:=y_symm[i]*sin(360*pi/((1+j*0.001)*180))+z_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;

for k:=3 to 3 do begin
for i:=0 to Length(x_symm)-1 do begin
x_symm_done1[i]:=x_symm_done[i]*cos(360*pi/(k*180))+z_symm_done[i]*sin(360*pi/(k*180));
y_symm_done1[i]:=y_symm_done[i];
z_symm_done1[i]:=x_symm_done[i]*sin(360*pi/(k*180))*(-1)+z_symm_done[i]*cos(360*pi/(k*180));
end;
if ComparXYZ(x_symm_done,x_symm_done1,y_symm_done,y_symm_done1,z_symm_done,z_symm_done1)=True then begin

SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='C'+inttostr(k)+'y';

end;
for i:=0 to Length(x_symm)-1 do begin    // восстановление
x_symm_done[i]:=x_symm[i];
y_symm_done[i]:=y_symm[i]*cos(360*pi/((1+j*0.001)*180))+z_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
z_symm_done[i]:=y_symm[i]*sin(360*pi/((1+j*0.001)*180))+z_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
end;
for k:=3 to 3 do begin
for i:=0 to Length(x_symm)-1 do begin
x_symm_done1[i]:=x_symm_done[i]*cos(360*pi/(k*180))+y_symm_done[i]*sin(360*pi/(k*180))*(-1);
y_symm_done1[i]:=x_symm_done[i]*sin(360*pi/(k*180))+y_symm_done[i]*cos(360*pi/(k*180));
z_symm_done1[i]:=z_symm_done[i];
end;
if ComparXYZ(x_symm_done,x_symm_done1,y_symm_done,y_symm_done1,z_symm_done,z_symm_done1)=True then begin

SetLength(elsyoth,Length(elsyoth)+1);
elsyoth[Length(elsyoth)-1]:='C'+inttostr(k)+'z';

end;
for i:=0 to Length(x_symm)-1 do begin   // восстановление
x_symm_done[i]:=x_symm[i];
y_symm_done[i]:=y_symm[i]*cos(360*pi/((1+j*0.001)*180))+z_symm[i]*sin(360*pi/((1+j*0.001)*180))*(-1);
z_symm_done[i]:=y_symm[i]*sin(360*pi/((1+j*0.001)*180))+z_symm[i]*cos(360*pi/((1+j*0.001)*180));
end;
end;
end;
end;


itm.SubItems.Append(PG(elsyc,elsys,elsyig,elsyoth));
if Porog<0.1 then begin
itm:=ListView1.Items.Add;  // 13 строка
itm.Caption:='Симметрия (прибл.)';
Porog:=0.1;
elsyc:=nil;
elsys:=nil;
elsyig:=nil;
elsyoth:=nil;
goto 10;
end;

ComboBox1.Clear;
ComboBox1.Items.Add(Form1.OpenDialog1.FileName);
ComboBox1.ItemIndex:=0;


end;   // Конец GJF






end;

end.
