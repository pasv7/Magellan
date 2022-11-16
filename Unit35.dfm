object Form35: TForm35
  Left = 535
  Top = 246
  Width = 403
  Height = 143
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088' '#1084#1086#1076#1099
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 109
    Top = 47
    Width = 120
    Height = 16
    Caption = #1042#1077#1082#1090#1086#1088' ('#1084#1085#1086#1078#1080#1090#1077#1083#1100')'
  end
  object Label2: TLabel
    Left = 109
    Top = 21
    Width = 103
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1082#1086#1083#1077#1073#1072#1085#1080#1103
  end
  object Label3: TLabel
    Left = 108
    Top = 74
    Width = 27
    Height = 16
    Caption = #1047#1085#1072#1082
  end
  object Edit1: TEdit
    Left = 8
    Top = 43
    Width = 97
    Height = 24
    TabOrder = 0
    Text = '1'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 16
    Width = 99
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 71
    Width = 97
    Height = 24
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 2
    Text = #1055#1083#1102#1089
    Items.Strings = (
      #1055#1083#1102#1089
      #1052#1080#1085#1091#1089)
  end
  object BitBtn1: TBitBtn
    Left = 243
    Top = 14
    Width = 137
    Height = 29
    Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 243
    Top = 44
    Width = 137
    Height = 29
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Gaussian Job File (*.gjf)|*.gjf'
    Left = 176
    Top = 64
  end
end
