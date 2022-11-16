unit Unit62;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TForm62 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ColorBox1: TColorBox;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox2: TComboBox;
    ColorBox2: TColorBox;
    GroupBox4: TGroupBox;
    ColorBox3: TColorBox;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox3: TComboBox;
    ColorBox4: TColorBox;
    ComboBox4: TComboBox;
    GroupBox6: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ColorBox4Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form62: TForm62;

implementation

uses Unit61;

{$R *.dfm}

procedure TForm62.FormCreate(Sender: TObject);
begin
Form61.Color:=Form62.ColorBox3.Selected;
end;

procedure TForm62.CheckBox1Click(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.CheckBox2Click(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.CheckBox3Click(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.CheckBox4Click(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.ComboBox1Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.ComboBox2Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.ColorBox1Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.ColorBox2Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.TrackBar1Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.TrackBar2Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.ComboBox3Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.ColorBox4Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.ComboBox4Change(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.RadioButton1Click(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.RadioButton2Click(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.BitBtn1Click(Sender: TObject);
begin
Form61.PaintBox1.Invalidate;
end;

procedure TForm62.ColorBox3Change(Sender: TObject);
begin
Form61.Panel2.Color:=Form62.ColorBox3.Selected;
Form61.PaintBox1.Color:=Form62.ColorBox3.Selected;
Form61.PaintBox1.Invalidate;
end;

end.
