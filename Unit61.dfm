object Form61: TForm61
  Left = 380
  Top = 138
  Width = 928
  Height = 480
  Caption = #1057#1087#1077#1082#1090#1088' '#1071#1052#1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 111
      Top = 19
      Width = 42
      Height = 16
      Caption = #1069#1090#1072#1083#1086#1085
    end
    object Label2: TLabel
      Left = 260
      Top = 19
      Width = 68
      Height = 16
      Caption = #1058#1080#1087' '#1072#1090#1086#1084#1086#1074
    end
    object Edit1: TEdit
      Left = 8
      Top = 16
      Width = 101
      Height = 24
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object ComboBox1: TComboBox
      Left = 179
      Top = 16
      Width = 81
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      OnChange = ComboBox1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 912
    Height = 392
    Align = alClient
    Color = clWhite
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 1
      Top = 1
      Width = 910
      Height = 371
      Align = alClient
      OnClick = PaintBox1Click
      OnDblClick = PaintBox1DblClick
      OnMouseDown = PaintBox1MouseDown
      OnMouseMove = PaintBox1MouseMove
      OnMouseUp = PaintBox1MouseUp
      OnPaint = PaintBox1Paint
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 372
      Width = 910
      Height = 19
      Panels = <
        item
          Width = 200
        end>
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Bitmap File (*.bmp)|*.bmp'
    Left = 864
    Top = 57
  end
  object PopupMenu1: TPopupMenu
    Left = 816
    Top = 57
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      OnClick = N2Click
    end
  end
  object Timer1: TTimer
    Left = 352
    Top = 8
  end
end
