unit da1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Thrd, ExtCtrls, Tlhelp32;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    Thread1, Thread2: TSimpleThread;
    { Public declarations }
  end;

var
  Form1: TForm1;
  PATH_LOC:string;
implementation

{$R *.dfm}


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



procedure TForm1.FormCreate(Sender: TObject);
var p:string;
begin
PATH_LOC:=ExtractFilePath(Application.EXEName);
Thread1 :=TSimpleThread.Create( false );

Thread1.Priority := tpLowest;

Timer1.Enabled:=true;


  {  p:=GetCurrentDir+'\Sclient.exe';
    winexec(pchar(p),SW_Show); // Загружаем модуль апдейтера
 }
 // Закрываем программу


end;

procedure TForm1.Timer1Timer(Sender: TObject);
var p:string;
begin
if da1.Form1.Label1.Caption='Процесс обновления завершен' then
   begin

    Thread1.FreeInstance;
    Timer1.Enabled:=False;

    // Проверяем запущен ли Sclient.exe
    // Если запущен  - убиваем его и Player.exe

     KillTask('pleer.exe');
     KillTask('Sclient.exe');
     sleep (1000);

    p:=ExtractFilePath(Application.EXEName)+'Sclient.exe';
    winexec(pchar(p),SW_Show); // Загружаем модуль апдейтера
    da1.Form1.Close;
   end;
end;

end.
