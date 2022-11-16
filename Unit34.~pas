unit Unit34;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TForm34 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
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
    ComboBox5: TComboBox;
    Label8: TLabel;
    ColorBox5: TColorBox;
    Label9: TLabel;
    ComboBoxEx1: TComboBoxEx;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ColorBox4Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ColorBox5Change(Sender: TObject);
    procedure ComboBoxEx1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form34: TForm34;

implementation

uses Unit33;

{$R *.dfm}

procedure TForm34.FormCreate(Sender: TObject);
var
  myImages : TImageList;
  image : TBitmap;
begin
image := TBitmap.Create();

 myImages := TImageList.CreateSize(102, 6);
  image.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Solid.bmp');
  myImages.Add(image,nil);
  image.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Dash.bmp');
  myImages.Add(image,nil);
  image.LoadFromFile(copy(Application.ExeName,0,length(Application.ExeName)-length(Application.Title)-4)+'Dot.bmp');
  myImages.Add(image,nil);
  ComboBoxEx1.Images := myImages;


  ComboBoxEx1.ItemsEx.AddItem('Solid', 0, 0, 0, 0, nil);
  ComboBoxEx1.ItemsEx.AddItem('Dash', 1, 1, 1, 0, nil);
  ComboBoxEx1.ItemsEx.AddItem('Dot', 2, 2, 2, 0, nil);



   //Setting the default value
  ComboBoxEx1.ItemIndex := 0;


  image.Free;
  myImages.FreeOnRelease;

end;

procedure TForm34.CheckBox1Click(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.CheckBox2Click(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.CheckBox3Click(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.CheckBox4Click(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.CheckBox5Click(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ComboBox1Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ColorBox1Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ComboBox2Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ColorBox2Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ColorBox3Change(Sender: TObject);
begin
Form33.Color:=Form34.ColorBox3.Selected;
Form33.PaintBox1.Color:=Form34.ColorBox3.Selected;
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ComboBox3Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ColorBox4Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ComboBox4Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ComboBox5Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ColorBox5Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.ComboBoxEx1Change(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

procedure TForm34.BitBtn1Click(Sender: TObject);
begin
Form33.PaintBox1.Invalidate;
end;

end.
