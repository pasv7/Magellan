object Form72: TForm72
  Left = -78
  Top = 260
  Width = 424
  Height = 470
  Caption = #1054#1073#1097#1080#1077' '#1076#1072#1085#1085#1099#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 353
    Top = 11
    Width = 49
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 342
    Height = 24
    ItemHeight = 16
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 40
    Width = 393
    Height = 27
    ActivePage = TabSheet2
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1097#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103'         '
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1077#1088#1084#1086#1076#1080#1085#1072#1084#1080#1082#1072' '#1080' '#1090#1077#1088#1084#1086#1093#1080#1084#1080#1103'    '
      ImageIndex = 1
    end
  end
  object ListView1: TListView
    Left = 8
    Top = 72
    Width = 393
    Height = 355
    Columns = <
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
        Width = 170
      end
      item
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
        Width = 205
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
  end
end
