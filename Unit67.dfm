object Form67: TForm67
  Left = 549
  Top = 97
  Width = 880
  Height = 513
  Caption = #1043#1080#1089#1090#1086#1075#1088#1072#1084#1084#1072' '#1079#1072#1088#1103#1076#1086#1074
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
    Top = 41
    Width = 864
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 266
      Top = 14
      Width = 57
      Height = 16
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088
    end
    object Label2: TLabel
      Left = 447
      Top = 14
      Width = 52
      Height = 16
      Caption = #8470' '#1090#1086#1095#1082#1080
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 11
      Width = 257
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 599
      Top = 4
      Width = 129
      Height = 33
      Caption = #1043#1088#1072#1092#1080#1082
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 735
      Top = 4
      Width = 121
      Height = 33
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object ComboBox2: TComboBox
      Left = 364
      Top = 11
      Width = 81
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 44
    Width = 864
    Height = 430
    Align = alClient
    TabOrder = 1
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 862
      Height = 428
      Align = alClient
      TabOrder = 0
    end
  end
end
