unit Unit67;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Chart, Series, Math;

type
  TForm67 = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form67: TForm67;
  TCh3: array of TChart;
  num_chart3: word=0;

implementation

uses Unit1,Unit24,Unit64,Unit65,Unit66;

{$R *.dfm}


function MinMaxChrg(var X: MyType): String;
var i,j: integer;
Y: array of double;
begin
for j:=0 to length(X[Form67.ComboBox2.ItemIndex])-1 do begin
if X[Form67.ComboBox2.ItemIndex,j]<>'' then begin
SetLength(Y,length(Y)+1);
Y[length(Y)-1]:=strtofloat(X[Form67.ComboBox2.ItemIndex,j]);
end;
end;
Result:=floattostr(MinValue(Y))+'='+floattostr(MaxValue(Y));
end;





procedure TForm67.FormShow(Sender: TObject);
var spin,pot: boolean;
i: integer;
begin
spin:=false;
pot:=false;
Combobox1.Clear;
Combobox2.Clear;
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

Combobox1.Items.Add('?????');
if spin=true then Combobox1.Items.Add('???????? ?????????');
if pot=true then Combobox1.Items.Add('?????????????????? ?????????');

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

Combobox1.Items.Add('?????');
if spin=true then Combobox1.Items.Add('???????? ?????????');
if pot=true then Combobox1.Items.Add('?????????????????? ?????????');

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

end;

Combobox2.ItemIndex:=Combobox2.Items.Count-1;
end;

procedure TForm67.FormResize(Sender: TObject);
var i: integer;
begin
if Form67.FindComponent('TCh'+inttostr(num_chart3-1)) as TChart<>nil then begin
for i:=0 to length(TCh3)-1 do
TCh3[i].Width:=Form67.ClientWidth-10;
end;
end;




procedure TForm67.BitBtn1Click(Sender: TObject);
var i: word;
begin
if TCh3<>nil then begin
i:=0;
Repeat
if TCh3[i]<>nil then FreeAndNil(TCh3[i]);
i:=i+1;
until i>=num_chart3;
end;
num_chart3:=0;
end;

procedure TForm67.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form67.ScrollBox1.VertScrollBar.Position:=Form67.ScrollBox1.VertScrollBar.Position-20;
end;

procedure TForm67.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form67.ScrollBox1.VertScrollBar.Position:=Form67.ScrollBox1.VertScrollBar.Position+20;
end;

procedure TForm67.BitBtn2Click(Sender: TObject);
var posi_scroll,i: integer;
Series: TBarSeries;
energ_r: array of double;
begin
posi_scroll:=Form67.ScrollBox1.VertScrollBar.Position;
Form67.ScrollBox1.VertScrollBar.Position:=0;
setlength(TCh3,num_chart3+1);
TCh3[num_chart3]:=TChart.Create(self);
with TCh3[num_chart3] do begin
Parent:=Form67.ScrollBox1;
Name:='TCh'+inttostr(num_chart3);
Left:=0;
Top:=65*(6*num_chart2+1)-55;
Width:=Form67.ClientWidth-10;
Height:=400;
View3D:=False;
Visible:=True;
BevelInner:=bvNone;
BevelOuter:=bvNone;
BorderStyle:=bsNone;

BottomAxis.Title.Caption:='????? ????? ? ???????';
if pos('?????',Form67.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form67.Combobox1.Text+', ?.?.';
TCh3[num_chart3].Title.Text.Add('????????????? ??????? ? ??????? '+ Form64.Combobox1.Text);
end;
if pos('???????? ?????????',Form67.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form67.Combobox1.Text+', ?.?.';
TCh3[num_chart3].Title.Text.Add('????????????? ???????? ????????? ? ??????? '+ Form64.Combobox1.Text);
end;
if pos('?????????????????? ?????????',Form67.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form67.Combobox1.Text+', ?.?.';
TCh3[num_chart3].Title.Text.Add('????????????? ??????????????????? ?????????? ? ??????? '+ Form64.Combobox1.Text);
end;


BottomAxis.Title.Font.Size:=11;
BottomAxis.Title.Font.Name:='Tahoma';
LeftAxis.Title.Font.Size:=11;
LeftAxis.Title.Font.Name:='Tahoma';
RightAxis.Title.Font.Size:=11;
RightAxis.Title.Font.Name:='Tahoma';
TopAxis.Visible:=False;
Legend.Visible:=False;
LeftAxis.Grid.Visible:=false;
RightAxis.Grid.Visible:=false;
BottomAxis.Grid.Visible:=false;
BottomAxis.MinorTicks.Visible:=false;
TCh3[num_chart3].Title.Font.Size:=12;
TCh3[num_chart3].Frame.Visible:=false;
TCh3[num_chart3].Align:=alTop;
end;


Series:=TBarSeries.Create(TCh3[num_chart3]);

Series.BarStyle:=bsRectangle;   // ??? ????? - ????? ? ????????? ??????? (bsRectangleGradient - ? ??????????)
Series.BarWidthPercent:=95;     // ????????? ??????? ????? ???? ? ?????
Series.Marks.Visible:=True;     // ???????? ??????? ?? ???????????
if dial=true then begin
if Combobox1.Text='?????' then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(mull[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(mull[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(mull[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(mull[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(mull[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(mull[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(mbs_mull[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(mbs_mull[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(mbs_mull[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(mbs_mull[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(mbs_mull[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(mbs_mull[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(bond_mull[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(bond_mull[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(bond_mull[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(bond_mull[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(bond_mull[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(bond_mull[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(esp[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(esp[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(esp[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(esp[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(esp[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(esp[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(hir[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(hir[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(hir[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(hir[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(hir[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(hir[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='CM5' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(cm5[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(cm5[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(cm5[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(cm5[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(cm5[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(cm5[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='NBO' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(nbo[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(nbo[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(nbo[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(nbo[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(nbo[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(nbo[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='AIM' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(aim[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(aim[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(aim[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(aim[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(aim[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(aim[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(lo[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(lo[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(lo[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(lo[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(lo[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(lo[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='APT' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(apt[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(apt[Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(apt[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt)))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(apt[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(apt[Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(apt[Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
end;

if pos('???????? ?????????',Form67.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if StrToFloat(mull_spin[Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(mull_spin[Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(mull_spin[Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(mull_spin[Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if StrToFloat(mbs_mull_spin[Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(mbs_mull_spin[Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(mbs_mull_spin[Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(mbs_mull_spin[Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if StrToFloat(bond_mull_spin[Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(bond_mull_spin[Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(bond_mull_spin[Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(bond_mull_spin[Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if StrToFloat(esp_spin[Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(esp_spin[Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(esp_spin[Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(esp_spin[Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if StrToFloat(hir_spin[Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(hir_spin[Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(hir_spin[Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(hir_spin[Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if StrToFloat(lo_spin[Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(lo_spin[Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(lo_spin[Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(lo_spin[Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='APT' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if StrToFloat(apt_spin[Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(apt_spin[Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(apt_spin[Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(apt_spin[Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
end;
if pos('?????????????????? ?????????',Form67.ComboBox1.Text)<>0 then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
Series.AddXY(i,StrToFloat(poten[Combobox2.ItemIndex,i-1]),'',RGB(137,0,222));//?????????? ?????????? ? ??????
end;
end;

end
else begin

if Combobox1.Text='?????' then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(mull_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(mull_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(mull_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(mull_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(mull_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Bonding mull_multiken' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(esp_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(esp_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(esp_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(esp_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(esp_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(hir_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(hir_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(hir_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(hir_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(hir_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='CM5' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(cm5_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(cm5_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(cm5_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(cm5_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(cm5_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='NBO' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(nbo_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(nbo_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(nbo_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(nbo_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(nbo_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='AIM' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(aim_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(aim_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(aim_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(aim_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(aim_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(lo_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(lo_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(lo_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(lo_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(lo_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='APT' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if  StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(0,     Round(255 * StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(apt_mult[basket[Form64.ComboBox1.ItemIndex]]),pos('=',MinMaxChrg(apt_mult[basket[Form64.ComboBox1.ItemIndex]]))+1,length(MinMaxChrg(apt_mult[basket[Form64.ComboBox1.ItemIndex]])))))                ,0));//?????????? ?????????? ? ??????
if  StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(Round(255 * StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]) / StrToFloat  (Copy(MinMaxChrg(apt_mult[basket[Form64.ComboBox1.ItemIndex]]),1,pos('=',MinMaxChrg(apt_mult[basket[Form64.ComboBox1.ItemIndex]]))-1))) ,0 ,0));//?????????? ?????????? ? ??????
end;
end;
end;

if pos('???????? ?????????',Form67.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if StrToFloat(mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then  Series.AddXY(i,StrToFloat(mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then  Series.AddXY(i,StrToFloat(mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if StrToFloat(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if StrToFloat(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if StrToFloat(esp_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(esp_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(esp_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(esp_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if StrToFloat(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if StrToFloat(lo_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(lo_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(lo_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(lo_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
if Form64.ComboBox2.Text='APT' then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
if StrToFloat(apt_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])<0  then Series.AddXY(i,StrToFloat(apt_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(255,85,0));//?????????? ?????????? ? ??????
if StrToFloat(apt_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1])>=0 then Series.AddXY(i,StrToFloat(apt_spin_mult[basket[Form64.Combobox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(10,171,91));//?????????? ?????????? ? ??????
end;
end;
end;
if pos('?????????????????? ?????????',Form67.ComboBox1.Text)<>0 then begin
for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then begin
Series.AddXY(i,StrToFloat(poten_mult[basket[Form64.ComboBox1.ItemIndex],Combobox2.ItemIndex,i-1]),'',RGB(137,0,222));//?????????? ?????????? ? ??????
end;
end;


end;




TCh3[num_chart3].AddSeries(Series);//?????????? ?????? ? ?????????


ScrollBox1.VertScrollBar.Position:=9999999;
num_chart3:=num_chart3+1;



end;

end.
