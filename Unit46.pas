unit Unit46;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TForm46 = class(TForm)
    ListView1: TListView;
    procedure FormShow(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form46: TForm46;

implementation

uses Unit44,Unit24,Unit1;

{$R *.dfm}

procedure TForm46.FormShow(Sender: TObject);
var j,p,l,pr1,pr2,i,v,t,b: Integer;
itm: TListItem;
s: array of Integer;
begin
///////////////////
ListView1.Clear;
while ListView1.Columns.Count>0 do                                  //Удалили колонки (каждый файл может иметь разное число переменных)
ListView1.Columns.Delete(ListView1.Columns.Count-1);


////////////////////ДОбавляем колонки - руководствоваться будем размером массива stepcount


if ListView1.Columns.Count=0 then begin
  ListView1.Columns.Add;   //Добавляем общие номера
  ListView1.Columns.Items[0].Caption:='#';
  ListView1.Columns.Items[0].Alignment:=taCenter;
   ListView1.Columns.Items[0].Width:=60;
  ListView1.Columns.Add;   //Добавляем общие номера циклов оптимизации вплоть до номера конечной (ралаксированной) конфигурации
  ListView1.Columns.Items[1].Caption:='Step';
  ListView1.Columns.Items[1].Alignment:=taCenter;
  ListView1.Columns.Items[1].Width:=60;
  ListView1.Columns.Add;   //Добавляем общие номера только результирующих циклов
  ListView1.Columns.Items[2].Caption:='№';
  ListView1.Columns.Items[2].Alignment:=taCenter;
  ListView1.Columns.Items[2].Width:=60;



  for j:=3 to Form44.ListView1.Columns.Count-2 do    //Добавляем колонку с номерами и величиной координаты
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
  for j:=3 to Form44.ListView1.Columns.Count-2 do begin
  ListView1.Columns.Items[j].Width:=70;
  if j/2<>Round(j/2) then ListView1.Columns.Items[j].Caption:='#('+inttostr(Round((((j-3)/2)+1)))+')'
  else  ListView1.Columns.Items[j].Caption:='Coord.'+inttostr(Round((j-2)/2));
  ListView1.Columns.Items[j].Alignment:=taCenter;
  end;
end;

//Число колонок в форме Подробнее на 2 больше, чем в основной форме


 
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


b:=0;


if dial=True then begin
SetLength(s,Length(stepcount));

t:=0;
for i:=0 to Length(allenergy)-1 do begin
  if  allenergy[i]='' then Break;
itm:=ListView1.Items.Add;

  if i=0 then begin
   itm.Caption:='St.En.';
   itm.SubItems.Append('St.En.');
   itm.SubItems.Append('-');
   for l:=0 to Length(stepcount)-1 do begin
    itm.SubItems.Append('-');
    itm.SubItems.Append('-');
   end;
   itm.SubItems.Append(allenergy[0]);
   itm.SubItems.Append('-');
   itm.SubItems.Append('-');
  end;



if i>0 then  begin


itm.Caption:=IntToStr(i);
if (scanpoint[i]<>'') and (i>0) then begin
b:=b+1;
itm.SubItems.Append(IntToStr(b));
end
else  itm.SubItems.Append('');
if scanpoint[i]='' then  begin
t:=t+1;
itm.SubItems.Append(IntToStr(t));
//t:=t+1;
end
else begin
t:=t+1;
itm.SubItems.Append(IntToStr(t));
t:=0;
end;


if scanpoint[i]<>'' then begin
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

if (((b) mod pr2) = 0) and ((b)<>0) then v:=pr2
else v:= ((b) mod pr2);

if  (v/pr1=Trunc(v/pr1)) and (v/pr1<>0) then s[j]:=Trunc(v/pr1)-1;
if  v/pr1<>Trunc(v/pr1) then  s[j]:=Trunc(v/pr1);
if v/pr1=0 then s[j]:=0;
end;

for j:=0 to Length(stepcount)-1 do begin
itm.SubItems.Append(IntToStr(s[j]));
itm.SubItems.Append(FloatToStr(initialval[j]+s[j]*stepsize[j]));
end;

itm.SubItems.Append(allenergy[i]);
if i>0 then itm.SubItems.Append(FloatToStrF(((strtofloat(allenergy[i])-strtofloat(allenergy[i-1]))*27.21*23.06),ffFixed,5,3))
else  itm.SubItems.Append('-');
itm.SubItems.Append(FloatToStrF(((strtofloat(allenergy[i])-strtofloat(allenergy[0]))*27.21*23.06),ffFixed,5,3));
end
else begin
for p:=0 to Length(stepcount)-1 do begin
itm.SubItems.Append('>>');
itm.SubItems.Append('>>');
end;
itm.SubItems.Append(allenergy[i]);
if i>0 then itm.SubItems.Append(FloatToStrF(((strtofloat(allenergy[i])-strtofloat(allenergy[i-1]))*27.21*23.06),ffFixed,5,3))
else  itm.SubItems.Append('-');
itm.SubItems.Append(FloatToStrF(((strtofloat(allenergy[i])-strtofloat(allenergy[0]))*27.21*23.06),ffFixed,5,3));
end;




end;
end;









end;


































if Dial=False then begin

SetLength(s,Length(stepcount_mult[basket[Form44.ComboBox1.ItemIndex]]));

t:=0;
for i:=0 to Length(allenergy_mult[basket[Form44.ComboBox1.ItemIndex]])-1 do begin
  if  allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i]='' then Break;
itm:=ListView1.Items.Add;

  if i=0 then begin
   itm.Caption:='St.En.';
   itm.SubItems.Append('St.En.');
   itm.SubItems.Append('-');
   for l:=0 to rvar-1 do begin
    itm.SubItems.Append('-');
    itm.SubItems.Append('-');
   end;
   itm.SubItems.Append(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],0]);
   itm.SubItems.Append('-');
   itm.SubItems.Append('-');
  end;



if i>0 then  begin


itm.Caption:=IntToStr(i);
if (scanpoint_mult[basket[Form44.ComboBox1.ItemIndex],i]<>'') and (i>0) then begin
b:=b+1;
itm.SubItems.Append(IntToStr(b));
end
else  itm.SubItems.Append('');
if scanpoint_mult[basket[Form44.ComboBox1.ItemIndex],i]='' then  begin
t:=t+1;
itm.SubItems.Append(IntToStr(t));
//t:=t+1;
end
else begin
t:=t+1;
itm.SubItems.Append(IntToStr(t));
t:=0;
end;


if scanpoint_mult[basket[Form44.ComboBox1.ItemIndex],i]<>'' then begin
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
if l>j then pr1:=pr1*stepcount_mult[basket[Form44.ComboBox1.ItemIndex],l];  //знаменатель
pr2:=pr2*stepcount_mult[basket[Form44.ComboBox1.ItemIndex],l];   //числитель (знаменатель числителя, где берется остаток)
end;

if (((b) mod pr2) = 0) and ((b)<>0) then v:=pr2
else v:= ((b) mod pr2);

if  (v/pr1=Trunc(v/pr1)) and (v/pr1<>0) then s[j]:=Trunc(v/pr1)-1;
if  v/pr1<>Trunc(v/pr1) then  s[j]:=Trunc(v/pr1);
if v/pr1=0 then s[j]:=0;
end;

for j:=0 to rvar-1 do begin
itm.SubItems.Append(IntToStr(s[j]));
itm.SubItems.Append(FloatToStr(initialval_mult[basket[Form44.ComboBox1.ItemIndex],j]+s[j]*stepsize_mult[basket[Form44.ComboBox1.ItemIndex],j]));
end;

itm.SubItems.Append(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i]);
if i>0 then itm.SubItems.Append(FloatToStrF(((strtofloat(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i])-strtofloat(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i-1]))*27.21*23.06),ffFixed,5,3))
else  itm.SubItems.Append('-');
itm.SubItems.Append(FloatToStrF(((strtofloat(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i])-strtofloat(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],0]))*27.21*23.06),ffFixed,5,3));
end
else begin
for p:=0 to rvar-1 do begin
itm.SubItems.Append('>>');
itm.SubItems.Append('>>');
end;
itm.SubItems.Append(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i]);
if i>0 then itm.SubItems.Append(FloatToStrF(((strtofloat(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i])-strtofloat(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i-1]))*27.21*23.06),ffFixed,5,3))
else  itm.SubItems.Append('-');
itm.SubItems.Append(FloatToStrF(((strtofloat(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],i])-strtofloat(allenergy_mult[basket[Form44.ComboBox1.ItemIndex],0]))*27.21*23.06),ffFixed,5,3));
end;




end;
end;
end;  /////




end;

procedure TForm46.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var i: Integer;
begin
  if dial=True then begin
for i:=0 to Length(allenergy)-1 do begin
if scanpoint[i]<>'' then begin
if Item.Index=i then  Sender.Canvas.Brush.Color:=RGB(255, 228, 196);
end;
end;
end
else begin
for i:=0 to Length(allenergy_mult[basket[Form44.ComboBox1.ItemIndex]])-1 do begin
if scanpoint_mult[basket[Form44.ComboBox1.ItemIndex],i]<>'' then begin
if Item.Index=i then  Sender.Canvas.Brush.Color:=RGB(255, 228, 196);
end;
end;








end;










end;

end.
