unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, StdCtrls, Series;

type
  TForm13 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Unit12, ValEdit, Unit1, Unit24;

{$R *.dfm}

procedure TForm13.FormShow(Sender: TObject);
var i,ps: integer;
task: widestring;
begin


////////////////ищем название задачи без полного пути///////////////
ps:=0;
for i:=0 to length(Form12.ComboBox1.Text) do
if copy(Form12.ComboBox1.Text,i,1)='\'   then ps:=i;
task:=copy(Form12.ComboBox1.Text,ps+1,100);
////////////////////////////////////////////////////////////////////







Label1.Caption:=task;
Series1.Clear;
Form13.Chart1.Frame.Style:=psClear;
for i:=0 to Form12.ListView1.Items.Count-1 do
if dial=true then Series1.AddXY(strtofloat(step[i]),strtofloat(energy[i]),'',clred)
else  begin
if step_mult[basket[Form12.Combobox1.ItemIndex],i]='SCF recalc' then step_mult[basket[Form12.Combobox1.ItemIndex],i]:=step_mult[basket[Form12.Combobox1.ItemIndex],i-1];
Series1.AddXY(strtofloat(step_mult[basket[Form12.Combobox1.ItemIndex],i]),strtofloat(energy_mult[basket[Form12.Combobox1.ItemIndex],i]),'',clred);
end;

if dial=false then begin
for i:=1 to Form12.ListView1.Items.Count-1 do        //возвращаем рекалки
if step_mult[basket[Form12.Combobox1.ItemIndex],i]=step_mult[basket[Form12.Combobox1.ItemIndex],i-1] then step_mult[basket[Form12.Combobox1.ItemIndex],i]:='SCF recalc';
end;

end;

procedure TForm13.FormResize(Sender: TObject);
begin
Label1.Left:=Round(Form13.ClientWidth/2)-Round(Label1.Width/2);
Chart1.Width:=Form13.ClientWidth-15;
Chart1.Height:=Form13.ClientHeight-50;
end;

end.
