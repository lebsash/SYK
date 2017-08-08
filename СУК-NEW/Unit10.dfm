object Form10: TForm10
  Left = 317
  Top = 127
  Width = 741
  Height = 552
  Caption = 'Form10'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 456
    Width = 129
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
      333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
      C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
      F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
      F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
      00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
      3333333373FF7333333333333000333333333333377733333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 136
    Top = 456
    Width = 137
    Height = 33
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 576
    Top = 456
    Width = 137
    Height = 33
    Caption = #1056#1072#1089#1095#1077#1090' '#1088#1072#1079#1084#1077#1088#1072
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
      0333337F777777737F333308888888880333337F333333337F33330888888888
      03333373FFFFFFFF733333700000000073333337777777773333}
    NumGlyphs = 2
    OnClick = SpeedButton3Click
  end
  object Label3: TLabel
    Left = 336
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 705
    Height = 417
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PLAYER_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAYER_NAME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FILE_TO_UPDATE'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PATH_FILE_GET'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FILE_STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FILE_DOWNLOAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FILE_VERSION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_DOWNLOAD'
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 499
    Width = 733
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 72
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID')
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PLAYER_ID'
        ParamType = ptUnknown
      end>
    object IBQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'ZAD_PO_PLEER.ID'
      Visible = False
    end
    object IBQuery1PLAYER_ID: TIntegerField
      FieldName = 'PLAYER_ID'
      Origin = 'ZAD_PO_PLEER.PLAYER_ID'
    end
    object IBQuery1PLAYER_NAME: TIBStringField
      DisplayWidth = 25
      FieldName = 'PLAYER_NAME'
      Origin = 'ZAD_PO_PLEER.PLAYER_NAME'
      Visible = False
      Size = 45
    end
    object IBQuery1FILE_TO_UPDATE: TIBStringField
      DisplayLabel = #1048#1084#1103' '#1092#1072#1081#1083#1072
      FieldName = 'FILE_TO_UPDATE'
      Origin = 'ZAD_PO_PLEER.FILE_TO_UPDATE'
      Size = 100
    end
    object IBQuery1PATH_FILE_GET: TIBStringField
      DisplayLabel = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091
      FieldName = 'PATH_FILE_GET'
      Origin = 'ZAD_PO_PLEER.PATH_FILE_GET'
      Size = 200
    end
    object IBQuery1FILE_STATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1085#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
      FieldName = 'FILE_STATUS'
      Origin = 'ZAD_PO_PLEER.FILE_STATUS'
    end
    object IBQuery1FILE_DOWNLOAD: TIntegerField
      DisplayLabel = #1056#1072#1079#1084#1077#1088' '#1092#1072#1081#1083#1072
      FieldName = 'FILE_DOWNLOAD'
      Origin = 'ZAD_PO_PLEER.FILE_DOWNLOAD'
    end
    object IBQuery1FILE_VERSION: TIBStringField
      DisplayLabel = #1042#1077#1088#1089#1080#1103' '#1092#1072#1081#1083#1072
      FieldName = 'FILE_VERSION'
      Origin = 'ZAD_PO_PLEER.FILE_VERSION'
      Size = 45
    end
    object IBQuery1DATE_DOWNLOAD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
      FieldName = 'DATE_DOWNLOAD'
      Origin = 'ZAD_PO_PLEER.DATE_DOWNLOAD'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 136
    Top = 8
  end
  object IBQuery2: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into ZAD_PO_PLEER  (FILE_DOWNLOAD, FILE_STATUS, FILE_TO_U' +
        'PDATE, FILE_VERSION, PATH_FILE_GET, PLAYER_ID, PLAYER_NAME) VALU' +
        'ES (0,0,:FILE_NAME,:FILE_VERSION,:PATH_FILE,:PLAYER_ID,:PLAYER_N' +
        'AME)')
    Left = 184
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FILE_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FILE_VERSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PATH_FILE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLAYER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLAYER_NAME'
        ParamType = ptUnknown
      end>
  end
  object IBQuery3: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from ZAD_PO_PLEER'
      'where'
      '  ID = :OLD_ID and'
      '  PLAYER_ID = :PLAYER_ID and'
      '  FILE_TO_UPDATE = :FILE_TO_UPDATE')
    Left = 440
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OLD_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLAYER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FILE_TO_UPDATE'
        ParamType = ptUnknown
      end>
  end
  object IBQuery4: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID')
    Left = 568
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PLAYER_ID'
        ParamType = ptUnknown
      end>
    object IBQuery4ID: TIntegerField
      FieldName = 'ID'
      Origin = 'ZAD_PO_PLEER.ID'
    end
    object IBQuery4PLAYER_ID: TIntegerField
      FieldName = 'PLAYER_ID'
      Origin = 'ZAD_PO_PLEER.PLAYER_ID'
    end
    object IBQuery4PLAYER_NAME: TIBStringField
      FieldName = 'PLAYER_NAME'
      Origin = 'ZAD_PO_PLEER.PLAYER_NAME'
      Size = 45
    end
    object IBQuery4FILE_TO_UPDATE: TIBStringField
      FieldName = 'FILE_TO_UPDATE'
      Origin = 'ZAD_PO_PLEER.FILE_TO_UPDATE'
      Size = 100
    end
    object IBQuery4PATH_FILE_GET: TIBStringField
      FieldName = 'PATH_FILE_GET'
      Origin = 'ZAD_PO_PLEER.PATH_FILE_GET'
      Size = 200
    end
    object IBQuery4FILE_STATUS: TIntegerField
      FieldName = 'FILE_STATUS'
      Origin = 'ZAD_PO_PLEER.FILE_STATUS'
    end
    object IBQuery4FILE_DOWNLOAD: TIntegerField
      FieldName = 'FILE_DOWNLOAD'
      Origin = 'ZAD_PO_PLEER.FILE_DOWNLOAD'
    end
    object IBQuery4FILE_VERSION: TIBStringField
      FieldName = 'FILE_VERSION'
      Origin = 'ZAD_PO_PLEER.FILE_VERSION'
      Size = 45
    end
    object IBQuery4DATE_DOWNLOAD: TDateTimeField
      FieldName = 'DATE_DOWNLOAD'
      Origin = 'ZAD_PO_PLEER.DATE_DOWNLOAD'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 8
    object N1: TMenuItem
      Bitmap.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
      OnClick = SpeedButton1Click
    end
    object N2: TMenuItem
      Bitmap.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083
      OnClick = SpeedButton2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1088#1072#1079#1084#1077#1088#1072
      OnClick = SpeedButton3Click
    end
  end
end
