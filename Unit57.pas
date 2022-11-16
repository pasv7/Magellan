unit Unit57;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm57 = class(TForm)
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
    BitBtn1: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox7: TGroupBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form57: TForm57;

implementation

uses Unit56;

{$R *.dfm}

procedure TForm57.FormCreate(Sender: TObject);
begin
Form56.Color:=Form57.ColorBox3.Selected;
end;

procedure TForm57.BitBtn1Click(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.ComboBox1Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.ColorBox1Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.ComboBox2Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.ColorBox2Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.ColorBox3Change(Sender: TObject);
begin
Form56.Color:=Form57.ColorBox3.Selected;
Form56.PaintBox1.Color:=Form57.ColorBox3.Selected;
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.ComboBox3Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.ColorBox4Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.ComboBox4Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.RadioButton1Click(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.RadioButton2Click(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.CheckBox1Click(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.CheckBox2Click(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.CheckBox3Click(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.CheckBox4Click(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.TrackBar1Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

procedure TForm57.TrackBar2Change(Sender: TObject);
begin
Form56.PaintBox1.Invalidate;
end;

end.
