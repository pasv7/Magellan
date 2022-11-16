object Form17: TForm17
  Left = 251
  Top = 185
  Width = 652
  Height = 784
  Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1081' (PDOS)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 619
    Height = 361
    AnimatedZoom = True
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1099#1093' '#1091#1088#1086#1074#1085#1077#1081', dN / dE ~ E')
    BottomAxis.Grid.Visible = False
    BottomAxis.Title.Caption = #1069#1085#1077#1088#1075#1080#1103' '#1086#1088#1073#1080#1090#1072#1083#1077#1081' E, '#1101#1042
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Grid.Visible = False
    LeftAxis.Title.Caption = 'dN / dE, 1/'#1072'.'#1077'.'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Chart2: TChart
    Left = 0
    Top = 361
    Width = 619
    Height = 415
    AnimatedZoom = True
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1051#1086#1075#1072#1088#1080#1092#1084' '#1087#1083#1086#1090#1085#1086#1089#1090#1080' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1099#1093' '#1091#1088#1086#1074#1085#1077#1081', lg (dN/dE) ~ E')
    BottomAxis.Grid.Visible = False
    BottomAxis.Title.Caption = #1069#1085#1077#1088#1075#1080#1103' '#1086#1088#1073#1080#1090#1072#1083#1077#1081' E, '#1101#1042
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.ExactDateTime = False
    LeftAxis.Grid.Visible = False
    LeftAxis.Increment = 0.100000000000000000
    LeftAxis.Title.Caption = 'lg (dN/dE)'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 16711808
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 424
    object BMP1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' BMP'
      OnClick = BMP1Click
    end
    object N1: TMenuItem
      Caption = #1054#1088#1073#1080#1090#1072#1083#1080
      object ALPHA1: TMenuItem
        Caption = 'ALPHA'
        OnClick = ALPHA1Click
      end
      object BETA1: TMenuItem
        Caption = 'BETA'
        Enabled = False
        OnClick = BETA1Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.BMP files|*.bmp'
    Left = 24
    Top = 737
  end
end
