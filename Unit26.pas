unit Unit26;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm26 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ColorBox1: TColorBox;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ColorBox2: TColorBox;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    BitBtn1: TBitBtn;
    GroupBox4: TGroupBox;
    ColorBox3: TColorBox;
    GroupBox5: TGroupBox;
    ComboBox3: TComboBox;
    ColorBox4: TColorBox;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox4: TComboBox;
    Label7: TLabel;
    GroupBox6: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox4: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ColorBox4Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;

implementation

uses Unit25;

{$R *.dfm}

procedure TForm26.CheckBox1Click(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.CheckBox2Click(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.CheckBox3Click(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.ComboBox1Change(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.ColorBox1Change(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.ComboBox2Change(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.ColorBox2Change(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.BitBtn1Click(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.ColorBox3Change(Sender: TObject);
begin
Form25.Color:=Form26.ColorBox3.Selected;
Form25.PaintBox1.Color:=Form26.ColorBox3.Selected;
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.ComboBox3Change(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.ColorBox4Change(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.ComboBox4Change(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.CheckBox4Click(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.FormCreate(Sender: TObject);
begin
Form25.Color:=Form26.ColorBox3.Selected;
end;

procedure TForm26.RadioButton1Click(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

procedure TForm26.RadioButton2Click(Sender: TObject);
begin
Form25.PaintBox1.Invalidate;
end;

end.
