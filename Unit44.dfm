object Form44: TForm44
  Left = 546
  Top = 86
  Width = 563
  Height = 473
  Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1086#1081' '#1087#1086#1074#1077#1088#1093#1085#1086#1089#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 486
    Top = 11
    Width = 49
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072
  end
  object Label2: TLabel
    Left = 9
    Top = 242
    Width = 37
    Height = 16
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 9
    Top = 262
    Width = 37
    Height = 16
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 9
    Top = 284
    Width = 37
    Height = 16
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 8
    Top = 305
    Width = 37
    Height = 16
    Caption = 'Label5'
  end
  object Label6: TLabel
    Left = 8
    Top = 325
    Width = 37
    Height = 16
    Caption = 'Label6'
  end
  object Label7: TLabel
    Left = 356
    Top = 236
    Width = 37
    Height = 16
    Caption = 'Label7'
  end
  object Label8: TLabel
    Left = 356
    Top = 253
    Width = 37
    Height = 16
    Caption = 'Label8'
  end
  object Label9: TLabel
    Left = 356
    Top = 270
    Width = 37
    Height = 16
    Caption = 'Label9'
  end
  object Label10: TLabel
    Left = 356
    Top = 288
    Width = 44
    Height = 16
    Caption = 'Label10'
  end
  object Label11: TLabel
    Left = 356
    Top = 306
    Width = 44
    Height = 16
    Caption = 'Label11'
  end
  object Label12: TLabel
    Left = 356
    Top = 323
    Width = 44
    Height = 16
    Caption = 'Label12'
  end
  object Label13: TLabel
    Left = 356
    Top = 342
    Width = 44
    Height = 16
    Caption = 'Label13'
  end
  object Label14: TLabel
    Left = 356
    Top = 361
    Width = 44
    Height = 16
    Caption = 'Label14'
  end
  object Label15: TLabel
    Left = 48
    Top = 352
    Width = 44
    Height = 16
    Caption = 'Label15'
  end
  object ListView1: TListView
    Left = 8
    Top = 38
    Width = 529
    Height = 193
    Columns = <
      item
        Caption = '#(1)'
        Width = 70
      end
      item
        Caption = 'Coord.'
        Width = 70
      end
      item
        Caption = 'E(total), a.u.'
        Width = 135
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
    OnKeyDown = ListView1KeyDown
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 473
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 392
    Width = 89
    Height = 33
    Caption = #1069#1085#1077#1088#1075#1080#1103
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 108
    Top = 392
    Width = 85
    Height = 33
    Caption = #1055#1086#1076#1088#1086#1073#1085#1077#1077
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 197
    Top = 392
    Width = 84
    Height = 33
    Caption = #1056#1077#1083#1100#1077#1092
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 287
    Top = 392
    Width = 75
    Height = 33
    Caption = #1069#1082#1089#1087#1086#1088#1090
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 368
    Top = 392
    Width = 75
    Height = 33
    Caption = 'Excel'
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 448
    Top = 392
    Width = 81
    Height = 33
    Caption = 'B / A / D'
    TabOrder = 7
    OnClick = BitBtn6Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 112
    Top = 344
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text Files (*.txt)|*.txt'
    Left = 160
    Top = 344
  end
end
