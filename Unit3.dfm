object Form3: TForm3
  Left = 577
  Top = 131
  Width = 339
  Height = 316
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1084#1077#1078#1072#1090#1086#1084#1085#1099#1093' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1081
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 118
    Top = 20
    Width = 59
    Height = 16
    Caption = #1058#1080#1087' '#1089#1074#1103#1079#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 17
    Top = 16
    Width = 96
    Height = 24
    DropDownCount = 20
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    Text = #1042#1089#1077
    Items.Strings = (
      #1042#1089#1077)
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 56
    Width = 297
    Height = 169
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 124
      Top = 68
      Width = 112
      Height = 16
      Caption = #1064#1072#1075' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103', '#1040
    end
    object Label2: TLabel
      Left = 124
      Top = 37
      Width = 125
      Height = 16
      Caption = #1053#1072#1095#1072#1083#1086' '#1076#1080#1072#1087#1072#1079#1086#1085#1072', '#1040
    end
    object Label5: TLabel
      Left = 124
      Top = 100
      Width = 75
      Height = 16
      Caption = #1063#1080#1089#1083#1086' '#1096#1072#1075#1086#1074
    end
    object Label3: TLabel
      Left = 23
      Top = 136
      Width = 106
      Height = 16
      Caption = #1050#1086#1085#1077#1094' '#1076#1080#1072#1087#1072#1079#1086#1085#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 23
      Top = 64
      Width = 95
      Height = 24
      MaxLength = 6
      TabOrder = 1
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 23
      Top = 32
      Width = 95
      Height = 24
      MaxLength = 6
      TabOrder = 0
      OnChange = Edit2Change
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 23
      Top = 96
      Width = 95
      Height = 24
      MaxLength = 3
      TabOrder = 2
      OnChange = Edit3Change
      OnKeyPress = Edit3KeyPress
    end
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 240
    Width = 89
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 240
    Width = 97
    Height = 25
    Caption = #1043#1080#1089#1090#1086#1075#1088#1072#1084#1084#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 216
    Top = 240
    Width = 97
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object SaveDialog1: TSaveDialog
    Left = 16
    Top = 312
  end
end
