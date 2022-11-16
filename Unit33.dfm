object Form33: TForm33
  Left = 477
  Top = 404
  Width = 759
  Height = 484
  Caption = #1054#1087#1090#1080#1095#1077#1089#1082#1080#1081' '#1082#1088#1091#1075#1086#1074#1086#1081' '#1076#1080#1093#1088#1086#1080#1079#1084' (VCD)'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 743
    Height = 426
    Align = alClient
    PopupMenu = PopupMenu1
    OnDblClick = PaintBox1DblClick
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnMouseUp = PaintBox1MouseUp
    OnPaint = PaintBox1Paint
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 426
    Width = 743
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 648
    Top = 16
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = N2Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083#1099' '#1090#1080#1087#1072' *.bmp|*.bmp'
    Left = 680
    Top = 16
  end
end
