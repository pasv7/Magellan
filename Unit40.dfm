object Form40: TForm40
  Left = 660
  Top = 146
  Width = 393
  Height = 240
  Caption = #1040#1085#1072#1083#1080#1079' XYZ ('#1082#1088#1072#1090#1082#1072#1103' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 361
    Height = 29
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    object Gauge1: TGauge
      Left = 176
      Top = 3
      Width = 177
      Height = 17
      Progress = 0
    end
    object Label1: TLabel
      Left = 7
      Top = 3
      Width = 37
      Height = 16
      Caption = 'Label1'
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 40
    Width = 361
    Height = 153
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
