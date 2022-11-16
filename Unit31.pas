unit Unit31;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm31 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ColorBox1: TColorBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ColorBox2: TColorBox;
    ColorBox3: TColorBox;
    GroupBox5: TGroupBox;
    ComboBox3: TComboBox;
    Label4: TLabel;
    ColorBox4: TColorBox;
    Label5: TLabel;
    ComboBox4: TComboBox;
    Label6: TLabel;
    GroupBox6: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Label7: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ColorBox4Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form31: TForm31;

implementation

uses Unit28;

{$R *.dfm}

procedure TForm31.CheckBox1Click(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.CheckBox2Click(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.CheckBox3Click(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.CheckBox4Click(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.ComboBox1Change(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.ColorBox1Change(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.ComboBox2Change(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.ColorBox2Change(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.ColorBox3Change(Sender: TObject);
begin
Form28.Color:=Form31.ColorBox3.Selected;
Form28.PaintBox1.Color:=Form31.ColorBox3.Selected;
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.ComboBox3Change(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.ColorBox4Change(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.ComboBox4Change(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.RadioButton1Click(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.RadioButton2Click(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

procedure TForm31.Button1Click(Sender: TObject);
begin
Form28.PaintBox1.Invalidate;
end;

end.
