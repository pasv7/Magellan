unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMan, StdCtrls, ComCtrls, Math, Buttons;

type
  TForm14 = class(TForm)
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    Button2: TButton;
    ListView1: TListView;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    ComboBox2: TComboBox;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  //procedure WMMOUSEWHEEL(var Msg: TMessage); message WM_MOUSEWHEEL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;
  N,typ,Eorb,Ekin,N_beta,typ_beta,Eorb_beta,Ekin_beta: array of string;
  N_mult,typ_mult,Eorb_mult,Ekin_mult,  N_mult_beta,typ_mult_beta,Eorb_mult_beta,Ekin_mult_beta       : array of array of string;
  ch,homo,homo_beta: integer;
  ch_mult,homo_mult,homo_mult_beta: array of integer;
  beta: boolean;
  beta_mult: array of boolean;
  const ev=27.2114;

implementation

uses Unit1, Unit15, Unit16, Unit17, Unit24;

{$R *.dfm}

{
procedure TForm14.WMMOUSEWHEEL(var Msg: TMessage);
var
zDelta: Integer;
begin
inherited;
if WindowFromPoint(Mouse.CursorPos) <> ScrollBox1.Handle then Exit;
if Msg.WParam < 0 then zDelta := -30 else zDelta := 30;
with ScrollBox1 do
begin
if ((VertScrollBar.Position = 0) and
(zDelta > 0)) or ((VertScrollBar.Position = VertScrollBar.Range - ClientHeight) and
(zDelta < 0)) then Exit;
ScrollBy(0, zDelta);
VertScrollBar.Position := VertScrollBar.Position - zDelta;
end;
end;
}



procedure TForm14.FormShow(Sender: TObject);
var f: TextFile;
str,sstr1,sstr2,sstr3,sstr4,sstr5,sstr6,sstr7,sstr8,task: widestring;
i,j,ps,s,axx,k: integer;
itm: TListItem;
task_mult: array of widestring;
label 10, 100, 0;
begin

Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';

N:=nil;
typ:=nil;
Eorb:=nil;
Ekin:=nil;
N_beta:=nil;
typ_beta:=nil;
Eorb_beta:=nil;
Ekin_beta:=nil;
N_mult:=nil;
typ_mult:=nil;
Eorb_mult:=nil;
Ekin_mult:=nil;
N_mult_beta:=nil;
typ_mult_beta:=nil;
Eorb_mult_beta:=nil;
Ekin_mult_beta:=nil;
Ch:=0;
homo:=0;
homo_beta:=0;
Ch_mult:=0;
homo_mult:=0;
homo_mult_beta:=0;
basket:=nil;
beta_mult:=nil;
beta:=false;
task:='';
task_mult:=nil;


if dial=false then Form14.BitBtn2.Enabled:=True
else  Form14.BitBtn2.Enabled:=False;
Label12.Visible:=false;
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Form14.ComboBox1.Clear;
Form14.ComboBox2.Clear;
Form14.ListView1.Clear;
Form14.PaintBox1.Canvas.FillRect(Form14.PaintBox1.ClientRect);
Form14.PaintBox1.ClientHeight:=Form14.ScrollBox1.ClientHeight-10;
Form14.PaintBox1.Top:=5;
beta:=false;


if (dial=true) and (Form1.OpenDialog1.FilterIndex=2) then begin       // ���� ������ ������ � ����� ���� out � log
j:=0;
AssignFile(f,Form1.Opendialog1.FileName);
Reset(f);
while not Eof(f) do begin
if pos('Total kinetic energy from orbitals',str)<>0 then break;
if pos('Orbital energies and kinetic energies (beta)',str)<>0 then
begin
j:=0;
beta:=true;
goto 10;
end;


ReadLn(f,str);
if pos('Orbital energies and kinetic energies (alpha)',str)<>0 then begin
10: ReadLn(f,str);
ReadLn(f,str);
while (pos('Total kinetic energy from orbitals',str)=0) and (pos('Orbital energies and kinetic energies',str)=0) do begin

if beta=false then begin
setlength(N,j+1);
setlength(typ,j+1);
setlength(Eorb,j+1);
setlength(Ekin,j+1);
end
else begin
setlength(N_beta,j+1);
setlength(typ_beta,j+1);
setlength(Eorb_beta,j+1);
setlength(Ekin_beta,j+1);

end;



for i:=0 to length(str) do
if copy(str,i,1)<>' ' then begin
sstr1:=copy(str,i,length(str)-i);
break;
end;

for i:=0 to length(sstr1) do
if copy(sstr1,i,1)=' ' then begin
sstr2:=copy(sstr1,0,i-1);               //����� ��������
break;
end;

for i:=1 to length(sstr1) do
if copy(sstr1,i+length(sstr2),1)<>' ' then begin
sstr3:=copy(sstr1,i+length(sstr2),length(sstr1));
break;
end;

for i:=0 to length(sstr3) do
if copy(sstr3,i,1)=' ' then begin
sstr4:=copy(sstr3,0,i-1);               //��� ��������
break;
end;

for i:=1 to length(sstr3) do
if copy(sstr3,i+length(sstr4),1)<>' ' then begin
sstr5:=copy(sstr3,i+length(sstr4),length(sstr3));
break;
end;

for i:=0 to length(sstr5) do
if copy(sstr5,i,1)=' ' then begin
sstr6:=copy(sstr5,0,i-1);               //����������� �������
break;
end;

for i:=1 to length(sstr5) do
if copy(sstr5,i+length(sstr6),1)<>' ' then begin
sstr7:=copy(sstr5,i+length(sstr6),length(sstr5));
break;
end;

sstr8:=copy(sstr7,0,20);             //������������ �������

if beta=false then begin
N[j]:=sstr2;
typ[j]:=sstr4;
Eorb[j]:=sstr6;
Ekin[j]:=sstr8;
if j>1 then begin
if (typ[j]='V') and (typ[j-1]='O') then homo:=j;
if (pos('--V',typ[j])<>0) and (pos('--O',typ[j-1])<>0) then homo:=j;
if (pos('--V',typ[j])<>0) and (typ[j-1]='O') then homo:=j;
if (typ[j]='V') and (pos('--O',typ[j-1])<>0)  then homo:=j;
end;
end
else begin
N_beta[j]:=sstr2;
typ_beta[j]:=sstr4;
Eorb_beta[j]:=sstr6;
Ekin_beta[j]:=sstr8;
if j>1 then begin
if (typ_beta[j]='V') and (typ_beta[j-1]='O') then homo_beta:=j;
if (pos('--V',typ_beta[j])<>0) and (pos('--O',typ_beta[j-1])<>0) then homo_beta:=j;
if (pos('--V',typ_beta[j])<>0) and (typ_beta[j-1]='O') then homo_beta:=j;
if (typ_beta[j]='V') and (pos('--O',typ_beta[j-1])<>0)  then homo_beta:=j;
end;
end;


ch:=j;
ReadLn(f,str);


j:=j+1;




end;   // while pos('.',str)<>0 do begin
end;   // if pos('Orbital energies and kinetic energies (alpha)',str)<>0 then begin
end;   //     while not(Eof) do begin
CloseFile(f);
if length(N)=0 then begin
showmessage('���� '+ Form1.Opendialog1.FileName + ' �� �������� ������ �� ���������');
goto 0;
end;



////////////////���� �������� ������ ��� ������� ����///////////////
ps:=0;
for i:=0 to length(Form1.OpenDialog1.FileName) do
if copy(Form1.OpenDialog1.FileName,i,1)='\'   then ps:=i;
task:=copy(Form1.OpenDialog1.FileName,ps+1,100);
////////////////////////////////////////////////////////////////////





//////////////////���������� ���������� � COMBOBOX////////////////////

Combobox1.Items.Add(task);
Combobox1.ItemIndex:=0;

if beta=false then Combobox2.Items.Add('alpha-electrons')
else begin
Combobox2.Items.Add('alpha-electrons');
Combobox2.Items.Add('beta-electrons');
end;
Combobox2.ItemIndex:=0;



///////////////////���������� �������/////////////////////////////////

for i:=0 to ch do begin

itm:=Form14.ListView1.Items.Add;
itm.Caption:=N[i];
itm.SubItems.Append(typ[ch-i]);
itm.SubItems.Append(floattostrf((strtofloat(Eorb[ch-i])*ev),ffFixed,10,6));
itm.SubItems.Append(floattostrf((strtofloat(Ekin[ch-i])*ev),ffFixed,10,6));
end;

end; ///////////////////////////////////////////// ����� �������� 1-�� �������





///////////////////������ ���������� ������//////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////





if dial=false then begin           // ���� ������ 2-�� ������ (������)
axx:=0;
for i:=0 to nf-1 do begin
str:='';
setlength(beta_mult,i+1);
setlength(task_mult,i+1);

beta_mult[i]:=false;
////////////////���� �������� ������ ��� ������� ����///////////////
ps:=0;
for j:=0 to length(Form1.OpenDialog2.Files[i]) do
if copy(Form1.OpenDialog2.Files[i],j,1)='\'   then ps:=j;
task_mult[i]:=copy(Form1.OpenDialog2.Files[i],ps+1,100);
////////////////////////////////////////////////////////////////////
//Form14.ComboBox1.Items.Add(task);
//Combobox1.ItemIndex:=0;










///////////////////////////////////////////////////////////////////
///////////////////////////READING ORBITALS//////////////////////
////////////////////////OF MULTIPLE FILES/////////////////////////
//////////////////////////////////////////////////////////////////

AssignFile(f,Form1.Opendialog2.Files[i]);
setlength(Ch_mult,i+1);
j:=0;
//if length(basket)=0 then setlength(basket,nf);
Reset(f);
while not Eof(f) do begin
if pos('Total kinetic energy from orbitals',str)<>0 then break;
if pos('Orbital energies and kinetic energies (beta)',str)<>0 then
begin
j:=0;
beta_mult[i]:=true;
goto 100;
end;
ReadLn(f,str);
if pos('Orbital energies and kinetic energies (alpha)',str)<>0 then begin
100: ReadLn(f,str);
ReadLn(f,str);
while (pos('Total kinetic energy from orbitals',str)=0) and (pos('Orbital energies and kinetic energies',str)=0) do begin






//setlength(Ch_mult,i+2);
if axx<ch_mult[i] then axx:=ch_mult[i];
if beta_mult[i]=false then begin
setlength(N_mult,i+1,axx+2);
setlength(typ_mult,i+1,axx+2);
setlength(Eorb_mult,i+1,axx+2);
setlength(Ekin_mult,i+1,axx+2);
end
else begin
setlength(N_mult_beta,i+1,axx+2);
setlength(typ_mult_beta,i+1,axx+2);
setlength(Eorb_mult_beta,i+1,axx+2);
setlength(Ekin_mult_beta,i+1,axx+2);
end;










for s:=0 to length(str) do
if copy(str,s,1)<>' ' then begin
sstr1:=copy(str,s,length(str)-s);
break;
end;

for s:=0 to length(sstr1) do
if copy(sstr1,s,1)=' ' then begin
sstr2:=copy(sstr1,0,s-1);               //����� ��������
break;
end;

for s:=1 to length(sstr1) do
if copy(sstr1,s+length(sstr2),1)<>' ' then begin
sstr3:=copy(sstr1,s+length(sstr2),length(sstr1));
break;
end;

for s:=0 to length(sstr3) do
if copy(sstr3,s,1)=' ' then begin
sstr4:=copy(sstr3,0,s-1);               //��� ��������
break;
end;

for s:=1 to length(sstr3) do
if copy(sstr3,s+length(sstr4),1)<>' ' then begin
sstr5:=copy(sstr3,s+length(sstr4),length(sstr3));
break;
end;

for s:=0 to length(sstr5) do
if copy(sstr5,s,1)=' ' then begin
sstr6:=copy(sstr5,0,s-1);               //����������� �������
break;
end;

for s:=1 to length(sstr5) do
if copy(sstr5,s+length(sstr6),1)<>' ' then begin
sstr7:=copy(sstr5,s+length(sstr6),length(sstr5));
break;
end;

sstr8:=copy(sstr7,0,20);             //������������ �������



if beta_mult[i]=false then begin
N_mult[i,j]:=sstr2;
typ_mult[i,j]:=sstr4;
Eorb_mult[i,j]:=sstr6;
Ekin_mult[i,j]:=sstr8;
if j>1 then begin
setlength(homo_mult,i+1);
if (typ_mult[i,j]='V') and (typ_mult[i,j-1]='O') then homo_mult[i]:=j;
if (pos('--V',typ_mult[i,j])<>0) and (pos('--O',typ_mult[i,j-1])<>0) then homo_mult[i]:=j;
if (pos('--V',typ_mult[i,j])<>0) and (typ_mult[i,j-1]='O') then homo_mult[i]:=j;
if (typ_mult[i,j]='V') and (pos('--O',typ_mult[i,j-1])<>0)  then homo_mult[i]:=j;
end;
end
else begin
N_mult_beta[i,j]:=sstr2;
typ_mult_beta[i,j]:=sstr4;
Eorb_mult_beta[i,j]:=sstr6;
Ekin_mult_beta[i,j]:=sstr8;
if j>1 then begin
setlength(homo_mult_beta,i+1);
if (typ_mult_beta[i,j]='V') and (typ_mult_beta[i,j-1]='O') then homo_mult_beta[i]:=j;
if (pos('--V',typ_mult_beta[i,j])<>0) and (pos('--O',typ_mult_beta[i,j-1])<>0) then homo_mult_beta[i]:=j;
if (pos('--V',typ_mult_beta[i,j])<>0) and (typ_mult_beta[i,j-1]='O') then homo_mult_beta[i]:=j;
if (typ_mult_beta[i,j]='V') and (pos('--O',typ_mult_beta[i,j-1])<>0)  then homo_mult_beta[i]:=j;
end;
end;













ch_mult[i]:=j;





ReadLn(f,str);


j:=j+1;




end;   // while pos('.',str)<>0 do begin
end;   // if pos('Orbital energies and kinetic energies (alpha)',str)<>0 then begin
end;   //     while not(Eof) do begin

CloseFile(f);



//basket:=nil;      //������� ������ � ���������� ����� ���� �������� ���������
//k:=0;
if  Ch_mult[i]>=1 then begin
setlength(basket,length(basket)+1);
basket[length(basket)-1]:=i;   // ����� ���������� ��������
Combobox1.Items.Add(task_mult[i]);
//k:=k+1;
end
else showmessage('���� '+ Form1.OpenDialog2.Files[i] +' �� �������� ������ �� ���������!');
//end;




end;     //for i:=0 to nf-1 do begin

Form14.ComboBox1.ItemIndex:=0;
if length(basket)=0 then goto 0;



///////////////////���������� �������/////////////////////////////////
//////////////////��� ������ ����� ����������� ��� ������� ������������ �����//////////////
///////////////////����� ���������� �� ����� ��� ������ ����� �� ����������//////////////

//if i=0 then begin   // ������� ����, ��� � ��� ���� � ������� 1


for j:=0 to ch_mult[basket[0]] do begin
itm:=Form14.ListView1.Items.Add;
itm.Caption:=N_mult[basket[0],j];
itm.SubItems.Append(typ_mult[basket[0],ch_mult[basket[0]]-j]);
itm.SubItems.Append(floattostrf((strtofloat(Eorb_mult[basket[0],ch_mult[basket[0]]-j])*ev),ffFixed,10,6));
itm.SubItems.Append(floattostrf((strtofloat(Ekin_mult[basket[0],ch_mult[basket[0]]-j])*ev),ffFixed,10,6));
end;
//end;

//end; ///////////////////////////////////////////// ����� �������� 1-�� �������





//end;     //for i:=0 to nf-1 do begin

if beta_mult[basket[0]]=false then Combobox2.Items.Add('alpha-electrons')
else begin
Combobox2.Items.Add('alpha-electrons');
Combobox2.Items.Add('beta-electrons');
end;
Combobox2.ItemIndex:=0;

end;     //if dial=false then begin


if dial=true then if length(N)=0 then goto 0;
if dial=false then if length(N_mult)=0 then goto 0;



Label4.Font.Name:='Symbol';
Label4.Caption:=#68;
if dial=true then  begin
Label10.Caption:=' = '+floattostrf(Simpleroundto(strtofloat(Eorb[homo])*ev-strtofloat(Eorb[homo-1])*ev,-4),ffFixed,5,3)+' ��';
Label5.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb[homo-1])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo)+' / '+inttostr(ch-homo+2)+')';
Label6.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb[homo])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo+1)+' / '+inttostr(ch-homo+1)+')';
Label7.Caption:='Nocc = '+inttostr(homo);
Label8.Caption:='Nvirt = '+inttostr(ch-homo+1);
Label9.Caption:='Norb = '+inttostr(ch+1);

if beta=true then begin
Label12.Visible:=True;
Label13.Font.Name:='Symbol';
Label13.Caption:=#68;
Label19.Caption:=' = '+floattostrf(Simpleroundto(strtofloat(Eorb_beta[homo_beta])*ev-strtofloat(Eorb_beta[homo_beta-1])*ev,-4),ffFixed,5,3)+' ��';
Label14.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_beta[homo_beta-1])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_beta)+' / '+inttostr(ch-homo_beta+2)+')';
Label15.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_beta[homo_beta])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_beta+1)+' / '+inttostr(ch-homo_beta+1)+')';
Label16.Caption:='Nocc = '+inttostr(homo_beta);
Label17.Caption:='Nvirt = '+inttostr(ch-homo_beta+1);
Label18.Caption:='Norb = '+inttostr(ch+1);
end;
end
else begin
Label10.Caption:=' = '+floattostrf(Simpleroundto(strtofloat(Eorb_mult[basket[0],homo_mult[basket[0]]])*ev-strtofloat(Eorb_mult[basket[0],homo_mult[basket[0]]-1])*ev,-4),ffFixed,5,3)+' ��';
Label5.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_mult[basket[0],homo_mult[basket[0]]-1])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_mult[basket[0]])+' / '+inttostr(ch_mult[basket[0]]-homo_mult[basket[0]]+2)+')';
Label6.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_mult[basket[0],homo_mult[basket[0]]])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_mult[basket[0]]+1)+' / '+inttostr(ch_mult[basket[0]]-homo_mult[basket[0]]+1)+')';
Label7.Caption:='Nocc = '+inttostr(homo_mult[basket[0]]);
Label8.Caption:='Nvirt = '+inttostr(ch_mult[basket[0]]-homo_mult[basket[0]]+1);
Label9.Caption:='Norb = '+inttostr(ch_mult[basket[0]]+1);

if beta_mult[basket[0]]  then begin
Label12.Visible:=True;
Label13.Font.Name:='Symbol';
Label13.Caption:=#68;
Label19.Caption:=' = '+floattostrf(Simpleroundto(strtofloat(Eorb_mult_beta[basket[0],homo_mult_beta[basket[0]]])*ev-strtofloat(Eorb_mult_beta[basket[0],homo_mult_beta[basket[0]]-1])*ev,-4),ffFixed,5,3)+' ��';
Label14.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_mult_beta[basket[0],homo_mult_beta[basket[0]]-1])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_mult_beta[basket[0]])+' / '+inttostr(ch_mult[basket[0]]-homo_mult_beta[basket[0]]+2)+')';
Label15.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_mult_beta[basket[0],homo_mult_beta[basket[0]]])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_mult_beta[basket[0]]+1)+' / '+inttostr(ch_mult[basket[0]]-homo_mult_beta[basket[0]]+1)+')';
Label16.Caption:='Nocc = '+inttostr(homo_mult_beta[basket[0]]);
Label17.Caption:='Nvirt = '+inttostr(ch_mult[basket[0]]-homo_mult_beta[basket[0]]+1);
Label18.Caption:='Norb = '+inttostr(ch_mult[basket[0]]+1);
end;

end;


if ListView1.Items.Count>=1 then begin
Form14.Button1.Enabled:=True;
Form14.Button2.Enabled:=True;
Form14.TrackBar1.Enabled:=True;
Form14.BitBtn1.Enabled:=True;
if Form14.ComboBox1.Items.Count>=2 then Form14.BitBtn2.Enabled:=True;
Form14.BitBtn3.Enabled:=True;
Form14.CheckBox1.Enabled:=True;
Form14.CheckBox2.Enabled:=True;
end;

0: end;















procedure TForm14.Button2Click(Sender: TObject);
var mlt1, mlt2, mlt: real;
begin
if dial=true then begin
mlt1:= (strtofloat(Eorb[ch])-strtofloat(Eorb[homo]))/(strtofloat(Eorb[ch])-strtofloat(Eorb[0]));
mlt2:= (strtofloat(Eorb[ch])-strtofloat(Eorb[homo-1]))/(strtofloat(Eorb[ch])-strtofloat(Eorb[0]));
mlt:=(mlt1+mlt2)/2;
end
else begin
mlt1:= (strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],homo_mult[basket[Combobox1.ItemIndex]]]))/(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0]));
mlt2:= (strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],homo_mult[basket[Combobox1.ItemIndex]]-1]))/(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0]));
mlt:=(mlt1+mlt2)/2;
end;
if dial=true then PaintBox1.ClientHeight:=PaintBox1.ClientHeight+ch*TrackBar1.Position
else PaintBox1.ClientHeight:=PaintBox1.ClientHeight+ch_mult[basket[Combobox1.ItemIndex]]*TrackBar1.Position;
ScrollBox1.VertScrollBar.Position:=round(PaintBox1.ClientHeight*mlt)-round(ScrollBox1.ClientHeight/2);
PaintBox1.Invalidate;
end;












procedure TForm14.PaintBox1Paint(Sender: TObject);
var Hmin, Hmax,i,j,scale,zn: integer;
probel,txtout1: string;
label 0;
begin
{with Form14.PaintBox1.Canvas do begin
Pen.Width:=3;
MoveTo(10,PaintBox1.ClientHeight);
LineTo(120,PaintBox1.ClientHeight);
end; }
///////////////���� ������ �������� ������ �����/////////////////////
probel:='                   ';
//PaintBox1.ClientHeight:=ScrollBox1.ClientHeight-6;
//PaintBox1.Top:=3;
if (dial=true) and (Form1.OpenDialog1.FilterIndex=2) then begin
if length(N)=0 then goto 0;
Hmax:=PaintBox1.ClientHeight-5;
Hmin:=5;
with Form14.PaintBox1.Canvas do begin
Pen.Width:=0;
Pen.Color:=clBlack;
for i:=0 to ch do begin
if (typ[i]='O') or  (pos('-O',typ[i])<>0) then Form14.PaintBox1.Canvas.Pen.Color:=clBlack
else  Form14.PaintBox1.Canvas.Pen.Color:=clred;

if checkbox1.Checked then begin
if (i=homo) or (i=homo-1)  then  begin
Form14.PaintBox1.Canvas.Pen.Color:=clblue;
Form14.PaintBox1.Canvas.Pen.Width:=2;
end;
end;

MoveTo (50+20,Round((Hmax-Hmin)*(strtofloat(Eorb[ch])*ev-strtofloat(Eorb[i])*ev)/ (strtofloat(Eorb[ch])*ev-strtofloat(Eorb[0])*ev))+5);
LineTo (105+20,Round((Hmax-Hmin)*(strtofloat(Eorb[ch])*ev-strtofloat(Eorb[i])*ev)/ (strtofloat(Eorb[ch])*ev-strtofloat(Eorb[0])*ev))+5);

Form14.PaintBox1.Canvas.Pen.Color:=clred;
Form14.PaintBox1.Canvas.Pen.Width:=1;

if beta=true then begin
if (typ_beta[i]='O') or  (pos('-O',typ_beta[i])<>0) then Form14.PaintBox1.Canvas.Pen.Color:=clBlack
else  Form14.PaintBox1.Canvas.Pen.Color:=clred;

if checkbox1.Checked then begin
if (i=homo_beta) or (i=homo_beta-1)  then  begin
Form14.PaintBox1.Canvas.Pen.Color:=clblue;
Form14.PaintBox1.Canvas.Pen.Width:=2;
end;
end;

MoveTo (120+20,Round((Hmax-Hmin)*(strtofloat(Eorb_beta[ch])*ev-strtofloat(Eorb_beta[i])*ev)/ (strtofloat(Eorb_beta[ch])*ev-strtofloat(Eorb_beta[0])*ev))+5);
LineTo (175+20,Round((Hmax-Hmin)*(strtofloat(Eorb_beta[ch])*ev-strtofloat(Eorb_beta[i])*ev)/ (strtofloat(Eorb_beta[ch])*ev-strtofloat(Eorb_beta[0])*ev))+5);

Form14.PaintBox1.Canvas.Pen.Color:=clred;
Form14.PaintBox1.Canvas.Pen.Width:=1;

end;
end;
end;
end; ///////�����  ������� �������� ������ �����

if dial=false then begin
if length(basket)=0 then goto 0;
Hmax:=PaintBox1.ClientHeight-5;
Hmin:=5;
with Form14.PaintBox1.Canvas do begin
Pen.Width:=0;
Pen.Color:=clBlack;


for j:=0 to ch_mult[basket[Combobox1.ItemIndex]] do begin
if (typ_mult[basket[Combobox1.ItemIndex],j]='O')  or  (pos('-O',typ_mult[basket[Combobox1.ItemIndex],j])<>0)  then Form14.PaintBox1.Canvas.Pen.Color:=clBlack
else  Form14.PaintBox1.Canvas.Pen.Color:=clred;

if checkbox1.Checked then begin
if (j=homo_mult[basket[Combobox1.ItemIndex]]) or (j=homo_mult[basket[Combobox1.ItemIndex]]-1)  then  begin
Form14.PaintBox1.Canvas.Pen.Color:=clblue;
Form14.PaintBox1.Canvas.Pen.Width:=2;
end;
end;

MoveTo (50+20,Round((Hmax-Hmin)*(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex], ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex], j])*ev)/ (strtofloat(Eorb_mult[basket[Combobox1.ItemIndex], ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0])*ev))+5);
LineTo (105+20,Round((Hmax-Hmin)*(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex], ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex], j])*ev)/ (strtofloat(Eorb_mult[basket[Combobox1.ItemIndex], ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0])*ev))+5);

Form14.PaintBox1.Canvas.Pen.Color:=clred;
Form14.PaintBox1.Canvas.Pen.Width:=1;

if beta_mult[basket[Combobox1.ItemIndex]]=true then begin
if (typ_mult_beta[basket[Combobox1.ItemIndex],j]='O') or  (pos('-O',typ_mult_beta[basket[Combobox1.ItemIndex],j])<>0) then Form14.PaintBox1.Canvas.Pen.Color:=clBlack
else  Form14.PaintBox1.Canvas.Pen.Color:=clred;

if checkbox1.Checked then begin
if (j=homo_mult_beta[basket[Combobox1.ItemIndex]]) or (j=homo_mult_beta[basket[Combobox1.ItemIndex]]-1)  then  begin
Form14.PaintBox1.Canvas.Pen.Color:=clblue;
Form14.PaintBox1.Canvas.Pen.Width:=2;
end;
end;

MoveTo (120+20,Round((Hmax-Hmin)*(strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],j])*ev)/ (strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],0])*ev))+5);
LineTo (175+20,Round((Hmax-Hmin)*(strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],j])*ev)/ (strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],0])*ev))+5);

Form14.PaintBox1.Canvas.Pen.Color:=clred;
Form14.PaintBox1.Canvas.Pen.Width:=1;

end;





end;
end;
end; ///////�����  ������� �������� ������ �����















if checkbox2.Checked then begin
scale:=Round(PaintBox1.ClientHeight*0.035);
Form14.PaintBox1.Canvas.Pen.Color:=clblack;
Form14.PaintBox1.Canvas.Pen.Width:=1;
Form14.PaintBox1.Canvas.Font.Size:=9;
with Form14.PaintBox1.Canvas do  begin
MoveTo(43+15,PaintBox1.ClientHeight-5);
LineTo(43+15,0);
for i:=0 to scale do begin               //  scale=Round(PaintBox1.ClientHeight*0.1) - ����� ������� �� ��� ������� ������� �� �������� ����
if  PaintBox1.ClientHeight>500000 then zn:=3 else zn:=2;
MoveTo(43+15,Round(PaintBox1.ClientHeight+10-(1/scale)*i*(PaintBox1.ClientHeight+10)));
LineTo(48+15,Round(PaintBox1.ClientHeight+10-(1/scale)*i*(PaintBox1.ClientHeight+10)));
//Font.Height:=0;

//TextOut(1,Round((PaintBox1.ClientHeight-(1/scale)*i*PaintBox1.ClientHeight)), copy(probel,0,6-length(floattostrf(strtofloat(Eorb[ch]) + ((PaintBox1.ClientHeight-(1/scale)*i*PaintBox1.ClientHeight)/PaintBox1.ClientHeight) * (strtofloat(Eorb[0])-strtofloat(Eorb[ch])),ffFixed,4,2)) )          +                     floattostrf(strtofloat(Eorb[ch]) + ((PaintBox1.ClientHeight-0.001*i*PaintBox1.ClientHeight)/PaintBox1.ClientHeight) * (strtofloat(Eorb[0])-strtofloat(Eorb[ch])),ffFixed,4,2));
if dial=true then  begin
txtout1:=copy(probel,0,6-length(floattostrf(strtofloat(Eorb[0])*ev+(i*(strtofloat(Eorb[ch])*ev-strtofloat(Eorb[0])*ev)/scale),ffFixed,4,zn)))  +  floattostrf(strtofloat(Eorb[0])*ev+(i*(strtofloat(Eorb[ch])*ev-strtofloat(Eorb[0])*ev)/scale),ffFixed,4,zn);
TextOut(51-PaintBox1.Canvas.TextWidth(txtout1),Round(PaintBox1.ClientHeight+10-(1/scale)*i*(PaintBox1.ClientHeight+10))-7, txtout1);
end
                                                               //Round(PaintBox1.ClientHeight+10-(1/scale)*i*(PaintBox1.ClientHeight+10))-7

else  begin
txtout1:=copy(probel,0,6-length(floattostrf(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0])*ev+(i*(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0])*ev)/scale),ffFixed,4,zn)))          +       floattostrf(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0])*ev+(i*(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0])*ev)/scale),ffFixed,4,zn) ;
TextOut(51-PaintBox1.Canvas.TextWidth(txtout1),Round(PaintBox1.ClientHeight+10-(1/scale)*i*(PaintBox1.ClientHeight+10))-7, txtout1) ;
end;


end;

end;


end;
0: end;












procedure TForm14.ComboBox1Change(Sender: TObject);
var itm: TListItem;
j,i: integer;
label 0;
begin
if  form14.ComboBox1.Items.Count=1 then goto 0;
Form14.ComboBox2.Clear;
label12.Visible:=false;

PaintBox1.ClientHeight:=ScrollBox1.ClientHeight-5;

if PaintBox1.ClientHeight/ScrollBox1.ClientHeight>1 then begin
for i:=0 to round(PaintBox1.ClientHeight/ScrollBox1.ClientHeight)-1 do
Button2.Click;
end
else begin
for i:=0 to round(ScrollBox1.ClientHeight/PaintBox1.ClientHeight)-1 do
Button1.Click;
end;




if form14.ComboBox1.Items.Count>1 then begin
if beta_mult[basket[Combobox1.ItemIndex]]=false then Combobox2.Items.Add('alpha-electrons')
else begin
Combobox2.Items.Add('alpha-electrons');
Combobox2.Items.Add('beta-electrons');
end;
end;
Combobox2.ItemIndex:=0;



if form14.ComboBox1.Items.Count>1 then begin
Form14.ListView1.Clear;
Form14.Combobox2.ItemIndex:=0;
for j:=0 to ch_mult[basket[Combobox1.ItemIndex]] do begin
itm:=Form14.ListView1.Items.Add;
//showmessage(inttostr(length(ch_mult)));
//showmessage(inttostr(length(N_mult)));
//showmessage(inttostr(basket[Combobox1.ItemIndex]));
itm.Caption:=N_mult[basket[Combobox1.ItemIndex],j];
itm.SubItems.Append(typ_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-j]);
itm.SubItems.Append(floattostrf((strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-j])*ev),ffFixed,10,6));
itm.SubItems.Append(floattostrf((strtofloat(Ekin_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-j])*ev),ffFixed,10,6));
end;
PaintBox1.Invalidate;
end;

///////////////////////////////////////////


Label10.Caption:=' = '+floattostrf(Simpleroundto(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],homo_mult[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],homo_mult[basket[Combobox1.ItemIndex]]-1])*ev,-4),ffFixed,5,3)+' ��';
Label5.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],homo_mult[basket[Combobox1.ItemIndex]]-1])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_mult[basket[Combobox1.ItemIndex]])+' / '+inttostr(ch_mult[basket[Combobox1.ItemIndex]]-homo_mult[basket[Combobox1.ItemIndex]]+2)+')';
Label6.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],homo_mult[basket[Combobox1.ItemIndex]]])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_mult[basket[Combobox1.ItemIndex]]+1)+' / '+inttostr(ch_mult[basket[Combobox1.ItemIndex]]-homo_mult[basket[Combobox1.ItemIndex]]+1)+')';
Label7.Caption:='Nocc = '+inttostr(homo_mult[basket[Combobox1.ItemIndex]]);
Label8.Caption:='Nvirt = '+inttostr(ch_mult[Combobox1.ItemIndex]-homo_mult[basket[Combobox1.ItemIndex]]+1);
Label9.Caption:='Norb = '+inttostr(ch_mult[basket[Combobox1.ItemIndex]]+1);


if beta_mult[basket[Combobox1.ItemIndex]]=true  then begin
Label12.Visible:=true;
Label13.Font.Name:='Symbol';
Label13.Caption:=#68;
Label19.Caption:=' = '+floattostrf(Simpleroundto(strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],homo_mult_beta[basket[Combobox1.ItemIndex]]])*ev-strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],homo_mult_beta[basket[Combobox1.ItemIndex]]-1])*ev,-4),ffFixed,5,3)+' ��';
Label14.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],homo_mult_beta[basket[Combobox1.ItemIndex]]-1])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_mult_beta[basket[Combobox1.ItemIndex]])+' / '+inttostr(ch_mult[basket[Combobox1.ItemIndex]]-homo_mult_beta[basket[Combobox1.ItemIndex]]+2)+')';
Label15.Caption:='E���� = '+Floattostrf(Simpleroundto(strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],homo_mult_beta[basket[Combobox1.ItemIndex]]])*ev,-4),ffFixed,5,3) +' ��'+'       '+ '('+inttostr(homo_mult_beta[basket[Combobox1.ItemIndex]]+1)+' / '+inttostr(ch_mult[basket[Combobox1.ItemIndex]]-homo_mult_beta[basket[Combobox1.ItemIndex]]+1)+')';
Label16.Caption:='Nocc = '+inttostr(homo_mult_beta[basket[Combobox1.ItemIndex]]);
Label17.Caption:='Nvirt = '+inttostr(ch_mult[basket[Combobox1.ItemIndex]]-homo_mult_beta[basket[Combobox1.ItemIndex]]+1);
Label18.Caption:='Norb = '+inttostr(ch_mult[basket[Combobox1.ItemIndex]]+1);
end
else begin
Label12.Visible:=False;
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
end;
////////////////////////////////////////



0: end;

procedure TForm14.ComboBox2Change(Sender: TObject);
var i: integer;
itm: TListItem;
begin
if combobox2.Items.Count>1 then begin
Form14.ListView1.Clear;

if dial=true then begin
if combobox2.ItemIndex=0 then begin
for i:=0 to ch do begin
itm:=Form14.ListView1.Items.Add;
itm.Caption:=N[i];
itm.SubItems.Append(typ[ch-i]);
itm.SubItems.Append(floattostrf((strtofloat(Eorb[ch-i])*ev),ffFixed,10,6));
itm.SubItems.Append(floattostrf((strtofloat(Ekin[ch-i])*ev),ffFixed,10,6));
end;
end
else begin
for i:=0 to ch do begin
itm:=Form14.ListView1.Items.Add;
itm.Caption:=N_beta[i];
itm.SubItems.Append(typ_beta[ch-i]);
itm.SubItems.Append(floattostrf((strtofloat(Eorb_beta[ch-i])*ev),ffFixed,10,6));
itm.SubItems.Append(floattostrf((strtofloat(Ekin_beta[ch-i])*ev),ffFixed,10,6));
end;
end;
end
else begin


if combobox2.ItemIndex=0 then begin
for i:=0 to ch_mult[basket[Combobox1.ItemIndex]] do begin
itm:=Form14.ListView1.Items.Add;
itm.Caption:=N_mult[basket[Combobox1.ItemIndex],i];
itm.SubItems.Append(typ_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-i]);
itm.SubItems.Append(floattostrf((strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-i])*ev),ffFixed,10,6));
itm.SubItems.Append(floattostrf((strtofloat(Ekin_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-i])*ev),ffFixed,10,6));
end;
end
else begin
for i:=0 to ch_mult[basket[Combobox1.ItemIndex]] do begin
itm:=Form14.ListView1.Items.Add;
itm.Caption:=N_mult_beta[basket[Combobox1.ItemIndex],i];
itm.SubItems.Append(typ_mult_beta[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-i]);
itm.SubItems.Append(floattostrf((strtofloat(Eorb_mult_beta[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-i])*ev),ffFixed,10,6));
itm.SubItems.Append(floattostrf((strtofloat(Ekin_mult_beta[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]-i])*ev),ffFixed,10,6));
end;
end;












end;
end;
end;

procedure TForm14.Button1Click(Sender: TObject);
var mlt1, mlt2, mlt: real;
begin
if PaintBox1.ClientHeight/ScrollBox1.ClientHeight>1.05 then begin
if dial=true then begin
mlt1:= (strtofloat(Eorb[ch])-strtofloat(Eorb[homo]))/(strtofloat(Eorb[ch])-strtofloat(Eorb[0]));
mlt2:= (strtofloat(Eorb[ch])-strtofloat(Eorb[homo-1]))/(strtofloat(Eorb[ch])-strtofloat(Eorb[0]));
mlt:=(mlt1+mlt2)/2;
end
else begin
mlt1:= (strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],homo_mult[basket[Combobox1.ItemIndex]]]))/(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0]));
mlt2:= (strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],homo_mult[basket[Combobox1.ItemIndex]]-1]))/(strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],ch_mult[basket[Combobox1.ItemIndex]]])-strtofloat(Eorb_mult[basket[Combobox1.ItemIndex],0]));
mlt:=(mlt1+mlt2)/2;
end;
if dial=true then PaintBox1.ClientHeight:=PaintBox1.ClientHeight-ch*TrackBar1.Position
else PaintBox1.ClientHeight:=PaintBox1.ClientHeight-ch_mult[basket[Combobox1.ItemIndex]]*TrackBar1.Position;
ScrollBox1.VertScrollBar.Position:=round(PaintBox1.ClientHeight*mlt)-round(ScrollBox1.ClientHeight/2);
PaintBox1.Invalidate;
end;
if PaintBox1.ClientHeight/ScrollBox1.ClientHeight<0.94 then begin
PaintBox1.ClientHeight:=ScrollBox1.ClientHeight-5;
PaintBox1.Invalidate;
end;
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
Form14.TrackBar1.Min:=10;
Form14.TrackBar1.Max:=100;
Form14.TrackBar1.Position:=100;
Form14.TrackBar1.Frequency:=30;
Form14.PaintBox1.ClientHeight:=Form14.ScrollBox1.ClientHeight-10;
Form14.PaintBox1.Top:=5;
end;

procedure TForm14.CheckBox1Click(Sender: TObject);
begin
PaintBox1.Invalidate;
end;

procedure TForm14.CheckBox2Click(Sender: TObject);
begin
PaintBox1.Invalidate;
end;

procedure TForm14.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var i: real;
begin
i:=0.0001;
if WindowFromPoint(Mouse.CursorPos) = ScrollBox1.Handle then
ScrollBox1.VertScrollBar.Position:=ScrollBox1.VertScrollBar.Position+round(PaintBox1.ClientHeight*i);

end;

procedure TForm14.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var i: real;
begin
i:=0.0001;
if WindowFromPoint(Mouse.CursorPos) = ScrollBox1.Handle then
ScrollBox1.VertScrollBar.Position:=ScrollBox1.VertScrollBar.Position-round(PaintBox1.ClientHeight*i);

end;

procedure TForm14.BitBtn1Click(Sender: TObject);
begin
//Form15.PaintBox1.ClientWidth:=Form15.PaintBox1.ClientWidth + Form14.ComboBox1.Items.Count*20 ;
Form15.Show;
end;

procedure TForm14.BitBtn2Click(Sender: TObject);
begin
Form16.Show;
end;

procedure TForm14.BitBtn3Click(Sender: TObject);
begin
Form17.Show;
end;

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form14.Button1.Enabled:=False;
Form14.Button2.Enabled:=False;
Form14.TrackBar1.Enabled:=False;
Form14.BitBtn1.Enabled:=False;
Form14.BitBtn2.Enabled:=False;
Form14.BitBtn3.Enabled:=False;
Form14.CheckBox1.Enabled:=False;
Form14.CheckBox2.Enabled:=False;
Label4.Caption:='';
Label5.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
end;

end.
