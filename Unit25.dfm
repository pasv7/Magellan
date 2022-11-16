object Form25: TForm25
  Left = 415
  Top = 289
  Width = 751
  Height = 453
  Caption = #1048#1050'-'#1089#1087#1077#1082#1090#1088
  Color = clWhite
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 735
    Height = 395
    Align = alClient
    Color = clWhite
    ParentColor = False
    PopupMenu = PopupMenu1
    OnDblClick = PaintBox1DblClick
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnMouseUp = PaintBox1MouseUp
    OnPaint = PaintBox1Paint
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 395
    Width = 735
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 600
    Top = 16
    object LIN1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080'...'
      OnClick = LIN1Click
    end
    object SQ1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = SQ1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083#1099' '#1090#1080#1087#1072' *.bmp|*.bmp'
    Left = 632
    Top = 16
  end
end
