object Form64: TForm64
  Left = 801
  Top = 23
  Width = 420
  Height = 462
  Caption = #1047#1072#1088#1103#1076#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object Label1: TLabel
    Left = 344
    Top = 11
    Width = 49
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072
  end
  object Label6: TLabel
    Left = 202
    Top = 192
    Width = 112
    Height = 16
    Caption = #1052#1077#1090#1086#1076' '#1074#1099#1095#1080#1089#1083#1077#1085#1080#1081
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 334
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object ListView1: TListView
    Left = 8
    Top = 37
    Width = 385
    Height = 147
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
        Caption = #1047#1072#1088#1103#1076', '#1072'.'#1077'.'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #1057#1087#1080#1085'. '#1087#1083'-'#1090#1100', '#1072'.'#1077'.'
        Width = 120
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 218
    Width = 385
    Height = 126
    Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 37
      Height = 16
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 16
      Top = 33
      Width = 37
      Height = 16
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 16
      Top = 49
      Width = 37
      Height = 16
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 16
      Top = 65
      Width = 37
      Height = 16
      Caption = 'Label5'
    end
    object Label7: TLabel
      Left = 16
      Top = 82
      Width = 37
      Height = 16
      Caption = 'Label7'
    end
    object Label8: TLabel
      Left = 16
      Top = 98
      Width = 37
      Height = 16
      Caption = 'Label8'
    end
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 189
    Width = 191
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    OnChange = ComboBox2Change
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 347
    Width = 100
    Height = 35
    Caption = #1055#1086#1076#1088#1086#1073#1085#1077#1077
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 250
    Top = 384
    Width = 100
    Height = 35
    Caption = 'Excel'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 250
    Top = 347
    Width = 100
    Height = 35
    Caption = #1069#1082#1089#1087#1086#1088#1090
    TabOrder = 6
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 145
    Top = 347
    Width = 100
    Height = 35
    Caption = #1043#1080#1089#1090#1086#1075#1088#1072#1084#1084#1072
    TabOrder = 7
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 40
    Top = 384
    Width = 100
    Height = 35
    Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
    TabOrder = 8
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 145
    Top = 384
    Width = 100
    Height = 35
    Caption = #1052#1086#1076#1077#1083#1100
    TabOrder = 9
    OnClick = BitBtn6Click
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text Files (*.txt)|*.txt'
    Left = 360
    Top = 352
  end
end
