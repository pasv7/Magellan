object Form8: TForm8
  Left = 509
  Top = 215
  Width = 534
  Height = 338
  VertScrollBar.Position = 1797
  Caption = #1069#1074#1086#1083#1102#1094#1080#1103' '#1083#1080#1085#1077#1081#1085#1099#1093' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = -1797
    Width = 500
    Height = 300
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    BottomWall.Brush.Color = clWhite
    Title.Brush.Color = clWhite
    Title.Brush.Style = bsClear
    Title.Color = clWhite
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -15
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1044#1083#1080#1085#1072' '#1089#1080#1089#1090#1077#1084#1099' '#1087#1086' '#1086#1089#1080' X')
    BottomAxis.Title.Caption = #1053#1086#1084#1077#1088' '#1094#1080#1082#1083#1072' N'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Title.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1074#1076#1086#1083#1100' '#1086#1089#1080' X, A'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    View3DWalls = False
    BevelOuter = bvNone
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
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
    Top = -1497
    Width = 500
    Height = 300
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -15
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1044#1083#1080#1085#1072' '#1089#1080#1089#1090#1077#1084#1099' '#1087#1086' '#1086#1089#1080' Y')
    BottomAxis.Title.Caption = #1053#1086#1084#1077#1088' '#1094#1080#1082#1083#1072' N'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Title.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1074#1076#1086#1083#1100' '#1086#1089#1080' Y, A'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    BevelOuter = bvNone
    TabOrder = 1
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
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
  object Chart3: TChart
    Left = 0
    Top = -1197
    Width = 500
    Height = 300
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -15
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1044#1083#1080#1085#1072' '#1089#1080#1089#1090#1077#1084#1099' '#1087#1086' '#1086#1089#1080' Z')
    BottomAxis.Title.Caption = #1053#1086#1084#1077#1088' '#1094#1080#1082#1083#1072' N'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Title.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1074#1076#1086#1083#1100' '#1086#1089#1080' Z, A'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    BevelOuter = bvNone
    TabOrder = 2
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
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
  object Chart4: TChart
    Left = 0
    Top = -897
    Width = 500
    Height = 300
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -15
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1044#1083#1080#1085#1072' '#1089#1080#1089#1090#1077#1084#1099' '#1074' '#1087#1083#1086#1089#1082#1086#1089#1090#1080' XY')
    BottomAxis.Title.Caption = #1053#1086#1084#1077#1088' '#1094#1080#1082#1083#1072' N'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Title.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1074' '#1087#1083#1086#1089#1082#1086#1089#1090#1080' XY, A'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    BevelOuter = bvNone
    TabOrder = 3
    object Series4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
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
  object Chart5: TChart
    Left = 0
    Top = -597
    Width = 500
    Height = 300
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -15
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1044#1083#1080#1085#1072' '#1089#1080#1089#1090#1077#1084#1099' '#1074' '#1087#1083#1086#1089#1082#1086#1089#1090#1080' XZ')
    BottomAxis.Title.Caption = #1053#1086#1084#1077#1088' '#1094#1080#1082#1083#1072' N'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Title.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1074' '#1087#1083#1086#1089#1082#1086#1089#1090#1080' XZ, A'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    BevelOuter = bvNone
    TabOrder = 4
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
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
  object Chart6: TChart
    Left = 0
    Top = -297
    Width = 500
    Height = 300
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -15
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1044#1083#1080#1085#1072' '#1089#1080#1089#1090#1077#1084#1099' '#1074' '#1087#1083#1086#1089#1082#1086#1089#1090#1080' YZ')
    BottomAxis.Title.Caption = #1053#1086#1084#1077#1088' '#1094#1080#1082#1083#1072' N'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Title.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1074' '#1087#1083#1086#1089#1082#1086#1089#1090#1080' YZ, A'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    BevelOuter = bvNone
    TabOrder = 5
    object Series6: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
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
  object Chart7: TChart
    Left = 0
    Top = 3
    Width = 500
    Height = 300
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -15
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1044#1080#1072#1084#1077#1090#1088' '#1084#1086#1083#1077#1082#1091#1083#1099)
    BottomAxis.Title.Caption = #1053#1086#1084#1077#1088' '#1094#1080#1082#1083#1072' N'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -15
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Title.Caption = #1044#1080#1072#1084#1077#1090#1088' '#1084#1086#1083#1077#1082#1091#1083#1099', A'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    BevelOuter = bvNone
    TabOrder = 6
    object Series7: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 16711808
      LinePen.Color = clLime
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
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
end
