object Form49: TForm49
  Left = 663
  Top = 95
  Width = 594
  Height = 523
  Caption = #1052#1086#1083#1077#1082#1091#1083#1103#1088#1085#1072#1103' '#1076#1080#1085#1072#1084#1080#1082#1072' ADMP & BOMD'
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
    Left = 356
    Top = 12
    Width = 49
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072
  end
  object Label17: TLabel
    Left = 489
    Top = 12
    Width = 69
    Height = 16
    Caption = #1058#1088#1072#1077#1082#1090#1086#1088#1080#1103
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 345
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object ListView1: TListView
    Left = 8
    Top = 40
    Width = 561
    Height = 225
    Columns = <
      item
        Caption = #8470' '#1096#1072#1075#1072
        Width = 62
      end
      item
        Alignment = taCenter
        Caption = #1042#1088#1077#1084#1103', '#1092#1089
        Width = 80
      end
      item
        Alignment = taCenter
        Caption = #1045#1082#1080#1085', '#1072'.'#1077'.'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #1045#1087#1086#1090', '#1072'.'#1077'.'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'Etot, '#1072'.'#1077'.'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #1045', '#1061#1072#1088#1090#1088#1080
        Width = 120
      end
      item
        Alignment = taCenter
        Caption = 'E(i+1)-Ei, '#1082#1082#1072#1083
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'Ei-E0, '#1082#1082#1072#1083
        Width = 100
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 272
    Width = 561
    Height = 161
    Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
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
      Left = 16
      Top = 120
      Width = 37
      Height = 16
      Caption = 'Label8'
    end
    object Label9: TLabel
      Left = 16
      Top = 136
      Width = 37
      Height = 16
      Caption = 'Label9'
    end
    object Label10: TLabel
      Left = 383
      Top = 24
      Width = 44
      Height = 16
      Caption = 'Label10'
    end
    object Label11: TLabel
      Left = 383
      Top = 40
      Width = 44
      Height = 16
      Caption = 'Label11'
    end
    object Label12: TLabel
      Left = 383
      Top = 56
      Width = 44
      Height = 16
      Caption = 'Label12'
    end
    object Label13: TLabel
      Left = 383
      Top = 72
      Width = 44
      Height = 16
      Caption = 'Label13'
    end
    object Label14: TLabel
      Left = 383
      Top = 88
      Width = 44
      Height = 16
      Caption = 'Label14'
    end
    object Label15: TLabel
      Left = 383
      Top = 104
      Width = 44
      Height = 16
      Caption = 'Label15'
    end
    object Label16: TLabel
      Left = 383
      Top = 120
      Width = 44
      Height = 16
      Caption = 'Label16'
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 442
    Width = 108
    Height = 33
    Caption = #1069#1085#1077#1088#1075#1080#1103
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 248
    Top = 442
    Width = 112
    Height = 33
    Caption = #1069#1082#1089#1087#1086#1088#1090
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 366
    Top = 442
    Width = 99
    Height = 33
    Caption = 'Excel'
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 472
    Top = 442
    Width = 97
    Height = 33
    Caption = 'B / A / D'
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object ComboBox2: TComboBox
    Left = 416
    Top = 8
    Width = 70
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 7
    OnChange = ComboBox2Change
  end
  object BitBtn5: TBitBtn
    Left = 122
    Top = 442
    Width = 117
    Height = 33
    Caption = #1055#1086#1076#1088#1086#1073#1085#1077#1077
    TabOrder = 8
    OnClick = BitBtn5Click
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text Files (*.txt)|*.txt'
    Left = 584
    Top = 408
  end
end
