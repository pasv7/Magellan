unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm8 = class(TForm)
    Chart1: TChart;
    Chart2: TChart;
    Chart3: TChart;
    Chart4: TChart;
    Chart5: TChart;
    Chart6: TChart;
    Chart7: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    procedure FormShow(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
  

    
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit1, Unit6, Unit5;

{$R *.dfm}

procedure TForm8.FormShow(Sender: TObject);
var i,j,k: Integer;
rx,ry,rz,rxmax,rymax,rzmax: Real;
begin
Form8.VertScrollBar.Position:=0;
Series1.Clear;
Series2.Clear;
Series3.Clear;
Series4.Clear;
Series5.Clear;
Series6.Clear;
Series7.Clear;

if (Dial=true) and  (Form6.Combobox1.Enabled=true)  then   begin
rxmax:=0;
rymax:=0;
rzmax:=0;

Form8.Chart1.Frame.Style:=psClear;
Form8.Chart2.Frame.Style:=psClear;
Form8.Chart3.Frame.Style:=psClear;
Form8.Chart4.Frame.Style:=psClear;
Form8.Chart5.Frame.Style:=psClear;
Form8.Chart6.Frame.Style:=psClear;
Form8.Chart7.Frame.Style:=psClear;

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
Series1.AddXY(k,rxmax,'',clred);
Series2.AddXY(k,rymax,'',clred);
Series3.AddXY(k,rzmax,'',clred);
Series4.AddXY(k,sqrt(sqr(rxmax)+sqr(rymax)),'',clGreen);
Series5.AddXY(k,sqrt(sqr(rxmax)+sqr(rzmax)),'',clGreen);
Series6.AddXY(k,sqrt(sqr(rymax)+sqr(rzmax)),'',clGreen);
Series7.AddXY(k,sqrt(sqr(rxmax)+sqr(rymax)+sqr(rzmax)),'',clFuchsia);




end;
end;

{
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
}










end;



procedure TForm8.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form8.VertScrollBar.Position:=Form8.VertScrollBar.Position+20;
end;

procedure TForm8.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form8.VertScrollBar.Position:=Form8.VertScrollBar.Position-20;
end;

procedure TForm8.FormResize(Sender: TObject);
begin
Chart1.Width:=Form8.Width-30;
Chart2.Width:=Form8.Width-30;
Chart3.Width:=Form8.Width-30;
Chart4.Width:=Form8.Width-30;
Chart5.Width:=Form8.Width-30;
Chart6.Width:=Form8.Width-30;
Chart7.Width:=Form8.Width-30;
end;

end.
