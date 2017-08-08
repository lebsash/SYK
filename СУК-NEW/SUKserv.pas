unit SUKserv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Sockets, StdCtrls, ComCtrls, IdBaseComponent,
  IdComponent, IdTCPServer, IdFTPServer, dat1, IdAntiFreezeBase, IdAntiFreeze,
  IdThreadMgr, IdThreadMgrPool, IdThreadComponent, IdIOHandler,
  IdIOHandlerSocket, IdUserAccounts, OverbyteIcsWndControl,
  OverbyteIcsFtpSrv, OverbyteIcsFTPSRVC, tlhelp32, OverbyteIcsWSocket,
  OverbyteIcsWSocketS, IdIntercept, DB, IBCustomDataSet, IBQuery, ExtCtrls,
  OverbyteIcsFtpSrvT,
  OverbyteIcsWinsock,
  OverbyteIcsAvlTrees,   OverbyteIcsOneTimePw, CoolTrayIcon, Buttons;

Const
    WM_APPSTARTUP = WM_USER + 1;

type
  TLogMsg = class(TComponent);
  TCacheData = packed record
    MD5Sum    : String;
    CRC32B    : String;
    ZFileName : string;
    CFileUDT  : TDateTime;
    CFSize    : Int64;
    CReadCount: Integer;
    CLastTick : LongWord;
  end;
  PCacheData = ^TCacheData;
 
  TGetProcessingThread = class; { Forward declaration }

  { We use our own client class to hold our thread }
  TMyClient  = class(TFtpCtrlSocket)
  private
      FWorkerThread : TGetProcessingThread;
      FAccessToken : THandle;
  public
      constructor Create(AOwner: TComponent);override;
      destructor Destroy; override;
  end;

  TGetProcessingThread = class(TThread)
  protected
    Server : TFtpServer;
    Client : TMyClient;
  public
      procedure Execute; override;
  end;

type

  TTcpSrvClient = class(TWSocketClient)
  public
    RcvdLine    : String;
    ConnectTime : TDateTime;
  end;




  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    N5: TMenuItem;
    N6: TMenuItem;
    FTP1: TMenuItem;
    Button2: TButton;
    IdFTPServer1: TIdFTPServer;
    IdUserManager1: TIdUserManager;
    FtpServer1: TFtpServer;
    Button3: TButton;
    Memo3: TMemo;
    IdTCPServer1: TIdTCPServer;
    WSocketServer1: TWSocketServer;
    ListBox1: TListBox;
    Updater1: TMenuItem;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBQuery1ID: TIntegerField;
    IBQuery1UIN: TIntegerField;
    IBQuery1NAME: TIBStringField;
    IBQuery1IP_ADR: TIBStringField;
    IBQuery1OPISANIE: TIBStringField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label23: TLabel;
    RedImage1: TImage;
    GreenImage1: TImage;
    RedImage2: TImage;
    GreenImage2: TImage;
    IBQuery1CLIENT_ACTIV: TIntegerField;
    IBQuery1CLIENT_TYPE: TIBStringField;
    N7: TMenuItem;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Label2: TLabel;
    IBQuery3: TIBQuery;
    IBQuery3ID: TIntegerField;
    IBQuery3UIN: TIntegerField;
    IBQuery3NAME: TIBStringField;
    IBQuery3IP_ADR: TIBStringField;
    IBQuery3OPISANIE: TIBStringField;
    IBQuery3CLIENT_ACTIV: TIntegerField;
    IBQuery3CLIENT_TYPE: TIBStringField;
    IBQuery4: TIBQuery;
    IBQuery4ID: TIntegerField;
    IBQuery4ID_PLAYER: TSmallintField;
    IBQuery4NAME_FILE: TIBStringField;
    IBQuery4SIZE_FILE: TIntegerField;
    IBQuery4DOWNLOADED: TIntegerField;
    IBQuery4DATE_TO_UPD: TDateTimeField;
    IBQuery4PATH_FILE: TIBStringField;
    IBQuery5: TIBQuery;
    IBQuery6: TIBQuery;
    IBQuery6ID: TIntegerField;
    IBQuery6UIN: TIntegerField;
    IBQuery6NAME: TIBStringField;
    IBQuery6IP_ADR: TIBStringField;
    IBQuery6OPISANIE: TIBStringField;
    IBQuery6CLIENT_ACTIV: TIntegerField;
    IBQuery6CLIENT_TYPE: TIBStringField;
    IBQuery7: TIBQuery;
    Memo2: TMemo;
    Memo4: TMemo;
    IBQuery8: TIBQuery;
    Edit1: TEdit;
    IBQuery9: TIBQuery;
    IBQuery10: TIBQuery;
    IBQuery9ID: TIntegerField;
    IBQuery9PLAYER_ID: TIntegerField;
    IBQuery9PLAYER_NAME: TIBStringField;
    IBQuery9FILE_TO_UPDATE: TIBStringField;
    IBQuery9PATH_FILE_GET: TIBStringField;
    IBQuery9FILE_STATUS: TIntegerField;
    IBQuery9FILE_DOWNLOAD: TIntegerField;
    IBQuery9FILE_VERSION: TIBStringField;
    IBQuery9DATE_DOWNLOAD: TDateTimeField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Timer1: TTimer;

    procedure N4Click(Sender: TObject);
    procedure FtpServer1ClientConnect(Sender: TObject;
      Client: TFtpCtrlSocket; Error: Word);
    procedure FtpServer1ClientDisconnect(Sender: TObject;
      Client: TFtpCtrlSocket; Error: Word);
    procedure FtpServer1StorSessionConnected(Sender: TObject;
      Client: TFtpCtrlSocket; Data: TWSocket; Error: Word);
    procedure FtpServer1StorSessionClosed(Sender: TObject;
      Client: TFtpCtrlSocket; Data: TWSocket; Error: Word);
    procedure FtpServer1RetrDataSent(Sender: TObject;
      Client: TFtpCtrlSocket; Data: TWSocket; Error: Word);
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure FtpServer1RetrSessionConnected(Sender: TObject;
    Client : TFtpCtrlSocket;
    Data   : TWSocket;
    Error  : Word);
    procedure FtpServer1RetrSessionClosed(Sender: TObject;
        Client: TFtpCtrlSocket; Data: TWSocket; Error: Word);
    procedure FtpServer1ClientCommand(Sender: TObject;
        Client: TFtpCtrlSocket; var Keyword, Params, Answer: TFtpString);
    procedure FtpServer1AnswerToClient(
    Sender     : TObject;
    Client     : TFtpCtrlSocket;
    var Answer : TFtpString);
    procedure FtpServer1GetProcessing(
    Sender          : TObject;
    Client          : TFtpCtrlSocket;
    var DelayedSend : Boolean);


    procedure N5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FtpServer1Authenticate(Sender: TObject;
      Client: TFtpCtrlSocket; UserName, Password: TFtpString;
      var Authenticated: Boolean);
    procedure FtpServer1ChangeDirectory(Sender: TObject;
      Client: TFtpCtrlSocket; Directory: TFtpString; var Allowed: Boolean);
    procedure WSocketServer1ClientConnect(Sender: TObject;
      Client: TWSocketClient; Error: Word);
    procedure WSocketServer1ClientDisconnect(Sender: TObject;
      Client: TWSocketClient; Error: Word);
    procedure Button3Click(Sender: TObject);
  //  procedure WSocketServer1DataAvailable(Sender: TObject; ErrCode: Word);
    procedure IdTCPServer1AfterCommandHandler(ASender: TIdTCPServer;
      AThread: TIdPeerThread);
    procedure Updater1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FTP1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure WorkerThreadTerminated(Sender : TObject);
    procedure CacheFreeData(
    Sender : TObject;
    Data   : Pointer;
    Len    : Integer);
    procedure FtpServer1Timeout(Sender: TObject;
              Client: TFtpCtrlSocket; Duration: Integer; var Abort: Boolean);
    procedure N8Click(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


  private
    FIniFileName : String;
    FInitialized : Boolean;
    FOtpMethod        : TOtpMethod;
    FOtpSequence      : integer;
    FOtpSeed          : string;
    //procedure Display(Msg : String);
   // procedure WMAppStartup(var Msg: TMessage); message WM_APPSTARTUP;
    procedure ClientDataAvailable(Sender: TObject; Error: Word);
    procedure ProcessData(Client : TTcpSrvClient);

    procedure ClientBgException(Sender       : TObject;
                                E            : Exception;
                                var CanClose : Boolean);
    procedure ClientLineLimitExceeded(Sender        : TObject;
                                      Cnt           : LongInt;
                                      var ClearData : Boolean);



    procedure GetZnak (Star_Pos, End_Pos: integer;
                          STR:string;
                          Var NEWSTR:String;
                              NEW_START:integer);


    { Private declarations }
  public
    procedure STL (FName1, STR_tolog: string; var strok:string);
          procedure StartServer;
          procedure StopServer;          
    { Public declarations }
  end;

var
  Form1: TForm1;
  s:string;
  UPDT_Status:String;
  UPD_Serv_LOCIP, UPD_SERV_LOCPORT, UPD_SERV_LINE, UPD_SERV_SCR, CLType:string;
  falo:textfile;
  ftp_Param1,ftp_Param2, ftp_Param3, ftp_Param4, ftp_Param5, ftp_Param6, ftp_pass, ftp_log: string;
  SC_param1, sc_param2, sc_param3, sc_param4, sc_param5:string;
  path_to_exe:string;
implementation

uses monall, updserv, Unit4, Unit9, Unit5, Unit12;


{$R *.dfm}
var m:TMemoryStream;


{ TMyClient }

constructor TMyClient.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
end;

destructor TMyClient.Destroy;
begin
  if FAccessToken <> 0 then begin
      CloseHandle(FAccessToken);
      FAccessToken := 0;
  end;
  inherited Destroy;
end;

procedure TGetProcessingThread.Execute;
begin
    Sleep(10000);
    // Данная процедура демонстрирует создание нити задачи
    // выполняется одна задача - при этом не блокируются прочие клиенты
end;


procedure TForm1.N4Click(Sender: TObject);
begin
CoolTrayIcon1.HideMainForm;
end;

// Останавливаем FTP-Сервер
procedure TForm1.StopServer;
begin
    FtpServer1.Stop;
    FtpServer1.DisconnectAll;
    Unit9.Form9.InfoMemo.Lines.Add('FTP Server stopped: '+datetimetostr(now));
    GreenImage1.Visible := False;
    RedImage1.Visible   := True;
end;


// Процедура, корректно стартующая FTP-Сервер
procedure TForm1.StartServer;
var
    wsi     : TWSADATA;
begin
    wsi := WinsockInfo;
    //Заполняем системный лог FTP-сервера
    //На 1й вкладке формы Form9

    Unit9.Form9.InfoMemo.Lines.Add('IT-company: Studio911.org ');
    Unit9.Form9.InfoMemo.Lines.Add('Process: '+ datetimetostr (now));
    Unit9.Form9.InfoMemo.Lines.Add('    SUK - FTPServer STARTED - Ok' );
    Unit9.Form9.InfoMemo.Lines.Add('    Logging  server STARTED - Ok');
    Unit9.Form9.InfoMemo.Lines.Add('    Winsock:');
    Unit9.Form9.InfoMemo.Lines.Add('        Version ' +
            Format('%d.%d', [WinsockInfo.wHighVersion shr 8,
                             WinsockInfo.wHighVersion and 15]));
    Unit9.Form9.InfoMemo.Lines.Add('        ' + StrPas(@wsi.szDescription));
    Unit9.Form9.InfoMemo.Lines.Add('        ' + StrPas(@wsi.szSystemStatus));
{$IFNDEF VER100}
    { A bug in Delphi 3 makes lpVendorInfo invalid }
    if wsi.lpVendorInfo <> nil then
        Unit9.Form9.InfoMemo.Lines.Add('        ' + StrPas(wsi.lpVendorInfo));
{$ENDIF}
    { If not running 16 bits, we use our own client class }
    FtpServer1.ClientClass := TMyClient;
    { Use a custom multiline banner }
    FtpServer1.Banner := '220-Welcome to SYK - FTP' + #13#10 +
                         '220-' + #13#10 +
                         '220 SYK FTP Server ready.';
    //FtpServer1.Port   := FPort;
    FtpServer1.Start;
    GreenImage1.Visible := True;
    RedImage1.Visible   := False;
end;


procedure TForm1.FtpServer1ClientConnect(Sender: TObject;
  Client: TFtpCtrlSocket; Error: Word);
var
    I : Integer;
begin
    //Пример установки фильтра по IP
    //Обязательно используем в следующей версии
   { if Client.GetPeerAddr = '193.121.12.25' then begin
        Client.SendStr('421 Connection not allowed.' + #13#10);
        Client.Close;
        Exit;
    end;
    }
    Client.SessIdInfo := Client.GetPeerAddr ;
    Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo + ' connected');
       //Обновим список активных клиентов FTP
    Unit9.Form9.Memo1.Clear;       
    if FtpServer1.ClientCount <= 0 then begin
        Unit9.Form9.Memo1.Lines.Add('No client');
        Exit;
    end;

    for I := 0 to FtpServer1.ClientCount - 1 do begin
        Unit9.Form9.Memo1.Lines.Add('Client ' + IntToStr(I + 1) + ': ' +
                           FtpServer1.Client[I].GetPeerAddr + '/' +
                           FtpServer1.Client[I].GetPeerPort);
    end;
end;


procedure TForm1.FtpServer1ClientDisconnect(Sender: TObject;
  Client: TFtpCtrlSocket; Error: Word);
var i:integer;
begin
    Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo + ' disconnected after ' +
             IntToStr (IcsElapsedSecs (Client.SessStartTick)) +
              ' secs, total recv ' + IntToKbyte (Client.TotPutBytes) +
                      ', total xmit ' + IntToKbyte (Client.TotGetBytes) ) ;

    //Обновим список активных клиентов FTP
    Unit9.Form9.Memo1.Clear;
    if FtpServer1.ClientCount <= 0 then begin
        Unit9.Form9.Memo1.Lines.Add('No client');
        Exit;
    end;

    for I := 0 to FtpServer1.ClientCount - 1 do begin
        Unit9.Form9.Memo1.Lines.Add('Client ' + IntToStr(I + 1) + ': ' +
                           FtpServer1.Client[I].GetPeerAddr + '/' +
                           FtpServer1.Client[I].GetPeerPort);
    end;
end;



procedure TForm1.FtpServer1StorSessionConnected(Sender: TObject;
  Client: TFtpCtrlSocket; Data: TWSocket; Error: Word);
begin
    if Error <> 0 then
        Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo +
                           ' Data session failed to open. Error #' +
                           IntToStr(Error));
end;



procedure TForm1.FtpServer1StorSessionClosed(Sender: TObject;
  Client: TFtpCtrlSocket; Data: TWSocket; Error: Word);
begin
    if Error <> 0 then
        Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo +
                           ' Data session closed. Error #' + IntToStr(Error));
end;





{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TForm1.FtpServer1RetrDataSent(Sender: TObject;
  Client: TFtpCtrlSocket; Data: TWSocket; Error: Word);
begin
    if Error <> 0 then
        Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo +
                           ' Data sent. Error #' + IntToStr(Error));
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This event handler is called when the data session for a get file has     }
{ been opened. This is a good place build a file or a stream if the data    }
{ requested is not already stored in a file on the file system.             }
{ This feature is very powerfull and enable the FTP protocol to be used to  }
{ retrieve any kind of data. It this sample, we just check for C:\VIRTUAL   }
{ directory. If this directory is curent, then a TMemoryStream is created   }
{ on the fly with some data. If another directory is selected, the FTP      }
{ server works as any other: just send the requested file, if it exist !    }
{ This event handler is also a place where you can abort the file transfer. }
{ Simply trigger an exception and transfer will not take place.             }
{ Note that if you just wants to prohibe access to some directory or file,  }
{ the best place to code that is in the OnValidateGet or OnValidatePut      }
{ event handlers.                                                           }
procedure TForm1.FtpServer1RetrSessionConnected(Sender: TObject;
    Client : TFtpCtrlSocket;
    Data   : TWSocket;
    Error  : Word);
var
    Buf : String;
begin
    if Error <> 0 then
        Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo +
                           ' Data session connected. Error #' + IntToStr(Error))
    else if Copy(UpperCase(Client.FilePath), 1, 19) = 'C:\VIRTUAL\FORBIDEN' then
        raise Exception.Create('Access prohibed !')
    else if Copy(UpperCase(Client.FilePath), 1, 11) = 'C:\VIRTUAL\' then begin
        Unit9.Form9.InfoMemo.Lines.Add('! VIRTUAL FILE');
        Client.UserData   := 1;        { Remember we created a stream }
        if Assigned(Client.DataStream) then
            Client.DataStream.Destroy; { Prevent memory leaks         }
        Client.DataStream := TMemoryStream.Create;
        Buf := 'This is a file created on the fly by the FTP server' + #13#10 +
               'It could result of a query to a database or anything else.' + #13#10 +
               'The request was: ''' + Client.FilePath + '''' + #13#10;
        Client.DataStream.Write(Buf[1], Length(Buf));
        Client.DataStream.Seek(0, 0);
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TForm1.FtpServer1RetrSessionClosed(Sender: TObject;
  Client: TFtpCtrlSocket; Data: TWSocket; Error: Word);
begin
    if Error <> 0 then
        Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo +
                           ' Data session closed. Error #' + IntToStr(Error));
    if Client.UserData = 1 then begin
        { We created a stream for a virtual file or dir. Delete the TStream }
        if Assigned(Client.DataStream) then begin
            { There is no reason why we should not come here, but who knows ? }
            Client.DataStream.Destroy;
            Client.DataStream := nil;
        end;
        Client.UserData   := 0;     { Reset the flag }
    end;
end;


procedure TForm1.FtpServer1ClientCommand(Sender: TObject;
  Client: TFtpCtrlSocket; var Keyword, Params, Answer: TFtpString);
begin
    Unit9.Form9.InfoMemo.Lines.Add('< ' + Client.SessIdInfo + ' ' +
                       Keyword + ' ' + Params);
end;

procedure TForm1.FtpServer1AnswerToClient(
    Sender     : TObject;
    Client     : TFtpCtrlSocket;
    var Answer : TFtpString);
begin
    Unit9.Form9.InfoMemo.Lines.Add('> ' + Client.SessIdInfo + ' [' +
                            IntToStr (Client.ReqDurMilliSecs) + 'ms] ' + Answer);
end;


procedure TForm1.WorkerThreadTerminated(Sender : TObject);
var
    MyThread : TGetProcessingThread;
    Answer   : TFtpString;
begin
    MyThread := Sender as TGetProcessingThread;
    MyThread.Server.DoStartSendData(MyThread.Client, Answer);  { angus }
end;

procedure TForm1.FtpServer1GetProcessing(
    Sender          : TObject;
    Client          : TFtpCtrlSocket;
    var DelayedSend : Boolean);
var
    MyServer : TFtpServer;
    MyClient : TMyClient;
begin
    MyServer := Sender as TFtpServer;
    MyClient := Client as TMyClient;
    { If client request a *.ZZZ file, then start a thread to do some      }
    { processing (here the thread just sleep 10 sec to show other clients }
    { are not blocked.                                                    }
    if UpperCase(ExtractFileExt(MyClient.FileName)) = '.ZZZ' then begin
        MyClient.FWorkerThread := TGetProcessingThread.Create(TRUE);
        MyClient.FWorkerThread.Server          := MyServer;
        MyClient.FWorkerThread.Client          := MyClient;
        MyClient.FWorkerThread.FreeOnTerminate := TRUE;
        MyClient.FWorkerThread.OnTerminate     := WorkerThreadTerminated;
        MyClient.FWorkerThread.Resume;
        { Ask server component to not start sending immediately           }
        { We will ask to start sending from WorkerThreadTerminated event  }
        DelayedSend := TRUE;
    end;
end;



procedure TForm1.CacheFreeData(
    Sender : TObject;
    Data   : Pointer;
    Len    : Integer);
begin
    Dispose(PCacheData(Data));
end;

procedure TForm1.FtpServer1Timeout(Sender: TObject;
  Client: TFtpCtrlSocket; Duration: Integer; var Abort: Boolean);
begin
    Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo +
         ' client being timed out after ' + IntToStr (Duration) + ' secs inactivity');
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}







procedure TForm1.IdTCPServer1Execute(AThread: TIdPeerThread);
var t1: string;
begin

end;

procedure TForm1.N5Click(Sender: TObject);
begin
Form2.show; //Выводим общий монитор
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
idTCPServer1.Active:=false;
FTPServer1.DisconnectAll;
FTPServer1.Stop;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
dat1.DataModule2.IdFTPServer1.Active:=true;
end;



procedure TForm1.FtpServer1Authenticate(Sender: TObject;
  Client: TFtpCtrlSocket; UserName, Password: TFtpString;
  var Authenticated: Boolean);
begin
  { One Time Passwords - keep sequence and seed for next login attempt }
    if FOtpMethod > OtpKeyNone then begin
 //       if not Authenticated then exit;
        Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo +
                                    ' is One Time Password authenticated');
        FOtpSequence := Client.OtpSequence;
        FOtpSeed := Client.OtpSeed;
            Client.HomeDir:=ftp_param5;
            Client.Directory:=ftp_param5;
    end
    else begin

        { You should place here the code needed to authenticate the user. }
        { For example a text file with all permitted username/password.   }
        { If the user can't be authenticated, just set Authenticated to   }
        { false before returning.                                         }
        { It is also the right place to setup Client.HomeDir              }
        { If you need to store info about the client for later processing }
        { you can use Client.UserData to store a pointer to an object or  }
        { a record with the needed info.                                  }

        Unit9.Form9.InfoMemo.Lines.Add('! ' + Client.SessIdInfo + ' is authenticated');
    Client.HomeDir:=ftp_param5;
    Client.Directory:=ftp_param5;

        if Password <> ftp_pass then
            Authenticated := FALSE;
    end;
    Client.HomeDir   := ftp_param3;
    Client.Directory := ftp_param3;
end;

procedure TForm1.FtpServer1ChangeDirectory(Sender: TObject;
  Client: TFtpCtrlSocket; Directory: TFtpString; var Allowed: Boolean);
begin
{$IFDEF NEVER}
    { It the right place to check if a user has access to a given directory }
    { The example below disable C:\ access to non root user.                }
   // if (UpperCase(Client.UserName) <> 'ROOT') and
   //    (UpperCase(Client.Directory) = 'C:\') then
       Allowed := FALSE;
{$ENDIF}
end;

procedure TForm1.WSocketServer1ClientConnect(Sender: TObject;
  Client: TWSocketClient; Error: Word);
begin
Memo1.Lines.Append('CLIENT CONNECTED!');
   with Client as TTcpSrvClient do begin

        // собираем данные о пришедшем клиенте
          form4.RichEdit1.Lines.Append(DateToStr(Now)+' '+timetostr(now)+' Client Connected:'+PeerAddr+'/'+PeerPort);
          form4.ListBox1.Items.Append(PeerAddr+'/'+PeerPort);
         

        LineMode            := TRUE;
        LineEdit            := TRUE;
        LineLimit           := strtoint(UPD_SERV_LINE);    //Лимит по передаваемым строкам
        // Переназначение стандартных процедур
        OnDataAvailable     := ClientDataAvailable;     //Доступность данных
        OnLineLimitExceeded := ClientLineLimitExceeded; //Лимит подключений
        OnBgException       := ClientBgException;       //Обработчик исключений
        ConnectTime         := Now;                     // Время коннекта
      
    end;

end;


procedure TForm1.WSocketServer1ClientDisconnect(Sender: TObject;
  Client: TWSocketClient; Error: Word);
  var i,j:integer;
      z:string;
begin

 with Client as TTcpSrvClient do begin
   // ищем элемент с именем
     for i:=0 to form4.ListBox1.Count-1 do
     begin
      if CompareText(form4.ListBox1.Items[i], PeerAddr+'/'+PeerPort) = 0
      then j:=i;

     end;
  form4.Richedit1.Lines.Append(DateToStr(Now)+' '+timetostr(now)+' Cliend disconnected:'+PeerAddr+'/'+PeerPort);

 form4.ListBox1.Items.Delete(j);

 end;
end;

procedure TForm1.ClientLineLimitExceeded(
    Sender        : TObject;
    Cnt           : LongInt;
    var ClearData : Boolean);
begin
    with Sender as TTcpSrvClient do begin
        //Display('Line limit exceeded from ' + GetPeerAddr + '. Closing.');
        ClearData := TRUE;
        Close;
    end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TForm1.ClientDataAvailable(
    Sender : TObject;
    Error  : Word);
Var
 ClName, Client_ID, Client_Zaproz, Client_Version, Client_Gets:string;
     Str_GETS, Str_Part, Str_Part1,res1, f1,str1,CL_Type, Part2 : string;
    J:integer; //№ текущей позиции по пришедшей строке
    J1:integer; // Счетчик имен в БД
    j11,CL_ID, NUM_ZAK, bt_ZAK, CL_Active:integer;
    Sq:string; //SQL - строка для IBQuery2
    FN1, FI1: string; // Имя файла и идентификатор
                      // Получает от клиента, содержит то, что клиент скачал
    strok1:string; // Временная переменная
    CLID, fll1:integer;
    client:TTcpSrvClient;
    fl_u1, fl_u2:integer; // Флаги проверки наличия обновлений
    ftp_path111:string; // Строка для создания каталогов при назедении нового плеера
begin
    with Sender as TTcpSrvClient do begin
        // Используем line mode, стоки должны заканчиваться #13, #10
        RcvdLine := ReceiveStr;
        { Remove trailing CR/LF }

        while (Length(RcvdLine) > 0) and
              (RcvdLine[Length(RcvdLine)] in [#13, #10]) do
            RcvdLine := Copy(RcvdLine, 1, Length(RcvdLine) - 1);

        memo3.lines.Append('Получено от ' + GetPeerAddr + ': ' + RcvdLine );
        Unit4.Form4.RichEdit1.Lines.Append(DateToStr(Now)+' '+timetostr(now)+' Get form ' + GetPeerAddr + ': ' + RcvdLine );

        ProcessData(Sender as TTcpSrvClient); // получив строку стартуем процедуру обработки
      end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
//                Процедура обработки входящих строк
{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TForm1.ProcessData(Client : TTcpSrvClient);
var
    I       : Integer;
    AClient : TTcpSrvClient;
      ClName, Client_ID, Client_Zaproz, Client_Version, Client_Gets:string;
    J, j11:integer; //№  позиции по пришедшей строке
    f1,str1,res1, ftp_path111:string;
    Str_GETS, Str_Part, Str_Part1,CL_Type, Part2 : string;

    J1, SIZ1:integer; // Счетчик имен в БД
    CL_ID, NUM_ZAK, bt_ZAK, CL_Active:integer;
    Sq:string; //SQL - строка для IBQuery2
    FN1, FI1: string; // Имя файла и идентификатор
                      // Получает от клиента, содержит то, что клиент скачал
    strok1:string; // Временная переменная
    CLID, fll1:integer;
    //client:TTcpSrvClient;
    fl_u1, fl_u2:integer; // Флаги проверки наличия обновлений

begin

    // Начинаем исследовать входящую строку

    Str_GETS:=Client.RcvdLine; //
    Str_Part:= Copy(Str_GETS, 1, 6); // Вынимаем из нее 6 символов в поиске %name%


{ %NAME% }
// Вылавливаем наличие строки приветствия от клиента
    if CompareText(Str_Part, '%name%') = 0 then
            begin
             Client.SendStr('GETNAME'+#13#10); // Отсылаем клиенту строку - подтверждение соединения
             //Процедура GetZnak вытаскивает слова из потока
             //1й параметр - № начальной позиции для поиска
             //2й параметр - № конечной позиции поиска
             //3й параметр - Строка в которой производится поиск
             //4й параметр - Найденая cтрока (Текстовая переменная)
             //5й параметр - Позиция на которой найден % (т.е. след. поиск начинать с этой позиции +1)

             // Необходимо вытащить имя клиента и его тип
              GetZnak (7,Length(Str_GETS),Str_GETS, ClName, J);
               j11:=7+length(ClName)+1;
               GetZnak (j11,Length(Str_GETS),Str_GETS, CLType, J);

               {
               memo3.Lines.Append(CLName);
               memo3.Lines.Append(CLType);
               memo3.Lines.Append(inttostr(j11));
                }

              //Логируем данные в файл
                  f1:=ExtractFilePath(Application.EXEName)+'logs\'+ClName + '.log';
                  str1:=DateToStr(Now)+' '+timetostr(now)+' Клиент вышел на связь';
                  STL (f1,str1,res1);


              // Получив имя необходимо проверить его наличие в БД,
              IBQuery1.ParamByName('Name').AsString:=ClName;
              IBQuery1.Close;
              IBQuery1.Open;
              J1:=0;
               IBQuery1.First;
               // Если такое имя отсутствует - внести новую запись
               if IBQuery1.Eof then
                        begin
                           IBQuery2.SQL.Clear;
                            Sq:='insert into NAME_CONNECTION  (IP_ADR, NAME, OPISANIE, UIN, CLIENT_ACTIV, CLIENT_TYPE) VALUES (:ADR,:Name,"",0,0,:CLType)';
                            IBQuery2.SQL.Append(Sq);
                            IBQuery2.ParamByName('Name').AsString:=ClName;
                            IBQuery2.ParamByName('ADR').AsString:=Client.GetPeerAddr;
                            IBQuery2.ParamByName('CLType').AsString:=CLType;
                            IBQuery2.Close;
                            IBQuery2.Open;
                            dat1.DataModule2.IBTransaction1.CommitRetaining;

                            //Логируем данные в файл
                            f1:=ExtractFilePath(Application.EXEName)+'\logs\'+ClName + '.log';
                            str1:=DateToStr(Now)+' '+timetostr(now)+' Новая запись имени добавлена. IP:'+Client.GetPeerAddr;
                            STL (f1,str1,res1);

                            // Проверяем наличие каталогов на FTP для клиента, во избежании недоразумений с передачей данных
                              // проверяем наличие каталога для логов клиента
                              ftp_path111:=SUKserv.ftp_Param3+'\'+ClName+'\log\';
                              if not DirectoryExists(ftp_path111) then
                                 begin
                                  if ForceDirectories(ftp_path111) then
                                                            begin
                                                             // Дирректория уже существует
                                                            end
                                             else ShowMessage('Создание нового каталога прошло неудачно и вызвало ошибку : '+
                                                  IntToStr(GetLastError));
                                  end; //if not DirectoryExists ...

                              // проверяем наличие каталога для плейлиста клиента
                              ftp_path111:=SUKserv.ftp_Param3+'\'+ClName+'\outlist\';
                              if not DirectoryExists(ftp_path111) then
                                 begin
                                  if ForceDirectories(ftp_path111) then
                                                            begin
                                                             // Дирректория уже существует
                                                            end
                                             else ShowMessage('Создание нового каталога прошло неудачно и вызвало ошибку : '+
                                                  IntToStr(GetLastError));
                                  end; //if not DirectoryExists ...

                              // проверяем наличие каталога для софта клиента
                              ftp_path111:=SUKserv.ftp_Param3+'\'+ClName+'\outsoft\';
                              if not DirectoryExists(ftp_path111) then
                                 begin
                                  if ForceDirectories(ftp_path111) then
                                                            begin
                                                             // Дирректория уже существует
                                                            end
                                             else ShowMessage('Создание нового каталога прошло неудачно и вызвало ошибку : '+
                                                  IntToStr(GetLastError));
                                  end; //if not DirectoryExists ...
                               // Закончили проверку целостности каталогов клиента
                                                               // Новый клиент по определению не определен - выкючаем сеанс связи
                                                               Client.SendStr('%OO%' + #13#10); // Обновления отсутствуют
                                                               Form4.RichEdit1.Lines.Append('to Client : %OO%');
                                                               Client.Close;
                           end //if IBQuery1.Eof ...
                           else
                              begin
                               // Если данная запись о клиенте уже существует:
                               // Вносим запись даты последнего визита
                               IBQuery8.SQL.Clear;
                               Sq:='update NAME_CONNECTION set DATE_CONNECT=:DATE_CONNECT where NAME=:Name';
                               IBQuery8.SQL.Append(Sq);
                               IBQuery8.ParamByName('Name').AsString:=ClName;
                               IBQuery8.ParamByName('DATE_CONNECT').AsDateTime:=now;
                               IBQuery8.Close;
                               IBQuery8.Open;
                               dat1.DataModule2.IBTransaction1.CommitRetaining;


                                // Вносим новую запись с текущим IP-адресом клиента
                                 IBQuery2.SQL.Clear;
                                 Sq:='update NAME_CONNECTION set IP_ADR=:ADR where NAME=:Name';
                                 IBQuery2.SQL.Append(Sq);
                                 IBQuery2.ParamByName('Name').AsString:=ClName;
                                 IBQuery2.ParamByName('ADR').AsString:=Client.GetPeerAddr;
                                 IBQuery2.Close;
                                 IBQuery2.Open;
                                 dat1.DataModule2.IBTransaction1.CommitRetaining;

                                  //Логируем данные в файл
                                  f1:=ExtractFilePath(Application.EXEName)+'logs\'+ClName + '.log';
                                  str1:=DateToStr(Now)+' '+timetostr(now)+' IP адрес - '+Client.GetPeerAddr+' обновлен в БД';
                                  STL (f1,str1,res1);

                                end; // конец else - обработки уже существующего клиента


            end // if CompareText(Str_Part, '%name%') = 0
            else
{КОНЕЦ ОБРАБОТКИ  %NAME% }



{ %oooN% }
// Обрабатываем запрос на наличие обновлений для клиента
      if CompareText(Str_Part, '%oooN%') = 0 then
            begin
              // Находим имя клиента
              GetZnak (7,Length(Str_GETS),Str_GETS, ClName, J);

              // Проверяем наличие и качество обновления
              // Проверяем наличие записей в плейлисте

              // По имени находим идентификатор клиента, активен ли клиент и тип клиента
              Sq:='select * from NAME_CONNECTION where NAME=:NAME';
              IBQuery3.SQL.Clear;
              IBQuery3.SQL.Append (Sq);
              IBQuery3.ParamByName('NAME').AsString:=ClName;
              IBQuery3.Close;
              IBQuery3.Open;
              IBQuery3.First;
              If not IBQuery3.Eof then
                               begin
                                  CL_ID:=IBQuery3ID.AsInteger; // Находим идентификатор клиента
                                  CL_Active:=IBQuery3CLIENT_ACTIV.asInteger; // Флаг активности клиента
                                  CL_Type:=IBQuery3CLIENT_TYPE.asString; // Тип клиента
                                end;

              // Если плеер активный и тип плеер - pleer
              
              if  CL_Active=1 then
                                begin
                                // проверяем наличие нового плейлист
                                  if  CL_Type='pleer' then
                                                       begin
                                                         // По идентификатору клиента находим в таблице PLAYER_ZAD задачи на обновление
                                                         sq:='select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
                                                         IBQuery4.SQL.Clear;
                                                         IBQuery4.SQL.Append(sq);
                                                         IBQuery4.ParamByName('ID_PLAYER').AsInteger:=CL_ID;
                                                         IBQuery4.Close;
                                                         IBQuery4.Open;
                                                         IBQuery4.First;

                                                        fl_u1:=1;
                                                        If not IBQuery4.Eof then
                                                                  begin
                                                                      // Если список обновлений для клиента не пуст - кидаем ему ответ
                                                                      Client.SendStr('UPD=1' + #13#10); // Имеются обновления плейлиста
                                                                      Form4.RichEdit1.Lines.Append('to Client : UPD=1');
                                                                      fl_u1:=2;
                                                                  end; // If not IBQuery4.Eof

                                                        if fl_u1=1 then
                                                         begin
                                                        // Проверяем на наличие прочих обновлений
                                                        // Прочие обновления ищем в таблице ZAD_PO_PLEER
                                                        sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID and FILE_STATUS=:FILE_STATUS';
                                                        IBQuery9.SQL.Clear;
                                                        IBQuery9.SQL.Append(sq);
                                                        IBQuery9.ParamByName('PLAYER_ID').AsInteger:=CL_ID;
                                                        IBQuery9.ParamByName('FILE_STATUS').AsInteger:=0;
                                                        IBQuery9.Close;
                                                        IBQuery9.Open;
                                                        IBQuery9.First;
                                                          If not IBQuery9.Eof then
                                                             begin
                                                              // Если список обновлений для клиента не пуст - кидаем ему ответ
                                                              Client.SendStr('UPD=2' + #13#10); // Имеются обновления плейлиста
                                                               Form4.RichEdit1.Lines.Append('to Client : UPD=2');
                                                              fl_u1:=2;
                                                             end; // If not IBQuery9.Eof then ...
                                                          end; // if fl_u1=1 then ...

                                                          if fl_u1=1 then
                                                              begin
                                                               // Если прочих обновлений нет - высылаем ответ
                                                               Client.SendStr('%OO%' + #13#10); // Обновления отсутствуют
                                                               Form4.RichEdit1.Lines.Append('to Client : %OO%');
                                                               Client.Close;
                                                              end;
                                           end; // if  CL_Type='pleer' then
                                end  // if  CL_Active=1 then
                                else begin
                                      // Клиент не является активным - выключение
                                                                // Новый клиент по определению не определен - выкючаем сеанс связи
                                                               Client.SendStr('%OO%' + #13#10); // Обновления отсутствуют
                                                               Form4.RichEdit1.Lines.Append('to Client : %OO%');
                                                               Client.Close;
                                     end;
            end // if CompareText(Str_Part, '%oooN%') = 0 then
            else
{  %oooN%  }
{Окончание обработки запроса на наличие обновлений для клиента}



{  %oooP%  }
//Если от клиента пришел запрос - способ обновления плейлиста
      if CompareText(Str_Part, '%oooP%') = 0 then
                                   begin
                                 // Находим имя клиента
                                   GetZnak (7,Length(Str_GETS),Str_GETS, Str_Part1, J);
                                   ClName:=Str_Part1;  // Содержит имя клиента
                                   j11:=7+length(ClName)+1;
                                   GetZnak (j11,Length(Str_GETS),Str_GETS, Str_Part1, J);
                                   part2:=Str_Part1; // Содержит уточнения к запросу обновления
                                   Unit4.Form4.RichEdit1.Lines.Append(DateToStr(Now)+' '+Str_Part1 );
                                   // По имени находим идентификатор клиента
                                   Sq:='select * from NAME_CONNECTION where NAME=:NAME';
                                   IBQuery3.SQL.Clear;
                                   IBQuery3.SQL.Append (Sq);
                                   IBQuery3.ParamByName('NAME').AsString:=ClName;
                                   IBQuery3.Close;
                                   IBQuery3.Open;
                                   IBQuery3.First;
                                   If not IBQuery3.Eof then
                                        begin
                                          CL_ID:=IBQuery3ID.AsInteger; // Находим идентификатор клиента
                                          CL_Active:=IBQuery3CLIENT_ACTIV.asInteger; // Флаг активности клиента
                                          CL_Type:=IBQuery3CLIENT_TYPE.asString; // Тип клиента
                                         end;
                              // Если клиент активирован и тип его - плеер - то приступаем к работе
                            if ((CL_Active=1)and(CL_Type='pleer')) then
                             begin

                              if  part2='MU' then client.SendStr('FTP=1' + #13#10);    // 1 - закачиваем файл по FTP
                                                                                       // 0 - закачиваем файл другим методом

                              // Для плейлиста запрашиваем кол-во файлов и их размер
                              if  part2='NM' then
                                               begin
                                                 sq:='select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
                                                 IBQuery4.SQL.Clear;
                                                 IBQuery4.SQL.Append(sq);
                                                 IBQuery4.ParamByName('ID_PLAYER').AsInteger:=CL_ID;
                                                 IBQuery4.Close;
                                                 IBQuery4.Open;
                                                 IBQuery4.First;
                                                 j1:=0;
                                                 SIZ1:=0;
                                                 While not IBQuery4.Eof do
                                                    begin
                                                     SIZ1:=SIZ1+IBQuery4SIZE_FILE.AsInteger;
                                                     j1:=j1+1;
                                                     IBQuery4.Next;
                                                    end;  // While not IBQuery4.Eof do ...


                                               if j1>0 then client.SendStr('%NM%'+inttostr(j1)+'%'+inttostr(SIZ1)+'%'+ #13#10)
                                                       else  begin
                                                               client.SendStr('%OO%'+ #13#10);
                                                               Client.CloseDelayed;
                                                             end;
                                             end; // if  part2='NM' then...

                              // Для обновлений клиента запрашиваем кол-во файлов и их размер
                              if  part2='U1' then
                                               begin

                                                 j1:=0;
                                                 SIZ1:=0;
                                                 sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID and FILE_STATUS=:FILE_STATUS';
                                                 IBQuery9.SQL.Clear;
                                                 IBQuery9.SQL.Append(sq);
                                                 IBQuery9.ParamByName('PLAYER_ID').AsInteger:=CL_ID;
                                                 IBQuery9.ParamByName('FILE_STATUS').AsInteger:=0;
                                                 IBQuery9.Close;
                                                 IBQuery9.Open;
                                                 IBQuery9.First;
                                                 While not IBQuery9.Eof do
                                                    begin
                                                     SIZ1:=SIZ1+IBQuery9FILE_DOWNLOAD.AsInteger;
                                                     j1:=j1+1;
                                                     IBQuery9.Next;
                                                    end;  // While not IBQuery9.Eof do ...


                                               if j1>0 then client.SendStr('%2U%'+inttostr(j1)+'%'+inttostr(SIZ1)+'%'+ #13#10)
                                                       else  begin
                                                              client.SendStr('%OO%'+ #13#10);
                                                              Client.Close;
                                                             end;
                                             end; // if  part2='U1' then...


                              // Обработка запросов параметров FTP - сервера
                              if  part2='FT' then
                                               begin
                                                 client.SendStr('%FT%'+ftp_param4+'%'+ftp_pass+'%'+ftp_log+'%' + #13#10)
                                               end; // if  part2='FT' then...


                              // Запрос на закачку файла из плейлиста
                              if  part2='GF' then
                                               begin
                                                 sq:='select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
                                                 IBQuery4.SQL.Clear;
                                                 IBQuery4.SQL.Append(sq);
                                                 IBQuery4.ParamByName('ID_PLAYER').AsInteger:=CL_ID;
                                                 IBQuery4.Close;
                                                 IBQuery4.Open;
                                                 IBQuery4.First;
                                                 if not IBQuery4.Eof then client.SendStr('%GF%'+IBQuery4NAME_FILE.asString+'%'+inttostr(IBQuery4ID.asInteger)+'%'+ #13#10)
                                                                     else begin
                                                                           client.SendStr('%OO%'+#13#10);
                                                                           Client.CloseDelayed;
                                                                          end;

                                               end; // if  part2='GF' then...


                              // Запрос на закачку файла из обновлений софта на плеер
                              if  part2='3U' then
                                               begin
                                                 sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID and FILE_STATUS=:FILE_STATUS';
                                                 IBQuery9.SQL.Clear;
                                                 IBQuery9.SQL.Append(sq);
                                                 IBQuery9.ParamByName('PLAYER_ID').AsInteger:=CL_ID;
                                                 IBQuery9.ParamByName('FILE_STATUS').AsInteger:=0;
                                                 IBQuery9.Close;
                                                 IBQuery9.Open;
                                                 IBQuery9.First;

                                                 if not IBQuery9.Eof then client.SendStr('%3U%'+IBQuery9FILE_TO_UPDATE.asString+'%'+inttostr(IBQuery9ID.asInteger)+'%'+ #13#10)
                                                                     else begin
                                                                            client.SendStr('%OO%'+#13#10);
                                                                            Client.Close;
                                                                          end;
                                               end; // if  part2='2U' then...



                              // Клиент файл закачал, начинаем корректировку базы
                              if  part2='FG' then
                                             begin
                                               // вычисляем имя файла и его идентификатор
                                                        j11:=j11+3;
                                                        GetZnak (j11,Length(Str_GETS),Str_GETS, Str_Part1, J);
                                                        FN1:=Str_Part1; // Содержит имя файла
                                                        j11:=j11+1+length(FN1);
                                                        GetZnak (j11,Length(Str_GETS),Str_GETS, Str_Part1, J);
                                                        FI1:=Str_Part1; // Содержит идентификатор файла
                                                         // Удаляем файл FI1 с фтп
                                                         strok1:=ExtractFilePath(Application.EXEName)+'FTP-SERV\'+CLname+'\outlist\'+FN1;
                                                         Deletefile (strok1);

                                                         // Изменяем параметры в БД
                                                         // ИЗ PLAYER_ZAD удаляем по параметру FI1 - ID-закачки
                                                         sq:='delete from PLAYER_ZAD where ID=:ID';
                                                         IBQuery5.SQL.Clear;
                                                         IBQuery5.SQL.Append(sq);
                                                         IBQuery5.ParamByName('ID').AsInteger:=strtoint(FI1);
                                                         IBQuery5.Close;
                                                         IBQuery5.Open;

                                                       //Меняем в таблице PLAYLIST по выборке ID_PLAYER и NAME_FILE
                                                       //поле LOC с 2 на 1, (локальность контента)

                                                       sq:='update PLAYLIST set LOC=:LOC where ID_PLAYER=:ID_PLAYER and NAME_FILE=:NAME_FILE';
                                                       IBQuery7.SQL.Clear;
                                                       IBQuery7.SQL.Append(sq);
                                                       IBQuery7.ParamByName('LOC').AsInteger:=1;
                                                       IBQuery7.ParamByName('ID_PLAYER').AsInteger:=CL_ID;
                                                       IBQuery7.ParamByName('NAME_FILE').AsString:=FN1;
                                                       IBQuery7.Close;
                                                       IBQuery7.Open;
                                                       dat1.DataModule2.IBTransaction1.CommitRetaining;

                                                       client.SendStr('%FG%'+ #13#10); // Отсылаем клиенту сообщение о том, что данные о закачаном файле учтены

                                                       IBQuery7.Close;
                                                       IBQuery7.Open;
                                                       dat1.DataModule2.IBTransaction1.CommitRetaining;
                                              end; //if  part2='FG' then

                             // Клиент файл для обновления софта закачал
                             // Вносим изменения в базу
                                if  part2='U3' then
                                                        begin
                                                       // вычисляем имя файла и его идентификатор
                                                       j11:=j11+3;
                                                       GetZnak (j11,Length(Str_GETS),Str_GETS, Str_Part1, J);
                                                       FN1:=Str_Part1; // Содержит имя файла
                                                       j11:=j11+1+length(FN1);
                                                       GetZnak (j11,Length(Str_GETS),Str_GETS, Str_Part1, J);
                                                       FI1:=Str_Part1; // Содержит идентификатор файла

                                                       // Удаляем файл FI1 с фтп
                                                           {
                                                        strok1:=GetCurrentDir+'\FTP-SERV\'+CLname+'\outsoft\'+FN1;
                                                        Deletefile (strok1);
                                                        memo2.Lines.Append(strok1);
                                                           }

                                                       // Изменяем параметры в БД

                                                      //Меняем в таблице ZAD_PO_PLEER по выборке ИД-плеера и имени скаченного файла
                                                      //поле FILE_STATUS с 2 на 1, (локальность контента)
                                                       sq:='update ZAD_PO_PLEER set FILE_STATUS=:FILE_STATUS where PLAYER_ID=:PLAYER_ID and FILE_TO_UPDATE=:FILE_TO_UPDATE';
                                                       IBQuery10.SQL.Clear;
                                                       IBQuery10.SQL.Append(sq);
                                                       IBQuery10.ParamByName('FILE_STATUS').AsInteger:=1;
                                                       IBQuery10.ParamByName('PLAYER_ID').AsInteger:=CL_ID;
                                                       IBQuery10.ParamByName('FILE_TO_UPDATE').AsString:=FN1;
                                                       IBQuery10.Close;
                                                       IBQuery10.Open;
                                                       dat1.DataModule2.IBTransaction1.CommitRetaining;

                                                        client.SendStr('%U3%'+ #13#10); // Отсылаем клиенту сообщение о том, что данные о закачаном файле учтены
                                                        memo3.Lines.Append('to Client: %U3%');


                                                     // Проверим, есть ли еще обновления для данного клиента
                                                    { sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID and FILE_STATUS=:FILE_STATUS';
                                                     IBQuery9.SQL.Clear;
                                                     IBQuery9.SQL.Append(sq);
                                                     IBQuery9.ParamByName('PLAYER_ID').AsInteger:=CLID;
                                                     IBQuery9.ParamByName('FILE_STATUS').AsInteger:=0;
                                                     IBQuery9.Close;
                                                     IBQuery9.Open;
                                                     IBQuery9.First;
                                                     if IBQuery9.Eof=false then
                                                               begin
                                                                  client.SendStr('%3U%'+ #13#10); // Отсылаем клиенту сообщение о том, что данные о закачаном файле учтены
                                                                  memo3.Lines.Append('to Client: %3U%');
                                                               end else begin
                                                                          client.SendStr('%OO%'+ #13#10); // Отсылаем клиенту сообщение о том, что данные о закачаном файле учтены
                                                                          memo3.Lines.Append('to Client: %OO%');
                                                                        end;
                                                    }
                                    end; //   if  part2='3U' then ...

                             end; //if ((CL_Active=1)and(CL_Type='pleer')) then...


            end // if CompareText(Str_Part, '%oooP%') = 0 then ...
            else begin
                    client.SendStr('%OO%'+ #13#10);
                    Client.CloseDelayed;
                 end;

end;


//Процедура логирования данных
//FName1 - путь+имя файла
//STR_tolog - строка которую необходимо записать
//result - строка ответа работы процедуры


procedure TForm1.STL (FName1, STR_tolog: string;
                          Var strok:String);
var
   falo:textfile;
Begin
  AssignFile (falo,FName1);
    {$I-}
     Reset(falo);
     if IOResult <> 0  then
         begin
          // Если файл не существует создаем его
          rewrite (falo);
          strok:=FName1+'- Файл создан';
         end;
  CloseFile(falo);
  AssignFile (falo,FName1);
  Append(falo);
  Writeln(falo,STR_tolog);
  CloseFile(falo);
  strok:=FName1+'- Запись в лог завершена';
End;



//Процедуры вылавливания из пришедшей строки значимых выражений
//По условленному протоколу разделителем в строке является '%'
procedure TForm1.GetZnak (Star_Pos, End_Pos: integer;
                          STR:string;
                          Var NEWSTR:String;
                              NEW_START:integer);
Var i: integer;
Begin

  NEWSTR:='';
  i:=Star_Pos;
  while i<=End_Pos do
   begin
     if  STR[i]<>'%' then NEWSTR:=NEWSTR+STR[i]
                     else begin
                           NEW_START:=i;
                           i:=End_Pos;
                           end;
   i:=i+1;
   end;

End;

//Как я понимаю, данное событие возникает в том случае, когда
//клиент висит и от него не поступает данных
//Соответственно происходит отвал клиента                                                  }
procedure TForm1.ClientBgException(
    Sender       : TObject;
    E            : Exception;
    var CanClose : Boolean);
begin
   // Display('Client exception occured: ' + E.ClassName + ': ' + E.Message);
    CanClose := TRUE;   //Отключаем клиента
end;


procedure TForm1.Button3Click(Sender: TObject);
var f:textfile;
    i:string;
begin
 //Подгружаем настройки
 UPD_Serv_LOCIP:=sc_param1;
 UPD_SERV_LOCPORT:=sc_param2;
 UPD_SERV_LINE:=sc_param3;
 UPD_SERV_SCR:=sc_param4;
 try
       if WSocketServer1.State = wsClosed then
       begin
         {Первоначальные настройки ica}
         // в принципе можно брать из настроек компонента
         // но для этого необходима небольшая конструкция.
         WSocketServer1.Addr := UPD_Serv_LOCIP;
         WSocketServer1.Port := UPD_SERV_LOCPORT;
         WSocketServer1.ClientClass := TTcpSrvClient;
         WSocketServer1.Listen ;
         UPDT_Status:='Online';
       end;

   except
   end;


end;







procedure TForm1.IdTCPServer1AfterCommandHandler(ASender: TIdTCPServer;
  AThread: TIdPeerThread);
begin
memo1.Lines.append(idTCPServer1.CommandHandlers.GetNamePath);
end;

procedure TForm1.Updater1Click(Sender: TObject);
begin
Form4.show;
end;

procedure TForm1.FormCreate(Sender: TObject);
var F1: textfile;
    ge1, ge2: string;
    I:integer;
begin
// Если необходимо - загружаем окно ввода логина и пароля
// и только после этого открываем доступ

    path_to_exe:=ExtractFilePath(Application.EXEName);
    GreenImage1.Visible   := FALSE;
    RedImage1.Visible     := TRUE;
// Грузим сервисную информацию из файла
  ge1:=ExtractFilePath(Application.EXEName)+'prof\ftp.ini';
  AssignFile (F1, ge1);
  Reset (F1);
  Readln (F1,ge2);
  If ge2='1' then ftp_param1:='1'
             else ftp_param1:='0';
  Readln (F1,ge2);
  If ge2='1' then ftp_param2:='1'
             else ftp_param2:='0';
  Readln (F1,ge2);
  if length(ge2)<1 then ftp_param3:=ExtractFilePath(Application.EXEName)+'FTP-SERV'
                   else ftp_param3:=ge2;

  Readln (F1,ge2);
  if length(ge2)<1 then ftp_param4:='ftp'
                   else ftp_param4:=ge2;
  Readln (F1,ge2);
  If ge2='Auto' then ftp_param5:='1'
                else ftp_param5:='0';
  Readln (F1,ge2);
  if length(ge2)<1    then ftp_param6:='127.0.0.1'
                      else ftp_param6:=ge2;

  Readln (F1,ftp_log);
  Readln (f1, ftp_pass);

  CloseFile (F1);

  //Вносим данные в настройку сервера:

   // Настройка, влияющая на то, может ли пользователь фтп выйти на
   // верхний уровень каталогов (из домашнего каталога);
    if ftp_param1='1' then
    begin

        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options + [ftpsCdUpHome];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options + [ftpCdUpHome];
    end
    else begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options - [ftpsCdUpHome];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options - [ftpCdUpHome];
    end;

  // Настройка фтп, скрывающая физический путь
      if ftp_param2='1' then
    begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options + [ftpsHidePhysicalPath];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options + [ftpHidePhysicalPath];
    end
    else begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options - [ftpsHidePhysicalPath];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := FtpServer1.Client[I].Options - [ftpHidePhysicalPath];
    end;

    FtpServer1.Port:=ftp_param4;
    FtpServer1.Addr:=ftp_param6;


// Теперь считаем данные для настройки Socket-Server:
   ge1:=GetCurrentDir+'\updserv.ini';
 AssignFile (f1,ge1);
 Reset (f1);
 Readln (f1,sc_param1); // IP - адрес сервера

 Readln (f1,sc_param2); // Порт сервера

 Readln (f1,sc_param3); // Line Limit

 Readln (f1,sc_param4); //Путь до скрипта

 Readln (f1,sc_param5); // AutoStart

CloseFile(f1);
// Вносим данные в параметры сервера
WSocketServer1.LocalAddr:=sc_param1;
WSocketServer1.LocalPort:=sc_param2;
//WSocketServer1.Banner:='Welcome to Studio911' + #13#10;
//WSocketServer1.LineLimit:=strtoint(sc_param3);


//Dat1.DataModule2.IBDatabase1.Connected:=true;

//Закрываем все кнопки
SpeedButton1.Enabled:=false;
SpeedButton2.Enabled:=false;
SpeedButton3.Enabled:=false;
MainMenu1.Items.Items[3].Enabled:=false;


end;

procedure TForm1.FTP1Click(Sender: TObject);
begin
//FTPServer1.Start;
Form9.Caption:='СУК - Контроль FTP - Сервера';
Form9.show;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin

   //Проверяем на дату
If now >strtodate('26.12.2008') then begin
                                        ftp_param5:='0';
                                        sc_param5:='0';
                                        //ftp_param1:='0';
                                        //ftp_param2:='0';
                                        GreenImage1.Visible   := FALSE;
                                        RedImage1.Visible     := TRUE;
                                        GreenImage2.Visible   := FALSE;
                                        RedImage2.Visible     := TRUE;
                                        UPDT_Status:='Offline';
                                     end;




        //Проверка на автозапуск FTP
        if ftp_param5='1' then
         begin
       // Запускаем FTP - Сервер
          if FtpServer1.Active=false then
                                     begin
                                        StartServer;
                                     end;
               GreenImage1.Visible := True;
               RedImage1.Visible   := False;
        end;

        // Проверка автозапуска Socket-server
        if sc_param5='1' then
          begin
           Form1.Button3Click(Sender);
           label2.Caption:=SUKserv.UPDT_Status;
           GreenImage2.Visible := True;
           RedImage2.Visible   := False;
          end else
              begin
                GreenImage2.Visible := False;
                RedImage2.Visible   := True;
              end;


  // Отрисовываем светофоры


 if (UPDT_Status='Online') then
          begin
           GreenImage2.Visible := True;
           RedImage2.Visible   := False;
          end else
              begin
                GreenImage2.Visible := False;
                RedImage2.Visible   := True;
              end;

  if FtpServer1.Active=false then
          begin
               GreenImage1.Visible := False;
               RedImage1.Visible   := True;
          end;
  



end;

procedure TForm1.N8Click(Sender: TObject);
begin
CoolTrayIcon1.ShowMainForm;
end;

procedure TForm1.CoolTrayIcon1DblClick(Sender: TObject);
begin
CoolTrayIcon1.ShowMainForm;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
Form5.showmodal;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Form4.show;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
Form9.Caption:='СУК - Контроль FTP - Сервера';
Form9.show;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Form12.showmodal;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Form12.showmodal;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   //Проверяем на дату
If now >strtodate('26.12.2008') then begin
                                        ftp_param5:='0';
                                        sc_param5:='0';
                                        GreenImage1.Visible   := FALSE;
                                        RedImage1.Visible     := TRUE;
                                        GreenImage2.Visible   := FALSE;
                                        RedImage2.Visible     := TRUE;
                                        UPDT_Status:='Offline';
                                    end;


   //Проверяем на дату
If now >strtodate('20.01.2009') then begin
                                       SUKserv.Form1.Close;
                                     end;


end;

end.
