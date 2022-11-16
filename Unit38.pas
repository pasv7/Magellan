unit Unit38;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TForm38 = class(TForm)
    ListView1: TListView;
    procedure FormShow(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form38: TForm38;

implementation

uses Unit1,Unit37,Unit24 ;

{$R *.dfm}

procedure TForm38.FormShow(Sender: TObject);
var itm: TListItem;
i,k,t,ind1,ind2: Integer;
probel: string;
label 0;
begin
  ListView1.Clear;
  t:=0;
  probel:='                   ';
  Form38.Caption:='IRC (Подробнее) :: '+ Form37.ComboBox1.Text;
  if Dial=True then begin
  k:=0;
  for i:=0 to Length(energy_irc_path1)-1 do begin
  itm:=ListView1.Items.Add;
  if step_irc_path1[i]<>'' then  begin
  itm.Caption:=copy(probel,0,8-length(step_irc_path1[i]))+step_irc_path1[i];
  if k=0 then k:=1 else k:=k+1;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(k)))+inttostr(k));
  k:=0;
  end;
  if step_irc_path1[i]='' then begin
  itm.Caption:='';
  k:=k+1;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(k)))+inttostr(k));
  end;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(i+1)))+inttostr(i+1));
  if (step_irc_path1[i]<>'') and (i>0) then begin
  if Rx[t]<>-1 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(Rx[t])))+floattostr(Rx[t]))
  else  itm.SubItems.Append(copy(probel,0,14-length(floattostr(Rx[t])))+'Unknown');
  t:=t+1;
  end;
  if i=0 then itm.SubItems.Append(copy(probel,0,11)+'0');
  if (step_irc_path1[i]='') and (i>0) then itm.SubItems.Append(copy(probel,0,12)+'>>');
  itm.SubItems.Append(copy(probel,0,16-length(energy_irc_path1[i]))+energy_irc_path1[i]);
  if i>0 then   itm.SubItems.Append(copy(probel,0,16-length(floattostrf((strtofloat(energy_irc_path1[i])-strtofloat(energy_irc_path1[i-1]))*27.21*23.06,ffFixed,5,4)))+ floattostrf((strtofloat(energy_irc_path1[i])-strtofloat(energy_irc_path1[i-1]))*27.21*23.06,ffFixed,5,4))
  else itm.SubItems.Append(copy(probel,0,13)+'-');
  if i>0 then   itm.SubItems.Append( copy(probel,0,14-length(floattostrf((strtofloat(energy_irc_path1[i])-strtofloat(energy_irc_path1[0]))*27.21*23.06,ffFixed,5,4)))+ floattostrf((strtofloat(energy_irc_path1[i])-strtofloat(energy_irc_path1[0]))*27.21*23.06,ffFixed,5,4))
  else  itm.SubItems.Append(copy(probel,0,11)+'0');
  if i>0 then  begin
  if ((direction1='Forward') and (direction2='Reverse')) or ((direction1='Forward') and (direction2=''))  then itm.SubItems.Append(copy(probel,0,5)+'Forward');
  if (direction1='') and (direction2='Reverse')  then itm.SubItems.Append(copy(probel,0,5)+'Reverse');
  if (direction1='') and (direction2='')  then itm.SubItems.Append(copy(probel,0,5)+'Downhill');
  end
  else  begin
  if (direction1<>'') or (direction2<>'') then itm.SubItems.Append(copy(probel,0,8)+'TS');
  if (direction1='') and (direction2='')  then itm.SubItems.Append(copy(probel,0,5)+'Downhill');
  end;
  end;

  ind1:=t;
  ind2:=i;
  t:=0;

    if energy_irc_path2=nil then goto 0;
    if energy_irc_path2[0]='' then goto 0;
  k:=0;
  for i:=0 to Length(energy_irc_path2b)-1 do begin
  itm:=ListView1.Items.Add;
  if step_irc_path2[i]<>'' then  begin
  itm.Caption:=copy(probel,0,8-length(step_irc_path2[i]))+step_irc_path2[i];
  if k=0 then k:=1 else k:=k+1;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(k)))+inttostr(k));
  k:=0;
  end;
  if step_irc_path2[i]='' then begin
  itm.Caption:='';
  k:=k+1;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(k)))+inttostr(k));
  end;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(ind2+i+1)))+inttostr(ind2+i+1));
  if step_irc_path2[i]<>'' then begin
  if Rx[ind1+t]<>-1 then itm.SubItems.Append(copy(probel,0,14-length(floattostr(Rx[ind1+t])))+floattostr(Rx[ind1+t]))
  else itm.SubItems.Append(copy(probel,0,14-length(floattostr(Rx[ind1+t])))+'Unknown');
  t:=t+1;
  end;
  if (step_irc_path2[i]='') and (i>=0) then itm.SubItems.Append(copy(probel,0,12)+'>>');
  itm.SubItems.Append(copy(probel,0,16-length(energy_irc_path2b[i]))+energy_irc_path2b[i]);
  if i>0 then   itm.SubItems.Append(copy(probel,0,16-length(floattostrf((strtofloat(energy_irc_path2b[i])-strtofloat(energy_irc_path2b[i-1]))*27.21*23.06,ffFixed,5,4)))+ floattostrf((strtofloat(energy_irc_path2b[i])-strtofloat(energy_irc_path2b[i-1]))*27.21*23.06,ffFixed,5,4))
  else itm.SubItems.Append(copy(probel,0,13)+'-');
  itm.SubItems.Append( copy(probel,0,14-length(floattostrf((strtofloat(energy_irc_path2b[i])-strtofloat(energy_irc_path1[0]))*27.21*23.06,ffFixed,5,4)))+ floattostrf((strtofloat(energy_irc_path2b[i])-strtofloat(energy_irc_path1[0]))*27.21*23.06,ffFixed,5,4));
  if (direction1='Forward') and (direction2='Reverse')  then itm.SubItems.Append(copy(probel,0,5)+'Reverse');
  if ((direction1='') and (direction2='Reverse'))  then itm.SubItems.Append(copy(probel,0,5)+'Reverse');





  end;

end


//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////



  else begin         //Если открыто множество файлов
  k:=0;
  for i:=0 to Length(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex]])-1 do begin
  if energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]='' then Break;
  itm:=ListView1.Items.Add;
  if step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]<>'' then  begin
  itm.Caption:=copy(probel,0,8-length(step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]))+step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i];
  if k=0 then k:=1 else k:=k+1;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(k)))+inttostr(k));
  k:=0;
  end;
  if step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]='' then begin
  itm.Caption:='';
  k:=k+1;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(k)))+inttostr(k));
  end;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(i+1)))+inttostr(i+1));
  if (step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]<>'') and (i>0) then begin
  if Rx_mult[basket[Form37.ComboBox1.ItemIndex],t]<>-1 then  itm.SubItems.Append(copy(probel,0,14-length(floattostr(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t])))+floattostr(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t]))
  else  itm.SubItems.Append(copy(probel,0,14-length(floattostr(Rx_mult[basket[Form37.ComboBox1.ItemIndex],t])))+'Unknown');
  t:=t+1;
  end;
  if i=0 then itm.SubItems.Append(copy(probel,0,11)+'0');
  if (step_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]='') and (i>0) then itm.SubItems.Append(copy(probel,0,12)+'>>');
  itm.SubItems.Append(copy(probel,0,16-length(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]))+energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i]);
  if i>0 then   itm.SubItems.Append(copy(probel,0,16-length(floattostrf((strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i-1]))*27.21*23.06,ffFixed,5,4)))+ floattostrf((strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i-1]))*27.21*23.06,ffFixed,5,4))
  else itm.SubItems.Append(copy(probel,0,13)+'-');
  if i>0 then   itm.SubItems.Append( copy(probel,0,14-length(floattostrf((strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*27.21*23.06,ffFixed,5,4)))+ floattostrf((strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],i])-strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*27.21*23.06,ffFixed,5,4))
  else  itm.SubItems.Append(copy(probel,0,11)+'0');
  if i>0 then  begin
  if ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='Reverse')) or ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]=''))  then itm.SubItems.Append(copy(probel,0,5)+'Forward');
  if ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='Reverse'))  then itm.SubItems.Append(copy(probel,0,5)+'Reverse');
  if ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]=''))  then  itm.SubItems.Append(copy(probel,0,5)+'Downhill');
  end
  else  begin
  if ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]<>'') or (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]<>''))  then itm.SubItems.Append(copy(probel,0,8)+'TS');
  if ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]=''))  then  itm.SubItems.Append(copy(probel,0,5)+'Downhill');
  end;
  end;

  ind1:=t;
  ind2:=i;
  t:=0;

    if energy_mult_irc_path2=nil then goto 0;
    if energy_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex]]=nil then goto 0;
    if energy_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],0]='' then goto 0;
    k:=0;
  for i:=0 to Length(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex]])-1 do begin
    if energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i]='' then Break;
  itm:=ListView1.Items.Add;
  if step_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],i]<>'' then  begin
  itm.Caption:=copy(probel,0,8-length(step_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],i]))+step_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],i];
  if k=0 then k:=1 else k:=k+1;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(k)))+inttostr(k));
  k:=0;
  end;
  if step_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],i]='' then begin
  itm.Caption:='';
  k:=k+1;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(k)))+inttostr(k));
  end;
  itm.SubItems.Append(copy(probel,0,8-length(IntToStr(ind2+i+1)))+inttostr(ind2+i+1));
  if step_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],i]<>'' then begin
  if Rx_mult[basket[Form37.ComboBox1.ItemIndex],ind1+t]<>-1 then  itm.SubItems.Append(copy(probel,0,14-length(floattostr(Rx_mult[basket[Form37.ComboBox1.ItemIndex],ind1+t])))+floattostr(Rx_mult[basket[Form37.ComboBox1.ItemIndex],ind1+t]))
  else itm.SubItems.Append(copy(probel,0,14-length(floattostr(Rx_mult[basket[Form37.ComboBox1.ItemIndex],ind1+t])))+'Unknown');
  t:=t+1;
  end;
  if (step_mult_irc_path2[basket[Form37.ComboBox1.ItemIndex],i]='') and (i>=0) then itm.SubItems.Append(copy(probel,0,12)+'>>');
  itm.SubItems.Append(copy(probel,0,16-length(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i]))+energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i]);
  if i>0 then   itm.SubItems.Append(copy(probel,0,16-length(floattostrf((strtofloat(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i])-strtofloat(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i-1]))*27.21*23.06,ffFixed,5,4)))+ floattostrf((strtofloat(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i])-strtofloat(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i-1]))*27.21*23.06,ffFixed,5,4))
  else itm.SubItems.Append(copy(probel,0,13)+'-');
  itm.SubItems.Append( copy(probel,0,14-length(floattostrf((strtofloat(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i])-strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*27.21*23.06,ffFixed,5,4)))+ floattostrf((strtofloat(energy_mult_irc_path2b[basket[Form37.ComboBox1.ItemIndex],i])-strtofloat(energy_mult_irc_path1[basket[Form37.ComboBox1.ItemIndex],0]))*27.21*23.06,ffFixed,5,4));
  if (direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='Forward') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='Reverse')  then itm.SubItems.Append(copy(probel,0,5)+'Reverse');
  if ((direction1_mult[basket[Form37.ComboBox1.ItemIndex]]='') and (direction2_mult[basket[Form37.ComboBox1.ItemIndex]]='Reverse'))  then itm.SubItems.Append(copy(probel,0,5)+'Reverse');

  end;

end;

0: end;






















procedure TForm38.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
if Item.Index=0 then  begin
Sender.Canvas.Font.Style:=[fsBold];
Sender.Canvas.Brush.Color:=clSkyBlue;
end;
if Item.Index>0 then begin
Sender.Canvas.Font.Style:=[];
if pos('Forward',ListView1.Items[Item.Index].Subitems[6])<>0 then Sender.Canvas.Brush.Color:=clYellow;         //       Font.Color:=clGreen;
//if ListView1.Items[Item.Index].Caption<>'' then Sender.Canvas.Font.Color:=clGreen;
if pos('Reverse',ListView1.Items[Item.Index].Subitems[6])<>0 then Sender.Canvas.Brush.Color:=clLime;          //       Font.Color:=clRed;
if pos('Downhill',ListView1.Items[Item.Index].Subitems[6])<>0 then Sender.Canvas.Brush.Color:=clWhite;
end;
end;

end.
