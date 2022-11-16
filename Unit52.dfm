object Form52: TForm52
  Left = 1185
  Top = 239
  Width = 587
  Height = 470
  Caption = #1042#1086#1079#1073#1091#1078#1076#1077#1085#1085#1099#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
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
    Left = 509
    Top = 11
    Width = 49
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 497
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object ListView1: TListView
    Left = 8
    Top = 40
    Width = 553
    Height = 193
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
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #1044#1083'. '#1074#1086#1083#1085#1099', '#1085#1084
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #1057#1080#1083#1072' '#1086#1089#1094#1080#1083#1083'.'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'S**2'
        Width = 80
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 239
    Width = 553
    Height = 146
    Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 37
      Height = 16
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 16
      Top = 40
      Width = 37
      Height = 16
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 16
      Top = 56
      Width = 37
      Height = 16
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 16
      Top = 72
      Width = 37
      Height = 16
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 16
      Top = 88
      Width = 37
      Height = 16
      Caption = 'Label6'
    end
    object Label7: TLabel
      Left = 16
      Top = 104
      Width = 37
      Height = 16
      Caption = 'Label7'
    end
    object Label8: TLabel
      Left = 344
      Top = 24
      Width = 37
      Height = 16
      Caption = 'Label8'
    end
    object Label9: TLabel
      Left = 344
      Top = 40
      Width = 37
      Height = 16
      Caption = 'Label9'
    end
    object Label10: TLabel
      Left = 344
      Top = 56
      Width = 44
      Height = 16
      Caption = 'Label10'
    end
    object Label11: TLabel
      Left = 344
      Top = 72
      Width = 44
      Height = 16
      Caption = 'Label11'
    end
    object Label12: TLabel
      Left = 344
      Top = 88
      Width = 44
      Height = 16
      Caption = 'Label12'
    end
    object Label13: TLabel
      Left = 344
      Top = 104
      Width = 44
      Height = 16
      Caption = 'Label13'
    end
    object Label14: TLabel
      Left = 344
      Top = 120
      Width = 44
      Height = 16
      Caption = 'Label14'
    end
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 392
    Width = 89
    Height = 33
    Caption = #1057#1087#1077#1082#1090#1088
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 392
    Width = 89
    Height = 33
    Caption = #1055#1086#1076#1088#1086#1073#1085#1077#1077
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 288
    Top = 392
    Width = 97
    Height = 33
    Caption = #1069#1082#1089#1087#1086#1088#1090
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 408
    Top = 392
    Width = 97
    Height = 33
    Caption = 'Excel'
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text Files (*.txt)|*.txt'
    Left = 520
    Top = 392
  end
end
