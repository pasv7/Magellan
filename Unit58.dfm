object Form58: TForm58
  Left = 871
  Top = 121
  Width = 404
  Height = 431
  Caption = #1071#1076#1077#1088#1085#1099#1081' '#1084#1072#1075#1085#1080#1090#1085#1099#1081' '#1088#1077#1079#1086#1085#1072#1085#1089' ('#1071#1052#1056' / NMR)'
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
    Left = 330
    Top = 11
    Width = 49
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072
  end
  object Label2: TLabel
    Left = 199
    Top = 211
    Width = 118
    Height = 16
    Caption = #1052#1077#1090#1086#1076' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 320
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object ListView1: TListView
    Left = 8
    Top = 40
    Width = 370
    Height = 161
    Columns = <
      item
        Caption = #8470
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = #1040#1090#1086#1084
        Width = 70
      end
      item
        Alignment = taCenter
        Caption = #1057#1076#1074#1080#1075', ppm'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #1040#1085#1080#1079#1086#1090#1088#1086#1087#1080#1103', ppm'
        Width = 110
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
  end
  object BitBtn1: TBitBtn
    Left = 193
    Top = 354
    Width = 88
    Height = 33
    Caption = #1069#1082#1089#1087#1086#1088#1090
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 287
    Top = 354
    Width = 88
    Height = 33
    Caption = 'Excel'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 7
    Top = 354
    Width = 88
    Height = 33
    Caption = #1057#1087#1077#1082#1090#1088
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 100
    Top = 354
    Width = 88
    Height = 33
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 208
    Width = 189
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 6
    OnChange = ComboBox2Change
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 240
    Width = 369
    Height = 109
    Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
    TabOrder = 7
    object Label3: TLabel
      Left = 16
      Top = 20
      Width = 37
      Height = 16
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 16
      Top = 36
      Width = 37
      Height = 16
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 16
      Top = 52
      Width = 37
      Height = 16
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 16
      Top = 68
      Width = 37
      Height = 16
      Caption = 'Label6'
    end
    object Label7: TLabel
      Left = 16
      Top = 84
      Width = 37
      Height = 16
      Caption = 'Label7'
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text File (*.txt)|*.txt'
    Left = 328
    Top = 208
  end
end
