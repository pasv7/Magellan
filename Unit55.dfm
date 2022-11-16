object Form55: TForm55
  Left = 850
  Top = 536
  Width = 803
  Height = 558
  Caption = #1069#1074#1086#1083#1102#1094#1080#1103' '#1074#1086#1079#1073#1091#1078#1076#1077#1085#1085#1086#1075#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 57
    Width = 787
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 266
      Top = 19
      Width = 57
      Height = 16
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088
    end
    object Label2: TLabel
      Left = 467
      Top = 19
      Width = 34
      Height = 16
      Caption = #8470' '#1042#1057
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 16
      Width = 257
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 392
      Top = 16
      Width = 73
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 656
      Top = 10
      Width = 121
      Height = 33
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 520
      Top = 10
      Width = 129
      Height = 33
      Caption = #1043#1088#1072#1092#1080#1082
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 787
    Height = 459
    Align = alClient
    TabOrder = 1
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 785
      Height = 457
      Align = alClient
      TabOrder = 0
    end
  end
end
