unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  shellAPI, Tlhelp32;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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



procedure TForm1.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled:=false;
sleep (3000);
 KillTask('pleer.exe');
 KillTask('Sclient.exe');
sleep (1000);
winexec('Sclient.exe',SW_Show); // Стартуем рестарт
Application.Terminate;
end;

procedure TForm1.For
