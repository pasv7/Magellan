unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, Menus, ExtCtrls, TeeProcs, Chart, Math;

type
  TForm17 = class(TForm)
    Chart1: TChart;
    MainMenu1: TMainMenu;
    BMP1: TMenuItem;
    Series1: TLineSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    N1: TMenuItem;
    ALPHA1: TMenuItem;
    BETA1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure BMP1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BETA1Click(Sender: TObject);
    procedure ALPHA1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

uses Unit14, Unit1;

{$R *.dfm}

procedure TForm17.FormShow(Sender: TObject);
var i:  integer;
    AY: real;
begin
Chart1.Series[0].Clear;
Chart2.Series[0].Clear;

//***************************************
if dial=true then begin
for i:=0 to ch-1 do  begin
AY:=strtofloat(Eorb[i+1])-strtofloat(Eorb[i]);
if AY<0.00001 then AY:=0.00001;
Chart1.Series[0].AddXY(strtofloat(Eorb[i]),1/AY,'',clRed);
end;
for i:=0 to ch-1 do  begin
AY:=strtofloat(Eorb[i+1])-strtofloat(Eorb[i]);
if AY<0.00001 then AY:=0.00001;
Chart2.Series[0].AddXY(strtofloat(Eorb[i]), log10(10/AY),'');
end;
if beta=true then Form17.Beta1.Enabled:=true;
end;  //if dial=true then begin
//**************************************


//**************************************
if dial=false then begin
for i:=0 to ch_mult[Form14.ComboBox1.ItemIndex]-1 do  begin
AY:=strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i+1])-strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i]);
if AY<0.00001 then AY:=0.00001;
Chart1.Series[0].AddXY(strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i]),1/AY,'',clRed);
end;
for i:=0 to ch_mult[Form14.ComboBox1.ItemIndex]-1 do  begin
AY:=strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i+1])-strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i]);
if AY<0.00001 then AY:=0.00001;
Chart2.Series[0].AddXY(strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i]), log10(10/AY),'');
end;
if beta_mult[Form14.ComboBox1.ItemIndex]=true then Form17.Beta1.Enabled:=true;
end; // if dial=false then begin

// ************************************

end;

procedure TForm17.BMP1Click(Sender: TObject);
var a: widestring;
begin
if SaveDialog1.Execute=true then begin
if  pos('.bmp',Savedialog1.Filename)<>0 then a:=Savedialog1.Filename
else a:=Savedialog1.Filename+'.bmp';
Chart1.Color:=clWhite;
Chart2.Color:=clWhite;
Chart1.SaveToBitmapFile(copy(a,0,pos('.bmp',a)-1)+'_dN-dE'+'.bmp');
Chart2.SaveToBitmapFile(copy(a,0,pos('.bmp',a)-1)+'_lg(dN-dE)'+'.bmp');
end;
Chart1.Color:=clBtnFace;
Chart2.Color:=clBtnFace;
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form17.BETA1.Enabled:=false;
end;

procedure TForm17.BETA1Click(Sender: TObject);
var i: integer;
    AY: real;
begin

//***************************************************
if dial=true then begin
for i:=0 to ch-1 do  begin
AY:=strtofloat(Eorb_beta[i+1])-strtofloat(Eorb_beta[i]);
if AY<0.00001 then AY:=0.00001;
Chart1.Series[0].AddXY(strtofloat(Eorb_beta[i]),1/AY,'',clRed);
end;
for i:=0 to ch-1 do  begin
AY:=strtofloat(Eorb_beta[i+1])-strtofloat(Eorb_beta[i]);
if AY<0.00001 then AY:=0.00001;
Chart2.Series[0].AddXY(strtofloat(Eorb_beta[i]), log10(10/AY),'');
end;
end; //  if dial=true then begin
//**************************************************


//**************************************************
if dial=false then begin
for i:=0 to ch_mult[Form14.ComboBox1.ItemIndex]-1 do  begin
AY:=strtofloat(Eorb_mult_beta[Form14.ComboBox1.ItemIndex,i+1])-strtofloat(Eorb_mult_beta[Form14.ComboBox1.ItemIndex,i]);
if AY<0.00001 then AY:=0.00001;
Chart1.Series[0].AddXY(strtofloat(Eorb_mult_beta[Form14.ComboBox1.ItemIndex,i]),1/AY,'',clRed);
end;
for i:=0 to ch_mult[Form14.ComboBox1.ItemIndex]-1 do  begin
AY:=strtofloat(Eorb_mult_beta[Form14.ComboBox1.ItemIndex,i+1])-strtofloat(Eorb_mult_beta[Form14.ComboBox1.ItemIndex,i]);
if AY<0.00001 then AY:=0.00001;
Chart2.Series[0].AddXY(strtofloat(Eorb_mult_beta[Form14.ComboBox1.ItemIndex,i]), log10(10/AY),'');
end;
//**************************************************



end;


















end;

procedure TForm17.ALPHA1Click(Sender: TObject);
var i: integer;
    AY: real;
begin
Chart1.Series[0].Clear;
Chart2.Series[0].Clear;

//***************************************
if dial=true then begin
for i:=0 to ch-1 do  begin
AY:=strtofloat(Eorb[i+1])-strtofloat(Eorb[i]);
if AY<0.00001 then AY:=0.00001;
Chart1.Series[0].AddXY(strtofloat(Eorb[i]),1/AY,'',clRed);
end;
for i:=0 to ch-1 do  begin
AY:=strtofloat(Eorb[i+1])-strtofloat(Eorb[i]);
if AY<0.00001 then AY:=0.00001;
Chart2.Series[0].AddXY(strtofloat(Eorb[i]), log10(10/AY),'');
end;
if beta=true then Form17.Beta1.Enabled:=true;
end;  //if dial=true then begin
//**************************************


//**************************************
if dial=false then begin
for i:=0 to ch_mult[Form14.ComboBox1.ItemIndex]-1 do  begin
AY:=strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i+1])-strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i]);
if AY<0.00001 then AY:=0.00001;
Chart1.Series[0].AddXY(strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i]),1/AY,'',clRed);
end;
for i:=0 to ch_mult[Form14.ComboBox1.ItemIndex]-1 do  begin
AY:=strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i+1])-strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i]);
if AY<0.00001 then AY:=0.00001;
Chart2.Series[0].AddXY(strtofloat(Eorb_mult[Form14.ComboBox1.ItemIndex,i]), log10(10/AY),'');
end;
if beta_mult[Form14.ComboBox1.ItemIndex]=true then Form17.Beta1.Enabled:=true;
end; // if dial=false then begin

// ************************************
end;

end.
