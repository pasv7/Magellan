unit Unit50;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm50 = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form50: TForm50;

implementation

uses Unit49,Unit1,Unit24;

{$R *.dfm}

procedure TForm50.FormShow(Sender: TObject);
var i: integer;
begin
Form50.Memo1.Clear;
if dial=true  then begin
if sett<>nil then begin
for i:=0 to sett.count-1 do
Memo1.Lines.Add(sett[i]);
end;
end
else begin
if sett_mult<>nil then begin
for i:=0 to sett_mult[basket[Form49.ComboBox1.ItemIndex]].count-1 do
Memo1.Lines.Add(sett_mult[basket[Form49.ComboBox1.ItemIndex]][i]);
end;
end;






end;

end.
