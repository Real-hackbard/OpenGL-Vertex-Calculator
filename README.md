# OpenGL-Vertex-Calculator:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![OpenGL Vertex Calculator](https://github.com/user-attachments/assets/ddbead88-647e-4d57-80f6-a47e624a60d8)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![102025](https://github.com/user-attachments/assets/62cea8cc-bd7d-49bd-b920-5590016735c0)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

In OpenGL, [Vertex information](https://en.wikipedia.org/wiki/Vertex) is data about the points that make up a shape, such as position, color, and texture coordinates. This data is stored efficiently in [Vertex Buffer Objects](https://de.wikipedia.org/wiki/Vertex_Buffer_Object) (VBOs), which are sent to the GPU and organized using Vertex Array Objects (VAOs). An Index Buffer Object (IBO) can be used to specify the order in which vertices are drawn, reducing redundant data. 

</br>

### Features
* Adjust Colors
* Adjust Vertex Points
* Render Bitmap or Frames
* Select Style
* Get Vertex Data

</br>

![OpenGL Vertex](https://github.com/user-attachments/assets/48c44021-e530-436e-84f4-8d27b3218bd4)

</br>

A vertex buffer object (VBO) is an [OpenGL](https://en.wikipedia.org/wiki/OpenGL) feature that provides methods for uploading vertex data (position, normal vector, color, etc.) to the video device for non-immediate-mode rendering. VBOs offer substantial performance gains over [immediate mode rendering](https://en.wikipedia.org/wiki/Immediate_mode_(computer_graphics)) primarily because the data reside in video device memory rather than system memory and so it can be rendered directly by the video device. These are equivalent to [vertex buffers](https://en.wikipedia.org/wiki/Glossary_of_computer_graphics#vertex_buffer) in [Direct3D](https://en.wikipedia.org/wiki/Direct3D).

### Key components for vertex information:
* [Vertex Buffer Object](https://en.wikipedia.org/wiki/Vertex_buffer_object) (VBO): This is a buffer stored in the GPU's memory that holds the raw vertex data, such as coordinates, normals, and colors. Storing data in a VBO and sending it to the GPU once dramatically increases rendering performance compared to sending it for every frame.
    * VBOs are created and filled with data using glGenBuffers and glBufferData.
    * Binding a VBO to ```GL_ARRAY_BUFFER``` makes it the active source for vertex attributes.
* [Element Buffer Object](https://wikis.khronos.org/opengl/Buffer_Object) (EBO): Also known as an Index Buffer Object (IBO), an EBO is an optional buffer that stores indices. Instead of repeating vertex data for every triangle, the EBO specifies the order in which to draw the vertices. This saves memory and is more efficient for complex meshes where vertices are shared by multiple primitives.
* [Vertex Array Object](https://en.wikipedia.org/wiki/Vertex_(computer_graphics)) (VAO): An object that stores the configuration of vertex attribute pointers. It essentially bundles together the VBOs and their associated state for rendering. This object acts as a container for all the state needed to manage vertex data. A VAO stores references to one or more VBOs and an EBO, along with the layout of the vertex attributes (e.g., how the data is structured within the buffer). By binding a VAO, you can quickly switch between different mesh configurations without re-specifying all the vertex attributes individually.
    * A VAO is generated with ```glGenVertexArray``` and activated with ```glBindVertexArray```.
    * Once a VAO is bound, subsequent calls to glVertexAttribPointer and glEnableVertexAttribArray will be recorded within that VAO.
* [Index Buffer Object](https://en.wikipedia.org/wiki/Vertex_buffer_object) (IBO): An optional buffer that contains the indices of the vertices to be drawn, specifying the order in which the GPU should use the vertices from the VBO.
    * This is useful for drawing complex shapes with fewer vertices and for using shared vertices.
    * An IBO is bound to ```GL_ELEMENT_ARRAY_BUFFER```.
* [Vertex Attributes](https://wikis.khronos.org/opengl/Vertex_Specification): Individual pieces of data within a vertex, such as \(x,y,z\) coordinates, normal vectors, or RGBA color values.  These are the specific pieces of data associated with each vertex. In the vertex shader, you define an input variable for each attribute, which can include:
   * Each attribute is associated with a specific index and is configured using ```glVertexAttribPointer```.
   * ```glEnableVertexAttribArray``` must be called to activate each attribute before it can be used by the vertex shader. 
    * Position: The 3D coordinates (\(x,y,z\)) of the vertex in space.
    * Color: The color (\(r,g,b,a\)) of the vertex.
    * Normal: A 3D vector used for lighting calculations to determine which way a surface is facing.
    * Texture Coordinates: 2D coordinates (\(u,v\)) that map a texture image to the vertex.

### Basic VBO functions:
The following functions form the core of VBO access and manipulation:

* ```glGenBuffersARB(sizei n, uint *buffers)```  
Generates a new VBO and returns its ID number as an unsigned integer. Id 0 is reserved.
* ```glBindBufferARB(enum target, uint buffer)```  
Use a previously created buffer as the active VBO.
* ```glBufferDataARB(enum target, sizeiptrARB size, const void *data, enum usage)```  
Upload data to the active VBO.
* ```glDeleteBuffersARB(sizei n, const uint *buffers)```  
Deletes the specified number of VBOs from the supplied array or VBO id.
In OpenGL 2.1, OpenGL 3.x and OpenGL 4.x:
* ```glGenBuffers(sizei n, uint *buffers)```  
Generates a new VBO and returns its ID number as an unsigned integer. Id 0 is reserved.
* ```glBindBuffer(enum target, uint buffer)```  
Use a previously created buffer as the active VBO.
* ```glBufferData(enum target, sizeiptrARB size, const void *data, enum usage)```  
Upload data to the active VBO.
* ```glDeleteBuffers(sizei n, const uint *buffers)```  
Deletes the specified number of VBOs from the supplied array or VBO id.

### Simple Pascal OpenGL Example
```pascal
unit mainWin;

interface

uses
  OpenGL, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Math;

type

  TBall = record
    x, phi: Double;
  end;

  TmainFrm = class(TForm)
    Timer1: TTimer; // 25 ms
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure WMEraseBkGnd(var Message:TMessage); message WM_ERASEBKGND;
  private
    Angle: Double;
    Balls: array[0..100] of TBall;
    BallIndex: Integer;
    procedure InitGL;
  end;

var
  mainFrm: TmainFrm;

implementation

{$R *.dfm}

procedure TmainFrm.InitGL;
const
  pfd: TPixelFormatDescriptor = (
    nSize: SizeOf(TPixelFormatDescriptor);
    nVersion: 1;
    dwFlags: PFD_SUPPORT_OPENGL or PFD_DRAW_TO_WINDOW or PFD_DOUBLEBUFFER;
    iPixelType: PFD_TYPE_RGBA;
    cColorBits: 32;
    cRedBits: 0; cRedShift: 0;
    cGreenBits: 0;  cGreenShift: 0;
    cBlueBits: 0; cBlueShift: 0;
    cAlphaBits: 0;  cAlphaShift: 0;
    cAccumBits: 0;
    cAccumRedBits: 0;
    cAccumGreenBits: 0;
    cAccumBlueBits: 0;
    cAccumAlphaBits: 0;
    cDepthBits: 24;
    cStencilBits: 0;
    cAuxBuffers: 0;
    iLayerType: PFD_MAIN_PLANE;
    bReserved: 0;
    dwLayerMask: 0;
    dwVisibleMask: 0;
    dwDamageMask: 0;
  );

begin
  var DC := GetDC(Handle);
  var PixelFormat := ChoosePixelFormat(DC, @pfd);
  if PixelFormat = 0 then
    RaiseLastOSError;
  if not SetPixelFormat(DC, PixelFormat, @pfd) then
    RaiseLastOSError;
  var RC := wglCreateContext(DC);
  if RC = 0 then
    RaiseLastOSError;
  wglMakeCurrent(DC, RC);
  glEnable(GL_DEPTH_TEST);
  glEnable(GL_LINE_SMOOTH);
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
  glPointSize(10);
  glEnable(GL_POINT_SMOOTH);
  FormResize(Self);
end;

procedure TmainFrm.FormPaint(Sender: TObject);
const
  p1: TGLArrayf3 = (-5, -5, -1);
  p2: TGLArrayf3 = (5, -5, -1);
  p3: TGLArrayf3 = (0, 5, -1);
begin

  if Tag = 0 then
  begin
    InitGL;
    Tag := 1;
  end;

  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity;

  glColor3ub(255, 255, 255);
  glRotate(Angle, 0, 0, 1);
  glBegin(GL_TRIANGLES);
  glVertex3fv(@p1); glVertex3fv(@p2); glVertex3fv(@p3);
  glEnd;
  glRotate(-Angle, 0, 0, 1);

  glColor3ub(255, 0, 0);

  for var i := Low(Balls) to High(Balls) do
  begin
    if (Balls[i].x = 0) or (Balls[i].x > 100) then
      Continue;
    glRotate(Balls[i].phi, 0, 0, 1);
    glBegin(GL_POINTS);
    glVertex3f(0, Balls[i].x, -1);
    glEnd;
    glRotate(-Balls[i].phi, 0, 0, 1);
  end;

  SwapBuffers(wglGetCurrentDC);

end;

procedure TmainFrm.FormResize(Sender: TObject);
begin
  glViewport(0, 0, ClientWidth, ClientHeight);
  glMatrixMode(GL_PROJECTION);
  const AR = ClientWidth / Max(ClientHeight, 1);
  glLoadIdentity;
  glOrtho(-15*AR, 15*AR, -15, 15, 0.5, 25.0);
  glMatrixMode(GL_MODELVIEW);
end;

procedure TmainFrm.Timer1Timer(Sender: TObject);
begin

  for var i := Low(Balls) to High(Balls) do
    if Balls[i].x <> 0 then
      Balls[i].x := Balls[i].x + 1;

  if csLButtonDown in ControlState then // Add new ball
  begin
    Balls[BallIndex].x := 5;
    Balls[BallIndex].phi := Angle;
    BallIndex := Succ(BallIndex) mod Length(Balls);
  end;

  Invalidate;

end;

procedure TmainFrm.WMEraseBkGnd(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TmainFrm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Angle := ArcTan2(-Y + ClientHeight div 2, X - ClientWidth div 2) * 180 / Pi + 270;
end;

end.
```

