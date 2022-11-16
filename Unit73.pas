unit Unit73;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TForm73 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label2: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Label3: TLabel;
    Edit16: TEdit;
    Label4: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Memo1: TMemo;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form73: TForm73;
  arrx,rrx,mas,xstd,ystd,zstd: array of Real;
  h: extended = 6.62608E-34;
  h2ok: extended = 3.18002e-44; // h^2/kb
  clight: real = 299792458;
  Tc: real = 298.15;
  RJ: real = 8.31451;
  NA: real = 6.02214E+23;
  pi: real = 3.141592653589;
  kB: real = 1.38066E-23;
  Po: real = 1.0e5; // use Po = 101325 for 1 atm standard state
  lamdainv: real = 0.025947136;
  natm: integer = 0;
  sigma: integer = 1; // rotational symmetry number=order of rotational subgroup
  symtol: real = 0.02; // tolerance for symmetry matching
  symrange: real = 25.0; // factor for increasing symtol for large molecules
  TK: real = 0 ; // temperature

implementation

uses Unit1;

{$R *.dfm}

procedure moment();              // calculate the moment of inertia matrix
var sxx,syy,szz,sxy,sxz,syz,xcm,ycm,zcm,mt: Real;
i: Integer;
xaft,yaft,zaft: array of Real;
begin
syy:=0.0;
szz:=0.0;
sxy:=0.0;
sxz:=0.0;
syz:=0.0;
xcm:=0.0;
ycm:=0.0;
zcm:=0.0;
mt:=0.0;
for i:=0 to natm-1 do begin
xcm:=xcm + mas[i]*StrToFloat(x[i]);
ycm:=ycm + mas[i]*StrToFloat(y[i]);
zcm:=zcm + mas[i]*StrToFloat(z[i]);
mt:=mt + mas[i];
end;

xcm:=xcm/mt;
ycm:=ycm/mt;
zcm:=zcm/mt;

SetLength(xaft,Length(x)-2);
SetLength(yaft,Length(y)-2);
SetLength(zaft,Length(z)-2);

for i:=0 to natm-1 do begin
xaft[i]:=StrToFloat(x[i])-xcm;
yaft[i]:=StrToFloat(y[i])-ycm;
zaft[i]:=StrToFloat(z[i])-zcm;
end;
for i:=0 to natm-1 do begin
sxx:=mas[i]*xaft[i]*xaft[i];
syy:=mas[i]*yaft[i]*yaft[i];
szz:=mas[i]*zaft[i]*zaft[i];
sxy:=mas[i]*xaft[i]*yaft[i];
sxz:=mas[i]*xaft[i]*zaft[i];
syz:=mas[i]*yaft[i]*zaft[i];
end;
SetLength(arrx,6);
arrx[0]:=syy+szz;
arrx[1]:=-sxy;
arrx[2]:=sxx+szz;
arrx[3]:=-sxz;
arrx[4]:=-syz;
arrx[5]:=sxx+syy ;
end;





function getBe(Inert: Real; units: String): Real;
var Be: Real;
begin
if Inert>0.001  then begin
  Inert:=Inert/NA/1000*1E-20;
  Be:=h/8/pi/pi/Inert/clight/100;                  // cm-1
  if units='G' then Be:=Be*clight*100*1e-9;
  if units='T' then Be:=h2ok/8/pi/pi/Inert;        // K
end;
Result:=Be;
end;




function getStr(MM,TK: Real):Real;  // calculate translational entropy
var qt,str: Real;
begin
qt:=lamdainv*power(TK,2.5)*power(MM,1.5) ;
Str:=RJ*ln(qt) + 2.5*RJ ;
Result:=Str;
end; // end fcn getStr




function getqr(Ae,Be,Ce,TK: Real):Real;       // calculate rotational partition function
var qr: Real;
begin
qr:=0.0;
if Ce < 0.001 then qr:=TK/Be/sigma  else qr:=Sqrt(pi*TK/Ae*TK/Be*TK/Ce)/sigma;
Result:=qr;
end; // end fcn getqr



function getSr(Ae,Be,Ce,TK: Real):Real;       // calculate rotational contribution to the entropy
var sr: Real;
begin
Sr:=0.0;
if Ce < 0.001 then Sr:=RJ*ln(TK/Be/sigma)+RJ  else  Sr:=RJ*ln(Sqrt(pi*TK/Ae*TK/Be*TK/Ce)/sigma) + 1.5*RJ;
Result:=Sr;
end; // end fcn getSr



// rotate molecule into principal coordinate frame
// new X = R(tr)*X, X = (x(k),y(k),z(k)) for atom k
procedure pcs(x,y,z: array of Real);
var t: array[1..3] of Real;
k,i: Integer;
begin
SetLength(xstd,natm);
SetLength(ystd,natm);
SetLength(zstd,natm);
for k:=0 to natm-1 do begin
for i:=1 to 3 do
t[i]:=rrx[1+(i-1)*3]*x[k] + rrx[2+(i-1)*3]*y[k] +rrx[3+(i-1)*3]*z[k];
xstd[k]:=t[1];
ystd[k]:=t[2];
zstd[k]:=t[3];
end; // end for k
end; // end fcn pcs





function symcmp(axis,ang: Real): Boolean;
// rotate point x,y,z around axis=x,y,z by ang
// reflect point x,y,z across plane=axis=xz,xy,yz
// improper rotation axis-xyz,yxz,zxy
// invert point x,y,z through cm axis=i
// new X = T*X, X = (x(k),y(k),z(k)) for atom k
// symtol = tolerance for symmetry matching
// symrange = scaling factor for increasing stol for large molecules
var plane,xt,yt,zt,cosa,sina,dx,dy,dz,d2,stol: Real;
k,j: Integer;
begin
plane:=axis;
xt:=0.0;
yt:=0.0;
zt:=0.0;
cosa:=cos(ang/360*2*pi);
sina:=sin(ang/360*2*pi);
dx:=0.0;
dy:=0.0;
dz:=0.0;
d2:=0.0;
stol:=0.0;
{
if axis.length>2  then begin
 plane:=Copy(axis,1,2);
 axis:=Copy(axis,1,1);
end;
}

// test each atom
{
for k:=0 to natm-1 do begin
xt:=x[k];
yt:=y[k];
zt:=z[k];
if axis='x' then begin
yt:=cosa*y[k] - sina*z[k];
zt:=sina*y[k] + cosa*z[k];
end;
if axis='y' then begin
xt:=cosa*x[k] + sina*z[k];
zt:=-sina*x[k] + cosa*z[k];
end;
if axis='z' then begin
xt:=cosa*x[k] - sina*y[k];
yt:=sina*x[k] + cosa*y[k];
end;
if axis='i' then begin
xt:=-xt;
yt:=-yt;
zt:=-zt;
end;
if plane='xz' then yt:=-yt;
if plane='xy' then zt:=-zt;
if plane='yz' then xt:=-xt;
// find symmetry related atom
// loosen tol for atoms far from cm
d2:=xt*xt+yt*yt*zt*zt;
stol:=symtol*(1.0+d2/symrange);
for j:=0 to natm-1 do begin
 if  m[j]!= m[k] then begin
  dx:=Abs(x[j]-xt);
  dy:=Abs(y[j]-yt);
  dz:=Abs(z[j]-zt);
  if (dx<stol) and (dy<stol) and (dz<stol) then Break;
 end;
 if j=natm then Result:=False;
end;
Result:=True;
}
end;

{
function alignC2(prinax: Real):Boolean;
var yc2,xc2,zc2,r: Real;
j,k: Integer;
begin
// Rotate molecule into unique principal coordinate frame for pc(y).
// The pcf for moments along y and z are not unique for degenerate eigenvalues.
// This routine finds atom pair centroids
// and rotates around the principal to place this C2 along the y-axis.
// new X = R*X, X = (x(k),y(k),z(k)) for atom k
yc2:=0.0; // point on proposed C2 axis
xc2:=0.0; // xcoor on C2 axis
zc2:=0.0; // zcoor on C2 axis
r:=0.0;
//form.Out.value += "aligning C2 axes...\n" ;
for j:=0 to natm-1 do  begin
for k:=j+1 to natm-1 do  begin
//if m[j]!= m[k] then begin
//if prinax='x' then begin
if Abs(x[k]+x[j])>symtol then begin
yc2:=(y[k]+y[j])/2;
zc2:=(z[k]+z[j])/2;
if (Abs(yc2)<symtol) and (Abs(zc2<symtol)) then begin
r:=Sqrt(yc2*yc2+zc2*zc2);
cosa:=yc2/r;
sina:=zc2/r;
end;
end;
end;

if prinax='z' then begin
if Abs(z[k]+z[j])>symtol then begin
yc2:=(y[k]+y[j])/2;
xc2:=(x[k]+x[j])/2;
if (Abs(yc2)<symtol) and (Abs(xc2<symtol)) then begin
r:=Sqrt(yc2*yc2+xc2*xc2);
cosa:=yc2/r;
sina:=xc2/r;
end;
end;
end;
rot(prinax,cosa,sina);
if symcmp('y',180.0) ) then Result:=True;
end;
end;
end;
Result:=False;
end;


function alignv(rotax: Real) : Boolean;
var r,cosa,sina: Real;
vplane1: String;
i: Integer;
begin
r:=0.0;
cosa:=0.0;
sina:=0.0;
if rotax='x' then vplane1:='xy' else vplane1:='yz';
//form.Out.value += 'aligning vertical mirror...\n';
for i:=0 to natm-1 do  begin
// dont' use atoms that are on principal axis
if (rotax='x') and (Abs(y[i])<symtol) and (Abs(z[i])<symtol) then begin
if (rotax ='z') and (Abs(y[i])<symtol) and (x[i]<symtol) then  begin
if rotax='x' then begin
r:=Sqrt(y[i]*y[i]+z[i]*z[i]);
cosa:=y[i]/r;
sina:=z[i]/r;
end;
if rotax='z' then begin
r:=Sqrt(y[i]*y[i]+x[i]*x[i]);
cosa:=y[i]/r;
sina:=x[i]/r;
end;
rot(rotax,cosa,sina);
if symcmp(vplane1,0.0)=True then Result:=True;
end;
end;
end;
Result:=False;
end;
}



function aligna(): Integer;
var mxorder,mxi,mxj,ia: Integer;
begin
// Rotate molecule into unique principal coordinate frame for pc(x).
// The pcf is not unique for degenerate eigenvalues.
// This routine is specific for cubic groups.
// This routine rotates atoms to the x axis and finds maximum order,
// failing that rotates atom pair centroids to the x axis and fins maximum order.
// order=2,3(Th) ; 2,3,4(Oh) ; 2,3,5(Ih) but the 5-fold will not be on an atom
// new X = R*X, X = (x(k),y(k),z(k)) for atom k





end;


 {
// Rotate molecule into unique principal coordinate frame for pc(x).
// The pcf is not unique for degenerate eigenvalues.
// This routine is specific for cubic groups.
// This routine rotates atoms to the x axis and finds maximum order,
// failing that rotates atom pair centroids to the x axis and fins maximum order.
// order=2,3(Th) ; 2,3,4(Oh) ; 2,3,5(Ih) but the 5-fold will not be on an atom
// new X = R*X, X = (x(k),y(k),z(k)) for atom k
var mxorder = 1 ;
var mxi = 0 ; var mxj = 0 ;

// rotate atoms to the x axis
for (var ia=0 ; ia<natm ; ia++ ) {
 if ( (Math.abs(y[ia])>symtol)||(Math.abs(z[ia])>symtol) ) {
  alignx(x[ia],y[ia],z[ia]) ;
 for ( nord=5 ; nord>1 ; nord-- ) { if ( symcmp("x",360.0/nord) ) break }
  // if ( nord > mxorder ) { mxorder = nord ; mxi = ia }
  // if ( mxorder>3 ) break ; // only Oh has a C4
 //} ; // end if y!=0 z!=0
//} ; // end for ia
//alignx(x[mxi],y[mxi],z[mxi]) ;

//if ( mxorder<4 ) {
// rotate pair centroids to x axis
//form.Out.value += "aligning centroids ...\n" ;
//for (var ia=0 ; ia<natm ; ia++ ) {
{ for (var ja=ia+1 ; ja<natm ; ja++ ) {
  if ( m[ia]!= m[ja] ) continue ;
  xc2 = (x[ia]+x[ja])/2 ;
  yc2 = (y[ia]+y[ja])/2 ;
  zc2 = (z[ia]+z[ja])/2 ;
   if ( (Math.abs(yc2)<symtol)&&(Math.abs(zc2<symtol)) ) continue ; // already tested
  alignx(xc2,yc2,zc2) ;
 for ( nord=5 ; nord>1 ; nord-- ) { if ( symcmp("x",360.0/nord) ) break }
  { if ( nord >= mxorder ) { mxorder = nord ; mxi = ia ; mxj = ja }
   {if ( mxorder>3 ) break ; // only Oh has a C4
 }  // end for ja
{ if ( mxorder>3) break ;
}  // end for ia
{alignx((x[mxi]+x[mxj])/2,(y[mxi]+y[mxj])/2,(z[mxi]+z[mxj])/2) ;
}  // end if mxorder<4

{return mxorder ;
}  // end fcn aligna
























{

function getsigma(Ae,Be,Ce,form)           // get the rotational symmetry number from the point group
var dAB,dBC,Btol: Real;
order,nC2: Integer;
prinax, hplane, vplane1, vplane2, subgroup, group: string;
label 0;
begin
dAB:=0.0;
dBC:=0.0;
Btol:=0.01; // tolerance for B constant matching *100=%
order:=1;
nC2:=0;
prinax:='x';
hplane:='yz';
vplane1:='xy';
vplane2:='xz';
subgroup:='';
sigma:=1;
group:='C1';
if symtol>0.2 then Btol:=0.1; // loosen up symmetric top for very coarse symmetry
if symtol>0.2 then symrange:=12.0; // loosen up symtol scaling for very coarse sym
//linear 0xC2 axis Cinfv, 1xC2 axis Dinfh
if Ce<0.003 then begin
 group:='Cinfv';
 if symcmp('x',180.0) then begin
  sigma:=2;
  group:='Dinfh';
 end;
end; // end if linear

dAB:=Abs(Ae - Be)/Ae;
dBC:= Abs(Be - Ce)/Be;
// asymmetric top 1xC2 axis -> C2x, 3xC2 axes -> D2x
if  ( (dAB>Btol)&&(dBC>Btol) ) then begin
  if  symcmp('x',180.0) then nC2:=nC2+1;
  if symcmp('y',180.0) then begin
   nC2:=nC2+1;
   hplane:='xz';
   vplane2:='yz'
  end;

 if symcmp('z',180.0) then begin
  nC2:=nC2+1;
  hplane:='xy';
  vplane2:='yz';
 end;

 if nC2>0 then order = 2;    //////////////////////////////////////////////////////
 if nC2>1 then group:='D' else group:='C';
 if (symcmp(vplane1,0.0)=True) or (symcmp(vplane2,0.0)=True) then subgroup:='v' else subgroup:='';
 if symcmp('i',0.0)=True then subgroup:='i';
 if symcmp('xyz',90.0)=True then subgroup:='d';
 if symcmp('hplane',0.0)=True then subgroup:='h';
 if (group='C') and (subgroup='d') then begin
  group:='S';
  subgroup:='';
 end;
 if group:='S' then group:=group+2*order else group:=group+order;
 group:=group+subgroup;
 if (group='C1v') or (group='C1h') then group:='Cs';
 if group='C1i' then group:='Ci';
 if nC2>1 then sigma:=2*order else sigma:=order;
end; // end if asymmetric top

// spherical top 0xi -> Td, 0xC5 -> Oh, 1xC5 -> Ih
if (dAB<=Btol) and (dBC<=Btol) then begin
 order:=aligna;
 alignv('x',form);
 if (order=2) or (order=3)  then order:=aligndi(order);
 if order=5 then begin
  sigma:=60;
  if symcmp('i',0.0)=True then group:='Ih' else group:='I';
 end;
 if order=4 then begin
  sigma:=24;
  if symcmp('i',0.0)=True then group:='Oh' else group:='O';
 end;
 if order=3 then begin
  sigma:=12;
  if symcmp('i',0.0)=True then group:='Th' else begin
   if symcmp('xy',0.0)=True then group:='Td' else group:='T';
  end;
 end;
end;

if  ((dAB<=Btol) and (dBC>Btol)) or ((dAB>Btol) and (dBC<=Btol)) then begin
 for nord:=6 downto 2 do
 if  symcmp('x',360.0/nord)=True then Break;
 order:=nord;
 prinax:='x';
 for nord:=6 downto 2 do
 if  symcmp('z',360.0/nord)=True then Break;
 if nord>order then begin
  order:=nord;
  prinax:='z';
 end;
 if (order<2) and (dAB<Btol) then prinax:='z';  // for D2 A=B>C

// check for C2
if alignC2(prinax)=True then begin
if order = 1 then begin
 order:=2;
 prinax:='y'
end
else nC2:=nC2+1;
end;
if prinax='y' then begin
hplane:='xz';
vplane1:='xy';
vplane2:='yz'
end;
if prinax='z' then begin
hplane:='xy';
vplane1:='yz';
end;
if (prinax!='x') and (symcmp('x',180.0)=True) then nC2:=nC2+1;
if (prinax!='y') and (symcmp('y',180.0)=True) then nC2:=nC2+1;
if (prinax!='z') and (symcmp('z',180.0)=True) then nC2:=nC2+1;
if (nC2>0) and (order<2)  then begin
ShowMessage('Error!);
goto 0;
end;
if nC2>0 then   group:='D' else group:='C';

//  get subgroup
if group!='D' then begin
if (symcmp(vplane1,0.0)=True) or (symcmp(vplane2,0.0)=True) then subgroup:='v'
 else if alignv(prinax)=True then subgroup:='v' else subgroup:='';
end;
if symcmp(prinax+hplane,360.0/2/order)=True then subgroup:='d';
if symcmp(hplane,0.0)=True then subgroup:='h';
if (group='C') and (subgroup='d') then begin
 group:='S';
 subgroup:='';
end;
if group='S' then group:=group+2*order else group:=group+order;
group:=group+subgroup;
 if nC2>0 then  sigma:=2*order else sigma:=order;
end; // end if symmetric top
Result:=sigma;
0: end; // end fcn getsigma
}



















procedure TForm73.FormShow(Sender: TObject);
begin
/////////
end;

end.
