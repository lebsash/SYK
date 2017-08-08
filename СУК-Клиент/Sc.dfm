object Form1: TForm1
  Left = 258
  Top = 160
  Width = 810
  Height = 448
  Caption = #1057#1059#1050' - '#1050#1051#1048#1045#1053#1058'-'#1058#1045#1057#1058'1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMinimized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label17: TLabel
    Left = 456
    Top = 24
    Width = 80
    Height = 13
    Caption = #1057#1090#1088#1086#1082#1072' '#1087#1088#1080#1077#1084#1072':'
  end
  object Label18: TLabel
    Left = 592
    Top = 24
    Width = 89
    Height = 13
    Caption = #1057#1090#1088#1086#1082#1072' '#1087#1077#1088#1077#1076#1072#1095#1080':'
  end
  object Button3: TButton
    Left = 608
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Connected'
    TabOrder = 0
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 608
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Disconnected'
    TabOrder = 1
    Visible = False
    OnClick = Button4Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 395
    Width = 802
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 449
    Height = 393
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1097#1077#1077
      PopupMenu = PopupMenu2
      object Label7: TLabel
        Left = 384
        Top = 0
        Width = 3
        Height = 13
      end
      object GreenIMG: TImage
        Left = 424
        Top = 197
        Width = 9
        Height = 15
        Picture.Data = {
          07544269746D6170EE000000424DEE0000000000000076000000280000000900
          00000F0000000100040000000000780000000000000000000000100000001000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF003A00000A3000000007A000A700000000070AAA07000000000A0AAA0A0000
          0000070AAA070000000007A000A7000000000A07770A000000000707B7070000
          0000070777070000000007700077000000000707770700000000070797070000
          0000070777070000000007700077000000003000000030000000}
      end
      object RedIMG: TImage
        Left = 424
        Top = 197
        Width = 9
        Height = 15
        Picture.Data = {
          07544269746D6170EE000000424DEE0000000000000076000000280000000900
          00000F0000000100040000000000780000000000000000000000100000001000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF003000000030000000077000770000000007077707000000000707A7070000
          00000707770700000000077000770000000007077707000000000707B7070000
          0000090777090000000007900097000000000709990700000000090999090000
          0000070999070000000007900097000000003900000930000000}
      end
      object SpeedButton4: TSpeedButton
        Left = 0
        Top = 192
        Width = 145
        Height = 33
        Hint = 
          #1056#1091#1095#1085#1086#1081' '#1088#1077#1078#1080#1084' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1087#1083#1077#1081#1083#1080#1089#1090#1072' '#1080' '#1092#1088#1077#1081#1084#1086#1074'. '#1044#1083#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1092#1072#1081#1083 +
          #1099' PLL '#1080' FRM '#1076#1086#1083#1078#1085#1099' '#1085#1072#1093#1086#1076#1080#1090#1100#1089#1103' '#1074' '#1087#1072#1087#1082#1077' '#1083#1086#1082#1072#1083#1100#1085#1086#1075#1086' '#1082#1086#1085#1090#1077#1085#1090#1072' '#1087#1083#1077#1077#1088#1072
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100#1089#1103' '#1074#1088#1091#1095#1085#1091#1102
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337FF3333333333330003333333333333777F333333333333080333
          3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
          33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
          B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
          BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
          B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
          3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
          333333333337F33333333333333B333333333333333733333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Left = 144
        Top = 192
        Width = 153
        Height = 33
        Hint = #1057#1086#1077#1076#1080#1085#1103#1077#1090#1089#1103' '#1089' '#1089#1077#1088#1074#1077#1088#1086#1084' '#1080' '#1086#1073#1084#1077#1085#1080#1074#1072#1077#1090#1089#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1077#1081
        Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1089#1077#1072#1085#1089' '#1089#1074#1103#1079#1080
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003B3000000000
          003B37F77777777777F73BB09111111110BB3777F3F3F3F3F777311098080808
          10B33777F7373737377313309999999910337F373F3F3F3F3733133309808089
          03337F3373737373733313333099999033337FFFF7FFFFF7FFFFB011B0000000
          BBBB7777777777777777B01110BBBBB0BBBB77F37777777777773011108BB333
          333337F337377F3FFFF33099111BB3010033373F33777F77773F331999100101
          11033373FFF77773337F33300099991999033337773FFFF33373333BB7100199
          113333377377773FF7F333BB333BB7011B33337733377F7777FF3BB3333BB333
          3BB3377333377F33377FBB33333BB33333BB7733333773333377}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton5Click
      end
      object SpeedButton6: TSpeedButton
        Left = 296
        Top = 192
        Width = 121
        Height = 33
        Hint = #1055#1088#1080#1085#1091#1076#1080#1090#1077#1083#1100#1085#1086' '#1089#1090#1072#1088#1090#1086#1074#1072#1090#1100' '#1087#1083#1077#1077#1088
        Caption = #1057#1090#1072#1088#1090' '#1087#1083#1077#1077#1088#1072
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          033333FFFF77777773F330000077777770333777773FFFFFF733077777000000
          03337F3F3F777777733F0797A770003333007F737337773F3377077777778803
          30807F333333337FF73707888887880007707F3FFFF333777F37070000878807
          07807F777733337F7F3707888887880808807F333333337F7F37077777778800
          08807F333FFF337773F7088800088803308073FF777FFF733737300008000033
          33003777737777333377333080333333333333F7373333333333300803333333
          33333773733333333333088033333333333373F7F33333333333308033333333
          3333373733333333333333033333333333333373333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton6Click
      end
      object Label12: TLabel
        Left = 64
        Top = 232
        Width = 54
        Height = 13
        Caption = #1047#1072#1082#1072#1095#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 121
        Top = 232
        Width = 38
        Height = 13
        Caption = 'Label13'
      end
      object Label14: TLabel
        Left = 8
        Top = 344
        Width = 38
        Height = 13
        Caption = 'Label14'
      end
      object Label15: TLabel
        Left = 8
        Top = 328
        Width = 38
        Height = 13
        Caption = 'Label15'
      end
      object Label16: TLabel
        Left = 344
        Top = 248
        Width = 38
        Height = 13
        Caption = 'Label16'
      end
      object Label19: TLabel
        Left = 248
        Top = 232
        Width = 91
        Height = 13
        Caption = #1056#1072#1079#1084#1077#1088' '#1092#1072#1081#1083#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 344
        Top = 232
        Width = 38
        Height = 13
        Caption = 'Label20'
      end
      object Label22: TLabel
        Left = 256
        Top = 248
        Width = 82
        Height = 13
        Caption = #1059#1078#1077' '#1089#1082#1072#1095#1072#1083#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LogMemo: TMemo
        Left = 0
        Top = 16
        Width = 433
        Height = 177
        ScrollBars = ssVertical
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
      object Edit7: TEdit
        Left = 208
        Top = 280
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'Edit7'
        Visible = False
      end
      object Edit8: TEdit
        Left = 208
        Top = 304
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'Edit8'
        Visible = False
      end
      object Button6: TButton
        Left = 344
        Top = 280
        Width = 75
        Height = 25
        Caption = 'Button6'
        TabOrder = 3
        Visible = False
        OnClick = Button6Click
      end
      object Button1: TButton
        Left = 96
        Top = 288
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 4
        Visible = False
        OnClick = Button1Click
      end
      object ProgressBar1: TProgressBar
        Left = 64
        Top = 264
        Width = 361
        Height = 17
        Step = 1
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
      ImageIndex = 1
      object SpeedButton3: TSpeedButton
        Left = 0
        Top = 248
        Width = 129
        Height = 22
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton3Click
      end
      object Panel1: TPanel
        Left = 0
        Top = 8
        Width = 321
        Height = 121
        BorderStyle = bsSingle
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 8
          Width = 52
          Height = 13
          Caption = 'IP - '#1072#1076#1088#1077#1089':'
        end
        object Label2: TLabel
          Left = 22
          Top = 35
          Width = 53
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
        end
        object Label3: TLabel
          Left = 8
          Top = 69
          Width = 66
          Height = 13
          Caption = #1058#1080#1087' '#1082#1083#1080#1077#1085#1090#1072':'
        end
        object Label6: TLabel
          Left = 224
          Top = 8
          Width = 26
          Height = 13
          Caption = #1087#1086#1088#1090':'
        end
        object Edit2: TEdit
          Left = 80
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'Edit2'
        end
        object ComboBox1: TComboBox
          Left = 80
          Top = 64
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          Text = #1055#1083#1077#1077#1088
          Items.Strings = (
            #1055#1083#1077#1077#1088
            #1055#1088#1086#1095#1077#1077)
        end
        object Edit4: TEdit
          Left = 80
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'Edit4'
        end
        object Edit6: TEdit
          Left = 254
          Top = 6
          Width = 41
          Height = 21
          TabOrder = 1
          Text = 'Edit6'
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 136
        Width = 321
        Height = 113
        BorderStyle = bsSingle
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 16
          Width = 111
          Height = 13
          Caption = #1063#1072#1089#1090#1086#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103': '
        end
        object Label5: TLabel
          Left = 8
          Top = 48
          Width = 146
          Height = 13
          Caption = #1055#1072#1087#1082#1072' '#1083#1086#1082#1072#1083#1100#1085#1086#1075#1086' '#1082#1086#1085#1090#1077#1085#1090#1072':'
        end
        object SpeedButton1: TSpeedButton
          Left = 288
          Top = 64
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
            55555575555555775F55509999999901055557F55555557F75F5001111111101
            105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
            01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
            8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
            0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
            0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
            05555555575FF777755555555500055555555555557775555555}
          NumGlyphs = 2
          OnClick = SpeedButton1Click
        end
        object ComboBox2: TComboBox
          Left = 194
          Top = 12
          Width = 89
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = #1052#1080#1085#1091#1090
          Items.Strings = (
            #1052#1080#1085#1091#1090
            #1057#1077#1082#1091#1085#1076
            #1063#1072#1089#1086#1074)
        end
        object Edit3: TEdit
          Left = 8
          Top = 64
          Width = 281
          Height = 21
          TabOrder = 2
          Text = 'Edit3'
        end
        object Edit5: TEdit
          Left = 120
          Top = 12
          Width = 73
          Height = 21
          TabOrder = 0
          Text = 'Edit5'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1074#1088#1077#1084#1077#1085#1080
      ImageIndex = 2
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 256
        Width = 89
        Height = 22
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton2Click
      end
      object Image1: TImage
        Left = 432
        Top = 364
        Width = 9
        Height = 15
        Picture.Data = {
          07544269746D6170EE000000424DEE0000000000000076000000280000000900
          00000F0000000100040000000000780000000000000000000000100000001000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF003A00000A3000000007A000A700000000070AAA07000000000A0AAA0A0000
          0000070AAA070000000007A000A7000000000A07770A000000000707B7070000
          0000070777070000000007700077000000000707770700000000070797070000
          0000070777070000000007700077000000003000000030000000}
      end
      object Image2: TImage
        Left = 432
        Top = 366
        Width = 9
        Height = 15
        Picture.Data = {
          07544269746D6170EE000000424DEE0000000000000076000000280000000900
          00000F0000000100040000000000780000000000000000000000100000001000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF003000000030000000077000770000000007077707000000000707A7070000
          00000707770700000000077000770000000007077707000000000707B7070000
          0000090777090000000007900097000000000709990700000000090999090000
          0000070999070000000007900097000000003900000930000000}
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 377
        Height = 113
        Caption = #1042#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099' '#1087#1083#1077#1077#1088#1072' '
        TabOrder = 0
        object Label8: TLabel
          Left = 24
          Top = 24
          Width = 69
          Height = 13
          Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080':'
        end
        object Label9: TLabel
          Left = 104
          Top = 24
          Width = 32
          Height = 13
          Caption = 'Label9'
        end
        object Label10: TLabel
          Left = 29
          Top = 48
          Width = 35
          Height = 13
          Caption = #1057#1090#1072#1088#1090': '
        end
        object Label11: TLabel
          Left = 20
          Top = 76
          Width = 43
          Height = 13
          Caption = #1060#1080#1085#1080#1096': '
        end
        object CheckListBox1: TCheckListBox
          Left = 248
          Top = 8
          Width = 121
          Height = 97
          ItemHeight = 13
          Items.Strings = (
            #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
            #1042#1090#1086#1088#1085#1080#1082
            #1057#1088#1077#1076#1072
            #1063#1077#1090#1074#1077#1088#1075
            #1055#1103#1090#1085#1080#1094#1072
            #1057#1091#1073#1073#1086#1090#1072
            #1042#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077)
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnClick = CheckListBox1Click
        end
        object DateTimePicker1: TDateTimePicker
          Left = 64
          Top = 44
          Width = 73
          Height = 21
          Date = 39741.375208333330000000
          Time = 39741.375208333330000000
          Kind = dtkTime
          TabOrder = 1
          OnChange = DateTimePicker1Change
        end
        object DateTimePicker2: TDateTimePicker
          Left = 64
          Top = 72
          Width = 73
          Height = 21
          Date = 39741.917337962960000000
          Time = 39741.917337962960000000
          Kind = dtkTime
          TabOrder = 2
          OnChange = DateTimePicker2Change
        end
      end
      object Memo2: TMemo
        Left = 0
        Top = 152
        Width = 185
        Height = 89
        Lines.Strings = (
          'Memo2')
        TabOrder = 1
      end
      object Memo3: TMemo
        Left = 192
        Top = 152
        Width = 185
        Height = 89
        Lines.Strings = (
          'Memo3')
        TabOrder = 2
      end
    end
  end
  object ListBox1: TListBox
    Left = 456
    Top = 40
    Width = 129
    Height = 281
    ItemHeight = 13
    TabOrder = 4
  end
  object SendBox: TListBox
    Left = 592
    Top = 40
    Width = 201
    Height = 281
    ItemHeight = 13
    TabOrder = 5
  end
  object IdTCPClient1: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '127.0.0.1'
    Port = 2110
    Left = 480
    Top = 352
  end
  object WSocket1: TWSocket
    LineMode = True
    LineLimit = 65536
    LineEnd = #13#10
    LineEcho = False
    LineEdit = False
    Addr = '127.0.0.1'
    Port = '2104'
    Proto = 'tcp'
    LocalAddr = '0.0.0.0'
    LocalPort = '0'
    MultiThreaded = True
    MultiCast = False
    MultiCastIpTTL = 1
    FlushTimeout = 60
    SendFlags = wsSendNormal
    LingerOnOff = wsLingerOn
    LingerTimeout = 0
    KeepAliveOnOff = wsKeepAliveOff
    KeepAliveTime = 0
    KeepAliveInterval = 0
    SocksLevel = '5'
    SocksAuthentication = socksNoAuthentication
    LastError = 0
    ReuseAddr = False
    ComponentOptions = [wsoNoReceiveLoop, wsoTcpNoDelay]
    ListenBacklog = 5
    ReqVerLow = 1
    ReqVerHigh = 1
    OnDataAvailable = WSocket1DataAvailable
    OnSessionClosed = WSocket1SessionClosed
    OnSessionConnected = WSocket1SessionConnected
    OnError = WSocket1Error
    Left = 616
    Top = 376
  end
  object IdConnectionIntercept1: TIdConnectionIntercept
    Left = 512
    Top = 352
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 280
  end
  object PopupMenu1: TPopupMenu
    Left = 428
    Top = 272
    object N1: TMenuItem
      Caption = #1056#1072#1089#1087#1088#1086#1089#1090#1088#1072#1085#1080#1090#1100' '#1085#1072' '#1074#1089#1077' '#1076#1085#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1076#1085#1080
      OnClick = N2Click
    end
  end
  object Timer2: TTimer
    Interval = 500
    OnTimer = Timer2Timer
    Left = 416
  end
  object FtpClient1: TFtpClient
    Timeout = 1000
    MultiThreaded = False
    Port = 'ftp'
    DataPortRangeStart = 0
    DataPortRangeEnd = 0
    LocalAddr = '0.0.0.0'
    DisplayFileFlag = False
    Binary = False
    ShareMode = ftpShareExclusive
    Options = [ftpAcceptLF]
    ConnectionType = ftpDirect
    OnError = FtpClient1Error
    OnProgress = FtpClient1Progress
    OnSessionConnected = FtpClient1SessionConnected
    OnSessionClosed = FtpClient1SessionClosed
    OnRequestDone = FtpClient1RequestDone
    BandwidthLimit = 10000
    BandwidthSampling = 1000
    Left = 672
    Top = 376
  end
  object MPFtp: TMultipartFtpDownloader
    Passive = False
    Binary = False
    PartCount = 0
    TimeoutValue = 30000
    OnRequestDone = MPFtpRequestDone
    Left = 640
    Top = 376
  end
  object Timer3: TTimer
    Interval = 50
    OnTimer = Timer3Timer
    Left = 36
    Top = 280
  end
  object StartFBTimer: TTimer
    Enabled = False
    OnTimer = StartFBTimerTimer
    Left = 140
    Top = 360
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '127.0.0.1:D:\work\Soft Develop\'#1057#1059#1050'-'#1050#1083#1080#1077#1085#1090'\client.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    AfterConnect = IBDatabase1AfterConnect
    AfterDisconnect = IBDatabase1AfterDisconnect
    Left = 168
    Top = 360
  end
  object IBTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 196
    Top = 360
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ZADACHI_PLEER')
    Left = 236
    Top = 360
  end
  object PopupMenu2: TPopupMenu
    Left = 368
    Top = 328
    object N3: TMenuItem
      Caption = #1056#1091#1095#1085#1086#1081' '#1090#1077#1089#1090' '#1089#1080#1089#1090#1077#1084#1099
      object N4: TMenuItem
        Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100' '#1084#1086#1085#1080#1090#1086#1088#1099
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1056#1077#1089#1090#1072#1088#1090
        OnClick = N5Click
      end
    end
  end
  object CoolTrayIcon1: TCoolTrayIcon
    CycleInterval = 0
    Hint = #1057#1059#1050' - '#1050#1083#1080#1077#1085#1090
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000330000000000000000000000033303303303300000000000000
      0003303330333003003300000000000000033003330330002333000000000000
      0030000033003033333000000000000033333330000003330003330000000803
      33333333333333300233330000000F033333333333333302333BB03000004F83
      33333333333333333BB003BB00004FF3333333333333B33BB0033BBB00004FF3
      33333333B3BB3BB0033BBBB000004FF83B333B3B3B3BBBB03BBBBB0300F04FFF
      33B3B3B3BBBBBBBBBBBB00330FF04FFF8B3B3333BBBBBBBBBB0033330FF044FF
      F8BBB03033BBBBB330333330FFF444FFF8BB0BB3003B330003333330FF44444F
      F88B3BBB300000033333B33FFF44444FFF3BB0BBB3000333B33BB38FF4444444
      FF003B0BB333333BBBBBB3FFF44444444FF00030BBBBBBBBBBBBBBFF44444444
      0000000303BBB3300000BFF444444400000000000000000000000FF444440000
      0000000000000000000000444444000000000000000000000000000044440000
      0000000000000000000000000444000000000000000000000000000000040000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFF1FFFFF8003FFFC0000FFF800007FF800007FE000003F0000
      001F0000001F0000000F00000007000000070000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000C0
      00000FE01F003FFFFF80FFFFFFC0FFFFFFF0FFFFFFF8FFFFFFFEFFFFFFFF}
    IconVisible = True
    IconIndex = 0
    MinimizeToTray = True
    OnDblClick = CoolTrayIcon1DblClick
    OnStartup = CoolTrayIcon1Startup
    Left = 4
    Top = 248
  end
  object Timer4: TTimer
    Interval = 1
    OnTimer = Timer4Timer
    Left = 12
    Top = 320
  end
  object Timer5: TTimer
    Enabled = False
    OnTimer = Timer5Timer
    Left = 420
    Top = 40
  end
  object ResTimer1: TTimer
    Interval = 50
    OnTimer = ResTimer1Timer
    Left = 20
    Top = 40
  end
  object SendTimer: TTimer
    Interval = 50
    OnTimer = SendTimerTimer
    Left = 60
    Top = 40
  end
  object TimerSEE: TTimer
    Enabled = False
    Interval = 3600000
    OnTimer = TimerSEETimer
    Left = 116
    Top = 24
  end
end
