object Form1: TForm1
  Left = 694
  Top = 387
  Width = 879
  Height = 613
  Caption = 'Magellan 1.4 '
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object StatusBar1: TStatusBar
    Left = 0
    Top = 533
    Width = 863
    Height = 22
    Panels = <
      item
        Width = 110
      end
      item
        Width = 150
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ParentColor = True
    ParentFont = True
    UseSystemFont = False
  end
  object MainMenu1: TMainMenu
    Left = 776
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object N7: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083#1099'...'
        OnClick = N7Click
      end
      object N43: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
        OnClick = N43Click
      end
      object N8: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1077#1089#1089#1080#1102
        OnClick = N8Click
      end
      object LOGOUT1: TMenuItem
        Caption = 'LOG<->OUT '#1082#1086#1085#1074#1077#1088#1090#1077#1088
      end
      object N10: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100
      end
      object N11: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        object N44: TMenuItem
          Caption = #1044#1077#1082#1072#1088#1090#1086#1074#1099' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099
          OnClick = N44Click
        end
        object Z2: TMenuItem
          Caption = 'Z-'#1084#1072#1090#1088#1080#1094#1072
          OnClick = Z2Click
        end
        object XYZ1: TMenuItem
          Caption = 'XYZ-'#1092#1072#1081#1083
          OnClick = XYZ1Click
        end
      end
      object N12: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N13: TMenuItem
      Caption = #1055#1072#1085#1077#1083#1080
      object N3D2: TMenuItem
        Caption = '3D '#1084#1086#1076#1077#1083#1100
        OnClick = N3D2Click
      end
      object N14: TMenuItem
        Caption = #1052#1086#1076#1077#1083#1100
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088
      end
      object N16: TMenuItem
        Caption = #1048#1085#1076#1080#1082#1072#1090#1086#1088#1099
      end
    end
    object N4: TMenuItem
      Caption = #1040#1085#1072#1083#1080#1079
      object N5: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099
        object N17: TMenuItem
          Caption = #1050#1088#1072#1090#1082#1080#1081
        end
        object N18: TMenuItem
          Caption = #1055#1086#1083#1085#1099#1081
        end
      end
      object N3D1: TMenuItem
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
        object N19: TMenuItem
          Caption = #1054#1073#1097#1080#1077
          OnClick = N19Click
        end
        object N23: TMenuItem
          Caption = #1047#1072#1088#1103#1076#1099
          OnClick = N23Click
        end
        object Opt1: TMenuItem
          Caption = 'Opt'
          OnClick = Opt1Click
        end
        object Freq1: TMenuItem
          Caption = 'Freq'
          OnClick = Freq1Click
        end
        object IRC1: TMenuItem
          Caption = 'IRC'
          OnClick = IRC1Click
        end
        object NMR1: TMenuItem
          Caption = 'NMR'
          OnClick = NMR1Click
        end
        object UVVis1: TMenuItem
          Caption = 'UV-Vis'
          OnClick = UVVis1Click
        end
        object Scan1: TMenuItem
          Caption = 'Scan'
          OnClick = Scan1Click
        end
        object ADMPBOMD1: TMenuItem
          Caption = 'Trajectory'
          OnClick = ADMPBOMD1Click
        end
      end
      object N20: TMenuItem
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
        OnClick = N20Click
      end
      object N21: TMenuItem
        Caption = #1054#1088#1073#1080#1090#1072#1083#1080
      end
      object N6: TMenuItem
        Caption = #1044#1083#1080#1085#1099' '#1089#1074#1103#1079#1077#1081
        OnClick = N6Click
      end
      object N22: TMenuItem
        Caption = #1055#1055#1069
      end
      object N24: TMenuItem
        Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1099' '#1088#1077#1072#1082#1094#1080#1081
        OnClick = N24Click
      end
      object N9: TMenuItem
        Caption = #1058#1077#1088#1084#1086#1093#1080#1084#1080#1103
        OnClick = N9Click
      end
      object N46: TMenuItem
        Caption = 'Vib-Rot'
        OnClick = N46Click
      end
    end
    object N25: TMenuItem
      Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088
      object N26: TMenuItem
        Caption = #1058#1088#1072#1085#1089#1083#1103#1090#1086#1088
        OnClick = N26Click
      end
      object Z1: TMenuItem
        Caption = 'Z-'#1082#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088
      end
    end
    object N27: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N28: TMenuItem
        Caption = #1057#1080#1089#1090#1077#1084#1072
      end
      object N29: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1086#1076#1077#1083#1080
      end
      object ZXYZ1: TMenuItem
        Caption = 'Z<->XYZ '#1082#1086#1085#1074#1077#1088#1090#1077#1088
      end
      object N39: TMenuItem
        Caption = #1071#1079#1099#1082
        object N40: TMenuItem
          Caption = #1056#1091#1089#1089#1082#1080#1081
        end
        object N41: TMenuItem
          Caption = #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081
        end
      end
      object N42: TMenuItem
        Caption = #1041#1080#1073#1083#1080#1086#1090#1077#1082#1080
      end
    end
    object N30: TMenuItem
      Caption = #1057#1094#1077#1085#1072#1088#1080#1080
      object N32: TMenuItem
        Caption = 'GJF / COM'
      end
      object N31: TMenuItem
        Caption = #1047#1072#1087#1091#1089#1082
      end
      object N33: TMenuItem
        Caption = #1044#1080#1085#1072#1084#1080#1082#1072
      end
      object N45: TMenuItem
        Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103
      end
    end
    object N34: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N35: TMenuItem
        Caption = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086
        ShortCut = 112
        OnClick = N35Click
      end
      object N36: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = N36Click
      end
      object N37: TMenuItem
        Caption = #1051#1080#1094#1077#1085#1079#1080#1103
      end
      object N38: TMenuItem
        Caption = #1057#1086#1074#1077#1090' '#1076#1085#1103
      end
      object Web1: TMenuItem
        Caption = 'Pandora on Web'
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Gaussian Job Files (*.gjf,*.com)|*.gjf; *.com|Gaussian Output Fi' +
      'les (*.out,*.log)|*.out; *.log|Coordinat Files (*.xyz), GLOBUS F' +
      'iles (*.gpt, *.opt)|*.xyz; *.gpt; *.opt'
    Left = 808
    Top = 8
  end
  object XPManifest1: TXPManifest
    Left = 808
    Top = 40
  end
  object OpenDialog2: TOpenDialog
    Filter = 'Gaussian Output Files (*.out, *.log)|*.out; *.log'
    Left = 808
    Top = 72
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Gaussian Job File (*.gjf)|*.gjf'
    Left = 808
    Top = 120
  end
  object SaveDialog2: TSaveDialog
    Filter = 'File XYZ (*.xyz)|*.xyz'
    Left = 808
    Top = 168
  end
end
