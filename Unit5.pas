unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, Series, ComCtrls, Math;

type
  TForm5 = class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    Chart2: TChart;
    Series2: TBarSeries;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit3,Unit1;

{$R *.dfm}
{$MAXSTACKSIZE 1048576000}
{$MINSTACKSIZE 1048}

procedure TForm5.FormShow(Sender: TObject);
var j,s,b,i: integer;
a: Real;
label 0;
begin
Form5.StatusBar1.Panels[0].Text:='';
Chart1.RightAxis.Grid.Visible:=False;
a:=0;
Series1.Clear;
Form5.Chart1.Frame.Style:=psClear;
Series1.AddXY(strtofloat(Form3.Edit2.Text),0,'',clred);
for j:=1 to strtoint(Form3.Edit3.Text) do begin
if dial=true then begin
Series1.AddXY(Xhist[j],id[j],'',clred);
if a<=id[j] then a:=id[j];
Chart1.RightAxis.SetMinMax(0,(a*100)/strtoint(copy(Form1.StatusBar1.Panels[1].Text,1,Pos(' ',Form1.StatusBar1.Panels[1].Text)-1)));
end;
if dial=false then begin

Series1.AddXY(Xhist[j],id_mult_summ[j],'',clred);
if a<=id_mult_summ[j] then a:=id_mult_summ[j];
Chart1.RightAxis.SetMinMax(0,(a*100)/strtoint(copy(Form1.StatusBar1.Panels[1].Text,1,Pos(' ',Form1.StatusBar1.Panels[1].Text)-1)));
end;
end;
Series2.Clear;
if a=0 then goto 0;
Form5.Chart2.Frame.Style:=psClear;
Series2.AddXY(strtofloat(Form3.Edit2.Text),0,'',clblue);
for j:=1 to strtoint(Form3.Edit3.Text) do begin
if dial=true then Series2.AddXY(Xhist[j],(id[j]/NAll)*100,'',clblue);
if dial=false then Series2.AddXY(Xhist[j],(id_mult_summ[j]/NAll)*100,'',clblue);
end;


//??????????? ??????? ????? ??????
//Laver = Summ.(L)/N






Form5.StatusBar1.Panels[0].Text:='??????? ?????????? ??????????  '+floattostr(RoundTo(Dist_average,-3))+' A';
Form5.Resize;
Form5.Resizing(wsNormal);
0: end;

procedure TForm5.FormResize(Sender: TObject);
begin
Form5.Height:=650;
Form5.Chart1.Width:=Form5.Width-20;
Form5.Chart2.Width:=Form5.Width-20;
Form5.Chart1.Left:=1;
Form5.Chart2.Left:=1;
end;

end.
