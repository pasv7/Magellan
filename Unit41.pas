unit Unit41;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm41 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form41: TForm41;

implementation

uses Unit1, Unit37, Unit24;

{$R *.dfm}

procedure TForm41.FormShow(Sender: TObject);
var i,t: Integer;
begin
  Series1.Clear;
  Chart1.Title.Text.Clear;
  Chart1.Title.Visible:=True;
  //Chart1.Title.Text.Add('IRC for '+copy(Form37.Label2.Caption, Pos(':',Form37.Label2.Caption)+2,500));
 if Dial=True then begin
  if (direction1<>'') or (direction2<>'') then Chart1.Title.Text.Append('IRC for '+copy(Form37.Label2.Caption, Pos(':',Form37.Label2.Caption)+2,500));
  if (direction1='') and (direction2='') then Chart1.Title.Text.Append('Downhill for '+copy(Form37.Label2.Caption, Pos(':',Form37.Label2.Caption)+2,500));
  t:=0;
  if (energy_irc_path1<>nil) and (energy_irc_path2=nil) then begin
  Series1.AddXY(0,0,'',clBlack);
  for i:=1 to Length(step_irc_path1)-1 do begin
    if Rx[t]=-1 then Break;
  if step_irc_path1[i]<>'' then  begin
  if ((direction1='Forward') and (direction2='Reverse')) or  ((direction1='Forward') and (direction2='')) then Series1.AddXY(Rx[t],(StrToFloat(energy_irc_path1[i])-StrToFloat(energy_irc_path1[0]))*23.06*27.21,'',clRed);
  if (direction1='') and (direction2='Reverse') then Series1.AddXY(-Rx[t],(StrToFloat(energy_irc_path1[i])-StrToFloat(energy_irc_path1[0]))*23.06*27.21,'',clBlue);
  if (direction1='') and (direction2='') then  Series1.AddXY(Rx[t],(StrToFloat(energy_irc_path1[i])-StrToFloat(energy_irc_path1[0]))*23.06*27.21,'',RGB(255,0,166));
  t:=t+1;
  end;
end;
end;

if (energy_irc_path1<>nil) and (energy_irc_path2<>nil) then begin
Series1.AddXY(0,0,'',clBlack);
  for i:=1 to Length(step_irc_path1)-1 do begin
  if step_irc_path1[i]<>'' then  begin
  Series1.AddXY(Rx[t],(StrToFloat(energy_irc_path1[i])-StrToFloat(energy_irc_path1[0]))*23.06*27.21,'',clRed);
  t:=t+1;
  end;
end;

for i:=0 to Length(energy_irc_path2b)-1 do begin
  if Rx[t]=-1 then Break;
  if step_irc_path2[i]<>'' then  begin
  if  Rx[t]>0 then  Series1.AddXY(-Rx[t],(StrToFloat(energy_irc_path2b[i])-StrToFloat(energy_irc_path1[0]))*23.06*27.21,'',clBlue)
  else  Series1.AddXY(Rx[t],(StrToFloat(energy_irc_path2b[i])-StrToFloat(energy_irc_path1[0]))*23.06*27.21,'',clBlue);
  t:=t+1;
  end;
end;
end;
end;

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

if Dial=False then begin
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]<>'') or (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]<>'') then Chart1.Title.Text.Append('IRC for '+copy(Form37.Label2.Caption, Pos(':',Form37.Label2.Caption)+2,500));
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='') then Chart1.Title.Text.Append('Downhill for '+copy(Form37.Label2.Caption, Pos(':',Form37.Label2.Caption)+2,500));
  t:=0;
  if (energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex]]<>nil) and (energy_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex]]=nil) then begin
  Series1.AddXY(0,0,'',clBlack);
  for i:=1 to Length(step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex]])-1 do begin
  if Rx_mult[basket[Form37.ComboBox1.ItemIndex],t]=-1 then Break;
  if step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]<>'' then  begin
  if ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='Reverse')) or  ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='')) then Series1.AddXY(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',clRed);
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='Reverse') then Series1.AddXY(-Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',clBlue);
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='') then  Series1.AddXY(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',RGB(255,0,166));
  t:=t+1;
  end;
end;
end;

  if (energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex]]<>nil) and (energy_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex]]<>nil) then begin
  if energy_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],0]='' then begin
  Series1.AddXY(0,0,'',clBlack);
  for i:=1 to Length(step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex]])-1 do begin
  if Rx_mult[basket[Form37.ComboBox1.ItemIndex],t]=-1 then Break;
  if step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]<>'' then  begin
  if ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='Reverse')) or  ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='')) then Series1.AddXY(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',clRed);
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='Reverse') then Series1.AddXY(-Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',clBlue);
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='') then  Series1.AddXY(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',RGB(255,0,166));
  t:=t+1;
  end;
end;
end;
end;


if (energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex]]<>nil) and (energy_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex]]<>nil) then begin
Series1.AddXY(0,0,'',clBlack);
if energy_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],0]<>'' then begin
  for i:=1 to Length(step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex]])-1 do begin
  if Rx_mult[basket[Form37.ComboBox1.ItemIndex],t]=-1 then Break;
  if step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]<>'' then  begin
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]<>'') or (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]<>'') then Series1.AddXY(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',clRed);
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='') then Series1.AddXY(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',RGB(255,0,166));
  t:=t+1;
  end;
end;
end;

if energy_mult_irc_path2b<>nil then begin
if energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex]]<>nil then begin
for i:=0 to Length(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex]])-1 do
if energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],Length(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex]])-1-i]<>'' then Break;

for i:=0 to Length(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex]])-1-i do begin
  if Rx_mult[basket[Form37.ComboBox1.ItemIndex],t]=-1 then Break;
  if step_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],i]<>'' then  begin
  if  Rx_mult[basket[Form37.ComboBox1.ItemIndex],t]>0 then  Series1.AddXY(-Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',clBlue)
  else  Series1.AddXY(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t],(StrToFloat(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i])-StrToFloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*23.06*27.21,'',clBlue);
  t:=t+1;
  end;
end;
end;
end;
end;
end;















end;

end.
