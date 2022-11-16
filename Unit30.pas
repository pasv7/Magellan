unit Unit30;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm30 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    ColorBox1: TColorBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    ComboBox2: TComboBox;
    ColorBox2: TColorBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    ColorBox3: TColorBox;
    GroupBox5: TGroupBox;
    ComboBox3: TComboBox;
    ColorBox4: TColorBox;
    ComboBox4: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox6: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
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
  Form30: TForm30;

implementation

uses Unit27;

{$R *.dfm}



procedure TForm30.CheckBox1Click(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.ColorBox3Change(Sender: TObject);
begin
Form27.Color:=Form30.ColorBox3.Selected;
Form27.PaintBox1.Color:=Form30.ColorBox3.Selected;
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.CheckBox2Click(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.CheckBox3Click(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.CheckBox4Click(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.ComboBox1Change(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.ColorBox1Change(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.ComboBox2Change(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.ColorBox2Change(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.ComboBox3Change(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.ColorBox4Change(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.ComboBox4Change(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.RadioButton1Click(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.RadioButton2Click(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

procedure TForm30.Button1Click(Sender: TObject);
begin
Form27.PaintBox1.Invalidate;
end;

end.
