object Form2: TForm2
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 210
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Colors'
  ClientHeight = 315
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 139
    Height = 130
    Caption = ' Background '
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 31
      Width = 14
      Height = 15
      Caption = 'R :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 62
      Width = 15
      Height = 15
      Caption = 'G :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 25
      Top = 93
      Width = 14
      Height = 15
      Caption = 'B :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 45
      Top = 28
      Width = 40
      Height = 23
      TabStop = False
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      Text = '0.000'
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 45
      Top = 58
      Width = 40
      Height = 23
      TabStop = False
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      Text = '0.000'
      OnChange = Edit2Change
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 45
      Top = 90
      Width = 40
      Height = 23
      TabStop = False
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      Text = '0.000'
      OnChange = Edit3Change
      OnKeyPress = Edit3KeyPress
    end
    object Button1: TButton
      Left = 91
      Top = 27
      Width = 15
      Height = 25
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 112
      Top = 27
      Width = 15
      Height = 25
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 91
      Top = 58
      Width = 15
      Height = 25
      Caption = '+'
      TabOrder = 5
      TabStop = False
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 112
      Top = 58
      Width = 15
      Height = 25
      Caption = '-'
      TabOrder = 6
      TabStop = False
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 91
      Top = 89
      Width = 15
      Height = 25
      Caption = '+'
      TabOrder = 7
      TabStop = False
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 112
      Top = 89
      Width = 15
      Height = 25
      Caption = '-'
      TabOrder = 8
      TabStop = False
      OnClick = Button6Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 156
    Width = 139
    Height = 130
    Caption = ' Vertex '
    TabOrder = 1
    object Label4: TLabel
      Left = 25
      Top = 29
      Width = 14
      Height = 15
      Caption = 'R :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 60
      Width = 15
      Height = 15
      Caption = 'G :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 25
      Top = 91
      Width = 14
      Height = 15
      Caption = 'B :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit4: TEdit
      Left = 45
      Top = 27
      Width = 40
      Height = 23
      TabStop = False
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      Text = '0.250'
      OnChange = Edit4Change
      OnKeyPress = Edit4KeyPress
    end
    object Edit5: TEdit
      Left = 45
      Top = 57
      Width = 40
      Height = 23
      TabStop = False
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      Text = '0.250'
      OnChange = Edit5Change
      OnKeyPress = Edit5KeyPress
    end
    object Edit6: TEdit
      Left = 45
      Top = 88
      Width = 40
      Height = 23
      TabStop = False
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      Text = '0.400'
      OnChange = Edit6Change
      OnKeyPress = Edit6KeyPress
    end
    object Button7: TButton
      Left = 91
      Top = 25
      Width = 15
      Height = 25
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 112
      Top = 25
      Width = 15
      Height = 25
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 91
      Top = 56
      Width = 15
      Height = 25
      Caption = '+'
      TabOrder = 5
      TabStop = False
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 112
      Top = 56
      Width = 15
      Height = 25
      Caption = '-'
      TabOrder = 6
      TabStop = False
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 91
      Top = 87
      Width = 15
      Height = 25
      Caption = '+'
      TabOrder = 7
      TabStop = False
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 112
      Top = 87
      Width = 15
      Height = 25
      Caption = '-'
      TabOrder = 8
      TabStop = False
      OnClick = Button12Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 296
    Width = 299
    Height = 19
    Panels = <>
    ExplicitTop = 303
    ExplicitWidth = 295
  end
  object GroupBox3: TGroupBox
    Left = 153
    Top = 8
    Width = 139
    Height = 130
    Caption = ' Wireframe '
    TabOrder = 3
    object Label7: TLabel
      Left = 25
      Top = 31
      Width = 14
      Height = 15
      Caption = 'R :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 24
      Top = 62
      Width = 15
      Height = 15
      Caption = 'G :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 25
      Top = 93
      Width = 14
      Height = 15
      Caption = 'B :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit7: TEdit
      Left = 45
      Top = 29
      Width = 40
      Height = 23
      TabStop = False
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      Text = '0.050'
      OnChange = Edit7Change
      OnKeyPress = Edit7KeyPress
    end
    object Edit8: TEdit
      Left = 45
      Top = 59
      Width = 40
      Height = 23
      TabStop = False
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      Text = '0.500'
      OnChange = Edit8Change
      OnKeyPress = Edit8KeyPress
    end
    object Edit9: TEdit
      Left = 45
      Top = 89
      Width = 40
      Height = 23
      TabStop = False
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      Text = '0.600'
      OnChange = Edit9Change
      OnKeyPress = Edit9KeyPress
    end
    object Button13: TButton
      Left = 91
      Top = 27
      Width = 15
      Height = 25
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = Button13Click
    end
    object Button14: TButton
      Left = 112
      Top = 27
      Width = 15
      Height = 25
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = Button14Click
    end
    object Button15: TButton
      Left = 91
      Top = 58
      Width = 15
      Height = 25
      Caption = '+'
      TabOrder = 5
      TabStop = False
      OnClick = Button15Click
    end
    object Button16: TButton
      Left = 112
      Top = 58
      Width = 15
      Height = 25
      Caption = '-'
      TabOrder = 6
      TabStop = False
      OnClick = Button16Click
    end
    object Button17: TButton
      Left = 91
      Top = 89
      Width = 15
      Height = 25
      Caption = '+'
      TabOrder = 7
      TabStop = False
      OnClick = Button17Click
    end
    object Button18: TButton
      Left = 112
      Top = 89
      Width = 15
      Height = 25
      Caption = '-'
      TabOrder = 8
      TabStop = False
      OnClick = Button18Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 153
    Top = 156
    Width = 139
    Height = 130
    Caption = 'Animate RGB'
    TabOrder = 4
    object Button19: TButton
      Left = 52
      Top = 49
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      TabStop = False
      OnClick = Button19Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 74
    Top = 118
  end
end
