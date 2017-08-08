unit thrd2;

interface

uses
  Classes, Windows, Messages, SysUtils,DB, IB;

type
  TSimpleThread = class (TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Thrd2.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Thrd2 }
uses sc;

procedure TSimpleThread.Execute;
begin


 try

    sc.Form1.IBDatabase1.Connected := True; // Пробуем подключиться
  except
  {$I+}
      // Если возникает ошибка - обрабатываем ее и снова пробуем подключиться


  on   EIBInterBaseError do
  begin
         sc.Form1.LogMemo.Lines.Append('Ошибка при соединении с БД: ');
   end;


  end;
   // Подключились, выставляем флаги
   if     sc.FLAG_DB_CONNECT=1 then begin
                                  //sc.Form1.StartFBTimer.Enabled:=false;
                                  sc.Form1.LogMemo.Lines.Append('Подключились к БД FireBird');

                                  if sc.PLAYER_STARTED=911 then sc.PLAYER_STARTED:=0;
                                 // sc.Form1.IBQuery1.Active:=true;
                                 // sc.Form1.IBTransaction1.Active:=true;

                             end
                             else begin
                                    sc.Form1.LogMemo.Lines.Append('Проблемы с БД');
                                    sc.PLAYER_STARTED:=911;
                                  end;
   sc.Flag_WORK_thrd:=0;


end;

end.
