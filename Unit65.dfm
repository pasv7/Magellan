object Form65: TForm65
  Left = 887
  Top = 222
  Width = 486
  Height = 391
  Caption = #1047#1072#1088#1103#1076#1099' ('#1087#1086#1076#1088#1086#1073#1085#1077#1077')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Left = 99
    Top = 12
    Width = 209
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080' ('#1096#1072#1075#1072', '#1094#1080#1082#1083#1072')'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 89
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object ListView1: TListView
    Left = 8
    Top = 40
    Width = 454
    Height = 305
    Columns = <
      item
        Caption = #8470
      end
      item
        Alignment = taCenter
        Caption = #1040#1090#1086#1084
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = #1047#1072#1088#1103#1076', '#1072'.'#1077'.'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #1057#1087#1080#1085', '#1072'.'#1077'.'
        Width = 100
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object BitBtn1: TBitBtn
    Left = 341
    Top = 3
    Width = 121
    Height = 33
    Caption = #1069#1074#1086#1083#1102#1094#1080#1103
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
