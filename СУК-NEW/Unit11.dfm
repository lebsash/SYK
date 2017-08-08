object Form11: TForm11
  Left = 204
  Top = 185
  Width = 901
  Height = 452
  Caption = 'SYK-Server '#1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1086' '#1087#1083#1077#1081#1083#1080#1089#1090#1091'...'
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
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 376
    Width = 889
    Height = 41
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
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
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 289
    Height = 369
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UIN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1048#1052#1071' '#1055#1051#1045#1045#1056#1040
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IP_ADR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OPISANIE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CLIENT_ACTIV'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CLIENT_TYPE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_CONNECT'
        Visible = False
      end>
  end
  object DBGrid2: TDBGrid
    Left = 296
    Top = 0
    Width = 177
    Height = 369
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_PLAYER'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME_FRAME'
        Title.Caption = #1048#1052#1071' '#1060#1056#1045#1049#1052#1040
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POS_TOP_X'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'POS_TOP_Y'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'POS_BOT_X'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'POS_BOT_Y'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OPISANIE'
        Visible = False
      end>
  end
  object DBGrid3: TDBGrid
    Left = 480
    Top = 0
    Width = 409
    Height = 369
    DataSource = DataSource3
    TabOrder = 2
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
        FieldName = 'ID_PLAYER'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_FRAME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME_FILE'
        Title.Caption = #1048#1052#1071' '#1060#1040#1049#1051#1040
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PATH'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LOC'
        Title.Caption = #1051#1086#1082#1072#1083#1100#1085#1086#1089#1090#1100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEND'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUM'
        Title.Caption = #1055#1086#1079#1080#1094#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOL'
        Visible = True
      end>
  end
  object IBQuery1: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from NAME_CONNECTION where CLIENT_TYPE=:CLIENT_TYPE')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CLIENT_TYPE'
        ParamType = ptUnknown
      end>
    object IBQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'NAME_CONNECTION.ID'
      Required = True
    end
    object IBQuery1UIN: TIntegerField
      FieldName = 'UIN'
      Origin = 'NAME_CONNECTION.UIN'
    end
    object IBQuery1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'NAME_CONNECTION.NAME'
      Size = 45
    end
    object IBQuery1IP_ADR: TIBStringField
      FieldName = 'IP_ADR'
      Origin = 'NAME_CONNECTION.IP_ADR'
      Size = 15
    end
    object IBQuery1OPISANIE: TIBStringField
      FieldName = 'OPISANIE'
      Origin = 'NAME_CONNECTION.OPISANIE'
      Size = 60
    end
    object IBQuery1CLIENT_ACTIV: TIntegerField
      FieldName = 'CLIENT_ACTIV'
      Origin = 'NAME_CONNECTION.CLIENT_ACTIV'
    end
    object IBQuery1CLIENT_TYPE: TIBStringField
      FieldName = 'CLIENT_TYPE'
      Origin = 'NAME_CONNECTION.CLIENT_TYPE'
    end
    object IBQuery1DATE_CONNECT: TDateTimeField
      FieldName = 'DATE_CONNECT'
      Origin = 'NAME_CONNECTION.DATE_CONNECT'
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 48
    Top = 8
  end
  object IBQuery2: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FRAME_PLAYER where ID_PLAYER=:ID_PLAYER')
    Left = 312
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
    object IBQuery2ID: TIntegerField
      FieldName = 'ID'
      Origin = 'FRAME_PLAYER.ID'
    end
    object IBQuery2ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'FRAME_PLAYER.ID_PLAYER'
    end
    object IBQuery2NAME_FRAME: TIBStringField
      FieldName = 'NAME_FRAME'
      Origin = 'FRAME_PLAYER.NAME_FRAME'
      Size = 30
    end
    object IBQuery2POS_TOP_X: TIntegerField
      FieldName = 'POS_TOP_X'
      Origin = 'FRAME_PLAYER.POS_TOP_X'
    end
    object IBQuery2POS_TOP_Y: TIntegerField
      FieldName = 'POS_TOP_Y'
      Origin = 'FRAME_PLAYER.POS_TOP_Y'
    end
    object IBQuery2POS_BOT_X: TIntegerField
      FieldName = 'POS_BOT_X'
      Origin = 'FRAME_PLAYER.POS_BOT_X'
    end
    object IBQuery2POS_BOT_Y: TIntegerField
      FieldName = 'POS_BOT_Y'
      Origin = 'FRAME_PLAYER.POS_BOT_Y'
    end
    object IBQuery2OPISANIE: TIBStringField
      FieldName = 'OPISANIE'
      Origin = 'FRAME_PLAYER.OPISANIE'
      Size = 100
    end
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 344
    Top = 16
  end
  object DataSource3: TDataSource
    DataSet = IBQuery3
    Left = 584
    Top = 8
  end
  object IBQuery3: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from PLAYLIST where ID_PLAYER=:ID_PLAYER and ID_FRAME=:' +
        'ID_FRAME order by NUM')
    Left = 552
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FRAME'
        ParamType = ptUnknown
      end>
    object IBQuery3ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYLIST.ID'
    end
    object IBQuery3ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYLIST.ID_PLAYER'
    end
    object IBQuery3ID_FRAME: TIntegerField
      FieldName = 'ID_FRAME'
      Origin = 'PLAYLIST.ID_FRAME'
    end
    object IBQuery3NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYLIST.NAME_FILE'
      Size = 50
    end
    object IBQuery3PATH: TIBStringField
      FieldName = 'PATH'
      Origin = 'PLAYLIST.PATH'
      Size = 250
    end
    object IBQuery3LOC: TIntegerField
      FieldName = 'LOC'
      Origin = 'PLAYLIST.LOC'
    end
    object IBQuery3SEND: TIntegerField
      FieldName = 'SEND'
      Origin = 'PLAYLIST.SEND'
    end
    object IBQuery3NUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'PLAYLIST.NUM'
    end
    object IBQuery3VOL: TIntegerField
      FieldName = 'VOL'
      Origin = 'PLAYLIST.VOL'
    end
  end
  object IBQuery4: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'delete from PLAYLIST  where ID_PLAYER = :ID_PLAYER and ID_FRAME=' +
        ':ID_FRAME')
    Left = 232
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FRAME'
        ParamType = ptUnknown
      end>
  end
end
