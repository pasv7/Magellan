unit Unit42;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm42 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form42: TForm42;

implementation

uses Unit36;

{$R *.dfm}

procedure TForm42.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=True then Form36.CheckBox1.Checked:=True;
if CheckBox1.Checked=False then Form36.CheckBox1.Checked:=False;
Form36.PaintBox1.Repaint;
end;

procedure TForm42.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked=True then Form36.CheckBox2.Checked:=True;
if CheckBox2.Checked=False then Form36.CheckBox2.Checked:=False;
Form36.PaintBox1.Repaint;
end;

procedure TForm42.CheckBox3Click(Sender: TObject);
begin
if CheckBox3.Checked=True then Form36.CheckBox3.Checked:=True;
if CheckBox3.Checked=False then Form36.CheckBox3.Checked:=False;
Form36.PaintBox1.Repaint;
end;

procedure TForm42.CheckBox4Click(Sender: TObject);
begin
if CheckBox4.Checked=True then Form36.CheckBox4.Checked:=True;
if CheckBox4.Checked=False then Form36.CheckBox4.Checked:=False;
Form36.PaintBox1.Repaint;
end;

procedure TForm42.CheckBox5Click(Sender: TObject);
begin
//x_1:=nil;
//y_1:=nil;
//z_1:=nil;
//scal:=0;
//ux:=ugolx;
//uy:=ugoly;
//uz:=ugolz;
//bonds_painted:=true;
//are_bonds:=nil;
Form36.PaintBox1.Repaint;
end;

end.
