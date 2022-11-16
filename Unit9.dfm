object Form9: TForm9
  Left = 442
  Top = 239
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1089#1077#1089#1089#1080#1081' BCF/BAT'
  ClientHeight = 394
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 336
    Width = 355
    Height = 16
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1091#1090#1100' '#1082#1072#1090#1072#1083#1086#1075#1072' '#1076#1083#1103' '#1088#1072#1079#1084#1077#1097#1077#1085#1080#1103' out / log - '#1092#1072#1081#1083#1086#1074
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 464
    Top = 360
    Width = 41
    Height = 25
    Caption = '...'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object BitButton1: TBitBtn
    Left = 6
    Top = 288
    Width = 102
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitButton1Click
  end
  object BitButton2: TBitBtn
    Left = 319
    Top = 288
    Width = 102
    Height = 33
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitButton2Click
  end
  object BitButton3: TBitBtn
    Left = 112
    Top = 288
    Width = 100
    Height = 33
    Caption = #1042#1099#1096#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitButton3Click
  end
  object BitButton4: TBitBtn
    Left = 215
    Top = 288
    Width = 101
    Height = 33
    Caption = #1053#1080#1078#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitButton4Click
  end
  object BitButton5: TBitBtn
    Left = 424
    Top = 288
    Width = 98
    Height = 33
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitButton5Click
  end
  object ListView1: TListView
    Left = 8
    Top = 8
    Width = 514
    Height = 273
    Columns = <
      item
        Caption = 'Input Files'
        MaxWidth = 255
        MinWidth = 255
        Width = 255
      end
      item
        Caption = 'Output Files'
        MaxWidth = 255
        MinWidth = 255
        Width = 255
      end>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    FlatScrollBars = True
    GridLines = True
    HideSelection = False
    IconOptions.Arrangement = iaLeft
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 5
    ViewStyle = vsReport
  end
  object Edit1: TEdit
    Left = 8
    Top = 360
    Width = 449
    Height = 24
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 440
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N4Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Gaussian Job Files (*.gjf)|*.gjf'
    Left = 40
    Top = 440
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Batch Control File (*.bcf)|*.bcf|BAT File (*.bat)|*.bat'
    Left = 72
    Top = 440
  end
  object OpenDialog2: TOpenDialog
    Filter = 'Batch Control Files (*.bcf)|*.bcf|BAT Files (*.bat)|*.bat'
    Left = 104
    Top = 440
  end
end
