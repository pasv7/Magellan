unit Unit69;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm69 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form69: TForm69;

implementation

uses Unit64,Unit68;

{$R *.dfm}

procedure TForm69.FormShow(Sender: TObject);
var i: integer;
label 0;
begin
  if evol_chrg=nil then begin
  showmessage('������������ ������ �����������!');
  goto 0;
  end;
  Series1.Clear;
if Form68.ComboBox1.Text='�����' then  Chart1.Title.Text[0]:='�������� ������ ������ ������ � ������� ' + Form64.Combobox1.Text;
if Form68.ComboBox1.Text='�������� ���������' then  Chart1.Title.Text[0]:='�������� �������� ��������� ������ ������ � ������� ' + Form64.Combobox1.Text;
if Form68.ComboBox1.Text='������������������ ���������' then  Chart1.Title.Text[0]:='�������� ������������������� ���������� ������ ������ � ������� ' + Form64.Combobox1.Text;
with Chart1.Title do
begin
Visible:=True;
Font.Size:=12;
Font.Color:=clBlue;
Alignment:=taCenter;
end;
if Form68.ComboBox1.Text='�����' then  Chart1.LeftAxis.Title.Caption:='����� ������ ������, �.�.';
if Form68.ComboBox1.Text='�������� ���������' then  Chart1.LeftAxis.Title.Caption:='�������� ��������� ������ ������, �.�.';
if Form68.ComboBox1.Text='������������������ ���������' then  Chart1.LeftAxis.Title.Caption:='������������������ ��������� ������ ������, �.�.';
Chart1.LeftAxis.Title.Font.Size:=11;

for i:=0 to length(evol_chrg)-1 do
Series1.AddXY(i+1,evol_chrg[i],'',clRed);



0:
end;

end.
