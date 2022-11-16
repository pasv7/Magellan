unit Unit54;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TForm54 = class(TForm)
    ListView1: TListView;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form54: TForm54;

implementation

uses Unit52,Unit1,Unit24, Unit53, Unit55;

{$R *.dfm}

procedure TForm54.FormShow(Sender: TObject);
var i: integer;
method: string;
itm: TListItem;
begin
ComboBox1.Clear;
ListView1.Clear;
BitBtn1.Enabled:=False;

if dial=true then begin
for i:=0 to length(state)-1 do
Combobox1.Items.Add(inttostr(i+1)+' шаг');

Combobox1.ItemIndex:=i-1;

while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

for i:=0 to Form52.ListView1.Columns.Count-1 do  begin
ListView1.Columns.Add;
ListView1.Columns.Items[i].Caption:=Form52.ListView1.Columns.Items[i].Caption;
ListView1.Columns.Items[i].Width:=Form52.ListView1.Columns.Items[i].Width;
ListView1.Columns.Items[i].Alignment:=taCenter;
end;


for i:=0 to length(src_route)-1 do begin
if (pos('EOMCCSD',UpperCase(src_route[i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route[i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route[i]))<>0) or (pos('CIS(D)',UpperCase(src_route[i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route[i]))<>0) or (pos('SACCI',UpperCase(src_route[i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route[i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route[i]))<>0) or (pos('CAS(',UpperCase(src_route[i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route[i]))<>0) or (pos('TD=(',UpperCase(src_route[i]))<>0) or (pos(' TD',UpperCase(src_route[i]))<>0) then method:='TD DFT / TD HF';
end;



// Заполняем ListView:
if method<>'SAC-CI' then begin

for i:=0 to length(nom_ex[length(nom_ex)-1])-1 do begin
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm:=ListView1.Items.Add;
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.Caption:=nom_ex[length(nom_ex)-1,i];
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(state[length(state)-1,i]);
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(energ[length(energ)-1,i]);
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(wave[length(wave)-1,i]);
if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(forc[length(forc)-1,i]);
if method<>'EOM-CCSD' then if  nom_ex[length(nom_ex)-1,i]<>'' then   itm.SubItems.Append(s2[length(s2)-1,i]);
end;
end
else begin
for i:=0 to length(etotsac[length(etotsac)-1])-1 do begin
if  etotsac[length(etotsac)-1,i]<>'' then   itm:=ListView1.Items.Add;
if  etotsac[length(etotsac)-1,i]<>'' then   itm.Caption:=inttostr(i+1);
if  etotsac[length(etotsac)-1,i]<>'' then   itm.SubItems.Append(state[length(state)-1,i]);
if  etotsac[length(etotsac)-1,i]<>'' then   itm.SubItems.Append(etotsac[length(etotsac)-1,i]);
if  etotsac[length(etotsac)-1,i]<>'' then   itm.SubItems.Append(energ[length(energ)-1,i]);
if forc<>nil then
if  (etotsac[length(etotsac)-1,i]<>'') and (forc[length(etotsac)-1,i]<>'') then   itm.SubItems.Append(energex[length(energex)-1,i]);
if  etotsac[length(etotsac)-1,i]<>'' then   itm.SubItems.Append(wave[length(wave)-1,i]);
if forc<>nil then
if  (etotsac[length(etotsac)-1,i]<>'') and (forc[length(etotsac)-1,i]<>'') then   itm.SubItems.Append(forc[length(forc)-1,i]);
if (ip1<>nil) and (inten1<>nil) and (ip2<>nil) and (inten2<>nil) then begin
if ListView1.Columns.Count>7  then   if  etotsac[length(etotsac)-1,i]<>'' then  if inten1[length(inten1)-1,i]<>'' then itm.SubItems.Append(inten1[length(inten1)-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac[length(etotsac)-1,i]<>'' then  if ip1[length(ip1)-1,i]<>''       then itm.SubItems.Append(ip1[length(ip1)-1,i])       else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>9  then   if  etotsac[length(etotsac)-1,i]<>'' then  if inten2[length(inten2)-1,i]<>'' then itm.SubItems.Append(inten2[length(inten2)-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>10 then   if  etotsac[length(etotsac)-1,i]<>'' then  if ip2[length(ip2)-1,i]<>''       then itm.SubItems.Append(ip2[length(ip2)-1,i])       else  itm.SubItems.Append('@@@');
end;
if (ip1=nil) and (inten1=nil) and (ip2<>nil) and (inten2<>nil) then begin
if ListView1.Columns.Count>7  then   if  etotsac[length(etotsac)-1,i]<>'' then  if inten2[length(inten2)-1,i]<>'' then itm.SubItems.Append(inten2[length(inten2)-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac[length(etotsac)-1,i]<>'' then  if ip2[length(ip2)-1,i]<>''       then itm.SubItems.Append(ip2[length(ip2)-1,i])       else  itm.SubItems.Append('@@@');
end;

end;
end;



end
else begin
for i:=0 to length(state_mult[basket[Form52.ComboBox1.ItemIndex]])-1 do
if state_mult[basket[Form52.ComboBox1.ItemIndex],i,0]<>'' then  Combobox1.Items.Add(inttostr(i+1)+' шаг');


Combobox1.ItemIndex:=real_num_cy-1;

while ListView1.Columns.Count>0 do
ListView1.Columns.Delete(ListView1.Columns.Count-1);

for i:=0 to Form52.ListView1.Columns.Count-1 do  begin
ListView1.Columns.Add;
ListView1.Columns.Items[i].Caption:=Form52.ListView1.Columns.Items[i].Caption;
ListView1.Columns.Items[i].Width:=Form52.ListView1.Columns.Items[i].Width;
ListView1.Columns.Items[i].Alignment:=taCenter;
end;



for i:=0 to length(src_route_mult[basket[Form52.Combobox1.ItemIndex]])-1 do begin
if (pos('EOMCCSD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('CIS(D)',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('SACCI',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('CAS(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('TD=(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos(' TD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='TD DFT / TD HF';
end;


// Заполняем ListView:
if method<>'SAC-CI' then begin
for i:=0 to length(nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1])-1 do begin
  if i>=Form52.ListView1.Items.Count then Break;
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm:=ListView1.Items.Add;
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.Caption:=nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i];
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(state_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(energ_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(wave_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(forc_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if method<>'EOM-CCSD' then if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(s2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
end;
end
else begin
for i:=0 to length(etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1])-1 do begin
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm:=ListView1.Items.Add;
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.Caption:=inttostr(i+1);
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(state_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(energ_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if  (etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'') and (forc_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'') then   itm.SubItems.Append(energex_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then   itm.SubItems.Append(wave_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if  (etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'') and (forc_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'') then   itm.SubItems.Append(forc_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]);
if (ip1_mult<>nil) and (inten1_mult<>nil) and (ip2_mult<>nil) and (inten2_mult<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (inten1_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (inten2_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (inten1_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (inten2_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'') and (ip2_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten1_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten2_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'')  then begin
if ListView1.Columns.Count>7  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if inten1_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten1_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if ip1_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip1_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>9  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if inten2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>10 then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if ip2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
end;
end;
end;
end;
if (ip1_mult<>nil) and (inten1_mult<>nil) and (ip2_mult<>nil) and (inten2_mult<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (inten1_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (inten2_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (inten1_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (inten2_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]='') and (ip2_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten1_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]='') and (inten2_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'')  then begin
if ListView1.Columns.Count>7  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if inten2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then itm.SubItems.Append(inten2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>'' then  if ip2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]<>''       then itm.SubItems.Append(ip2_mult[basket[Form52.Combobox1.ItemIndex],real_num_cy-1,i]) else  itm.SubItems.Append('@@@');
end;
end;
end;
end;


end;
end;


end;

if Combobox1.Items.Count>1 then BitBtn1.Enabled:=True;

end;

procedure TForm54.ComboBox1Change(Sender: TObject);
var method: string;
i: integer;
itm: TListItem;
label 0;
begin
if Combobox1.Items.Count<2 then goto 0;
ListView1.Clear;
if dial=true then begin

for i:=0 to length(src_route)-1 do begin
if (pos('EOMCCSD',UpperCase(src_route[i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route[i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route[i]))<>0) or (pos('CIS(D)',UpperCase(src_route[i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route[i]))<>0) or (pos('SACCI',UpperCase(src_route[i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route[i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route[i]))<>0) or (pos('CAS(',UpperCase(src_route[i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route[i]))<>0) or (pos('TD=(',UpperCase(src_route[i]))<>0) or (pos(' TD',UpperCase(src_route[i]))<>0) then method:='TD DFT / TD HF';
end;

 // Заполняем ListView:
if method<>'SAC-CI' then begin

for i:=0 to length(nom_ex[Combobox1.ItemIndex])-1 do begin
if  nom_ex[Combobox1.ItemIndex,i]<>'' then   itm:=ListView1.Items.Add;
if  nom_ex[Combobox1.ItemIndex,i]<>'' then   itm.Caption:=nom_ex[Combobox1.ItemIndex,i];
if  nom_ex[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(state[Combobox1.ItemIndex,i]);
if  nom_ex[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(energ[Combobox1.ItemIndex,i]);
if  nom_ex[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(wave[Combobox1.ItemIndex,i]);
if  nom_ex[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(forc[Combobox1.ItemIndex,i]);
if method<>'EOM-CCSD' then if  nom_ex[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(s2[Combobox1.ItemIndex,i]);
end;
end
else begin
for i:=0 to length(etotsac[Combobox1.ItemIndex])-1 do begin
if  etotsac[Combobox1.ItemIndex,i]<>'' then   itm:=ListView1.Items.Add;
if  etotsac[Combobox1.ItemIndex,i]<>'' then   itm.Caption:=inttostr(i+1);
if  etotsac[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(state[Combobox1.ItemIndex,i]);
if  etotsac[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(etotsac[Combobox1.ItemIndex,i]);
if  etotsac[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(energ[Combobox1.ItemIndex,i]);
if forc<>nil then
if  (etotsac[Combobox1.ItemIndex,i]<>'') and (forc[Combobox1.ItemIndex,i]<>'') then   itm.SubItems.Append(energex[Combobox1.ItemIndex,i]);
if  etotsac[Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(wave[Combobox1.ItemIndex,i]);
if forc<>nil then
if  (etotsac[Combobox1.ItemIndex,i]<>'') and (forc[Combobox1.ItemIndex,i]<>'') then   itm.SubItems.Append(forc[Combobox1.ItemIndex,i]);
if (ip1<>nil) and (inten1<>nil) and (ip2<>nil) and (inten2<>nil) then begin
if ListView1.Columns.Count>7  then   if  etotsac[Combobox1.ItemIndex,i]<>'' then  if inten1[Combobox1.ItemIndex,i]<>'' then itm.SubItems.Append(inten1[Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac[Combobox1.ItemIndex,i]<>'' then  if ip1[Combobox1.ItemIndex,i]<>''       then itm.SubItems.Append(ip1[Combobox1.ItemIndex,i])       else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>9  then   if  etotsac[Combobox1.ItemIndex,i]<>'' then  if inten2[Combobox1.ItemIndex,i]<>'' then itm.SubItems.Append(inten2[Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>10 then   if  etotsac[Combobox1.ItemIndex,i]<>'' then  if ip2[Combobox1.ItemIndex,i]<>''       then itm.SubItems.Append(ip2[Combobox1.ItemIndex,i])       else  itm.SubItems.Append('@@@');
end;
if (ip1=nil) and (inten1=nil) and (ip2<>nil) and (inten2<>nil) then begin
if ListView1.Columns.Count>7  then   if  etotsac[Combobox1.ItemIndex,i]<>'' then  if inten2[Combobox1.ItemIndex,i]<>'' then itm.SubItems.Append(inten2[Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac[Combobox1.ItemIndex,i]<>'' then  if ip2[Combobox1.ItemIndex,i]<>''       then itm.SubItems.Append(ip2[Combobox1.ItemIndex,i])       else  itm.SubItems.Append('@@@');
end;

end;
end;

end
else begin

for i:=0 to length(src_route_mult[basket[Form52.Combobox1.ItemIndex]])-1 do begin
if (pos('EOMCCSD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('EOM-CCSD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='EOM-CCSD';
if (pos('CIS',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('CIS(D)',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='CI-Single';
if (pos('SAC-CI',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('SACCI',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='SAC-CI';
if  pos('ZINDO',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0 then method:='ZINDO';
if (pos('CASSCF(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('CAS(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='CAS SCF';
if (pos('TD(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos('TD=(',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) or (pos(' TD',UpperCase(src_route_mult[basket[Form52.Combobox1.ItemIndex],i]))<>0) then method:='TD DFT / TD HF';
end;


// Заполняем ListView:
if method<>'SAC-CI' then begin
for i:=0 to length(nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex])-1 do begin
  if method<>'EOM-CCSD' then if i>=Form52.ListView1.Items.Count then Break;
  if method='EOM-CCSD' then if nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]='' then Break;
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm:=ListView1.Items.Add;
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.Caption:=nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i];
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(state_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(energ_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(wave_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(forc_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if method<>'EOM-CCSD' then if  nom_ex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(s2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
end;
end
else begin
for i:=0 to length(etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex])-1 do begin
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm:=ListView1.Items.Add;
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.Caption:=inttostr(i+1);
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(state_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(energ_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if  (etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'') and (forc_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'') then   itm.SubItems.Append(energex_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then   itm.SubItems.Append(wave_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if  (etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'') and (forc_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'') then   itm.SubItems.Append(forc_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]);
if (ip1_mult<>nil) and (inten1_mult<>nil) and (ip2_mult<>nil) and (inten2_mult<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (inten1_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (inten2_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (inten1_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (inten2_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'') and (ip2_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten1_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten2_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'')  then begin
if ListView1.Columns.Count>7  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then  if inten1_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then itm.SubItems.Append(inten1_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then  if ip1_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>''       then itm.SubItems.Append(ip1_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>9  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then  if inten2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then itm.SubItems.Append(inten2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>10 then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then  if ip2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>''       then itm.SubItems.Append(ip2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
end;
end;
end;
end;
if (ip1_mult<>nil) and (inten1_mult<>nil) and (ip2_mult<>nil) and (inten2_mult<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (inten1_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (ip2_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) and (inten2_mult[basket[Form52.Combobox1.ItemIndex]]<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (inten1_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (ip2_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) and (inten2_mult[basket[Form52.Combobox1.ItemIndex],0]<>nil) then begin
if (ip1_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]='') and (ip2_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'') and (inten1_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]='') and (inten2_mult[basket[Form52.Combobox1.ItemIndex],0,ip_nomer]<>'')  then begin
if ListView1.Columns.Count>7  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then  if inten2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then itm.SubItems.Append(inten2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
if ListView1.Columns.Count>8  then   if  etotsac_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>'' then  if ip2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]<>''       then itm.SubItems.Append(ip2_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,i]) else  itm.SubItems.Append('@@@');
end;
end;
end;
end;


end;
end;












end;







0:
end;

procedure TForm54.ListView1DblClick(Sender: TObject);
var i: integer;
s: widestring;
begin
if ListView1<>nil then begin
if ListView1.Selected<>nil then begin
if ListView1.Items[ListView1.ItemIndex].Selected then begin
Form53.Memo1.Clear;
form53.Show;
if dial=true then begin
For i:=0 to transit[Combobox1.ItemIndex,ListView1.ItemIndex].Count-1 do
Form53.Memo1.Lines.Add(transit[Combobox1.ItemIndex,ListView1.ItemIndex][i]);
end
else begin
For i:=0 to transit_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,ListView1.ItemIndex].Count-1 do
Form53.Memo1.Lines.Add(transit_mult[basket[Form52.Combobox1.ItemIndex],Combobox1.ItemIndex,ListView1.ItemIndex][i]);
end;

end;
end;
end;
end;

procedure TForm54.BitBtn1Click(Sender: TObject);
begin
Form55.Show;
end;

end.
