object Form28: TForm28
  Left = 381
  Top = 374
  Width = 870
  Height = 640
  Caption = 'P-'#1076#1077#1087#1086#1083#1103#1088#1080#1079#1072#1094#1080#1103
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
    Width = 854
    Height = 582
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
    Top = 582
    Width = 854
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083#1099' '#1090#1080#1087#1072' *.bmp|*.bmp'
    Left = 760
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 792
    Top = 24
    object N0: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N0Click
    end
    object N1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = N1Click
    end
  end
end
