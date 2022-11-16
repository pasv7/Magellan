unit Unit40;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, ExtCtrls;

type
  TForm40 = class(TForm)
    Panel1: TPanel;
    Gauge1: TGauge;
    Label1: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form40: TForm40;

implementation

{$R *.dfm}

procedure TForm40.FormCreate(Sender: TObject);
begin
Label1.Caption:='';
end;

end.
