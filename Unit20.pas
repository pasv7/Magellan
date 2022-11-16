unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm20 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    OpenDialog1: TOpenDialog;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Splitter1: TSplitter;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  procedure ChB1Click(Sender: TObject);
  procedure ChB2Click(Sender: TObject);
    { Public declarations }
  end;

var
  Form20: TForm20;
  Name_point: array of widestring;
  E_point,EZPE_point,U_point,H_point,G_point: array of real;
  EDN1,EDN2,EDE1,EDE2: array of TEdit;
  ChB1, ChB2: array of TCheckBox;
  nlogs,chkzero: word;
  indexx: word=0;
  k: word=0;
  indi: boolean=false;

implementation

uses Unit21,Unit19;


{$R *.dfm}

procedure TForm20.BitBtn1Click(Sender: TObject);
var f: TextFile;
i,j1,j2,s,posravno,cnt_line,p,j,posi: word;
name_pointA,name_pointB: array of string;
En_pointA,En_pointB: real;
line: widestring;
lntmp: string;
label 1,0;
begin

if Form20.OpenDialog1.Execute=true then begin

if del_pressed=true then begin
if ChB1<>nil then begin
for i:=0 to length(ChB1)-1 do
FreeAndNil(ChB1[i]);
end;
if ChB2<>nil then begin
for i:=0 to length(ChB2)-1 do
FreeAndNil(ChB2[i]);
end;
if EDN1<>nil then begin
for i:=0 to length(EDN1)-1 do
FreeAndNil(EDN1[i]);
end;
if EDN2<>nil then begin
for i:=0 to length(EDN2)-1 do
FreeAndNil(EDN2[i]);
end;
if EDE1<>nil then begin
for i:=0 to length(EDE1)-1 do
FreeAndNil(EDE1[i]);
end;
if EDE2<>nil then begin
for i:=0 to length(EDE2)-1 do
FreeAndNil(EDE2[i]);
end;

ChB1:=nil;
ChB2:=nil;
EDN1:=nil;
EDN2:=nil;
EDE1:=nil;
EDE2:=nil;

end;

del_pressed:=false;


setlength(name_pointA,Form20.OpenDialog1.Files.Count*2);
setlength(name_pointB,Form20.OpenDialog1.Files.Count*2);
setlength(name_point,Form20.OpenDialog1.Files.Count*2);
for i:=0 to length(name_point)-1 do
name_point[i]:='';
for nlogs:=0 to Form20.OpenDialog1.Files.Count-1 do begin


for i:=0 to length(name_pointA)-1 do
name_pointA[i]:='';
for i:=0 to length(name_pointB)-1 do
name_pointB[i]:='';


En_pointA:=0;
En_pointB:=0;
AssignFile(f,Form20.OpenDialog1.Files[nlogs]);
reset(f);
while not Eof(f) do begin
repeat
ReadLn(f,line);
until pos('Reactant',line)<>0;
ReadLn(f,line);
ReadLn(f,line);
if (name_pointA[0]<>'') and (name_pointB[0]<>'') then goto 1;
j1:=0;
while pos('------------------------------',line)=0 do begin
for i:=1 to length(line) do  begin
if line[i]<>' ' then
begin
if pos('.out',line)<>0 then begin
name_pointA[j1]:=copy(line,i,pos('.out',line)-i); // имя реагента
if pos('.log',name_pointA[j1])=0  then  break;
end;
if pos('.log',line)<>0 then begin
name_pointA[j1]:=copy(line,i,pos('.log',line)-i); // имя реагента
if pos('.out',name_pointA[j1])=0  then   break;
end;
break;
end;
if i>5 then break;
if name_pointA[j1]<>'' then break;
end;
// теперь надо найти имя продукта
for s:=i to length(line) do begin
if line[s+length(name_pointA[j1])+5]<>' ' then
begin
if pos('.out',copy(line,s+length(name_pointA[j1])+5,100))<>0 then begin
name_pointB[j1]:=copy(copy(line,s+length(name_pointA[j1])+5,100),1,pos('.out',copy(line,s+length(name_pointA[j1])+5,100))-1); // имя продукта
break;
end;
if pos('.log',copy(line,s+length(name_pointA[j1])+5,100))<>0 then begin
name_pointB[j1]:=copy(copy(line,s+length(name_pointA[j1])+5,100),1,pos('.log',copy(line,s+length(name_pointA[j1])+5,100))-1); // имя продукта
break;
end;
break;
end;
if name_pointB[j1]<>'' then break;
end;




ReadLn(f,line);

j1:=j1+1;


end;
1:
cnt_line:=0;
while pos('---',line)=0 do begin
if pos('=',line)<>0 then begin
for i:=1 to length(line)-pos('=',line) do begin
if line[pos('=',line)+i]<>' ' then begin
lntmp:=copy(line,pos('=',line)+i,pos(' ',copy(line,pos('=',line)+i,100))-1);
//showmessage(lntmp);
En_pointA:=strtofloat(lntmp);
break;
end;  //  if line[pos('=',line)+i]<>' '
end;  //  for i:=1 to length(line)-pos('=',line) do begin
posravno:=pos('=',copy(line,pos(lntmp,line)+length(lntmp)+1,100));


for i:=1 to length(line) do begin
if line[pos(lntmp,line)+length(lntmp)+posravno+i]<>' ' then  begin
lntmp:=copy(line,pos(lntmp,line)+length(lntmp)+posravno+i,100);
En_pointB:=strtofloat(lntmp);
break;
end; //  if line[pos(floattostr(En_pointA),line)+length(floattostr(En_pointA))+i]<>' ' then
end; //  for i:=1 to length(line) do begin

end; //  if pos('=',line)<>0 then begin
setlength(E_point,2*nlogs+2);
setlength(EZPE_point,2*nlogs+2);
setlength(U_point,2*nlogs+2);
setlength(H_point,2*nlogs+2);
setlength(G_point,2*nlogs+2);
if cnt_line=0 then begin
E_point[2*nlogs]:=En_pointA;
E_point[2*nlogs+1]:=En_pointB;
end;
if cnt_line=1 then begin
EZPE_point[2*nlogs]:=En_pointA;
EZPE_point[2*nlogs+1]:=En_pointB;
end;
if cnt_line=2 then begin
U_point[2*nlogs]:=En_pointA;
U_point[2*nlogs+1]:=En_pointB;
end;
if cnt_line=3 then begin
H_point[2*nlogs]:=En_pointA;
H_point[2*nlogs+1]:=En_pointB;
end;
if cnt_line=4 then begin
G_point[2*nlogs]:=En_pointA;
G_point[2*nlogs+1]:=En_pointB;
end;
cnt_line:=cnt_line+1;
ReadLn(f,line);
end; //  while pos('---',line)=0 do begin

if (En_pointB<>0) and (En_pointA<>0)  then break;
end;  // while not Eof(f) do begin


///
///
for i:=0 to length(name_pointA)-1 do  begin
if (name_pointA[i]<>'') and  (Name_point[2*nlogs]<>'') then Name_point[2*nlogs]:=Name_point[2*nlogs]+', '+name_pointA[i];
if (name_pointA[i]<>'') and  (Name_point[2*nlogs]='') then Name_point[2*nlogs]:=Name_point[2*nlogs]+name_pointA[i];
end;
for i:=0 to length(name_pointB)-1 do  begin
if (name_pointB[i]<>'')  and  (Name_point[2*nlogs+1]<>'') then Name_point[2*nlogs+1]:=Name_point[2*nlogs+1]+', '+name_pointB[i];
if (name_pointB[i]<>'')  and  (Name_point[2*nlogs+1]='') then Name_point[2*nlogs+1]:=Name_point[2*nlogs+1]+name_pointB[i];
end;


end;  // for nlogs:=0 to Form20.OpenDialog1.Files.Count-1 do begin

end  // if Form20.OpenDialog1.Execute=true then begin
else goto 0;


posi:=ScrollBox1.VertScrollBar.Position;


setlength(EDN1,2*(nlogs+indexx));
setlength(EDN2,2*(nlogs+indexx));
setlength(EDE1,2*(nlogs+indexx));
setlength(EDE2,2*(nlogs+indexx));
setlength(ChB1,2*(nlogs+indexx));
setlength(ChB2,2*(nlogs+indexx));




if indi=true then begin
if 2*(nlogs+indexx)>k then begin
setlength(EDN1,2*(nlogs+indexx));
setlength(EDN2,2*(nlogs+indexx));
setlength(EDE1,2*(nlogs+indexx));
setlength(EDE2,2*(nlogs+indexx));
setlength(ChB1,2*(nlogs+indexx));
setlength(ChB2,2*(nlogs+indexx));
end
else begin
setlength(EDN1,k);
setlength(EDN2,k);
setlength(EDE1,k);
setlength(EDE2,k);
setlength(ChB1,k);
setlength(ChB2,k);
end;
end;




k:=2*(nlogs+indexx);












ScrollBox1.VertScrollBar.Position:=0; // для устранения разрывов при добавлении новых позиций




p:=0;
for j:=length(EDN1)-1 downto 0 do
if EDN1[j]<>nil then p:=j+1;



for i:=0 to 2*nlogs-1 do  begin





if i/2=round(i/2) then begin
EDN1[i+2*indexx]:=TEdit.Create(self);          //i+2*indexx - раньше
EDE1[i+2*indexx]:=TEdit.Create(self);
EDN1[i+2*indexx].Parent:=ScrollBox1;
EDE1[i+2*indexx].Parent:=ScrollBox1;
//EDN1[i+2*indexx].Name:='EDN1'+inttostr(i)+inttostr(2*indexx);
//EDE1[i+2*indexx].Name:='EDE1'+inttostr(i)+inttostr(2*indexx);
EDN1[i+2*indexx].Left:=23;
EDN1[i+2*indexx].Top:=5+(i+2*indexx)*15;
EDN1[i+2*indexx].Width:=203;
EDN1[i+2*indexx].Text:=Name_point[i];
EDE1[i+2*indexx].Left:=204;
EDE1[i+2*indexx].Top:=5+(i+2*indexx)*15;
EDE1[i+2*indexx].Width:=120;
EDE1[i+2*indexx].Text:=floattostr(E_point[i]);

ChB1[i+2*indexx]:=TCheckBox.Create(self);
ChB1[i+2*indexx].Parent:=ScrollBox1;
//ChB1[i+2*indexx].Name:='ChB1'+inttostr(i)+inttostr(2*indexx);
ChB1[i+2*indexx].Left:=5;
ChB1[i+2*indexx].Width:=15;
ChB1[i+2*indexx].Top:=EDN1[i+2*indexx].Top+Round(EDN1[i+2*indexx].Height/2)-Round(ChB1[i+2*indexx].Height/2);
ChB1[i+2*indexx].OnClick:=ChB1Click;
end;
//end;




if i/2<>round(i/2) then  begin
EDN2[i+2*indexx]:=TEdit.Create(self);
EDE2[i+2*indexx]:=TEdit.Create(self);
EDN2[i+2*indexx].Parent:=ScrollBox1;
EDE2[i+2*indexx].Parent:=ScrollBox1;
//EDN2[i+2*indexx].Name:='EDN2'+inttostr(i)+inttostr(2*indexx);
//EDE2[i+2*indexx].Name:='EDE2'+inttostr(i)+inttostr(2*indexx);
EDN2[i+2*indexx].Left:=Splitter1.Left+Splitter1.Width+23;
EDN2[i+2*indexx].Top:=5+(i+2*indexx-1)*15;
EDN2[i+2*indexx].Width:=203;
EDN2[i+2*indexx].Text:=Name_point[i];
EDE2[i+2*indexx].Left:=Splitter1.Left+Splitter1.Width+204;
EDE2[i+2*indexx].Top:=5+(i+2*indexx-1)*15;
EDE2[i+2*indexx].Width:=120;
EDE2[i+2*indexx].Text:=floattostr(E_point[i]);
ChB2[i+2*indexx]:=TCheckBox.Create(self);
ChB2[i+2*indexx].Parent:=ScrollBox1;
//ChB2[i+2*indexx].Name:='ChB2'+inttostr(i)+inttostr(2*indexx);
ChB2[i+2*indexx].Left:=Splitter1.Left+Splitter1.Width+5;
ChB2[i+2*indexx].Width:=15;
ChB2[i+2*indexx].Top:=EDN2[i+2*indexx].Top+Round(EDN2[i+2*indexx].Height/2)-Round(ChB2[i+2*indexx].Height/2);
ChB2[i+2*indexx].OnClick:=ChB2Click;


end;

end; //    for i:=0 to 2*logs-1 do  begin



if EDN1<>nil then begin
if Checkbox1.Checked then  Label3.Caption:='Отметьте переходы, которые нужно удалить'
else Label3.Caption:='Отметьте стационарную точку, относительно которой будут вычисляться энергии переходов';
end;

indexx:=0;
for i:=0 to length(EDN1)-1 do
if EDN1[i]<>nil then indexx:=indexx+1;

indi:=false;
ScrollBox1.VertScrollBar.Position:=posi;

if (EDN1<>nil) and (CheckBox1.Checked) then BitBtn3.Enabled:=True;

0: end;







procedure TForm20.BitBtn2Click(Sender: TObject);
var i: integer;
begin
for i:=0 to length(EDN1)-1 do begin
FreeAndNil(EDN1[i]);
FreeAndNil(EDE1[i]);
FreeAndNil(ChB1[i]);
end;
for i:=0 to length(EDN2)-1 do begin
FreeAndNil(EDN2[i]);
FreeAndNil(EDE2[i]);
FreeAndNil(ChB2[i]);
end;
indexx:=0;

end;

procedure TForm20.FormShow(Sender: TObject);
begin
Checkbox1.Enabled:=True;
if EDN1<>nil then begin
if checkbox1.Checked then begin
BitBtn3.Enabled:=True;
Label3.Caption:='Отметьте переходы, которые нужно удалить';
end
else begin
BitBtn3.Enabled:=False;
Label3.Caption:='Отметьте стационарную точку, относительно которой будут вычисляться энергии переходов';
end;
end;
end;

procedure TForm20.FormCreate(Sender: TObject);
begin
BitBtn3.Enabled:=False;
Label3.Caption:='';
end;

procedure TForm20.CheckBox1Click(Sender: TObject);
var i: integer;
begin
if EDN1<>nil then begin
if checkbox1.Checked then begin
BitBtn3.Enabled:=True;
Label3.Caption:='Отметьте переходы, которые нужно удалить';
end
else begin
BitBtn3.Enabled:=False;
Label3.Caption:='Отметьте стационарную точку, относительно которой будут вычисляться энергии переходов';
if ChB1<>nil then begin
for i:=0 to  length(ChB1)-1 do
if i/2=Round(i/2) then ChB1[i].Checked:=False;
end;
if ChB2<>nil then begin
for i:=0 to  length(ChB2)-1 do
if i/2<>Round(i/2) then ChB2[i].Checked:=False;
end;





end;
end;
if EDN1=nil then BitBtn3.Enabled:=False;

end;






procedure TForm20.ChB1Click(Sender: TObject);
var i,s1,s2: word;
begin
s1:=0;
s2:=0;
if CheckBox1.Checked=False  then begin

for i:=0 to length(ChB1)-1 do begin
if ChB1[i]<>nil then  begin
s2:=s2+1;
if  ChB1[i].Checked=False then begin
s1:=s1+1;
ChB1[i].Enabled:=False;
end;
end;
end;





for i:=0 to length(ChB2)-1 do begin
if ChB2[i]<>nil then  begin
if  ChB2[i].Enabled=True  then  ChB2[i].Enabled:=False;
end;
end;



if s1=s2 then begin
CheckBox1.Enabled:=True;
for i:=0 to length(ChB1)-1 do
if ChB1[i]<>nil then ChB1[i].Enabled:=True;
for i:=0 to length(ChB2)-1 do
if ChB2[i]<>nil then ChB2[i].Enabled:=True;
end;
if s1<>s2 then CheckBox1.Enabled:=False;

end;





if CheckBox1.Checked=True  then begin // то есть чекбокс активация удаления включена
for i:=0 to length(ChB1)-1 do begin
if ChB1[i]<>nil then  begin
if  ChB1[i].Checked=True then ChB2[i+1].Checked:=True;
if  ChB1[i].Checked=False then ChB2[i+1].Checked:=false;
end;
end;
end;



end;











procedure TForm20.ChB2Click(Sender: TObject);
var i,s1,s2: word;
begin
if CheckBox1.Checked=False then begin

for i:=0 to length(ChB2)-1 do begin
if ChB2[i]<>nil then  begin
s2:=s2+1;
if  ChB2[i].Checked=False then begin
s1:=s1+1;
ChB2[i].Enabled:=False;
end;
end;
end;




for i:=0 to length(ChB1)-1 do begin
if ChB1[i]<>nil then  begin
if  ChB1[i].Enabled=True  then  ChB1[i].Enabled:=False;
end;
end;

if s1=s2 then begin
CheckBox1.Enabled:=True;
for i:=0 to length(ChB2)-1 do
if ChB2[i]<>nil then ChB2[i].Enabled:=True;
for i:=0 to length(ChB1)-1 do
if ChB1[i]<>nil then ChB1[i].Enabled:=True;
end;
if s1<>s2 then CheckBox1.Enabled:=False;




end;





if CheckBox1.Checked=True  then begin // то есть чекбокс активация удаления включена
for i:=0 to length(ChB2)-1 do begin
if ChB2[i]<>nil then  begin
if  ChB2[i].Checked=True then ChB1[i-1].Checked:=True;
if  ChB2[i].Checked=False then ChB1[i-1].Checked:=false;
end;
end;
end;







end;

















procedure TForm20.BitBtn3Click(Sender: TObject);
var i,s,n,m,posi: word;
EDTEMPN1,EDTEMPE1,EDTEMPN2,EDTEMPE2: array of TEdit;
ChBTEMP1,ChBTEMP2 : array of TCheckBox;
empt_b: boolean;
label 0;
begin
posi:=ScrollBox1.VertScrollBar.Position;
if length(EDN1)=0 then goto 0;
for i:=0 to length(EDN1)-1 do begin
if ChB1<>nil then begin
if ChB1[i]<>nil then begin
if ChB1[i].Checked=True then begin
FreeAndNil(EDN1[i]);
FreeAndNil(EDE1[i]);
FreeAndNil(ChB1[i]);
FreeAndNil(EDN2[i+1]);
FreeAndNil(EDE2[i+1]);
FreeAndNil(ChB2[i+1]);
end;
end;
end;
end;

ScrollBox1.VertScrollBar.Position:=0;;


s:=0;
for i:=0 to length(EDN1)-1 do begin
if EDN1[i]<>nil then  begin
EDN1[i].Top:=5+s*30;
EDE1[i].Top:=5+s*30;
EDN2[i+1].Top:=5+s*30;
EDE2[i+1].Top:=5+s*30;
ChB1[i].Top:=EDN1[i].Top+Round(EDN1[i].Height/2)-Round(ChB1[i].Height/2);
ChB2[i+1].Top:=EDN2[i+1].Top+Round(EDN2[i+1].Height/2)-Round(ChB2[i+1].Height/2);
s:=s+1;
end;
end;

empt_b:=false;

if EDN1<>nil then begin
  for i:=0 to length(EDN1)-1 do
if EDN1[i]<>nil then empt_b:=true;    
if empt_b=false then BitBtn3.Enabled:=False;
end;


indexx:=s;

//удаление пустых элементов не на своих местах

setlength(EDTEMPN1,2*s);
setlength(EDTEMPE1,2*s);
setlength(EDTEMPN2,2*s);
setlength(EDTEMPE2,2*s);
setlength(ChBTEMP1,2*s);
setlength(ChBTEMP2,2*s);




//for i:=0 to 2*s-1 do begin
//EDTEMPN1[i]:=TEdit.Create(nil);
//EDTEMPE1[i]:=TEdit.Create(nil);
//end;
n:=0;
m:=0;
for i:=0 to length(EDN1)-1 do begin
if i/2=round(i/2) then  begin
if EDN1[i]<>nil then  begin
EDTEMPN1[2*n]:=TEdit.Create(nil);
EDTEMPE1[2*n]:=TEdit.Create(nil);
ChBTEMP1[2*n]:=TCheckBox.Create(nil);
EDTEMPN1[2*n]:=EDN1[i];
EDTEMPE1[2*n]:=EDE1[i];
ChBTEMP1[2*n]:=ChB1[i];
n:=n+1;
end;
end;

if i/2<>round(i/2) then  begin
if EDN2[i]<>nil then  begin
EDTEMPN2[2*m+1]:=TEdit.Create(nil);
EDTEMPE2[2*m+1]:=TEdit.Create(nil);
ChBTEMP2[2*m+1]:=TCheckBox.Create(nil);
EDTEMPN2[2*m+1]:=EDN2[i];
EDTEMPE2[2*m+1]:=EDE2[i];
ChBTEMP2[2*m+1]:=ChB2[i];
m:=m+1;
end;
end;

end;









setlength(EDN1,2*s);
setlength(EDN2,2*s);
setlength(EDE1,2*s);
setlength(EDE2,2*s);
setlength(ChB1,2*s);
setlength(ChB2,2*s);

if length(EDN1)= 0 then goto 0;

for i:=0 to length(EDN1)-1 do begin
EDN1[i]:=EDTEMPN1[i];
EDE1[i]:=EDTEMPE1[i];
EDN2[i]:=EDTEMPN2[i];
EDE2[i]:=EDTEMPE2[i];
ChB1[i]:=ChBTEMP1[i];
ChB2[i]:=ChBTEMP2[i];
end;

indexx:=s;
indi:=true;
//for i:=0 to 2*s-1 do
//EDN1[i]:=EDTEMP[i];








ScrollBox1.VertScrollBar.Position:=posi;


0: end;

procedure TForm20.BitBtn4Click(Sender: TObject);
var i: word;
label 0;
begin


EDst1:=nil;
EDst2:=nil;
EDst3:=nil;
EDst4:=nil;
EDst5:=nil;
EDst6:=nil;
EDst7:=nil;
EDst8:=nil;
EDst9:=nil;
EDst10:=nil;
EDst11:=nil;
EDst12:=nil;
EDst13:=nil;
EDst14:=nil;
EDst15:=nil;
CBst1:=nil;
CBst2:=nil;
CBst3:=nil;
CBst4:=nil;
CBst5:=nil;
CBst6:=nil;
CBst7:=nil;
CBst8:=nil;
CBst9:=nil;
CBst10:=nil;
CBst11:=nil;
CBst12:=nil;
CBst13:=nil;
CBst14:=nil;
CBst15:=nil;
CBst16:=nil;
CBst17:=nil;
CBst18:=nil;
CBst19:=nil;
CBst20:=nil;
CBst21:=nil;
CBst22:=nil;
ClBst1:=nil;
ClBst2:=nil;
ClBst3:=nil;
ClBst4:=nil;
ClBst5:=nil;
ClBst6:=nil;
LB:=nil;
LB1:=nil;
EDx1:=nil;
EDx2:=nil;
EDx3:=nil;
EDx4:=nil;
EDy1:=nil;
EDy2:=nil;
EDy3:=nil;
EDy4:=nil;
ChB3:=nil;





if length(ChB1)=0 then goto 0;
for i:=0 to length(ChB1)-1 do  begin
if ChB1[i]<>nil then begin
if ChB1[i].Checked=true then  chkzero:=i;
end;
end;

if length(ChB2)=0 then goto 0;
for i:=0 to length(ChB2)-1 do  begin
if ChB2[i]<>nil then begin
if ChB2[i].Checked=true then  chkzero:=i;
end;
end;
pos2:=false;
Form21.Show;
Form20.Close;



0: end;

procedure TForm20.FormClose(Sender: TObject; var Action: TCloseAction);
var i: integer;
begin
for i:=0 to length(EDN1)-1 do begin
FreeAndNil(EDN1[i]);
FreeAndNil(EDN2[i]);
FreeAndNil(EDE1[i]);
FreeAndNil(EDE2[i]);
FreeAndNil(ChB1[i]);
FreeAndNil(ChB2[i]);
end;
setlength(EDN1,0);
setlength(EDN2,0);
setlength(EDE1,0);
setlength(ChB1,0);
setlength(ChB2,0);
i:=0;
indexx:=0;

end;

end.
