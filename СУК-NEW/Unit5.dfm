object Form5: TForm5
  Left = 224
  Top = 154
  Width = 906
  Height = 556
  Caption = #1057#1059#1050' - Updater - CLIENTS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormCreate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 898
    Height = 457
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1048#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IP_ADR'
        Title.Caption = 'IP-'#1072#1076#1088#1077#1089
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_CONNECT'
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1074#1080#1079#1080#1090#1072
        Visible = True
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
        FieldName = 'OPISANIE'
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 898
    Height = 65
    Align = alTop
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 384
      Top = 7
      Width = 23
      Height = 22
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
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
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 8
      Width = 233
      Height = 17
      Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1085#1085#1099#1077
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 24
      Width = 177
      Height = 17
      Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1044#1077#1072#1082#1090#1080#1074#1080#1088#1086#1074#1072#1085#1085#1099#1081
      TabOrder = 1
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 8
      Top = 40
      Width = 113
      Height = 17
      Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1042#1057#1045
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = RadioButton3Click
    end
    object ComboBox1: TComboBox
      Left = 240
      Top = 8
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = #1042#1089#1077' '#1082#1083#1080#1077#1085#1090#1099
      OnChange = ComboBox1Change
      Items.Strings = (
        #1042#1089#1077' '#1082#1083#1080#1077#1085#1090#1099
        #1055#1083#1077#1077#1088#1099
        #1055#1088#1086#1095#1080#1077' '#1082#1083#1080#1077#1085#1090#1099)
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from NAME_CONNECTION order by ID')
    Left = 48
    Top = 344
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
    Left = 80
    Top = 344
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 112
    Top = 344
    object P1: TMenuItem
      Caption = #1047#1072#1076#1072#1095#1080
      object N7: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1076#1072#1095
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1050#1083#1080#1077#1085#1090#1072
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1044#1077#1072#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1050#1083#1080#1077#1085#1090#1072
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1055#1083#1077#1081#1083#1080#1089#1090
        OnClick = N10Click
      end
      object SoftwareUPDADE1: TMenuItem
        Caption = 'Software UPDADE'
        OnClick = SoftwareUPDADE1Click
      end
    end
    object N1: TMenuItem
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object N2: TMenuItem
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1087#1083#1077#1077#1088
      OnClick = N4Click
    end
    object N11: TMenuItem
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1091
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = N6Click
    end
  end
  object IBQuery2: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from NAME_CONNECTION'
      'where'
      '  ID = :OLD_ID and'
      '  UIN = :OLD_UIN and'
      '  NAME = :OLD_NAME')
    Left = 80
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OLD_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_UIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_NAME'
        ParamType = ptUnknown
      end>
  end
  object IBDataSet1: TIBDataSet
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from NAME_CONNECTION')
    Left = 472
    Top = 352
  end
  object IBQuery3: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update NAME_CONNECTION set CLIENT_ACTIVE=:ADR where NAME=:Name')
    Left = 112
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ADR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object IBQuery4: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PLAYLIST where ID_PLAYER=:ID_PLAYER and LOC=:LOC')
    Left = 784
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOC'
        ParamType = ptUnknown
      end>
    object IBQuery4ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYLIST.ID'
    end
    object IBQuery4ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYLIST.ID_PLAYER'
    end
    object IBQuery4ID_FRAME: TIntegerField
      FieldName = 'ID_FRAME'
      Origin = 'PLAYLIST.ID_FRAME'
    end
    object IBQuery4NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYLIST.NAME_FILE'
      Size = 50
    end
    object IBQuery4PATH: TIBStringField
      FieldName = 'PATH'
      Origin = 'PLAYLIST.PATH'
      Size = 250
    end
    object IBQuery4LOC: TIntegerField
      FieldName = 'LOC'
      Origin = 'PLAYLIST.LOC'
    end
    object IBQuery4SEND: TIntegerField
      FieldName = 'SEND'
      Origin = 'PLAYLIST.SEND'
    end
    object IBQuery4NUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'PLAYLIST.NUM'
    end
    object IBQuery4VOL: TIntegerField
      FieldName = 'VOL'
      Origin = 'PLAYLIST.VOL'
    end
  end
  object IBQuery5: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into PLAYER_ZAD  (ID_PLAYER, NAME_FILE, PATH_FILE, SIZE_F' +
        'ILE, DOWNLOADED, DATE_TO_UPD ) VALUES (:ID_PLAYER, :NAME_FILE, :' +
        'PATH_FILE, :SIZE_FILE, 0, :DATE_TO_UPD)')
    Left = 752
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NAME_FILE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PATH_FILE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE_FILE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_TO_UPD'
        ParamType = ptUnknown
      end>
  end
  object IBQuery6: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select PATH_FILE from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER and ' +
        'PATH_FILE=:PATH_FILE')
    Left = 720
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PATH_FILE'
        ParamType = ptUnknown
      end>
    object IBQuery6PATH_FILE: TIBStringField
      FieldName = 'PATH_FILE'
      Origin = 'PLAYER_ZAD.PATH_FILE'
      Size = 250
    end
  end
  object IBQuery7: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FRAME_PLAYER where ID_PLAYER=:ID_PLAYER')
    Left = 688
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
    object IBQuery7ID: TIntegerField
      FieldName = 'ID'
      Origin = 'FRAME_PLAYER.ID'
    end
    object IBQuery7ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'FRAME_PLAYER.ID_PLAYER'
    end
    object IBQuery7NAME_FRAME: TIBStringField
      FieldName = 'NAME_FRAME'
      Origin = 'FRAME_PLAYER.NAME_FRAME'
      Size = 30
    end
    object IBQuery7POS_TOP_X: TIntegerField
      FieldName = 'POS_TOP_X'
      Origin = 'FRAME_PLAYER.POS_TOP_X'
    end
    object IBQuery7POS_TOP_Y: TIntegerField
      FieldName = 'POS_TOP_Y'
      Origin = 'FRAME_PLAYER.POS_TOP_Y'
    end
    object IBQuery7POS_BOT_X: TIntegerField
      FieldName = 'POS_BOT_X'
      Origin = 'FRAME_PLAYER.POS_BOT_X'
    end
    object IBQuery7POS_BOT_Y: TIntegerField
      FieldName = 'POS_BOT_Y'
      Origin = 'FRAME_PLAYER.POS_BOT_Y'
    end
    object IBQuery7OPISANIE: TIBStringField
      FieldName = 'OPISANIE'
      Origin = 'FRAME_PLAYER.OPISANIE'
      Size = 100
    end
  end
  object IBQuery8: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PLAYLIST where ID_PLAYER=:ID_PLAYER')
    Left = 656
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
    object IBQuery8ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYLIST.ID'
    end
    object IBQuery8ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYLIST.ID_PLAYER'
    end
    object IBQuery8ID_FRAME: TIntegerField
      FieldName = 'ID_FRAME'
      Origin = 'PLAYLIST.ID_FRAME'
    end
    object IBQuery8NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYLIST.NAME_FILE'
      Size = 50
    end
    object IBQuery8PATH: TIBStringField
      FieldName = 'PATH'
      Origin = 'PLAYLIST.PATH'
      Size = 250
    end
    object IBQuery8LOC: TIntegerField
      FieldName = 'LOC'
      Origin = 'PLAYLIST.LOC'
    end
    object IBQuery8SEND: TIntegerField
      FieldName = 'SEND'
      Origin = 'PLAYLIST.SEND'
    end
    object IBQuery8NUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'PLAYLIST.NUM'
    end
    object IBQuery8VOL: TIntegerField
      FieldName = 'VOL'
      Origin = 'PLAYLIST.VOL'
    end
  end
  object IBQuery9: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER')
    Left = 616
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
    object IBQuery9ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYER_ZAD.ID'
    end
    object IBQuery9ID_PLAYER: TSmallintField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYER_ZAD.ID_PLAYER'
    end
    object IBQuery9NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYER_ZAD.NAME_FILE'
      Size = 100
    end
    object IBQuery9SIZE_FILE: TIntegerField
      FieldName = 'SIZE_FILE'
      Origin = 'PLAYER_ZAD.SIZE_FILE'
    end
    object IBQuery9DOWNLOADED: TIntegerField
      FieldName = 'DOWNLOADED'
      Origin = 'PLAYER_ZAD.DOWNLOADED'
    end
    object IBQuery9DATE_TO_UPD: TDateTimeField
      FieldName = 'DATE_TO_UPD'
      Origin = 'PLAYER_ZAD.DATE_TO_UPD'
    end
    object IBQuery9PATH_FILE: TIBStringField
      FieldName = 'PATH_FILE'
      Origin = 'PLAYER_ZAD.PATH_FILE'
      Size = 250
    end
  end
  object IBQuery10: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER')
    Left = 424
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end>
  end
  object Timer1: TTimer
    Interval = 600000
    OnTimer = Timer1Timer
    Left = 480
    Top = 8
  end
end
