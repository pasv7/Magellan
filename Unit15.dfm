object Form15: TForm15
  Left = 253
  Top = 85
  Width = 973
  Height = 604
  Caption = 'ALPHA-levels'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 161
    Top = 442
    Width = 109
    Height = 16
    Caption = #1052#1072#1089#1096#1090#1072#1073#1080#1088#1086#1074#1072#1085#1080#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 152
    Top = 488
    Width = 126
    Height = 16
    Caption = '1x             1000x'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 201
    Top = 510
    Width = 24
    Height = 16
    Caption = #1060#1086#1085
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 8
    Width = 945
    Height = 417
    HorzScrollBar.Smooth = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 10
      Top = 5
      Width = 903
      Height = 360
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      OnDblClick = PaintBox1DblClick
      OnPaint = PaintBox1Paint
    end
    object PaintBox2: TPaintBox
      Left = 10
      Top = 364
      Width = 903
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnPaint = PaintBox2Paint
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 440
    Width = 129
    Height = 113
    Caption = #1054#1088#1073#1080#1090#1072#1083#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object RadioButton1: TRadioButton
      Left = 15
      Top = 25
      Width = 65
      Height = 17
      Caption = 'Alpha'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 15
      Top = 54
      Width = 57
      Height = 17
      Caption = 'Beta'
      TabOrder = 1
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 15
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Alpha + Beta'
      TabOrder = 2
      OnClick = RadioButton3Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 894
    Top = 12
    Width = 31
    Height = 23
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = BitBtn1Click
  end
  object TrackBar1: TTrackBar
    Left = 142
    Top = 461
    Width = 145
    Height = 30
    TabOrder = 3
    OnChange = TrackBar1Change
    OnKeyPress = TrackBar1KeyPress
  end
  object CheckBox1: TCheckBox
    Left = 296
    Top = 448
    Width = 57
    Height = 17
    Caption = #1065#1077#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 296
    Top = 478
    Width = 81
    Height = 17
    Caption = #1055#1086#1076#1087#1080#1089#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 296
    Top = 508
    Width = 49
    Height = 17
    Caption = 'EN'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = CheckBox3Click
  end
  object GroupBox2: TGroupBox
    Left = 384
    Top = 440
    Width = 215
    Height = 113
    Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object Label1: TLabel
      Left = 152
      Top = 36
      Width = 24
      Height = 16
      Caption = #1064#1072#1075
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 152
      Top = 75
      Width = 47
      Height = 16
      Caption = #1064#1080#1088#1080#1085#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TrackBar2: TTrackBar
      Left = 2
      Top = 31
      Width = 150
      Height = 33
      TabOrder = 0
      OnChange = TrackBar2Change
      OnKeyPress = TrackBar2KeyPress
    end
    object TrackBar3: TTrackBar
      Left = 2
      Top = 71
      Width = 150
      Height = 33
      TabOrder = 1
      OnChange = TrackBar3Change
      OnKeyPress = TrackBar3KeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 608
    Top = 440
    Width = 201
    Height = 113
    Caption = #1062#1074#1077#1090' '#1091#1088#1086#1074#1085#1077#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    object Label3: TLabel
      Left = 152
      Top = 26
      Width = 25
      Height = 16
      Caption = 'OCC'
    end
    object Label4: TLabel
      Left = 152
      Top = 54
      Width = 28
      Height = 16
      Caption = 'VIRT'
    end
    object Label5: TLabel
      Left = 153
      Top = 80
      Width = 33
      Height = 16
      Caption = #1065#1077#1083#1100
    end
    object ColorBox1: TColorBox
      Left = 8
      Top = 23
      Width = 137
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      BiDiMode = bdLeftToRight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnChange = ColorBox1Change
      OnKeyPress = ColorBox1KeyPress
    end
    object ColorBox2: TColorBox
      Left = 8
      Top = 51
      Width = 137
      Height = 22
      Selected = clRed
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox2Change
      OnKeyPress = ColorBox2KeyPress
    end
    object ColorBox3: TColorBox
      Left = 8
      Top = 78
      Width = 137
      Height = 22
      Selected = clBlue
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 2
      OnChange = ColorBox3Change
      OnKeyPress = ColorBox3KeyPress
    end
  end
  object GroupBox4: TGroupBox
    Left = 816
    Top = 442
    Width = 137
    Height = 111
    Caption = #1058#1086#1083#1097#1080#1085#1072' '#1091#1088#1086#1074#1085#1077#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    object Label7: TLabel
      Left = 63
      Top = 71
      Width = 33
      Height = 16
      Caption = #1065#1077#1083#1100
    end
    object Label8: TLabel
      Left = 63
      Top = 35
      Width = 42
      Height = 16
      Caption = #1059#1088#1086#1074#1085#1080
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 33
      Width = 49
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = '1'
      OnChange = ComboBox1Change
      OnKeyPress = ComboBox1KeyPress
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 68
      Width = 49
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 1
      Text = '2'
      OnChange = ComboBox2Change
      OnKeyPress = ComboBox2KeyPress
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
  end
  object CheckBox4: TCheckBox
    Left = 296
    Top = 537
    Width = 81
    Height = 17
    Caption = #1057#1080#1089#1090#1077#1084#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = CheckBox4Click
  end
  object ColorBox4: TColorBox
    Left = 152
    Top = 528
    Width = 129
    Height = 22
    DefaultColorColor = clDefault
    Selected = clWhite
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 11
    OnChange = ColorBox4Change
    OnKeyPress = ColorBox4KeyPress
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 928
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.BMP files|*.bmp'
    Left = 864
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 840
    Top = 8
    object N1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' BMP'
      OnClick = N1Click
    end
  end
end
