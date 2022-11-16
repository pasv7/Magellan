unit Unit70;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Math;

type
  TForm70 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Image1: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    CheckBox3: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form70: TForm70;
  Qcolor: array of array of integer;
  Qval: array of string;

implementation

uses Unit1,Unit64, Unit36;


{$R *.dfm}


function MinMaxChrg(var X: MyType): String;
var i,j: integer;
Y: array of double;
begin
for i:=0 to length(X)-1 do
if X[i,0]='' then Break;
for j:=0 to length(X[i-1])-1 do begin
if X[i-1,j]<>'' then begin
SetLength(Y,length(Y)+1);
Y[length(Y)-1]:=strtofloat(X[i-1,j]);
end;
end;
Result:=floattostr(MinValue(Y))+'='+floattostr(MaxValue(Y));
end;



procedure TForm70.FormShow(Sender: TObject);
var i: integer;
begin
Label1.Caption:='Схема расчета зарядов: ' + Form64.Combobox2.Text;
if Form64.ComboBox2.Text='Mulliken' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1);
Edit2.Text:=Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull))))) then begin
Edit1.Text:=Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1)))<abs(StrToFloat(Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull))))) then begin
Edit2.Text:=Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='MBS Mulliken' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1);
Edit2.Text:=Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull))))) then begin
Edit1.Text:=Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1)))<abs(StrToFloat(Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull))))) then begin
Edit2.Text:=Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='Bonding Mulliken' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1);
Edit2.Text:=Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull))))) then begin
Edit1.Text:=Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1)))<abs(StrToFloat(Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull))))) then begin
Edit2.Text:=Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='ESP' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1);
Edit2.Text:=Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp))))) then begin
Edit1.Text:=Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1)))<abs(StrToFloat(Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp))))) then begin
Edit2.Text:=Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='Hirshfeld' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1);
Edit2.Text:=Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir))))) then begin
Edit1.Text:=Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1)))<abs(StrToFloat(Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir))))) then begin
Edit2.Text:=Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='CM5' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1);
Edit2.Text:=Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5))))) then begin
Edit1.Text:=Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1)))<abs(StrToFloat(Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5))))) then begin
Edit2.Text:=Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='NBO' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1);
Edit2.Text:=Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo))))) then begin
Edit1.Text:=Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1)))<abs(StrToFloat(Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo))))) then begin
Edit2.Text:=Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='AIM' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1);
Edit2.Text:=Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim))))) then begin
Edit1.Text:=Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1)))<abs(StrToFloat(Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim))))) then begin
Edit2.Text:=Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='Lowdin' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1);
Edit2.Text:=Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo))))) then begin
Edit1.Text:=Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1)))<abs(StrToFloat(Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo))))) then begin
Edit2.Text:=Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='APT' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1);
Edit2.Text:=Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt))))) then begin
Edit1.Text:=Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1)))<abs(StrToFloat(Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt))))) then begin
Edit2.Text:=Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt))))*(-1));
end;
end;
end;








Label4.Font.Color:=clBlue;
Label4.Font.Size:=9;
Label5.Font.Color:=clBlue;
Label5.Font.Size:=9;
Label4.Caption:='-Q, ' + Edit1.Text + ' a.e.';
Label5.Caption:='+Q, ' + Edit2.Text + ' a.e.' ;

end;

procedure TForm70.BitBtn1Click(Sender: TObject);
var i: integer;
begin

Qcolor:=nil;
Qval:=nil;
if CheckBox1.Checked=True then begin
SetLength(Qcolor,length(atomoutel[1])+6,3);
if CheckBox2.Checked=True then SetLength(Qval,length(atomoutel[1]));

if Form64.ComboBox2.Text='Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(mull[length(mull)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(mull[length(mull)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(mull[length(mull)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(mull[length(mull)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=mull[length(mull)-1,i-1];
end;
end;     // end of Mulliken

if Form64.ComboBox2.Text='MBS Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(mbs_mull[length(mbs_mull)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(mbs_mull[length(mbs_mull)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(mbs_mull[length(mbs_mull)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(mbs_mull[length(mbs_mull)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=mbs_mull[length(mbs_mull)-1,i-1];
end;
end;

if Form64.ComboBox2.Text='Bonding Mulliken' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(bond_mull[length(bond_mull)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(bond_mull[length(bond_mull)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(bond_mull[length(bond_mull)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(bond_mull[length(bond_mull)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=bond_mull[length(bond_mull)-1,i-1];
end;
end;

if Form64.ComboBox2.Text='ESP' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(esp[length(esp)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(esp[length(esp)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(esp[length(esp)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(esp[length(esp)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=esp[length(esp)-1,i-1];
end;
end;

if Form64.ComboBox2.Text='Hirshfeld' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(hir[length(hir)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(hir[length(hir)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(hir[length(hir)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(hir[length(hir)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=hir[length(hir)-1,i-1];
end;
end;


if Form64.ComboBox2.Text='CM5' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(cm5[length(cm5)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(cm5[length(cm5)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(cm5[length(cm5)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(cm5[length(cm5)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=cm5[length(cm5)-1,i-1];
end;
end;


if Form64.ComboBox2.Text='NBO' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(nbo[length(nbo)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(nbo[length(nbo)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(nbo[length(nbo)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(nbo[length(nbo)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=nbo[length(nbo)-1,i-1];
end;
end;

if Form64.ComboBox2.Text='AIM' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(aim[length(aim)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(aim[length(aim)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(aim[length(aim)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(aim[length(aim)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=aim[length(aim)-1,i-1];
end;
end;

if Form64.ComboBox2.Text='Lowdin' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(lo[length(lo)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(lo[length(lo)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(lo[length(lo)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(lo[length(lo)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=lo[length(lo)-1,i-1];
end;
end;


if Form64.ComboBox2.Text='APT' then begin
for i:=1 to length(atomoutel[1])-1 do
if atomoutel[1,i]<>'' then begin
if  StrToFloat(apt[length(apt)-1,i-1])>=0 then   begin
Qcolor[i,0]:=0;
Qcolor[i,1]:= Round(255 * StrToFloat(apt[length(apt)-1,i-1]) / StrToFloat  (Edit2.Text));
Qcolor[i,2]:=0;
end;
if  StrToFloat(apt[length(apt)-1,i-1])<0  then  begin
Qcolor[i,0]:=Round(255 * StrToFloat(apt[length(apt)-1,i-1]) / StrToFloat  (Edit1.Text));
Qcolor[i,1]:=0;
Qcolor[i,2]:=0;
end;
if Checkbox2.Checked=True then Qval[i]:=apt[length(apt)-1,i-1];
end;
end;

end;

bonds_painted:=false;
Form36.Show;

end;




procedure TForm70.CheckBox3Click(Sender: TObject);
begin

if Form64.ComboBox2.Text='Mulliken' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1);
Edit2.Text:=Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull))))) then begin
Edit1.Text:=Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(mull),1,pos('=',MinMaxChrg(mull))-1)))<abs(StrToFloat(Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull))))) then begin
Edit2.Text:=Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(mull),pos('=',MinMaxChrg(mull))+1,length(MinMaxChrg(mull))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='MBS Mulliken' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1);
Edit2.Text:=Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull))))) then begin
Edit1.Text:=Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(mbs_mull),1,pos('=',MinMaxChrg(mbs_mull))-1)))<abs(StrToFloat(Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull))))) then begin
Edit2.Text:=Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(mbs_mull),pos('=',MinMaxChrg(mbs_mull))+1,length(MinMaxChrg(mbs_mull))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='Bonding Mulliken' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1);
Edit2.Text:=Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull))))) then begin
Edit1.Text:=Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(bond_mull),1,pos('=',MinMaxChrg(bond_mull))-1)))<abs(StrToFloat(Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull))))) then begin
Edit2.Text:=Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(bond_mull),pos('=',MinMaxChrg(bond_mull))+1,length(MinMaxChrg(bond_mull))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='ESP' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1);
Edit2.Text:=Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp))))) then begin
Edit1.Text:=Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(esp),1,pos('=',MinMaxChrg(esp))-1)))<abs(StrToFloat(Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp))))) then begin
Edit2.Text:=Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(esp),pos('=',MinMaxChrg(esp))+1,length(MinMaxChrg(esp))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='Hirshfeld' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1);
Edit2.Text:=Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir))))) then begin
Edit1.Text:=Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(hir),1,pos('=',MinMaxChrg(hir))-1)))<abs(StrToFloat(Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir))))) then begin
Edit2.Text:=Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(hir),pos('=',MinMaxChrg(hir))+1,length(MinMaxChrg(hir))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='CM5' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1);
Edit2.Text:=Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5))))) then begin
Edit1.Text:=Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(cm5),1,pos('=',MinMaxChrg(cm5))-1)))<abs(StrToFloat(Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5))))) then begin
Edit2.Text:=Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(cm5),pos('=',MinMaxChrg(cm5))+1,length(MinMaxChrg(cm5))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='NBO' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1);
Edit2.Text:=Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo))))) then begin
Edit1.Text:=Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(nbo),1,pos('=',MinMaxChrg(nbo))-1)))<abs(StrToFloat(Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo))))) then begin
Edit2.Text:=Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(nbo),pos('=',MinMaxChrg(nbo))+1,length(MinMaxChrg(nbo))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='AIM' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1);
Edit2.Text:=Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim))))) then begin
Edit1.Text:=Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(aim),1,pos('=',MinMaxChrg(aim))-1)))<abs(StrToFloat(Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim))))) then begin
Edit2.Text:=Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(aim),pos('=',MinMaxChrg(aim))+1,length(MinMaxChrg(aim))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='Lowdin' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1);
Edit2.Text:=Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo))))) then begin
Edit1.Text:=Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(lo),1,pos('=',MinMaxChrg(lo))-1)))<abs(StrToFloat(Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo))))) then begin
Edit2.Text:=Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(lo),pos('=',MinMaxChrg(lo))+1,length(MinMaxChrg(lo))))*(-1));
end;
end;
end;


if Form64.ComboBox2.Text='APT' then begin
if CheckBox3.Checked=False then begin
Edit1.Text:=Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1);
Edit2.Text:=Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt)));
end
else begin
if abs(StrToFloat(Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1)))>=abs(StrToFloat(Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt))))) then begin
Edit1.Text:=Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1);
Edit2.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1))*(-1));
end;
if abs(StrToFloat(Copy(MinMaxChrg(apt),1,pos('=',MinMaxChrg(apt))-1)))<abs(StrToFloat(Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt))))) then begin
Edit2.Text:=Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt)));
Edit1.Text:=FloatToStr(StrToFloat(Copy(MinMaxChrg(apt),pos('=',MinMaxChrg(apt))+1,length(MinMaxChrg(apt))))*(-1));
end;
end;
end;

Label4.Caption:='-Q, ' + Edit1.Text + ' a.e.';
Label5.Caption:='+Q, ' + Edit2.Text + ' a.e.' ;

end;

procedure TForm70.Edit1Change(Sender: TObject);
begin
Label4.Caption:='-Q, ' + Edit1.Text + ' a.e.';
Label5.Caption:='+Q, ' + Edit2.Text + ' a.e.' ;
end;

procedure TForm70.Edit2Change(Sender: TObject);
begin
Label4.Caption:='-Q, ' + Edit1.Text + ' a.e.';
Label5.Caption:='+Q, ' + Edit2.Text + ' a.e.' ;
end;

procedure TForm70.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Qval:=nil;
Qcolor:=nil;
bonds_painted:=false;
end;

procedure TForm70.CheckBox2Click(Sender: TObject);
begin
BitBtn1.Click;
Form36.PaintBox1.Repaint;
end;

end.
