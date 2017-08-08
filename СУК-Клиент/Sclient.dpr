program Sclient;

uses
  Forms,
  Windows,
  Sc in 'Sc.pas' {Form1},
  thrd2 in 'thrd2.pas';

{$R *.res}

var
  HM: THandle;
function Check: boolean;
begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'MyOwnMutex');
  Result := (HM <> 0);
  if HM = 0 then HM := CreateMutex(nil, false, 'MyOwnMutex');
end;



begin
  if Check then Exit;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
