object Form22: TForm22
  Left = 183
  Top = 102
  Width = 959
  Height = 566
  Caption = #1069#1085#1077#1088#1075#1077#1090#1080#1095#1077#1089#1082#1072#1103' '#1076#1080#1072#1075#1088#1072#1084#1084#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 943
    Height = 527
    Align = alClient
    Color = clWhite
    ParentColor = False
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 0
      Top = 0
      Width = 939
      Height = 523
      Align = alClient
      PopupMenu = PopupMenu1
      OnDblClick = PaintBox1DblClick
      OnPaint = PaintBox1Paint
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 896
    Top = 24
    object N1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083' '#1076#1080#1072#1075#1088#1072#1084#1084#1099
      OnClick = N2Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083#1099' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1081' (*.bmp)|*.bmp'
    Left = 864
    Top = 24
  end
  object SaveDialog2: TSaveDialog
    Filter = #1060#1072#1081#1083#1099' '#1076#1080#1072#1075#1088#1072#1084#1084#1099' (*.dgr)|*.dgr'
    Left = 832
    Top = 24
  end
end
