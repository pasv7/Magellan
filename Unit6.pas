unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm6 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitButton1: TBitBtn;
    BitButton2: TBitBtn;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit13: TEdit;
    Label14: TLabel;
    BitButton3: TBitBtn;
    BitButton4: TBitBtn;
    SaveDialog1: TSaveDialog;
    BitBtn1: TBitBtn;
    SaveDialog2: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure BitButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitButton1Click(Sender: TObject);
    procedure BitButton3Click(Sender: TObject);
    procedure BitButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  x_tr,y_tr,z_tr: array of array of string;

implementation

uses Unit1, Unit3, Unit8, Unit36;

{$R *.dfm}

procedure TForm6.FormShow(Sender: TObject);
var rx, ry, rz, rxmax, rymax, rzmax: Real;
i, j, diap, s: Integer;
begin
Form6.ComboBox1.Clear;
Form6.ComboBox1.Enabled:=False;
if dial=false then  begin
BitButton4.Enabled:=False;
BitButton1.Enabled:=False;
BitButton3.Enabled:=False;
end;
if  (Form1.OpenDialog1.FilterIndex=2) or (Form1.OpenDialog1.FilterIndex=3)    then begin
BitButton3.Enabled:=True;
BitButton4.Enabled:=True;
end
else begin
BitButton3.Enabled:=False;
BitButton4.Enabled:=False;
end;

rxmax:=0;
rymax:=0;
rzmax:=0;
if identificator=1 then s:=0;
if identificator=2 then s:=1;
if Dial=True then begin
  if (Form1.OpenDialog1.FilterIndex=2) or (Form1.OpenDialog1.FilterIndex=3)  then begin
Form6.ComboBox1.Enabled:=true;
Form6.ComboBox1.Clear;
for i:=1 to nomer_cycla do
Form6.ComboBox1.Items.Add(IntToStr(i)+' цикл');
Form6.ComboBox1.ItemIndex:=Form6.ComboBox1.Items.Count-1;


for i:=1 to nomer_atoma do begin
for j:=i+1 to nomer_atoma-1 do  begin
rx:=Abs(strtofloat(xout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-strtofloat(xout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][j]));
if rx>=rxmax then rxmax:=rx;
ry:=Abs(strtofloat(yout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-strtofloat(yout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][j]));
if ry>=rymax then rymax:=ry;
rz:=Abs(strtofloat(zout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-strtofloat(zout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][j]));
if rz>=rzmax then rzmax:=rz;
end;
end;
end
else  begin
Form6.ComboBox1.Enabled:=False;
for i:=1 to nomer_atoma+s do begin
for j:=i+1 to nomer_atoma-1+s do  begin
rx:=Abs(strtofloat(x[i])-strtofloat(x[j]));
if rx>=rxmax then rxmax:=rx;
ry:=Abs(strtofloat(y[i])-strtofloat(y[j]));
if ry>=rymax then rymax:=ry;
rz:=Abs(strtofloat(z[i])-strtofloat(z[j]));
if rz>=rzmax then rzmax:=rz;
end;
end;

end;

diap:=3;//число знаков после точки (подключить к настройкам программы)
//Расстояния по осям
Form6.Edit7.Text:=FloatToStrf(rxmax,ffFixed,4,diap);
Form6.Edit8.Text:=FloatToStrf(rymax,ffFixed,4,diap);
Form6.Edit9.Text:=FloatToStrf(rzmax,ffFixed,4,diap);
//Расстояния в плоскостях
Form6.Edit10.Text:=FloatToStrf(sqrt(sqr(rxmax)+sqr(rymax)),ffFixed,4,diap);
Form6.Edit11.Text:=FloatToStrf(sqrt(sqr(rxmax)+sqr(rzmax)),ffFixed,4,diap);
Form6.Edit12.Text:=FloatToStrf(sqrt(sqr(rymax)+sqr(rzmax)),ffFixed,4,diap);
//Диаметр
Form6.Edit13.Text:=FloatToStrf(sqrt(sqr(rxmax)+sqr(rymax)+sqr(rzmax)),ffFixed,4,diap);



end;
end;


procedure TForm6.BitButton2Click(Sender: TObject);
begin
Form6.Close;
end;

procedure TForm6.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked=true then begin
   Edit1.Enabled:=True;
   Edit4.Enabled:=True;
 end
 else begin
   Edit1.Enabled:=False;
   Edit4.Enabled:=False;
   Edit1.Text:='';
   Edit4.Text:='';
 end;
end;

procedure TForm6.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked=true then begin
   Edit2.Enabled:=True;
   Edit5.Enabled:=True;
 end
 else begin
   Edit2.Enabled:=False;
   Edit5.Enabled:=False;
   Edit2.Text:='';
   Edit5.Text:='';
 end;
end;

procedure TForm6.CheckBox3Click(Sender: TObject);
begin
if CheckBox3.Checked=true then begin
   Edit3.Enabled:=True;
   Edit6.Enabled:=True;
 end
 else begin
   Edit3.Enabled:=False;
   Edit6.Enabled:=False;
   Edit3.Text:='';
   Edit6.Text:='';
 end;
end;

procedure TForm6.ComboBox1Change(Sender: TObject);
var rx, ry, rz, rxmax, rymax, rzmax: Real;
i, j, diap: Integer;
begin
rxmax:=0;
rymax:=0;
rzmax:=0;


for i:=1 to nomer_atoma do begin
for j:=i+1 to nomer_atoma-1 do  begin
rx:=Abs(strtofloat(xout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-strtofloat(xout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][j]));
if rx>=rxmax then rxmax:=rx;
ry:=Abs(strtofloat(yout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-strtofloat(yout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][j]));
if ry>=rymax then rymax:=ry;
rz:=Abs(strtofloat(zout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-strtofloat(zout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][j]));
if rz>=rzmax then rzmax:=rz;
end;
end;

diap:=3;//число знаков после точки (подключить к настройкам программы)
Form6.Edit7.Text:=FloatToStrf(rxmax,ffFixed,4,diap);
Form6.Edit8.Text:=FloatToStrf(rymax,ffFixed,4,diap);
Form6.Edit9.Text:=FloatToStrf(rzmax,ffFixed,4,diap);
//Расстояния в плоскостях
Form6.Edit10.Text:=FloatToStrf(sqrt(sqr(rxmax)+sqr(rymax)),ffFixed,4,diap);
Form6.Edit11.Text:=FloatToStrf(sqrt(sqr(rxmax)+sqr(rzmax)),ffFixed,4,diap);
Form6.Edit12.Text:=FloatToStrf(sqrt(sqr(rymax)+sqr(rzmax)),ffFixed,4,diap);
//Диаметр
Form6.Edit13.Text:=FloatToStrf(sqrt(sqr(rxmax)+sqr(rymax)+sqr(rzmax)),ffFixed,4,diap);


end;


procedure TForm6.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9','.',',': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

procedure TForm6.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9','.',',': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

procedure TForm6.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9','.',',': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

procedure TForm6.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm6.Edit2KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm6.Edit3KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm6.BitButton1Click(Sender: TObject);
var i,j,j1,j2,j3,a,b,c,rzn,rzn1,s,razryd: Integer;
d,e,f1: real;
f: TextFile;
src_start_temp,src_route_temp,src_title_temp,src_mult_temp: array of widestring;
probel,astr: WideString;
povtor: boolean;
begin
povtor:=false;

x_tr:=nil;
y_tr:=nil;
z_tr:=nil;

if pos(',',Form6.Edit4.Text)<>0 then
DecimalSeparator := ',';
if pos('.',Form6.Edit4.Text)<>0 then
DecimalSeparator := '.';

if pos(',',Form6.Edit5.Text)<>0 then
DecimalSeparator := ',';
if pos('.',Form6.Edit5.Text)<>0 then
DecimalSeparator := '.';

if pos(',',Form6.Edit6.Text)<>0 then
DecimalSeparator := ',';
if pos('.',Form6.Edit6.Text)<>0 then
DecimalSeparator := '.';







if identificator=1 then s:=1;
if identificator=2 then s:=0;
if identificator=3 then s:=0;
if identificator=4 then s:=1;
if Edit1.Text='' then a:=0;
if Edit2.Text='' then b:=0;
if Edit3.Text='' then c:=0;
if Edit1.Text<>'' then a:=strtointdef(Edit1.Text,0);
if Edit2.Text<>'' then b:=strtointdef(Edit2.Text,0);
if Edit3.Text<>'' then c:=strtointdef(Edit3.Text,0);

if Edit4.Text='' then d:=0;
if Edit5.Text='' then e:=0;
if Edit6.Text='' then f1:=0;
if Edit1.Text<>'' then d:=strtofloatdef(Edit4.Text,5);
if Edit2.Text<>'' then e:=strtofloatdef(Edit5.Text,5);
if Edit3.Text<>'' then f1:=strtofloatdef(Edit6.Text,5);

probel:='';
for i:=0 to 100 do
probel:=probel+' ';




SetLength(x_tr,a+1,nomer_atoma+1);
SetLength(y_tr,b+1,nomer_atoma+1);
SetLength(z_tr,c+1,nomer_atoma+1);
rzn:=0;
rzn1:=0;
if identificator<>4 then begin
for i:=1 to nomer_atoma-s do begin
for j1:=0 to a do begin
if (Round(j1/2)-(j1/2)<>0) or (j1=0) then begin x_tr[j1][i]:=floattostrf((strtofloat(x[i])+(j1-rzn)*d),ffFixed,8,8); if j1<>0 then rzn1:=rzn1+1; end
else begin x_tr[j1][i]:=floattostrf(strtofloat(x[i])-(j1-rzn1)*d,ffFixed,8,8); rzn:=rzn+1; end;         //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
for j2:=0 to b do begin
if (Round(j2/2)-(j2/2)<>0) or (j2=0) then begin y_tr[j2][i]:=floattostrf((strtofloat(y[i])+(j2-rzn)*e),ffFixed,8,8); if j2<>0 then rzn1:=rzn1+1; end
else begin y_tr[j2][i]:=floattostrf(strtofloat(y[i])-(j2-rzn1)*e,ffFixed,8,8); rzn:=rzn+1; end;            //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
for j3:=0 to c do begin
if (Round(j3/2)-(j3/2)<>0)  or (j3=0) then begin z_tr[j3][i]:=floattostrf((strtofloat(z[i])+(j3-rzn)*f1),ffFixed,8,8); if j3<>0 then rzn1:=rzn1+1; end
else begin z_tr[j3][i]:=floattostrf(strtofloat(z[i])-(j3-rzn1)*f1,ffFixed,8,8); rzn:=rzn+1; end;          //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
end;
end
else begin   //если out-файл
for i:=1 to nomer_atoma-s do begin
for j1:=0 to a do begin
if (Round(j1/2)-(j1/2)<>0) or (j1=0) then begin x_tr[j1][i]:=floattostrf((strtofloat(xout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])+(j1-rzn)*d),ffFixed,8,8); if j1<>0 then rzn1:=rzn1+1; end
else begin x_tr[j1][i]:=floattostrf(strtofloat(xout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-(j1-rzn1)*d,ffFixed,8,8); rzn:=rzn+1; end;       //это для центровки молекулы по полю
end;
rzn:=0;
for j2:=0 to b do begin
if (Round(j2/2)-(j2/2)<>0) or (j2=0) then begin y_tr[j2][i]:=floattostrf((strtofloat(yout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])+(j2-rzn)*e),ffFixed,8,8); if j2<>0 then rzn1:=rzn1+1; end
else begin y_tr[j2][i]:=floattostrf(strtofloat(yout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-(j2-rzn1)*e,ffFixed,8,8); rzn:=rzn+1; end;          //это для центровки молекулы по полю
end;
rzn:=0;
for j3:=0 to c do begin
if (Round(j3/2)-(j3/2)<>0)  or (j3=0) then begin z_tr[j3][i]:=floattostrf((strtofloat(zout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])+(j3-rzn)*f1),ffFixed,8,8); if j3<>0 then rzn1:=rzn1+1; end
else begin z_tr[j3][i]:=floattostrf(strtofloat(zout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-(j3-rzn1)*f1,ffFixed,8,8); rzn:=rzn+1; end;           //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
end;
end;



if Form6.SaveDialog1.Execute=True then begin
if  pos('.gjf',Savedialog1.Filename)<>0 then astr:=Savedialog1.Filename
else astr:=Savedialog1.Filename+'.gjf';

razryd:=8;
AssignFile(f,astr);
Rewrite(f);
if (src_route=nil) and (src_mult=nil) then begin
WriteLn(f,'%chk=task.chk');
WriteLn(f,'# HF/3-21G SP');
WriteLn(f,'');
WriteLn(f,'title');
WriteLn(f,'');
WriteLn(f,'0 1 ! *** Attention!!! ***: Check Charge and Multiplicity and change if need!');
end
else begin
/////////////////УДАЛЕНИЕ ПОВТОРОВ///////////////////////////
for i:=0 to length(src_start)-1 do begin
if i=0 then begin
SetLength(src_start_temp,length(src_start_temp)+1);
src_start_temp[length(src_start_temp)-1]:=src_start[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_start[i]=src_start[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_start_temp,length(src_start_temp)+1);
src_start_temp[length(src_start_temp)-1]:=src_start[i];
end;
end;
end;
Setlength(src_start,length(src_start_temp));
for i:=0 to length(src_start)-1 do
src_start[i]:=src_start_temp[i];
////////////////////////////////////////////////////////////////

/////////////////УДАЛЕНИЕ ПОВТОРОВ///////////////////////////
for i:=0 to length(src_route)-1 do begin
if i=0 then begin
SetLength(src_route_temp,length(src_route_temp)+1);
src_route_temp[length(src_route_temp)-1]:=src_route[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_route[i]=src_route[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_route_temp,length(src_route_temp)+1);
src_route_temp[length(src_route_temp)-1]:=src_route[i];
end;
end;
end;
Setlength(src_route,length(src_route_temp));
for i:=0 to length(src_route)-1 do
src_route[i]:=src_route_temp[i];
////////////////////////////////////////////////////////////////

/////////////////УДАЛЕНИЕ ПОВТОРОВ///////////////////////////
for i:=0 to length(src_title)-1 do begin
if i=0 then begin
SetLength(src_title_temp,length(src_title_temp)+1);
src_title_temp[length(src_title_temp)-1]:=src_title[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_title[i]=src_title[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_title_temp,length(src_title_temp)+1);
src_title_temp[length(src_title_temp)-1]:=src_title[i];
end;
end;
end;
Setlength(src_title,length(src_title_temp));
for i:=0 to length(src_title)-1 do
src_title[i]:=src_title_temp[i];
////////////////////////////////////////////////////////////////

/////////////////УДАЛЕНИЕ ПОВТОРОВ///////////////////////////
for i:=0 to length(src_mult)-1 do begin
if i=0 then begin
SetLength(src_mult_temp,length(src_mult_temp)+1);
src_mult_temp[length(src_mult_temp)-1]:=src_mult[i];
end;
povtor:=false;
if i>0 then begin
for j:=1 to i do
if src_mult[i]=src_mult[i-j] then povtor:=true;
if povtor=false then begin
SetLength(src_mult_temp,length(src_mult_temp)+1);
src_mult_temp[length(src_mult_temp)-1]:=src_mult[i];
end;
end;
end;
Setlength(src_mult,length(src_mult_temp));
for i:=0 to length(src_mult)-1 do
src_mult[i]:=src_mult_temp[i];
////////////////////////////////////////////////////////////////
if src_start<>nil then begin
for i:=0 to length(src_start)-1 do
if src_start[i]<>'' then WriteLn(f,src_start[i]);   //стартовая секция
end;
if src_route<>nil then begin
for i:=0 to length(src_route)-1 do
if src_route[i]<>'' then WriteLn(f,src_route[i]);   //маршрутная секция
end;
WriteLn(f,'');
if src_title<>nil then begin
for i:=0 to length(src_title)-1 do
if src_title[i]<>'' then WriteLn(f,src_title[i]);   //заголовок
end;
WriteLn(f,'');
if src_mult<>nil then begin
for i:=0 to length(src_mult)-1 do
if src_mult[i]<>'' then WriteLn(f,src_mult[i]);     //мультиплетность и заряд
end;
end;


for j1:=0 to a do begin
for j2:=0 to b do begin
for j3:=0 to c do begin
for i:=1 to nomer_atoma-s do begin
//if Form1.OpenDialog1.FilterIndex=1 then WriteLn(f, ' '+atom_store[i]+copy(probel,1,16-length(atom_store[i])-pos('.',x_tr[j1][i]))   +x_tr[j1][i]+copy(probel,1,12-pos('.',y_tr[j2][i]))        +y_tr[j2][i]+copy(probel,1,12-pos('.',z_tr[j3][i]))+z_tr[j3][i]);
//if (Form1.OpenDialog1.FilterIndex=2) or (Form1.OpenDialog1.FilterIndex=3) then WriteLn(f, ' '+atomoutel[nomer_cycla][i]+copy(probel,1,16-length(atomoutel[nomer_cycla][i])-pos('.',x_tr[j1][i]))+x_tr[j1][i]+copy(probel,1,12-pos('.',y_tr[j2][i]))+y_tr[j2][i]+copy(probel,1,12-pos('.',z_tr[j3][i]))+z_tr[j3][i]);
if Form1.OpenDialog1.FilterIndex=1 then  WriteLn(f, ' '+atom_store[i] + copy(probel,1,razryd+14-length(floattostrf(strtofloat(x_tr[j1,i]),ffFixed,10,razryd))) + floattostrf(strtofloat(x_tr[j1,i]),ffFixed,10,razryd)  + copy(probel,1,razryd+8-length(floattostrf(strtofloat(y_tr[j2,i]),ffFixed,10,razryd))) + floattostrf(strtofloat(y_tr[j2,i]),ffFixed,10,razryd)  +  copy(probel,1,razryd+8-length(floattostrf(strtofloat(z_tr[j3,i]),ffFixed,10,razryd))) + floattostrf(strtofloat(z_tr[j3,i]),ffFixed,10,razryd));
if (Form1.OpenDialog1.FilterIndex=2) or (Form1.OpenDialog1.FilterIndex=3) then  WriteLn(f, ' '+atomoutel[nomer_cycla,i] + copy(probel,1,razryd+14-length(floattostrf(strtofloat(x_tr[j1,i]),ffFixed,10,razryd))) + floattostrf(strtofloat(x_tr[j1,i]),ffFixed,10,razryd)  + copy(probel,1,razryd+8-length(floattostrf(strtofloat(y_tr[j2,i]),ffFixed,10,razryd))) + floattostrf(strtofloat(y_tr[j2,i]),ffFixed,10,razryd)  +  copy(probel,1,razryd+8-length(floattostrf(strtofloat(z_tr[j3,i]),ffFixed,10,razryd))) + floattostrf(strtofloat(z_tr[j3,i]),ffFixed,10,razryd));
end;
end;
end;
end;
WriteLn(f,'');
WriteLn(f,'');
CloseFile(f);
end;
end;









procedure TForm6.BitButton3Click(Sender: TObject);
begin
Form8.Show;
end;

procedure TForm6.BitButton4Click(Sender: TObject);
var f: TextFile;
rx,ry,rz,rxmax,rymax,rzmax: real;
k,i,j,razr: Integer;
probel:WideString;
begin

if (Dial=true) and  (Form6.ComboBox1.Enabled=True)  then   begin
  probel:='';
for i:=0 to 100 do
probel:=probel+' ';

razr:=3;  //число знаков после запятой (настройка)
rxmax:=0;
rymax:=0;
rzmax:=0;
if SaveDialog2.Execute=True then begin
  saveDialog2.DefaultExt:='txt';
  AssignFile(f,SaveDialog2.FileName+'.txt');
  Rewrite(f);
  Writeln(f,'                   Linear parameters of system: Axes, Planes and Diameter');
  Writeln(f,'');
  Writeln(f,' --------------------------------------------------------------------------------------------');
  Writeln(f,'   '+'Step#'+'   '+'Rx(max),A'+'   '+'Ry(max),A'+'   '+'Rz(max),A'+'   '+'Rxy(max),A'+'   '+'Rxz(max),A'+'   '+'Ryz(max),A'+'    '+'D,A');
  Writeln(f,' --------------------------------------------------------------------------------------------');
  Writeln(f,'');
//Series1.AddXY(strtofloat(Form3.Edit2.Text),0,'',clred);
for k:=1 to nomer_cycla do begin
for i:=1 to nomer_atoma do begin
for j:=i+1 to nomer_atoma-1 do  begin
rx:=Abs(strtofloat(xout[k][i])-strtofloat(xout[k][j]));
if rx>=rxmax then rxmax:=rx;
ry:=Abs(strtofloat(yout[k][i])-strtofloat(yout[k][j]));
if ry>=rymax then rymax:=ry;
rz:=Abs(strtofloat(zout[k][i])-strtofloat(zout[k][j]));
if rz>=rzmax then rzmax:=rz;
end;
end;
Writeln(f,copy(probel,1,6-length(inttostr(k)))+inttostr(k)+  copy(probel,1,8-pos('.',floattostrf(rxmax,ffFixed,4,razr)))+  floattostrf(rxmax,ffFixed,4,razr)+copy(probel,1,9-pos('.',floattostrf(rymax,ffFixed,4,razr)))+floattostrf(rymax,ffFixed,4,razr)+copy(probel,1,9-pos('.',floattostrf(rzmax,ffFixed,4,razr)))+floattostrf(rzmax,ffFixed,4,razr)+copy(probel,1,10-pos('.',floattostrf(sqrt(sqr(rxmax)+sqr(rymax)),ffFixed,4,razr)))+floattostrf(sqrt(sqr(rxmax)+sqr(rymax)),ffFixed,4,razr)+copy(probel,1,10-pos('.',floattostrf(sqrt(sqr(rxmax)+sqr(rzmax)),ffFixed,4,razr)))+floattostrf(sqrt(sqr(rxmax)+sqr(rzmax)),ffFixed,4,razr)+copy(probel,1,10-pos('.',floattostrf(sqrt(sqr(rymax)+sqr(rzmax)),ffFixed,4,razr)))+floattostrf(sqrt(sqr(rymax)+sqr(rzmax)),ffFixed,4,razr)+copy(probel,1,9-pos('.',floattostrf(sqrt(sqr(rxmax)+sqr(rymax)+sqr(rzmax)),ffFixed,4,razr)))+floattostrf(sqrt(sqr(rxmax)+sqr(rymax)+sqr(rzmax)),ffFixed,4,razr));




end;

 Writeln(f,' --------------------------------------------------------------------------------------------');
 Writeln(f,'');
 CloseFile(f);
 end;
end;
 end;
















procedure TForm6.BitBtn1Click(Sender: TObject);
var i,j1,j2,j3,a,b,c,rzn,rzn1,s,g,j,nj1,nj2,nj3: Integer;
d,e,f1: real;
f: TextFile;
probel,astr: WideString;
begin
x_tr:=nil;
y_tr:=nil;
z_tr:=nil;

x_draw:=nil;
y_draw:=nil;
z_draw:=nil;

x_draw_out:=nil;
y_draw_out:=nil;
z_draw_out:=nil;

x_1:=nil;
y_1:=nil;
z_1:=nil;

scal:=0;
D1:=0;
xinv:=0;
yinv:=0;
zinv:=0;

bonds_painted:=false;
are_bonds:=nil;

if pos(',',Form6.Edit4.Text)<>0 then
DecimalSeparator := ',';
if pos('.',Form6.Edit4.Text)<>0 then
DecimalSeparator := '.';

if pos(',',Form6.Edit5.Text)<>0 then
DecimalSeparator := ',';
if pos('.',Form6.Edit5.Text)<>0 then
DecimalSeparator := '.';

if pos(',',Form6.Edit6.Text)<>0 then
DecimalSeparator := ',';
if pos('.',Form6.Edit6.Text)<>0 then
DecimalSeparator := '.';

if Form1.OpenDialog1.FilterIndex=3 then identificator:=4;

if identificator=1 then s:=1;
if identificator=2 then s:=0;
if identificator=3 then s:=0;
if identificator=4 then s:=0;
if Edit1.Text='' then a:=0;
if Edit2.Text='' then b:=0;
if Edit3.Text='' then c:=0;
if Edit1.Text<>'' then a:=strtointdef(Edit1.Text,0);
if Edit2.Text<>'' then b:=strtointdef(Edit2.Text,0);
if Edit3.Text<>'' then c:=strtointdef(Edit3.Text,0);

if Edit4.Text='' then d:=0;
if Edit5.Text='' then e:=0;
if Edit6.Text='' then f1:=0;
if Edit4.Text<>'' then d:=strtofloatdef(Edit4.Text,5);
if Edit5.Text<>'' then e:=strtofloatdef(Edit5.Text,5);
if Edit6.Text<>'' then f1:=strtofloatdef(Edit6.Text,5);


probel:='';
for i:=0 to 100 do
probel:=probel+' ';


if Form1.OpenDialog1.FilterIndex=1 then begin

SetLength(x_tr,a+1,nomer_atoma+1);
SetLength(y_tr,b+1,nomer_atoma+1);
SetLength(z_tr,c+1,nomer_atoma+1);
rzn:=0;
rzn1:=0;
for i:=1 to nomer_atoma-s do begin
for j1:=0 to a do begin
if (Round(j1/2)-(j1/2)<>0) or (j1=0) then begin x_tr[j1][i]:=floattostrf((strtofloat(x[i])+(j1-rzn)*d),ffFixed,8,8); if j1<>0 then rzn1:=rzn1+1; end
else begin x_tr[j1][i]:=floattostrf(strtofloat(x[i])-(j1-rzn1)*d,ffFixed,8,8); rzn:=rzn+1; end;         //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
for j2:=0 to b do begin
if (Round(j2/2)-(j2/2)<>0) or (j2=0) then begin y_tr[j2][i]:=floattostrf((strtofloat(y[i])+(j2-rzn)*e),ffFixed,8,8); if j2<>0 then rzn1:=rzn1+1; end
else begin y_tr[j2][i]:=floattostrf(strtofloat(y[i])-(j2-rzn1)*e,ffFixed,8,8); rzn:=rzn+1; end;            //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
for j3:=0 to c do begin
if (Round(j3/2)-(j3/2)<>0)  or (j3=0) then begin z_tr[j3][i]:=floattostrf((strtofloat(z[i])+(j3-rzn)*f1),ffFixed,8,8); if j3<>0 then rzn1:=rzn1+1; end
else begin z_tr[j3][i]:=floattostrf(strtofloat(z[i])-(j3-rzn1)*f1,ffFixed,8,8); rzn:=rzn+1; end;          //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
end;


setlength(x_draw,(nomer_atoma-s)*(a+1)*(b+1)*(c+1)+1);
setlength(y_draw,(nomer_atoma-s)*(a+1)*(b+1)*(c+1)+1);
setlength(z_draw,(nomer_atoma-s)*(a+1)*(b+1)*(c+1)+1);


nj1:=-1;
nj2:=-1;
nj3:=-1;
for j1:=0 to a do begin
nj1:=nj1+1;
for j2:=0 to b do begin
nj2:=nj2+1;
for j3:=0 to c do begin
nj3:=nj3+1;
for i:=1 to nomer_atoma-s do begin
x_draw[i+(nj3)*(nomer_atoma-s)]:= x_tr[j1][i];
y_draw[i+(nj3)*(nomer_atoma-s)]:= y_tr[j2][i];
z_draw[i+(nj3)*(nomer_atoma-s)]:= z_tr[j3][i];
end;
end;
end;
end;


g:= (a+1)*(b+1)*(c+1);


setlength(atom_store,(nomer_atoma-s)*(a+1)*(b+1)*(c+1)+1);
for i:=1 to g-1 do  begin
for j:=1 to nomer_atoma-s do begin
atom_store[j+i*(nomer_atoma-s)]:=atom_store[j];
end;
end;

SetLength(atom_store,Length(atom_store)+1);     ///21.08.17
SetLength(x_draw,length(x_draw)+1);
SetLength(y_draw,length(y_draw)+1);
SetLength(z_draw,length(z_draw)+1);
end;



//////////////////////////////TRANSLATING OUT & XYZ /////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////





if (Form1.OpenDialog1.FilterIndex=2) or (Form1.OpenDialog1.FilterIndex=3) then begin


SetLength(x_tr,a+1,nomer_atoma+1);
SetLength(y_tr,b+1,nomer_atoma+1);
SetLength(z_tr,c+1,nomer_atoma+1);
rzn:=0;
rzn1:=0;

for i:=1 to nomer_atoma-s do begin
for j1:=0 to a do begin
if (Round(j1/2)-(j1/2)<>0) or (j1=0) then begin x_tr[j1][i]:=floattostrf((strtofloat(xout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])+(j1-rzn)*d),ffFixed,8,8); if j1<>0 then rzn1:=rzn1+1; end
else begin x_tr[j1][i]:=floattostrf(strtofloat(xout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-(j1-rzn1)*d,ffFixed,8,8); rzn:=rzn+1; end;       //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
for j2:=0 to b do begin
if (Round(j2/2)-(j2/2)<>0) or (j2=0) then begin y_tr[j2][i]:=floattostrf((strtofloat(yout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])+(j2-rzn)*e),ffFixed,8,8); if j2<>0 then rzn1:=rzn1+1; end
else begin y_tr[j2][i]:=floattostrf(strtofloat(yout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-(j2-rzn1)*e,ffFixed,8,8); rzn:=rzn+1; end;          //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
for j3:=0 to c do begin
if (Round(j3/2)-(j3/2)<>0)  or (j3=0) then begin z_tr[j3][i]:=floattostrf((strtofloat(zout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])+(j3-rzn)*f1),ffFixed,8,8); if j3<>0 then rzn1:=rzn1+1; end
else begin z_tr[j3][i]:=floattostrf(strtofloat(zout[strtoint(Copy(ComboBox1.Text,1,Pos(' ',ComboBox1.Text)-1))][i])-(j3-rzn1)*f1,ffFixed,8,8); rzn:=rzn+1; end;           //это для центровки молекулы по полю
end;
rzn:=0;
rzn1:=0;
end;

//setlength(x_draw_out,nomer_cycla+1,nomer_atoma+1);
//setlength(y_draw_out,nomer_cycla+1,nomer_atoma+1);
//setlength(z_draw_out,nomer_cycla+1,nomer_atoma+1);


setlength(x_draw_out,2,(nomer_atoma-s)*(a+1)*(b+1)*(c+1)+1);
setlength(y_draw_out,2,(nomer_atoma-s)*(a+1)*(b+1)*(c+1)+1);
setlength(z_draw_out,2,(nomer_atoma-s)*(a+1)*(b+1)*(c+1)+1);


nj1:=-1;
nj2:=-1;
nj3:=-1;
for j1:=0 to a do begin
nj1:=nj1+1;
for j2:=0 to b do begin
nj2:=nj2+1;
for j3:=0 to c do begin
nj3:=nj3+1;
for i:=1 to nomer_atoma-s do begin
x_draw_out[1,i+(nj3)*(nomer_atoma-s)]:= x_tr[j1][i];
y_draw_out[1,i+(nj3)*(nomer_atoma-s)]:= y_tr[j2][i];
z_draw_out[1,i+(nj3)*(nomer_atoma-s)]:= z_tr[j3][i];
end;
end;
end;
end;


g:= (a+1)*(b+1)*(c+1);



setlength(atomoutel,2,(nomer_atoma-s)*(a+1)*(b+1)*(c+1)+1);
for i:=1 to g-1 do  begin
for j:=1 to nomer_atoma-s do begin
atomoutel[1,j+i*(nomer_atoma-s)]:=atomoutel[1,j];
end;
end;

//nomer_atoma:=nomer_atoma*g;

setlength(dx,nomer_atoma*g+1);
setlength(dy,nomer_atoma*g+1);
setlength(dz,nomer_atoma*g+1);
 for i:=0 to nomer_atoma*g do begin
dx[i]:=0;
dy[i]:=0;
dz[i]:=0;
end;


SetLength(atomoutel,Length(atomoutel),Length(atomoutel[0])+1);
//SetLength(x_draw_out,Length(x_draw_out),Length(x_draw_out[0])+1);
//SetLength(y_draw_out,Length(y_draw_out),Length(y_draw_out[0])+1);
//SetLength(z_draw_out,Length(z_draw_out),Length(z_draw_out[0])+1);


 nc:=1;





end;







































scal:=0;
Form36.Show;







end;

end.
