object Form38: TForm38
  Left = 400
  Top = 137
  Width = 905
  Height = 527
  Caption = 'IRC ('#1055#1086#1076#1088#1086#1073#1085#1077#1077')'
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
  object ListView1: TListView
    Left = 8
    Top = 8
    Width = 873
    Height = 473
    Columns = <
      item
        Caption = #1058#1086#1095#1082#1072' #'
        Width = 80
      end
      item
        Caption = #1064#1072#1075' #'
        Width = 80
      end
      item
        Caption = '#'
        Width = 80
      end
      item
        Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1072
        Width = 130
      end
      item
        Caption = #1069#1085#1077#1088#1075#1080#1103', '#1072'.'#1077'.'
        Width = 130
      end
      item
        Caption = #1056#1072#1079#1085#1086#1089#1090#1100', '#1082#1082#1072#1083
        Width = 130
      end
      item
        Caption = 'Delta, '#1082#1082#1072#1083
        Width = 110
      end
      item
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Width = 100
      end>
    GridLines = True
    TabOrder = 0
    ViewStyle = vsReport
    OnCustomDrawItem = ListView1CustomDrawItem
  end
end
