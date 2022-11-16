unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Menus;

type
  TForm16 = class(TForm)
    Chart1: TChart;
    Chart2: TChart;
    Chart3: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    BMP1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure BMP1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses Unit14, Unit15, Unit1, Unit24;

{$R *.dfm}

procedure TForm16.FormShow(Sender: TObject);
var i,k: word;
label 0;
begin
if dial=false then begin
Chart1.Series[0].Clear;
Chart2.Series[0].Clear;
Chart3.Series[0].Clear;
Chart1.Frame.Style:=psClear;
Chart2.Frame.Style:=psClear;
Chart3.Frame.Style:=psClear;
k:=0;

if length(Eorb_mult)=0 then goto 0;

if Form15.Radiobutton1.Checked then begin
Form16.Caption:='ALPHA-статистика';
for i:=0 to Form14.Combobox1.Items.Count-1 do  begin
Chart1.Series[0].AddXY(i,strtofloat(Eorb_mult[basket[i],homo_mult[basket[i]]])*ev-strtofloat(Eorb_mult[basket[i],homo_mult[basket[i]]-1])*ev,'',clRed);
Chart2.Series[0].AddXY(i,strtofloat(Eorb_mult[basket[i],homo_mult[basket[i]]-1])*ev,'',clGreen);
Chart3.Series[0].AddXY(i,strtofloat(Eorb_mult[basket[i],homo_mult[basket[i]]])*ev,'',clBlue);
end;
end;

if Form15.Radiobutton2.Checked then begin
Form16.Caption:='BETA-статистика';
for i:=0 to Form14.Combobox1.Items.Count-1 do  begin
if beta_mult[i]=true then begin
k:=k+1;
Chart1.Series[0].AddXY(k,strtofloat(Eorb_mult_beta[basket[i],homo_mult_beta[basket[i]]])*ev-strtofloat(Eorb_mult_beta[basket[i],homo_mult_beta[basket[i]]-1])*ev,'',clRed);
Chart2.Series[0].AddXY(k,strtofloat(Eorb_mult_beta[basket[i],homo_mult_beta[basket[i]]-1])*ev,'',clGreen);
Chart3.Series[0].AddXY(k,strtofloat(Eorb_mult_beta[basket[i],homo_mult_beta[basket[i]]])*ev,'',clBlue);
end;
end;
end;

end;


0: end;

procedure TForm16.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form16.VertScrollBar.Position:=Form16.VertScrollBar.Position+20;
end;

procedure TForm16.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form16.VertScrollBar.Position:=Form16.VertScrollBar.Position-20;
end;

procedure TForm16.FormResize(Sender: TObject);
begin
Chart1.Width:=Form16.Width-30;
Chart2.Width:=Form16.Width-30;
Chart3.Width:=Form16.Width-30;
end;

procedure TForm16.BMP1Click(Sender: TObject);
var a: widestring;
begin
if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
Chart1.Color:=clWhite;
Chart2.Color:=clWhite;
Chart3.Color:=clWhite;
Chart1.SaveToBitmapFile(copy(a,0,pos('.bmp',a)-1)+'_DELTA'+'.bmp');
Chart2.SaveToBitmapFile(copy(a,0,pos('.bmp',a)-1)+'_HOMO'+'.bmp');
Chart3.SaveToBitmapFile(copy(a,0,pos('.bmp',a)-1)+'_LUMO'+'.bmp');
end;
Chart1.Color:=clBtnFace;
Chart2.Color:=clBtnFace;
Chart3.Color:=clBtnFace;
end;

end.
 