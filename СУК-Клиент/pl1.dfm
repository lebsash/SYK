object Form1: TForm1
  Left = 245
  Top = 115
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 466
  ClientWidth = 862
  Color = clNone
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 376
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    Visible = False
  end
  object Memo2: TMemo
    Left = 216
    Top = 376
    Width = 425
    Height = 89
    Lines.Strings = (
      'Memo2')
    TabOrder = 1
    Visible = False
  end
  object IBDatabase2: TIBDatabase
    DatabaseName = '127.0.0.1:D:\work\Soft Develop\'#1057#1059#1050'-'#1050#1083#1080#1077#1085#1090'\client.fdb'
    Params.Strings = (
      'user_name=SYSDBA')
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 80
    Top = 136
  end
  object IBTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 112
    Top = 136
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FRAME_PLAYER')
    Left = 80
    Top = 176
    object IBQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'FRAME_PLAYER.ID'
    end
    object IBQuery1ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'FRAME_PLAYER.ID_PLAYER'
    end
    object IBQuery1NAME_FRAME: TIBStringField
      FieldName = 'NAME_FRAME'
      Origin = 'FRAME_PLAYER.NAME_FRAME'
      Size = 30
    end
    object IBQuery1POS_TOP_X: TIntegerField
      FieldName = 'POS_TOP_X'
      Origin = 'FRAME_PLAYER.POS_TOP_X'
    end
    object IBQuery1POS_TOP_Y: TIntegerField
      FieldName = 'POS_TOP_Y'
      Origin = 'FRAME_PLAYER.POS_TOP_Y'
    end
    object IBQuery1POS_BOT_X: TIntegerField
      FieldName = 'POS_BOT_X'
      Origin = 'FRAME_PLAYER.POS_BOT_X'
    end
    object IBQuery1POS_BOT_Y: TIntegerField
      FieldName = 'POS_BOT_Y'
      Origin = 'FRAME_PLAYER.POS_BOT_Y'
    end
    object IBQuery1OPISANIE: TIBStringField
      FieldName = 'OPISANIE'
      Origin = 'FRAME_PLAYER.OPISANIE'
      Size = 100
    end
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PLAYLIST where ID_FRAME=:ID_FRAME')
    Left = 112
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_FRAME'
        ParamType = ptUnknown
      end>
    object IBQuery2ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYLIST.ID'
    end
    object IBQuery2ID_FRAME: TIntegerField
      FieldName = 'ID_FRAME'
      Origin = 'PLAYLIST.ID_FRAME'
    end
    object IBQuery2NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYLIST.NAME_FILE'
      Size = 50
    end
    object IBQuery2NUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'PLAYLIST.NUM'
    end
    object IBQuery2VOL: TIntegerField
      FieldName = 'VOL'
      Origin = 'PLAYLIST.VOL'
    end
    object IBQuery2DATE1: TDateTimeField
      FieldName = 'DATE1'
      Origin = 'PLAYLIST.DATE1'
    end
    object IBQuery2TP: TIBStringField
      FieldName = 'TP'
      Origin = 'PLAYLIST.TP'
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 40
    Top = 24
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from PLAYLIST where ID_FRAME=:ID_FRAME and NAME_FILE=:N' +
        'AME_FILE')
    Left = 144
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_FRAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NAME_FILE'
        ParamType = ptUnknown
      end>
    object IBQuery3ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYLIST.ID'
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
    object IBQuery3NUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'PLAYLIST.NUM'
    end
    object IBQuery3VOL: TIntegerField
      FieldName = 'VOL'
      Origin = 'PLAYLIST.VOL'
    end
    object IBQuery3DATE1: TDateTimeField
      FieldName = 'DATE1'
      Origin = 'PLAYLIST.DATE1'
    end
    object IBQuery3TP: TIBStringField
      FieldName = 'TP'
      Origin = 'PLAYLIST.TP'
    end
  end
  object IBQuery4: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FRAME_PLAYER where NAME_FRAME=:NAME_FRAME')
    Left = 176
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NAME_FRAME'
        ParamType = ptUnknown
      end>
    object IBQuery4ID: TIntegerField
      FieldName = 'ID'
      Origin = 'FRAME_PLAYER.ID'
    end
    object IBQuery4ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'FRAME_PLAYER.ID_PLAYER'
    end
    object IBQuery4NAME_FRAME: TIBStringField
      FieldName = 'NAME_FRAME'
      Origin = 'FRAME_PLAYER.NAME_FRAME'
      Size = 30
    end
    object IBQuery4POS_TOP_X: TIntegerField
      FieldName = 'POS_TOP_X'
      Origin = 'FRAME_PLAYER.POS_TOP_X'
    end
    object IBQuery4POS_TOP_Y: TIntegerField
      FieldName = 'POS_TOP_Y'
      Origin = 'FRAME_PLAYER.POS_TOP_Y'
    end
    object IBQuery4POS_BOT_X: TIntegerField
      FieldName = 'POS_BOT_X'
      Origin = 'FRAME_PLAYER.POS_BOT_X'
    end
    object IBQuery4POS_BOT_Y: TIntegerField
      FieldName = 'POS_BOT_Y'
      Origin = 'FRAME_PLAYER.POS_BOT_Y'
    end
    object IBQuery4OPISANIE: TIBStringField
      FieldName = 'OPISANIE'
      Origin = 'FRAME_PLAYER.OPISANIE'
      Size = 100
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 392
    Top = 32
  end
  object Timer2: TTimer
    Interval = 5
    OnTimer = Timer2Timer
    Left = 168
    Top = 24
  end
end
