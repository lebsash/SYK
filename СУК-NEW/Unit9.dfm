object Form9: TForm9
  Left = 353
  Top = 152
  Width = 628
  Height = 567
  BorderIcons = [biSystemMenu]
  Caption = 'Form9'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 514
    Width = 620
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 617
    Height = 513
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1073#1086#1090#1072' FTP'
      object SpeedButton1: TSpeedButton
        Left = 417
        Top = 264
        Width = 184
        Height = 22
        Hint = #1053#1072#1078#1084#1080' '#1076#1083#1103' '#1086#1089#1090#1072#1085#1086#1074#1082#1080' FTP-'#1089#1077#1088#1074#1077#1088#1072
        Caption = 'Stop FTP-server'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333000003333333333F777773FF333333008877700
          33333337733FFF773F33330887000777033333733F777FFF73F3308800000007
          703337F37777777FF7F33080000000007033373777777777F73F087000111000
          77037F3777333777FF7F08000111110007037F777F3333777F7F0F0001111100
          07037F777F3333777F7F0F000811110008037F777FF33377737F0F7000881000
          780373F777FFF777F373308000000000803337F77777777737F330F800000008
          8033373F777777733733330F8700078803333373FF77733F733333300FFF8800
          3333333773FFFF77333333333000003333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 416
        Top = 263
        Width = 184
        Height = 23
        Hint = #1053#1072#1078#1084#1080' '#1076#1083#1103' '#1089#1090#1072#1088#1090#1072' FTP-'#1089#1077#1088#1074#1077#1088#1072
        Caption = 'Start FTP-server'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333000003333333333F777773FF333333008877700
          33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
          703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
          77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
          07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
          780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
          8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
          3333333773FFFF77333333333000003333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 8
        Width = 393
        Height = 473
        Caption = #1051#1054#1043' '#1089#1077#1088#1074#1077#1088#1072
        TabOrder = 0
        object InfoMemo: TMemo
          Left = 8
          Top = 16
          Width = 377
          Height = 449
          Lines.Strings = (
            '')
          PopupMenu = PopupMenu1
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 416
        Top = 8
        Width = 185
        Height = 249
        Caption = #1040#1082#1090#1080#1074#1085#1099#1077' '#1082#1083#1080#1077#1085#1090#1099': '
        TabOrder = 1
        object Memo1: TMemo
          Left = 6
          Top = 12
          Width = 169
          Height = 225
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' FTP'
      ImageIndex = 1
      object Label1: TLabel
        Left = 168
        Top = 24
        Width = 91
        Height = 13
        Caption = #1044#1086#1084#1072#1096#1085#1103#1103' '#1087#1072#1087#1082#1072':'
      end
      object Label2: TLabel
        Left = 232
        Top = 48
        Width = 28
        Height = 13
        Caption = #1055#1086#1088#1090':'
      end
      object Label3: TLabel
        Left = 215
        Top = 76
        Width = 46
        Height = 13
        Caption = 'IP '#1072#1076#1088#1077#1089':'
      end
      object Label4: TLabel
        Left = 220
        Top = 124
        Width = 41
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100':'
      end
      object Label5: TLabel
        Left = 225
        Top = 102
        Width = 34
        Height = 13
        Caption = #1051#1086#1075#1080#1085':'
      end
      object CheckBox1: TCheckBox
        Left = 0
        Top = 24
        Width = 145
        Height = 17
        Caption = 'ForceHomeDirectory'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 0
        Top = 40
        Width = 121
        Height = 17
        Caption = 'HidePhysicalPath'
        TabOrder = 1
        OnClick = CheckBox2Click
      end
      object Edit1: TEdit
        Left = 266
        Top = 20
        Width = 319
        Height = 21
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 266
        Top = 44
        Width = 319
        Height = 21
        TabOrder = 3
      end
      object CheckBox3: TCheckBox
        Left = 0
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Auto-Start'
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 267
        Top = 72
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object Edit4: TEdit
        Left = 267
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object Edit5: TEdit
        Left = 268
        Top = 120
        Width = 121
        Height = 21
        TabOrder = 7
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 116
    Top = 104
    object N1: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1083#1086#1075
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1083#1086#1075
      OnClick = N2Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'TXT|*.txt'
    Left = 148
    Top = 104
  end
end
