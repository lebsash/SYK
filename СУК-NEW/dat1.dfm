object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 219
  Top = 462
  Height = 202
  Width = 455
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:D:\work\Soft Develop\'#1057#1059#1050'-NEW\DB\see.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      '')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    BeforeConnect = IBDatabase1BeforeConnect
    Left = 24
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = True
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 96
    Top = 8
  end
  object IdFTPServer1: TIdFTPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 21
    Greeting.NumericCode = 220
    Greeting.Text.Strings = (
      'SUK FTP Server ready.')
    Greeting.TextCode = '220'
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 500
    ReplyUnknownCommand.Text.Strings = (
      'Syntax error, command unrecognized.')
    ReplyUnknownCommand.TextCode = '500'
    AnonymousAccounts.Strings = (
      'anonymous'
      'ftp'
      'guest')
    AnonymousPassStrictCheck = False
    UserAccounts = IdUserManager1
    SystemType = 'WIN32'
    OnListDirectory = IdFTPServer1ListDirectory
    Left = 168
    Top = 8
  end
  object IdUserManager1: TIdUserManager
    Accounts = <
      item
        UserName = 'user1'
        Password = '123'
        RealName = 'user1'
      end>
    CaseSensitiveUsernames = False
    CaseSensitivePasswords = False
    Left = 248
    Top = 8
  end
end
