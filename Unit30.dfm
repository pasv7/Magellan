object Form30: TForm30
  Left = 146
  Top = 95
  Width = 491
  Height = 396
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' ('#1056#1072#1084#1072#1085')'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 241
    Height = 121
    Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 23
      Top = 23
      Width = 209
      Height = 17
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1085#1080#1080
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 23
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
      Left = 23
      Top = 71
      Width = 97
      Height = 17
      Caption = #1047#1085#1072#1095#1077#1085#1080#1103
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox3Click
    end
    object CheckBox4: TCheckBox
      Left = 23
      Top = 95
      Width = 177
      Height = 17
      Caption = #1047#1072#1083#1080#1074#1082#1072' '#1087#1086#1076' '#1086#1075#1080#1073#1072#1102#1097#1077#1081
      TabOrder = 3
      OnClick = CheckBox4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 128
    Width = 241
    Height = 89
    Caption = #1051#1080#1085#1080#1080' ('#1084#1086#1076#1099')'
    TabOrder = 1
    object Label1: TLabel
      Left = 114
      Top = 26
      Width = 54
      Height = 16
      Caption = #1058#1086#1083#1097#1080#1085#1072
    end
    object Label2: TLabel
      Left = 114
      Top = 58
      Width = 29
      Height = 16
      Caption = #1062#1074#1077#1090
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 24
      Width = 97
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
      Width = 97
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox1Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 220
    Width = 241
    Height = 93
    Caption = #1054#1075#1080#1073#1072#1102#1097#1072#1103
    TabOrder = 2
    object Label3: TLabel
      Left = 114
      Top = 27
      Width = 54
      Height = 16
      Caption = #1058#1086#1083#1097#1080#1085#1072
    end
    object Label4: TLabel
      Left = 114
      Top = 57
      Width = 29
      Height = 16
      Caption = #1062#1074#1077#1090
    end
    object ComboBox2: TComboBox
      Left = 16
      Top = 24
      Width = 97
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = '1'
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
      Width = 97
      Height = 22
      Selected = clRed
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox2Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 256
    Top = 7
    Width = 217
    Height = 73
    Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072
    TabOrder = 3
    object ColorBox3: TColorBox
      Left = 16
      Top = 32
      Width = 113
      Height = 22
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 0
      OnChange = ColorBox3Change
    end
  end
  object GroupBox5: TGroupBox
    Left = 256
    Top = 80
    Width = 217
    Height = 137
    Caption = #1058#1077#1082#1089#1090#1086#1074#1072#1103' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103
    TabOrder = 4
    object Label5: TLabel
      Left = 140
      Top = 28
      Width = 42
      Height = 16
      Caption = #1056#1072#1079#1084#1077#1088
    end
    object Label6: TLabel
      Left = 140
      Top = 59
      Width = 29
      Height = 16
      Caption = #1062#1074#1077#1090
    end
    object Label7: TLabel
      Left = 139
      Top = 91
      Width = 34
      Height = 16
      Caption = #1055#1086#1088#1086#1075
    end
    object ComboBox3: TComboBox
      Left = 16
      Top = 24
      Width = 121
      Height = 24
      ItemHeight = 16
      ItemIndex = 3
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
      Top = 56
      Width = 121
      Height = 22
      Selected = clGray
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox4Change
    end
    object ComboBox4: TComboBox
      Left = 16
      Top = 88
      Width = 121
      Height = 24
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 2
      Text = '10'
      OnChange = ComboBox4Change
      Items.Strings = (
        '0'
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
    Left = 256
    Top = 220
    Width = 217
    Height = 94
    Caption = #1047#1072#1083#1080#1074#1082#1072
    TabOrder = 5
    object RadioButton1: TRadioButton
      Left = 16
      Top = 32
      Width = 137
      Height = 17
      Caption = #1047#1072#1083#1080#1074#1082#1072' ('#1089#1087#1077#1082#1090#1088')'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 56
      Width = 113
      Height = 17
      Caption = #1047#1072#1083#1080#1074#1082#1072' '#1076#1086' '#1086#1089#1080
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = RadioButton2Click
    end
  end
  object Button1: TButton
    Left = 176
    Top = 318
    Width = 137
    Height = 35
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = Button1Click
  end
end
