unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, ComCtrls, Menus, ExtCtrls, math,
  ComObj, OleServer, WordXP, ActiveX, pngimage;

type
  TForm11 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    Label1: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label6: TLabel;
    Timer1: TTimer;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    SaveDialog1: TSaveDialog;
    WordDocument1: TWordDocument;
    WordApplication1: TWordApplication;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  { procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
    Rect: TRect; State: TOwnerDrawState);    }
  { procedure FormPaint(Sender: TObject);    }
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
  { procedure ListBox2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);  }
    procedure N2Click(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ListBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  nfr,nfp,sc: integer;
  energy_reagent,energy_product,en_r,en_p,                           e_plus_zpe_r,U_en_r,H_en_r,G_en_r,E_term_r,C_r,Entr_r,   e_plus_zpe_p,U_en_p,H_en_p,G_en_p,E_term_p,C_p,Entr_p,                     e_plus_zpe_r_en,U_en_r_en,H_en_r_en,G_en_r_en,E_term_r_en,C_r_en,Entr_r_en,   e_plus_zpe_p_en,U_en_p_en,H_en_p_en,G_en_p_en,E_term_p_en,C_p_en,Entr_p_en          : array of string;
  test,clc: boolean;
  numi,numj,ND1,ND2: array[0..100] of integer;
  Etot,EZPE,U,H,G,Cv,Et,S1: real;
  summ1,summ2,summ_e_zpe_r,summ_u_r,summ_h_r,summ_g_r,summ_e_term_r,summ_c_r,summ_entr_r,  summ_e_zpe_p,summ_u_p,summ_h_p,summ_g_p,summ_e_term_p,summ_c_p,summ_entr_p: real;
  Normal_termination_r,N_termination_r: array of boolean;
  Normal_termination_p,N_termination_p: array of boolean;
  //ss: integer=0;


implementation

uses Unit1;

{$R *.dfm}



procedure TForm11.BitBtn1Click(Sender: TObject);
var f: TextFile;
str: widestring;
itm: TListItem;
i: integer;
therm_r: boolean;
label 0;
begin
Form11.OpenDialog1.Options:= [ofAllowMultiSelect];    //открыть несколько файлов
Form11.OpenDialog2.Options:= [ofAllowMultiSelect];    //открыть несколько файлов


/////////ДИАЛОГ "РЕАГЕНТЫ"////////////////////////////
if Form11.OpenDialog1.Execute=true then begin
for nfr:=0 to Form11.OpenDialog1.Files.Count-1 do begin
Application.ProcessMessages;
energy_reagent:=nil;
e_plus_zpe_r:=nil;
U_en_r:=nil;
H_en_r:=nil;
G_en_r:=nil;
E_term_r:=nil;
C_r:=nil;
Entr_r:=nil;
therm_r:=false;
Normal_termination_r:=nil;

Form1.Statusbar1.Panels[0].Text:='Termochemistry';
AssignFile(f,Form11.OpenDialog1.Files[nfr]);
reset(f);
while not Eof(f) do begin
ReadLn(f,str);
setlength(Normal_termination_r,nfr+1);
if pos('Normal termination of Gaussian',str)<>0 then
Normal_termination_r[nfr]:=true;
if copy(str,2,8)='SCF Done' then begin
setlength(energy_reagent,nfr+1);
energy_reagent[nfr]:=copy(str,pos('=',str)+3,pos('A.U.',str)-pos('=',str)-8);          // E
end;
if pos('Sum of electronic and zero-point Energies',str)<>0 then begin
setlength(e_plus_zpe_r,nfr+1);
e_plus_zpe_r[nfr]:=copy(copy(str,pos('=',str),100), pos('-',copy(str,pos('=',str),100)), 20);  // E+ZPE
end;
if pos('Sum of electronic and thermal Energies',str)<>0 then begin
setlength(U_en_r,nfr+1);
U_en_r[nfr]:=copy(copy(str,pos('=',str),100), pos('-',copy(str,pos('=',str),100)), 20);  // U
end;
if pos('Sum of electronic and thermal Enthalpies',str)<>0 then begin
setlength(H_en_r,nfr+1);
H_en_r[nfr]:=copy(copy(str,pos('=',str),100), pos('-',copy(str,pos('=',str),100)), 20);  // H
end;
if pos('Sum of electronic and thermal Free Energies',str)<>0 then begin
therm_r:=true;
setlength(G_en_r,nfr+1);
G_en_r[nfr]:=copy(copy(str,pos('=',str),100), pos('-',copy(str,pos('=',str),100)), 20);  // G
end;
if pos('Total          ',str)<>0 then begin
setlength(E_term_r,nfr+1);
setlength(C_r,nfr+1);
setlength(Entr_r,nfr+1);
for i:=0 to 1000 do begin
if copy(str,i+12,1)<>' ' then  begin
E_term_r[nfr]:=copy(str,i+12,pos(' ',copy(str,i+12,20))-1);                             // Eterm
break;
end;
end;
for i:=0 to 1000 do begin
if copy(str,pos(E_term_r[nfr],str)+length(E_term_r[nfr])+2+i,1)<>' ' then  begin
C_r[nfr]:=copy(str,pos(E_term_r[nfr],str)+length(E_term_r[nfr])+2+i, pos(' ',copy(str,pos(E_term_r[nfr],str)+length(E_term_r[nfr])+2+i,20))-1 );   // C
break;
end;
end;
for i:=0 to 1000 do begin
if copy(str,pos(C_r[nfr],str)+length(C_r[nfr])+2+i,1)<>' ' then  begin
Entr_r[nfr]:=copy(str,pos(C_r[nfr],str)+length(C_r[nfr])+2+i, 20 );                         // S
break;
end;
end;









end;


//end;

//end;














end;
CloseFile(f);
////////////КОНЕЦ ДИАЛОГА "РЕАГЕНТЫ"//////////////////


if energy_reagent=nil then begin
showmessage('Файл '+Form11.OpenDialog1.Files[nfr]+' не содержит информации о полной энергии');
goto 0;
end;



Form11.ListBox1.Items.Add('    '+Form11.OpenDialog1.Files[nfr]);
setlength(en_r,Form11.ListBox1.Items.Count);
en_r[Form11.ListBox1.Items.Count-1]:=energy_reagent[nfr];
setlength(N_termination_r,Form11.ListBox1.Items.Count);
N_termination_r[Form11.ListBox1.Items.Count-1]:=Normal_termination_r[nfr];


if therm_r=true then begin
setlength(e_plus_zpe_r_en,Form11.ListBox1.Items.Count);
setlength(U_en_r_en,Form11.ListBox1.Items.Count);
setlength(H_en_r_en,Form11.ListBox1.Items.Count);
setlength(G_en_r_en,Form11.ListBox1.Items.Count);
setlength(E_term_r_en,Form11.ListBox1.Items.Count);
setlength(C_r_en,Form11.ListBox1.Items.Count);
setlength(Entr_r_en,Form11.ListBox1.Items.Count);
e_plus_zpe_r_en[Form11.ListBox1.Items.Count-1]:=e_plus_zpe_r[nfr];
U_en_r_en[Form11.ListBox1.Items.Count-1]:=U_en_r[nfr];
H_en_r_en[Form11.ListBox1.Items.Count-1]:=H_en_r[nfr];
G_en_r_en[Form11.ListBox1.Items.Count-1]:=G_en_r[nfr];
E_term_r_en[Form11.ListBox1.Items.Count-1]:=E_term_r[nfr];
C_r_en[Form11.ListBox1.Items.Count-1]:=C_r[nfr];
Entr_r_en[Form11.ListBox1.Items.Count-1]:=Entr_r[nfr];
end;



if therm_r=false then begin
setlength(e_plus_zpe_r_en,Form11.ListBox1.Items.Count);
setlength(U_en_r_en,Form11.ListBox1.Items.Count);
setlength(H_en_r_en,Form11.ListBox1.Items.Count);
setlength(G_en_r_en,Form11.ListBox1.Items.Count);
setlength(E_term_r_en,Form11.ListBox1.Items.Count);
setlength(C_r_en,Form11.ListBox1.Items.Count);
setlength(Entr_r_en,Form11.ListBox1.Items.Count);
e_plus_zpe_r_en[Form11.ListBox1.Items.Count-1]:='';
U_en_r_en[Form11.ListBox1.Items.Count-1]:='';
H_en_r_en[Form11.ListBox1.Items.Count-1]:='';
G_en_r_en[Form11.ListBox1.Items.Count-1]:= '';
E_term_r_en[Form11.ListBox1.Items.Count-1]:='';
C_r_en[Form11.ListBox1.Items.Count-1]:='';
Entr_r_en[Form11.ListBox1.Items.Count-1]:='';
end;




therm_r:=false;


BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;

Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;

0: end;
end;







end;

procedure TForm11.BitBtn2Click(Sender: TObject);
var f: TextFile;
str: widestring;
i: integer;
therm_p: boolean;
label 0;
begin
/////////ДИАЛОГ "ПРОДУКТЫ"////////////////////////////

if Form11.OpenDialog2.Execute=true then begin
for nfp:=0 to Form11.OpenDialog2.Files.Count-1 do begin
Application.ProcessMessages;
energy_product:=nil;
e_plus_zpe_p:=nil;
U_en_p:=nil;
H_en_p:=nil;
G_en_p:=nil;
E_term_p:=nil;
C_p:=nil;
Entr_p:=nil;
therm_p:=false;
Normal_termination_p:=nil;





//Form1.Statusbar1.Panels[0].Text:='Termochemistry';
AssignFile(f,Form11.OpenDialog2.Files[nfp]);
reset(f);
while not Eof(f) do begin
ReadLn(f,str);
setlength(Normal_termination_p,nfp+1);
if pos('Normal termination of Gaussian',str)<>0 then Normal_termination_p[nfp]:=true;
if copy(str,2,8)='SCF Done' then begin
setlength(energy_product,nfp+1);
energy_product[nfp]:=copy(str,pos('=',str)+3,pos('A.U.',str)-pos('=',str)-8);              // E
end;



if pos('Sum of electronic and zero-point Energies',str)<>0 then begin
setlength(e_plus_zpe_p,nfp+1);
e_plus_zpe_p[nfp]:=copy(copy(str,pos('=',str),100), pos('-',copy(str,pos('=',str),100)), 20);  // E+ZPE
end;
if pos('Sum of electronic and thermal Energies',str)<>0 then begin
setlength(U_en_p,nfp+1);
U_en_p[nfp]:=copy(copy(str,pos('=',str),100), pos('-',copy(str,pos('=',str),100)), 20);  // U
end;
if pos('Sum of electronic and thermal Enthalpies',str)<>0 then begin
setlength(H_en_p,nfp+1);
H_en_p[nfp]:=copy(copy(str,pos('=',str),100), pos('-',copy(str,pos('=',str),100)), 20);  // H
end;
if pos('Sum of electronic and thermal Free Energies',str)<>0 then begin
therm_p:=true;
setlength(G_en_p,nfp+1);
G_en_p[nfp]:=copy(copy(str,pos('=',str),100), pos('-',copy(str,pos('=',str),100)), 20);  // G
end;
if pos('Total          ',str)<>0 then begin
setlength(E_term_p,nfp+1);
setlength(C_p,nfp+1);
setlength(Entr_p,nfp+1);
for i:=0 to 1000 do begin
if copy(str,i+12,1)<>' ' then  begin
E_term_p[nfp]:=copy(str,i+12,pos(' ',copy(str,i+12,20))-1);                             // Eterm
break;
end;
end;
for i:=0 to 1000 do begin
if copy(str,pos(E_term_p[nfp],str)+length(E_term_p[nfp])+2+i,1)<>' ' then  begin
C_p[nfp]:=copy(str,pos(E_term_p[nfp],str)+length(E_term_p[nfp])+2+i, pos(' ',copy(str,pos(E_term_p[nfp],str)+length(E_term_p[nfp])+2+i,20))-1 );   // C
break;
end;
end;
for i:=0 to 1000 do begin
if copy(str,pos(C_p[nfp],str)+length(C_p[nfp])+2+i,1)<>' ' then  begin
Entr_p[nfp]:=copy(str,pos(C_p[nfp],str)+length(C_p[nfp])+2+i, 20 );                         // S
break;
end;
end;
end;































 ///
///
 ///


end;
CloseFile(f);
////////////КОНЕЦ ДИАЛОГА "ПРОДУКТЫ"//////////////////


if energy_product=nil then begin
showmessage('Файл '+Form11.OpenDialog2.Files[nfp]+' не содержит информации о полной энергии');
goto 0;
end;

//if  e_plus_zpe_p=nil then











Form11.Listbox2.Items.Add('    '+Form11.OpenDialog2.Files[nfp]);
setlength(en_p,Form11.ListBox2.Items.Count);
en_p[Form11.ListBox2.Items.Count-1]:=energy_product[nfp];
setlength(N_termination_p,Form11.ListBox2.Items.Count);
N_termination_p[Form11.ListBox2.Items.Count-1]:=Normal_termination_p[nfp];




if therm_p=true then begin
setlength(e_plus_zpe_p_en,Form11.ListBox2.Items.Count);
setlength(U_en_p_en,Form11.ListBox2.Items.Count);
setlength(H_en_p_en,Form11.ListBox2.Items.Count);
setlength(G_en_p_en,Form11.ListBox2.Items.Count);
setlength(E_term_p_en,Form11.ListBox2.Items.Count);
setlength(C_p_en,Form11.ListBox2.Items.Count);
setlength(Entr_p_en,Form11.ListBox2.Items.Count);
e_plus_zpe_p_en[Form11.ListBox2.Items.Count-1]:=e_plus_zpe_p[nfp];
U_en_p_en[Form11.ListBox2.Items.Count-1]:=U_en_p[nfp];
H_en_p_en[Form11.ListBox2.Items.Count-1]:=H_en_p[nfp];
G_en_p_en[Form11.ListBox2.Items.Count-1]:=G_en_p[nfp];
E_term_p_en[Form11.ListBox2.Items.Count-1]:=E_term_p[nfp];
C_p_en[Form11.ListBox2.Items.Count-1]:=C_p[nfp];
Entr_p_en[Form11.ListBox2.Items.Count-1]:=Entr_p[nfp];
end;




if therm_p=false then begin
setlength(e_plus_zpe_p_en,Form11.ListBox2.Items.Count);
setlength(U_en_p_en,Form11.ListBox2.Items.Count);
setlength(H_en_p_en,Form11.ListBox2.Items.Count);
setlength(G_en_p_en,Form11.ListBox2.Items.Count);
setlength(E_term_p_en,Form11.ListBox2.Items.Count);
setlength(C_p_en,Form11.ListBox2.Items.Count);
setlength(Entr_p_en,Form11.ListBox2.Items.Count);
e_plus_zpe_p_en[Form11.ListBox2.Items.Count-1]:='';
U_en_p_en[Form11.ListBox2.Items.Count-1]:='';
H_en_p_en[Form11.ListBox2.Items.Count-1]:='';
G_en_p_en[Form11.ListBox2.Items.Count-1]:= '';
E_term_p_en[Form11.ListBox2.Items.Count-1]:='';
C_p_en[Form11.ListBox2.Items.Count-1]:='';
Entr_p_en[Form11.ListBox2.Items.Count-1]:='';
end;











therm_p:=false;

BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;


0: end;
end;

end;









procedure TForm11.BitBtn3Click(Sender: TObject);
var
i,j,s: integer;
E: real;
a,b,proverka: boolean;
png: TPNGObject;
//rect: TRect;
label 0,2,3,20,30,10,11;
begin
Form11.Image1.Picture:=nil;
Form11.Image2.Picture:=nil;
Form11.Image3.Picture:=nil;
//Form11.ListBox1.Canvas.Refresh;

ND1[0]:=-1;
a:=false;  //проверка что в одном листбоксе нет повторяющихся строк
b:=false;
s:=0;
numi[0]:=-1;  //повторы между листбоксами
numj[0]:=-1;  //повторы между листбоксами
test:=false;
for i:=0 to Form11.ListBox1.Items.Count-1 do  begin
for j:=0 to Form11.ListBox2.Items.Count-1 do  begin
if Form11.ListBox1.Items[i]=Form11.ListBox2.Items[j] then begin
test:=true;
numi[s]:=i;
numj[s]:=j;
s:=s+1;
end;
end;
end;
sc:=s;

if (numi[0]<>-1) and (numj[0]<>-1) then  begin
if clc=false then messagedlg('ВНИМАНИЕ! Одинаковые системы обнаружены для реагентов и продуктов',mtWarning,[mbOK],0);
Form11.Image3.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Excl2.png');
end;


{
ss:=0;
ListBox1.Repaint;
ss:=0;
ListBox2.Repaint;
ss:=0;
}


//NE1:=length(en_r);
//NE2:=length(en_p);

summ1:=0;
summ2:=0;
summ_e_zpe_r:=0;
summ_u_r:=0;
summ_h_r:=0;
summ_g_r:=0;
summ_e_term_r:=0;
summ_c_r:=0;
summ_entr_r:=0;
summ_e_zpe_p:=0;
summ_u_p:=0;
summ_h_p:=0;
summ_g_p:=0;
summ_e_term_p:=0;
summ_c_p:=0;
summ_entr_p:=0;




{if  NE1>Form11.ListBox1.Items.Count then begin
for i:=0 to NE1-1 do
if en_r[i]<>'' then summ1:=summ1+strtofloat(en_r[i]);
end
else begin}                                            // Полная энергия пусть считается отдельно
for i:=0 to Form11.ListBox1.Items.Count-1 do
if en_r[i]<>'' then summ1:=summ1+strtofloat(en_r[i]);





for i:=0 to length(e_plus_zpe_r_en)-1 do  begin
if (e_plus_zpe_r_en[i]<>'') and (e_plus_zpe_r_en<>nil) then summ_e_zpe_r:=summ_e_zpe_r+strtofloat(e_plus_zpe_r_en[i]);
if (U_en_r_en[i]<>'') and (U_en_r_en<>nil)  then summ_u_r:=summ_u_r+strtofloat(U_en_r_en[i]);
if (H_en_r_en[i]<>'') and (H_en_r_en<>nil) then summ_h_r:=summ_h_r+strtofloat(H_en_r_en[i]);
if (G_en_r_en[i]<>'')  and (G_en_r_en<>nil) then summ_g_r:=summ_g_r+strtofloat(G_en_r_en[i]);
if (E_term_r_en[i]<>'')  and (E_term_r_en<>nil) then summ_e_term_r:=summ_e_term_r+strtofloat(E_term_r_en[i]);
if (C_r_en[i]<>'')  and (C_r_en<>nil) then summ_c_r:=summ_c_r+strtofloat(C_r_en[i]);
if (Entr_r_en[i]<>'') and (Entr_r_en<>nil)   then summ_entr_r:=summ_entr_r+strtofloat(Entr_r_en[i]);
end;






//end;


{if  NE2>Form11.ListBox2.Items.Count then begin
for j:=0 to NE2-1 do
if en_p[j]<>'' then summ2:=summ2+strtofloat(en_p[j]);
end
else begin }
for j:=0 to Form11.ListBox2.Items.Count-1 do
if en_p[j]<>'' then summ2:=summ2+strtofloat(en_p[j]);



for j:=0 to length(e_plus_zpe_p_en)-1 do  begin
if (e_plus_zpe_p_en[j]<>'') and (e_plus_zpe_p_en<>nil) then summ_e_zpe_p:=summ_e_zpe_p+strtofloat(e_plus_zpe_p_en[j]);
if (U_en_p_en[j]<>'') and (U_en_p_en<>nil) then summ_u_p:=summ_u_p+strtofloat(U_en_p_en[j]);
if (H_en_p_en[j]<>'') and (H_en_p_en<>nil) then summ_h_p:=summ_h_p+strtofloat(H_en_p_en[j]);
if (G_en_p_en[j]<>'') and (G_en_p_en<>nil) then summ_g_p:=summ_g_p+strtofloat(G_en_p_en[j]);
if (E_term_p_en[j]<>'') and (E_term_p_en<>nil) then summ_e_term_p:=summ_e_term_p+strtofloat(E_term_p_en[j]);
if (C_p_en[j]<>'') and (C_p_en<>nil) then summ_c_p:=summ_c_p+strtofloat(C_p_en[j]);
if (Entr_p_en[j]<>'') and (Entr_p_en<>nil) then summ_entr_p:=summ_entr_p+strtofloat(Entr_p_en[j]);
end;



if clc=false then begin

j:=0;
for i:=0 to  length(e_plus_zpe_r_en)-1 do
if  e_plus_zpe_r_en[i]<>'' then j:=j+1;
if  (j<length(e_plus_zpe_r_en)) and (summ_e_zpe_r<>0) then  messagedlg('ВНИМАНИЕ! Не для всех реагентов выполнен расчет колебаний',mtWarning,[mbOK],0);


j:=0;
for i:=0 to  length(e_plus_zpe_p_en)-1 do
if  e_plus_zpe_p_en[i]<>'' then j:=j+1;
if  (j<length(e_plus_zpe_p_en)) and  (summ_e_zpe_p<>0) then messagedlg('ВНИМАНИЕ! Не для всех продуктов выполнен расчет колебаний',mtWarning,[mbOK],0);


end;









//end;



{if  NE1>Form11.ListBox1.Items.Count then begin
for i:=0 to NE1-1 do  begin
if en_r[i]='' then begin
if clc=false then messagedlg('ВНИМАНИЕ! Полная энергия одного из реагентов не определена',mtWarning,[mbOK],0);
break;
goto 10;
end;
end;
end
else begin  }
for i:=0 to Form11.ListBox1.Items.Count-1 do  begin
if en_r[i]='' then begin
if clc=false then messagedlg('ВНИМАНИЕ! Полная энергия одного из реагентов не определена',mtWarning,[mbOK],0);
break;
goto 10;
end;
10: end;
//10: end;



{if  NE2>Form11.ListBox2.Items.Count then begin
for j:=0 to NE2-1 do   begin
if en_p[j]='' then begin
if clc=false then messagedlg('ВНИМАНИЕ! Полная энергия одного из продуктов не определена',mtWarning,[mbOK],0);
break;
goto 11;
end;
end;
end
else begin  }
for j:=0 to Form11.ListBox2.Items.Count-1 do begin
if en_p[j]='' then begin
if clc=false then messagedlg('ВНИМАНИЕ! Полная энергия одного из продуктов не определена',mtWarning,[mbOK],0);
break;
goto 11;
end;
11: end;
//11: end;







{
for i:=0 to Form11.ListBox1.Items.Count-1 do
if en_r[i]='' then begin
messagedlg('ВНИМАНИЕ! Полная энергия одного из реагентов не определена',mtWarning,[mbOK],0);
break;
goto 10;
10: end;  }

{
for j:=0 to Form11.ListBox2.Items.Count-1 do
if en_p[j]='' then begin
messagedlg('ВНИМАНИЕ! Полная энергия одного из продуктов не определена',mtWarning,[mbOK],0);
break;
goto 11;
11: end; }


if summ1=0 then  begin
if clc=false then messagedlg('ОШИБКА! Реагенты не определены и/или их полные энергии не установлены',mtError,[mbOK],0);
goto 0;
end;
if summ2=0 then  begin
if clc=false then messagedlg('ОШИБКА! Продукты не определены и/или их полные энергии не установлены',mtError,[mbOK],0);
goto 0;
end;


if clc=false then begin
if  abs(summ2-summ1)>2 then showmessage('ВНИМАНИЕ! Слишком большое значение энергии! Проверьте секции реагентов и продуктов!');
if  (abs(summ_e_zpe_p-summ_e_zpe_r)>2) and  (summ_e_zpe_p<>0) and (summ_e_zpe_r<>0) then showmessage('ВНИМАНИЕ! Значения рассчитываемых термодинамических энергий слишком велики! Проверьте расчет колебаний!');
end;


/////////////////////////////////////////////////////////////////////////////////
if clc=false then begin   ////////// сюда вставлять вывод термохимии и термодинамики
Label1.Font.Name:='Symbol';
Label1.Caption:=#68;
Label6.Font.Name:='MS Sans Serif';
Label6.Caption:='E = '+floattostr(RoundTo((summ2-summ1)*27.2114*23.06,-2))+' ккал/моль';


if (summ_e_zpe_r<>0) and (summ_e_zpe_p<>0) then begin
Label7.Font.Name:='Symbol';
Label7.Caption:=#68;
Label8.Font.Name:='MS Sans Serif';
Label8.Caption:='(E+ZPE) = '+floattostr(RoundTo((summ_e_zpe_p-summ_e_zpe_r)*27.2114*23.06,-2))+' ккал/моль';
end;

if (summ_u_r<>0) and (summ_u_p<>0) then begin
Label9.Font.Name:='Symbol';
Label9.Caption:=#68;
Label10.Font.Name:='MS Sans Serif';
Label10.Caption:='U = '+floattostr(RoundTo((summ_u_p-summ_u_r)*27.2114*23.06,-2))+' ккал/моль';
end;


if (summ_h_r<>0) and (summ_h_p<>0) then begin
Label11.Font.Name:='Symbol';
Label11.Caption:=#68;
Label12.Font.Name:='MS Sans Serif';
Label12.Caption:='H = '+floattostr(RoundTo((summ_h_p-summ_h_r)*27.2114*23.06,-2))+' ккал/моль';
end;

if (summ_g_r<>0) and (summ_g_p<>0) then begin
Label13.Font.Name:='Symbol';
Label13.Caption:=#68;
Label14.Font.Name:='MS Sans Serif';
Label14.Caption:='G = '+floattostr(RoundTo((summ_g_p-summ_g_r)*27.2114*23.06,-2))+' ккал/моль';
end;


if (summ_e_term_r<>0) and (summ_e_term_p<>0) then begin
Label15.Font.Name:='Symbol';
Label15.Caption:=#68;
Label16.Font.Name:='MS Sans Serif';
Label16.Caption:='Eterm = '+floattostr(RoundTo((summ_e_term_p-summ_e_term_r),-2))+' ккал/моль';
end;


if (summ_c_r<>0) and (summ_c_p<>0) then begin
Label17.Font.Name:='Symbol';
Label17.Caption:=#68;
Label18.Font.Name:='MS Sans Serif';
Label18.Caption:='Cv = '+floattostr(RoundTo((summ_c_p-summ_c_r),-2))+' кал/моль*K';
end;

if (summ_entr_r<>0) and (summ_entr_p<>0) then begin
Label19.Font.Name:='Symbol';
Label19.Caption:=#68;
Label20.Font.Name:='MS Sans Serif';
Label20.Caption:='S = '+floattostr(RoundTo((summ_entr_p-summ_entr_r),-2))+' кал/моль*K';
end;


end;
////////////////////////////////////////////////////////////////////////////////





Etot:= RoundTo((summ2-summ1)*27.2114*23.06,-2);
EZPE:=RoundTo((summ_e_zpe_p-summ_e_zpe_r)*27.21*23.06,-2);
U:=RoundTo((summ_u_p-summ_u_r)*27.2114*23.06,-2);
H:=RoundTo((summ_h_p-summ_h_r)*27.2114*23.06,-2);
G:=RoundTo((summ_g_p-summ_g_r)*27.2114*23.06,-2);
Cv:=RoundTo((summ_c_p-summ_c_r),-2);
Et:=RoundTo((summ_e_term_p-summ_e_term_r),-2);
S1:=RoundTo((summ_entr_p-summ_entr_r),-2);















if Form11.ListBox1.Items.Count>1 then begin
i:=0;
20: j:=1;
2: if Form11.ListBox1.Items[i]=Form11.ListBox1.Items[i+j] then
begin
a:=true;
end;
j:=j+1;
if i+j<Form11.ListBox1.Items.Count then goto 2;
i:=i+1;
if i<Form11.ListBox1.Items.Count-1 then goto 20;
end;


if Form11.ListBox2.Items.Count>1 then begin
i:=0;
30: j:=1;
3: if Form11.ListBox2.Items[i]=Form11.ListBox2.Items[i+j] then
begin
b:=true;
end;
j:=j+1;
if i+j<Form11.ListBox2.Items.Count then goto 3;
i:=i+1;
if i<Form11.ListBox2.Items.Count-1 then goto 30;
end;


png := TPNGObject.Create; // создаем
if a=true then Form11.Image1.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Excl1.png');
if b=true then Form11.Image2.Picture.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Excl1.png');

png.Free;




//if a=true then showmessage('A=true');
//if b=true then showmessage('B=true');

Listbox1.Repaint;
Listbox2.Repaint;

a:=false;
b:=false;


BitBtn4.Enabled:=True;
BitBtn5.Enabled:=True;
BitBtn6.Enabled:=True;


//test:=false;

0: end;

{procedure TForm11.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with TListBox(Control),Canvas,Font do begin
  if (test=true) and (index=numi[ss]) then begin
  Color:=clred;
  Style:=[fsBold];
  ss:=ss+1;
  end
  else
  Color:=clblack;
  FillRect(rect);
  TextOut(rect.Left,rect.Top,items[index]);
  ss:=ss+0;
  end;
end;  }

{procedure TForm11.FormPaint(Sender: TObject);
begin
{if (numi[0]<>-1) and (numj[0]<>-1) then test:=true
else test:=false;
ss:=0;
end; }

procedure TForm11.FormCreate(Sender: TObject);
begin
numi[0]:=-1;
numj[0]:=-1;
Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
end;

procedure TForm11.N1Click(Sender: TObject);
var i: integer;
begin
numi[0]:=-1;
numj[0]:=-1;
test:=false;
en_r:=nil;
e_plus_zpe_r_en:=nil;
U_en_r_en:=nil;
H_en_r_en:=nil;
G_en_r_en:=nil;
E_term_r_en:=nil;
C_r_en:=nil;
Entr_r_en:=nil;
Form11.ListBox1.Clear;
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
//ss:=0;
end;

{procedure TForm11.ListBox2DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
  begin
  with TListBox(Control),Canvas,Font do begin
  if (test=true) and (index=numj[ss]) then begin
  Color:=clred;
  Style:=[fsBold];
  ss:=ss+1;
  end
  else
  Color:=clblack;
  FillRect(rect);
  TextOut(rect.Left,rect.Top,items[index]);
  ss:=ss+0;
  end;
end;  }

procedure TForm11.N2Click(Sender: TObject);
var i: integer;
begin
numi[0]:=-1;
numj[0]:=-1;
test:=false;
en_p:=nil;
e_plus_zpe_p_en:=nil;
U_en_p_en:=nil;
H_en_p_en:=nil;
G_en_p_en:=nil;
E_term_p_en:=nil;
C_p_en:=nil;
Entr_p_en:=nil;
Form11.ListBox2.Clear;
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
//ss:=0;
end;

procedure TForm11.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i,j: integer;
vsp: array of string;    // вспомогательный массив
begin
if KEY=VK_DELETE then begin
for i:=0 to ListBox1.Items.Count-1 do                        // обнуляем полную энергию
if Form11.ListBox1.Selected[i]=true then en_r[i]:='0';

for i:=0 to ListBox1.Items.Count-1 do begin         // обнуляем все термодинамические величины
if Form11.ListBox1.Selected[i]=true then begin
e_plus_zpe_r_en[i]:='0';
U_en_r_en[i]:='0';
H_en_r_en[i]:='0';
G_en_r_en[i]:='0';
E_term_r_en[i]:='0';
C_r_en[i]:='0';
Entr_r_en[i]:='0';
end;   // конец   if Form11.ListBox1.Selected[i]=true then begin
end;   // конец   for i:=0 to ListBox1.Items.Count-1 do begin





Form11.ListBox1.DeleteSelected;
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
//NE1:=length(en_r);
clc:=true;
BitBtn3.Click;
clc:=false;
ListBox1.Repaint;
ListBox2.Repaint;
j:=0;    //////////////////////////////////в этом блоке (полная энергия) удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(en_r)-1 do  begin
if en_r[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=en_r[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(en_r,length(vsp));
for i:=0 to length(vsp)-1 do
en_r[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока


vsp:=nil;

j:=0;    //////////////////////////////////в этом блоке (e_plus_zpe_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(e_plus_zpe_r_en)-1 do  begin
if e_plus_zpe_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=e_plus_zpe_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(e_plus_zpe_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
e_plus_zpe_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;

j:=0;    //////////////////////////////////в этом блоке (U_en_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(U_en_r_en)-1 do  begin
if U_en_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=U_en_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(U_en_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
U_en_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;


j:=0;    //////////////////////////////////в этом блоке (H_en_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(H_en_r_en)-1 do  begin
if H_en_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=H_en_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(H_en_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
H_en_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (G_en_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(G_en_r_en)-1 do  begin
if G_en_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=G_en_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(G_en_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
G_en_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;


j:=0;    //////////////////////////////////в этом блоке (E_term_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(E_term_r_en)-1 do  begin
if E_term_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=E_term_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(E_term_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
E_term_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (C_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(C_r_en)-1 do  begin
if C_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=C_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(C_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
C_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (Entr_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(Entr_r_en)-1 do  begin
if Entr_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=Entr_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(Entr_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
Entr_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;











end;///конец if KEY=VK_DELETE then begin
end;






procedure TForm11.N3Click(Sender: TObject);
var i,j: integer;
vsp: array of string;
begin
for i:=0 to Form11.ListBox1.Items.Count-1 do
if Form11.ListBox1.Selected[i]=true then en_r[i]:='0';

for i:=0 to ListBox1.Items.Count-1 do begin         // обнуляем все термодинамические величины
if Form11.ListBox1.Selected[i]=true then begin
e_plus_zpe_r_en[i]:='0';
U_en_r_en[i]:='0';
H_en_r_en[i]:='0';
G_en_r_en[i]:='0';
E_term_r_en[i]:='0';
C_r_en[i]:='0';
Entr_r_en[i]:='0';
end;   // конец   if Form11.ListBox1.Selected[i]=true then begin
end;   // конец   for i:=0 to ListBox1.Items.Count-1 do begin




Form11.ListBox1.DeleteSelected;
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
//NE1:=length(en_r);
clc:=true;
BitBtn3.Click;
clc:=false;
ListBox1.Repaint;
ListBox2.Repaint;
j:=0;    //////////////////////////////////в этом блоке удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(en_r)-1 do  begin
if en_r[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=en_r[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(en_r,length(vsp));
for i:=0 to length(vsp)-1 do
en_r[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока
//end;




vsp:=nil;

j:=0;    //////////////////////////////////в этом блоке (e_plus_zpe_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(e_plus_zpe_r_en)-1 do  begin
if e_plus_zpe_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=e_plus_zpe_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(e_plus_zpe_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
e_plus_zpe_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;

j:=0;    //////////////////////////////////в этом блоке (U_en_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(U_en_r_en)-1 do  begin
if U_en_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=U_en_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(U_en_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
U_en_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;


j:=0;    //////////////////////////////////в этом блоке (H_en_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(H_en_r_en)-1 do  begin
if H_en_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=H_en_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(H_en_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
H_en_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (G_en_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(G_en_r_en)-1 do  begin
if G_en_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=G_en_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(G_en_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
G_en_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;


j:=0;    //////////////////////////////////в этом блоке (E_term_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(E_term_r_en)-1 do  begin
if E_term_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=E_term_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(E_term_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
E_term_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (C_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(C_r_en)-1 do  begin
if C_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=C_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(C_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
C_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (Entr_r_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(Entr_r_en)-1 do  begin
if Entr_r_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=Entr_r_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(Entr_r_en,length(vsp));
for i:=0 to length(vsp)-1 do
Entr_r_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



end;









procedure TForm11.N4Click(Sender: TObject);
var i,j: integer;
vsp: array of string;
begin
for i:=0 to Form11.ListBox2.Items.Count-1 do
if Form11.ListBox2.Selected[i]=true then en_p[i]:='0';
Form11.ListBox2.DeleteSelected;
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
//NE2:=length(en_p);
clc:=true;
BitBtn3.Click;
clc:=false;
ListBox1.Repaint;
ListBox2.Repaint;
j:=0;    //////////////////////////////////в этом блоке удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(en_p)-1 do  begin
if en_p[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=en_p[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(en_p,length(vsp));
for i:=0 to length(vsp)-1 do
en_p[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока




vsp:=nil;

j:=0;    //////////////////////////////////в этом блоке (e_plus_zpe_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(e_plus_zpe_p_en)-1 do  begin
if e_plus_zpe_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=e_plus_zpe_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_p)-1 do
setlength(e_plus_zpe_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
e_plus_zpe_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;

j:=0;    //////////////////////////////////в этом блоке (U_en_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(U_en_p_en)-1 do  begin
if U_en_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=U_en_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_p)-1 do
setlength(U_en_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
U_en_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;


j:=0;    //////////////////////////////////в этом блоке (H_en_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(H_en_p_en)-1 do  begin
if H_en_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=H_en_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_p)-1 do
setlength(H_en_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
H_en_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (G_en_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(G_en_p_en)-1 do  begin
if G_en_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=G_en_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_p)-1 do
setlength(G_en_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
G_en_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;


j:=0;    //////////////////////////////////в этом блоке (E_term_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(E_term_p_en)-1 do  begin
if E_term_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=E_term_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_p)-1 do
setlength(E_term_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
E_term_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (C_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(C_p_en)-1 do  begin
if C_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=C_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_p)-1 do
setlength(C_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
C_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (Entr_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(Entr_p_en)-1 do  begin
if Entr_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=Entr_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_p)-1 do
setlength(Entr_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
Entr_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



//end;


end;








procedure TForm11.ListBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i,j: integer;
vsp: array of string;
begin
if KEY=VK_DELETE then begin
for i:=0 to Form11.ListBox2.Items.Count-1 do
if Form11.ListBox2.Selected[i]=true then en_p[i]:='0';


for i:=0 to ListBox2.Items.Count-1 do begin         // обнуляем все термодинамические величины
if Form11.ListBox2.Selected[i]=true then begin
e_plus_zpe_p_en[i]:='0';
U_en_p_en[i]:='0';
H_en_p_en[i]:='0';
G_en_p_en[i]:='0';
E_term_p_en[i]:='0';
C_p_en[i]:='0';
Entr_p_en[i]:='0';
end;   // конец   if Form11.ListBox1.Selected[i]=true then begin
end;   // конец   for i:=0 to ListBox1.Items.Count-1 do begin









Form11.ListBox2.DeleteSelected;
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
Label1.Caption:='';
Label6.Caption:='';
Label7.Caption:='';
Label8.Caption:='';
Label9.Caption:='';
Label10.Caption:='';
Label11.Caption:='';
Label12.Caption:='';
Label13.Caption:='';
Label14.Caption:='';
Label15.Caption:='';
Label16.Caption:='';
Label17.Caption:='';
Label18.Caption:='';
Label19.Caption:='';
Label20.Caption:='';
BitBtn4.Enabled:=False;
BitBtn5.Enabled:=False;
BitBtn6.Enabled:=False;
//NE2:=length(en_p);
clc:=true;
BitBtn3.Click;
clc:=false;
ListBox1.Repaint;
ListBox2.Repaint;
j:=0;    //////////////////////////////////в этом блоке удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(en_p)-1 do  begin
if en_p[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=en_p[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(en_r)-1 do
setlength(en_p,length(vsp));
for i:=0 to length(vsp)-1 do
en_p[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока




vsp:=nil;

j:=0;    //////////////////////////////////в этом блоке (e_plus_zpe_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(e_plus_zpe_p_en)-1 do  begin
if e_plus_zpe_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=e_plus_zpe_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(e_plus_zpe_p_en)-1 do
setlength(e_plus_zpe_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
e_plus_zpe_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;

j:=0;    //////////////////////////////////в этом блоке (U_en_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(U_en_p_en)-1 do  begin
if U_en_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=U_en_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(U_en_p_en)-1 do
setlength(U_en_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
U_en_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;


j:=0;    //////////////////////////////////в этом блоке (H_en_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(H_en_p_en)-1 do  begin
if H_en_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=H_en_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(H_en_p_en)-1 do
setlength(H_en_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
H_en_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (G_en_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(G_en_p_en)-1 do  begin
if G_en_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=G_en_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(G_en_p_en)-1 do
setlength(G_en_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
G_en_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;


j:=0;    //////////////////////////////////в этом блоке (E_term_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(E_term_p_en)-1 do  begin
if E_term_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=E_term_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(E_term_p_en)-1 do
setlength(E_term_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
E_term_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (C_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(C_p_en)-1 do  begin
if C_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=C_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(C_p_en)-1 do
setlength(C_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
C_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;



j:=0;    //////////////////////////////////в этом блоке (Entr_p_en)удаляются нули из массива энергий - ненулевые элементы массива присваиваются вспомогательному массиву и затем полученные элементы снова присваиваются первоначальному массиву
for i:=0 to Length(Entr_p_en)-1 do  begin
if Entr_p_en[i]<>'0' then begin
setlength(vsp,j+1);
vsp[j]:=Entr_p_en[i];
j:=j+1;
end;
end;///конец цикла for i:=0 to Length(Entr_p_en)-1 do
setlength(Entr_p_en,length(vsp));
for i:=0 to length(vsp)-1 do
Entr_p_en[i]:=vsp[i];        ///////////////////////////конец вспомогательного блока

vsp:=nil;









end;
end;

procedure TForm11.Timer1Timer(Sender: TObject);
var png: TPNGObject;
i5: integer;
begin

png := TPNGObject.Create; // создаем
png.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Pt1.png');
if test=true then begin
for i5:=0 to  sc-1 do begin
if ND1[i5]<>i5 then ListBox1.Canvas.Draw(0,1+numi[i5]*17,png);
ListBox2.Canvas.Draw(0,1+numj[i5]*17,png);
end;
end;
if png<>nil then  png.Free;
png:=nil;
end;



procedure TForm11.FormShow(Sender: TObject);
begin
Image3.Hint:='ВНИМАНИЕ! В секциях реагентов и продуктов присутствуют одинаковые системы';
Image1.Hint:='ВНИМАНИЕ! В секции реагентов присутствуют повторяющиеся системы';
Image2.Hint:='ВНИМАНИЕ! В секции продуктов присутствуют повторяющиеся системы';
end;

procedure TForm11.BitBtn4Click(Sender: TObject);
var f: Textfile;
probel: widestring;
i,j,ps: integer;
reagent,product: Array of widestring;
begin
if Form11.SaveDialog1.Execute then begin
AssignFile(f,Form11.SaveDialog1.FileName);
setlength(reagent,Form11.ListBox1.Count);
setlength(product,Form11.ListBox2.Count);
Rewrite(f);
WriteLn(f,'');
WriteLn(f,' *******************************************************');
WriteLn(f,' *          Thermochemistry and thermodynamic          *');
WriteLn(f,' *           for reaction A+B+... -> C+D+...           *');
WriteLn(f,' *                                                     *');
WriteLn(f,' *                       PANDORA                       *');
WriteLn(f,' *******************************************************');
WriteLn(f,'');
WriteLn(f,'  Reactant:                     Products:');
WriteLn(f,'  ------------------------------------------------------');
ps:=0;
probel:='';
for i:=0 to 200 do
probel:=probel+' ';


////////////////ищем название задач без полного пути///////////////

for i:=0 to Form11.ListBox1.Items.Count-1 do begin
for j:=0 to length(Form11.ListBox1.Items[i]) do
if copy(Form11.ListBox1.Items[i],j,1)='\'   then ps:=j;
reagent[i]:=copy(Form11.ListBox1.Items[i],ps+1,100);
end;
ps:=0;
for i:=0 to Form11.ListBox2.Items.Count-1 do begin
for j:=0 to length(Form11.ListBox2.Items[i]) do
if copy(Form11.ListBox2.Items[i],j,1)='\'   then ps:=j;
product[i]:=copy(Form11.ListBox2.Items[i],ps+1,100);
end;
///////////////////////////////////////////////////////////////////


///////////////////////в два столбца заполняем информацию о реагентах и продуктах//////////////

if Form11.ListBox1.Count>=Form11.ListBox2.Count then  begin
j:=0;
for  i:=0 to Form11.ListBox1.Items.Count-1 do  begin
if j<=Form11.ListBox2.Items.Count-1 then WriteLn(f,'  '+reagent[i]+copy(probel,0,30-length(reagent[i]))+product[j])
else WriteLn(f,'  '+reagent[i]+'             '+'');
j:=j+1;
end;
end;

if Form11.ListBox1.Count<Form11.ListBox2.Count then  begin
j:=0;
for  i:=0 to Form11.ListBox2.Items.Count-1 do  begin
if j<=Form11.ListBox1.Items.Count-1 then WriteLn(f,'  '+reagent[i]+copy(probel,0,30-length(reagent[i]))+product[j])
else WriteLn(f,'                                '+product[i]);
j:=j+1;
end;
end;

WriteLn(f,'  ------------------------------------------------------');
WriteLn(f,'');
//////////////////////////////////////////////////////////////////

{

WriteLn(f,'  Total energy, energy with zero-point correction, full');
WriteLn(f,'  inner energy, enthalpy, Gibbs free energy, entropy,');
WriteLn(f,'  heat capacity and thermocorrection energy for reactants:');
WriteLn(f,'');
for i:=0 to ListBox1.Items.Count-1 do  begin
WriteLn(f,'  ******************************');
WriteLn(f,'  Reactant '+inttostr(i+1)+': '+reagent[i]);
WriteLn(f,'');
WriteLn(f,'  E       = '+en_r[i]);
if Label20.Visible=true then begin
WriteLn(f,'  E+ZPE   = '+e_plus_zpe_r_en[i]);
WriteLn(f,'  U       = '+U_en_r_en[i]);
WriteLn(f,'  H       = '+H_en_r_en[i]);
WriteLn(f,'  G       = '+G_en_r_en[i]);
WriteLn(f,'  S       = '+Entr_r_en[i]);
WriteLn(f,'  Cv      = '+C_r_en[i]);
WriteLn(f,'  Ethermo = '+E_term_r_en[i]);
end;
WriteLn(f,'');
end;
WriteLn(f,'');
WriteLn(f,'  ******************************');

WriteLn(f,'');



WriteLn(f,'  Total energy, energy with zero-point correction, full');
WriteLn(f,'  inner energy, enthalpy, Gibbs free energy, entropy,');
WriteLn(f,'  heat capacity and thermocorrection energy for products:');
WriteLn(f,'');
for i:=0 to ListBox1.Items.Count-1 do  begin
WriteLn(f,'  ******************************');
WriteLn(f,'  Product '+inttostr(i+1)+': '+product[i]);
WriteLn(f,'');
WriteLn(f,'  E       = '+en_p[i]);
if Label20.Visible=true then begin
WriteLn(f,'  E+ZPE   = '+e_plus_zpe_p_en[i]);
WriteLn(f,'  U       = '+U_en_p_en[i]);
WriteLn(f,'  H       = '+H_en_p_en[i]);
WriteLn(f,'  G       = '+G_en_p_en[i]);
WriteLn(f,'  S       = '+Entr_p_en[i]);
WriteLn(f,'  Cv      = '+C_p_en[i]);
WriteLn(f,'  Ethermo = '+E_term_p_en[i]);
end;
WriteLn(f,'');
end;

WriteLn(f,'');
WriteLn(f,'  ******************************');

}


WriteLn(f,'');
WriteLn(f,'  Sum of the parameters for all the reactants and products:');
WriteLn(f,'  ------------------------------------------------------');
WriteLn(f,'  Reactant:                     Products:');
WriteLn(f,'  ------------------------------------------------------');
WriteLn(f,'  E       = '+floattostr(summ1)+copy(probel,0,20-length(floattostr(summ1)))  + 'E       = '+floattostr(summ2));
if Label20.Caption<>'' then begin
WriteLn(f,'  E+ZPE   = '+floattostr(summ_e_zpe_r)+copy(probel,0,20-length(floattostr(summ_e_zpe_r))) +'E+ZPE   = '+floattostr(summ_e_zpe_p));
WriteLn(f,'  U       = '+floattostr(summ_u_r)+copy(probel,0,20-length(floattostr(summ_u_r))) +'U       = '+floattostr(summ_u_p));
WriteLn(f,'  H       = '+floattostr(summ_h_r)+copy(probel,0,20-length(floattostr(summ_h_r))) +'H       = '+floattostr(summ_h_p));
WriteLn(f,'  G       = '+floattostr(summ_g_r)+copy(probel,0,20-length(floattostr(summ_g_r))) +'G       = '+floattostr(summ_g_p));
WriteLn(f,'  S       = '+floattostr(summ_entr_r)+copy(probel,0,20-length(floattostr(summ_entr_r))) +'S       = '+floattostr(summ_entr_p));
WriteLn(f,'  Cv      = '+floattostr(summ_c_r)+copy(probel,0,20-length(floattostr(summ_c_r))) +'Cv      = '+floattostr(summ_c_p));
WriteLn(f,'  Ethermo = '+floattostr(summ_e_term_r)+copy(probel,0,20-length(floattostr(summ_e_term_r))) +'Ethermo = '+floattostr(summ_e_term_p));
end;
WriteLn(f,'  ------------------------------------------------------');
WriteLn(f,'');




//////////////////////////////////////////////////////////////////
WriteLn(f,'');
WriteLn(f,'  Thermochemical and thermodynamic parameters of reaction');
WriteLn(f,'');
WriteLn(f,'  deltaE = '+floattostr(Etot)+' kcal/mol');
if Label20.Caption<>'' then begin
WriteLn(f,'  delta(E+ZPE) = '+floattostr(EZPE)+' kcal/mol');
WriteLn(f,'  deltaU = '+floattostr(U)+' kcal/mol');
WriteLn(f,'  deltaH = '+floattostr(H)+' kcal/mol');
WriteLn(f,'  deltaG = '+floattostr(G)+' kcal/mol');
WriteLn(f,'  deltaS = '+floattostr(S1)+' cal/mol*K');
WriteLn(f,'  deltaCv = '+floattostr(Cv)+' cal/mol*K');
WriteLn(f,'  deltaEterm = '+floattostr(Et)+' kcal/mol');
end;
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'');
WriteLn(f,'  End of DATA  /'+Datetostr(Now)+'/');
WriteLn(f,'');



CloseFile(f);

end;



end;

procedure TForm11.BitBtn5Click(Sender: TObject);
var MSWord: OleVariant;
Rez: HRESULT;
ClassID: TCLSID;
probel: widestring;
i,j,ps: integer;
reagent,product: Array of widestring;
label 0;
begin
begin
Rez := CLSIDFromProgID(PWideChar(WideString('Word.Application')), ClassID);
if Rez <> S_OK then begin
MessageDlg('WORD не установлен',mtERROR,[mbok],0);
goto 0;
end;
end;
setlength(reagent,Form11.ListBox1.Count);
setlength(product,Form11.ListBox2.Count);
MSWord:=CreateOleObject('Word.Application');
MSWord.Documents.Add;
MSWord.Visible:=True;
MSWord.Selection.ParagraphFormat.LineSpacing:=12.0;  // межстрочный интервал=1
MSWord.Selection.ParagraphFormat.SpaceBefore:=0.0;
MSWord.Selection.ParagraphFormat.SpaceAfter:=0.0;
MSWord.Selection.PageSetup.TopMargin:=34;   // поля
MSWord.Selection.PageSetup.BottomMargin:=18;
MSWord.Selection.PageSetup.LeftMargin:=65;
MSWord.Selection.PageSetup.RightMargin:=48;
MSWord.Selection.PageSetup.PaperSize:=wdPaperA4;   // размер бумаги
MSWord.Selection.Font.Size:=12;
MSWord.Selection.Font.Name:='Courier New';
MSWord.Selection.Font.Bold:=False;
MSWord.Selection.Font.Italic:=False;
MSWord.Selection.TypeText(' *******************************************************');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' *          Thermochemistry and thermodynamic          *');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' *           for reaction A+B+... -> C+D+...           *');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' *                                                     *');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' *                       PANDORA                       *');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' *******************************************************');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' Reactants:                     Products:');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' ------------------------------------------------------');
MSWord.Selection.TypeParagraph;


ps:=0;
probel:='';
for i:=0 to 200 do
probel:=probel+' ';


////////////////ищем название задач без полного пути///////////////

for i:=0 to Form11.ListBox1.Items.Count-1 do begin
for j:=0 to length(Form11.ListBox1.Items[i]) do
if copy(Form11.ListBox1.Items[i],j,1)='\'   then ps:=j;
reagent[i]:=copy(Form11.ListBox1.Items[i],ps+1,100);
end;
ps:=0;
for i:=0 to Form11.ListBox2.Items.Count-1 do begin
for j:=0 to length(Form11.ListBox2.Items[i]) do
if copy(Form11.ListBox2.Items[i],j,1)='\'   then ps:=j;
product[i]:=copy(Form11.ListBox2.Items[i],ps+1,100);
end;
///////////////////////////////////////////////////////////////////



///////////////////////в два столбца заполняем информацию о реагентах и продуктах//////////////

if Form11.ListBox1.Count>=Form11.ListBox2.Count then  begin
j:=0;
for  i:=0 to Form11.ListBox1.Items.Count-1 do  begin
if j<=Form11.ListBox2.Items.Count-1 then MSWord.Selection.TypeText(' '+reagent[i]+copy(probel,0,30-length(reagent[i]))+product[j]+#13)
else MSWord.Selection.TypeText(' '+reagent[i]+'             '+''+#13);
j:=j+1;
end;
end;

if Form11.ListBox1.Count<Form11.ListBox2.Count then  begin
j:=0;
for  i:=0 to Form11.ListBox2.Items.Count-1 do  begin
if j<=Form11.ListBox1.Items.Count-1 then MSWord.Selection.TypeText(' '+reagent[i]+copy(probel,0,30-length(reagent[i]))+product[j]+#13)
else MSWord.Selection.TypeText('                               '+product[i]+#13);
j:=j+1;
end;
end;

//////////////////////////////////////////////////////////////////
//MSWord.Selection.TypeParagraph;


MSWord.Selection.TypeText(' ------------------------------------------------------');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeParagraph;



MSWord.Selection.TypeText(' Sum of the parameters for all the reactants and products:');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' ------------------------------------------------------');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' Reactant:                     Products:');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' ------------------------------------------------------');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' E       = '+floattostr(summ1)+copy(probel,0,20-length(floattostr(summ1)))  + 'E       = '+floattostr(summ2));
MSWord.Selection.TypeParagraph;
if Label20.Caption<>'' then begin
MSWord.Selection.TypeText(' E+ZPE   = '+floattostr(summ_e_zpe_r)+copy(probel,0,20-length(floattostr(summ_e_zpe_r))) +'E+ZPE   = '+floattostr(summ_e_zpe_p));
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' U       = '+floattostr(summ_u_r)+copy(probel,0,20-length(floattostr(summ_u_r))) +'U       = '+floattostr(summ_u_p));
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' H       = '+floattostr(summ_h_r)+copy(probel,0,20-length(floattostr(summ_h_r))) +'H       = '+floattostr(summ_h_p));
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' G       = '+floattostr(summ_g_r)+copy(probel,0,20-length(floattostr(summ_g_r))) +'G       = '+floattostr(summ_g_p));
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' S       = '+floattostr(summ_entr_r)+copy(probel,0,20-length(floattostr(summ_entr_r))) +'S       = '+floattostr(summ_entr_p));
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' Cv      = '+floattostr(summ_c_r)+copy(probel,0,20-length(floattostr(summ_c_r))) +'Cv      = '+floattostr(summ_c_p));
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' Ethermo = '+floattostr(summ_e_term_r)+copy(probel,0,20-length(floattostr(summ_e_term_r))) +'Ethermo = '+floattostr(summ_e_term_p));
MSWord.Selection.TypeParagraph;
end;
MSWord.Selection.TypeText(' ------------------------------------------------------');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeParagraph;








MSWord.Selection.TypeText(' Thermochemical and thermodinamyc parameters of reaction:');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' deltaE = '+floattostr(Etot)+' kcal/mol');
MSWord.Selection.TypeParagraph;
if Label20.Caption<>'' then begin
MSWord.Selection.TypeText(' delta(E+ZPE) = '+floattostr(EZPE)+' kcal/mol');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' deltaU = '+floattostr(U)+' kcal/mol');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' deltaH = '+floattostr(H)+' kcal/mol');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' deltaG = '+floattostr(G)+' kcal/mol');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' deltaS = '+floattostr(S1)+' cal/mol*K');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' deltaCv = '+floattostr(Cv)+' cal/mol*K');
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' deltaEterm = '+floattostr(Et)+' kcal/mol');
MSWord.Selection.TypeParagraph;
end;
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeParagraph;
MSWord.Selection.TypeText(' ***** End of DATA *****  /'+Datetostr(Now)+'/');




















0: end;

procedure TForm11.BitBtn6Click(Sender: TObject);
begin
Form11.Close;
end;

procedure TForm11.ListBox1Click(Sender: TObject);
var i,s: word;
summe: real;
begin
if ListBox1.Items.Count=0 then Form11.StatusBar1.Panels[0].Text:='';
summe:=0;
s:=0;
for i:=0 to ListBox1.Items.Count-1 do begin
if ListBox1.Selected[i] then begin
s:=s+1;
DecimalSeparator:='.';    // For Win7 and later
summe:=summe+strtofloat(en_r[i]);
Form11.StatusBar1.Panels[0].Text:='Reactants: E = '+floattostr(summe);
end;
end;
if s=1 then  begin
if N_termination_r[ListBox1.ItemIndex]=true then Form11.StatusBar1.Panels[1].Text:='Normal termination of Gaussian'
else Form11.StatusBar1.Panels[1].Text:='Warning! Abnormal termination of Gaussian!';
end
else Form11.StatusBar1.Panels[1].Text:='';
end;

procedure TForm11.ListBox2Click(Sender: TObject);
var i,s: word;
summe: real;
begin
if ListBox2.Items.Count=0 then Form11.StatusBar1.Panels[0].Text:='';
summe:=0;
s:=0;
for i:=0 to ListBox2.Items.Count-1 do begin
if ListBox2.Selected[i] then begin
s:=s+1;
summe:=summe+strtofloat(en_p[i]);
Form11.StatusBar1.Panels[0].Text:='Products: E = '+floattostr(summe);
end;
end;

if s=1 then  begin
if N_termination_p[ListBox2.ItemIndex]=true then Form11.StatusBar1.Panels[1].Text:='Normal termination of Gaussian'
else Form11.StatusBar1.Panels[1].Text:='Warning! Abnormal termination of Gaussian!';
end
else Form11.StatusBar1.Panels[1].Text:='';

end;

procedure TForm11.ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ListBox1.Items.Count=0 then begin
Form11.StatusBar1.Panels[0].Text:='';
Form11.StatusBar1.Panels[1].Text:='';
end;
end;

procedure TForm11.ListBox2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ListBox2.Items.Count=0 then begin
Form11.StatusBar1.Panels[0].Text:='';
Form11.StatusBar1.Panels[1].Text:='';
end;
end;

end.
