object Form62: TForm62
  Left = 609
  Top = 193
  Width = 515
  Height = 500
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1077#1082#1090#1088#1072' '#1071#1052#1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 233
    Height = 129
    Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 24
      Top = 23
      Width = 97
      Height = 17
      Caption = #1051#1080#1085#1080#1080
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 24
      Top = 47
      Width = 97
      Height = 17
      Caption = #1054#1075#1080#1073#1072#1102#1097#1072#1103
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 24
      Top = 71
      Width = 97
      Height = 17
      Caption = #1047#1085#1072#1095#1077#1085#1080#1103
      TabOrder = 2
      OnClick = CheckBox3Click
    end
    object CheckBox4: TCheckBox
      Left = 24
      Top = 95
      Width = 185
      Height = 17
      Caption = #1047#1072#1083#1080#1074#1082#1072' '#1087#1086#1076' '#1086#1075#1080#1073#1072#1102#1097#1077#1081
      TabOrder = 3
      OnClick = CheckBox4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 233
    Height = 89
    Caption = #1051#1080#1085#1080#1080
    TabOrder = 1
    object Label1: TLabel
      Left = 130
      Top = 28
      Width = 54
      Height = 16
      Caption = #1058#1086#1083#1097#1080#1085#1072
    end
    object Label2: TLabel
      Left = 130
      Top = 58
      Width = 29
      Height = 16
      Caption = #1062#1074#1077#1090
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 24
      Width = 113
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = '1'
      OnChange = ComboBox1Change
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object ColorBox1: TColorBox
      Left = 16
      Top = 56
      Width = 113
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox1Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 231
    Width = 233
    Height = 97
    Caption = #1054#1075#1080#1073#1072#1102#1097#1072#1103
    TabOrder = 2
    object Label3: TLabel
      Left = 130
      Top = 28
      Width = 54
      Height = 16
      Caption = #1058#1086#1083#1097#1080#1085#1072
    end
    object Label4: TLabel
      Left = 130
      Top = 58
      Width = 29
      Height = 16
      Caption = #1062#1074#1077#1090
    end
    object ComboBox2: TComboBox
      Left = 16
      Top = 24
      Width = 113
      Height = 24
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 0
      Text = '2'
      OnChange = ComboBox2Change
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object ColorBox2: TColorBox
      Left = 16
      Top = 56
      Width = 113
      Height = 22
      Selected = clRed
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox2Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 248
    Top = 4
    Width = 241
    Height = 73
    Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072
    TabOrder = 3
    object ColorBox3: TColorBox
      Left = 16
      Top = 32
      Width = 145
      Height = 22
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 0
      OnChange = ColorBox3Change
    end
  end
  object GroupBox5: TGroupBox
    Left = 248
    Top = 80
    Width = 241
    Height = 145
    Caption = #1058#1077#1082#1089#1090#1086#1074#1072#1103' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103
    TabOrder = 4
    object Label5: TLabel
      Left = 154
      Top = 36
      Width = 42
      Height = 16
      Caption = #1056#1072#1079#1084#1077#1088
    end
    object Label6: TLabel
      Left = 154
      Top = 66
      Width = 29
      Height = 16
      Caption = #1062#1074#1077#1090
    end
    object Label7: TLabel
      Left = 154
      Top = 99
      Width = 34
      Height = 16
      Caption = #1055#1086#1088#1086#1075
    end
    object ComboBox3: TComboBox
      Left = 16
      Top = 32
      Width = 136
      Height = 24
      ItemHeight = 16
      TabOrder = 0
      Text = '9'
      OnChange = ComboBox3Change
      Items.Strings = (
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16')
    end
    object ColorBox4: TColorBox
      Left = 16
      Top = 64
      Width = 136
      Height = 22
      Selected = clGray
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox4Change
    end
    object ComboBox4: TComboBox
      Left = 16
      Top = 96
      Width = 136
      Height = 24
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 2
      Text = '5'
      OnChange = ComboBox4Change
      Items.Strings = (
        '0'
        '5'
        '10'
        '20'
        '30'
        '40'
        '50'
        '60'
        '70'
        '80'
        '90')
    end
  end
  object GroupBox6: TGroupBox
    Left = 248
    Top = 231
    Width = 241
    Height = 97
    Caption = #1047#1072#1083#1080#1074#1082#1072
    TabOrder = 5
    object RadioButton1: TRadioButton
      Left = 16
      Top = 24
      Width = 129
      Height = 17
      Caption = #1047#1072#1083#1080#1074#1082#1072' ('#1089#1087#1077#1082#1090#1088')'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 51
      Width = 113
      Height = 18
      Caption = #1047#1072#1083#1080#1074#1082#1072' '#1076#1086' '#1086#1089#1080
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = RadioButton2Click
    end
  end
  object GroupBox7: TGroupBox
    Left = 8
    Top = 331
    Width = 481
    Height = 89
    Caption = #1057#1087#1077#1082#1090#1088
    TabOrder = 6
    object Label8: TLabel
      Left = 48
      Top = 56
      Width = 152
      Height = 16
      Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1077' ('#1101#1082#1089#1087#1086#1085#1077#1085#1090#1072')'
    end
    object Label9: TLabel
      Left = 264
      Top = 56
      Width = 187
      Height = 16
      Caption = #1057#1075#1083#1072#1078#1080#1074#1072#1085#1080#1077' ('#1087#1088#1077#1076#1101#1082#1089#1087#1086#1085#1077#1085#1090#1072')'
    end
    object TrackBar1: TTrackBar
      Left = 8
      Top = 32
      Width = 233
      Height = 25
      Max = 5000
      Min = 1000
      Position = 2000
      TabOrder = 0
      ThumbLength = 15
      TickStyle = tsNone
      OnChange = TrackBar1Change
    end
    object TrackBar2: TTrackBar
      Left = 248
      Top = 32
      Width = 225
      Height = 17
      Max = 500
      Min = 1
      Position = 100
      TabOrder = 1
      ThumbLength = 15
      TickStyle = tsNone
      OnChange = TrackBar2Change
    end
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 424
    Width = 121
    Height = 33
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 7
    OnClick = BitBtn1Click
  end
end
