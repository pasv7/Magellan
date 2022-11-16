object Form27: TForm27
  Left = 252
  Top = 165
  Width = 711
  Height = 494
  Caption = #1056#1072#1084#1072#1085#1086#1074#1089#1082#1080#1081' '#1089#1087#1077#1082#1090#1088
  Color = clWhite
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
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 695
    Height = 436
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
    Top = 436
    Width = 695
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 624
    Top = 16
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072
      object P1: TMenuItem
        Caption = 'P-'#1076#1077#1087#1086#1083#1103#1088#1080#1079#1072#1094#1080#1103
        OnClick = P1Click
      end
      object U1: TMenuItem
        Caption = 'U-'#1076#1077#1087#1086#1083#1103#1088#1080#1079#1072#1094#1080#1103
        OnClick = U1Click
      end
    end
    object N3: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = N3Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083' '#1090#1080#1087#1072' *.bmp|*.bmp'
    Left = 656
    Top = 16
  end
end
