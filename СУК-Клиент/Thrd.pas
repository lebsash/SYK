unit Thrd;

interface

uses
  Classes,Windows, Messages, SysUtils;

type
  TSimpleThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation
 uses da1;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TSimpleThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TSimpleThread }

procedure TSimpleThread.Execute;
var i,j : integer;
    f, f1: textfile;
    path1, path2, p, p1, p2, ppk, PLOC2: string;
    fname:string;
begin
// Данный модуль запускается исключительно только для обновления
// системы Клиента - СУК

// По условиям данные о файлах на обновление лежат по адресу
// \local\softupd\up.ini

// Файлы для обновления находятся по адресу
// \local\softupd\

// Сразу же после загрузки формы начинаем процесс обновления

 sleep (2000); // Ждем 2 секунды
 ppk:=da1.PATH_LOC+'prof\prof.ini';
 AssignFile (F,ppk);
  Reset (F);
  Readln (f, PLOC2);
  Readln (f, PLOC2);
  Readln (f, PLOC2);
  Readln (f, PLOC2);
  Readln (f, PLOC2);
  Readln (f, PLOC2);
  Readln (f, PLOC2);
 CloseFile (F);

  path1:=PLOC2+'\softupd\up.ini';
  path2:=PLOC2+'\softupd\';
  da1.Form1.Label1.Caption:='Идет процесс обновления';
  AssignFile (F, path1);
  Reset (F);
  While not EOF (F) do
    begin
      Readln (F, fname);

      // Копируем файл из каталога

    if fname<>'' then begin

    p:=path2+fname;
    p1:=da1.PATH_LOC+fname;

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
     // Здесь может происходить ошибка перемещения
     // Вносим запись об ошибке в log-файл
     AssignFile(f1,da1.PATH_LOC+'ERLOG\error.log' );
      {$I-}
     Append (f1);
      if IOResult <> 0  then
      begin
       // Если файл не существует создаем его
       rewrite (f1);
       Append (f1);
      end;

     p2:= Datetimetostr(now)+' Ошибка при копировании файла ';
     Writeln (F1, p2 );
     p2:= 'Источник: '+p;
     Writeln (F1, p2 );
     p2:= 'Приемник: '+da1.PATH_LOC+fname;
     Writeln (F1, p2 );

     CloseFile (f1);
    end;
   end;
    end;
  CloseFile (F);

  p1:= path2+'Sclient.exe'; // адрес апдейта
  if FileExists(p1) then
     begin


      p2:=copy (path2,1,length(path2)-14);
      p2:=p2+'Sclient.exe'; // Адрес в рабочей папке
      if (FileExists(p2)) then
            begin
               Deletefile (p2);
                if MoveFile(Pchar(p1),Pchar(p2)) then
                           begin
                            // Файл перемещен нормально
                            // Вносим запись об ошибке в log-файл
                               AssignFile(f1,da1.PATH_LOC+'ERLOG\error.log' );
                              {$I-}
                               Append (f1);
                                if IOResult <> 0  then
                                begin
                               // Если файл не существует создаем его
                                 rewrite (f1);
                                 Append (f1);
                                 end;

                               p2:= Datetimetostr(now)+' Файл Sclient.exe обновлен по безусловному сценарию';
                               Writeln (F1, p2 );
                               CloseFile (f1);
                           end else
                            begin
                               // Здесь может происходить ошибка перемещения
                              // Вносим запись об ошибке в log-файл
                               AssignFile(f1,da1.PATH_LOC+'ERLOG\error.log' );
                              {$I-}
                               Append (f1);
                                if IOResult <> 0  then
                                begin
                               // Если файл не существует создаем его
                                 rewrite (f1);
                                 Append (f1);
                                 end;

                               p2:= Datetimetostr(now)+' Ошибка при безусловном копировании файла Sclient.exe ';
                               Writeln (F1, p2 );
                               CloseFile (f1);
                            end;

            end;
     end;


  AssignFile (F, path1);
  Rewrite (F);
  CloseFile (F);

  da1.Form1.Label1.Caption:='Процесс обновления завершен';

end;

end.
