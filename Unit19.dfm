object Form19: TForm19
  Left = 881
  Top = 204
  Width = 380
  Height = 235
  Caption = #1052#1072#1089#1090#1077#1088' '#1076#1080#1072#1075#1088#1072#1084#1084
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 338
    Height = 16
    Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1089#1087#1086#1089#1086#1073' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1101#1085#1077#1088#1075#1077#1090#1080#1095#1077#1089#1082#1086#1081' '#1076#1080#1072#1075#1088#1072#1084#1084#1099
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 48
    Width = 217
    Height = 41
    Caption = #1058#1077#1088#1084#1086#1093#1080#1084#1080#1095#1077#1089#1082#1080#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 80
    Top = 96
    Width = 217
    Height = 41
    Caption = #1060#1072#1081#1083' '#1090#1080#1087#1072' .dgr'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 80
    Top = 144
    Width = 217
    Height = 41
    Caption = #1042#1088#1091#1095#1085#1091#1102
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Files of energy diagramm (*.dgr)|*.dgr'
    Left = 328
    Top = 56
  end
end
