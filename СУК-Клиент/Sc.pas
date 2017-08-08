unit Sc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Sockets, IdIntercept, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdIOHandler, IdIOHandlerStream,
  OverbyteIcsWndControl, OverbyteIcsWSocket, ComCtrls, ExtCtrls, Mask,
  Buttons, Menus, CheckLst, FileCtrl, OverbyteIcsFtpCli,
  OverbyteIcsMultipartFtpDownloader, shellAPI, IBDatabase, DB, IB, thrd2, WinSvc,
  IBCustomDataSet, IBQuery, Tlhelp32, CoolTrayIcon, ShlObj;

type
  TSyncCmd   = function : Boolean  of object;
  TAsyncCmd  = procedure of object;
  TFtpBigInt = {$IFDEF STREAM64} Int64 {$ELSE} Longint {$ENDIF};

  TForm1 = class(TForm)
    IdTCPClient1: TIdTCPClient;
    Button3: TButton;
    WSocket1: TWSocket;
    Button4: TButton;
    StatusBar1: TStatusBar;
    IdConnectionIntercept1: TIdConnectionIntercept;
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Edit3: TEdit;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    CheckListBox1: TCheckListBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    N2: TMenuItem;
    SpeedButton2: TSpeedButton;
    Memo2: TMemo;
    Memo3: TMemo;
    SpeedButton3: TSpeedButton;
    Edit6: TEdit;
    Label6: TLabel;
    LogMemo: TMemo;
    Timer2: TTimer;
    Label7: TLabel;
    Image1: TImage;
    Image2: TImage;
    GreenIMG: TImage;
    RedIMG: TImage;
    Edit7: TEdit;
    Edit8: TEdit;
    FtpClient1: TFtpClient;
    MPFtp: TMultipartFtpDownloader;
    Timer3: TTimer;
    SpeedButton4: TSpeedButton;
    StartFBTimer: TTimer;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    SpeedButton5: TSpeedButton;
    Button6: TButton;
    IBQuery1: TIBQuery;
    SpeedButton6: TSpeedButton;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    CoolTrayIcon1: TCoolTrayIcon;
    Timer4: TTimer;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    N5: TMenuItem;
    Timer5: TTimer;
    Label15: TLabel;
    ListBox1: TListBox;
    ResTimer1: TTimer;
    SendBox: TListBox;
    SendTimer: TTimer;
    Label17: TLabel;
    Label18: TLabel;
    TimerSEE: TTimer;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure WSocket1SessionConnected(Sender: TObject; ErrCode: Word);
    procedure WSocket1SessionClosed(Sender: TObject; ErrCode: Word);
    procedure Button5Click(Sender: TObject);
    procedure WSocket1DataAvailable(Sender: TObject; ErrCode: Word);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ConnectToServ(Sender: TObject); // Процедура установки соединения с сервером
    procedure sendproc(Sender: TObject);
    procedure StartFTP (ftp_name, ftp_log, ftp_pas:string);
    procedure GetFromFTP(file_ftp, id_ftp, ftp_name, ftp_log, ftp_pas:string;
                            var get:boolean);
    procedure puttoFTP();

     procedure GetZnak (Star_Pos, End_Pos: integer;
                          STR:string;
                          Var NEWSTR:String;
                              NEW_START:integer);

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ExecuteCmd(SyncCmd : TSyncCmd; ASyncCmd : TAsyncCmd);
    procedure MPFtpRequestDone(Sender: TObject; ErrorCode: Integer;
      const Reason: String);
    procedure FtpClient1SessionClosed(Sender: TObject; ErrCode: Word);
    procedure Timer3Timer(Sender: TObject);
    procedure FtpClient1RequestDone(Sender: TObject; RqType: TFtpRequest;
      ErrCode: Word);
    procedure FtpClient1SessionConnected(Sender: TObject; ErrCode: Word);
    procedure FtpClient1Progress(Sender: TObject; Count: Integer;
      var Abort: Boolean);
    procedure SpeedButton4Click(Sender: TObject);
    procedure StartFBTimerTimer(Sender: TObject);
    procedure IBDatabase1AfterConnect(Sender: TObject);
    procedure IBDatabase1AfterDisconnect(Sender: TObject);
    procedure WSocket1Error(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure CoolTrayIcon1Startup(Sender: TObject;
      var ShowMainForm: Boolean);
    procedure Button6Click(Sender: TObject);
    procedure ProcessData (Sender: TObject; STR_RcvdLine: string);
    procedure Timer4Timer(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure ResTimer1Timer(Sender: TObject);
    procedure SendTimerTimer(Sender: TObject);
    procedure FtpClient1Error(Sender: TObject; var Msg: String);
    procedure TimerSEETimer(Sender: TObject);



  private
    { Private declarations }
    FProgressCount : TFtpBigInt;
    FLastProgress  : DWORD;
  public
    Thread1: TSimpleThread;
    { Public declarations }
  end;

const
 MONITOR_ON = -1;
 MONITOR_OFF = 2;
 CSIDL_COMMON_MUSIC  = $35;


var
  Form1: TForm1;
  // Массив содержит время запуска плеера, время его остановки
  // от 1 до 7 в соответствии с днями недели
  // + массив присутствия
  start_pleer, stop_pleer, check_pleer:array[1..7] of string;
  ip_server, port_server, name_client, type_client, local_path:string;
  speed_upd,sp_upd: integer;
  Steps:integer;
  port_FTP, pass_FTP, log_FTP:string; // Параметры FTP - соединения
  FN,FI: string; // Имя файла для забора с FTP и его идентификатор
  FLAG_CONNECT:integer; // Флаг наличия соединения с сервером
  Flag_FTP:integer; // Флаг активности ФТП
  UPD_FLAG:integer; // Флаг типа имеющегося обновления
                    // UPD_FLAG=1 - обновление плейлиста
                    // UPD_FLAG=2 - обновления софта на плеере
                    // UPD_FLAG=0 - обновления отсутствуют
  PI_FTP: integer;
  l_soft: array [1..100] of String; // Массив имен файлов для обновления софта
  phi1: integer;
  FLAG_DB_CONNECT: integer; // Флаг активности подключения к БД
                            // FLAG_DB_CONNECT:=0; - подключение отсутствует
                            // FLAG_DB_CONNECT:=1; - подключение присутствует
  Flag_WORK_thrd:integer; // Флаг занятости thrd2
  PLAYER_STARTED:integer; // Флаг запуска плеера
                          // 0 - плеер не запущен
                          // 1 - плеер запущен
  timemoreset : string; // время перезагрузки
  FLAG_ZOPA:integer;
  STATE_MMM:integer; // Флаг для включения - выключения мониторов - допуск разрешения выключения
  MF1:integer; // Флаг выключения монитора
               // 1- монитор выключен
               // 0- монитор включен
 timetoras: string;
 PI_FTP_ERROR: integer; // Флаг ошибки FTP-сервера              
implementation



{$R *.dfm}

// Функция получения адреса папки Моя Музыка
function GetSpecialPath(CSIDL: word): string;
var s:  string;
begin
  SetLength(s, MAX_PATH);
  if not SHGetSpecialFolderPath(0, PChar(s), CSIDL, true)
  then s := GetSpecialPath(CSIDL_COMMON_MUSIC);
  result := PChar(s);
end;




// убивает процессы в памяти по имени файла
function KillTask(ExeFileName: string): integer;
const
PROCESS_TERMINATE=$0001;
var 
ContinueLoop: BOOL;
FSnapshotHandle: THandle; 
FProcessEntry32: TProcessEntry32;
begin 
result := 0;

FSnapshotHandle := CreateToolhelp32Snapshot 
(TH32CS_SNAPPROCESS, 0); 
FProcessEntry32.dwSize := Sizeof(FProcessEntry32); 
ContinueLoop := Process32First(FSnapshotHandle, 
FProcessEntry32); 

while integer(ContinueLoop) <> 0 do 
begin 
if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = 
UpperCase(ExeFileName)) 
or (UpperCase(FProcessEntry32.szExeFile) = 
UpperCase(ExeFileName))) then 
Result := Integer(TerminateProcess(OpenProcess( 
PROCESS_TERMINATE, BOOL(0), 
FProcessEntry32.th32ProcessID), 0)); 
ContinueLoop := Process32Next(FSnapshotHandle, 
FProcessEntry32); 
end; 

CloseHandle(FSnapshotHandle); 
end; 



// Возвращает статус сервиса
function ServiceGetStatus(sMachine, sService: string ): Dword;
var 
  h_manager,h_service, h_svc: SC_Handle;
  service_status     : TServiceStatus; 
  hStat : DWord; 
begin 
  hStat := 1; 
  h_manager := OpenSCManager(PChar(sMachine) ,Nil,
                             SC_MANAGER_CONNECT);

  if h_manager > 0 then 
  begin 
    h_svc := OpenService(h_manager,PChar(sService),
                      SERVICE_QUERY_STATUS); 

    if h_svc > 0 then 
    begin 
      if(QueryServiceStatus(h_svc, service_status)) then 
        hStat := service_status.dwCurrentState; 

      CloseServiceHandle(h_svc); 
    end; 
    CloseServiceHandle(h_manager); 
  end; 

  Result := hStat;
end;

// Стартует сервисы
function ServiceStart(aMachine, aServiceName : string ) : boolean; 
// aMachine это UNC путь, либо локальный компьютер если пусто
var 
  h_manager,h_svc: SC_Handle; 
  svc_status: TServiceStatus; 
  Temp: PChar; 
  dwCheckPoint: DWord; 
begin 
  svc_status.dwCurrentState := 1; 
  h_manager := OpenSCManager(PChar(aMachine), Nil, 
                             SC_MANAGER_CONNECT); 
  if h_manager > 0 then 
  begin 
    h_svc := OpenService(h_manager, PChar(aServiceName), 
                         SERVICE_START or SERVICE_QUERY_STATUS); 
    if h_svc > 0 then 
    begin 
      temp := nil; 
      if (StartService(h_svc,0,temp)) then 
        if (QueryServiceStatus(h_svc,svc_status)) then 
        begin 
          while (SERVICE_RUNNING <> svc_status.dwCurrentState) do 
          begin 
            dwCheckPoint := svc_status.dwCheckPoint; 

            Sleep(svc_status.dwWaitHint); 

            if (not QueryServiceStatus(h_svc,svc_status)) then 
              break; 

            if (svc_status.dwCheckPoint < dwCheckPoint) then 
            begin 
              // QueryServiceStatus не увеличивает dwCheckPoint 
              break; 
            end; 
          end; 
        end; 
      CloseServiceHandle(h_svc); 
    end;
    CloseServiceHandle(h_manager);
  end; 
  Result := SERVICE_RUNNING = svc_status.dwCurrentState; 
end;

// Останавливает сервисы
function ServiceStop(aMachine,aServiceName : string ) : boolean; 
// aMachine это UNC путь, либо локальный компьютер если пусто
var 
  h_manager,h_svc   : SC_Handle; 
  svc_status     : TServiceStatus; 
  dwCheckPoint : DWord; 
begin 
  h_manager:=OpenSCManager(PChar(aMachine),nil, 
                           SC_MANAGER_CONNECT); 
  if h_manager > 0 then 
  begin 
    h_svc := OpenService(h_manager,PChar(aServiceName),
                         SERVICE_STOP or SERVICE_QUERY_STATUS); 

    if h_svc > 0 then 
    begin 
      if(ControlService(h_svc,SERVICE_CONTROL_STOP, 
                        svc_status))then 
      begin 
        if(QueryServiceStatus(h_svc,svc_status))then 
        begin 
          while(SERVICE_STOPPED <> svc_status.dwCurrentState)do 
          begin 
            dwCheckPoint := svc_status.dwCheckPoint; 
            Sleep(svc_status.dwWaitHint); 

            if(not QueryServiceStatus(h_svc,svc_status))then 
            begin 
              // couldn't check status 
              break; 
            end; 

            if(svc_status.dwCheckPoint < dwCheckPoint)then 
              break; 

          end; 
        end; 
      end; 
      CloseServiceHandle(h_svc); 
    end; 
    CloseServiceHandle(h_manager);
  end; 

  Result := SERVICE_STOPPED = svc_status.dwCurrentState; 
end; 



{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ This procedure execute either the synchronous command or the asynchronous }
{ command depending on the SyncCheckBox state.                              }
{ All date from UI is copied to FTP component properties.                   }
procedure TForm1.ExecuteCmd(SyncCmd : TSyncCmd; ASyncCmd : TAsyncCmd);
var
    bandwidth: integer;
begin

    { Initialize progress stuff }


    FtpClient1.HostName           := ip_server;
    FtpClient1.Port               := 'ftp';

    bandwidth                     := StrToInt('0'); // MaxKb
    if bandwidth > 0 then begin
        FtpClient1.BandwidthLimit := bandwidth * 1024;
        FtpClient1.Options := FtpClient1.Options + [ftpBandwidthControl];
    end
    else
        FtpClient1.Options := FtpClient1.Options - [ftpBandwidthControl];
{$IFDEF STREAM64}
    FtpClient1.OnProgress64       := FtpClient1Progress64;
    FtpClient1.OnProgress         := nil;
    { Note: In order to publish property OnProgress64 instead of the old }
    { 32-bit OnProgress event go to FtpCli.pas, uncomment                }
    { USE_ONPROGRESS64_ONLY and rebuild the ICS package.                 }
{$ENDIF}
    if 1<>1 then begin
        if SyncCmd then
           // Display('Command Success')
        else
         //   Display('Command Failure');
    end
    else
        aSyncCmd;
end;





// Процедура вытаскивания символов из строки
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



//Процедура коннекта
procedure TForm1.ConnectToServ(Sender: TObject);
begin


   wSocket1.Port:=port_server;
   wSocket1.Addr:=ip_server;
   WSocket1.proto:='tcp';
   wSocket1.Connect;


end;


//Процедура общения с сервером
procedure TForm1.Sendproc(Sender: TObject);
var local_softpath, ph1, ph2, ph3, p, p1:string;
    f,f1, f3:textFile;

    ddd:string;
    Jiji:integer; // Переменная для циклов
    phi2:integer; // Флаг наличия в массиве файлов на обновление
begin

    // memo1.Lines.Append(inttostr(steps));
{     if  ((REDIMG.Visible=false) and (PI_FTP<>0)) then
    //if  (REDIMG.Visible=false) then
       begin


        // Если соединение установлено - начинаем общение

        // Шаг 1й - Знакомство с сервером
    if  (wSocket1.State = wsConnected) then begin
    case steps of

    1:    begin
            wSocket1.SendStr('%name%'+name_client+'%pleer%'+#13#10); // Отсылаем строку идентификации
            Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Отправлена строка приветствия');
            UPD_FLAG:=0;
            exit;
          end;

        // Шаг 2й - Запрос на наличие обновления
     2:   begin
            wSocket1.SendStr('%oooN%'+name_client+'%isupd%'+#13#10); // Отсылаем строку запроса наличия обновления
            Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Есть ли обновление?');
            exit;
          end;

        // Шаг 3й - Имеются обновления плейлиста
        // запрашиваем способ обновления
      3: begin
            wSocket1.SendStr('%oooP%'+name_client+'%MU%'+#13#10); // Отсылаем строку запроса способа обновления
            Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Способ обновления?');
            exit;
         end;

        // Шаг 4й - Обновления закачиваются с FTP - сервера
        // запрашиваем кол-во файлов и их размер
      4 : begin
            if UPD_FLAG=1 then begin
                                    wSocket1.SendStr('%oooP%'+name_client+'%NM%'+#13#10); // Отсылаем строку запроса кол-ва файлов на закачку
                                    Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Сколько файлов качать?');
                                end;
            if UPD_FLAG=2 then begin
                                    wSocket1.SendStr('%oooP%'+name_client+'%U1%'+#13#10); // Отсылаем строку запроса кол-ва файлов на закачку
                                    Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Сколько файлов качать?');
                                end;

                                exit;
          end;

        // Шаг 5й - Кол-во файлов и размер известен
        // запрашиваем настройки FTP
      5: begin
            wSocket1.SendStr('%oooP%'+name_client+'%FT%'+#13#10); // Отсылаем строку запроса порт ftp
            Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Настройки FTP?');
            exit;
          end;

          // Все готово к передаче, запрашиваем имя файла для закачки
      6: begin
           if UPD_FLAG=1 then begin
                        wSocket1.SendStr('%oooP%'+name_client+'%GF%'+#13#10); // Отсылаем строку запроса файла на закачку
                        Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Имя файла на закачку');
                              end;
           if UPD_FLAG=2 then begin
                        wSocket1.SendStr('%oooP%'+name_client+'%3U%'+#13#10); // Отсылаем строку запроса файла на закачку
                        Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Имя файла на закачку');
                              end;

           exit;
          end;

          // Файл успешно принял, на сервере можно удалять
       7: begin
            ProgressBar1.Visible:=false;
            Label12.Visible:=false;
            Label13.Visible:=false;


            if UPD_FLAG=1 then begin
                                  wSocket1.SendStr('%oooP%'+name_client+'%FG%'+FN+'%'+FI+'%'+#13#10); // Отсылаем строку запроса порт ftp
                                  Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Файл '+FN+' скачал (ID='+FI+')');
                               end;
            if UPD_FLAG=2 then begin
                                  wSocket1.SendStr('%oooP%'+name_client+'%U3%'+FN+'%'+FI+'%'+#13#10); // Отсылаем строку запроса порт ftp
                                  Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Файл '+FN+' скачал (ID='+FI+')');
                         end;

           exit;


          end;

          // Файлы на закачке отсутствуют
    911: begin
             // Закрываем соединение с сервером


             // Проверяем наличие обновлений на сервере
              ph3:=ExtractFilePath(Application.EXEName)+'prof\lll.ini';

              AssignFile (f3,ph3);
   }           {$I-}
   {            Reset(f3);
                if IOResult <> 0  then
                begin
                 // Если файл не существует создаем его
                 rewrite (f3);
                 end;
             CloseFile(f3);
            AssignFile (f3,ph3);
            Reset(f3);
            Readln (f3,ddd);
            CloseFile(f3);
            if ddd<> datetostr(now) then begin
                                         // обновления не проводились, обновляем из log\stsp.log
                                          puttoFTP();
                                         end;
             // Закрываем соединение с сервером
             Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Закрываю соединение');
             if wSocket1.State = wsConnected then wSocket1.CloseDelayed;


             // Если имеем обновления в плейлисте - то стартуем обработчик обновлений
            if UPD_FLAG=1 then begin
                                 SpeedButton4Click(Sender);
                               end;


            // Теперь приступаем к поиску обновлений софта на диске
            local_softpath:=local_path+'\softupd\up.ini';
            phi1:=1;
            AssignFile (f,local_softpath);
            Reset (F);

            if EOF(F)=false then
                 begin

                   While not EOF (F) do
                       begin
                         // Приводим данные из файла в нормальный вид (исключаем повторения);
                         readln (F,ph1);
                         // Проверяем строку на наличие в массиве
                         phi2:=1;

                       if ph1='dater.exe' then
                           begin
                           // Немедленно обновляем сам модуль обновления
                            p:=local_path+'\softupd\'+ph1;
                            p1:=ExtractFilePath(Application.EXEName)+ph1;

                           // Если файл уже существует и на FTP есть замена для него
                          // - удаляем его для перезаписи
                           if ((FileExists(p1))and(FileExists(p))) then
                           begin
                            Deletefile (p1);
                           end;


                            // Перемещаем файл
                           if MoveFile(Pchar(p),pchar(p1)) then
                            begin
                          // Файл перемещен нормально

                            end else
                            begin
                            // Здесь можно обработать ошибку при перемещении файла
                            end;
                           end;



                       if ((length(ph1)>2)and(ph1<>'dater.exe')) then begin
                         for jiji:=1  to phi1 do
                           begin
                                if l_soft[jiji]=ph1 then phi2:=911;
                           end;
                         if phi2=1 then begin
                                         l_soft[phi1+1]:=ph1;
                                         phi1:=phi1+1;
                                        end;

                        end; //Конец length(ph1)>3
                       end; // Конец while not EOF(F)
                     CloseFile (f);

                 end;       // Конец if not EOF

            // Теперь массив запишем в тот же файл
            if phi1=1 then CloseFile (F);
            if phi1>1 then begin
                            CloseFile (F);

                            AssignFile (F,local_softpath);
                            Rewrite (F);
                            Append (F);
                            for jiji:=1 to phi1 do
                               begin
                               writeln (f,l_soft[jiji]);
                               end;
                            CloseFile (F);
                            // Теперь необходимо загрузить апдейтер
                            // и выгрузить данную программу из памяти

                            // Если процесс загружен в память
                            KillTask('pleer.exe'); // Убиваем процесс плеера
                            //ph2:= ExtractFilePath(Application.EXEName)+'DATER.exe';
                            winexec('DATER.exe',SW_Show); // Загружаем модуль апдейтера
                            PLAYER_STARTED:=0; // Плеер остановлен - выводим флаг
                            //Application.Terminate;// Завершаем работу программы

                            CoolTrayIcon1.Enabled:=false;
                            sc.Form1.Close;

                           end;

            exit;
          end

     else begin
             // Закрываем соединение с сервером
            Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Закрываю соединение1');
            //steps:=1;
            if wSocket1.State = wsConnected then wSocket1.Close;
            exit;
          end;

        end;
       end;
      end;
 }
end;

procedure TForm1.StartFTP (ftp_name, ftp_log, ftp_pas:string);
var dirftp:string;
begin
    dirftp:='/'+name_client+'/outlist/';
    FtpClient1.HostDirName   := dirftp;

    FtpClient1.HostName      := ip_server;
    FtpClient1.Port          := 'ftp';
    FtpClient1.UserName      := ftp_log;
    FtpClient1.PassWord      := ftp_pas;
    FtpClient1.Passive       := false;
    FtpClient1.Binary        := false;
    FtpClient1.Connect;
         if (FtpClient1.state = ftpReady) then begin

     FTPClient1.User;
     FTPCLient1.Pass;
     FTPClient1.Cwd;
    end;

end;


// Процедура выкладывания файла на FTP
procedure TForm1.puttoFTP();

var dirftp:string;
    f3: textfile;
    ph3:string;
    ddd:string;
begin

 FtpClient1.HostFileName   := Datetostr(now)+'stsp.log';
 dirftp:='/'+name_client+'/log/';
                      FtpClient1.LocalFileName  := ExtractFilePath(Application.EXEName)+'log\stsp.log';


    FtpClient1.HostDirName   :=dirftp;
    FtpClient1.HostName      := ip_server;
    FtpClient1.Port          := 'ftp';
    FtpClient1.UserName      := 'player';
    FtpClient1.PassWord      := '123';
    FtpClient1.Passive       := false;
    FtpClient1.Binary        := false;

    if ftpClient1.State = ftpReady then
    begin
    if FtpClient1.Open then begin
     FTPClient1.User;
     FTPCLient1.Pass;
     FTPClient1.Cwd;

     if Flag_FTP=0 then  begin

                        FTPClient1.put;
                        end;
     if FTPClient1.Quit then begin


                                         // Обновляем дату сброса лога
                                                       ph3:=ExtractFilePath(Application.EXEName)+'prof\lll.ini';
                                                      AssignFile (f3,ph3);
                                                      rewrite(f3);
                                                      Append (f3);
                                                      ddd:=datetostr(now);
                                                      Writeln (f3,ddd);
                                                      CloseFile(f3);

                                              // Обновляем лог-файл  (стираем все в нем и добавляем новую запись)
                                                      ph3:=ExtractFilePath(Application.EXEName)+'log\stsp.log';
                                                      AssignFile (f3,ph3);

                                                      rewrite(f3);
                                                      Append (f3);
                                                      ddd:=datetimetostr(now)+' Лог-файл был передан на сервер';
                                                      Writeln (f3,ddd);
                                                      CloseFile(f3);
                               end;
    end;
    end;



end;






// Процедура закачки файла по FTP
procedure TForm1.GetFromFTP(file_ftp, id_ftp, ftp_name, ftp_log, ftp_pas:string;
                            var get:boolean);

var dirftp:string;
begin
    FLastProgress  := 0;
    FProgressCount := 0;



   FtpClient1.HostFileName   := File_FTP;

   if UPD_FLAG=2 then begin
                      dirftp:='/'+name_client+'/outsoft/';
                      FtpClient1.LocalFileName  := local_path+'\softupd\'+File_FTP;
                      end else
                      begin
                      dirftp:='/'+name_client+'/outlist/';
                      FtpClient1.LocalFileName  := local_path+'\'+File_FTP;
                      end;

    FtpClient1.HostDirName   :=dirftp;
    FtpClient1.HostName      := ip_server;
    FtpClient1.Port          := ftp_name;
    FtpClient1.UserName      := ftp_log;
    FtpClient1.PassWord      := ftp_pas;
    FtpClient1.Passive       := false;
    //FtpClient1.Binary        := True;
    FtpClient1.Binary        := false;
    FtpClient1.Options       := [];


    if ftpClient1.State = ftpReady then
    begin
    if FtpClient1.Open then begin
     FTPClient1.User;
     FTPCLient1.Pass;
     FTPClient1.Cwd;
     FTPClient1.Size;

     label20.Caption:=inttostr(FtpClient1.SizeResult);
     if Flag_FTP=0 then  begin
                        PI_FTP:=0;
                          ProgressBar1.Visible:=true;
                          Label12.Visible:=true;
                          Label13.Visible:=true;
                          Label13.Caption:=File_FTP;

                          Label19.Visible:=true;
                          Label20.Visible:=true;
                          Label22.Visible:=true;
                          Label16.Visible:=true;

                          //Label13.Caption:=inttostr(FTPClient1.SizeResult);
                          try
                           FtpClient1.RestGet;
                           LogMemo.Lines.Append('Файл:' +File_FTP+ ', размер: '+ inttostr (FTPClient1.SizeResult) );
                           ftpClient1.Size;
                           //Label13.Caption:=inttostr(FTPClient1.SizeResult);

                           ProgressBar1.Max:=strtoint(label20.caption);
                           ProgressBar1.Min:=0;
                           ProgressBar1.Step:=1;



                          except
                           logmemo.Lines.Append('Ошибка закачки с FTP - сервера.');
                          end;
                        end;

     FTPClient1.Quit;
     
     get:=true;
    end else get:=false;

    end else  get:=false;


     // Если файл получен успешно - то продолжаем
    get:=true;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
   ConnectToServ(Sender);
end;



procedure TForm1.Button4Click(Sender: TObject);
begin
wSocket1.Close;

end;

procedure TForm1.WSocket1SessionConnected(Sender: TObject; ErrCode: Word);
begin
    RedIMG.Visible:=false;
    GreenIMG.Visible:=True;
    //Timer6.Enabled:=False;
    StatusBar1.Panels[0].Text:='Соединились с сервером';

       Label14.Caption:='Session Connected';

end;

procedure TForm1.WSocket1SessionClosed(Sender: TObject; ErrCode: Word);
begin
   RedIMG.Visible:=true;
   GreenIMG.Visible:=false;
   StatusBar1.Panels[0].Text:='Соединение с сервером отсутствует';
   Label14.Caption:='Сессия закрыта';
   steps:=911;
   Timer1.Enabled:=True; // Восстанавливаем таймер коннекта
   SendBox.Clear; // Очистка листа на отправку

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
wSocket1.SendStr('%name%herTEST%pleer%'+#13#10);
end;




procedure TForm1.WSocket1DataAvailable(Sender: TObject; ErrCode: Word);
var Str_Part1, Str_GETS, st1, st2, Str_GETS1, RcvdLine: string;
    J: integer;
    get: boolean;
    f:textfile;
    fle:string;
    Buf : array [0..255] of Char;
    Len : Integer;

begin
// Приводим строку в нормализованную форму

     if (REDIMG.Visible=false) then
        begin
        // Используем line mode, стоки должны заканчиваться #13, #10
        RcvdLine := wSocket1.ReceiveStr;
        { Remove trailing CR/LF }
        ProcessData (Sender, RcvdLine); //Обрабатываем пришедшую строку
        end;
end;


procedure TForm1.ProcessData (Sender: TObject; STR_RcvdLine: string);
var Str_Part1, Str_GETS, st1, st2, Str_GETS1, RcvdLine: string;
    J: integer;
    get: boolean;
    f:textfile;
    fle:string;
begin
    while (Length(STR_RcvdLine) > 0) and
              (STR_RcvdLine[Length(STR_RcvdLine)] in [#13, #10]) do
            STR_RcvdLine := Copy(STR_RcvdLine, 1, Length(STR_RcvdLine) - 1);

     Str_GETS:=STR_RcvdLine;
     ListBox1.Items.Append(STR_RcvdLine); // Помещаем пришедшие строки в очередь обработки

     TimerSEE.Enabled:=TRUE; // Останавливаем таймер контролирующий
                              // внештатные залипания при приемо-передаче данных
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
// по таймеру производим соединение с сервером
Timer1.Enabled:=false; //На момент обработки запроса останавливаем таймер

PI_FTP_ERROR:=1; //Восстанавливаем значение флага ошибок FTP

if (redIMG.Visible=true) then
//if wSocket1.State <> WSConnected then
  begin
   wSocket1.Port:=port_server;
   wSocket1.Addr:=ip_server;
   WSocket1.proto:='tcp';
   try
      wSocket1.Connect;
      sleep (500);
   except
      logmemo.Lines.Append('Ошибка соединения с сервером');
   end;
   Flag_FTP:=0;

  end;

 if steps=911 then steps:=1;
 //sendproc (Sender);


end;

procedure TForm1.CheckListBox1Click(Sender: TObject);
begin

// По выбранному дню недели выбираем в дататаймпикер соответствующее
// время запуска и остановки.
// Если массив не заполнен - ставим значение по умолчанию
label9.Caption:=CheckListBox1.Items.Strings[CheckListBox1.ItemIndex];
if start_pleer[checkListBox1.ItemIndex+1]='' then DateTimePicker1.Time:=strtotime('9:00:18')
                                             else DateTimePicker1.Time:=strtotime(start_pleer[checkListBox1.ItemIndex+1]);
if stop_pleer[checkListBox1.ItemIndex+1]='' then DateTimePicker2.Time:=strtotime('22:00:18')
                                             else DateTimePicker2.Time:=strtotime(stop_pleer[checkListBox1.ItemIndex+1]);

end;

procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin
 // При изменении времени запуска вносим изменение в массив старта
 start_pleer[checkListBox1.ItemIndex+1]:= timetostr(DateTimePicker1.Time);
end;

procedure TForm1.DateTimePicker2Change(Sender: TObject);
begin
 // При изменении времени остановки вносим изменение в массив настроек
 stop_pleer[checkListBox1.ItemIndex+1]:= timetostr(DateTimePicker2.Time);
end;

procedure TForm1.N1Click(Sender: TObject);
var j: integer;
begin
// Присваеваем массиву по всем дням недели одно и то же время старта и остановки
 for j:=1 to 7 do
  begin
    start_pleer[j]:= timetostr(DateTimePicker1.Time);
    stop_pleer[j]:= timetostr(DateTimePicker2.Time);
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var j: integer;
begin
// Выбираем все дни
 for j:=1 to 7 do
  begin
    check_pleer[j]:= '1';

    CheckListBox1.Checked[j-1]:=true;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var s:string;
begin

SelectDirectory('Выбери папку','',s);
Edit3.Text:=s;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i, jk:integer;
    f:textfile;
    s, s1, s3, s99:string;
begin
// Сохраняем параметры шедулера
s:= ExtractFilePath(Application.EXEName)+'time\time.ini';
AssignFile (f,s);
Rewrite (f);
Append (f);
 for i:=0 to CheckListBox1.Items.Count - 1 do
  begin
    if CheckListBox1.Checked[i] then
       begin
         writeln (f,'1');
         writeln (f,start_pleer[i+1]);
         writeln (f, stop_pleer[i+1]);
       end else
       begin
         writeln (f,'0');
         writeln (f,'9:00:18');
         writeln (f,'22:00:18');
       end;
 end;
 CloseFile (f);
 // Теперь старт и стоп - скрипты занем в соответствующие файлы
 s:= ExtractFilePath(Application.EXEName)+'time\start.ini';
 Memo2.Lines.SaveToFile(s);
 s:= ExtractFilePath(Application.EXEName)+'time\stop.ini';
 Memo3.Lines.SaveToFile(s);

 // Восстанавливаем настройки системы
 // Загружаем сервисную информацию
 i:=1;
 s:= ExtractFilePath(Application.EXEName)+'time\time.ini';


 AssignFile (f,s);
 Reset (f);
 While not EOF (f) do
  begin
   Readln (f,s1);
   check_pleer[i]:=s1;
   if s1='1' then CheckListBox1.Checked[i-1]:=true
             else CheckListBox1.Checked[i-1]:=false;
   Readln (f,s1);
   start_pleer [i]:=s1;
   Readln (f,s1);
   stop_pleer[i]:=s1;
   inc (i);

  end;
 CloseFile (f);



 timemoreset:='00:00:13';
  for i:=0 to memo2.Lines.Count-1 do
 begin


 if Copy(memo2.Lines.Strings[i],1,length('reset')) = 'reset' then
                                       begin
                                          s99:=memo2.Lines.Strings[i];
                                         jk:=7;
                                         timemoreset:='';
                                         while s99[jk]<>';' do
                                             begin
                                             timemoreset:=timemoreset+s99[jk];
                                             jk:=jk+1;
                                             end;
                                        
                                       end;
                                       
 if Copy(memo2.Lines.Strings[i],1,length('rasdial')) = 'rasdial' then
                                       begin
                                         s99:=memo2.Lines.Strings[i];
                                         jk:=9;
                                         timetoras:='';
                                         while ((s99[jk]<>';')) do
                                                                                      begin
                                             timetoras:=timetoras+s99[jk];
                                             jk:=jk+1;
                                             end;
                                             Timer5.Interval:=strtoint(timetoras);                                             Timer5.Interval:=strtoint(timetoras);
                                             Timer5.Enabled:=true;
                                       end;

 end;


 s:= ExtractFilePath(Application.EXEName)+'time\stop.ini';
 Memo3.Lines.LoadFromFile(s);

 s:= ExtractFilePath(Application.EXEName)+'prof\prof.ini';
 AssignFile (f,s);
 Reset (f);
  Readln (f, s1);
  ip_server:=s1;
  Edit2.Text:=s1;

  Readln (f, s1);
  port_server:=s1;
  Edit6.Text:=s1;

  Readln (f, s1);
  name_client:=s1;
  Edit4.Text:=s1;


  Readln (f, s1);
  if s1='Плеер' then type_client:='pleer'
                else type_client:='other';
  ComboBox1.Text:=s1;

  Readln (f, s1);
  speed_upd:=strtoint (s1);
  Edit5.Text:=s1;

  Readln (f, s1);
  if s1='Минут' then sp_upd:=60;
  if s1='Секунд' then sp_upd:=1;
  if s1='Часов' then sp_upd:=3600;
  ComboBox2.Text:=s1;

  Readln (f, s1);
  local_path:=s1;
  Edit3.Text:=s1;

  CloseFile (f);





end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var i:integer;
    f:textfile;
    s, s1:string;
begin
 s:= ExtractFilePath(Application.EXEName)+'prof\prof.ini';
 AssignFile (f,s);
 Rewrite (f);
 Append (f);
  writeln(f,Edit2.text);
  writeln(f,Edit6.text);
  writeln (f, Edit4.text);
  writeln (f, ComboBox1.text);
  writeln (f, Edit5.text);
  writeln (f, ComboBox2.text);
  Writeln (f, Edit3.Text);
 CloseFile(f);

// Загружаем сервисную информацию

  ip_server:=Edit2.text;
  port_server:=Edit6.Text;
  name_client:=Edit4.Text;
  s1:=ComboBox1.text;
  if s1='Плеер' then type_client:='pleer'
                else type_client:='other';
  speed_upd:=strtoint (Edit5.Text);
  s1:=ComboBox2.Text;
  if s1='Минут' then sp_upd:=60;
  if s1='Секунд' then sp_upd:=1;
  if s1='Часов' then sp_upd:=3600;
  local_path:=Edit3.Text;

  // Устанавливаем значение таймера
  Timer1.Interval:=sp_upd*speed_upd*1000;

end;

procedure TForm1.FormCreate(Sender: TObject);
var f: textfile;
    s, s1,s6, s99: string;
    i, jk:integer;
begin
STATE_MMM:=0;
PLAYER_STARTED:=911;

steps:=1;
MF1:=0; // Флаг говорт о том, что монитор включен
PI_FTP_ERROR:=1; // Флаг ошибки FTP-сервера выставляем в 1 - ошибок нет



                   // Скрываем визуализацию закачки
                      ProgressBar1.Visible:=false;
                      Label12.Visible:=false;
                      Label13.Visible:=false;
                          Label19.Visible:=false;
                          Label20.Visible:=False;
                          Label22.Visible:=False;
                          Label16.Visible:=False;





 StartFBTimer.Interval:=1000; // подключаться каждую секунду
 s6:='127.0.0.1:'+ExtractFilePath(Application.EXEName)+'client.fdb'; // Путь до локальной БД
 IBDataBase1.DatabaseName:=s6;
  IBDatabase1.Params.Clear;
  IBDatabase1.Params.Add('user_name=sysdba');
  IBDatabase1.Params.Add('password=masterkey');
  IBDatabase1.LoginPrompt:=false;
  StartFBTimer.Enabled:=true; // Стартуем FireBird

  PageControl1.ActivePage:=Tabsheet1;

  FLAG_CONNECT:=0; // Соединение с сервером отсутствует
  Flag_FTP:=0;
  PI_FTP:=911;
// Загружаем сервисную информацию
 i:=1;
 s:= ExtractFilePath(Application.EXEName)+'time\time.ini';


 AssignFile (f,s);
 Reset (f);
 While not EOF (f) do
  begin
   Readln (f,s1);
   check_pleer[i]:=s1;
   if s1='1' then CheckListBox1.Checked[i-1]:=true
             else CheckListBox1.Checked[i-1]:=false;
   Readln (f,s1);
   start_pleer [i]:=s1;
   Readln (f,s1);
   stop_pleer[i]:=s1;
   inc (i);

  end;
 CloseFile (f);

 s:= ExtractFilePath(Application.EXEName)+'time\start.ini';
 Memo2.Lines.LoadFromFile(s);

 timemoreset:='00:00:13';
 for i:=0 to memo2.Lines.Count-1 do
 begin


 if Copy(memo2.Lines.Strings[i],1,length('reset')) = 'reset' then
                                       begin
                                          s99:=memo2.Lines.Strings[i];
                                         jk:=7;
                                         timemoreset:='';
                                         while s99[jk]<>';' do
                                             begin
                                             timemoreset:=timemoreset+s99[jk];
                                             jk:=jk+1;
                                             end;
                                         
                                       end;
 if Copy(memo2.Lines.Strings[i],1,length('rasdial')) = 'rasdial' then
                                       begin
                                         s99:=memo2.Lines.Strings[i];
                                         jk:=9;
                                         timetoras:='';
                                         while (s99[jk]<>';') do
                                             begin
                                             timetoras:=timetoras+s99[jk];
                                             jk:=jk+1;
                                             end;
                                             Timer5.Interval:=strtoint(timetoras);
                                             Timer5.Enabled:=true;
                                       end;

 end;


 s:= ExtractFilePath(Application.EXEName)+'time\stop.ini';
 Memo3.Lines.LoadFromFile(s);

 s:= ExtractFilePath(Application.EXEName)+'prof\prof.ini';
 AssignFile (f,s);
 Reset (f);
  Readln (f, s1);
  ip_server:=s1;
  Edit2.Text:=s1;

  Readln (f, s1);
  port_server:=s1;
  Edit6.Text:=s1;

  Readln (f, s1);
  name_client:=s1;
  Edit4.Text:=s1;


  Readln (f, s1);
  if s1='Плеер' then type_client:='pleer'
                else type_client:='other';
  ComboBox1.Text:=s1;

  Readln (f, s1);
  speed_upd:=strtoint (s1);
  Edit5.Text:=s1;

  Readln (f, s1);
  if s1='Минут' then sp_upd:=60;
  if s1='Секунд' then sp_upd:=1;
  if s1='Часов' then sp_upd:=3600;
  ComboBox2.Text:=s1;

  Readln (f, s1);
  local_path:=s1;
  Edit3.Text:=s1;

  CloseFile (f);

  // Устанавливаем значение таймера
  Timer1.Interval:=sp_upd*speed_upd*1000;
  Timer1.Enabled:=true;

  // Обновление мониторов
  RedIMG.Visible:=true;
  GreenIMG.Visible:=false;
  //IsOnServer (Sender);


  // Логируем запуск системы
 s:=ExtractFilePath(Application.EXEName)+'log\stsp.log';
                                            AssignFile(f,s);
                                              {$I-}
                                            Reset(f);
                                            if IOResult <> 0  then
                                              begin
                                             // Если файл не существует создаем его
                                                rewrite (f);
                                              end;
                                            CloseFile(f);

                                             AssignFile (f,s);
                                             Append(f);
                                             s1:=datetimetostr(now)+ ' Клиент стартовал';
                                             Writeln (f,s1);
                                             CloseFile(f);



  // Далее необходимо проверить наличие и готовность БД
  // Если БД отсутствует - то либо перезапускать фаерберд, либо писать об ошибке.
  // Очевидно удобно делать это по таймеру
  
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var i, j: integer;
    f: textFile;
    s, s1: string;
begin
label7.Caption:=timetostr (now);
 

  if (timemoreset<>'00:00:13') then

                                   begin
                                   if timetostr (now)=timemoreset then begin
                                                                        try
                                                                          winexec('sh.exe',SW_HIDE);
                                                                        except

                                                                        end;

                                                                      end;

                                   end;

// Проверяем на соответствие запуска по шедулеру
i:=dayofWeek(now);

case i of
  1: i:=7;
  2: i:=1;
  3: i:=2;
  4: i:=3;
  5: i:=4;
  6: i:=5;
  7: i:=6;
end;

 
 if check_pleer[i]='1' then
   begin


    if ((strtotime(start_pleer[i])<=time)and(PLAYER_STARTED=0)and(strtotime(stop_pleer[i])>time)) then begin
                                            MF1:=0;                                                                                        SendMessage(Form1.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, MONITOR_ON);  // Включаем монитор

                                            //Убиваем файлы с плейлистами


                                            winexec('pleer.exe',SW_Show); // Стартуем плеер
                                            s:=ExtractFilePath(Application.EXEName)+'log\stsp.log';
                                            AssignFile(f,s);
                                              {$I-}
                                            Reset(f);
                                            if IOResult <> 0  then
                                              begin
                                             // Если файл не существует создаем его
                                                rewrite (f);
                                              end;
                                            CloseFile(f);

                                             AssignFile (f,s);
                                             Append(f);
                                             s1:=datetimetostr(now)+ ' Стартует плеер';
                                             Writeln (f,s1);
                                             CloseFile(f);
                                             PLAYER_STARTED:=1;

                                           end;
    if ((STATE_MMM=0)and (MF1=0)) then begin
                        if     ((time>strtotime(start_pleer[i])) and (time>strtotime(stop_pleer[i]))) or ((time<strtotime(start_pleer[i])) and (time<strtotime(stop_pleer[i])))
                               then begin

                                            sleep (3000); // Выжидание для избежания глюков
                                                          // в момент старта плеера в нерабочее время

                                            KillTask('pleer.exe'); // Убиваем процесс плеера
                                               s:=ExtractFilePath(Application.EXEName)+'log\stsp.log';
                                            PLAYER_STARTED:=0;
                                            logmemo.Lines.Append('MONITOR_OFF');
                                            MF1:=1;
                                            AssignFile(f,s);
                                              {$I-}
                                            Reset(f);
                                            if IOResult <> 0  then
                                              begin
                                             // Если файл не существует создаем его
                                                rewrite (f);
                                              end;
                                            CloseFile(f);

                                             AssignFile (f,s);
                                             Append(f);
                                             s1:=datetimetostr(now)+ ' Останавливаем плеер';
                                             Writeln (f,s1);
                                             CloseFile(f);
                                             PLAYER_STARTED:=0;
                                             SendMessage(Form1.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, MONITOR_OFF); // Выключаем монитор
                                          end;
                                        end;





 end;


end;


procedure TForm1.Button1Click(Sender: TObject);
begin

   wSocket1.Port:=port_server;
   wSocket1.Addr:=ip_server;
   WSocket1.proto:='tcp';
   wSocket1.Connect;

end;

procedure TForm1.Button2Click(Sender: TObject);
var dirftp:string;
begin




end;

procedure TForm1.MPFtpRequestDone(Sender: TObject; ErrorCode: Integer;
  const Reason: String);
begin
    MPFtp.FileStream.Free;
    MPFtp.FileStream := nil;
end;

procedure TForm1.FtpClient1SessionClosed(Sender: TObject; ErrCode: Word);
begin
 LogMemo.Lines.Append('Сервер: '+datetimetostr(now)+' Сессия прервана сервером '+ IntToStr(ErrCode));
 Flag_FTP:=0;
 //PI_FTP_ERROR:=911;
 PI_FTP:=1;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
Label15.Caption:=inttostr(steps);
// По таймеру смотрим наличие соединений на сервере
// Если соединение отсутствует - устанавливаем должным образом мониторы
if WSocket1.State = wsConnected then label14.Caption:='Session Connected'
                                else Label14.Caption:='Session Disconnected';

 if (Label14.Caption<>'Session Connected')
  then
//if  (wSocket1.State <> wsConnected) then

 begin
    redimg.Visible:=true;
    greenimg.Visible:=false;


 end
 else begin
            redimg.Visible:=false;
            greenimg.Visible:=true;
            if steps=911 then steps:=1;

      end;


end;

procedure TForm1.FtpClient1RequestDone(Sender: TObject;
  RqType: TFtpRequest; ErrCode: Word);
begin
Flag_FTP:=0;
                   // Скрываем визуализацию закачки
                      ProgressBar1.Visible:=false;
                      Label12.Visible:=false;
                      Label13.Visible:=false;
                          Label19.Visible:=false;
                          Label20.Visible:=False;
                          Label22.Visible:=False;
                          Label16.Visible:=False;


PI_FTP:=1; // Флаг завершения закачки
end;

procedure TForm1.FtpClient1SessionConnected(Sender: TObject;
  ErrCode: Word);
begin
Flag_FTP:=0;
end;

procedure TForm1.FtpClient1Progress(Sender: TObject; Count: Integer;
  var Abort: Boolean);
begin

    FProgressCount := Count;
    { Be sure to update screen only once every second }
    if FLastProgress < GetTickCount then begin
        FLastProgress := GetTickCount + 1000;
        Label16.Caption := IntToStr(FProgressCount);
        Label16.Repaint;
    end;


   Flag_FTP:=1;
   ProgressBar1.Max:=strtoint(Label20.Caption);
   ProgressBar1.Position:=strtoint(label16.caption);

end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
Var SR:TSearchRec; // поисковая переменная
    FindRes:Integer; // переменная для записи результата поиска
    Path111:string; // Путь поиска
    name_frlist, name_pllist: string; // Имена найденых файлов
    F:textFile;
    i,j, fs:integer;
    flg01: integer;
    s,pa, ph2, ff:string;
    searchResult : TSearchRec;
begin
// Ручное обновление системы
// Проверяем в папке локального контента наличие файлов с
// расширением *.frm и *.pll
    flg01:=1;

    Path111:=local_path+'\*.frm';
    FindRes:=FindFirst(Path111,faAnyFile,SR); // задание условий поиска и начало поиска
    While FindRes=0 do                        // пока мы находим файлы (каталоги), то выполнять цикл
     begin
       name_frlist:=SR.Name;                  // Сохраяем имя найденого файла
       FindRes:=FindNext(SR);                 // продолжение поиска по заданным условиям
     end;
     FindClose(SR);                           // закрываем поиск

      ff:=local_path+'\'+name_frlist;
      if FindFirst(ff, faAnyFile, searchResult) = 0 then fs:=searchResult.Size;
      if fs<1 then flg01:=911;

    Path111:=local_path+'\*.pll';
    FindRes:=FindFirst(Path111,faAnyFile,SR); // задание условий поиска и начало поиска
    While FindRes=0 do                        // пока мы находим файлы (каталоги), то выполнять цикл
     begin
       name_pllist:=SR.Name;                  // Сохраяем имя найденого файла
       FindRes:=FindNext(SR);                 // продолжение поиска по заданным условиям
     end;
     FindClose(SR);                           // закрываем поиск

      ff:=local_path+'\'+name_pllist;
      if FindFirst(ff, faAnyFile, searchResult) = 0 then fs:=searchResult.Size;
      if fs<1 then flg01:=911;

     // Проверяем соединились ли с базой
     // Если соединение с БД прошло успешно - начинаем заполнение
     if (flg01=911) then logmemo.Lines.Append('Файл нулевого размера');

     if ((sc.FLAG_DB_CONNECT=1)and(flg01=1)) then
         begin
            // Закачиваем фреймлист в базу данных
           if length (name_frlist)>3 then begin

            // Сначала необходимо удалить все имеющиеся записи в таблице

             s:='delete from FRAME_PLAYER';
             IBQuery1.SQL.Clear;
             IBQuery1.SQL.Append(s);
             IBQuery1.Close;
             IBQuery1.Open;


            pa:=local_path+'\'+name_frlist;
            AssignFile (F, pa);
            Reset (F);
            While not EOF(F) do
                begin
                Readln(f,s);
                IBQuery1.SQL.Clear;
                IBQuery1.SQL.Append(s);
                IBQuery1.Close;
                IBQuery1.Open;
                end;

            CloseFile (F);
            LogMemo.Lines.Append('Обновил фреймлист плеера');
            end else LogMemo.Lines.Append('Файл с описанием фреймов отсутствует');

            // Закачиваем сам плейлист
           if length (name_pllist)>3 then begin
             s:='delete from PLAYLIST';
             IBQuery1.SQL.Clear;
             IBQuery1.SQL.Append(s);
             IBQuery1.Close;
             IBQuery1.Open;


            pa:=local_path+'\'+name_pllist;
             AssignFile (F, pa);
            Reset (F);
            While not EOF(F) do
                begin
                Readln(f,s);
                IBQuery1.SQL.Clear;
                IBQuery1.SQL.Append(s);
                IBQuery1.Close;
                IBQuery1.Open;
                IBTransaction1.CommitRetaining;
                end;

            CloseFile (F);
            LogMemo.Lines.Append('Обновил Плейлист');

            // Если процесс запущен -
            KillTask('pleer.exe'); // Убиваем процесс плеера

            winexec('plupd.exe',SW_Show); // Стартуем рестарт
           
            SC.Form1.Close;
            end else LogMemo.Lines.Append('Файл с плейлистом отсутствует');

         end;

end;

procedure TForm1.StartFBTimerTimer(Sender: TObject);
var a,b:integer;
    fff1: textfile;
    sss,sss1:string;
begin
// if IBDatabase1.Connected=false then
// begin

//Проверяем стартовал ли сервис фаерберда  FirebirdGuardianDefaultInstance
 case ServiceGetStatus ('','FirebirdGuardianDefaultInstance') of
    SERVICE_RUNNING : begin
                        if sc.FLAG_DB_CONNECT<>1 then logmemo.Lines.Append('FirebirdGuardianDefaultInstance: SERVICE_RUNNING');
                        a:=1;
                      end;
    SERVICE_STOPPED  : begin
                         logmemo.Lines.Append('FirebirdGuardianDefaultInstance: SERVICE_STOPPED ');
                         a:=2;
                       end;
    SERVICE_PAUSED         : begin
                              logmemo.Lines.Append('FirebirdGuardianDefaultInstance: SERVICE_PAUSED');
                              a:=3;
                             end;
    SERVICE_START_PENDING  : begin
                              logmemo.Lines.Append('FirebirdGuardianDefaultInstance: SERVICE_START_PENDING');
                              a:=4;
                             end;
    SERVICE_STOP_PENDING   : begin
                               logmemo.Lines.Append('FirebirdGuardianDefaultInstance: SERVICE_STOP_PENDING');
                               a:=5
                             end;
    SERVICE_CONTINUE_PENDING : begin
                                logmemo.Lines.Append('FirebirdGuardianDefaultInstance: SERVICE_CONTINUE_PENDING');
                                a:=6;
                               end;
    SERVICE_PAUSE_PENDING    : begin
                                 logmemo.Lines.Append('FirebirdGuardianDefaultInstance: SERVICE_PAUSE_PENDING');
                                 a:=7;
                               end;

 end;

// Проверяем сервис Firebird Server - DefaultInstance
  case ServiceGetStatus ('','FirebirdServerDefaultInstance') of
    SERVICE_RUNNING : begin
                        if sc.FLAG_DB_CONNECT<>1 then logmemo.Lines.Append('FirebirdServerDefaultInstance: SERVICE_RUNNING');
                        b:=1;
                      end;
    SERVICE_STOPPED  : begin
                         logmemo.Lines.Append('FirebirdServerDefaultInstance: SERVICE_STOPPED ');
                         b:=2;
                       end;
    SERVICE_PAUSED         : begin
                              logmemo.Lines.Append('FirebirdServerDefaultInstance: SERVICE_PAUSED');
                              b:=3;
                             end;
    SERVICE_START_PENDING  : begin
                              logmemo.Lines.Append('FirebirdServerDefaultInstance: SERVICE_START_PENDING');
                              b:=4;
                             end;
    SERVICE_STOP_PENDING   : begin
                               logmemo.Lines.Append('FirebirdServerDefaultInstance: SERVICE_STOP_PENDING');
                               b:=5
                             end;
    SERVICE_CONTINUE_PENDING : begin
                                logmemo.Lines.Append('FirebirdServerDefaultInstance: SERVICE_CONTINUE_PENDING');
                                b:=6;
                               end;
    SERVICE_PAUSE_PENDING    : begin
                                 logmemo.Lines.Append('FirebirdServerDefaultInstance: SERVICE_PAUSE_PENDING');
                                 b:=7;
                               end;

 end;

// Если сервисы остановлены - то стартуем сервисы
if a=2 then begin
             ServiceStart ('','FirebirdGuardianDefaultInstance');
             // Логируем запуск системы
                sss1:=ExtractFilePath(Application.EXEName)+'log\stsp.log';
                                            AssignFile(fff1,sss1);
                                              {$I-}
                                            Reset(fff1);
                                            if IOResult <> 0  then
                                              begin
                                             // Если файл не существует создаем его
                                                rewrite (fff1);
                                              end;
                                            CloseFile(fff1);

                                             AssignFile (fff1,sss1);
                                             Append(fff1);
                                             sss:=datetimetostr(now)+ ' FirebirdGuardianDefaultInstance-сервис был остановлен, запускаем';
                                             Writeln (fff1,sss);
                                             CloseFile(fff1);
            end;
if b=2 then begin
              ServiceStart ('','FirebirdServerDefaultInstance');
                           // Логируем запуск системы
                sss1:=ExtractFilePath(Application.EXEName)+'log\stsp.log';
                                            AssignFile(fff1,sss1);
                                              {$I-}
                                            Reset(fff1);
                                            if IOResult <> 0  then
                                              begin
                                             // Если файл не существует создаем его
                                                rewrite (fff1);
                                              end;
                                            CloseFile(fff1);

                                             AssignFile (fff1,sss1);
                                             Append(fff1);
                                             sss:=datetimetostr(now)+ ' FirebirdServerDefaultInstance-сервис был остановлен, запускаем';
                                             Writeln (fff1,sss);
                                             CloseFile(fff1);
            end;

// Если коннекта с фаербердом присутствует но сервисы остановлены - останавливаем фаерберд
if ((IBDatabase1.Connected=true)and(a<>1)and(b<>1)) then
                                           begin
                                            IBDatabase1.Connected:=false;
                                            sc.FLAG_DB_CONNECT:=0;
                                           end;
// Если коннекта с фаербердом нет, но сервисы стартовали - коннектим фаеберд
if ((IBDatabase1.Connected=false)and(a=1)and(b=1)) then
  begin
     if Flag_WORK_thrd=0 then begin
        Flag_WORK_thrd:=1;
        Thread1 :=TSimpleThread.Create(true);
        Thread1.FreeOnTerminate:=true;
        Thread1.Priority := tpLowest;
        Thread1.Resume;

      end;
  end;

end;

procedure TForm1.IBDatabase1AfterConnect(Sender: TObject);
begin
FLAG_DB_CONNECT:=1; // Подключились к БД

//StartFBTimer.Enabled:=false;
end;

procedure TForm1.IBDatabase1AfterDisconnect(Sender: TObject);
begin
FLAG_DB_CONNECT:=0;
logmemo.Lines.Append('Связь с сервером БД разорвана ');
//StartFBTimer.Enabled:=true;
end;

procedure TForm1.WSocket1Error(Sender: TObject);
begin
logmemo.Lines.Append('Ошибка сокета ');

end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var f:textfile;
    s,s1: string;
begin
// Корректно завершаем все открытое

// Выключаем все таймеры
SendTimer.Enabled:=false;
ResTimer1.Enabled:=false;
TimerSEE.Enabled:=false;
Timer1.Enabled:=false;
Timer3.Enabled:=false;
Timer4.Enabled:=false;
StartFBTimer.Enabled:=false;
Timer2.Enabled:=false;
Timer5.Enabled:=false;



// Логируем запуск системы
 s:=ExtractFilePath(Application.EXEName)+'log\stsp.log';
                                            AssignFile(f,s);
                                              {$I-}
                                            Reset(f);
                                            if IOResult <> 0  then
                                              begin
                                             // Если файл не существует создаем его
                                                rewrite (f);
                                              end;
                                            CloseFile(f);

                                             AssignFile (f,s);
                                             Append(f);
                                             s1:=datetimetostr(now)+ ' Клиент закрывается';
                                             Writeln (f,s1);
                                             CloseFile(f);

IBDatabase1.Connected:=false;
wSocket1.CloseDelayed;
FTPClient1.Quit;
sleep (1000);
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
Form1.Timer1Timer(Sender);
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var f: textfile;
    s,s1: string;
begin
PLAYER_STARTED:=1;
winexec('pleer.exe',SW_Show); // Стартуем плеер
                                            s:=ExtractFilePath(Application.EXEName)+'log\stsp.log';
                                            AssignFile(f,s);
                                              {$I-}
                                            Reset(f);
                                            if IOResult <> 0  then
                                              begin
                                             // Если файл не существует создаем его
                                                rewrite (f);
                                              end;
                                            CloseFile(f);

                                             AssignFile (f,s);
                                             Append(f);
                                             s1:=datetimetostr(now)+ ' Стартует плеер - ручной старт';
                                             Writeln (f,s1);
                                             CloseFile(f);
                                             PLAYER_STARTED:=1;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
SendMessage(Form1.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, MONITOR_OFF); // Выключаем монитор
end;

procedure TForm1.CoolTrayIcon1DblClick(Sender: TObject);
begin
CoolTrayIcon1.ShowMainForm;
end;

procedure TForm1.CoolTrayIcon1Startup(Sender: TObject;
  var ShowMainForm: Boolean);
begin
  CoolTrayIcon1.HideMainForm;
end;

procedure TForm1.Button6Click(Sender: TObject);

var dirftp:string;
begin

   FtpClient1.HostFileName   := Datetostr(now)+'.log';


                      dirftp:='/'+name_client+'/log/';
                      FtpClient1.LocalFileName  := ExtractFilePath(Application.EXEName)+'log\mainlog\'+Datetostr(now)+'.log';


    FtpClient1.HostDirName   :=dirftp;
    FtpClient1.HostName      := '127.0.0.1';
    FtpClient1.Port          := 'ftp';
    FtpClient1.UserName      := 'player';
    FtpClient1.PassWord      := '123';
    FtpClient1.Passive       := false;
    FtpClient1.Binary        := false;

    if ftpClient1.State = ftpReady then
    begin
    if FtpClient1.Open then begin
     FTPClient1.User;
     FTPCLient1.Pass;
     FTPClient1.Cwd;

     if Flag_FTP=0 then  begin

                        FTPClient1.put;
                        end;
     FTPClient1.Quit;
    end;
    end;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
// Таймер по F10 отключает автовозникновение плеера
if GetAsyncKeyState(VK_F10)<>0 then
    if STATE_MMM=1 then STATE_MMM:=0
                   else STATE_MMM:=1;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
                                                                        try
                                                                          winexec('sh.exe',SW_HIDE);
                                                                        except

                                                                        end;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
winexec('1.bat',SW_HIDE);
sleep (10000);
winexec('2.bat',SW_HIDE);

end;

procedure TForm1.ResTimer1Timer(Sender: TObject);
var Str_Part1, Str_GETS, st1, st2, Str_GETS1, RcvdLine: string;
    J: integer;
    get: boolean;
    f:textfile;
    fle:string;

    // Переменные для обработки по 911
    ph3, ddd, local_softpath, ph1, p, p1:string;
    f3:TextFile;
    phi2, jiji: integer;
begin
  ResTimer1.Enabled:=false; // Останавливаем таймер обработки данных

  // Если список на обработку не пуст - начинаем обработку
  if listbox1.Items.Count>0 then
      begin


         // ListBox1.Items[0] - текущий обрабатываемый элемент
       Str_GETS:=ListBox1.Items[0];
       Str_GETS1:=Str_GETS;
          // Ловим строку приветствия
    if CompareText(Str_GETS, 'Welcome to Studio911')=0 then
                                                 begin
                                                  steps:=1;
                                                  Logmemo.Lines.Append('Сервер: '+datetimetostr(now)+' Получили приветствие от Сервера');
                                                  Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Отправляем строку авторизации');

                                                  SendBox.Items.Append('%name%'+name_client+'%pleer%'+#13#10);

                                                 end else


    // Ловим строку GETNAME для продолжения общения
    if CompareText(Str_GETS, 'GETNAME')=0 then
                                                 begin
                                                  LogMemo.Lines.Append('Сервер: '+datetimetostr (now)+' Клиент зарегистрирован');
                                                  Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Есть ли обновление?');
                                                  steps:=2;
                                                  SendBox.Items.Append('%oooN%'+name_client+'%isupd%'+#13#10);

                                                 end // if CompareText(Str_GETS, 'GETNAME')=0 then
                                                 else



  // Если имеются обновления плейлиста
    if CompareText(Str_GETS, 'UPD=1') = 0 then
                                               begin
                                                  LogMemo.Lines.Append('Сервер: '+datetimetostr (now)+' Имею обновления плейлиста');
                                                  Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Способ обновления?');
                                                  steps:=3;
                                                  UPD_FLAG:=1;
                                                  SendBox.Items.Append('%oooP%'+name_client+'%MU%'+#13#10);

                                                end  // if CompareText(Str_GETS, 'UPD=1') = 0 then ...
                                                else

     // Если имеются обновления софта
    if CompareText(Str_GETS1, 'UPD=2') = 0 then
                                                begin
                                                  LogMemo.Lines.Append('Сервер: '+datetimetostr (now)+' Имеются обновления ПО');
                                                  Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Способ обновления?');
                                                  steps:=3;
                                                  UPD_FLAG:=2;
                                                  SendBox.Items.Append('%oooP%'+name_client+'%MU%'+#13#10);

                                                end  // if CompareText(Str_GETS1, 'UPD=2') = 0 then...
                                                else


    // Если метод закачки определен как FTP:
   if CompareText(Str_GETS1, 'FTP=1') = 0 then
                                                begin
                                                  LogMemo.Lines.Append('Сервер: '+datetimetostr(now)+' Файл закачивать как FTP');
                                                  steps:=4;
                                                  if UPD_FLAG=1 then begin
                                                                      SendBox.Items.Append('%oooP%'+name_client+'%NM%'+#13#10);
                                                                      Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Сколько файлов качать?');
                                                                      end;
                                                  if UPD_FLAG=2 then begin
                                                                      SendBox.Items.Append('%oooP%'+name_client+'%U1%'+#13#10);
                                                                      Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Сколько файлов качать?');
                                                                     end;

                                                end   // if CompareText(Str_GETS1, 'FTP=1') = 0 then ..
                                                else



     if Str_GETS[1]='%' then
     begin

     GetZnak (2,Length(Str_GETS),Str_GETS, Str_Part1, J);

     if Str_GETS = 'Exit' then exit;


     // Пришло кол-во файлов и размер для закачки
     if str_Part1='NM' then
        begin
         GetZnak (5,Length(Str_GETS),Str_GETS, Str_Part1, J);
         st1:= Str_Part1; // Содержит кол-во файлов
         GetZnak (6+length(st1),Length(Str_GETS),Str_GETS, Str_Part1, J);
         st2:=Str_Part1; // Содержит размер закачки в байтах
         LogMemo.Lines.Append('Сервер: '+datetimetostr(now)+' Имеется '+ st1+' файлов размером: '+st2);
         steps:=5;
          SendBox.Items.Append('%oooP%'+name_client+'%FT%'+#13#10);
          Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Настройки FTP?');

        end;


       // Пришло кол-во файлов и размер для закачки
        if str_Part1='2U' then
        begin
         GetZnak (5,Length(Str_GETS),Str_GETS, Str_Part1, J);
         st1:= Str_Part1; // Содержит кол-во файлов
         GetZnak (6+length(st1),Length(Str_GETS),Str_GETS, Str_Part1, J);
         st2:=Str_Part1; // Содержит размер закачки в байтах
         LogMemo.Lines.Append('Сервер: '+datetimetostr(now)+' Имеется '+ st1+' файлов размером: '+st2);
         steps:=5;
         Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Настройки FTP?');
         SendBox.Items.Append('%oooP%'+name_client+'%FT%'+#13#10);

        end;


     // Пришло имя файла и идентификатор
     if str_Part1='GF' then
        begin
         GetZnak (5,Length(Str_GETS),Str_GETS, Str_Part1, J);
         FN:= Str_Part1; // Сожержит имя файла
         GetZnak (6+length(FN),Length(Str_GETS),Str_GETS, Str_Part1, J);
         FI:=Str_Part1; // Содержит идентификатор
         LogMemo.Lines.Append('Сервер: '+datetimetostr(now)+' Файл:'+ FN+' Идентификатор:'+FI);

         // Пришли настройки, имя файла и фтп, можно начинать закчку
         GetFromFTP(FN, FI, port_ftp, log_ftp, pass_ftp, get);
         Flag_FTP:=0; // Занятость ftp



        while PI_FTP<>1 do begin // Проверяем на фалге выполнения ФТП шником задачи на скачивание
                                 // Стоим и ждем пока не скачается файл


                             if PI_FTP_ERROR<>1 then begin
                                                      Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' При скачивании Файл '+FN+' (ID='+FI+'), возникла ошибка');
                                                      // Помещаем в очередь повторный запрос файла
                                                       if UPD_FLAG=1 then begin
                                                                           SendBox.Items.Append('%oooP%'+name_client+'%GF%'+#13#10);
                                                                           Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                                                                          end;
                                                       if UPD_FLAG=2 then begin
                                                                           SendBox.Items.Append('%oooP%'+name_client+'%3U%'+#13#10);
                                                                           Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                                                                          end;
                                                      ResTimer1.Enabled:=True; // Возобнавляем таймер обработки данных
                                                      exit; // возникала ошибка при закачке с ФТП - выходим из зацикливания
                                                     end;

                           end;

         if ((get=true)and(PI_FTP=1)and(PI_FTP_ERROR=1)) then
            begin

          // Если начальный размер совпадает с тем что скачали - начинаем обработку
          if ProgressBar1.Max=ProgressBar1.Position then
          begin


              // Отсылаем серверу ответ о том, что мы скачали файл с FTP
            steps:=7;
            if UPD_FLAG=1 then begin
                                SendBox.Items.Append('%oooP%'+name_client+'%FG%'+FN+'%'+FI+'%'+#13#10);
                                Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Файл '+FN+' скачал (ID='+FI+')');
                               end;
            if UPD_FLAG=2 then begin
                               SendBox.Items.Append('%oooP%'+name_client+'%U3%'+FN+'%'+FI+'%'+#13#10);
                               Logmemo.Lines.Append('Клиент:'+datetimetostr (now)+' Файл '+FN+' скачал (ID='+FI+')');
                               end;

            end // if ProgressBar1.Max=ProgressBar1.Position then
            else begin
                   // Т.е. немыслимым образом программа попала в данную строку
                   // отправляем запрос на закачку файла заново
                   Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' При скачивании Файл '+FN+' (ID='+FI+'), возникла ошибка');
                   // Помещаем в очередь повторный запрос файла
                   if UPD_FLAG=1 then begin
                       SendBox.Items.Append('%oooP%'+name_client+'%GF%'+#13#10);
                       Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                                      end;
                   if UPD_FLAG=2 then begin
                        SendBox.Items.Append('%oooP%'+name_client+'%3U%'+#13#10);
                        Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                                      end;
                 end; // else ...

            end; // if ((get=true)and(PI_FTP=1)and(PI_FTP_ERROR=1)) then

        end; //   if str_Part1='GF' then..


    // Пришло имя файла и идентификатор для закачки обвновления софта
     if str_Part1='3U' then
        begin

         logmemo.Lines.Append(Str_GETS);
         GetZnak (5,Length(Str_GETS),Str_GETS, Str_Part1, J);
         FN:= Str_Part1; // Сожержит имя файла
         GetZnak (6+length(FN),Length(Str_GETS),Str_GETS, Str_Part1, J);
         FI:=Str_Part1; // Содержит идентификатор
         LogMemo.Lines.Append('Сервер: '+datetimetostr(now)+' Файл:'+ FN+' Идентификатор:'+FI);
         // Пришли настройки, имя файла и фтп, можно начинать закачку
         GetFromFTP(FN, FI, port_ftp, log_ftp, pass_ftp, get);
         Flag_FTP:=0; // Занятость ftp

                 while PI_FTP<>1 do begin // Проверяем на фалге выполнения ФТП шником задачи на скачивание
                                 // Стоим и ждем пока не скачается файл
                             if PI_FTP_ERROR<>1 then begin
                                                      Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' При скачивании Файл '+FN+' (ID='+FI+'), возникла ошибка');
                                                      // Помещаем в очередь повторный запрос на закачку файла
                                                      if UPD_FLAG=1 then begin
                                                                           SendBox.Items.Append('%oooP%'+name_client+'%GF%'+#13#10);
                                                                           Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                                                                         end;
                                                      if UPD_FLAG=2 then begin
                                                                           SendBox.Items.Append('%oooP%'+name_client+'%3U%'+#13#10);
                                                                           Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                                                                         end;
                                                      ResTimer1.Enabled:=True; // Возобнавляем таймер обработки данных
                                                      exit; // возникала ошибка при закачке с ФТП - выходим из зацикливания
                                                     end;

                           end;


         if ((get=true)and(PI_FTP=1)) then
            begin

         // Сверяем размер полученного файла
         if ProgressBar1.Max=ProgressBar1.Position then
         begin

        // Отсылаем серверу ответ о том, что мы скачали файл с FTP
        fle:=local_path+'\softupd\up.ini';
        AssignFile (f,fle);
        {$I-}
         Reset(f);
        if IOResult <> 0  then
         begin
             // Если файл не существует создаем его
             rewrite (f);
           end;
        CloseFile(f);
        AssignFile (f,fle);
        Append (f);
        Writeln (f,FN);
        CloseFile(f);

            if UPD_FLAG=1 then begin
                                 SendBox.Items.Append('%oooP%'+name_client+'%FG%'+FN+'%'+FI+'%'+#13#10);
                                 Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Файл '+FN+' скачал (ID='+FI+')');
                               end;
            if UPD_FLAG=2 then begin
                                 SendBox.Items.Append('%oooP%'+name_client+'%U3%'+FN+'%'+FI+'%'+#13#10);
                                 Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Файл '+FN+' скачал (ID='+FI+')');
                               end;
            steps:=7;
            end //if ProgressBar1.Max=ProgressBar1.Position then ..
            else begin

                   // Если размерность файлов не совпадает - качаем их заново...
                   Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' При скачивании Файл '+FN+' (ID='+FI+'), возникла ошибка');
                   // Помещаем в очередь повторный запрос на закачку файла
                   if UPD_FLAG=1 then begin
                          SendBox.Items.Append('%oooP%'+name_client+'%GF%'+#13#10);
                          Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                                      end;
                   if UPD_FLAG=2 then begin
                          SendBox.Items.Append('%oooP%'+name_client+'%3U%'+#13#10);
                          Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                                      end;
                 end;
            end;


        end;  //    if str_Part1='2U' then...


      //Сервер успешно удалил запись о файле
      if str_Part1='FG' then
        begin
         steps:=6;   // Возвращаемся к вопросу о наличии файлов на закачку

           if UPD_FLAG=1 then begin
                                   SendBox.Items.Append('%oooP%'+name_client+'%GF%'+#13#10);
                                   Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                              end;
           if UPD_FLAG=2 then begin
                                   SendBox.Items.Append('%oooP%'+name_client+'%3U%'+#13#10);
                                   Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                              end;

        end;  // if str_Part1='FG' then...

      //Сервер успешно удалил запись о файле
      // Заносим имя файла в текстовый файл со списком обновлений
      if str_Part1='U3' then
        begin
         steps:=6;   // Возвращаемся к вопросу о наличии файлов на закачку
           if UPD_FLAG=1 then begin
                                   SendBox.Items.Append('%oooP%'+name_client+'%GF%'+#13#10);
                                   Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                              end;
           if UPD_FLAG=2 then begin
                                   SendBox.Items.Append('%oooP%'+name_client+'%3U%'+#13#10);
                                   Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                              end;
        end; // if str_Part1='3U' then...

      //Отсутствие файлов на закачку
      if str_Part1='OO' then
        begin
         Timer1.Enabled:=True; // Восстанавливаем таймер коннекта
         steps:=911;   // Выходим из процедур
         TimerSEE.Enabled:=False;
         ListBox1.Items.Clear;
         Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Обмен завершен');

         TimerSEE.Enabled:=False; // Выключаем таймер слежения за залипаниями
                                  // при приемо-передаче данных.

               // Проверяем наличие обновлений на сервере
              ph3:=ExtractFilePath(Application.EXEName)+'prof\lll.ini';

              AssignFile (f3,ph3);
              {$I-}
               Reset(f3);
                if IOResult <> 0  then
                begin
                 // Если файл не существует создаем его
                 rewrite (f3);
                 end;
             CloseFile(f3);
            AssignFile (f3,ph3);
            Reset(f3);
            Readln (f3,ddd);
            CloseFile(f3);
            if ddd<> datetostr(now) then begin
                                         // обновления не проводились, обновляем из log\stsp.log
                                          puttoFTP();
                                         end;
             // Закрываем соединение с сервером
             Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Закрываю соединение по 911');
             if wSocket1.State = wsConnected then wSocket1.CloseDelayed;


             // Если имеем обновления в плейлисте - то стартуем обработчик обновлений
            if UPD_FLAG=1 then begin
                                 SpeedButton4Click(Sender);
                               end;


            // Теперь приступаем к поиску обновлений софта на диске
            local_softpath:=local_path+'\softupd\up.ini';
            phi1:=1;
            AssignFile (f,local_softpath);
            Reset (F);

            if EOF(F)=false then
                 begin

                   While not EOF (F) do
                       begin
                         // Приводим данные из файла в нормальный вид (исключаем повторения);
                         readln (F,ph1);
                         // Проверяем строку на наличие в массиве
                         phi2:=1;

                       if ph1='dater.exe' then
                           begin
                           // Немедленно обновляем сам модуль обновления
                            p:=local_path+'\softupd\'+ph1;
                            p1:=ExtractFilePath(Application.EXEName)+ph1;

                           // Если файл уже существует и на FTP есть замена для него
                          // - удаляем его для перезаписи
                           if ((FileExists(p1))and(FileExists(p))) then
                           begin
                            Deletefile (p1);
                           end;


                            // Перемещаем файл
                           if MoveFile(Pchar(p),pchar(p1)) then
                            begin
                          // Файл перемещен нормально

                            end else
                            begin
                            // Здесь можно обработать ошибку при перемещении файла
                            end;
                           end;



                       if ((length(ph1)>2)and(ph1<>'dater.exe')) then begin
                         for jiji:=1  to phi1 do
                           begin
                                if l_soft[jiji]=ph1 then phi2:=911;
                           end;
                         if phi2=1 then begin
                                         l_soft[phi1+1]:=ph1;
                                         phi1:=phi1+1;
                                        end;

                        end; //Конец length(ph1)>3
                       end; // Конец while not EOF(F)
                     CloseFile (f);

                 end;       // Конец if not EOF

            // Теперь массив запишем в тот же файл
            if phi1=1 then CloseFile (F);
            if phi1>1 then begin
                            CloseFile (F);

                            AssignFile (F,local_softpath);
                            Rewrite (F);
                            Append (F);
                            for jiji:=1 to phi1 do
                               begin
                               writeln (f,l_soft[jiji]);
                               end;
                            CloseFile (F);

                               ListBox1.Clear; // Очистка листа на прием

                            // Теперь необходимо загрузить апдейтер
                            // и выгрузить данную программу из памяти

                            // Если процесс загружен в память
                            KillTask('pleer.exe'); // Убиваем процесс плеера
                            //ph2:= ExtractFilePath(Application.EXEName)+'DATER.exe';
                            winexec('DATER.exe',SW_Show); // Загружаем модуль апдейтера
                            PLAYER_STARTED:=0; // Плеер остановлен - выводим флаг
                            //Application.Terminate;// Завершаем работу программы

                            CoolTrayIcon1.Enabled:=false;
                            sc.Form1.Close;
                            
                           end;

        end;  //if str_Part1='OO' then...


     // Пришли настройки на FTP
     if str_Part1='FT' then
        begin
         GetZnak (5,Length(Str_GETS),Str_GETS, Str_Part1, J);
         port_FTP:= Str_Part1; // Содержит порт соединения
         GetZnak (6+length(port_FTP),Length(Str_GETS),Str_GETS, Str_Part1, J);
         pass_FTP:=Str_Part1; // Содержит логин доступа к FTP
         GetZnak (7+length(port_FTP)+length(pass_FTP),Length(Str_GETS),Str_GETS, Str_Part1, J);
         log_FTP:=Str_Part1; // Содержит пароль доступа к FTP
         LogMemo.Lines.Append('Сервер: '+datetimetostr(now)+' Порт:'+ port_ftp+', Логин: '+log_ftp+', Пароль: '+pass_ftp);
         steps:=6;
           if UPD_FLAG=1 then begin
                                   SendBox.Items.Append('%oooP%'+name_client+'%GF%'+#13#10);
                                   Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                              end;
           if UPD_FLAG=2 then begin
                                   SendBox.Items.Append('%oooP%'+name_client+'%3U%'+#13#10);
                                   Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Имя файла на закачку');
                              end;

        end; //   if str_Part1='FT' then...



  end //if Str_GETS[1]='%' then
  else begin
        // Пришла строка, не входящая в протокол
        ListBox1.Items.Append('%OO%'); // Забрасываю в очередь обработки завершение
                                       // обработки всвязи с некорректной строкой
       end;





         // Удаляем обработанный элемент
         ListBox1.Items.Delete(0);


      end;

  ResTimer1.Enabled:=True; // Возобнавляем таймер обработки данных
end;



procedure TForm1.SendTimerTimer(Sender: TObject);
begin
SendTimer.Enabled:=False; //Останавливаем таймер отсылки на момент отсылки
    // Если список на обработку не пуст - начинаем обработку
  if SendBox.Items.Count>0 then
      begin
       // Если соединение установлено - отправляем строку из очереди
       if wSocket1.State = wsConnected then
           begin
                wSocket1.SendStr(SendBox.Items[0]);
                SendBox.Items.Delete(0); // Удаляем обработанный элемент

                TimerSEE.Enabled:=False; // Стартуем таймер, контролирующий
                                         // нештатные залипания при передаче данных
  
           end;
      end;

SendTimer.Enabled:=true; //Возобновляем таймер на отсылку
end;

procedure TForm1.FtpClient1Error(Sender: TObject; var Msg: String);
begin
PI_FTP_ERROR:=911; // Ошибка при закачке с ФТП
end;

procedure TForm1.TimerSEETimer(Sender: TObject);
begin
Logmemo.Lines.Append('Клиент: '+datetimetostr (now)+' Сработка модуля антизалипания');
ListBox1.Clear;
ListBox1.Items.Append('%OO%');
ResTimer1.Enabled:=true;
TimerSEE.Enabled:=false;
end;

end.
