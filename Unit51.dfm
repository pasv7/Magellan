object Form51: TForm51
  Left = 280
  Top = 180
  Width = 866
  Height = 399
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1101#1085#1077#1088#1075#1080#1080' (ADMP/BOMD)'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 833
    Height = 350
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -19
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1082#1080#1085#1077#1090#1080#1095#1077#1089#1082#1086#1081' '#1101#1085#1077#1088#1075#1080#1080)
    BottomAxis.Grid.Visible = False
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -13
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.Title.Caption = #1042#1088#1077#1084#1103' '#1089#1080#1084#1091#1083#1103#1094#1080#1080', '#1092#1089
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -16
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Grid.Visible = False
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -13
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.Title.Caption = #1050#1080#1085#1077#1090#1080#1095#1077#1089#1082#1072#1103' '#1101#1085#1077#1088#1075#1080#1103', '#1061#1072#1088#1090#1088#1080
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -16
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    Align = alTop
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      LinePen.Width = 2
      Pointer.Brush.Color = clWhite
      Pointer.HorizSize = 6
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clDefault
      Pointer.Pen.Width = 2
      Pointer.Style = psCircle
      Pointer.VertSize = 6
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
    Top = 350
    Width = 833
    Height = 350
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -19
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1086#1081' '#1101#1085#1077#1088#1075#1080#1080)
    BottomAxis.Grid.Visible = False
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -13
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.Title.Caption = #1042#1088#1077#1084#1103' '#1089#1080#1084#1091#1083#1103#1094#1080#1080', '#1092#1089
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -16
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Grid.Visible = False
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -13
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.Title.Caption = #1055#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1072#1103' '#1101#1085#1077#1088#1075#1080#1103', '#1061#1072#1088#1090#1088#1080
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -16
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    Align = alTop
    TabOrder = 1
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      LinePen.Color = clMaroon
      LinePen.Width = 2
      Pointer.Brush.Color = clWhite
      Pointer.HorizSize = 6
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clBlue
      Pointer.Pen.Width = 2
      Pointer.Style = psCircle
      Pointer.VertSize = 6
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
    Top = 700
    Width = 833
    Height = 350
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -19
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1089#1091#1084#1084#1099' '#1087#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1086#1081' '#1080' '#1082#1080#1085#1077#1090#1080#1095#1077#1089#1082#1086#1081' '#1101#1085#1077#1088#1075#1080#1081)
    BottomAxis.Grid.Visible = False
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -13
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.Title.Caption = #1042#1088#1077#1084#1103' '#1089#1080#1084#1091#1083#1103#1094#1080#1080', '#1092#1089
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -16
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Grid.Visible = False
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -13
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.Title.Caption = 'Epot + Ekin, '#1061#1072#1088#1090#1088#1080
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -16
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    Align = alTop
    TabOrder = 2
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clFuchsia
      LinePen.Width = 2
      Pointer.Brush.Color = clWhite
      Pointer.HorizSize = 6
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clFuchsia
      Pointer.Pen.Width = 2
      Pointer.Style = psCircle
      Pointer.VertSize = 6
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
    Top = 1050
    Width = 833
    Height = 350
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -19
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1086#1083#1085#1086#1081' (SCF/MM) '#1101#1085#1077#1088#1075#1080#1080)
    BottomAxis.Grid.Visible = False
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -13
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.Title.Caption = #1042#1088#1077#1084#1103' '#1089#1080#1084#1091#1083#1103#1094#1080#1080', '#1092#1089
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -16
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    Frame.Visible = False
    LeftAxis.Grid.Visible = False
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -13
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.Title.Caption = #1055#1086#1083#1085#1072#1103' '#1101#1085#1077#1088#1075#1080#1103', '#1061#1072#1088#1090#1088#1080
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -16
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Visible = False
    RightAxis.Grid.Visible = False
    RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
    RightAxis.LabelsFont.Color = clBlack
    RightAxis.LabelsFont.Height = -13
    RightAxis.LabelsFont.Name = 'Arial'
    RightAxis.LabelsFont.Style = []
    RightAxis.Title.Caption = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1072#1103' '#1101#1085#1077#1088#1075#1080#1103', '#1082#1082#1072#1083'/'#1084#1086#1083#1100
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -16
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = []
    TopAxis.Visible = False
    View3D = False
    Align = alTop
    TabOrder = 3
    object Series4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      VertAxis = aBothVertAxis
      LinePen.Width = 2
      Pointer.Brush.Color = clWhite
      Pointer.HorizSize = 6
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clRed
      Pointer.Pen.Width = 2
      Pointer.Style = psCircle
      Pointer.VertSize = 6
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
