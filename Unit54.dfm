object Form54: TForm54
  Left = -63
  Top = 448
  Width = 617
  Height = 439
  Caption = #1042#1086#1079#1073#1091#1078#1076#1077#1085#1085#1099#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' ('#1087#1086#1076#1088#1086#1073#1085#1077#1077') - '#1069#1074#1086#1083#1102#1094#1080#1103
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
    Left = 172
    Top = 12
    Width = 153
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1096#1072#1075#1072', '#1090#1086#1095#1082#1080', '#1094#1080#1082#1083#1072
  end
  object Label2: TLabel
    Left = 9
    Top = 328
    Width = 305
    Height = 65
    Caption = 
      #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077': '#13#10'1. '#1042' '#1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1080' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' '#1088#1072#1079#1083#1080#1095#1085#1099#1084' '#1096#1072#1075#1072#1084' ('#1094#1080 +
      #1082#1083#1072#1084')'#13#10'2. '#1042' '#1084#1086#1083#1077#1082#1091#1083#1103#1088#1085#1086#1081' '#1076#1080#1085#1072#1084#1080#1082#1077' - '#1090#1088#1072#1077#1082#1090#1086#1088#1080#1103#1084#13#10'3. '#1055#1088#1080' '#1089#1082#1072#1085#1080#1088#1086#1074 +
      #1072#1085#1080#1080' - '#1085#1086#1084#1077#1088#1091' '#1096#1072#1075#1072#13#10'4. '#1044#1083#1103' EOM-CCSD '#1087#1077#1088#1074#1099#1081' '#1096#1072#1075' - '#1088#1072#1089#1095#1077#1090' '#1074' '#1090#1077#1086#1088#1080#1080 +
      ' CIS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ListView1: TListView
    Left = 8
    Top = 40
    Width = 585
    Height = 281
    Columns = <
      item
        Caption = #8470
      end
      item
        Alignment = taCenter
        Caption = #1058#1080#1087
        Width = 90
      end
      item
        Alignment = taCenter
        Caption = #1069#1085#1077#1088#1075#1080#1103', '#1101#1042
        Width = 110
      end
      item
        Alignment = taCenter
        Caption = #1044#1083'. '#1074#1086#1083#1085#1099', '#1085#1084
        Width = 110
      end
      item
        Alignment = taCenter
        Caption = #1057#1080#1083#1072' '#1086#1089#1094#1080#1083#1083'.'
        Width = 110
      end
      item
        Alignment = taCenter
        Caption = 'S**2'
        Width = 80
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 161
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object BitBtn1: TBitBtn
    Left = 448
    Top = 336
    Width = 137
    Height = 49
    Caption = #1069#1074#1086#1083#1102#1094#1080#1103
    Enabled = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
