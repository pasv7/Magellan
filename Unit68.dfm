object Form68: TForm68
  Left = 486
  Top = 217
  Width = 636
  Height = 231
  Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088' '#1079#1072#1088#1103#1076#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 356
    Top = 11
    Width = 57
    Height = 16
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088
  end
  object Label2: TLabel
    Left = 525
    Top = 11
    Width = 52
    Height = 16
    Caption = #8470' '#1090#1086#1095#1082#1080
  end
  object Label3: TLabel
    Left = 468
    Top = 43
    Width = 112
    Height = 16
    Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1088#1072#1089#1095#1077#1090
  end
  object Label4: TLabel
    Left = 468
    Top = 76
    Width = 132
    Height = 16
    Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1088#1072#1089#1095#1077#1090#1072
  end
  object Label5: TLabel
    Left = 155
    Top = 134
    Width = 69
    Height = 16
    Caption = #1056#1045#1047#1059#1051#1068#1058#1040#1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 8
    Width = 233
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
  end
  object ComboBox2: TComboBox
    Left = 464
    Top = 8
    Width = 57
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 120
    Top = 40
    Width = 345
    Height = 24
    TabOrder = 2
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 120
    Top = 72
    Width = 345
    Height = 24
    TabOrder = 3
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 8
    Width = 105
    Height = 169
    OnClickCheck = CheckListBox1ClickCheck
    ItemHeight = 16
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 120
    Top = 152
    Width = 157
    Height = 24
    ReadOnly = True
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 296
    Top = 136
    Width = 164
    Height = 41
    Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 464
    Top = 136
    Width = 144
    Height = 41
    Caption = #1069#1074#1086#1083#1102#1094#1080#1103
    TabOrder = 7
    OnClick = BitBtn2Click
  end
end
