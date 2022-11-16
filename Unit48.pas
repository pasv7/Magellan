unit Unit48;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm48 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form48: TForm48;

implementation

uses Unit47;

{$R *.dfm}

procedure TForm48.FormShow(Sender: TObject);
var i: integer;
begin
Chart1.Series[0].Clear;
if Eg<>nil then begin
for i:=0 to length(Eg)-1 do
Chart1.Series[0].AddXY(i+1,Eg[i]);
end;
end;

end.
