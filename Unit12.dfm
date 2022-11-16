object Form12: TForm12
  Left = 540
  Top = 67
  Width = 442
  Height = 461
  Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103' '#1075#1077#1086#1084#1077#1090#1088#1080#1080
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label7: TLabel
    Left = 368
    Top = 12
    Width = 49
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072
  end
  object BitBtn1: TBitBtn
    Left = 55
    Top = 395
    Width = 75
    Height = 25
    Caption = #1043#1088#1072#1092#1080#1082
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 135
    Top = 395
    Width = 75
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object ListView1: TListView
    Left = 8
    Top = 39
    Width = 412
    Height = 230
    Columns = <
      item
        Caption = #1064#1072#1075
        Width = 90
      end
      item
        Alignment = taCenter
        Caption = #1069#1085#1077#1088#1075#1080#1103', '#1072'.'#1077'.'
        Width = 160
      end
      item
        Alignment = taCenter
        Caption = #1056#1072#1079#1085#1086#1089#1090#1100', '#1082#1082#1072#1083
        Width = 140
      end>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 2
    ViewStyle = vsReport
  end
  object Button1: TButton
    Left = 215
    Top = 395
    Width = 75
    Height = 25
    Caption = 'Excel'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 295
    Top = 395
    Width = 75
    Height = 25
    Caption = 'B / A / D'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 357
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 5
    OnChange = ComboBox1Change
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 274
    Width = 417
    Height = 111
    Caption = #1054#1073#1097#1080#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 6
    object Label2: TLabel
      Left = 16
      Top = 23
      Width = 37
      Height = 16
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 16
      Top = 42
      Width = 37
      Height = 16
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 16
      Top = 61
      Width = 37
      Height = 16
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 16
      Top = 81
      Width = 37
      Height = 16
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 112
      Top = 81
      Width = 37
      Height = 16
      Caption = 'Label6'
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083' (*.txt)|*.txt'
    Left = 400
    Top = 395
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 376
    Top = 395
  end
end
