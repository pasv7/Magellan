object Form37: TForm37
  Left = 677
  Top = -15
  Width = 568
  Height = 527
  Caption = 'IRC'
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
  object Label1: TLabel
    Left = 495
    Top = 11
    Width = 49
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072
  end
  object ComboBox1: TComboBox
    Left = 7
    Top = 8
    Width = 486
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object ListView1: TListView
    Left = 7
    Top = 40
    Width = 538
    Height = 217
    Columns = <
      item
        Caption = '# IRC'
        Width = 80
      end
      item
        Alignment = taCenter
        Caption = #1069#1085#1077#1088#1075#1080#1103', '#1072'.'#1077'.'
        Width = 150
      end
      item
        Alignment = taCenter
        Caption = #1056#1072#1079#1085#1086#1089#1090#1100', '#1082#1082#1072#1083
        Width = 150
      end
      item
        Alignment = taCenter
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Width = 130
      end>
    GridLines = True
    TabOrder = 1
    ViewStyle = vsReport
    OnCustomDrawItem = ListView1CustomDrawItem
  end
  object BitBtn1: TBitBtn
    Left = 7
    Top = 447
    Width = 105
    Height = 33
    Caption = #1055#1086#1076#1088#1086#1073#1085#1077#1077
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 116
    Top = 447
    Width = 105
    Height = 33
    Caption = #1043#1088#1072#1092#1080#1082
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 224
    Top = 447
    Width = 105
    Height = 33
    Caption = #1069#1082#1089#1087#1086#1088#1090
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 333
    Top = 447
    Width = 105
    Height = 33
    Caption = 'Excel'
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 440
    Top = 447
    Width = 105
    Height = 33
    Caption = 'B / A / D'
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 264
    Width = 537
    Height = 177
    Caption = #1054#1073#1097#1080#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 7
    object Label2: TLabel
      Left = 16
      Top = 22
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
      Top = 58
      Width = 37
      Height = 16
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 16
      Top = 76
      Width = 37
      Height = 16
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 16
      Top = 94
      Width = 37
      Height = 16
      Caption = 'Label6'
    end
    object Label7: TLabel
      Left = 348
      Top = 22
      Width = 37
      Height = 16
      Caption = 'Label7'
    end
    object Label8: TLabel
      Left = 348
      Top = 40
      Width = 37
      Height = 16
      Caption = 'Label8'
    end
    object Label9: TLabel
      Left = 348
      Top = 58
      Width = 37
      Height = 16
      Caption = 'Label9'
    end
    object Label10: TLabel
      Left = 16
      Top = 148
      Width = 44
      Height = 16
      Caption = 'Label10'
    end
    object Label11: TLabel
      Left = 112
      Top = 148
      Width = 44
      Height = 16
      Caption = 'Label11'
    end
    object Label12: TLabel
      Left = 16
      Top = 112
      Width = 44
      Height = 16
      Caption = 'Label12'
    end
    object Label13: TLabel
      Left = 16
      Top = 130
      Width = 44
      Height = 16
      Caption = 'Label13'
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text FIles (*.txt)|*.txt'
    Left = 296
    Top = 496
  end
end
