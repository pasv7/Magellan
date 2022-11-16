unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, Menus, StdCtrls, Buttons, ComCtrls, ShlObj;

type
  TForm9 = class(TForm)
    BitButton1: TBitBtn;
    BitButton2: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitButton3: TBitBtn;
    BitButton4: TBitBtn;
    BitButton5: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ListView1: TListView;
    N3: TMenuItem;
    N4: TMenuItem;
    OpenDialog2: TOpenDialog;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    procedure BitButton6Click(Sender: TObject);
    procedure BitButton1Click(Sender: TObject);
    procedure BitButton5Click(Sender: TObject);
    procedure BitButton2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitButton3Click(Sender: TObject);
    procedure BitButton4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit3, Unit8;

{$R *.dfm}

function BrowseCallbackProc(hwnd: HWND; uMsg: UINT; lParam: LPARAM; lpData: LPARAM): Integer; stdcall;
begin
  if (uMsg = BFFM_INITIALIZED) then
    SendMessage(hwnd, BFFM_SETSELECTION, 1, lpData);
  BrowseCallbackProc:= 0;
end;




function GetFolderDialog(Handle: Integer; Caption: string; var strFolder: string): Boolean;
const
  BIF_STATUSTEXT           = $0004;
  BIF_NEWDIALOGSTYLE       = $0040;
  BIF_RETURNONLYFSDIRS     = $0080;
  BIF_SHAREABLE            = $0100;
  BIF_USENEWUI             = BIF_EDITBOX or BIF_NEWDIALOGSTYLE;

var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  JtemIDList: PItemIDList;
  Path: PAnsiChar;
begin
  Result:= False;
  Path:= StrAlloc(MAX_PATH);
  SHGetSpecialFolderLocation(Handle, CSIDL_DRIVES, JtemIDList);
  with BrowseInfo do
  begin
    hwndOwner:= GetActiveWindow;
    pidlRoot:= JtemIDList;
    SHGetSpecialFolderLocation(hwndOwner, CSIDL_DRIVES, JtemIDList);

    { Возврат названия выбранного элемента }
    pszDisplayName:= StrAlloc(MAX_PATH);

    { Установка названия диалога выбора папки }
    lpszTitle:= PChar(Caption); // 'Выбрать папку на Delphi (Дельфи)';
    { Флаги, контролирующие возврат }
    lpfn:= @BrowseCallbackProc;
    { Дополнительная информация, которая отдаётся обратно в обратный вызов (callback) }
    lParam:= LongInt(PChar(strFolder));
  end;

  ItemIDList:= SHBrowseForFolder(BrowseInfo);

  if (ItemIDList <> nil) then
    if SHGetPathFromIDList(ItemIDList, Path) then
    begin
      strFolder:= Path;
      Result:= True;
    end;
end;












































procedure TForm9.BitButton6Click(Sender: TObject);
begin
Form9.Close;
end;

procedure TForm9.BitButton1Click(Sender: TObject);
var itm: TListItem;
i,j: integer;
t: widestring;
begin
OpenDialog1.Options:= [ofAllowMultiSelect];
if Form9.OpenDialog1.Execute then begin
//itm:=Form9.ListView1.Items.Add;
for i:=0 to Form9.OpenDialog1.Files.Count-1 do begin

for j:=1 to 255 do  begin
if copy(OpenDialog1.Files[i],length(OpenDialog1.Files[i])-j,1)='\' then  begin
t:=copy(OpenDialog1.Files[i],length(OpenDialog1.Files[i])-j+1,j+1);
break;
end;
end;


itm:=Form9.ListView1.Items.Add;
itm.Caption:=OpenDialog1.Files[i];
if  Form9.Edit1.Text='' then itm.SubItems.Add(copy(OpenDialog1.Files[i],1,pos('.gjf',OpenDialog1.Files[i])-1)+'.out')
else  begin
if copy(form9.Edit1.Text,length(form9.Edit1.Text),1)='\' then itm.SubItems.Add(Form9.Edit1.Text+ copy(t,1,pos('.gjf',t)-1)+'.out');
if copy(form9.Edit1.Text,length(form9.Edit1.Text),1)<>'\' then  itm.SubItems.Add(Form9.Edit1.Text+'\'+ copy(t,1,pos('.gjf',t)-1)+'.out');
end;
end;
end;
end;

procedure TForm9.BitButton5Click(Sender: TObject);
begin
Form9.ListView1.Clear;
end;

procedure TForm9.BitButton2Click(Sender: TObject);
begin
if Form9.ListView1.Selected<>nil  then  begin
Form9.ListView1.Items.Delete(Form9.ListView1.Selected.Index);
end;
end;

procedure TForm9.N4Click(Sender: TObject);
begin
Form9.Close;
end;

procedure TForm9.BitButton3Click(Sender: TObject);
var s1, s2: widestring;
begin
if (Form9.ListView1.Selected<>nil) and (Form9.ListView1.Selected.Index>0)  then  begin s1:=Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index-1].Caption;
s2:=Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index-1].SubItems.Text;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index-1].Caption:=Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index].Caption;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index-1].SubItems.Text:= Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index].SubItems.Text;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index].Caption:=s1;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index].SubItems.Text:=s2;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index-1].Selected:=true;
//Form9.ListView1.ClearSelection;
end;
end;

procedure TForm9.BitButton4Click(Sender: TObject);
var s1, s2: widestring;
begin
if (Form9.ListView1.Selected<>nil) and (Form9.ListView1.Selected.Index<Form9.ListView1.Items.Count-1)  then  begin s1:=Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index+1].Caption;
s2:=Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index+1].SubItems.Text;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index+1].Caption:=Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index].Caption;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index+1].SubItems.Text:= Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index].SubItems.Text;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index].Caption:=s1;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index].SubItems.Text:=s2;
Form9.ListView1.Items.Item[Form9.ListView1.Selected.Index+1].Selected:=true;
//Form9.ListView1.ClearSelection;
end;
end;

procedure TForm9.N3Click(Sender: TObject);
var i: integer;
f: TextFile;
SR : TSearchRec;
FLN: widestring;
begin
if SaveDialog1.Execute then begin
if SaveDialog1.FilterIndex=1 then begin
FLN:=SaveDialog1.FileName;
if pos('.bcf',SaveDialog1.FileName)=0 then AssignFile(f,SaveDialog1.FileName+'.bcf')
else AssignFile(f,SaveDialog1.FileName);
Rewrite(f);
for i:=0 to Form9.ListView1.Items.Count-1 do
WriteLn(f,Form9.ListView1.Items.Item[i].Caption+' , '+ copy(Form9.ListView1.Items.Item[i].Subitems.Text,1,pos('.out',Form9.ListView1.Items.Item[i].Subitems.Text)+3));
WriteLn(f,'');
CloseFile(f);
end;
if SaveDialog1.FilterIndex=2 then begin
FLN:=SaveDialog1.FileName;
if pos('.bat',SaveDialog1.FileName)=0 then AssignFile(f,SaveDialog1.FileName+'.bat')
else AssignFile(f,SaveDialog1.FileName);
Rewrite(f);
for i:=0 to Form9.ListView1.Items.Count-1 do
WriteLn(f,'C:\G09W\g09.exe'+' '+Form9.ListView1.Items.Item[i].Caption);
WriteLn(f,'');
CloseFile(f);
end;
end;
end;

procedure TForm9.N2Click(Sender: TObject);
var f: TextFile;
str: widestring;
p: integer;
cn: array[1..4] of integer;
cart: array[1..2] of widestring;
itm: TListItem;
begin
if Form9.OpenDialog2.Execute then begin
Form9.ListView1.Clear;
//if (Form9.OpenDialog2.FilterIndex=1) or (Form9.OpenDialog2.FilterIndex=2 ) then begin
AssignFile(f,Form9.OpenDialog2.FileName);
Reset(f);
//itm:=Form9.ListView1.Items.Add;
while not Eof(f) do begin
ReadLn(f,str);


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
cn[1]:=0;
cn[2]:=0;
cn[3]:=0;
cn[4]:=0;
cart[1]:='';
cart[2]:='';
for p:=1 to length(str) do begin
if (copy(str,p,1)=' ') or  (copy(str,p,1)=',') then cn[1]:=cn[1]+1         //пробелы до input-файла
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+p,1)<>' ') and  (copy(str,cn[1]+p,1)<>',') then cn[2]:=cn[2]+1       //input-файл
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+p,1)=' ') or  (copy(str,cn[1]+cn[2]+p,1)=',') then cn[3]:=cn[3]+1      //пробелы input-файл...output-файл
else break;
end;
for p:=1 to length(str) do  begin
if (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>' ') and  (copy(str,cn[1]+cn[2]+cn[3]+p,1)<>',') then cn[4]:=cn[4]+1   //output-файл
else break;
end;

cart[1]:= copy(str,cn[1]+1,cn[2]);   //input-файл
cart[2]:= copy(str,cn[1]+cn[2]+cn[3]+1,cn[4]);   //output-файл
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (copy(cart[1],1,1)<>'!') and  (copy(cart[1],1,1)<>'') then begin
itm:=Form9.ListView1.Items.Add;
if pos('.exe',cart[1])=0 then itm.Caption:=cart[1] else itm.Caption:=cart[2];
if pos('.exe',cart[1])=0 then itm.SubItems.Text:=cart[2] else itm.SubItems.Text:=copy(cart[2],1,pos('.gjf',cart[2])-1)+'.out';
end;
end;
CloseFile(f);
end;
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
var sFolder: String;
begin
sFolder:= '';
if GetFolderDialog(Application.Handle, 'Укажите путь для сохранения out/log-файлов', sFolder) then
begin
Edit1.Text:= sFolder;
end;


end;

end.
