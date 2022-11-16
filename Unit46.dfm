object Form46: TForm46
  Left = 425
  Top = 208
  Width = 785
  Height = 417
  Caption = #1055#1086#1076#1088#1086#1073#1085#1077#1077' ('#1088#1077#1083#1072#1082#1089#1080#1088#1086#1074#1072#1085#1085#1086#1077' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077')'
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
  object ListView1: TListView
    Left = 8
    Top = 8
    Width = 753
    Height = 361
    Columns = <
      item
        Caption = '#'
        Width = 60
      end
      item
        Caption = '# point'
        Width = 60
      end
      item
        Caption = '#coor'
        Width = 60
      end
      item
        Caption = 'Coor1'
        Width = 60
      end
      item
        Caption = '#step'
        Width = 60
      end
      item
        Caption = 'E, a.u.'
        Width = 125
      end
      item
        Caption = 'E(i+1)-Ei, '#1082#1082#1072#1083
        Width = 110
      end
      item
        Caption = 'Ei-E0, '#1082#1082#1072#1083
        Width = 110
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnCustomDrawItem = ListView1CustomDrawItem
  end
end
