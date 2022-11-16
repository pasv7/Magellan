unit Unit32;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm32 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ComboBox1: TComboBox;
    ColorBox1: TColorBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    ColorBox2: TColorBox;
    Label3: TLabel;
    Label4: TLabel;
    ColorBox3: TColorBox;
    ComboBox3: TComboBox;
    ColorBox4: TColorBox;
    ComboBox4: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
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
  Form32: TForm32;

implementation

uses Unit29;

{$R *.dfm}

procedure TForm32.CheckBox1Click(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.CheckBox2Click(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.CheckBox3Click(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.CheckBox4Click(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.ComboBox1Change(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.ColorBox1Change(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.ComboBox2Change(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.ColorBox2Change(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.ColorBox3Change(Sender: TObject);
begin
Form29.Color:=Form32.ColorBox3.Selected;
Form29.PaintBox1.Color:=Form32.ColorBox3.Selected;
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.ComboBox3Change(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.ColorBox4Change(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.ComboBox4Change(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.RadioButton1Click(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.RadioButton2Click(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

procedure TForm32.Button1Click(Sender: TObject);
begin
Form29.PaintBox1.Invalidate;
end;

end.
