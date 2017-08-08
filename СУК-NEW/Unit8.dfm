object Form8: TForm8
  Left = 349
  Top = 186
  Width = 738
  Height = 429
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Form8'
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
    Left = 0
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object Label2: TLabel
    Left = 40
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 730
    Height = 376
    Align = alClient
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 376
    Width = 730
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object IBQuery1: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER')
    Left = 120
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
    object IBQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYER_ZAD.ID'
      Visible = False
    end
    object IBQuery1ID_PLAYER: TSmallintField
      DisplayLabel = #1048#1084#1103' '#1092#1072#1081#1083#1072
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYER_ZAD.ID_PLAYER'
      Visible = False
    end
    object IBQuery1NAME_FILE: TIBStringField
      DisplayLabel = #1048#1084#1103' '#1092#1072#1081#1083#1072
      DisplayWidth = 45
      FieldName = 'NAME_FILE'
      Origin = 'PLAYER_ZAD.NAME_FILE'
      Size = 100
    end
    object IBQuery1SIZE_FILE: TIntegerField
      DisplayLabel = #1056#1072#1079#1084#1077#1088' '#1092#1072#1081#1083#1072
      FieldName = 'SIZE_FILE'
      Origin = 'PLAYER_ZAD.SIZE_FILE'
    end
    object IBQuery1DOWNLOADED: TIntegerField
      FieldName = 'DOWNLOADED'
      Origin = 'PLAYER_ZAD.DOWNLOADED'
      Visible = False
    end
    object IBQuery1DATE_TO_UPD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_TO_UPD'
      Origin = 'PLAYER_ZAD.DATE_TO_UPD'
    end
    object IBQuery1PATH_FILE: TIBStringField
      DisplayLabel = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091
      DisplayWidth = 100
      FieldName = 'PATH_FILE'
      Origin = 'PLAYER_ZAD.PATH_FILE'
      Size = 250
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 152
    Top = 360
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 360
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1083#1077#1081#1083#1080#1089#1090
      OnClick = N1Click
    end
  end
  object IBQuery2: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER')
    Left = 304
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
  end
  object IBQuery3: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER')
    Left = 400
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
    object IBQuery3ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYER_ZAD.ID'
    end
    object IBQuery3ID_PLAYER: TSmallintField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYER_ZAD.ID_PLAYER'
    end
    object IBQuery3NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYER_ZAD.NAME_FILE'
      Size = 100
    end
    object IBQuery3SIZE_FILE: TIntegerField
      FieldName = 'SIZE_FILE'
      Origin = 'PLAYER_ZAD.SIZE_FILE'
    end
    object IBQuery3DOWNLOADED: TIntegerField
      FieldName = 'DOWNLOADED'
      Origin = 'PLAYER_ZAD.DOWNLOADED'
    end
    object IBQuery3DATE_TO_UPD: TDateTimeField
      FieldName = 'DATE_TO_UPD'
      Origin = 'PLAYER_ZAD.DATE_TO_UPD'
    end
    object IBQuery3PATH_FILE: TIBStringField
      FieldName = 'PATH_FILE'
      Origin = 'PLAYER_ZAD.PATH_FILE'
      Size = 250
    end
  end
  object IBQuery4: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER')
    Left = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
    object IBQuery4ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYER_ZAD.ID'
    end
    object IBQuery4ID_PLAYER: TSmallintField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYER_ZAD.ID_PLAYER'
    end
    object IBQuery4NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYER_ZAD.NAME_FILE'
      Size = 100
    end
    object IBQuery4SIZE_FILE: TIntegerField
      FieldName = 'SIZE_FILE'
      Origin = 'PLAYER_ZAD.SIZE_FILE'
    end
    object IBQuery4DOWNLOADED: TIntegerField
      FieldName = 'DOWNLOADED'
      Origin = 'PLAYER_ZAD.DOWNLOADED'
    end
    object IBQuery4DATE_TO_UPD: TDateTimeField
      FieldName = 'DATE_TO_UPD'
      Origin = 'PLAYER_ZAD.DATE_TO_UPD'
    end
    object IBQuery4PATH_FILE: TIBStringField
      FieldName = 'PATH_FILE'
      Origin = 'PLAYER_ZAD.PATH_FILE'
      Size = 250
    end
  end
end
