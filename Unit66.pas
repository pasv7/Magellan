unit Unit66;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Chart, Series, TeEngine, TeeProcs;

type
  TForm66 = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form66: TForm66;
  TCh2: array of TChart;
  num_chart2: word=0;

implementation

uses Unit1,Unit24,Unit64,Unit65;

{$R *.dfm}

procedure TForm66.FormShow(Sender: TObject);
var spin,dip,pot: boolean;
i: integer;
begin
spin:=false;
dip:=false;
pot:=false;
Combobox1.Clear;
Combobox2.Clear;
Combobox2.Visible:=True;
Label2.Visible:=True;
if dial=true then begin
if  Form64.Combobox2.Text='Mulliken' then begin
if mull_spin[0,0]<>'' then spin:=true;
if dip_mull[0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='MBS Mulliken' then begin
if mbs_mull_spin[0,0]<>'' then spin:=true;
if dip_mull[0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='Bonding Mulliken' then begin
if bond_mull_spin[0,0]<>'' then spin:=true;
if dip_mull[0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='ESP' then begin
if esp_spin[0,0]<>'' then spin:=true;
if dip_esp[0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='Hirshfeld' then begin
if hir_spin[0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='Lowdin' then begin
if lo_spin[0,0]<>'' then spin:=true;
if dip_lo[0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='APT' then begin
if apt_spin[0,0]<>'' then spin:=true;
end;
if poten[0,0]<>'' then pot:=true;

// ##########################################################

Combobox1.Items.Add('Заряд');
if spin=true then Combobox1.Items.Add('Спиновая плотность');
if dip=true then Combobox1.Items.Add('Дипольный момент');
if pot=true then Combobox1.Items.Add('Электростатический потенциал');

Combobox1.ItemIndex:=0;

for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then  Combobox2.Items.Add(inttostr(i)+'('+atomoutel[1,i]+')');

Combobox2.ItemIndex:=0;

end
else begin

if  Form64.Combobox2.Text='Mulliken' then begin
if mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
if dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='MBS Mulliken' then begin
if mbs_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
if dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='Bonding Mulliken' then begin
if bond_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
if dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='ESP' then begin
if esp_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
if dip_esp_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='Hirshfeld' then begin
if hir_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if  Form64.Combobox2.Text='Lowdin' then begin
if lo_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
if dip_lo_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then dip:=true;
end;
if  Form64.Combobox2.Text='APT' then begin
if apt_spin_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then spin:=true;
end;
if poten_mult[basket[Form64.ComboBox1.ItemIndex],0,0]<>'' then pot:=true;

// ##########################################################

Combobox1.Items.Add('Заряд');
if spin=true then Combobox1.Items.Add('Спиновая плотность');
if dip=true then Combobox1.Items.Add('Дипольный момент');
if pot=true then Combobox1.Items.Add('Электростатический потенциал');

Combobox1.ItemIndex:=0;

for i:=1 to length(atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1])-1 do
if atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]<>'' then  Combobox2.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form64.ComboBox1.ItemIndex],1,i]+')');

Combobox2.ItemIndex:=0;

end;
end;





procedure TForm66.FormResize(Sender: TObject);
var i: integer;
begin
if Form66.FindComponent('TCh'+inttostr(num_chart2-1)) as TChart<>nil then begin
for i:=0 to length(TCh2)-1 do
TCh2[i].Width:=Form66.ClientWidth-10;
end;
end;





procedure TForm66.BitBtn1Click(Sender: TObject);
var i: word;
begin
if TCh2<>nil then begin
i:=0;
Repeat
if TCh2[i]<>nil then FreeAndNil(TCh2[i]);
i:=i+1;
until i>=num_chart2;
end;
num_chart2:=0;
end;





procedure TForm66.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form66.ScrollBox1.VertScrollBar.Position:=Form66.ScrollBox1.VertScrollBar.Position-20;
end;




procedure TForm66.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form66.ScrollBox1.VertScrollBar.Position:=Form66.ScrollBox1.VertScrollBar.Position+20;
end;




procedure TForm66.BitBtn2Click(Sender: TObject);
var posi_scroll,i: integer;
Series: TLineSeries;
energ_r: array of double;
begin
posi_scroll:=Form66.ScrollBox1.VertScrollBar.Position;
Form66.ScrollBox1.VertScrollBar.Position:=0;
setlength(TCh2,num_chart2+1);
TCh2[num_chart2]:=TChart.Create(self);
with TCh2[num_chart2] do begin
Parent:=Form66.ScrollBox1;
Name:='TCh'+inttostr(num_chart2);
Left:=0;
Top:=65*(6*num_chart2+1)-55;
Width:=Form66.ClientWidth-10;
Height:=400;
View3D:=False;
Visible:=True;
BevelInner:=bvNone;
BevelOuter:=bvNone;
BorderStyle:=bsNone;

BottomAxis.Title.Caption:='Номер шага (точки)';
if pos('Заряд',Form66.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form66.Combobox1.Text+', а.е.';
TCh2[num_chart2].Title.Text.Add('Эволюция заряда на атоме ' + Combobox2.Text + ' для системы '+ Form64.Combobox1.Text);
end;
if pos('Спиновая плотность',Form66.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form66.Combobox1.Text+', а.е.';
TCh2[num_chart2].Title.Text.Add('Эволюция спиновой плотности на атоме ' + Combobox2.Text + ' для системы '+ Form64.Combobox1.Text);
end;
if pos('Дипольный момент',Form66.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form66.Combobox1.Text+', Д';
TCh2[num_chart2].Title.Text.Add('Эволюция дипольного момента системы '+ Form64.Combobox1.Text);
end;
if pos('Электростатический потенциал',Form66.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form66.Combobox1.Text+', а.е.';
TCh2[num_chart2].Title.Text.Add('Эволюция электростатического потенциала на атоме ' + Combobox2.Text + ' для системы '+ Form64.Combobox1.Text);
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
TCh2[num_chart2].Title.Font.Size:=12;
TCh2[num_chart2].Frame.Visible:=false;
TCh2[num_chart2].Align:=alTop;
end;

Series:=TLineSeries.Create(TCh2[num_chart2]);
Series.LinePen.Width:=2;
Series.LinePen.Style:=psSolid;
Series.Pointer.Visible:=True;
Series.Pointer.Brush.Color:=clWhite;
Series.Pointer.Style:=psCircle;
Series.Pointer.VertSize:=6;
Series.Pointer.HorizSize:=6;
Series.Pointer.Brush.Style:=bsSolid;
Series.Pointer.Pen.Width:=2;
Series.Pointer.Pen.Color:=clDefault;


if dial=true then begin
if pos('Заряд',Form66.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(mull)-1 do
Series.AddXY(i+1,StrToFloat(mull[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull)-1 do
Series.AddXY(i+1,StrToFloat(mbs_mull[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull)-1 do
Series.AddXY(i+1,StrToFloat(bond_mull[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(esp)-1 do
Series.AddXY(i+1,StrToFloat(esp[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(hir)-1 do
Series.AddXY(i+1,StrToFloat(hir[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='CM5' then begin
for i:=0 to length(cm5)-1 do
Series.AddXY(i+1,StrToFloat(cm5[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='NBO' then begin
for i:=0 to length(nbo)-1 do
Series.AddXY(i+1,StrToFloat(nbo[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='AIM' then begin
for i:=0 to length(aim)-1 do
Series.AddXY(i+1,StrToFloat(aim[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(lo)-1 do
Series.AddXY(i+1,StrToFloat(lo[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(apt)-1 do
Series.AddXY(i+1,StrToFloat(apt[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
end;
if pos('Спиновая плотность',Form66.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(mull_spin)-1 do
Series.AddXY(i+1,StrToFloat(mull_spin[i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull_spin)-1 do
Series.AddXY(i+1,StrToFloat(mbs_mull_spin[i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull_spin)-1 do
Series.AddXY(i+1,StrToFloat(bond_mull_spin[i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(esp_spin)-1 do
Series.AddXY(i+1,StrToFloat(esp_spin[i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(hir_spin)-1 do
Series.AddXY(i+1,StrToFloat(hir_spin[i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(lo_spin)-1 do
Series.AddXY(i+1,StrToFloat(lo_spin[i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(apt_spin)-1 do
Series.AddXY(i+1,StrToFloat(apt_spin[i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
end;
if pos('Дипольный момент',Form66.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(dip_mull)-1 do
Series.AddXY(i+1,StrToFloat(dip_mull[i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(dip_mull)-1 do
Series.AddXY(i+1,StrToFloat(dip_mull[i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(dip_mull)-1 do
Series.AddXY(i+1,StrToFloat(dip_mull[i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(dip_esp)-1 do
Series.AddXY(i+1,StrToFloat(dip_esp[i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(dip_lo)-1 do
Series.AddXY(i+1,StrToFloat(dip_lo[i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
end;
if pos('Электростатический потенциал',Form66.ComboBox1.Text)<>0 then begin
for i:=0 to length(poten)-1 do
Series.AddXY(i+1,StrToFloat(poten[i,Combobox2.ItemIndex]),'',RGB(237,38,197));//Добавляешь координаты в график
end;
end

else begin
if pos('Заряд',Form66.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if mull_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(mull_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(esp_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if esp_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(esp_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(hir_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if hir_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(hir_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='CM5' then begin
for i:=0 to length(cm5_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if cm5_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(cm5_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='NBO' then begin
for i:=0 to length(nbo_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if nbo_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(nbo_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='AIM' then begin
for i:=0 to length(aim_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if aim_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(aim_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(lo_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if lo_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(lo_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(apt_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if apt_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(apt_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
end;


if pos('Спиновая плотность',Form66.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(mull_spin_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(mbs_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if mbs_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(mbs_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(bond_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if bond_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(bond_mull_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(esp_spin_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if esp_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(esp_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=0 to length(hir_spin_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if hir_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(hir_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(lo_spin_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if lo_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(lo_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='APT' then begin
for i:=0 to length(apt_spin_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if apt_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(apt_spin_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
end;

if pos('Дипольный момент',Form66.ComboBox1.Text)<>0 then begin
if Form64.ComboBox2.Text='Mulliken' then begin
for i:=0 to length(dip_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Series.AddXY(i+1,StrToFloat(dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=0 to length(dip_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Series.AddXY(i+1,StrToFloat(dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=0 to length(dip_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Series.AddXY(i+1,StrToFloat(dip_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='ESP' then begin
for i:=0 to length(dip_esp_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if dip_esp_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Series.AddXY(i+1,StrToFloat(dip_esp_mult[basket[Form64.ComboBox1.ItemIndex],i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
if Form64.ComboBox2.Text='Lowdin' then begin
for i:=0 to length(dip_lo_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if dip_lo_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Series.AddXY(i+1,StrToFloat(dip_lo_mult[basket[Form64.ComboBox1.ItemIndex],i,0]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
end;
if pos('Электростатический потенциал',Form66.ComboBox1.Text)<>0 then begin
for i:=0 to length(poten_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if poten_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]<>'' then Series.AddXY(i+1,StrToFloat(poten_mult[basket[Form64.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(237,38,197));//Добавляешь координаты в график
end;


end;



TCh2[num_chart2].AddSeries(Series);//Добавляешь график в диаграмму


ScrollBox1.VertScrollBar.Position:=9999999;
num_chart2:=num_chart2+1;
end;

procedure TForm66.ComboBox1Change(Sender: TObject);
begin
if Combobox1.Text='Дипольный момент' then begin
Combobox2.Visible:=False;
Label2.Visible:=False;
end
else begin
Combobox2.Visible:=True;
Label2.Visible:=True;
end;

end;

end.
