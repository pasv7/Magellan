unit Unit55;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Chart, Series, Buttons, Math, TeeProcs, TeEngine;

type
  TForm55 = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form55: TForm55;
  TCh1: array of TChart;
  num_chart1: word=0;

implementation

uses Unit54,Unit1,Unit52,Unit18,Unit24;

{$R *.dfm}

procedure TForm55.FormShow(Sender: TObject);
var method: string;
i,posi_scroll: integer;
Series: TLineSeries;
begin
Combobox1.Clear;
Combobox2.Clear;

if dial=true then begin

for i:=0 to length(src_route)-1 do begin
if (pos('EOMCCSD',UpperCase(src_route[i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route[i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route[i]))<>0) or (pos('CIS(D)',UpperCase(src_route[i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route[i]))<>0) or (pos('SACCI',UpperCase(src_route[i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route[i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route[i]))<>0) or (pos('CAS(',UpperCase(src_route[i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route[i]))<>0) or (pos('TD=(',UpperCase(src_route[i]))<>0) or (pos(' TD',UpperCase(src_route[i]))<>0) then method:='TD DFT / TD HF';
end;




end
else begin

for i:=0 to length(src_route_mult[basket[Form52.Combobox1.ItemIndex]])-1 do begin
if (pos('EOMCCSD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('CIS(D)',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('SACCI',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('CAS(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('TD=(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos(' TD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='TD DFT / TD HF';
end;

end;


if method<>'SAC-CI' then begin
ComboBox1.Items.Add('Энергия возбуждения');
ComboBox1.Items.Add('Сила осциллятора');
end
else begin
ComboBox1.Items.Add('Энергия возбуждения');
ComboBox1.Items.Add('Полная энергия');
end;

for i:=0 to Form54.ListView1.Items.Count-1 do
Combobox2.Items.Add(inttostr(i+1));

Combobox1.ItemIndex:=0;
Combobox2.ItemIndex:=0;
end;

procedure TForm55.BitBtn2Click(Sender: TObject);
var posi_scroll,i: integer;
Series: TLineSeries;
energ_r: array of double;
begin
posi_scroll:=Form55.ScrollBox1.VertScrollBar.Position;
Form55.ScrollBox1.VertScrollBar.Position:=0;
setlength(TCh1,num_chart1+1);
TCh1[num_chart1]:=TChart.Create(self);
with TCh1[num_chart1] do begin
Parent:=Form55.ScrollBox1;
Name:='TCh'+inttostr(num_chart1);
Left:=0;
Top:=65*(6*num_chart1+1)-55;
Width:=Form55.ClientWidth-10;
Height:=400;
View3D:=False;
Visible:=True;
BevelInner:=bvNone;
BevelOuter:=bvNone;
BorderStyle:=bsNone;

BottomAxis.Title.Caption:='Номер шага (точки)';
if pos('Энергия возбуждения',Form55.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form55.Combobox1.Text+', эВ';
RightAxis.Title.Caption:='Длина волны, эВ';
RightAxis.Visible:=True;
TCh1[num_chart1].Title.Text.Add('Эволюция энергии возбуждения для системы '+Form52.Combobox1.Text);
end;
if pos('Полная энергия',Form55.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form55.Combobox1.Text+', Хартри';
TCh1[num_chart1].Title.Text.Add('Эволюция полной энергии для системы '+Form52.Combobox1.Text);
end;
if pos('Сила осциллятора',Form55.ComboBox1.Text)<>0 then begin
LeftAxis.Title.Caption:=Form55.Combobox1.Text;
TCh1[num_chart1].Title.Text.Add('Эволюция силы осциллятора для системы '+Form52.Combobox1.Text);
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
TCh1[num_chart1].Title.Font.Size:=12;
TCh1[num_chart1].Frame.Visible:=false;
TCh1[num_chart1].Align:=alTop;
end;
Series:=TLineSeries.Create(TCh1[num_chart1]);
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
if pos('Энергия возбуждения',Form55.ComboBox1.Text)<>0 then begin

Series.VertAxis:=aBothVertAxis;
TCh1[num_chart1].RightAxis.Inverted:=True;
setlength(energ_r,length(energ));

for i:=0 to length(energ)-1 do
energ_r[i]:=StrToFloat(energ[i,Combobox2.ItemIndex]);

TCh1[num_chart1].RightAxis.SetMinMax( (6.62607E-34)*299792458*(1E+9)/(1.6021766208E-19*MaxValue(energ_r)), (6.62607E-34)*299792458*(1E+9)/(1.6021766208E-19*MinValue(energ_r)) );

for i:=0 to length(energ)-1 do
Series.AddXY(i+1,StrToFloat(energ[i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if pos('Сила осциллятора',Form55.ComboBox1.Text)<>0 then begin
for i:=0 to length(forc)-1 do
Series.AddXY(i+1,StrToFloat(forc[i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if pos('Полная энергия',Form55.ComboBox1.Text)<>0 then begin
for i:=0 to length(Etotsac)-1 do
Series.AddXY(i+1,StrToFloat(etotsac[i,Combobox2.ItemIndex]),'',RGB(0,0,255));//Добавляешь координаты в график
end;
end

else begin
if pos('Энергия возбуждения',Form55.ComboBox1.Text)<>0 then begin

Series.VertAxis:=aBothVertAxis;
TCh1[num_chart1].RightAxis.Inverted:=True;
setlength(energ_r,Form54.Combobox1.Items.Count);
for i:=0 to Form54.Combobox1.Items.Count-1 do
energ_r[i]:=StrToFloat(energ_mult[basket[Form52.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]);

TCh1[num_chart1].RightAxis.SetMinMax( (6.62607E-34)*299792458*(1E+9)/(1.6021766208E-19*MaxValue(energ_r)), (6.62607E-34)*299792458*(1E+9)/(1.6021766208E-19*MinValue(energ_r)) );

for i:=0 to Form54.Combobox1.Items.Count-1 do
Series.AddXY(i+1,StrToFloat(energ_mult[basket[Form52.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(255,0,0));//Добавляешь координаты в график
end;
if pos('Сила осциллятора',Form55.ComboBox1.Text)<>0 then begin
for i:=0 to Form54.Combobox1.Items.Count-1 do
Series.AddXY(i+1,StrToFloat(forc_mult[basket[Form52.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,255,0));//Добавляешь координаты в график
end;
if pos('Полная энергия',Form55.ComboBox1.Text)<>0 then begin
for i:=0 to Form54.Combobox1.Items.Count-1 do
Series.AddXY(i+1,StrToFloat(etotsac_mult[basket[Form52.ComboBox1.ItemIndex],i,Combobox2.ItemIndex]),'',RGB(0,0,255));//Добавляешь координаты в график
end;






















end;

















TCh1[num_chart1].AddSeries(Series);//Добавляешь график в диаграмму


ScrollBox1.VertScrollBar.Position:=9999999;
num_chart1:=num_chart1+1;
end;

procedure TForm55.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form55.ScrollBox1.VertScrollBar.Position:=Form55.ScrollBox1.VertScrollBar.Position+20;
end;

procedure TForm55.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form55.ScrollBox1.VertScrollBar.Position:=Form55.ScrollBox1.VertScrollBar.Position-20;
end;

procedure TForm55.BitBtn1Click(Sender: TObject);
var i: word;
begin
if TCh1 <>nil then begin
i:=0;
Repeat
if TCh1[i]<>nil then FreeAndNil(TCh1[i]);
i:=i+1;
until i>=num_chart1;
end;
num_chart1:=0;
end;

procedure TForm55.FormResize(Sender: TObject);
var i: integer;
begin
if Form55.FindComponent('TCh'+inttostr(num_chart1-1)) as TChart<>nil then begin
for i:=0 to length(TCh1)-1 do
TCh1[i].Width:=Form55.ClientWidth-10;
end;
end;

end.
