unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ShellAPI;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label9MouseLeave(Sender: TObject);
    procedure Label9MouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
Form4.Close;
end;

procedure TForm4.Label9Click(Sender: TObject);
begin
ShellExecute(Application.Handle, nil, 'http://pandoragroup.com', nil, nil,SW_SHOWNOACTIVATE);
end;

procedure TForm4.Label9MouseLeave(Sender: TObject);
begin
Label9.Font.Color := clPurple;
end;

procedure TForm4.Label9MouseEnter(Sender: TObject);
begin
Label9.Font.Color := clred;
end;

end.
