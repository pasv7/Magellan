object Form56: TForm56
  Left = 450
  Top = 137
  Width = 928
  Height = 480
  Caption = 'UV-Vis '#1089#1087#1077#1082#1090#1088
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 912
    Height = 422
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
    Top = 422
    Width = 912
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 816
    Top = 16
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      OnClick = N2Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103' (*.bmp)|*.bmp'
    Left = 848
    Top = 16
  end
end
