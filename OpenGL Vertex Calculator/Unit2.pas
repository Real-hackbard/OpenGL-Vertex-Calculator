unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button7: TButton;
    Button8: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    GroupBox4: TGroupBox;
    Timer1: TTimer;
    Button19: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;
  Red : Extended = 0.000;
  Green : Extended = 0.000;
  Blue : Extended = 0.000;
  RedVer : Extended = 0.000;
  GreenVer : Extended = 0.000;
  BlueVer : Extended = 0.000;
  RedWire : Extended = 0.000;
  GreenWire : Extended = 0.000;
  BlueWire : Extended = 0.000;

  i, ii, iii : Extended;

implementation

{$R *.dfm}

procedure TForm2.Button10Click(Sender: TObject);
begin
  if GreenVer <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  GreenVer := StrToFloatDef(Edit5.Text,0.001,formatSettings );
  GreenVer := GreenVer - 0.001;
  Edit5.Text :=  FloatToStr(GreenVer, FormatSettings);
end;

procedure TForm2.Button11Click(Sender: TObject);
begin
  if BlueVer >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  BlueVer := StrToFloatDef(Edit6.Text,0.001,formatSettings );
  BlueVer := BlueVer + 0.001;
  Edit6.Text :=  FloatToStr(BlueVer, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Button12Click(Sender: TObject);
begin
  if BlueVer <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  BlueVer := StrToFloatDef(Edit6.Text,0.001,formatSettings );
  BlueVer := BlueVer - 0.001;
  Edit6.Text :=  FloatToStr(BlueVer, FormatSettings);
end;

procedure TForm2.Button13Click(Sender: TObject);
begin
  if RedWire >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  RedWire := StrToFloatDef(Edit7.Text,0.001,formatSettings );
  RedWire := RedWire + 0.001;
  Edit7.Text :=  FloatToStr(RedWire, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Button14Click(Sender: TObject);
begin
  if RedWire <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  RedWire := StrToFloatDef(Edit7.Text,0.001,formatSettings );
  RedWire := RedWire - 0.001;
  Edit7.Text :=  FloatToStr(RedWire, FormatSettings);
end;

procedure TForm2.Button15Click(Sender: TObject);
begin
  if GreenWire >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  GreenWire := StrToFloatDef(Edit8.Text,0.001,formatSettings );
  GreenWire := GreenWire + 0.001;
  Edit8.Text :=  FloatToStr(GreenWire, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Button16Click(Sender: TObject);
begin
  if GreenWire <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  GreenWire := StrToFloatDef(Edit8.Text,0.001,formatSettings );
  GreenWire := GreenWire - 0.001;
  Edit8.Text :=  FloatToStr(GreenWire, FormatSettings);
end;

procedure TForm2.Button17Click(Sender: TObject);
begin
  if BlueWire >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  BlueWire := StrToFloatDef(Edit9.Text,0.001,formatSettings );
  BlueWire := BlueWire + 0.001;
  Edit9.Text :=  FloatToStr(BlueWire, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Button18Click(Sender: TObject);
begin
  if BlueWire <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  BlueWire := StrToFloatDef(Edit9.Text,0.001,formatSettings );
  BlueWire := BlueWire - 0.001;
  Edit9.Text :=  FloatToStr(BlueWire, FormatSettings);
end;

procedure TForm2.Button19Click(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if Red >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  Red := StrToFloatDef(Edit1.Text,0.001,formatSettings );
  Red := Red + 0.001;
  Edit1.Text :=  FloatToStr(Red, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if Red <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  Red := StrToFloatDef(Edit1.Text,0.001,formatSettings );
  Red := Red - 0.001;
  Edit1.Text :=  FloatToStr(Red, FormatSettings);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  if Green >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  Green := StrToFloatDef(Edit2.Text,0.001,formatSettings );
  Green := Green + 0.001;
  Edit2.Text :=  FloatToStr(Green, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  if Green <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  Green := StrToFloatDef(Edit2.Text,0.001,formatSettings );
  Green := Green - 0.001;
  Edit2.Text :=  FloatToStr(Green, FormatSettings);
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  if Blue >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  Blue := StrToFloatDef(Edit3.Text,0.001,formatSettings );
  Blue := Blue + 0.001;
  Edit3.Text :=  FloatToStr(Blue, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  if Blue <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  Blue := StrToFloatDef(Edit3.Text,0.001,formatSettings );
  Blue := Blue - 0.001;
  Edit3.Text :=  FloatToStr(Blue, FormatSettings);
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  if RedVer >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  RedVer := StrToFloatDef(Edit4.Text,0.001,formatSettings );
  RedVer := RedVer + 0.001;
  Edit4.Text :=  FloatToStr(RedVer, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  if RedVer <= 0.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  RedVer := StrToFloatDef(Edit4.Text,0.001,formatSettings );
  RedVer := RedVer - 0.001;
  Edit4.Text :=  FloatToStr(RedVer, FormatSettings);
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  if GreenVer >= 1.000 then Exit;
  formatSettings.DecimalSeparator := '.';
  GreenVer := StrToFloatDef(Edit5.Text,0.001,formatSettings );
  GreenVer := GreenVer + 0.001;
  Edit5.Text :=  FloatToStr(GreenVer, FormatSettings);
  StatusBar1.SetFocus;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  if Red >= 1.000 then
  begin
    Edit1.Text := '1.000';
    Exit;
  end;

  if Red < 0.000 then
  begin
    Edit1.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
  if Green >= 1.000 then
  begin
    Edit2.Text := '1.000';
    Exit;
  end;

  if Green < 0.000 then
  begin
    Edit2.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
  if Blue >= 1.000 then
  begin
    Edit3.Text := '1.000';
    Exit;
  end;

  if Blue < 0.000 then
  begin
    Edit3.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.Edit4Change(Sender: TObject);
begin
  if RedVer >= 1.000 then
  begin
    Edit4.Text := '1.000';
    Exit;
  end;

  if RedVer < 0.000 then
  begin
    Edit4.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.Edit5Change(Sender: TObject);
begin
  if GreenVer >= 1.000 then
  begin
    Edit5.Text := '1.000';
    Exit;
  end;

  if GreenVer < 0.000 then
  begin
    Edit5.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.Edit6Change(Sender: TObject);
begin
  if BlueVer >= 1.000 then
  begin
    Edit6.Text := '1.000';
    Exit;
  end;

  if BlueVer < 0.000 then
  begin
    Edit6.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.Edit7Change(Sender: TObject);
begin
  if RedWire >= 1.000 then
  begin
    Edit7.Text := '1.000';
    Exit;
  end;

  if RedWire < 0.000 then
  begin
    Edit7.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.Edit8Change(Sender: TObject);
begin
  if GreenWire >= 1.000 then
  begin
    Edit8.Text := '1.000';
    Exit;
  end;

  if GreenWire < 0.000 then
  begin
    Edit8.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.Edit9Change(Sender: TObject);
begin
  if BlueWire >= 1.000 then
  begin
    Edit9.Text := '1.000';
    Exit;
  end;

  if BlueWire < 0.000 then
  begin
    Edit9.Text := '0.000';
    Exit;
  end;
end;

procedure TForm2.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then
    Key := #0;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

  formatSettings.DecimalSeparator := '.';
  Red := StrToFloatDef(Edit1.Text,0.001,formatSettings );
  Green := StrToFloatDef(Edit2.Text,0.001,formatSettings );
  Blue := StrToFloatDef(Edit3.Text,0.001,formatSettings );
  RedVer := StrToFloatDef(Edit4.Text,0.001,formatSettings );
  GreenVer := StrToFloatDef(Edit5.Text,0.001,formatSettings );
  BlueVer := StrToFloatDef(Edit6.Text,0.001,formatSettings );
  RedWire := StrToFloatDef(Edit7.Text,0.001,formatSettings );
  GreenWire := StrToFloatDef(Edit8.Text,0.001,formatSettings );
  BlueWire := StrToFloatDef(Edit9.Text,0.001,formatSettings );
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var
  p, pp, ppp : integer;
  R, G, B : string;
begin
  i := i + 0.020;
  ii := ii + 0.010;
  iii := iii + 0.005;

  R := FloatToStr(i);
  G := FloatToStr(ii);
  B := FloatToStr(iii);

  p := pos(',',R);
  pp := pos(',',G);
  ppp := pos(',',B);

  if p > 0 then R[p] := '.';
  if pp > 0 then G[pp] := '.';
  if ppp > 0 then B[ppp] := '.';

  Edit4.Text := R;
  Edit5.Text := G;
  Edit6.Text := B;

  if (i >= 1.000) and (ii >= 1.000) and (iii >= 1.000) then
  begin
    Edit4.Text := '1.000';
    Edit5.Text := '1.000';
    Edit6.Text := '1.000';
    Timer1.Enabled := false;
  end;

end;
end.
