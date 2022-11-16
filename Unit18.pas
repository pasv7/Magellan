unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Chart, Series, Math, ExtCtrls;

type
  TForm18 = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    ScrollBox1: TScrollBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;
  num_chart: word=0;
  TCh: array of TChart;

implementation

uses Unit1, Unit12, Unit24, Unit37, Unit44, Unit49;

{$R *.dfm}

function howlongr(var X: array of Real): integer;
var i: integer;
begin
for i:=1 to length(X)-1 do
if X[length(X)-1-i]<>0 then Break;
Result:=length(X)-i;
end;


procedure TForm18.ComboBox1Change(Sender: TObject);
begin
if Combobox1.ItemIndex=0 then begin
Combobox4.ItemIndex:=-1;
Combobox5.ItemIndex:=-1;
Combobox4.Enabled:=False;
Combobox5.Enabled:=False;
end;
Combobox5.ItemIndex:=-1;
if Combobox1.ItemIndex=1 then begin
Combobox4.Enabled:=True;
Combobox5.Enabled:=False;
end;
if Combobox1.ItemIndex=2 then begin
Combobox4.Enabled:=True;
Combobox5.Enabled:=True;
end;





///////КНОПКА ГРАФИК ДОЛЖНА АКТИВИРОВАТЬСЯ ПРИ ВЫБОРЕ АТОМНЫХ ЦЕНТРОВ///////
if  Combobox1.ItemIndex=0 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=1 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=2 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) and (Combobox5.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
/////////////////////////////////////////////////////////////////////////////


end;

procedure TForm18.FormShow(Sender: TObject);
var i: integer;
begin
Combobox2.Clear;
if dial=true     then begin
for i:=1 to nomer_atoma do
Combobox2.Items.Add(inttostr(i)+'('+atomoutel[1][i]+')') ;
end
else begin

if Rx_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form37.ComboBox1.ItemIndex]] do
Combobox2.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if energyscan_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form44.ComboBox1.ItemIndex]] do
Combobox2.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i]+')') ;
end;

if step_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form12.ComboBox1.ItemIndex]] do
Combobox2.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i]+')') ;
end;

if escfreal_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form49.ComboBox1.ItemIndex]] do
Combobox2.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i]+')') ;
end;


end;







Combobox3.Clear;
if dial=true  then begin
for i:=1 to nomer_atoma do
Combobox3.Items.Add(inttostr(i)+'('+atomoutel[1][i]+')') ;
end
else begin

 if Rx_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form37.ComboBox1.ItemIndex]] do
Combobox3.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if energyscan_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form44.ComboBox1.ItemIndex]] do
Combobox3.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if step_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form12.ComboBox1.ItemIndex]] do
Combobox3.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i]+')') ;
end;

if escfreal_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form49.ComboBox1.ItemIndex]] do
Combobox3.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i]+')') ;
end;

end;



Combobox4.Clear;
if dial=true  then begin
for i:=1 to nomer_atoma do
Combobox4.Items.Add(inttostr(i)+'('+atomoutel[1][i]+')') ;
end
else begin
 if Rx_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form37.ComboBox1.ItemIndex]] do
Combobox4.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if energyscan_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form44.ComboBox1.ItemIndex]] do
Combobox4.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if step_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form12.ComboBox1.ItemIndex]] do
Combobox4.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if escfreal_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form49.ComboBox1.ItemIndex]] do
Combobox4.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i]+')') ;
end;
end;



Combobox5.Clear;
if dial=true  then begin
for i:=1 to nomer_atoma do
Combobox5.Items.Add(inttostr(i)+'('+atomoutel[1][i]+')') ;
end
else begin
 if Rx_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form37.ComboBox1.ItemIndex]] do
Combobox5.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if energyscan_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form44.ComboBox1.ItemIndex]] do
Combobox5.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if step_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form12.ComboBox1.ItemIndex]] do
Combobox5.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i]+')') ;
end;
if escfreal_mult<>nil then begin
for i:=1 to nomer_atoma_mult[basket[Form49.ComboBox1.ItemIndex]] do
Combobox5.Items.Add(inttostr(i)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i]+')') ;
end;
end;



Combobox2.ItemIndex:=0;
Combobox3.ItemIndex:=1;


///////КНОПКА ГРАФИК ДОЛЖНА АКТИВИРОВАТЬСЯ ПРИ ВЫБОРЕ АТОМНЫХ ЦЕНТРОВ///////
if  Combobox1.ItemIndex=0 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=1 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=2 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) and (Combobox5.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
/////////////////////////////////////////////////////////////////////////////







end;

procedure TForm18.ComboBox2Change(Sender: TObject);
var i: integer;
Cb2,Cb3,Cb4,Cb5: string;
begin
Cb2:=Combobox2.Items[Combobox2.ItemIndex];
Cb3:=Combobox3.Items[Combobox3.ItemIndex];
Cb4:=Combobox4.Items[Combobox4.ItemIndex];
Cb5:=Combobox5.Items[Combobox5.ItemIndex];
Combobox3.Clear;
Combobox4.Clear;
Combobox5.Clear;

if dial=true then begin
for i:=0 to nomer_atoma-1 do begin
if (Combobox2.Items[Combobox2.ItemIndex]<>inttostr(i+1)+'('+atomoutel[1][i+1]+')') then begin
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
end;
end;
end
else begin

if step_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form12.ComboBox1.ItemIndex]]-1 do begin
if (Combobox2.Items[Combobox2.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if Rx_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form37.ComboBox1.ItemIndex]]-1 do begin
if (Combobox2.Items[Combobox2.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if energyscan_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form44.ComboBox1.ItemIndex]]-1 do begin
if (Combobox2.Items[Combobox2.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if escfreal_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form49.ComboBox1.ItemIndex]]-1 do begin
if (Combobox2.Items[Combobox2.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;


end;


{
Combobox2.Clear;
for i:=1 to nomer_atoma do
if  (i-1<>Combobox3.ItemIndex) and (i-1<>Combobox4.ItemIndex) and (i-1<>Combobox5.ItemIndex) then  Combobox2.Items.Add(inttostr(i)+'('+atomoutel[1][i]+')') ;
}


{
for i:=0 to Combobox2.Items.Count-1 do
if Combobox2.Items[i]=Cb2 then Combobox2.ItemIndex:=i;
}
for i:=0 to Combobox3.Items.Count-1 do
if Combobox3.Items[i]=Cb3 then Combobox3.ItemIndex:=i;
for i:=0 to Combobox4.Items.Count-1 do
if Combobox4.Items[i]=Cb4 then Combobox4.ItemIndex:=i;
for i:=0 to Combobox5.Items.Count-1 do
if Combobox5.Items[i]=Cb5 then Combobox5.ItemIndex:=i;

///////КНОПКА ГРАФИК ДОЛЖНА АКТИВИРОВАТЬСЯ ПРИ ВЫБОРЕ АТОМНЫХ ЦЕНТРОВ///////
if  Combobox1.ItemIndex=0 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=1 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=2 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) and (Combobox5.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
/////////////////////////////////////////////////////////////////////////////



end;






procedure TForm18.ComboBox3Change(Sender: TObject);
var i: integer;
Cb2,Cb3,Cb4,Cb5: string;
begin
Cb2:=Combobox2.Items[Combobox2.ItemIndex];
Cb3:=Combobox3.Items[Combobox3.ItemIndex];
Cb4:=Combobox4.Items[Combobox4.ItemIndex];
Cb5:=Combobox5.Items[Combobox5.ItemIndex];
Combobox2.Clear;
Combobox4.Clear;
Combobox5.Clear;

if dial=true then begin
for i:=0 to nomer_atoma-1 do begin
if (Combobox3.Items[Combobox3.ItemIndex]<>inttostr(i+1)+'('+atomoutel[1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
end;
end;
end
else begin


if step_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form12.ComboBox1.ItemIndex]]-1 do begin
if (Combobox3.Items[Combobox3.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;

if Rx_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form37.ComboBox1.ItemIndex]]-1 do begin
if (Combobox3.Items[Combobox3.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if energyscan_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form44.ComboBox1.ItemIndex]]-1 do begin
if (Combobox3.Items[Combobox3.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if escfreal_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form49.ComboBox1.ItemIndex]]-1 do begin
if (Combobox3.Items[Combobox3.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;



end;






for i:=0 to Combobox2.Items.Count-1 do
if Combobox2.Items[i]=Cb2 then Combobox2.ItemIndex:=i;

for i:=0 to Combobox4.Items.Count-1 do
if Combobox4.Items[i]=Cb4 then Combobox4.ItemIndex:=i;
for i:=0 to Combobox5.Items.Count-1 do
if Combobox5.Items[i]=Cb5 then Combobox5.ItemIndex:=i;


///////КНОПКА ГРАФИК ДОЛЖНА АКТИВИРОВАТЬСЯ ПРИ ВЫБОРЕ АТОМНЫХ ЦЕНТРОВ///////
if  Combobox1.ItemIndex=0 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=1 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=2 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) and (Combobox5.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
/////////////////////////////////////////////////////////////////////////////


end;







procedure TForm18.ComboBox4Change(Sender: TObject);
var i: integer;
Cb2,Cb3,Cb4,Cb5: string;
begin
Cb2:=Combobox2.Items[Combobox2.ItemIndex];
Cb3:=Combobox3.Items[Combobox3.ItemIndex];
Cb4:=Combobox4.Items[Combobox4.ItemIndex];
Cb5:=Combobox5.Items[Combobox5.ItemIndex];
Combobox2.Clear;
Combobox3.Clear;
Combobox5.Clear;


if dial=true then begin
for i:=0 to nomer_atoma-1 do begin
if (Combobox4.Items[Combobox4.ItemIndex]<>inttostr(i+1)+'('+atomoutel[1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
end;
end;
end
else begin

if step_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form12.ComboBox1.ItemIndex]]-1 do begin
if (Combobox4.Items[Combobox4.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;

if Rx_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form37.ComboBox1.ItemIndex]]-1 do begin
if (Combobox4.Items[Combobox4.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if energyscan_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form44.ComboBox1.ItemIndex]]-1 do begin
if (Combobox4.Items[Combobox4.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if escfreal_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form49.ComboBox1.ItemIndex]]-1 do begin
if (Combobox4.Items[Combobox4.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox5.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;


end;




for i:=0 to Combobox2.Items.Count-1 do
if Combobox2.Items[i]=Cb2 then Combobox2.ItemIndex:=i;
for i:=0 to Combobox3.Items.Count-1 do
if Combobox3.Items[i]=Cb3 then Combobox3.ItemIndex:=i;
for i:=0 to Combobox5.Items.Count-1 do
if Combobox5.Items[i]=Cb5 then Combobox5.ItemIndex:=i;


///////КНОПКА ГРАФИК ДОЛЖНА АКТИВИРОВАТЬСЯ ПРИ ВЫБОРЕ АТОМНЫХ ЦЕНТРОВ///////
if  Combobox1.ItemIndex=0 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=1 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=2 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) and (Combobox5.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
/////////////////////////////////////////////////////////////////////////////


end;






procedure TForm18.ComboBox5Change(Sender: TObject);
var i: integer;
Cb2,Cb3,Cb4,Cb5: string;
begin
Cb2:=Combobox2.Items[Combobox2.ItemIndex];
Cb3:=Combobox3.Items[Combobox3.ItemIndex];
Cb4:=Combobox4.Items[Combobox4.ItemIndex];
Cb5:=Combobox5.Items[Combobox5.ItemIndex];
Combobox2.Clear;
Combobox3.Clear;
Combobox4.Clear;

if dial=true then begin
for i:=0 to nomer_atoma-1 do begin
if (Combobox5.Items[Combobox5.ItemIndex]<>inttostr(i+1)+'('+atomoutel[1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel[1][i+1]+')');
end;
end;
end
else begin
  if step_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form12.ComboBox1.ItemIndex]]-1 do begin
if (Combobox5.Items[Combobox5.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form12.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;


if Rx_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form37.ComboBox1.ItemIndex]]-1 do begin
if (Combobox5.Items[Combobox5.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form37.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if energyscan_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form44.ComboBox1.ItemIndex]]-1 do begin
if (Combobox5.Items[Combobox5.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form44.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;
if escfreal_mult<>nil then begin
for i:=0 to nomer_atoma_mult[basket[Form49.ComboBox1.ItemIndex]]-1 do begin
if (Combobox5.Items[Combobox5.ItemIndex]<>inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')') then begin
Combobox2.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox3.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
Combobox4.Items.Add(inttostr(i+1)+'('+atomoutel_mult[basket[Form49.ComboBox1.ItemIndex]][1][i+1]+')');
end;
end;
end;

end;




for i:=0 to Combobox2.Items.Count-1 do
if Combobox2.Items[i]=Cb2 then Combobox2.ItemIndex:=i;
for i:=0 to Combobox3.Items.Count-1 do
if Combobox3.Items[i]=Cb3 then Combobox3.ItemIndex:=i;
for i:=0 to Combobox4.Items.Count-1 do
if Combobox4.Items[i]=Cb4 then Combobox4.ItemIndex:=i;


///////КНОПКА ГРАФИК ДОЛЖНА АКТИВИРОВАТЬСЯ ПРИ ВЫБОРЕ АТОМНЫХ ЦЕНТРОВ///////
if  Combobox1.ItemIndex=0 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=1 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
if  Combobox1.ItemIndex=2 then begin
if (Combobox2.ItemIndex>=0) and (Combobox3.ItemIndex>=0) and (Combobox4.ItemIndex>=0) and (Combobox5.ItemIndex>=0) then BitBtn1.Enabled:=True
else  BitBtn1.Enabled:=False;
end;
/////////////////////////////////////////////////////////////////////////////
end;







procedure TForm18.BitBtn1Click(Sender: TObject);
var
Series: TLineSeries;
i,posi_scroll,j,count_el,g: integer;     //count_el - число циклов, шагов в IRC
parameter,parameterx,parametery,parameterz, parH,parR,parameter2,parameter3,BD,parameter4,
parameter12,parameter13,parameter23,parameterx23,parameterx45,parametery23,parametery45,
parameterz23,parameterz45,parameter1,parameter5,parameter6,parameterx43,parametery43,parameterz43,DetX: real;
begin

posi_scroll:=Form18.ScrollBox1.VertScrollBar.Position;
Form18.ScrollBox1.VertScrollBar.Position:=0;
setlength(TCh,num_chart+1);
TCh[num_chart]:=TChart.Create(self);
with TCh[num_chart] do begin
Parent:=Form18.ScrollBox1;
Name:='TCh'+inttostr(num_chart);
Left:=0;
Top:=65*(6*num_chart+1)-55;
Width:=Form18.ClientWidth-10;
Height:=400;
View3D:=False;
Visible:=True;
BevelInner:=bvNone;
BevelOuter:=bvNone;
BorderStyle:=bsNone;
//BevelWidth:=0;
BottomAxis.Title.Caption:='Номер шага при оптимизации';
if Form18.ComboBox1.ItemIndex=0 then LeftAxis.Title.Caption:=Form18.Combobox1.Text+' '+Combobox2.Text+'-'+Combobox3.Text;
if Form18.ComboBox1.ItemIndex=1 then LeftAxis.Title.Caption:=Form18.Combobox1.Text+' '+Combobox2.Text+'-'+Combobox3.Text+'-'+Combobox4.Text;
if Form18.ComboBox1.ItemIndex=2 then LeftAxis.Title.Caption:=Form18.Combobox1.Text+' '+Combobox2.Text+'-'+Combobox3.Text+'-'+Combobox4.Text+'-'+Combobox5.Text;
BottomAxis.Title.Font.Size:=11;
BottomAxis.Title.Font.Name:='Tahoma';
LeftAxis.Title.Font.Size:=11;
LeftAxis.Title.Font.Name:='Tahoma';
RightAxis.Visible:=False;
TopAxis.Visible:=False;
Legend.Visible:=False;
LeftAxis.Grid.Visible:=false;
BottomAxis.Grid.Visible:=false;
BottomAxis.MinorTicks.Visible:=false;
if Form18.ComboBox1.ItemIndex=0 then  TCh[num_chart].Title.Text.Add('Зависимость длины связи '+Combobox2.Text+'-'+Combobox3.Text +' от координаты');
if Form18.ComboBox1.ItemIndex=1 then  TCh[num_chart].Title.Text.Add('Зависимость валентного угла '+Combobox2.Text+'-'+Combobox3.Text +'-'+Combobox4.Text+' от координаты');
if Form18.ComboBox1.ItemIndex=2 then  TCh[num_chart].Title.Text.Add('Зависимость двугранного угла '+Combobox2.Text+'-'+Combobox3.Text +'-'+Combobox4.Text+'-'+Combobox5.Text+' от координаты');
TCh[num_chart].Title.Font.Size:=12;
TCh[num_chart].Frame.Visible:=false;
end;
Series:=TLineSeries.Create(TCh[num_chart]);
Series.LinePen.Width:=2;
Series.LinePen.Style:=psSolid;
Series.Pointer.Visible:=True;


if dial=true then begin      // диалог открытия одного файла
j:=0;
if Combobox1.ItemIndex=0 then begin
//for i:=1 to Form12.ListView1.Items.Count do begin
  for i:=1 to nomer_cycla do begin
    if i>=length(xout) then Break;
parameterx:= sqr(  strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameter:=sqrt(parameterx+parametery+parameterz);
if (Form1.OpenDialog1.FilterIndex=2) and (step<>nil) then  Series.AddXY(strtofloat(step[i-1]),parameter ,'',RGB(255,0,0));//Добавляешь координаты в график
if Form1.OpenDialog1.FilterIndex=3 then  Series.AddXY(i,parameter ,'',RGB(255,0,0));//Добавляешь координаты в график    ///XYZ
if (Form1.OpenDialog1.FilterIndex=2) and (Rx<>nil) then begin ///IRC
if (Rx[length(Rx)-1]=-1) and (i=nomer_cycla) then Break;
if i-1=irc_fin[j] then begin
Series.AddXY(Rx_show[j],parameter ,'',RGB(255,0,0));//Добавляешь координаты в график
j:=j+1;
end;
end;

if energyscan<>nil then  begin
  if type_of_scan=True then Series.AddXY(i,parameter ,'',RGB(255,0,0))  //Добавляешь координаты в график
  else begin
    if i-1>=Length(scanpoint) then Break;
    if  (scanpoint[i-1]<>'') then Series.AddXY(StrToInt(scanpoint[i-1]),parameter ,'',RGB(255,0,0));
  end;
end;

if escfreal<>nil then begin
 if (trj=0) and (trjn=0)  then  begin
 if timestep<>'' then Series.AddXY(i*strtofloat(timestep),parameter ,'',RGB(255,0,0));  //Добавляешь координаты в график
 end
 else begin
 if (i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1))>Form49.ListView1.Items.Count+1 then break;
 if i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1)>1 then  Series.AddXY(strtofloat(timebomd[Form49.ComboBox2.ItemIndex,i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1)-1]),parameter ,'',RGB(255,0,0));
 end;
end;



TCh[num_chart].AddSeries(Series);//Добавляешь график в диаграмму
end;
end;
end
else begin
j:=0;                    //диалог открытия нескоьких файлов
if (step_mult<>nil) and (Rx_mult=nil) then count_el:=Form12.ListView1.Items.Count;
if (step_mult=nil) and (Rx_mult<>nil) then begin
if pos('***',Form37.Label13.Caption)=0 then count_el:=StrToInt(Copy(Form37.Label13.Caption, Pos(':',Form37.Label13.Caption)+2, 10))+1
else count_el:=StrToInt(Copy(Form37.Label5.Caption, Pos(':',Form37.Label5.Caption)+2, 10))+1;
end;
if (allenergy_mult<>nil) and (energyscan_mult<>nil) then count_el:=Length(xout_mult[basket[Form44.ComboBox1.ItemIndex]])-1;
if escfreal_mult<>nil then count_el:=Length(xout_mult[basket[Form49.ComboBox1.ItemIndex]]);

if Combobox1.ItemIndex=0 then begin
for i:=1 to count_el do begin

if step_mult<>nil then begin
  if xout_mult[basket[Form12.ComboBox1.ItemIndex],i,1]='' then Break;
parameterx:= sqr(  strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
end;
if Rx_mult<>nil then begin
  if xout_mult[basket[Form37.ComboBox1.ItemIndex],i,1]='' then Break;
parameterx:= sqr(  strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
end;
if energyscan_mult<>nil then begin
  if xout_mult[basket[Form44.ComboBox1.ItemIndex],i,1]='' then Break;
parameterx:= sqr(  strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
end;
if escfreal_mult<>nil then begin
  if xout_mult[basket[Form49.ComboBox1.ItemIndex],i,1]='' then Break;
parameterx:= sqr(  strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
end;
parameter:=sqrt(parameterx+parametery+parameterz);
if step_mult<>nil then
if step_mult[basket[Form12.ComboBox1.ItemIndex]]<>nil then Series.AddXY(strtofloat(step_mult[basket[Form12.ComboBox1.ItemIndex]][i-1]),parameter ,'',RGB(255,0,0));//Добавляешь координаты в график
if  Rx_mult<>nil then begin ///IRC
if j>length(Rx_mult[basket[Form37.ComboBox1.ItemIndex]]) then Break;
if j<length(Rx_mult[basket[Form37.ComboBox1.ItemIndex]]) then if (Rx_mult[basket[Form37.ComboBox1.ItemIndex],j]=-1) {and (i=count_el-1)} then Break;
if i-1=irc_fin[j] then begin
Series.AddXY(Rx_show[j],parameter ,'',RGB(255,0,0));//Добавляешь координаты в график
j:=j+1;
end;
end;

if energyscan_mult<>nil then begin
if energyscan_mult[basket[Form44.ComboBox1.ItemIndex]]<>nil then  begin
  if type_of_scan_mult[basket[Form44.ComboBox1.ItemIndex]]=True then Series.AddXY(i,parameter ,'',RGB(255,0,0))  //Добавляешь координаты в график
  else begin
    if i-1>=Length(scanpoint_mult[basket[Form44.Combobox1.ItemIndex]]) then Break;
    if  (scanpoint_mult[basket[Form44.Combobox1.ItemIndex],i-1]<>'') then Series.AddXY(StrToInt(scanpoint_mult[basket[Form44.Combobox1.ItemIndex],i-1]),parameter ,'',RGB(255,0,0));
  end;
end;
end;

if escfreal_mult<>nil then begin
 if (trj_mult[basket[Form49.ComboBox1.ItemIndex]]=0) and (trjn_mult[basket[Form49.ComboBox1.ItemIndex]]=0)  then  begin
 if timestep_mult[basket[Form49.ComboBox1.ItemIndex]]<>'' then Series.AddXY(i*strtofloat(timestep_mult[basket[Form49.ComboBox1.ItemIndex]]),parameter ,'',RGB(255,0,0));  //Добавляешь координаты в график
 end
 else begin
 if (i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1))>Form49.ListView1.Items.Count+1 then break;
 if i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1)>1 then  Series.AddXY(strtofloat(timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1)-1]),parameter ,'',RGB(255,0,0));
 end;
end;



TCh[num_chart].AddSeries(Series);//Добавляешь график в диаграмму
end;
end;
end;




                                // диалог открытия одного файла
if dial=true then begin
  j:=0;
if Combobox1.ItemIndex=1 then begin
for i:=1 to nomer_cycla do begin
  if i>=length(xout) then Break;
parameterx:= sqr(  strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(xout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(yout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(zout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter13:=sqrt(parameterx+parametery+parameterz);
parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
if (Form1.OpenDialog1.FilterIndex=2) and (step<>nil) then  Series.AddXY(strtofloat(step[i-1]),parameter ,'',RGB(0,255,0));//Добавляешь координаты в график
if Form1.OpenDialog1.FilterIndex=3 then  Series.AddXY(i,parameter ,'',RGB(0,255,0));//Добавляешь координаты в график
if (Form1.OpenDialog1.FilterIndex=2) and (Rx<>nil) then begin ///IRC
if (Rx[length(Rx)-1]=-1) and (i=nomer_cycla) then Break;
if i-1=irc_fin[j] then begin
Series.AddXY(Rx_show[j],parameter ,'',RGB(0,255,0));//Добавляешь координаты в график
j:=j+1;
end;
end;

if energyscan<>nil then  begin
  if type_of_scan=True then Series.AddXY(i,parameter ,'',RGB(0,255,0))  //Добавляешь координаты в график
  else begin
    if i-1>=Length(scanpoint) then Break;
    if  (scanpoint[i-1]<>'') then Series.AddXY(StrToInt(scanpoint[i-1]),parameter ,'',RGB(0,255,0));
  end;
end;

if escfreal<>nil then begin
 if (trj=0) and (trjn=0)  then  begin
 if timestep<>'' then Series.AddXY(i*strtofloat(timestep),parameter ,'',RGB(0,255,0));  //Добавляешь координаты в график
 end
 else begin
 if (i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1))>Form49.ListView1.Items.Count+1 then break;
 if i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1)>1 then  Series.AddXY(strtofloat(timebomd[Form49.ComboBox2.ItemIndex,i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1)-1]),parameter ,'',RGB(0,255,0));
 end;
end;

TCh[num_chart].AddSeries(Series);//Добавляешь график в диаграмму
end;
end;
end
else begin     //диалог открытия нескоьких файлов
if (step_mult<>nil) and (Rx_mult=nil) then count_el:=Form12.ListView1.Items.Count;
if (step_mult=nil) and (Rx_mult<>nil) then begin
if pos('***',Form37.Label13.Caption)=0 then count_el:=StrToInt(Copy(Form37.Label13.Caption, Pos(':',Form37.Label13.Caption)+2, 10))+1
else count_el:=StrToInt(Copy(Form37.Label5.Caption, Pos(':',Form37.Label5.Caption)+2, 10))+1;
end;
if (allenergy_mult<>nil) and (energyscan_mult<>nil) then count_el:=Length(xout_mult[basket[Form44.ComboBox1.ItemIndex]])-1;
if escfreal_mult<>nil then count_el:=Length(xout_mult[basket[Form49.ComboBox1.ItemIndex]]);
if Combobox1.ItemIndex=1 then begin
for i:=1 to count_el do begin
if step_mult<>nil then begin
  if xout_mult[basket[Form12.ComboBox1.ItemIndex],i,1]='' then Break;
parameterx:= sqr(  strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter13:=sqrt(parameterx+parametery+parameterz);
end;

if Rx_mult<>nil then begin
  if xout_mult[basket[Form37.ComboBox1.ItemIndex],i,1]='' then Break;
parameterx:= sqr(  strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter13:=sqrt(parameterx+parametery+parameterz);
end;

if energyscan_mult<>nil then begin
  if xout_mult[basket[Form44.ComboBox1.ItemIndex],i,1]='' then Break;
parameterx:= sqr(  strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter13:=sqrt(parameterx+parametery+parameterz);
end;

if escfreal_mult<>nil then begin
  if xout_mult[basket[Form49.ComboBox1.ItemIndex],i,1]='' then Break;
parameterx:= sqr(  strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]));
parameter12:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])  -    strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter23:=sqrt(parameterx+parametery+parameterz);
parameterx:= sqr(  strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parametery:= sqr(  strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameterz:= sqr(  strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]));
parameter13:=sqrt(parameterx+parametery+parameterz);
end;


parameter:=  (ArcCos((sqr(parameter12)+sqr(parameter23)-sqr(parameter13))/(2*parameter12*parameter23)))*180/pi;
if step_mult<>nil then
if step_mult[basket[Form12.ComboBox1.ItemIndex]]<>nil then Series.AddXY(strtofloat(step_mult[basket[Form12.ComboBox1.ItemIndex]][i-1]),parameter ,'',RGB(0,255,0));//Добавляешь координаты в график

if  Rx_mult<>nil then begin ///IRC
if j=length(Rx_mult[basket[Form37.ComboBox1.ItemIndex]]) then Break;
if Rx_mult[basket[Form37.ComboBox1.ItemIndex],j]=-1 then Break;
if i-1=irc_fin[j] then begin
Series.AddXY(Rx_show[j],parameter ,'',RGB(0,255,0));//Добавляешь координаты в график
j:=j+1;
end;
end;

if energyscan_mult<>nil then begin
if energyscan_mult[basket[Form44.ComboBox1.ItemIndex]]<>nil then  begin
  if type_of_scan_mult[basket[Form44.ComboBox1.ItemIndex]]=True then Series.AddXY(i,parameter ,'',RGB(0,255,0))  //Добавляешь координаты в график
  else begin
    if i-1>=Length(scanpoint_mult[basket[Form44.Combobox1.ItemIndex]]) then Break;
    if  (scanpoint_mult[basket[Form44.Combobox1.ItemIndex],i-1]<>'') then Series.AddXY(StrToInt(scanpoint_mult[basket[Form44.Combobox1.ItemIndex],i-1]),parameter ,'',RGB(0,255,0));
  end;
end;
end;

if escfreal_mult<>nil then begin
 if (trj_mult[basket[Form49.ComboBox1.ItemIndex]]=0) and (trjn_mult[basket[Form49.ComboBox1.ItemIndex]]=0)  then  begin
 if timestep_mult[basket[Form49.ComboBox1.ItemIndex]]<>'' then Series.AddXY(i*strtofloat(timestep_mult[basket[Form49.ComboBox1.ItemIndex]]),parameter ,'',RGB(0,255,0));  //Добавляешь координаты в график
 end
 else begin
 if (i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1))>Form49.ListView1.Items.Count+1 then break;
 if i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1)>1 then  Series.AddXY(strtofloat(timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1)-1]),parameter ,'',RGB(0,255,0));
 end;
end;

TCh[num_chart].AddSeries(Series);//Добавляешь график в диаграмму
end;
end;
end;






if dial=true then begin
  j:=0;
if Combobox1.ItemIndex=2 then begin
for i:=1 to nomer_cycla do begin
if i>=length(xout) then Break;

parameterx23:= strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery23:= strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz23:= strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameterx43:= strtofloat(xout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(xout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery43:= strtofloat(yout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(yout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz43:= strtofloat(zout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(zout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(xout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(xout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parametery45:= strtofloat(yout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(yout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parameterz45:= strtofloat(zout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(zout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);

parameter4:= parametery43*parameterz45-parametery45*parameterz43; // A
parameter5:= parameterz43*parameterx45-parameterx43*parameterz45; // B
parameter6:= parameterx43*parametery45-parametery43*parameterx45; // B

parH:=parameter1*parameter4+parameter2*parameter5+parameter3*parameter6;
parR:=sqrt(sqr(parameter1)+ sqr(parameter2)+  sqr(parameter3));
BD:=sqrt(sqr(parameter4)+ sqr(parameter5)+  sqr(parameter6));


DetX:=(strtofloat(xout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(
zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(
xout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(
yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout[i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(
yout[i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout[i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(zout[i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]));

if DetX>0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:=180 - ArcCos( parH/(parR*BD))*180/pi;
  if abs(parH/(parR*BD))>1 then parameter:=180 - ArcCos(Round(parH/(parR*BD)))*180/pi;
end;
if DetX<0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:= ArcCos( parH/(parR*BD))*180/pi - 180;
  if abs(parH/(parR*BD))>1 then  parameter:= ArcCos(Round(parH/(parR*BD)))*180/pi - 180;
end;
if DetX=0 then  begin
//showmessage('Три атомных центра лежат на одной прямой. Двугранный угол не определен'+#13 +'Необходимо использовать мнимые атомы для избежания неопределенности!');
if parH>0 then parameter:= 180.000000;
if parH<0 then parameter:= 0.000000;
end;





if (Form1.OpenDialog1.FilterIndex=2) and (step<>nil) then Series.AddXY(strtofloat(step[i-1]),parameter ,'',RGB(0,0,255));//Добавляешь координаты в график
if Form1.OpenDialog1.FilterIndex=3 then Series.AddXY(i,parameter ,'',RGB(0,0,255));//Добавляешь координаты в график
if (Form1.OpenDialog1.FilterIndex=2) and (Rx<>nil) then begin ///IRC
if (Rx[length(Rx)-1]=-1) and (i=nomer_cycla) then Break;
if i-1=irc_fin[j] then begin
Series.AddXY(Rx_show[j],parameter ,'',RGB(0,0,255));//Добавляешь координаты в график
j:=j+1;
end;
end;

if energyscan<>nil then  begin
  if type_of_scan=True then Series.AddXY(i,parameter ,'',RGB(0,0,255))  //Добавляешь координаты в график
  else begin
    if i-1>=Length(scanpoint) then Break;
    if  (scanpoint[i-1]<>'') then Series.AddXY(StrToInt(scanpoint[i-1]),parameter ,'',RGB(0,0,255));
  end;
end;

if escfreal<>nil then begin
 if (trj=0) and (trjn=0)  then  begin
 if timestep<>'' then Series.AddXY(i*strtofloat(timestep),parameter ,'',RGB(0,0,255));  //Добавляешь координаты в график
 end
 else begin
 if (i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1))>Form49.ListView1.Items.Count+1 then break;
 if i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1)>1 then  Series.AddXY(strtofloat(timebomd[Form49.ComboBox2.ItemIndex,i-Form49.ComboBox2.ItemIndex*(stepdynbomd[0]-1)-1]),parameter ,'',RGB(0,0,255));
 end;
end;

TCh[num_chart].AddSeries(Series);//Добавляешь график в диаграмму }
end;
end;

end

else begin
if (step_mult<>nil) and (Rx_mult=nil) then count_el:=Form12.ListView1.Items.Count;
if (step_mult=nil) and (Rx_mult<>nil) then begin
if pos('***',Form37.Label13.Caption)=0 then count_el:=StrToInt(Copy(Form37.Label13.Caption, Pos(':',Form37.Label13.Caption)+2, 10))+1
else count_el:=StrToInt(Copy(Form37.Label5.Caption, Pos(':',Form37.Label5.Caption)+2, 10))+1;
end;
if (allenergy_mult<>nil) and (energyscan_mult<>nil) then count_el:=Length(xout_mult[basket[Form44.ComboBox1.ItemIndex]])-1;
if escfreal_mult<>nil then count_el:=Length(xout_mult[basket[Form49.ComboBox1.ItemIndex]]);
if Combobox1.ItemIndex=2 then begin
for i:=1 to count_el do begin
if step_mult<>nil then begin
parameterx23:= strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery23:= strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz23:= strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameterx43:= strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery43:= strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz43:= strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parametery45:= strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parameterz45:= strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);

parameter4:= parametery43*parameterz45-parametery45*parameterz43; // A
parameter5:= parameterz43*parameterx45-parameterx43*parameterz45; // B
parameter6:= parameterx43*parametery45-parametery43*parameterx45; // B

parH:=parameter1*parameter4+parameter2*parameter5+parameter3*parameter6;
parR:=sqrt(sqr(parameter1)+ sqr(parameter2)+  sqr(parameter3));
BD:=sqrt(sqr(parameter4)+ sqr(parameter5)+  sqr(parameter6));


DetX:=(strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-
strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-
strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-
strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-
strtofloat(zout_mult[basket[Form12.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]));
 end;



 if Rx_mult<>nil then begin
  if xout_mult[basket[Form37.ComboBox1.ItemIndex],i,1]='' then Break;
  parameterx23:= strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery23:= strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz23:= strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameterx43:= strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery43:= strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz43:= strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parametery45:= strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parameterz45:= strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);

parameter4:= parametery43*parameterz45-parametery45*parameterz43; // A
parameter5:= parameterz43*parameterx45-parameterx43*parameterz45; // B
parameter6:= parameterx43*parametery45-parametery43*parameterx45; // B

parH:=parameter1*parameter4+parameter2*parameter5+parameter3*parameter6;
parR:=sqrt(sqr(parameter1)+ sqr(parameter2)+  sqr(parameter3));
BD:=sqrt(sqr(parameter4)+ sqr(parameter5)+  sqr(parameter6));


DetX:=(strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-
strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-
strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-
strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-
strtofloat(zout_mult[basket[Form37.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]));
end;

if energyscan_mult<>nil then begin
  if xout_mult[basket[Form44.ComboBox1.ItemIndex],i,1]='' then Break;
  parameterx23:= strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery23:= strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz23:= strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameterx43:= strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery43:= strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz43:= strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parametery45:= strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parameterz45:= strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);

parameter4:= parametery43*parameterz45-parametery45*parameterz43; // A
parameter5:= parameterz43*parameterx45-parameterx43*parameterz45; // B
parameter6:= parameterx43*parametery45-parametery43*parameterx45; // B

parH:=parameter1*parameter4+parameter2*parameter5+parameter3*parameter6;
parR:=sqrt(sqr(parameter1)+ sqr(parameter2)+  sqr(parameter3));
BD:=sqrt(sqr(parameter4)+ sqr(parameter5)+  sqr(parameter6));


DetX:=(strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-
strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-
strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-
strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-
strtofloat(zout_mult[basket[Form44.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]));

end;


if escfreal_mult<>nil then begin
  if xout_mult[basket[Form49.ComboBox1.ItemIndex],i,1]='' then Break;
  parameterx23:= strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery23:= strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz23:= strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])  -    strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameterx43:= strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parametery43:= strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);
parameterz43:= strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])  -    strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))]);

parameter1:= parametery23*parameterz43-parametery43*parameterz23; // A
parameter2:= parameterz23*parameterx43-parameterx23*parameterz43; // B
parameter3:= parameterx23*parametery43-parametery23*parameterx43; // B

parameterx45:= strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parametery45:= strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);
parameterz45:= strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])  -    strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))]);

parameter4:= parametery43*parameterz45-parametery45*parameterz43; // A
parameter5:= parameterz43*parameterx45-parameterx43*parameterz45; // B
parameter6:= parameterx43*parametery45-parametery43*parameterx45; // B

parH:=parameter1*parameter4+parameter2*parameter5+parameter3*parameter6;
parR:=sqrt(sqr(parameter1)+ sqr(parameter2)+  sqr(parameter3));
BD:=sqrt(sqr(parameter4)+ sqr(parameter5)+  sqr(parameter6));


DetX:=(strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-
strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]))  +  (strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-
strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-
strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-
strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) - (strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox4.Text,0,pos('(',Combobox4.Text)-1))])-strtofloat(xout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) * (strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox3.Text,0,pos('(',Combobox3.Text)-1))])-strtofloat(yout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))])) *(strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox5.Text,0,pos('(',Combobox5.Text)-1))])-
strtofloat(zout_mult[basket[Form49.ComboBox1.ItemIndex]][i][strtoint(copy(Combobox2.Text,0,pos('(',Combobox2.Text)-1))]));

end;




if DetX>0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:=180 - ArcCos( parH/(parR*BD))*180/pi;
  if abs(parH/(parR*BD))>1 then parameter:=180 - ArcCos(Round(parH/(parR*BD)))*180/pi;
end;
if DetX<0 then begin
  if abs(parH/(parR*BD))<=1 then parameter:= ArcCos( parH/(parR*BD))*180/pi - 180;
  if abs(parH/(parR*BD))>1 then  parameter:= ArcCos(Round(parH/(parR*BD)))*180/pi - 180;
end;
if DetX=0 then  begin
//showmessage('Три атомных центра лежат на одной прямой. Двугранный угол не определен'+#13 +'Необходимо использовать мнимые атомы для избежания неопределенности!');
if parH>0 then parameter:= 180.000000;
if parH<0 then parameter:= 0.000000;
end;




if step_mult<>nil then
if step_mult[basket[Form12.ComboBox1.ItemIndex]]<>nil then Series.AddXY(strtofloat(step_mult[basket[Form12.ComboBox1.ItemIndex]][i-1]),parameter ,'',RGB(0,0,255));//Добавляешь координаты в график

if  Rx_mult<>nil then begin ///IRC
if j=length(Rx_mult[basket[Form37.ComboBox1.ItemIndex]]) then Break;
if Rx_mult[basket[Form37.ComboBox1.ItemIndex],j]=-1  then Break;
if i-1=irc_fin[j] then begin
Series.AddXY(Rx_show[j],parameter ,'',RGB(0,0,255));//Добавляешь координаты в график
j:=j+1;
end;
end;


if energyscan_mult<>nil then begin
if energyscan_mult[basket[Form44.ComboBox1.ItemIndex]]<>nil then  begin
  if type_of_scan_mult[basket[Form44.ComboBox1.ItemIndex]]=True then Series.AddXY(i,parameter ,'',RGB(0,0,255))  //Добавляешь координаты в график
  else begin
    if i-1>=Length(scanpoint_mult[basket[Form44.Combobox1.ItemIndex]]) then Break;
    if  (scanpoint_mult[basket[Form44.Combobox1.ItemIndex],i-1]<>'') then Series.AddXY(StrToInt(scanpoint_mult[basket[Form44.Combobox1.ItemIndex],i-1]),parameter ,'',RGB(0,0,255));
  end;
end;
end;

if escfreal_mult<>nil then begin
 if (trj_mult[basket[Form49.ComboBox1.ItemIndex]]=0) and (trjn_mult[basket[Form49.ComboBox1.ItemIndex]]=0)  then  begin
 if timestep_mult[basket[Form49.ComboBox1.ItemIndex]]<>'' then Series.AddXY(i*strtofloat(timestep_mult[basket[Form49.ComboBox1.ItemIndex]]),parameter ,'',RGB(0,0,255));  //Добавляешь координаты в график
 end
 else begin
 if (i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1))>Form49.ListView1.Items.Count+1 then break;
 if i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1)>1 then  Series.AddXY(strtofloat(timebomd_mult[basket[Form49.ComboBox1.ItemIndex],Form49.ComboBox2.ItemIndex,i-Form49.ComboBox2.ItemIndex*(stepdynbomd_mult[basket[Form49.ComboBox1.ItemIndex],0]-1)-1]),parameter ,'',RGB(0,0,255));
 end;
end;

TCh[num_chart].AddSeries(Series);//Добавляешь график в диаграмму }
end;
end;





end;



















num_chart:=num_chart+1;   // если это убрать, то происходит замещение одного графика другим, что можно отразить в настройках
Form18.ScrollBox1.VertScrollBar.Position:=posi_scroll;

end;

procedure TForm18.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form18.ScrollBox1.VertScrollBar.Position:=Form18.ScrollBox1.VertScrollBar.Position+20;
end;

procedure TForm18.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Form18.ScrollBox1.VertScrollBar.Position:=Form18.ScrollBox1.VertScrollBar.Position-20;
end;

procedure TForm18.BitBtn2Click(Sender: TObject);
 var i: word;
begin
if TCh <>nil then begin
i:=0;
Repeat
if TCh[i]<>nil then FreeAndNil(TCh[i]);
i:=i+1;
until i>=num_chart;
end;
num_chart:=0;

end;

procedure TForm18.FormResize(Sender: TObject);
var i: integer;
begin
if Form18.FindComponent('TCh'+inttostr(num_chart-1)) as TChart<>nil then begin
for i:=0 to length(TCh)-1 do
TCh[i].Width:=Form18.ClientWidth-10;
end;
end;

end.
