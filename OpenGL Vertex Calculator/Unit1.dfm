object Form1: TForm1
  Left = 1616
  Top = 198
  Caption = 'OpenGL Vertex Calculator'
  ClientHeight = 599
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Panel1: TPanel
    Left = 548
    Top = 0
    Width = 222
    Height = 580
    Align = alRight
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitLeft = 544
    ExplicitHeight = 579
    DesignSize = (
      222
      580)
    object Label2: TLabel
      Left = 132
      Top = 284
      Width = 36
      Height = 13
      Caption = 'Vertex :'
    end
    object ComboBox1: TComboBox
      Left = 173
      Top = 280
      Width = 43
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      ItemIndex = 1
      TabOrder = 0
      Text = '4'
      OnChange = ComboBox1Change
      Items.Strings = (
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10')
    end
    object GroupBox1: TGroupBox
      Left = 14
      Top = 440
      Width = 202
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Rotation angles'
      TabOrder = 1
    end
    object RadioGroup1: TRadioGroup
      Left = 13
      Top = 318
      Width = 203
      Height = 116
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Style'
      ItemIndex = 3
      Items.Strings = (
        'Wireframe'
        'Lighting faces'
        'Hidden lines'
        'Lighting faces and hidden lines'
        'Hidden lines with pattern')
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object CheckBox1: TCheckBox
      Left = 81
      Top = 282
      Width = 45
      Height = 17
      Caption = 'Anim'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object GroupBox2: TGroupBox
      Left = 13
      Top = 9
      Width = 203
      Height = 121
      Caption = ' Export '
      TabOrder = 4
      object Label1: TLabel
        Left = 14
        Top = 23
        Width = 43
        Height = 13
        Caption = 'Pixel Bit :'
      end
      object Button1: TButton
        Left = 63
        Top = 21
        Width = 50
        Height = 19
        Caption = 'Bitmap'
        TabOrder = 0
        TabStop = False
        OnClick = Button1Click
      end
      object RadioButton1: TRadioButton
        Left = 17
        Top = 51
        Width = 34
        Height = 17
        Caption = 'x4'
        TabOrder = 1
      end
      object RadioButton2: TRadioButton
        Left = 57
        Top = 51
        Width = 36
        Height = 17
        Caption = 'x8'
        TabOrder = 2
      end
      object RadioButton3: TRadioButton
        Left = 101
        Top = 51
        Width = 39
        Height = 17
        Caption = 'x24'
        TabOrder = 3
      end
      object RadioButton4: TRadioButton
        Left = 146
        Top = 51
        Width = 40
        Height = 17
        Caption = 'x32'
        Checked = True
        TabOrder = 4
        TabStop = True
      end
      object Button4: TButton
        Left = 80
        Top = 83
        Width = 50
        Height = 25
        Caption = 'Render'
        TabOrder = 5
        TabStop = False
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 180
        Top = 14
        Width = 20
        Height = 20
        Caption = '5'
        TabOrder = 6
        Visible = False
        OnClick = Button5Click
      end
      object SpinEdit1: TSpinEdit
        Left = 18
        Top = 85
        Width = 53
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 7
        Value = 10
      end
      object Button6: TButton
        Left = 136
        Top = 83
        Width = 53
        Height = 25
        Caption = 'Abort'
        Enabled = False
        TabOrder = 8
        OnClick = Button6Click
      end
    end
    object GroupBox3: TGroupBox
      Left = 13
      Top = 136
      Width = 203
      Height = 131
      Caption = ' Vertex Data '
      TabOrder = 5
      object Memo1: TMemo
        Left = 8
        Top = 20
        Width = 187
        Height = 65
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object Button3: TButton
        Left = 113
        Top = 99
        Width = 75
        Height = 25
        Caption = 'Vertex Data'
        TabOrder = 1
        TabStop = False
        OnClick = Button3Click
      end
      object Button7: TButton
        Left = 13
        Top = 99
        Width = 50
        Height = 25
        Caption = 'Colors'
        TabOrder = 2
        OnClick = Button7Click
      end
    end
    object Button2: TButton
      Left = 14
      Top = 278
      Width = 59
      Height = 25
      Caption = 'Random'
      TabOrder = 6
      OnClick = Button2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 580
    Width = 770
    Height = 19
    Panels = <
      item
        Text = 'Info :'
        Width = 50
      end
      item
        Width = 400
      end
      item
        Width = 50
      end>
    ExplicitTop = 579
    ExplicitWidth = 766
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 46
    Top = 42
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Bitmap (*.BMP)|*.bmp'
    Left = 112
    Top = 42
  end
  object PopupMenu1: TPopupMenu
    Left = 211
    Top = 44
    object Animate1: TMenuItem
      AutoCheck = True
      Caption = 'Animate'
      Checked = True
      OnClick = Animate1Click
    end
    object Randomize1: TMenuItem
      Caption = 'Randomize'
      OnClick = Randomize1Click
    end
    object Colors1: TMenuItem
      Caption = 'Colors'
      OnClick = Colors1Click
    end
    object Style1: TMenuItem
      Caption = 'Style'
      object Wireframe1: TMenuItem
        AutoCheck = True
        Caption = 'Wireframe'
        RadioItem = True
        OnClick = Wireframe1Click
      end
      object LightingFaces1: TMenuItem
        AutoCheck = True
        Caption = 'Lighting Faces'
        RadioItem = True
        OnClick = LightingFaces1Click
      end
      object HiddenLines1: TMenuItem
        AutoCheck = True
        Caption = 'Hidden Lines'
        RadioItem = True
        OnClick = HiddenLines1Click
      end
      object Lightingfacesandhiddenlines1: TMenuItem
        AutoCheck = True
        Caption = 'Lighting faces and hidden lines'
        Checked = True
        RadioItem = True
        OnClick = Lightingfacesandhiddenlines1Click
      end
      object Hiddenlineswithpattern1: TMenuItem
        AutoCheck = True
        Caption = 'Hidden lines with pattern'
        RadioItem = True
        OnClick = Hiddenlineswithpattern1Click
      end
    end
    object Vertex1: TMenuItem
      Caption = 'Vertex'
      object N31: TMenuItem
        AutoCheck = True
        Caption = '3'
        Checked = True
        RadioItem = True
        OnClick = N31Click
      end
      object N41: TMenuItem
        AutoCheck = True
        Caption = '4'
        RadioItem = True
        OnClick = N41Click
      end
      object N51: TMenuItem
        AutoCheck = True
        Caption = '5'
        RadioItem = True
        OnClick = N51Click
      end
      object N61: TMenuItem
        AutoCheck = True
        Caption = '6'
        RadioItem = True
        OnClick = N61Click
      end
      object N71: TMenuItem
        AutoCheck = True
        Caption = '7'
        RadioItem = True
        OnClick = N71Click
      end
      object N81: TMenuItem
        AutoCheck = True
        Caption = '8'
        RadioItem = True
        OnClick = N81Click
      end
      object N91: TMenuItem
        AutoCheck = True
        Caption = '9'
        RadioItem = True
        OnClick = N91Click
      end
      object N101: TMenuItem
        AutoCheck = True
        Caption = '10'
        RadioItem = True
        OnClick = N101Click
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Bitmap1: TMenuItem
      Caption = 'Bitmap'
      OnClick = Bitmap1Click
    end
    object Data1: TMenuItem
      Caption = 'Vertex Data'
      OnClick = Data1Click
    end
    object Bit1: TMenuItem
      Caption = 'Pixel Bit'
      object x81: TMenuItem
        AutoCheck = True
        Caption = 'x4'
        RadioItem = True
        OnClick = x81Click
      end
      object x161: TMenuItem
        AutoCheck = True
        Caption = 'x8'
        RadioItem = True
        OnClick = x161Click
      end
      object x241: TMenuItem
        AutoCheck = True
        Caption = 'x24'
        RadioItem = True
        OnClick = x241Click
      end
      object x321: TMenuItem
        AutoCheck = True
        Caption = 'x32'
        Checked = True
        RadioItem = True
        OnClick = x321Click
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object RenderFrames1: TMenuItem
      Caption = 'Render Frames'
      OnClick = RenderFrames1Click
    end
    object Abort1: TMenuItem
      Caption = 'Abort'
      Enabled = False
      OnClick = Abort1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Panel3: TMenuItem
      AutoCheck = True
      Caption = 'Panel'
      Checked = True
      OnClick = Panel3Click
    end
  end
  object SaveDialog2: TSaveDialog
    Filter = 'Vertex Data (*.VER)|*.ver'
    Left = 112
    Top = 121
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 43
    Top = 122
  end
end
