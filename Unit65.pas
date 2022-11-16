unit Unit65;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TForm65 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form65: TForm65;

implementation

uses Unit1,Unit24,Unit64, Unit66;

{$R *.dfm}


function howlong(var X: MyType): Integer;
var i: integer;
begin
for i:=0 to length(X)-1 do
if X[i,0]='' then Break;
Result:=i-1;
end;

function howlong_el(var X: MyType): Integer;
var i: integer;
begin
for i:=0 to length(X[0])-1 do
if X[0,i]='' then Break;
Result:=i-1;
end;






procedure TForm65.FormShow(Sender: TObject);
var i,j: integer;
itm: TListItem;
Ad: boolean;
begin
Combobox1.Clear;
if dial=true then begin
if Form64.Combobox2.Text='Mulliken'  then begin
if mull<>nil then begin
for i:=0 to length(mull)-1 do
if mull[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='MBS Mulliken'  then begin
if mbs_mull<>nil then begin
for i:=0 to length(mbs_mull)-1 do
if mbs_mull[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='Bonding Mulliken'  then begin
if bond_mull<>nil then begin
for i:=0 to length(bond_mull)-1 do
if bond_mull[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='ESP'  then begin
if esp<>nil then begin
for i:=0 to length(esp)-1 do
if esp[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='Hirshfeld'  then begin
if hir<>nil then begin
for i:=0 to length(hir)-1 do
if hir[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='CM5'  then begin
if cm5<>nil then begin
for i:=0 to length(cm5)-1 do
if cm5[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='NBO'  then begin
if nbo<>nil then begin
for i:=0 to length(nbo)-1 do
if nbo[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='AIM'  then begin
if aim<>nil then begin
for i:=0 to length(aim)-1 do
if aim[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='Lowdin'  then begin
if lo<>nil then begin
for i:=0 to length(lo)-1 do
if lo[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
if Form64.Combobox2.Text='APT'  then begin
if apt<>nil then begin
for i:=0 to length(apt)-1 do
if apt[i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
Combobox1.ItemIndex:=Combobox1.Items.Count-1;
if Combobox1.Items.Count<2 then BitBtn1.Enabled:=False
else BitBtn1.Enabled:=True;

ListView1.Clear;


while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

ListView1.Columns.Add;
ListView1.Columns.Add;
ListView1.Columns.Add;
ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=60;
ListView1.Columns.Items[2].Width:=100;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Атом';
ListView1.Columns.Items[2].Caption:='Заряд, а.е.';
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@
// Заполняем ListView                                                        @@@@@           @@@@@@@      @@@@@      @@@@@@@@@
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@

if Form64.Combobox2.Text='Mulliken' then begin
if howlong(mull_spin)>=0 then  if mull_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if mull_h<>nil then begin
if howlong(mull_h)>=0 then  if mull_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if mull_spin_h<>nil then begin
if howlong(mull_spin_h)>=0 then  if mull_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(mull[strtoint(Combobox1.Text)-1])-1 do begin
if mull[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(mull[strtoint(Combobox1.Text)-1,i]);
if howlong(mull_spin)>=0 then  if mull_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(mull_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if mull_h<>nil then begin
if howlong(mull_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if mull_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(mull_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if mull_spin_h<>nil then begin
if howlong(mull_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if mull_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(mull_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Ad:=false;

if Form64.Combobox2.Text='MBS Mulliken' then begin
if howlong(mbs_mull_spin)>=0 then  if mbs_mull_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if mbs_mull_h<>nil then begin
if howlong(mbs_mull_h)>=0 then  if mbs_mull_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if mbs_mull_spin_h<>nil then begin
if howlong(mbs_mull_spin_h)>=0 then  if mbs_mull_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(mbs_mull[strtoint(Combobox1.Text)-1])-1 do begin
if mbs_mull[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(mbs_mull[strtoint(Combobox1.Text)-1,i]);
if howlong(mbs_mull_spin)>=0 then  if mbs_mull_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(mbs_mull_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if mbs_mull_h<>nil then begin
if howlong(mbs_mull_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if mbs_mull_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(mbs_mull_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if mbs_mull_spin_h<>nil then begin
if howlong(mbs_mull_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if mbs_mull_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(mbs_mull_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='Bonding Mulliken' then begin
if howlong(bond_mull_spin)>=0 then  if bond_mull_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if bond_mull_h<>nil then begin
if howlong(bond_mull_h)>=0 then  if bond_mull_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if bond_mull_spin_h<>nil then begin
if howlong(bond_mull_spin_h)>=0 then  if bond_mull_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(bond_mull[strtoint(Combobox1.Text)-1])-1 do begin
if bond_mull[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(bond_mull[strtoint(Combobox1.Text)-1,i]);
if howlong(bond_mull_spin)>=0 then  if bond_mull_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(bond_mull_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if bond_mull_h<>nil then begin
if howlong(bond_mull_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if bond_mull_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(bond_mull_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if bond_mull_spin_h<>nil then begin
if howlong(bond_mull_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if bond_mull_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(bond_mull_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='ESP' then begin
if howlong(esp_spin)>=0 then  if esp_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if esp_h<>nil then begin
if howlong(esp_h)>=0 then  if esp_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if esp_spin_h<>nil then begin
if howlong(esp_spin_h)>=0 then  if esp_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(esp[strtoint(Combobox1.Text)-1])-1 do begin
if esp[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(esp[strtoint(Combobox1.Text)-1,i]);
if howlong(esp_spin)>=0 then  if esp_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(esp_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if esp_h<>nil then begin
if howlong(esp_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if esp_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(esp_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if esp_spin_h<>nil then begin
if howlong(esp_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if esp_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(esp_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='Hirshfeld' then begin
if howlong(hir_spin)>=0 then  if hir_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if hir_h<>nil then begin
if howlong(hir_h)>=0 then  if hir_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(hir[strtoint(Combobox1.Text)-1])-1 do begin
if hir[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(hir[strtoint(Combobox1.Text)-1,i]);
if howlong(hir_spin)>=0 then  if hir_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(hir_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if hir_h<>nil then begin
if howlong(hir_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if hir_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(hir_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;



if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


Ad:=false;

if Form64.Combobox2.Text='CM5' then begin
if cm5_h<>nil then begin
if howlong(cm5_h)>=0 then  if cm5_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(cm5[strtoint(Combobox1.Text)-1])-1 do begin
if cm5[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(cm5[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if cm5_h<>nil then begin
if howlong(cm5_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if cm5_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(cm5_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='NBO' then begin

if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(nbo[strtoint(Combobox1.Text)-1])-1 do begin
if nbo[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(nbo[strtoint(Combobox1.Text)-1,i]);
end;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='AIM' then begin

if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(aim[strtoint(Combobox1.Text)-1])-1 do begin
if aim[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(aim[strtoint(Combobox1.Text)-1,i]);
end;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Ad:=false;

if Form64.Combobox2.Text='Lowdin' then begin
if howlong(lo_spin)>=0 then  if lo_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if lo_h<>nil then begin
if howlong(lo_h)>=0 then  if lo_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if lo_spin_h<>nil then begin
if howlong(lo_spin_h)>=0 then  if lo_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(lo[strtoint(Combobox1.Text)-1])-1 do begin
if lo[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(lo[strtoint(Combobox1.Text)-1,i]);
if howlong(lo_spin)>=0 then  if lo_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(lo_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if lo_h<>nil then begin
if howlong(lo_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if lo_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(lo_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if lo_spin_h<>nil then begin
if howlong(lo_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if lo_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(lo_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


Ad:=false;

if Form64.Combobox2.Text='APT' then begin
if howlong(apt_spin)>=0 then  if apt_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if apt_h<>nil then begin
if howlong(apt_h)>=0 then  if apt_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if apt_spin_h<>nil then begin
if howlong(apt_spin_h)>=0 then  if apt_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(apt[strtoint(Combobox1.Text)-1])-1 do begin
if apt[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(apt[strtoint(Combobox1.Text)-1,i]);
if howlong(apt_spin)>=0 then  if apt_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(apt_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if apt_h<>nil then begin
if howlong(apt_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if apt_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(apt_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if apt_spin_h<>nil then begin
if howlong(apt_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if apt_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(apt_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


end
else begin

if Form64.Combobox2.Text='Mulliken'  then begin
if mull_mult<>nil then begin
if mull_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='MBS Mulliken'  then begin
if mbs_mull_mult<>nil then begin
if mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]] <>nil then begin
for i:=0 to length(mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if mbs_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='Bonding Mulliken'  then begin
if bond_mull_mult<>nil then begin
if bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(bond_mull_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if bond_mull_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='ESP'  then begin
if esp_mult<>nil then begin
if esp_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(esp_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if esp_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='Hirshfeld'  then begin
if hir_mult<>nil then begin
if hir_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(hir_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if hir_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='CM5'  then begin
if cm5_mult<>nil then begin
if cm5_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(cm5_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if cm5_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='NBO'  then begin
if nbo_mult<>nil then begin
if nbo_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(nbo_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if nbo_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='AIM'  then begin
if aim_mult<>nil then begin
if aim_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(aim_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if aim_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='Lowdin'  then begin
if lo_mult<>nil then begin
if lo_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(lo_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if lo_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
if Form64.Combobox2.Text='APT'  then begin
if apt_mult<>nil then begin
if apt_mult[basket[Form64.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to length(apt_mult[basket[Form64.ComboBox1.ItemIndex]])-1 do
if apt_mult[basket[Form64.ComboBox1.ItemIndex],i,0]<>'' then Combobox1.Items.Add(inttostr(i+1));
end;
end;
end;
Combobox1.ItemIndex:=0;
if Combobox1.Items.Count<2 then BitBtn1.Enabled:=False
else BitBtn1.Enabled:=True;

ListView1.Clear;


while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

ListView1.Columns.Add;
ListView1.Columns.Add;
ListView1.Columns.Add;
ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=60;
ListView1.Columns.Items[2].Width:=100;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Атом';
ListView1.Columns.Items[2].Caption:='Заряд, а.е.';
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@



// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@
// Заполняем ListView                                                        @@@@@           @@@@@@@      @@@@@      @@@@@@@@@
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@

if Form64.Combobox2.Text='Mulliken' then begin
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if mull_spin_h_mult<>nil then begin
if howlong(mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Ad:=false;

if Form64.Combobox2.Text='MBS Mulliken' then begin
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='Bonding Mulliken' then begin
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(bond_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if bond_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(bond_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='ESP' then begin
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if esp_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(esp_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(esp_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if esp_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(esp_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(esp_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if esp_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(esp_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if esp_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(esp_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='Hirshfeld' then begin
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if hir_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(hir_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(hir_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if hir_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(hir_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if hir_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(hir_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if hir_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(hir_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;



if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


Ad:=false;

if Form64.Combobox2.Text='CM5' then begin
if cm5_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(cm5_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if cm5_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(cm5_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if cm5_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(cm5_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if cm5_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(cm5_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if cm5_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(cm5_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='NBO' then begin

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(nbo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if nbo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(nbo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='AIM' then begin

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(aim_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if aim_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(aim_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Ad:=false;

if Form64.Combobox2.Text='Lowdin' then begin
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if lo_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(lo_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(lo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if lo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(lo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(lo_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if lo_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(lo_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if lo_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(lo_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


Ad:=false;

if Form64.Combobox2.Text='APT' then begin
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if apt_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(apt_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(apt_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if apt_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(apt_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(apt_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if apt_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(apt_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if apt_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(apt_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$




































end;




























end;

procedure TForm65.ComboBox1Change(Sender: TObject);
var i,j: integer;
itm: TListItem;
Ad: boolean;
label 0;
begin
if Combobox1.Items.Count<2 then goto 0;

ListView1.Clear;

if dial=true then begin
while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

ListView1.Columns.Add;
ListView1.Columns.Add;
ListView1.Columns.Add;
ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=60;
ListView1.Columns.Items[2].Width:=100;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Атом';
ListView1.Columns.Items[2].Caption:='Заряд, а.е.';
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@
// Заполняем ListView                                                        @@@@@           @@@@@@@      @@@@@      @@@@@@@@@
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@

if Form64.Combobox2.Text='Mulliken' then begin
if howlong(mull_spin)>=0 then  if mull_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if mull_h<>nil then begin
if howlong(mull_h)>=0 then  if mull_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if mull_spin_h<>nil then begin
if howlong(mull_spin_h)>=0 then  if mull_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(mull[strtoint(Combobox1.Text)-1])-1 do begin
if mull[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(mull[strtoint(Combobox1.Text)-1,i]);
if howlong(mull_spin)>=0 then  if mull_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(mull_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if mull_h<>nil then begin
if howlong(mull_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if mull_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(mull_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if mull_spin_h<>nil then begin
if howlong(mull_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if mull_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(mull_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Ad:=false;

if Form64.Combobox2.Text='MBS Mulliken' then begin
if howlong(mbs_mull_spin)>=0 then  if mbs_mull_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if mbs_mull_h<>nil then begin
if howlong(mbs_mull_h)>=0 then  if mbs_mull_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if mbs_mull_spin_h<>nil then begin
if howlong(mbs_mull_spin_h)>=0 then  if mbs_mull_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(mbs_mull[strtoint(Combobox1.Text)-1])-1 do begin
if mbs_mull[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(mbs_mull[strtoint(Combobox1.Text)-1,i]);
if howlong(mbs_mull_spin)>=0 then  if mbs_mull_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(mbs_mull_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if mbs_mull_h<>nil then begin
if howlong(mbs_mull_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if mbs_mull_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(mbs_mull_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if mbs_mull_spin_h<>nil then begin
if howlong(mbs_mull_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if mbs_mull_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(mbs_mull_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='Bonding Mulliken' then begin
if howlong(bond_mull_spin)>=0 then  if bond_mull_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if bond_mull_h<>nil then begin
if howlong(bond_mull_h)>=0 then  if bond_mull_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if bond_mull_spin_h<>nil then begin
if howlong(bond_mull_spin_h)>=0 then  if bond_mull_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(bond_mull[strtoint(Combobox1.Text)-1])-1 do begin
if bond_mull[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(bond_mull[strtoint(Combobox1.Text)-1,i]);
if howlong(bond_mull_spin)>=0 then  if bond_mull_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(bond_mull_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if bond_mull_h<>nil then begin
if howlong(bond_mull_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if bond_mull_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(bond_mull_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if bond_mull_spin_h<>nil then begin
if howlong(bond_mull_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if bond_mull_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(bond_mull_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='ESP' then begin
if howlong(esp_spin)>=0 then  if esp_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if esp_h<>nil then begin
if howlong(esp_h)>=0 then  if esp_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if esp_spin_h<>nil then begin
if howlong(esp_spin_h)>=0 then  if esp_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(esp[strtoint(Combobox1.Text)-1])-1 do begin
if esp[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(esp[strtoint(Combobox1.Text)-1,i]);
if howlong(esp_spin)>=0 then  if esp_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(esp_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if esp_h<>nil then begin
if howlong(esp_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if esp_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(esp_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if esp_spin_h<>nil then begin
if howlong(esp_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if esp_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(esp_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='Hirshfeld' then begin
if howlong(hir_spin)>=0 then  if hir_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if hir_h<>nil then begin
if howlong(hir_h)>=0 then  if hir_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(hir[strtoint(Combobox1.Text)-1])-1 do begin
if hir[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(hir[strtoint(Combobox1.Text)-1,i]);
if howlong(hir_spin)>=0 then  if hir_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(hir_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if hir_h<>nil then begin
if howlong(hir_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if hir_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(hir_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;



if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


Ad:=false;

if Form64.Combobox2.Text='CM5' then begin
if cm5_h<>nil then begin
if howlong(cm5_h)>=0 then  if cm5_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(cm5[strtoint(Combobox1.Text)-1])-1 do begin
if cm5[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(cm5[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if cm5_h<>nil then begin
if howlong(cm5_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if cm5_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(cm5_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='NBO' then begin

if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(nbo[strtoint(Combobox1.Text)-1])-1 do begin
if nbo[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(nbo[strtoint(Combobox1.Text)-1,i]);
end;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='AIM' then begin

if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(aim[strtoint(Combobox1.Text)-1])-1 do begin
if aim[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(aim[strtoint(Combobox1.Text)-1,i]);
end;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Ad:=false;

if Form64.Combobox2.Text='Lowdin' then begin
if howlong(lo_spin)>=0 then  if lo_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if lo_h<>nil then begin
if howlong(lo_h)>=0 then  if lo_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if lo_spin_h<>nil then begin
if howlong(lo_spin_h)>=0 then  if lo_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(lo[strtoint(Combobox1.Text)-1])-1 do begin
if lo[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(lo[strtoint(Combobox1.Text)-1,i]);
if howlong(lo_spin)>=0 then  if lo_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(lo_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if lo_h<>nil then begin
if howlong(lo_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if lo_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(lo_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if lo_spin_h<>nil then begin
if howlong(lo_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if lo_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(lo_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


Ad:=false;

if Form64.Combobox2.Text='APT' then begin
if howlong(apt_spin)>=0 then  if apt_spin[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if apt_h<>nil then begin
if howlong(apt_h)>=0 then  if apt_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if apt_spin_h<>nil then begin
if howlong(apt_spin_h)>=0 then  if apt_spin_h[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten<>nil then begin
if howlong(poten)>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(apt[strtoint(Combobox1.Text)-1])-1 do begin
if apt[strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel[1,i+1]);
itm.SubItems.Append(apt[strtoint(Combobox1.Text)-1,i]);
if howlong(apt_spin)>=0 then  if apt_spin[strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(apt_spin[strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if apt_h<>nil then begin
if howlong(apt_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if apt_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(apt_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if apt_spin_h<>nil then begin
if howlong(apt_spin_h)>=0 then  begin
for j:=0 to howlong_el(n_he) do
if apt_spin_h[strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he[strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(apt_spin_h[strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten<>nil then begin
if howlong(poten)>=0 then if poten[strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten[strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


end
else begin



while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

ListView1.Columns.Add;
ListView1.Columns.Add;
ListView1.Columns.Add;
ListView1.Columns.Items[0].Width:=50;
ListView1.Columns.Items[1].Width:=60;
ListView1.Columns.Items[2].Width:=100;
ListView1.Columns.Items[0].Alignment:=taCenter;
ListView1.Columns.Items[1].Alignment:=taCenter;
ListView1.Columns.Items[2].Alignment:=taCenter;
ListView1.Columns.Items[0].Caption:='№';
ListView1.Columns.Items[1].Caption:='Атом';
ListView1.Columns.Items[2].Caption:='Заряд, а.е.';
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@



// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@
// Заполняем ListView                                                        @@@@@           @@@@@@@      @@@@@      @@@@@@@@@
// //////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@        @@@@@@     @@@@@

if Form64.Combobox2.Text='Mulliken' then begin
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if mull_spin_h_mult<>nil then begin
if howlong(mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Ad:=false;

if Form64.Combobox2.Text='MBS Mulliken' then begin
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(mbs_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(mbs_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(mbs_mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(mbs_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='Bonding Mulliken' then begin
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten[0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(bond_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if bond_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(bond_mull_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(bond_mull_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(bond_mull_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(bond_mull_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='ESP' then begin
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if esp_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(esp_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(esp_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if esp_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(esp_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(esp_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if esp_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(esp_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if esp_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(esp_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if esp_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(esp_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(esp_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='Hirshfeld' then begin
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if hir_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(hir_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(hir_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if hir_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(hir_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(hir_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if hir_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(hir_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if hir_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(hir_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if hir_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(hir_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;



if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


Ad:=false;

if Form64.Combobox2.Text='CM5' then begin
if cm5_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(cm5_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if cm5_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(cm5_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if cm5_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(cm5_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if cm5_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(cm5_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if cm5_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(cm5_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='NBO' then begin

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(nbo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if nbo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(nbo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Ad:=false;

if Form64.Combobox2.Text='AIM' then begin

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(aim_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if aim_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(aim_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
Ad:=false;

if Form64.Combobox2.Text='Lowdin' then begin
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if lo_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(lo_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(lo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if lo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(lo_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(lo_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if lo_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(lo_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if lo_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(lo_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if lo_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(lo_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(lo_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


Ad:=false;

if Form64.Combobox2.Text='APT' then begin
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин, а.е.';
end;
if apt_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(apt_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Заряд*, а.е.';
end;
end;
if apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=100;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Спин*, а.е.';
end;
end;
if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if poten_mult[basket[Form64.Combobox1.ItemIndex],0,0]<>'' then begin
ListView1.Columns.Add;
ListView1.Columns.Items[ListView1.Columns.Count-1].Width:=115;
ListView1.Columns.Items[ListView1.Columns.Count-1].Alignment:=taCenter;
ListView1.Columns.Items[ListView1.Columns.Count-1].Caption:='Потенциал, а.е.';
end;
end;

for i:=0 to length(apt_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1])-1 do begin
if apt_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:=inttostr(i+1);
itm.SubItems.Append(atomoutel_mult[basket[Form64.Combobox1.ItemIndex],1,i+1]);
itm.SubItems.Append(apt_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
if howlong(apt_spin_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  if apt_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then itm.SubItems.Append(apt_spin_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

Ad:=false;
if apt_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(apt_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if apt_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then  begin
itm.SubItems.Append(apt_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;


if apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then  begin
for j:=0 to howlong_el(n_he_mult[basket[Form64.Combobox1.ItemIndex]]) do
if apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>'' then begin
if n_he_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]=inttostr(i+1) then begin
itm.SubItems.Append(apt_spin_h_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,j]);
Ad:=true;
Break;
end;
end;
if Ad=false then itm.SubItems.Append('');
end;
end;
Ad:=false;

if poten_mult[basket[Form64.Combobox1.ItemIndex]]<>nil then begin
if howlong(poten_mult[basket[Form64.Combobox1.ItemIndex]])>=0 then if poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,0]<>''  then  itm.SubItems.Append(poten_mult[basket[Form64.Combobox1.ItemIndex],strtoint(Combobox1.Text)-1,i]);
end;

end;
end;

//////////////////////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


end;

0:
end;

procedure TForm65.BitBtn1Click(Sender: TObject);
begin
Form66.Show;
end;

end.
