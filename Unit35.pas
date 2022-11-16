unit Unit35;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm35 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form35: TForm35;

implementation

uses Unit1, Unit24;

{$R *.dfm}

procedure TForm35.FormShow(Sender: TObject);
var i: integer;
begin
Combobox1.Clear;
if dial=true then begin
for i:=0 to ch-1 do
Combobox1.Items.Add(inttostr(i+1));
end
else begin
for i:=0 to ch_mult[Form24.Combobox1.ItemIndex]-1 do
Combobox1.Items.Add(inttostr(i+1));
end;
Combobox1.ItemIndex:=0;




end;

procedure TForm35.BitBtn1Click(Sender: TObject);
begin
Combobox1.ItemIndex:=0;
Edit1.Text:='1';
Combobox2.ItemIndex:=0;
end;

procedure TForm35.BitBtn2Click(Sender: TObject);
var str,probel,a: widestring;
i,k,razryd,zn,nom: integer;
v: real;
f: TextFile;
begin
if Savedialog1.Execute then  begin
if  pos('.gjf',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.gjf';

for k:=0 to 100 do
probel:=probel+' ';
razryd:=9;    //    число знаков после запятой будет на единицу меньше
if  Combobox2.ItemIndex=0 then zn:=1
else zn:=-1;                //знак моды (плюс-минус)
v:=strtofloat(Edit1.Text);  //множитель

AssignFile(f,a);
Rewrite(f);

if dial=true then begin
for i:=0 to length(src_start)-1 do
if src_start[i]<>'' then WriteLn(f,src_start[i]);
for i:=0 to length(src_route)-1 do
if src_route[i]<>'' then WriteLn(f,src_route[i]);
WriteLn(f,'');
for i:=0 to length(src_title)-1 do
if src_title[i]<>'' then WriteLn(f,src_title[i]);
WriteLn(f,'');
WriteLn(f,src_mult[0]);


for k:=1 to nomer_atoma do begin
WriteLn(f,' '+ atomoutel[nomer_cycla][k]+ copy(probel,1,15-length(atomoutel[nomer_cycla][k]+typeout[nomer_cycla][k])) +
typeout[nomer_cycla][k] + copy(probel,1,16-length(copy(floattostrf((strtofloat(xout[nomer_cycla][k])+v*zn*strtofloat(dx1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(xout[nomer_cycla][k])+v*zn*strtofloat(dx1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1) +
copy(floattostrf((strtofloat(xout[nomer_cycla][k])+v*zn*strtofloat(dx1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(xout[nomer_cycla][k])+v*zn*strtofloat(dx1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)))  +  copy(floattostrf((strtofloat(xout[nomer_cycla][k])+v*zn*strtofloat(dx1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(xout[nomer_cycla][k])+v*zn*strtofloat(dx1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1) +
copy(floattostrf((strtofloat(xout[nomer_cycla][k])+v*zn*strtofloat(dx1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(xout[nomer_cycla][k])+v*zn*strtofloat(dx1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)   +


copy(probel,1,16-length( copy(floattostrf((strtofloat(yout[nomer_cycla][k])+v*zn*strtofloat(dy1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(yout[nomer_cycla][k])+v*zn*strtofloat(dy1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1)  +
copy(floattostrf((strtofloat(yout[nomer_cycla][k])+v*zn*strtofloat(dy1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(yout[nomer_cycla][k])+v*zn*strtofloat(dy1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)))          + copy(floattostrf((strtofloat(yout[nomer_cycla][k])+v*zn*strtofloat(dy1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(yout[nomer_cycla][k])+v*zn*strtofloat(dy1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1)  +
copy(floattostrf((strtofloat(yout[nomer_cycla][k])+v*zn*strtofloat(dy1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(yout[nomer_cycla][k])+v*zn*strtofloat(dy1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)+


copy(probel,1,16-length(copy(floattostrf((strtofloat(zout[nomer_cycla][k])+v*zn*strtofloat(dz1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(zout[nomer_cycla][k])+v*zn*strtofloat(dz1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1) +
copy(floattostrf((strtofloat(zout[nomer_cycla][k])+v*zn*strtofloat(dz1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(zout[nomer_cycla][k])+v*zn*strtofloat(dz1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)))   + copy(floattostrf((strtofloat(zout[nomer_cycla][k])+v*zn*strtofloat(dz1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(zout[nomer_cycla][k])+v*zn*strtofloat(dz1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1)  +
copy(floattostrf((strtofloat(zout[nomer_cycla][k])+v*zn*strtofloat(dz1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(zout[nomer_cycla][k])+v*zn*strtofloat(dz1[strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd));
end;

WriteLn(f,'');    // в конце ставим пустые строки как того требует Gaussian
WriteLn(f,'');
WriteLn(f,'');

end; //  dial=true then begin










if dial=false then begin
nom:=Form24.ComboBox1.ItemIndex;   //Номер файла

for i:=0 to length(src_start_mult[nom])-1 do
if src_start_mult[nom,i]<>'' then WriteLn(f,src_start_mult[nom,i]);
for i:=0 to length(src_route_mult[nom])-1 do
if src_route_mult[nom,i]<>'' then WriteLn(f,src_route_mult[nom,i]);
WriteLn(f,'');
for i:=0 to length(src_title_mult[nom])-1 do
if src_title_mult[nom,i]<>'' then WriteLn(f,src_title_mult[nom,i]);
WriteLn(f,'');
WriteLn(f,src_mult_mult[nom,0]);


for k:=1 to nomer_atoma_mult[nom] do begin
WriteLn(f,' '+ atomoutel_mult[nom][nomer_cycla_mult[nom]][k]+ copy(probel,1,15-length(atomoutel_mult[nom][nomer_cycla_mult[nom]][k]+ typeout_mult[nom][nomer_cycla_mult[nom]][k])) +
typeout_mult[nom][nomer_cycla_mult[nom]][k] + copy(probel,1,16-length(copy(floattostrf((strtofloat(xout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dx1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(xout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dx1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1) +
copy(floattostrf((strtofloat(xout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dx1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(xout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dx1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)))  +  copy(floattostrf((strtofloat(xout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dx1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(xout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dx1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1) +
copy(floattostrf((strtofloat(xout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dx1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(xout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dx1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)   +


copy(probel,1,16-length( copy(floattostrf((strtofloat(yout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dy1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(yout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dy1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1)  +
copy(floattostrf((strtofloat(yout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dy1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(yout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dy1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)))          + copy(floattostrf((strtofloat(yout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dy1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(yout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dy1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1)  +
copy(floattostrf((strtofloat(yout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dy1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(yout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dy1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)+


copy(probel,1,16-length(copy(floattostrf((strtofloat(zout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dz1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(zout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dz1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1) +
copy(floattostrf((strtofloat(zout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dz1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(zout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dz1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd)))   + copy(floattostrf((strtofloat(zout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dz1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),1,pos('.',floattostrf((strtofloat(zout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dz1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd))-1)  +
copy(floattostrf((strtofloat(zout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dz1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd),pos('.',floattostrf((strtofloat(zout_mult[nom][nomer_cycla_mult[nom]][k])+v*zn*strtofloat(dz1_mult[nom,strtoint(Combobox1.Text)-1,k-1])),ffFixed,5,razryd)),razryd));
end;

WriteLn(f,'');    // в конце ставим пустые строки как того требует Gaussian
WriteLn(f,'');
WriteLn(f,'');








end;    // if dial=false then begin










CloseFile(f);













end; //   if Savedialog1.Execute then  begin

SaveDialog1.FreeOnRelease;
end;

end.
