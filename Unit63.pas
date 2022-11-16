unit Unit63;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TForm63 = class(TForm)
    ListView1: TListView;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form63: TForm63;

implementation

uses Unit61;

{$R *.dfm}

procedure TForm63.FormShow(Sender: TObject);
var i: integer;
itm: TListItem;
begin
ListView1.Clear;
if  (el_dc<>nil) and  (val_dc<>nil) then begin
for i:=0 to length(el_dc)-1 do begin
if (el_dc[i]='') or (el_dc[i]='-') then break;
itm:=ListView1.Items.Add;
itm.Caption:=el_dc[i];
itm.SubItems.Append(val_dc[i]);
end;
end;





end;

end.
