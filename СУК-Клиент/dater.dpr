program dater;

uses
  Forms,
  da1 in 'da1.pas' {Form1},
  Thrd in 'Thrd.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
