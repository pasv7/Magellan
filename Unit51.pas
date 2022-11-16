unit Unit51;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Math;

type
  TForm51 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    Chart3: TChart;
    Series3: TLineSeries;
    Chart4: TChart;
    Series4: TLineSeries;
    procedure FormShow(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form51: TForm51;

implementation

uses Unit1,Unit24,Unit49;

{$R *.dfm}

procedure TForm51.FormShow(Sender: TObject);
var i: integer;
begin
Chart1.Series[0].Clear;
Chart2.Series[0].Clear;
Chart3.Series[0].Clear;
Chart4.Series[0].Clear;

if dial=true then begin
if (trj=0) and (trjn=0) then begin
for i:=0 to length(ekin)-1 do
Chart1.Series[0].AddXY(i*strtofloat(timestep),strtofloat(ekin[i]),'',clBlack);
for i:=0 to length(epot)-1 do
Chart2.Series[0].AddXY(i*strtofloat(timestep),strtofloat(epot[i]),'',clBlue);
for i:=0 to length(etot)-1 do
Chart3.Series[0].AddXY(i*strtofloat(timestep),strtofloat(etot[i]),'',clFuchsia);
Chart4.RightAxis.SetMinMax(0,(MaxValue(escfreal)-MinValue(escfreal))*27.2116*23.06);
for i:=0 to length(escf)-1 do
Chart4.Series[0].AddXY(i*strtofloat(timestep),strtofloat(escf[i]),'',clRed);
end
else begin
for i:=0 to length(ekinbomd[Form49.ComboBox2.ItemIndex])-1 do
Chart1.Series[0].AddXY(strtofloat(timebomd[Form49.Combobox2.ItemIndex,i]),strtofloat(ekinbomd[Form49.ComboBox2.ItemIndex,i]),'',clBlack);
for i:=0 to length(epotbomd[Form49.ComboBox2.ItemIndex])-1 do
Chart2.Series[0].AddXY(strtofloat(timebomd[Form49.Combobox2.ItemIndex,i]),strtofloat(epotbomd[Form49.ComboBox2.ItemIndex,i]),'',clBlue);
for i:=0 to length(etotbomd[Form49.ComboBox2.ItemIndex])-1 do
Chart3.Series[0].AddXY(strtofloat(timebomd[Form49.Combobox2.ItemIndex,i]),strtofloat(etotbomd[Form49.ComboBox2.ItemIndex,i]),'',clFuchsia);
Chart4.RightAxis.SetMinMax(0,(MaxValue(escfreal)-MinValue(escfreal))*27.2116*23.06);
for i:=0 to length(escfbomd[Form49.ComboBox2.ItemIndex])-1 do begin
if i>=length(timebomd[Form49.Combobox2.ItemIndex]) then break;
Chart4.Series[0].AddXY(strtofloat(timebomd[Form49.Combobox2.ItemIndex,i]),strtofloat(escfbomd[Form49.ComboBox2.ItemIndex,i]),'',clRed);
end;
end;
end
else begin
if (trj_mult[basket[Form49.ComboBox1.ItemIndex]]=0) and (trjn_mult[basket[Form49.ComboBox1.ItemIndex]]=0) then begin
for i:=0 to length(ekin_mult[basket[Form49.ComboBox1.ItemIndex]])-1 do begin
if ekin_mult[basket[Form49.ComboBox1.ItemIndex],i]='' then break;
Chart1.Series[0].AddXY(i*strtofloat(timestep_mult[basket[Form49.ComboBox1.ItemIndex]]),strtofloat(ekin_mult[basket[Form49.ComboBox1.ItemIndex],i]),'',clBlack);
end;
for i:=0 to length(epot_mult[basket[Form49.ComboBox1.ItemIndex]])-1 do begin
if epot_mult[basket[Form49.ComboBox1.ItemIndex],i]='' then break;
Chart2.Series[0].AddXY(i*strtofloat(timestep_mult[basket[Form49.ComboBox1.ItemIndex]]),strtofloat(epot_mult[basket[Form49.ComboBox1.ItemIndex],i]),'',clBlue);
end;
for i:=0 to length(etot_mult[basket[Form49.ComboBox1.ItemIndex]])-1 do begin
if etot_mult[basket[Form49.ComboBox1.ItemIndex],i]='' then break;
Chart3.Series[0].AddXY(i*strtofloat(timestep_mult[basket[Form49.ComboBox1.ItemIndex]]),strtofloat(etot_mult[basket[Form49.ComboBox1.ItemIndex],i]),'',clFuchsia);
end;
Chart4.RightAxis.SetMinMax(0,(MaxValue(escfreal_mult)-MinValue(escfreal_mult))*27.2116*23.06);
for i:=0 to length(escf_mult[basket[Form49.ComboBox1.ItemIndex]])-1 do  begin
if escf_mult[basket[Form49.ComboBox1.ItemIndex],i]='' then break;
Chart4.Series[0].AddXY(i*strtofloat(timestep_mult[basket[Form49.ComboBox1.ItemIndex]]),strtofloat(escf_mult[basket[Form49.ComboBox1.ItemIndex],i]),'',clRed);
end;
end
else begin
for i:=0 to length(ekinbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex])-1 do  begin
if ekinbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i]='' then Break;
Chart1.Series[0].AddXY(strtofloat(timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.Combobox2.ItemIndex,i]),strtofloat(ekinbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i]),'',clBlack);
end;
for i:=0 to length(epotbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex])-1 do  begin
if epotbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i]='' then Break;
Chart2.Series[0].AddXY(strtofloat(timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.Combobox2.ItemIndex,i]),strtofloat(epotbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i]),'',clBlue);
end;
for i:=0 to length(etotbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex])-1 do  begin
if etotbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i]='' then Break;
Chart3.Series[0].AddXY(strtofloat(timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.Combobox2.ItemIndex,i]),strtofloat(etotbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i]),'',clFuchsia);
end;
Chart4.RightAxis.SetMinMax(0,(MaxValue(escfreal_mult)-MinValue(escfreal_mult))*27.2116*23.06);
for i:=0 to length(escfbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex])-1 do  begin
if i>=length(timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.Combobox2.ItemIndex]) then break;
if escfbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i]='' then Break;
if timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.Combobox2.ItemIndex,i]='' then Break;
Chart4.Series[0].AddXY(strtofloat(timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.Combobox2.ItemIndex,i]),strtofloat(escfbomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i]),'',clRed);
end;
end;
end;

end;



procedure TForm51.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form51.VertScrollBar.Position:=Form51.VertScrollBar.Position+20;
end;

procedure TForm51.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form51.VertScrollBar.Position:=Form51.VertScrollBar.Position-20;
end;

end.
