object Form39: TForm39
  Left = 557
  Top = 33
  Width = 577
  Height = 450
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1095#1090#1077#1085#1080#1103' XYZ-'#1092#1072#1081#1083#1072
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 321
    Top = 35
    Width = 79
    Height = 16
    Caption = #1052#1077#1090#1082#1072' '#1089#1090#1072#1088#1090#1072
  end
  object Label2: TLabel
    Left = 322
    Top = 67
    Width = 67
    Height = 16
    Caption = #1057#1090#1086#1087'-'#1084#1077#1090#1082#1072
  end
  object Label5: TLabel
    Left = 130
    Top = 123
    Width = 323
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099', '#1089' '#1082#1086#1090#1086#1088#1086#1081' '#1085#1072#1095#1072#1090#1100' '#1095#1090#1077#1085#1080#1077
  end
  object Label6: TLabel
    Left = 129
    Top = 154
    Width = 208
    Height = 16
    Caption = #1044#1086' '#1075#1088#1091#1087#1087#1099' '#1089' '#1082#1072#1082#1080#1084' '#1085#1086#1084#1077#1088#1086#1084' '#1095#1080#1090#1072#1090#1100
  end
  object Label7: TLabel
    Left = 274
    Top = 210
    Width = 252
    Height = 16
    Caption = #1059#1082#1072#1079#1072#1090#1100' '#1085#1086#1084#1077#1088#1072' '#1074' '#1092#1086#1088#1084#1072#1090#1077' 1,2,7,30-50,65 '
  end
  object Label8: TLabel
    Left = 170
    Top = 242
    Width = 337
    Height = 16
    Caption = #1044#1080#1072#1087#1072#1079#1086#1085' '#1072#1090#1086#1084#1086#1074' ('#1085#1077' '#1079#1072#1087#1086#1083#1085#1103#1090#1100' '#1077#1089#1083#1080' '#1074#1089#1077' '#1072#1090#1086#1084#1099' '#1075#1088#1091#1087#1087#1099')'
  end
  object RadioButton1: TRadioButton
    Left = 23
    Top = 8
    Width = 457
    Height = 17
    Hint = 
      #1042' '#1092#1072#1081#1083#1077' XYZ '#1085#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1086' '#1087#1077#1088#1077#1076'  '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1086#1082#1086#1081' '#1082#1086#1086#1088#1076#1080#1085#1072#1090' '#1074#1089#1090#1072 +
      #1074#1100#1090#1077'  '#1090#1077#1082#1089#1090#1086#1074#1091#1102' '#1084#1077#1090#1082#1091' '#1089#1090#1072#1088#1090#1072' '#1095#1090#1077#1085#1080#1103', '#1087#1086#1089#1083#1077' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1089' '#1082#1086 +
      #1086#1088#1076#1080#1085#1072#1090#1072#1084#1080' '#1087#1086#1089#1090#1072#1074#1100#1090#1077' '#1089#1090#1086#1087'-'#1084#1077#1090#1082#1091'. '#1069#1090#1080' '#1078#1077' '#1084#1077#1090#1082#1080' '#1091#1082#1072#1078#1080#1090#1077' '#1074' '#1087#1086#1083#1103#1093' '#1076#1072 +
      #1085#1085#1086#1081' '#1092#1086#1088#1084#1099
    Caption = 
      #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1083#1072#1075#1080' '#1085#1072#1095#1072#1083#1072' '#1080' '#1082#1086#1085#1094#1072' '#1095#1090#1077#1085#1080#1103' XYZ '#1074' '#1074#1080#1076#1077' '#1090#1077#1082#1089#1090#1086#1074#1099#1093' '#1084#1077#1090#1086 +
      #1082
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 45
    Top = 32
    Width = 273
    Height = 24
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 45
    Top = 64
    Width = 273
    Height = 24
    TabOrder = 2
  end
  object RadioButton3: TRadioButton
    Left = 23
    Top = 96
    Width = 215
    Height = 17
    Caption = #1063#1080#1090#1072#1090#1100' '#1092#1072#1081#1083' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object Edit5: TEdit
    Left = 45
    Top = 120
    Width = 81
    Height = 24
    MaxLength = 5
    TabOrder = 4
    OnKeyPress = Edit5KeyPress
  end
  object Edit6: TEdit
    Left = 45
    Top = 152
    Width = 81
    Height = 24
    MaxLength = 5
    TabOrder = 5
    OnKeyPress = Edit6KeyPress
  end
  object RadioButton4: TRadioButton
    Left = 23
    Top = 183
    Width = 159
    Height = 17
    Caption = #1050#1072#1082#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1095#1080#1090#1072#1090#1100
    TabOrder = 6
  end
  object Edit7: TEdit
    Left = 45
    Top = 207
    Width = 225
    Height = 24
    TabOrder = 7
  end
  object Edit8: TEdit
    Left = 45
    Top = 239
    Width = 121
    Height = 24
    TabOrder = 8
  end
  object BitBtn1: TBitBtn
    Left = 25
    Top = 361
    Width = 129
    Height = 41
    Caption = #1063#1080#1090#1072#1090#1100
    TabOrder = 9
    OnClick = BitBtn1Click
  end
  object CheckBox1: TCheckBox
    Left = 352
    Top = 153
    Width = 161
    Height = 17
    Caption = #1057#1082#1086#1083#1100#1082#1086' '#1075#1088#1091#1087#1087' '#1095#1080#1090#1072#1090#1100
    Checked = True
    State = cbChecked
    TabOrder = 10
    OnClick = CheckBox1Click
  end
  object BitBtn2: TBitBtn
    Left = 161
    Top = 361
    Width = 121
    Height = 41
    Caption = #1040#1085#1072#1083#1080#1079
    TabOrder = 11
    OnClick = BitBtn2Click
  end
  object BitBtn4: TBitBtn
    Left = 289
    Top = 360
    Width = 113
    Height = 41
    Caption = 'B / A / D'
    TabOrder = 12
    OnClick = BitBtn4Click
  end
  object BitBtn3: TBitBtn
    Left = 409
    Top = 360
    Width = 129
    Height = 41
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 13
    OnClick = BitBtn3Click
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 272
    Width = 529
    Height = 81
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    TabOrder = 14
    object Label3: TLabel
      Left = 127
      Top = 36
      Width = 182
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1089#1086#1093#1088#1072#1085#1103#1077#1084#1086#1081' '#1075#1077#1086#1084#1077#1090#1088#1080#1080
    end
    object ComboBox1: TComboBox
      Left = 28
      Top = 32
      Width = 97
      Height = 24
      ItemHeight = 16
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 340
      Top = 35
      Width = 169
      Height = 17
      Caption = #1044#1077#1082#1072#1088#1090#1086#1074#1099' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Gaussian Job File (*.gjf)|*.gjf'
    Left = 440
    Top = 72
  end
end
