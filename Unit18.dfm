object Form18: TForm18
  Left = 489
  Top = 100
  Width = 836
  Height = 546
  Caption = #1052#1077#1078#1072#1090#1086#1084#1085#1099#1077' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1103', '#1074#1072#1083#1077#1085#1090#1085#1099#1077' '#1080' '#1076#1074#1091#1075#1088#1072#1085#1085#1099#1077' '#1091#1075#1083#1099
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Splitter1: TSplitter
    Left = 0
    Top = 65
    Width = 820
    Height = 0
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clActiveCaption
    ParentColor = False
    ResizeStyle = rsNone
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 65
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 81
      Top = 7
      Width = 57
      Height = 16
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088
    end
    object Label2: TLabel
      Left = 251
      Top = 7
      Width = 40
      Height = 16
      Caption = #1040#1090#1086#1084' 1'
    end
    object Label3: TLabel
      Left = 332
      Top = 7
      Width = 40
      Height = 16
      Caption = #1040#1090#1086#1084' 2'
    end
    object Label4: TLabel
      Left = 412
      Top = 7
      Width = 40
      Height = 16
      Caption = #1040#1090#1086#1084' 3'
    end
    object Label5: TLabel
      Left = 496
      Top = 7
      Width = 40
      Height = 16
      Caption = #1040#1090#1086#1084' 4'
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 24
      Width = 200
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = #1044#1083#1080#1085#1072' '#1089#1074#1103#1079#1080
      OnChange = ComboBox1Change
      Items.Strings = (
        #1044#1083#1080#1085#1072' '#1089#1074#1103#1079#1080
        #1042#1072#1083#1077#1085#1090#1085#1099#1081' '#1091#1075#1086#1083
        #1044#1074#1091#1075#1088#1072#1085#1085#1099#1081' '#1091#1075#1086#1083)
    end
    object ComboBox2: TComboBox
      Left = 235
      Top = 24
      Width = 80
      Height = 24
      ItemHeight = 16
      TabOrder = 1
      OnChange = ComboBox2Change
    end
    object ComboBox3: TComboBox
      Left = 316
      Top = 24
      Width = 80
      Height = 24
      ItemHeight = 16
      TabOrder = 2
      OnChange = ComboBox3Change
    end
    object ComboBox4: TComboBox
      Left = 397
      Top = 24
      Width = 80
      Height = 24
      ItemHeight = 16
      TabOrder = 3
      OnChange = ComboBox4Change
    end
    object ComboBox5: TComboBox
      Left = 478
      Top = 24
      Width = 80
      Height = 24
      ItemHeight = 16
      TabOrder = 4
      OnChange = ComboBox5Change
    end
    object BitBtn1: TBitBtn
      Left = 568
      Top = 13
      Width = 120
      Height = 41
      Caption = #1043#1088#1072#1092#1080#1082
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 690
      Top = 13
      Width = 120
      Height = 41
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 6
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 820
    Height = 442
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 818
      Height = 440
      VertScrollBar.Smooth = True
      VertScrollBar.Style = ssHotTrack
      VertScrollBar.Tracking = True
      Align = alClient
      TabOrder = 0
    end
  end
end
