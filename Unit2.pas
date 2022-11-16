unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OpenGL;

type
  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    DC : HDC;
    hrc: HGLRC;
    quadObj : GLUquadricObj;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
{$MAXSTACKSIZE 1048576000}

procedure SetDCPixelFormat (hdc : HDC);
var
 pfd : TPixelFormatDescriptor;
 nPixelFormat : Integer;
begin
 FillChar (pfd, SizeOf (pfd), 0);
 pfd.dwFlags  := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER;
 nPixelFormat := ChoosePixelFormat (hdc, @pfd);
 SetPixelFormat (hdc, nPixelFormat, @pfd);
end;



procedure TForm2.FormCreate(Sender: TObject);
begin
Form2.Color:=RGB(round(255*0.5),round(255*0.5),round(255*0.75));
 DC := GetDC (Handle);
 SetDCPixelFormat(DC);
 hrc := wglCreateContext(DC);
 wglMakeCurrent(Canvas.Handle, hrc);
 quadObj := gluNewQuadric;
 gluQuadricDrawStyle (quadObj, GLU_FILL);
  glClearColor (0.5, 0.5, 0.75, 1.0); //÷вет фона
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 gluDeleteQuadric (quadObj);
 wglMakeCurrent(0, 0);
 wglDeleteContext(hrc);
 ReleaseDC (Handle, DC);
 DeleteDC (DC);
end;

procedure TForm2.FormPaint(Sender: TObject);
begin
glEnable(GL_LIGHTING);
glEnable(GL_LIGHT0);
 glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT); //ќчистка буфера цвета и глубины
  glPushMatrix;
 glColor3f(0.2,0.7,0.9);
 glTranslatef (0.0, 0.0, -3.0);


 gluSphere(quadObj,0.4,100,100);
 glPopMatrix;






 SwapBuffers(Canvas.Handle);
 //wglMakeCurrent(0, 0);




end;

procedure TForm2.FormResize(Sender: TObject);
begin
glViewport(0, 0, ClientWidth, ClientHeight);
 glMatrixMode(GL_PROJECTION);
 glLoadIdentity;
 gluPerspective(60.0, ClientWidth / ClientHeight, 1.0, 20.0);
 glMatrixMode(GL_MODELVIEW);
 glLoadIdentity;
 InvalidateRect(Handle, nil, False);
end;

end.
