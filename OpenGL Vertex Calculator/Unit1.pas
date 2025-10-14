unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Opengl, StdCtrls, ComCtrls, Buttons, XPMan, Vcl.Menus,
  Vcl.Samples.Spin;

const
  MaxDim=10;                        
  GL_POLYGON_OFFSET_FILL=$8037;

type
  TVect=array[1..MaxDim] of Single;                
  TMatrix=array[1..MaxDim,1..MaxDim] of Single;    
  TForm1 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Animate1: TMenuItem;
    Randomize1: TMenuItem;
    GroupBox2: TGroupBox;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    N1: TMenuItem;
    Panel3: TMenuItem;
    Bit1: TMenuItem;
    x81: TMenuItem;
    x161: TMenuItem;
    x241: TMenuItem;
    x321: TMenuItem;
    Label1: TLabel;
    Bitmap1: TMenuItem;
    Style1: TMenuItem;
    Wireframe1: TMenuItem;
    LightingFaces1: TMenuItem;
    HiddenLines1: TMenuItem;
    Lightingfacesandhiddenlines1: TMenuItem;
    Hiddenlineswithpattern1: TMenuItem;
    N3: TMenuItem;
    Button4: TButton;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Button2: TButton;
    Label2: TLabel;
    Button5: TButton;
    Vertex1: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    Data1: TMenuItem;
    SaveDialog2: TSaveDialog;
    Timer2: TTimer;
    SpinEdit1: TSpinEdit;
    Button3: TButton;
    Button6: TButton;
    RenderFrames1: TMenuItem;
    Abort1: TMenuItem;
    N2: TMenuItem;
    Button7: TButton;
    Colors1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Animate1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Randomize1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure x81Click(Sender: TObject);
    procedure x161Click(Sender: TObject);
    procedure x241Click(Sender: TObject);
    procedure x321Click(Sender: TObject);
    procedure Bitmap1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Data1Click(Sender: TObject);
    procedure RenderFrames1Click(Sender: TObject);
    procedure Abort1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Wireframe1Click(Sender: TObject);
    procedure LightingFaces1Click(Sender: TObject);
    procedure HiddenLines1Click(Sender: TObject);
    procedure Lightingfacesandhiddenlines1Click(Sender: TObject);
    procedure Hiddenlineswithpattern1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Colors1Click(Sender: TObject);
  private
    FGLRC:HGLRC;                
    FVertexes:array of TVect;   
    FDim:Integer;               
    FMatrix:TMatrix;            
    procedure TrackBarChange(Sender:TObject);          
    procedure MakeMatrix;                              
    procedure DrawScene;                               
    procedure Animate;                                 
  public
  end;
var
  Form1: TForm1;
  frame : integer = 0;
  abort : Boolean;

procedure glPolygonOffset(factor:GLfloat;units:GLfloat);stdcall;external Opengl32;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.FormCreate(Sender: TObject);       
var
  PFd:TPixelFormatDescriptor;
  c:Integer;
begin
  ZeroMemory(@PFD,SizeOf(PFD));
  PFD.nSize:=SizeOf(PFD);
  PFD.nVersion:=1;
  PFD.dwFlags:=PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER;     
  PFD.iPixelType:=PFD_TYPE_RGBA;
  PFD.cColorBits:=GetDeviceCaps(Canvas.Handle,BITSPIXEL);
  PFD.cAlphaBits:=8;                   
  PFD.cDepthBits:=16;                  
  PFD.cStencilBits:=16;                
  c:=ChoosePixelFormat(Canvas.Handle,@PFD);

  Assert(c<>0,'No valid pixel foprmat is supported: '+SysErrorMessage(GetLastError));
  Assert(SetPixelFormat(Canvas.Handle,c,@PFD),'Couldnt set the pixel format: '+
         SysErrorMessage(GetLastError));
  FGLRC:=wglCreateContext(Canvas.Handle);
  Assert(FGLRC<>0,'Couldnt create a valid GL context: '+
         SysErrorMessage(GetLastError));
  Assert(wglMakeCurrent(Canvas.Handle,FGLRC),'Couldnt create use the GL context: '+
        SysErrorMessage(GetLastError));
  SetLength(FVertexes,0);

  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\Vertex\Vertex.inc');

  ComboBox1Change(nil);                
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  DrawScene;
  glFlush;
  SwapBuffers(Canvas.Handle);    
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  Bitmap: TBitmap;
  DC: HDC;
  FileName: string;
begin
  frame := frame + 1;

  // Render Bitmap Picture Image
  Bitmap := TBitmap.Create;
  try
    Assert(HandleAllocated);
    DC := GetWindowDC(Handle);
    Win32Check(DC <> 0);

    if RadioButton1.Checked = true then Bitmap.PixelFormat := pf4bit;
    if RadioButton2.Checked = true then Bitmap.PixelFormat := pf8bit;
    if RadioButton3.Checked = true then Bitmap.PixelFormat := pf24bit;
    if RadioButton4.Checked = true then Bitmap.PixelFormat := pf32bit;

    if Panel3.Checked = true then begin
      Bitmap.SetSize(Width-(Panel1.Width+70), Height-80);
      Win32Check(BitBlt(Bitmap.Canvas.Handle, 0, 0,
                Width-Panel1.Width, Height,
                DC, 50, 50, SRCCOPY));
    end;

    if Panel3.Checked =false then begin
      Bitmap.SetSize(Width-100, Height-100);
      Win32Check(BitBlt(Bitmap.Canvas.Handle, 0, 0,
                Width-100, Height-100,
                DC, 50, 50, SRCCOPY));
    end;

    FileName := '.' + GraphicExtension(TBitmap);
    Bitmap.SaveToFile(ExtractFilePath(Application.ExeName) +
                      'Data\Frames\Frames_' + IntToStr(frame) + FileName);
    StatusBar1.Panels[2].Text := 'Render Frames ' + IntToStr(frame)  + ' please wait';

    if abort = true then
    begin
      Screen.Cursor := crDefault;
      ReleaseDC(Handle, DC);
      Bitmap.Free;
      Timer2.Enabled := false;
      Button4.Enabled := true;
      Button6.Enabled := false;
      RenderFrames1.Enabled := true;
      Abort1.Enabled := false;
      StatusBar1.Panels[2].Text := 'Render Bitmap Frames abort.';
      MessageDlg('Render Bitmap Frames abort',mtInformation, [mbOK], 0);
      Exit;
    end;

  finally

    if frame >= SpinEdit1.Value then
    begin
      Screen.Cursor := crDefault;
      ReleaseDC(Handle, DC);
      Bitmap.Free;
      Timer2.Enabled := false;
      Button4.Enabled := true;
      Button6.Enabled := false;
      RenderFrames1.Enabled := true;
      Abort1.Enabled := false;
      MessageDlg('Render Bitmap Frames done',mtInformation, [mbOK], 0);
      StatusBar1.Panels[2].Text := 'Render Bitmap Frames done.';
    end;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Assert(wglMakeCurrent(Canvas.Handle,0),'Couldnt unlock the GL context: '+
         SysErrorMessage(GetLastError));
  Assert(wglDeleteContext(FGLRC),'Couldnt delete the GL context: '+
         SysErrorMessage(GetLastError));
  SetLength(FVertexes,0);
end;

procedure TForm1.HiddenLines1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 2;
end;

procedure TForm1.Hiddenlineswithpattern1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 4;
end;

procedure TForm1.LightingFaces1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 1;
end;

procedure TForm1.Lightingfacesandhiddenlines1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 3;
end;

function PowerOfTwo(n:Integer):Integer;
begin
  Result:=Round(Exp(Ln(2)*n));
end;

procedure TForm1.Animate1Click(Sender: TObject);
begin
  CheckBox1.Checked := not CheckBox1.Checked;
  Animate1.Checked := not Animate1.Checked;
end;

procedure TForm1.Bitmap1Click(Sender: TObject);
begin
  Button1.Click;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Bitmap: TBitmap;
  DC: HDC;
  FileName: string;
begin
  // Render Bitmap Picture Image
  Bitmap := TBitmap.Create;
  try
    Assert(HandleAllocated);
    DC := GetWindowDC(Handle);
    Win32Check(DC <> 0);

    if RadioButton1.Checked = true then Bitmap.PixelFormat := pf4bit;
    if RadioButton2.Checked = true then Bitmap.PixelFormat := pf8bit;
    if RadioButton3.Checked = true then Bitmap.PixelFormat := pf24bit;
    if RadioButton4.Checked = true then Bitmap.PixelFormat := pf32bit;

    if Panel3.Checked = true then begin
      Bitmap.SetSize(Width-(Panel1.Width+70), Height-80);
      Win32Check(BitBlt(Bitmap.Canvas.Handle, 0, 0,
                Width-Panel1.Width, Height,
                DC, 50, 50, SRCCOPY));
    end;

    if Panel3.Checked =false then begin
      Bitmap.SetSize(Width-100, Height-100);
      Win32Check(BitBlt(Bitmap.Canvas.Handle, 0, 0,
                Width-100, Height-100,
                DC, 50, 50, SRCCOPY));
    end;

    FileName := '.' + GraphicExtension(TBitmap);
    if SaveDialog1.Execute then Bitmap.SaveToFile(SaveDialog1.FileName + FileName);
  finally
    ReleaseDC(Handle, DC);
    Bitmap.Free;
    StatusBar1.Panels[2].Text := 'Bitmap Export done.';
  end;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ComboBox1Change(nil);
  Button5.Click;
  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\Vertex\Vertex.inc');
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Animate1.Checked := not Animate1.Checked;
end;

procedure TForm1.Colors1Click(Sender: TObject);
begin
  Button7.Click;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  a,b,c,n:Integer;
  t:TTrackBar;

  procedure MakeSubFaces;   
  var
    i,j,u,v:Integer;
  begin
    for i:=0 to n-1 do begin                              
      ZeroMemory(@FVertexes[c+4*i],SizeOf(TVect));        
      ZeroMemory(@FVertexes[c+4*i+1],SizeOf(TVect));      
      ZeroMemory(@FVertexes[c+4*i+2],SizeOf(TVect));      
      ZeroMemory(@FVertexes[c+4*i+3],SizeOf(TVect));
      u:=1;
      for j:=1 to FDim do begin  
        if (j=a) or (j=b) then   
          Continue;
        if (u and i)=u then      
          v:=1
        else
          v:=-1;
        FVertexes[c+4*i,j]:=v;         
        FVertexes[c+4*i+1,j]:=v;
        FVertexes[c+4*i+2,j]:=v;
        FVertexes[c+4*i+3,j]:=v;
        u:=u*2;
      end;
      FVertexes[c+4*i,a]:=1;           
      FVertexes[c+4*i+1,a]:=1;
      FVertexes[c+4*i+2,a]:=-1;
      FVertexes[c+4*i+3,a]:=-1;
      FVertexes[c+4*i,b]:=1;
      FVertexes[c+4*i+1,b]:=-1;
      FVertexes[c+4*i+2,b]:=-1;
      FVertexes[c+4*i+3,b]:=1;
    end;
    c:=c+4*n;  
  end;
begin
  Randomize;
  FDim:=ComboBox1.ItemIndex+3;
  GroupBox1.DestroyComponents;
  t:=nil;
  for a:=0 to 3*(FDim-3)+2 do begin
    t:=TTrackBar.Create(GroupBox1);
    t.Align:=alTop;
    t.Top:=10000;
    t.Height:=26;
    t.Min:=0;
    t.Max:=3000;
    t.Position:=Random(3000);
    t.TickMarks:=tmBoth;
    t.TickStyle:=tsNone;
    t.Tag:=a;
    t.OnChange:=TrackBarChange;
    t.Parent:=GroupBox1;
    t.Tag:=Random(11)-5;
  end;
  GroupBox1.ClientHeight:=t.Height+t.Top+3;

  SetLength(FVertexes,(FDim-1)*FDim*PowerOfTwo(FDim-1));
  c:=0;
  n:=PowerOfTwo(FDim-2);
  for a:=1 to FDim-1 do     
    for b:=a+1 to FDim do   
      MakeSubFaces;
  MakeMatrix;
  StatusBar1.Panels[1].Text :='Vertex Polygon: '+
                              IntToStr((High(FVertexes)+1) div 4)+' faces';
  Button5.Click;
  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\Vertex\Vertex.inc');

  case ComboBox1.ItemIndex of
  0 : N31.Checked := true;
  1 : N41.Checked := true;
  2 : N51.Checked := true;
  3 : N61.Checked := true;
  4 : N71.Checked := true;
  5 : N81.Checked := true;
  6 : N91.Checked := true;
  7 : N101.Checked := true;
  end;
end;

procedure TForm1.TrackBarChange(Sender: TObject);    
begin
  MakeMatrix;     
end;

procedure TForm1.Wireframe1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
end;

procedure TForm1.x161Click(Sender: TObject);
begin
  RadioButton2.Checked := true;
end;

procedure TForm1.x241Click(Sender: TObject);
begin
  RadioButton3.Checked := true;
end;

procedure TForm1.x321Click(Sender: TObject);
begin
  RadioButton4.Checked := true;
end;

procedure TForm1.x81Click(Sender: TObject);
begin
  RadioButton1.Checked := true;
end;

function MultMatrix(m,n:TMatrix):TMatrix;
var
  a,b,c:Integer;
  s:Single;
begin
  for a:=1 to MaxDim do
    for b:=1 to MaxDim do begin
      s:=0;
      for c:=1 to MaxDim do
        s:=s+m[a,c]*n[c,b];
      Result[a,b]:=s;
    end;
end;

function GetIdentity:TMatrix;    
var
  a:Integer;
begin
  ZeroMemory(@Result,SizeOf(Result));
  for a:=1 to MaxDim do
    Result[a,a]:=1;
end;

function MakeRotation(ID,IDD:Integer;Angle:Single):TMatrix;        
begin
  Result:=GetIdentity;
  Result[ID,ID]:=Cos(Angle);
  Result[IDD,IDD]:=Result[ID,ID];
  Result[IDD,ID]:=Sin(Angle);
  Result[ID,IDD]:=-Result[IDD,ID];
end;

procedure TForm1.MakeMatrix;
var
  a:Integer;
begin
  if Tag<>0 then    
    Exit;
  FMatrix:=GetIdentity;
  FMatrix:=MultMatrix(FMatrix,MakeRotation(2,3,TTrackBar(GroupBox1.Controls[0]).Position*2*pi/3000));
  FMatrix:=MultMatrix(FMatrix,MakeRotation(3,1,TTrackBar(GroupBox1.Controls[1]).Position*2*pi/3000));
  FMatrix:=MultMatrix(FMatrix,MakeRotation(1,2,TTrackBar(GroupBox1.Controls[2]).Position*2*pi/3000));
  for a:=0 to 3*(FDim-3)-1 do
    FMatrix:=MultMatrix(FMatrix,
             MakeRotation((a mod 3)+1,(a div 3)+4,
             TTrackBar(GroupBox1.Controls[a+3]).Position*2*pi/3000));
end;

procedure TForm1.N101Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 7;
  ComboBox1Change(nil);
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  ComboBox1Change(nil);
end;

procedure TForm1.N41Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 1;
  ComboBox1Change(nil);
end;

procedure TForm1.N51Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 2;
  ComboBox1Change(nil);
end;

procedure TForm1.N61Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 3;
  ComboBox1Change(nil);
end;

procedure TForm1.N71Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 4;
  ComboBox1Change(nil);
end;

procedure TForm1.N81Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 5;
  ComboBox1Change(nil);
end;

procedure TForm1.N91Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := 6;
  ComboBox1Change(nil);
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
  Panel1.Visible := Panel3.Checked;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0 : Wireframe1.Checked := true;
  1 : LightingFaces1.Checked := true;
  2 : HiddenLines1.Checked := true;
  3 : Lightingfacesandhiddenlines1.Checked := true;
  4 : Hiddenlineswithpattern1.Checked := true;
  end;

  Button5.Click;
  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\Vertex\Vertex.inc');
end;

procedure TForm1.Randomize1Click(Sender: TObject);
begin
  Button2.Click;
end;

procedure TForm1.RenderFrames1Click(Sender: TObject);
begin
  Button4.Click;
end;

function MultVect(m:TMatrix;v:TVect):TVect;
var
  a,b:Integer;
  s:Single;
begin
  for a:=1 to MaxDim do begin
    s:=0;
    for b:=1 to MaxDim do
      s:=s+m[a,b]*v[b];
    Result[a]:=s;
  end;
end;

function CrossP(u,v:TVect):TVect;       
begin
  Result[1]:=u[2]*v[3]-u[3]*v[2];
  Result[2]:=u[3]*v[1]-u[1]*v[3];
  Result[3]:=u[1]*v[2]-u[2]*v[1];
end;

function Minus(u,v:TVect):TVect;   
var
  a:Integer;
begin
  for a:=1 to MaxDim do
    Result[a]:=u[a]-v[a];
end;

procedure TForm1.Data1Click(Sender: TObject);
begin
  Button3.Click;
end;

procedure TForm1.DrawScene;
var
  a:Integer;
  Red, Green, Blue : Extended;
  RedVer, GreenVer, BlueVer : Extended;
  RedWire, GreenWire, BlueWire : Extended;

  procedure DrawVertex(v:TVect);      
  begin                               
    glVertex3f(v[1],v[2],v[3]);       
  end;

  procedure DrawFace(Id:Integer;Mode:Cardinal);   
  var
    t,u,v,w,n:TVect;

  begin
    t:=MultVect(FMatrix,FVertexes[Id]);         
    u:=MultVect(FMatrix,FVertexes[Id+1]);
    v:=MultVect(FMatrix,FVertexes[Id+2]);
    w:=MultVect(FMatrix,FVertexes[Id+3]);
    n:=Crossp(Minus(t,v),Minus(u,w));           
    glBegin(Mode);
    glNormal3f(n[1],n[2],n[3]);                 
    DrawVertex(t);                              
    DrawVertex(u);
    DrawVertex(v);
    DrawVertex(w);
    glEnd;
  end;

  procedure DrawFaces(Mode:Cardinal);         
  var
    a:Integer;

  begin
    for a:=0 to ((High(FVertexes)+1) div 4)-1 do
      DrawFace(4*a,Mode);
  end;
const
  Specular:array[0..3] of GlFloat=(0.8,0.3,0.1,1.0);


begin
  if CheckBox1.Checked then Animate;

 FormatSettings.DecimalSeparator := '.';

 Red := StrToFloat(Form2.Edit1.Text, FormatSettings);
 Green := StrToFloat(Form2.Edit2.Text, FormatSettings);
 Blue := StrToFloat(Form2.Edit3.Text, FormatSettings);
 RedVer := StrToFloat(Form2.Edit4.Text, FormatSettings);
 GreenVer := StrToFloat(Form2.Edit5.Text, FormatSettings);
 BlueVer := StrToFloat(Form2.Edit6.Text, FormatSettings);
 RedWire := StrToFloat(Form2.Edit7.Text, FormatSettings);
 GreenWire := StrToFloat(Form2.Edit8.Text, FormatSettings);
 BlueWire := StrToFloat(Form2.Edit9.Text, FormatSettings);

  glClearColor(Red, Green, Blue,0);
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);     

  if Panel3.Checked = true then begin
      glViewport(0,0,ClientWidth-Panel1.Width,ClientHeight);
  end else begin
      glViewport(0,0,ClientWidth,ClientHeight);
  end;

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;

  if Panel3.Checked = true then begin
      gluPerspective(100,(ClientWidth-Panel1.Width)/ClientHeight,0.001,10);
    end else begin
      gluPerspective(100,(ClientWidth)/ClientHeight,0.001,10);
  end;

  gluLookAt(0,0,3,0,0,0,0,1,0);

  // Wire
  glColor3f(RedWire, GreenWire, BlueWire);


  glEnable(GL_NORMALIZE);
  glPushAttrib(GL_ALL_ATTRIB_BITS);
  glEnable(GL_LINE_SMOOTH);          
  glEnable(GL_POLYGON_SMOOTH);       
  case RadioGroup1.ItemIndex of      
    0:DrawFaces(GL_LINE_LOOP);       
    1:begin                          
      glColor3f( RedVer, GreenVer, BlueVer);
      glEnable(GL_DEPTH_TEST);
      glEnable(GL_LIGHTING);         
      glEnable(GL_LIGHT0);           
      glEnable(GL_COLOR_MATERIAL);   
      glColorMaterial(GL_FRONT_AND_BACK,GL_DIFFUSE); 
      glMaterial(GL_FRONT_AND_BACK,GL_SHININESS,5);  
      glMaterialfv(GL_FRONT_AND_BACK,GL_SPECULAR,@Specular);  
      glLightModel(GL_LIGHT_MODEL_TWO_SIDE,1);                
      DrawFaces(GL_QUADS);                                    
    end;
    2:begin                          
      glDepthMask(GL_FALSE);                                  
      glColorMask(GL_FALSE,GL_FALSE,GL_FALSE,GL_FALSE);       
      glEnable(GL_STENCIL_TEST);                              
      glClear(GL_STENCIL_BUFFER_BIT);                         
      glStencilFunc(GL_ALWAYS,1,1);                           
      glStencilOp(GL_KEEP,GL_KEEP,GL_REPLACE);
      DrawFaces(GL_LINE_LOOP);                                
      glPolygonOffset(0.8,0.8);                               
      glEnable(GL_POLYGON_OFFSET_FILL);
      glEnable(GL_DEPTH_TEST);                                
      glDepthMask(GL_TRUE);                                   
      glStencilFunc(GL_EQUAL,1,1);                            
      glStencilOp(GL_KEEP,GL_KEEP,GL_KEEP);                   
      DrawFaces(GL_QUADS);                                    
      glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);           
      DrawFaces(GL_LINE_LOOP);                                
    end;
    3:begin
      glLineWidth(3);                                         
      glDepthMask(GL_FALSE);                                  
      glColorMask(GL_FALSE,GL_FALSE,GL_FALSE,GL_FALSE);
      glEnable(GL_STENCIL_TEST);
      glClear(GL_STENCIL_BUFFER_BIT);
      glStencilFunc(GL_ALWAYS,1,2);
      glStencilOp(GL_KEEP,GL_KEEP,GL_REPLACE);
      DrawFaces(GL_LINE_LOOP);
      glPolygonOffset(0.8,0.8);                               
      glEnable(GL_POLYGON_OFFSET_FILL);
      glEnable(GL_DEPTH_TEST);
      glDepthMask(GL_TRUE);
      glStencilFunc(GL_EQUAL,1,2);
      glStencilOp(GL_KEEP,GL_KEEP,GL_KEEP);
      DrawFaces(GL_QUADS);
      ////
      glColor3f(RedVer, GreenVer, BlueVer);

      glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
      glStencilOp(GL_KEEP,GL_KEEP,GL_INCR);
      DrawFaces(GL_LINE_LOOP);
      ///
      glColor3f(RedVer, GreenVer, BlueVer);

      glDepthFunc(GL_LEQUAL);
      glStencilFunc(GL_NOTEQUAL,2,2);                         
      glStencilOp(GL_KEEP,GL_KEEP,GL_KEEP);
      glEnable(GL_LIGHTING);
      glEnable(GL_LIGHT0);
      glEnable(GL_COLOR_MATERIAL);
      glColorMaterial(GL_FRONT_AND_BACK,GL_DIFFUSE);
      glMaterial(GL_FRONT_AND_BACK,GL_SHININESS,5);
      glMaterialfv(GL_FRONT_AND_BACK,GL_SPECULAR,@Specular);
      glLightModel(GL_LIGHT_MODEL_TWO_SIDE,1);
      DrawFaces(GL_QUADS);
      glLineWidth(1);                                    
      glEnable(GL_BLEND);
      glColor4F(1,0.5,1,0.5);
      glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
      glDisable(GL_DEPTH_TEST);
      glStencilFunc(GL_EQUAL,1,2);                       
      glStencilOp(GL_KEEP,GL_KEEP,GL_INCR);              
      glDisable(GL_LIGHTING);
      glLineStipple(1,$1);
      DrawFaces(GL_LINE_LOOP);
    end;
    4:begin
      glLineWidth(3);
      glDepthMask(GL_FALSE);
      glColorMask(GL_FALSE,GL_FALSE,GL_FALSE,GL_FALSE);
      glEnable(GL_STENCIL_TEST);
      glClear(GL_STENCIL_BUFFER_BIT);
      glStencilFunc(GL_ALWAYS,1,1);
      glStencilOp(GL_KEEP,GL_KEEP,GL_REPLACE);
      DrawFaces(GL_LINE_LOOP);
      glPolygonOffset(0.8,0.8);
      glEnable(GL_POLYGON_OFFSET_FILL);
      glEnable(GL_DEPTH_TEST);
      glDepthMask(GL_TRUE);
      glStencilFunc(GL_EQUAL,1,1);
      glStencilOp(GL_KEEP,GL_KEEP,GL_KEEP);
      DrawFaces(GL_QUADS);
      glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
      DrawFaces(GL_LINE_LOOP);                          
      glDisable(GL_DEPTH_TEST);
      glClear(GL_STENCIL_BUFFER_BIT);
      glEnable(GL_STENCIL_TEST);
      for a:=0 to ((High(FVertexes)+1) div 4)-1 do begin   
        glLineWidth(1);                                    
        glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
        glStencilFunc(GL_EQUAL,0,1);
        glStencilOp(GL_KEEP,GL_KEEP,GL_KEEP);
        glEnable(GL_LINE_STIPPLE);
        glLineStipple(1,$1);                               
        DrawFace(4*a,GL_LINE_LOOP);
        glLineWidth(3);                                    
        glColorMask(GL_FALSE,GL_FALSE,GL_FALSE,GL_FALSE);
        glDisable(GL_LINE_STIPPLE);
        glStencilFunc(GL_ALWAYS,1,1);
        glStencilOp(GL_KEEP,GL_KEEP,GL_REPLACE);
        DrawFace(4*a,GL_LINE_LOOP);
      end;
    end;
  end;
  glPopAttrib;
end;

procedure TForm1.Abort1Click(Sender: TObject);
begin
  Button6.Click;
end;

procedure TForm1.Animate;
var
  a,b:Integer;
begin
  Tag:=1;           
  for a:=0 to GroupBox1.ControlCount-1 do           
    with TTrackBar(GroupBox1.Controls[a]) do begin
      b:=Position+Tag;
      if b<Min then                 
        Position:=Max-(b-Min)
      else begin
        if b>Max then
          Position:=Min+(b-Max)
        else
          Position:=b;
      end;
    end;
  Tag:=0;
  MakeMatrix;
end;

function FloatToStr2(x:Single):string;   
begin
  Str(x,Result);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  f:TextFile;
  g,h:Integer;
  v:TVect;
begin
  if SaveDialog2.Execute then begin
  AssignFile(f,SaveDialog2.FileName + '.ver');
  ReWrite(f);
  try
    h:=(High(FVertexes)+1) div 4;
    WriteLn(f,'#declare FacesCount='+IntToStr(h)+';');
    WriteLn(f,'');
    WriteLn(f,'#declare Vertexes=array['+IntToStr(4*h)+'][3]');
    WriteLn(f,'{');
    for G:=0 to High(FVertexes) do begin
      v:=MultVect(FMatrix,FVertexes[g]);
      if g<High(FVertexes) then
        WriteLn(f,'  {'+FloatToStr2(v[1])+','+FloatToStr2(v[2])+','+FloatToStr2(v[3])+'},')
      else
        WriteLn(f,'  {'+FloatToStr2(v[1])+','+FloatToStr2(v[2])+','+FloatToStr2(v[3])+'}');
    end;
    WriteLn(f,'}');
  finally
    CloseFile(f);
    StatusBar1.Panels[2].Text := 'Export Vertex Data done.';
  end;
  end;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Beep;
  if MessageBox(Handle,'This will Render Btimap Frames, continue : ','Confirm',
                MB_YESNO) = IDYES then
    BEGIN
      RenderFrames1.Enabled := false;
      Abort1.Enabled := true;
      Button4.Enabled := false;
      Button6.Enabled := true;
      abort := false;
      Screen.Cursor := crHourGlass;
      frame := 0;
      Timer2.Enabled := true;
    END;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  f:TextFile;
  g,h:Integer;
  v:TVect;
begin
  AssignFile(f,ExtractFilePath(APplication.ExeName)+'Data\Vertex\Vertex.inc');
  ReWrite(f);
  try
    h:=(High(FVertexes)+1) div 4;
    WriteLn(f,'#declare FacesCount='+IntToStr(h)+';');
    WriteLn(f,'');
    WriteLn(f,'#declare Vertexes=array['+IntToStr(4*h)+'][3]');
    WriteLn(f,'{');
    for G:=0 to High(FVertexes) do begin
      v:=MultVect(FMatrix,FVertexes[g]);
      if g<High(FVertexes) then
        WriteLn(f,'  {'+FloatToStr2(v[1])+','+FloatToStr2(v[2])+','+FloatToStr2(v[3])+'},')
      else
        WriteLn(f,'  {'+FloatToStr2(v[1])+','+FloatToStr2(v[2])+','+FloatToStr2(v[3])+'}');
    end;
    WriteLn(f,'}');
  finally
    CloseFile(f);
  end;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  abort := true;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  try
    form2 := TForm2.Create(self);
    form2.Show;
  finally
  end;
end;

end.

