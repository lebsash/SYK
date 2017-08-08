object Form7: TForm7
  Left = 302
  Top = 91
  Width = 774
  Height = 586
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1057#1059#1050' - '#1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1083#1077#1077#1088#1086#1084
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDockOver = FormDockOver
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 0
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object Label2: TLabel
    Left = 216
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = 176
    Top = 24
    Width = 23
    Height = 22
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1088#1077#1081#1084
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
  object Label10: TLabel
    Left = 320
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Label10'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 533
    Width = 766
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 208
    Top = 24
    Width = 553
    Height = 505
    ActivePage = TabSheet2
    TabOrder = 1
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1079#1073#1080#1074#1082#1072' '#1101#1082#1088#1072#1085#1072
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 512
        Height = 384
        OnClick = Image1Click
        OnDblClick = Image1Click
        OnMouseDown = Image1MouseDown
        OnMouseMove = Image1MouseMove
      end
      object Label4: TLabel
        Left = 24
        Top = 400
        Width = 67
        Height = 13
        Caption = #1042#1077#1088#1093#1085#1080#1081' '#1091#1075#1086#1083
      end
      object Label5: TLabel
        Left = 168
        Top = 400
        Width = 65
        Height = 13
        Caption = #1053#1080#1078#1085#1080#1081' '#1091#1075#1086#1083
      end
      object Label6: TLabel
        Left = 9
        Top = 420
        Width = 10
        Height = 13
        Caption = 'X:'
      end
      object Label7: TLabel
        Left = 153
        Top = 420
        Width = 10
        Height = 13
        Caption = 'X:'
      end
      object Label8: TLabel
        Left = 153
        Top = 444
        Width = 10
        Height = 13
        Caption = 'Y:'
      end
      object Label9: TLabel
        Left = 9
        Top = 444
        Width = 10
        Height = 13
        Caption = 'Y:'
      end
      object BitBtn1: TBitBtn
        Left = 440
        Top = 416
        Width = 83
        Height = 33
        Caption = #1057#1054#1061#1056#1040#1053#1048#1058#1068
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object Edit2: TEdit
        Left = 24
        Top = 416
        Width = 97
        Height = 21
        TabOrder = 1
        Text = 'Edit2'
        OnKeyPress = Edit2KeyPress
      end
      object Edit3: TEdit
        Left = 168
        Top = 416
        Width = 97
        Height = 21
        TabOrder = 2
        Text = 'Edit3'
        OnKeyPress = Edit3KeyPress
      end
      object Edit4: TEdit
        Left = 24
        Top = 440
        Width = 97
        Height = 21
        TabOrder = 3
        Text = 'Edit4'
        OnKeyPress = Edit4KeyPress
      end
      object Edit5: TEdit
        Left = 168
        Top = 440
        Width = 97
        Height = 21
        TabOrder = 4
        Text = 'Edit5'
        OnKeyPress = Edit5KeyPress
      end
      object ComboBox1: TComboBox
        Left = 288
        Top = 416
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        Text = #1055#1083#1077#1077#1088
        Items.Strings = (
          #1055#1083#1077#1077#1088
          #1041#1077#1075#1091#1097#1072#1103' '#1089#1090#1088#1086#1082#1072
          'Flash')
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1083#1077#1081#1083#1080#1089#1090' '#1092#1088#1077#1081#1084#1072
      ImageIndex = 1
      object SpeedButton2: TSpeedButton
        Left = 480
        Top = 440
        Width = 23
        Height = 22
        Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1091#1088#1086#1074#1077#1085#1100' '#1079#1074#1091#1082#1072
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
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 0
        Top = 432
        Width = 33
        Height = 33
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003C3333339333
          337437FFF3337F3333F73CCC33339333344437773F337F33377733CCC3339337
          4447337F73FF7F3F337F33CCCCC3934444433373F7737F773373333CCCCC9444
          44733337F337773337F3333CCCCC9444443333373F337F3337333333CCCC9444
          473333337F337F337F333333CCCC94444333333373F37F33733333333CCC9444
          7333333337F37F37F33333333CCC944433333333373F7F373333333333CC9447
          33333333337F7F7F3333333333CC94433333333333737F7333333333333C9473
          33333333333737F333333333333C943333333333333737333333333333339733
          3333333333337F33333333333333933333333333333373333333}
        NumGlyphs = 2
      end
      object SpeedButton4: TSpeedButton
        Left = 32
        Top = 432
        Width = 33
        Height = 33
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333393333
          333333333337F3333333333333397333333333333337FF333333333333C94333
          3333333333737F333333333333C9473333333333337373F3333333333CC94433
          3333333337F7F7F3333333333CC94473333333333737F73F33333333CCC94443
          333333337F37F37F33333333CCC94447333333337337F373F333333CCCC94444
          33333337F337F337F333333CCCC94444733333373337F3373F3333CCCCC94444
          4333337F3337FF337F3333CCCCC94444473333733F7773FF73F33CCCCC393444
          443337F37737F773F7F33CCC33393374447337F73337F33737FFCCC333393333
          444377733337F333777FC3333339333337437333333733333373}
        NumGlyphs = 2
      end
      object Label3: TLabel
        Left = 32
        Top = 88
        Width = 118
        Height = 13
        Caption = #1041#1045#1043#1059#1065#1040#1071' '#1057#1058#1056#1054#1050#1040':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton5: TSpeedButton
        Left = 64
        Top = 288
        Width = 105
        Height = 22
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        OnClick = SpeedButton5Click
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 481
        Height = 433
        DataSource = DataSource3
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = PopupMenu2
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid3CellClick
        OnDblClick = DBGrid3DblClick
        OnDragDrop = DBGrid3DragDrop
        OnDragOver = DBGrid3DragOver
        OnKeyDown = DBGrid3KeyDown
        OnMouseMove = DBGrid3MouseMove
        OnStartDrag = DBGrid3StartDrag
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEND'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM'
            Visible = True
          end>
      end
      object TrackBar1: TTrackBar
        Left = 336
        Top = 440
        Width = 150
        Height = 45
        Hint = #1059#1088#1086#1074#1077#1085#1100' '#1079#1074#1091#1082#1072
        Max = 100
        ParentShowHint = False
        Frequency = 5
        ShowHint = True
        TabOrder = 1
        OnExit = SpeedButton2Click
      end
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 480
        Top = 64
        Width = 17
        Height = 305
        DataSource = DataSource3
        PanelHeight = 101
        PanelWidth = 1
        TabOrder = 2
      end
      object Memo1: TMemo
        Left = 16
        Top = 112
        Width = 441
        Height = 161
        TabOrder = 3
        OnChange = Memo1Change
      end
    end
  end
  object Edit1: TEdit
    Left = 0
    Top = 24
    Width = 169
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 201
    Height = 385
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDblClick = DBGrid1DblClick
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
        Title.Caption = #1060#1056#1045#1049#1052
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
  object IBQuery1: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into FRAME_PLAYER  (IP_PLAYER, NAME_FRAME, POS_TOP_X, POS' +
        '_TOP_Y, POS_BOT_X, POS_BOT_Y, OPISANIE) VALUES (:ID_PLAYER,:NAME' +
        '_PLEER,:POS_TOP_X,:POS_TOP_Y,:POS_BOT_X,:POS_BOT_Y,:OPIS)')
    Left = 16
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NAME_PLEER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POS_TOP_X'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POS_TOP_Y'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POS_BOT_X'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POS_BOT_Y'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_NAME'
        ParamType = ptUnknown
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 48
    Top = 464
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1088#1077#1081#1084
      OnClick = N1Click
    end
  end
  object IBQuery2: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from FRAME_PLAYER where ID_PLAYER=:ID_PLAYER order by I' +
        'D')
    Left = 24
    Top = 65528
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
  object DataSource1: TDataSource
    DataSet = IBQuery2
    Left = 56
    Top = 65528
  end
  object IBQuery3: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'update FRAME_PLAYER set POS_TOP_X=:POS_TOP_X, POS_TOP_Y=:POS_TOP' +
        '_Y,POS_BOT_X=:POS_BOT_X, POS_BOT_Y=:POS_BOT_Y, OPISANIE=:OPISANI' +
        'E  where NAME_FRAME=:Name')
    Left = 16
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'POS_TOP_X'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POS_TOP_Y'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POS_BOT_X'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POS_BOT_Y'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPISANIE'
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
      
        'select * from FRAME_PLAYER where ID_PLAYER=:ID_PLAYER order by I' +
        'D')
    Left = 88
    Top = 65528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PLAYER'
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
  object IBQuery5: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into PLAYLIST  (ID_PLAYER, ID_FRAME, NAME_FILE, PATH, LOC' +
        ', SEND, NUM, VOL) VALUES (:IP_PLAYER, :ID_FRAME, :NAME_FILE, :PA' +
        'TH, :LOC, "0", :NUM, "100")')
    Left = 708
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IP_PLAYER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_FRAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NAME_FILE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PATH'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUM'
        ParamType = ptUnknown
      end>
    object IBQuery5ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYLIST.ID'
    end
    object IBQuery5ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYLIST.ID_PLAYER'
    end
    object IBQuery5ID_FRAME: TIntegerField
      FieldName = 'ID_FRAME'
      Origin = 'PLAYLIST.ID_FRAME'
    end
    object IBQuery5NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYLIST.NAME_FILE'
      Size = 50
    end
    object IBQuery5PATH: TIBStringField
      FieldName = 'PATH'
      Origin = 'PLAYLIST.PATH'
      Size = 250
    end
    object IBQuery5LOC: TIntegerField
      FieldName = 'LOC'
      Origin = 'PLAYLIST.LOC'
    end
    object IBQuery5SEND: TIntegerField
      FieldName = 'SEND'
      Origin = 'PLAYLIST.SEND'
    end
    object IBQuery5NUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'PLAYLIST.NUM'
    end
    object IBQuery5VOL: TIntegerField
      FieldName = 'VOL'
      Origin = 'PLAYLIST.VOL'
    end
  end
  object DataSource3: TDataSource
    DataSet = IBQuery6
    OnStateChange = DataSource3StateChange
    Left = 724
    Top = 56
  end
  object IBQuery6: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * from PLAYLIST where ID_PLAYER=:ID_PLAYER and ID_FRAME=:' +
        'ID_FRAME order by NUM')
    Left = 692
    Top = 56
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
    object IBQuery6ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYLIST.ID'
      Visible = False
    end
    object IBQuery6ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYLIST.ID_PLAYER'
      Visible = False
    end
    object IBQuery6ID_FRAME: TIntegerField
      FieldName = 'ID_FRAME'
      Origin = 'PLAYLIST.ID_FRAME'
      Visible = False
    end
    object IBQuery6NAME_FILE: TIBStringField
      DisplayLabel = #1048#1052#1071
      FieldName = 'NAME_FILE'
      Origin = 'PLAYLIST.NAME_FILE'
      Size = 50
    end
    object IBQuery6PATH: TIBStringField
      FieldName = 'PATH'
      Origin = 'PLAYLIST.PATH'
      Visible = False
      Size = 250
    end
    object IBQuery6LOC: TIntegerField
      DisplayLabel = #1051#1086#1082#1072#1083#1100#1085#1086#1089#1090#1100
      FieldName = 'LOC'
      Origin = 'PLAYLIST.LOC'
    end
    object IBQuery6SEND: TIntegerField
      DisplayLabel = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1080#1077
      FieldName = 'SEND'
      Origin = 'PLAYLIST.SEND'
    end
    object IBQuery6NUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'PLAYLIST.NUM'
    end
    object IBQuery6VOL: TIntegerField
      FieldName = 'VOL'
      Origin = 'PLAYLIST.VOL'
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 708
    Top = 152
    object N2: TMenuItem
      Caption = #1051#1086#1082#1072#1083#1100#1085#1086#1089#1090#1100
      object N7: TMenuItem
        Caption = #1057#1076#1077#1083#1072#1090#1100' '#1083#1086#1082#1072#1083#1100#1085#1099#1084
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1057#1076#1077#1083#1072#1090#1100' '#1087#1077#1088#1077#1084#1077#1097#1072#1077#1084#1099#1084
        OnClick = N8Click
      end
    end
    object N3: TMenuItem
      Caption = #1043#1088#1086#1084#1082#1086#1089#1090#1100
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    object N6: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = N6Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1086' '#1087#1083#1077#1081#1083#1080#1089#1090#1091'...'
      OnClick = N10Click
    end
  end
  object IBQuery7: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * from PLAYLIST where ID_PLAYER=:ID_PLAYER and ID_FRAME=:' +
        'ID_FRAME order by NUM')
    Left = 708
    Top = 200
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
    object IBQuery7ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PLAYLIST.ID'
    end
    object IBQuery7ID_PLAYER: TIntegerField
      FieldName = 'ID_PLAYER'
      Origin = 'PLAYLIST.ID_PLAYER'
    end
    object IBQuery7ID_FRAME: TIntegerField
      FieldName = 'ID_FRAME'
      Origin = 'PLAYLIST.ID_FRAME'
    end
    object IBQuery7NAME_FILE: TIBStringField
      FieldName = 'NAME_FILE'
      Origin = 'PLAYLIST.NAME_FILE'
      Size = 50
    end
    object IBQuery7PATH: TIBStringField
      FieldName = 'PATH'
      Origin = 'PLAYLIST.PATH'
      Size = 250
    end
    object IBQuery7LOC: TIntegerField
      FieldName = 'LOC'
      Origin = 'PLAYLIST.LOC'
    end
    object IBQuery7SEND: TIntegerField
      FieldName = 'SEND'
      Origin = 'PLAYLIST.SEND'
    end
    object IBQuery7NUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'PLAYLIST.NUM'
    end
    object IBQuery7VOL: TIntegerField
      FieldName = 'VOL'
      Origin = 'PLAYLIST.VOL'
    end
  end
  object IBQuery8: TIBQuery
    Database = DataModule2.IBDatabase1
    Transaction = DataModule2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'delete from PLAYLIST  where ID_PLAYER = :ID_PLAYER and ID_FRAME=' +
        ':ID_FRAME')
    Left = 48
    Top = 496
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
