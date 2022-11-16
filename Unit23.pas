unit Unit23;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm23 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;
  pos33: boolean;

implementation

uses Unit19;

{$R *.dfm}

procedure TForm23.BitBtn1Click(Sender: TObject);
var f: TextFile;
    i,outi: integer;
    label 0;
begin
if (length(Edit1.Text)=0) or (length(Edit2.Text)=0) then begin
showmessage('Поля должны быть заполнены');
goto 0;
end;

if (TryStrToInt(Edit1.Text,outi)<>true) or (TryStrToInt(Edit2.Text,outi)<>true) then goto 0;
if copy(Edit1.Text,1,1)='0' then begin
showmessage('Error Edt1:: Некорректная информация');
goto 0;
end;




AssignFile(f,'__tmp.dgr');
Rewrite(f);
for i:=1 to strtoint(Form23.Edit1.Text) do
WriteLn(f,' P'+inttostr(i-1)+ '   ' + '0.0' +'   '+'LM');

for i:=1 to strtoint(Form23.Edit2.Text) do
WriteLn(f,' AR'+'   '+ 'P0'  + '->' + 'P0');

for i:=1 to strtoint(Form23.Edit1.Text) do
WriteLn(f,' SPT'+'   '+ 'P' + inttostr(i-1));



CloseFile(f);
pos33:=true;
Form19.BitBtn2.Click;

pos33:=false;
DeleteFile('__tmp.dgr');





0: end;

procedure TForm23.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

procedure TForm23.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key <> #8 then
  begin //позволить удаление знаков клавишей 'Back Space'
    case Key of
      '0'..'9': key := key;//если нажата цифра, то ничего не делаем
    else
      Key := #0; //"погасить" все остальные клавиши
    end;
  end;
end;

end.
