unit Unit60;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Math;

type
  TForm60 = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Splitter2: TSplitter;
    Panel3: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    ListView1: TListView;
    ListView2: TListView;
    procedure FormShow(Sender: TObject);
    procedure Splitter2CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure Splitter1Moved(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form60: TForm60;

implementation

uses Unit1,Unit24,Unit58;

{$R *.dfm}

procedure TForm60.FormShow(Sender: TObject);
var i: integer;
itm: TListItem;
begin
Combobox1.Clear;
Combobox2.Clear;
ListView1.Clear;
ListView2.Clear;
if (dial=true) and (Form1.OpenDialog1.FilterIndex=2)  then begin
for i:=1 to nomer_atoma do
Combobox1.Items.Add(atomoutel[1,i]+'('+inttostr(i)+')');
for i:=1 to nomer_atoma do
Combobox2.Items.Add(atomoutel[1,i]+'('+inttostr(i)+')');
Combobox1.ItemIndex:=0;
Combobox2.ItemIndex:=0;
if sus_giao<>nil then begin
itm:=ListView2.Items.Add;
itm.Caption:='Тензор диамагнитной воспримчивости, а.е.';
itm.SubItems.Append(sus_giao[0]);
itm:=ListView2.Items.Add;
itm.Caption:='Тензор парамагнитной воспримчивости, а.е.';
itm.SubItems.Append(sus_giao[1]);
itm:=ListView2.Items.Add;
itm.Caption:='Тензор магнитной воспримчивости, а.е.';
itm.SubItems.Append(sus_giao[2]);
itm:=ListView2.Items.Add;
itm.Caption:='Тензор магнитной воспримчивости, 10**(-30)J/T**2';
itm.SubItems.Append(sus_giao[3]);
itm:=ListView2.Items.Add;
itm.Caption:='Тензор магнитной воспримчивости, cgs-ppm';
itm.SubItems.Append(sus_giao[4]);
end;
if (spsp_FC_K<>nil) and (spsp_FC_J<>nil) then begin
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в К, Гц';
itm.SubItems.Append(spsp_FC_K[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в J, Гц';
itm.SubItems.Append(spsp_FC_J[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в К, Гц';
itm.SubItems.Append(spsp_SD_K[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в J, Гц';
itm.SubItems.Append(spsp_SD_J[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_PSO_K[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_PSO_J[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_DSO_K[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_DSO_J[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (К), Гц';
itm.SubItems.Append(spsp_Tot_K[0]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (J), Гц';
itm.SubItems.Append(spsp_Tot_J[0]);
end;
end;
if (dial=false)  and (basket<>nil) then begin
for i:=1 to nomer_atoma_mult[basket[Form58.ComboBox1.ItemIndex]] do
Combobox1.Items.Add(atomoutel_mult[basket[Form58.ComboBox1.ItemIndex],1,i]+'('+inttostr(i)+')');
for i:=1 to nomer_atoma_mult[basket[Form58.ComboBox1.ItemIndex]] do
Combobox2.Items.Add(atomoutel_mult[basket[Form58.ComboBox1.ItemIndex],1,i]+'('+inttostr(i)+')');
Combobox1.ItemIndex:=0;
Combobox2.ItemIndex:=0;
if (sus_giao_mult<>nil) and (Form58.ComboBox2.Text='GIAO') then begin
if sus_giao_mult[basket[Form58.ComboBox1.ItemIndex]]<> nil then begin
if sus_giao_mult[basket[Form58.ComboBox1.ItemIndex],0]<>'' then begin
itm:=ListView2.Items.Add;
itm.Caption:='Тензор диамагнитной воспримчивости, а.е.';
itm.SubItems.Append(sus_giao_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView2.Items.Add;
itm.Caption:='Тензор парамагнитной воспримчивости, а.е.';
itm.SubItems.Append(sus_giao_mult[basket[Form58.ComboBox1.ItemIndex],1]);
itm:=ListView2.Items.Add;
itm.Caption:='Тензор магнитной воспримчивости, а.е.';
itm.SubItems.Append(sus_giao_mult[basket[Form58.ComboBox1.ItemIndex],2]);
itm:=ListView2.Items.Add;
itm.Caption:='Тензор магнитной воспримчивости, 10**(-30)J/T**2';
itm.SubItems.Append(sus_giao_mult[basket[Form58.ComboBox1.ItemIndex],3]);
itm:=ListView2.Items.Add;
itm.Caption:='Тензор магнитной воспримчивости, cgs-ppm';
itm.SubItems.Append(sus_giao_mult[basket[Form58.ComboBox1.ItemIndex],4]);
end;
end;
end;

if (spsp_FC_K_mult<>nil) and (spsp_FC_J_mult<>nil) then begin
if (spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex]]<>nil) and (spsp_FC_J_mult[basket[Form58.ComboBox1.ItemIndex]]<>nil) then begin
if  spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex],0]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в К, Гц';
itm.SubItems.Append(spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в J, Гц';
itm.SubItems.Append(spsp_FC_J_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в К, Гц';
itm.SubItems.Append(spsp_SD_K_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в J, Гц';
itm.SubItems.Append(spsp_SD_J_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_PSO_K_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_PSO_J_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_DSO_K_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_DSO_J_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (К), Гц';
itm.SubItems.Append(spsp_Tot_K_mult[basket[Form58.ComboBox1.ItemIndex],0]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (J), Гц';
itm.SubItems.Append(spsp_Tot_J_mult[basket[Form58.ComboBox1.ItemIndex],0]);
end;
end;
end;



end;

end;

procedure TForm60.Splitter2CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
Splitter2.Height:=3;
end;

procedure TForm60.Splitter1CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
Splitter1.Height:=3;
end;

procedure TForm60.Splitter1Moved(Sender: TObject);
begin
If Panel1.Height<=30 then Panel1.Height:=30;
If Panel2.Height<=30 then Panel2.Height:=30;
If Panel3.Height<=30 then Panel3.Height:=30;
end;

procedure TForm60.Splitter2Moved(Sender: TObject);
begin
If Panel1.Height<=30 then Panel1.Height:=30;
If Panel2.Height<=30 then Panel2.Height:=30;
If Panel3.Height<=30 then Panel3.Height:=30;
end;

procedure TForm60.ComboBox1Change(Sender: TObject);
var N,Ng,Nmin,M,i: integer;
arr: array[0..1] of integer;
itm: TListItem;
begin
//Номер элемента массива 1-1,2-1,2-2,3-1,3-2,3-3,4-1,...
// N=[(a1+an-1)/2]*(n-1) + bn, Где a1 - первый элемент (=1), an - n-ый элемент, например для 4-2 an=4,
//                             n - номер n-ого элемента, bn - 2-ой элемент в связке (=2 для примера)



arr[0]:=StrToInt(Copy(Combobox1.Text,pos('(',Combobox1.Text)+1,Pos(')',Combobox1.Text)-Pos('(',Combobox1.Text)-1));
arr[1]:=StrToInt(Copy(Combobox2.Text,pos('(',Combobox2.Text)+1,Pos(')',Combobox2.Text)-Pos('(',Combobox2.Text)-1));

if Trunc(MinIntValue(arr)/5)<>MinIntValue(arr)/5 then Ng:=Trunc(MinIntValue(arr)/5)+1
else Ng:=Trunc(MinIntValue(arr)/5);

Nmin:=5*(Ng-1)+1;

M:=0;
for i:=1 to Ng-1 do begin
if dial=true  then M:=M + Round(((nomer_atoma-5*(i-1) + nomer_atoma-4-5*(i-1))/2)*5);
if dial=false then M:=M + Round(((nomer_atoma_mult[basket[Form58.ComboBox1.ItemIndex]]-5*(i-1) + nomer_atoma_mult[basket[Form58.ComboBox1.ItemIndex]]-4-5*(i-1))/2)*5);
end;

if MaxIntValue(arr)-Nmin=3 then N:=M+ 6+MinIntValue(arr)-Nmin+1;
if MaxIntValue(arr)-Nmin=2 then N:=M+ 3+MinIntValue(arr)-Nmin+1;
if MaxIntValue(arr)-Nmin=1 then N:=M+ 1+MinIntValue(arr)-Nmin+1;
if MaxIntValue(arr)-Nmin=0 then N:=M+ 1;
if MaxIntValue(arr)-Nmin>3 then N:=M+ (MaxIntValue(arr)-Nmin-3)*5+10-(5*Ng-MinIntValue(arr));

ListView1.Clear;


if dial=true then begin
if (spsp_FC_K<>nil) and (spsp_FC_J<>nil) then begin
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в К, Гц';
itm.SubItems.Append(spsp_FC_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в J, Гц';
itm.SubItems.Append(spsp_FC_J[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в К, Гц';
itm.SubItems.Append(spsp_SD_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в J, Гц';
itm.SubItems.Append(spsp_SD_J[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_PSO_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_PSO_J[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_DSO_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_DSO_J[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (К), Гц';
itm.SubItems.Append(spsp_Tot_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (J), Гц';
itm.SubItems.Append(spsp_Tot_J[N-1]);
end;
end;
if (dial=false) and (basket<>nil) then begin
if (spsp_FC_K_mult<>nil) and (spsp_FC_J_mult<>nil) then begin
if (spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex]]<>nil) and (spsp_FC_J_mult[basket[Form58.ComboBox1.ItemIndex]]<>nil) then begin
if  spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex],0]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в К, Гц';
itm.SubItems.Append(spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в J, Гц';
itm.SubItems.Append(spsp_FC_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в К, Гц';
itm.SubItems.Append(spsp_SD_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в J, Гц';
itm.SubItems.Append(spsp_SD_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_PSO_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_PSO_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_DSO_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_DSO_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (К), Гц';
itm.SubItems.Append(spsp_Tot_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (J), Гц';
itm.SubItems.Append(spsp_Tot_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
end;
end;
end;

end;





end;

procedure TForm60.ComboBox2Change(Sender: TObject);
var N,Ng,Nmin,M,i: integer;
arr: array[0..1] of integer;
itm: TListItem;
begin
//Номер элемента массива 1-1,2-1,2-2,3-1,3-2,3-3,4-1,...
// N=[(a1+an-1)/2]*(n-1) + bn, Где a1 - первый элемент (=1), an - n-ый элемент, например для 4-2 an=4,
//                             n - номер n-ого элемента, bn - 2-ой элемент в связке (=2 для примера)


arr[0]:=StrToInt(Copy(Combobox1.Text,pos('(',Combobox1.Text)+1,Pos(')',Combobox1.Text)-Pos('(',Combobox1.Text)-1));
arr[1]:=StrToInt(Copy(Combobox2.Text,pos('(',Combobox2.Text)+1,Pos(')',Combobox2.Text)-Pos('(',Combobox2.Text)-1));

if Trunc(MinIntValue(arr)/5)<>MinIntValue(arr)/5 then Ng:=Trunc(MinIntValue(arr)/5)+1
else Ng:=Trunc(MinIntValue(arr)/5);

Nmin:=5*(Ng-1)+1;

M:=0;
for i:=1 to Ng-1 do begin
if dial=true  then M:=M + Round(((nomer_atoma-5*(i-1) + nomer_atoma-4-5*(i-1))/2)*5);
if dial=false then M:=M + Round(((nomer_atoma_mult[basket[Form58.ComboBox1.ItemIndex]]-5*(i-1) + nomer_atoma_mult[basket[Form58.ComboBox1.ItemIndex]]-4-5*(i-1))/2)*5);
end;

if MaxIntValue(arr)-Nmin=3 then N:=M+ 6+MinIntValue(arr)-Nmin+1;
if MaxIntValue(arr)-Nmin=2 then N:=M+ 3+MinIntValue(arr)-Nmin+1;
if MaxIntValue(arr)-Nmin=1 then N:=M+ 1+MinIntValue(arr)-Nmin+1;
if MaxIntValue(arr)-Nmin=0 then N:=M+ 1;
if MaxIntValue(arr)-Nmin>3 then N:=M+ (MaxIntValue(arr)-Nmin-3)*5+10-(5*Ng-MinIntValue(arr));




//if StrToInt(Copy(Combobox1.Text,pos('(',Combobox1.Text)+1,Pos(')',Combobox1.Text)-Pos('(',Combobox1.Text)-1))<=StrToInt(Copy(Combobox2.Text,pos('(',Combobox2.Text)+1,Pos(')',Combobox2.Text)-Pos('(',Combobox2.Text)-1))  then
//N:=Round((StrToInt(Copy(Combobox2.Text,pos('(',Combobox2.Text)+1,Pos(')',Combobox2.Text)-Pos('(',Combobox2.Text)-1))/2)*(StrToInt(Copy(Combobox2.Text,pos('(',Combobox2.Text)+1,Pos(')',Combobox2.Text)-Pos('(',Combobox2.Text)-1))-1))+ StrToInt(Copy(Combobox1.Text,pos('(',Combobox1.Text)+1,Pos(')',Combobox1.Text)-Pos('(',Combobox1.Text)-1));

//if StrToInt(Copy(Combobox1.Text,pos('(',Combobox1.Text)+1,Pos(')',Combobox1.Text)-Pos('(',Combobox1.Text)-1))>StrToInt(Copy(Combobox2.Text,pos('(',Combobox2.Text)+1,Pos(')',Combobox2.Text)-Pos('(',Combobox2.Text)-1))  then
//N:=Round((StrToInt(Copy(Combobox1.Text,pos('(',Combobox1.Text)+1,Pos(')',Combobox1.Text)-Pos('(',Combobox1.Text)-1))/2)*(StrToInt(Copy(Combobox1.Text,pos('(',Combobox1.Text)+1,Pos(')',Combobox1.Text)-Pos('(',Combobox1.Text)-1))-1))+ StrToInt(Copy(Combobox2.Text,pos('(',Combobox2.Text)+1,Pos(')',Combobox2.Text)-Pos('(',Combobox2.Text)-1));


ListView1.Clear;


if dial=true then begin
if (spsp_FC_K<>nil) and (spsp_FC_J<>nil) then begin
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в К, Гц';
itm.SubItems.Append(spsp_FC_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в J, Гц';
itm.SubItems.Append(spsp_FC_J[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в К, Гц';
itm.SubItems.Append(spsp_SD_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в J, Гц';
itm.SubItems.Append(spsp_SD_J[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_PSO_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_PSO_J[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_DSO_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_DSO_J[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (К), Гц';
itm.SubItems.Append(spsp_Tot_K[N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (J), Гц';
itm.SubItems.Append(spsp_Tot_J[N-1]);
end;
end;
if (dial=false) and (basket<>nil) then begin
if (spsp_FC_K_mult<>nil) and (spsp_FC_J_mult<>nil) then begin
if (spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex]]<>nil) and (spsp_FC_J_mult[basket[Form58.ComboBox1.ItemIndex]]<>nil) then begin
if  spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex],0]<>'' then begin
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в К, Гц';
itm.SubItems.Append(spsp_FC_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Вклад контакта Ферми в J, Гц';
itm.SubItems.Append(spsp_FC_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в К, Гц';
itm.SubItems.Append(spsp_SD_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Спин-дипольный вклад в J, Гц';
itm.SubItems.Append(spsp_SD_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_PSO_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Парамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_PSO_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в К, Гц';
itm.SubItems.Append(spsp_DSO_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Диамагнитный спин-орбитальный вклад в J, Гц';
itm.SubItems.Append(spsp_DSO_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (К), Гц';
itm.SubItems.Append(spsp_Tot_K_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
itm:=ListView1.Items.Add;
itm.Caption:='Суммарное спин-спиновое взаимодействие (J), Гц';
itm.SubItems.Append(spsp_Tot_J_mult[basket[Form58.ComboBox1.ItemIndex],N-1]);
end;
end;
end;

end;
end;

end.
