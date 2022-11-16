object Form60: TForm60
  Left = 312
  Top = 116
  Width = 726
  Height = 491
  Caption = #1052#1072#1075#1085#1080#1090#1085#1099#1077' '#1080' '#1089#1087#1080#1085#1086#1074#1099#1077' '#1089#1074#1086#1081#1089#1090#1074#1072
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
  object Splitter1: TSplitter
    Left = 0
    Top = 49
    Width = 710
    Height = 3
    Cursor = crVSplit
    Align = alTop
    OnCanResize = Splitter1CanResize
    OnMoved = Splitter1Moved
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 185
    Width = 710
    Height = 3
    Cursor = crVSplit
    Align = alTop
    OnCanResize = Splitter2CanResize
    OnMoved = Splitter2Moved
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 99
      Top = 19
      Width = 40
      Height = 16
      Caption = #1040#1090#1086#1084' 1'
    end
    object Label2: TLabel
      Left = 243
      Top = 19
      Width = 40
      Height = 16
      Caption = #1040#1090#1086#1084' 2'
    end
    object ComboBox1: TComboBox
      Left = 24
      Top = 16
      Width = 73
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 168
      Top = 16
      Width = 73
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      OnChange = ComboBox2Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 52
    Width = 710
    Height = 133
    Align = alTop
    TabOrder = 1
    object ListView2: TListView
      Left = 1
      Top = 1
      Width = 708
      Height = 131
      Align = alClient
      Columns = <
        item
          Caption = #1057#1086#1089#1090#1072#1074#1083#1103#1102#1097#1072#1103' '#1084#1072#1075#1085#1080#1090#1085#1086#1081' '#1074#1086#1089#1087#1088#1080#1080#1084#1095#1080#1074#1086#1089#1090#1080
          Width = 400
        end
        item
          Alignment = taCenter
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          Width = 250
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 188
    Width = 710
    Height = 264
    Align = alClient
    TabOrder = 2
    object ListView1: TListView
      Left = 1
      Top = 1
      Width = 708
      Height = 262
      Align = alClient
      Columns = <
        item
          Caption = #1057#1086#1089#1090#1072#1074#1083#1103#1102#1097#1072#1103' '#1089#1087#1080#1085'-'#1089#1087#1080#1085#1086#1074#1086#1075#1086' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103
          Width = 400
        end
        item
          Alignment = taCenter
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          Width = 260
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
end
