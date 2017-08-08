unit pl1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, WMPLib_TLB, StdCtrls, IBDatabase, DB, IBCustomDataSet,
  IBQuery, ExtCtrls, IB, AppEvnts;

type
  TForm1 = class(TForm)
    IBDatabase2: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    IBQuery1ID: TIntegerField;
    IBQuery1ID_PLAYER: TIntegerField;
    IBQuery1NAME_FRAME: TIBStringField;
    IBQuery1POS_TOP_X: TIntegerField;
    IBQuery1POS_TOP_Y: TIntegerField;
    IBQuery1POS_BOT_X: TIntegerField;
    IBQuery1POS_BOT_Y: TIntegerField;
    IBQuery1OPISANIE: TIBStringField;
    IBQuery2: TIBQuery;
    IBQuery2ID: TIntegerField;
    IBQuery2ID_FRAME: TIntegerField;
    IBQuery2NAME_FILE: TIBStringField;
    IBQuery2NUM: TIntegerField;
    IBQuery2VOL: TIntegerField;
    IBQuery2DATE1: TDateTimeField;
    IBQuery2TP: TIBStringField;
    Timer1: TTimer;
    IBQuery3: TIBQuery;
    IBQuery3ID: TIntegerField;
    IBQuery3ID_FRAME: TIntegerField;
    IBQuery3NAME_FILE: TIBStringField;
    IBQuery3NUM: TIntegerField;
    IBQuery3VOL: TIntegerField;
    IBQuery3DATE1: TDateTimeField;
    IBQuery3TP: TIBStringField;
    IBQuery4: TIBQuery;
    IBQuery4ID: TIntegerField;
    IBQuery4ID_PLAYER: TIntegerField;
    IBQuery4NAME_FRAME: TIBStringField;
    IBQuery4POS_TOP_X: TIntegerField;
    IBQuery4POS_TOP_Y: TIntegerField;
    IBQuery4POS_BOT_X: TIntegerField;
    IBQuery4POS_BOT_Y: TIntegerField;
    IBQuery4OPISANIE: TIBStringField;
    Memo1: TMemo;
    ApplicationEvents1: TApplicationEvents;
    Timer2: TTimer;
    Memo2: TMemo;

    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure WindowsMediaPlayer1PlayStateChange(ASender: TObject;
  NewState: Integer);
//    procedure MyCurrentItemChange(ASender: TObject;const pdispMedia: IDispatch);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure MyMess(var msg:TMessage); message WM_USER;
    { Private declarations }
  public
    { Public declarations }
  end;



var
  Form1: TForm1;
  But: array[1..100] of TPanel;
  MP: array[1..100] of TWindowsMediaPlayer;

var FLAG_DB_CONNECTION: integer; // Флаг соединения с БД
    j:integer;
    START_FLAG: integer;

    // Для плейлиста сформированного в динамике
    NPF1: array [1..100, 1..100000] of string;   // Имя файла для конкретного фрейма
    NPF2:  array [1..100, 1..100000] of integer; // Значение Volume
    NPF3:  array [1..100] of integer;            // Значение текущего файла для конкретного фрейма
    NPF4:  array [1..100] of string;             // Наименование текущего фрейма
    NPF5:  array [1..100] of integer;            // Кол-во файлов в плейлисте конкретного фрейма
    // Для бегущей строки
      BitMap: array[1..100] of TBitmap;
      TW,X,Y: array [1..100] of Integer;
      Txt   : array [1..100] of String;
      PaintBox: array [1..100] of TPaintBox;
      JUJU: integer;
implementation

uses logo;

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
SetWindowPos( Handle, HWND_TOPMOST, Left, Top, Width, Height,
SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE );
Application.NormalizeTopMosts;
end;

procedure TForm1.FormCreate(Sender: TObject);
var f, f2:textFile;
    s, s1, s6, s5, s4:string;
    GH:string;
    i,k, j1 :integer;
    Media: IWMPMedia;
begin
// Запускаем таймер
Timer1.Enabled:=true;
Timer2.Enabled:=false;
SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
JUJU:=0;

for i:=1 to 100 do NPF5[i]:=0;  // Обнуляем значение счетчика файлов по плейлисту

// Убираем мышь
ShowCursor(False);


// Вносим первоначальные настройки БД
  s6:='127.0.0.1:'+ExtractFilePath(Application.EXEName)+'client.fdb'; // Путь до локальной БД
  IBDataBase2.DatabaseName:=s6;
  IBDatabase2.Params.Clear;
  IBDatabase2.Params.Add('user_name=sysdba');
  IBDatabase2.Params.Add('password=masterkey');
  IBDatabase2.LoginPrompt:=false;
  FLAG_DB_CONNECTION:=1;

// Соединямся с БД
try

   IBDatabase2.Connected := True; // Пробуем подключиться
  except
  {$I+}
  on   EIBInterBaseError do
  begin
    // Пишем данные об ошибке в файл
    FLAG_DB_CONNECTION:=0;
    s:=ExtractFilePath(Application.EXEName)+'log\pleer.log';
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
     s:=datetimetostr(now)+'Не могу соединиться с БД';

     Writeln (f,s);
     CloseFile (f);
  end;
 end;
 // Если соединились с сервером БД, то начинаем трансляцию
 if FLAG_DB_CONNECTION=1 then
    begin
     // Загружаем данные о фреймах

     s:=('select * from FRAME_PLAYER');
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Append(s);
     IBQuery1.Close;
     IBQuery1.Open;
     // В IBQuery1 теперь содержится вся информация о фреймах
     // Необходимо создать панели кол-вом равным кол-ву фреймов
     IBQuery1.First;
     i:=1;
     While not IBQuery1.Eof do
      begin

      if ((IBQuery1OPISANIE.AsString='video') or(IBQuery1OPISANIE.AsString='')) then
      begin
        but[i]:=TPanel.Create(nil);
        but[i].Caption:=IBQuery1NAME_FRAME.AsString;
        But[i].Parent:=Form1;
        but[i].Left:=IBQuery1POS_TOP_X.AsInteger;
        but[i].TOP:=IBQuery1POS_TOP_Y.AsInteger;
        but[i].Width:=IBQuery1POS_BOT_X.AsInteger-IBQuery1POS_TOP_X.AsInteger;
        But[i].Height:=IBQuery1POS_BOT_Y.AsInteger-IBQuery1POS_TOP_Y.AsInteger;;
        But[i].BorderStyle:=bsnone;
        But[i].Color:=clWindowFrame;
        but[i].BevelOuter:=bvNone;
        But[i].Visible:=true;

        mp[i]:=TWindowsMediaPlayer.Create(nil);
        mp[i].Parent:=but[i];
        mp[i].visible:=true;
        mp[i].Hint:=inttostr(i); // Пихаем в поле всплывающей подсказки номер плеера
        mp[i].stretchToFit:=true;
        mp[i].OnPlayStateChange:=WindowsMediaPlayer1PlayStateChange;
        mp[i].Align:=alClient;
        mp[i].uiMode:='none';
        s4:=inttostr(i);
        NPF3[i]:=1; // Начинаем проигрывание с файла...
        // Заполняем медиаконтент

               s1:=('select * from PLAYLIST where ID_FRAME=:ID_FRAME order BY NUM');
               IBQuery2.SQL.Clear;
               IBQuery2.SQL.text:=s1;
               IBQuery2.Params[0].Value:=IBQuery1ID.AsInteger;
               IBQuery2.ParamByName('ID_FRAME').AsInteger:=IBQuery1ID.AsInteger;
               IBQuery2.Close;
               IBQuery2.Open;
               IBQuery2.First;
               j1:=1;
               NPF5[i]:=1;
               While not IBQuery2.Eof do
                 begin

                 if FileExists(ExtractFilePath(Application.EXEName)+'local\'+ IBQuery2NAME_FILE.AsString)
                 then
                 begin
                     s5:=ExtractFilePath(Application.EXEName)+'local\'+ IBQuery2NAME_FILE.AsString;
                     NPF2[i, j1]:=IBQuery2VOL.AsInteger;  // Выставляем уровень звука
                     NPF1[i, j1]:=s5;                     // Добавляем контент
                 end;  //  if FileExists(ExtractFilePath ...

                 IBQuery2.Next;
                 j1:=j1+1; // Смещаем бегунок на следующий файл
                 end;
                 NPF5[i]:=j1-1; // Увеличиваем счетчик файлов
                  START_FLAG:=911;

                // Здесь стартуем плеер
                 mp[i].URL:=NPF1[i, 1];
                 mp[i].Settings.volume:=NPF2[i, 1];
                 mp[i].Controls.Play;



          end //       if ((IBQuery1OPISANIE.AsString='video') or(IBQuery1OPISANIE.AsString='')) then
          else
         if (IBQuery1OPISANIE.AsString='stroka') then
             begin
              JUJU:=JUJU+1;
               but[i]:=TPanel.Create(nil);
               but[i].Caption:=IBQuery1NAME_FRAME.AsString;
               But[i].Parent:=Form1;
               but[i].Left:=IBQuery1POS_TOP_X.AsInteger;
               but[i].TOP:=IBQuery1POS_TOP_Y.AsInteger;
               but[i].Width:=IBQuery1POS_BOT_X.AsInteger-IBQuery1POS_TOP_X.AsInteger;
               But[i].Height:=IBQuery1POS_BOT_Y.AsInteger-IBQuery1POS_TOP_Y.AsInteger;
               But[i].BorderStyle:=bsnone;
               But[i].Color:=clBlack;
               but[i].BevelOuter:=bvNone;
               But[i].Visible:=true;

               // Читаем бегущую строку из файла
               // Для кадого фрейма файл с бегущей строкой свой
               // имя файла: IDPLAYER_IDFRAME.frm
                 GH:=ExtractFilePath(Application.EXEName)+'local\'+inttostr(IBQuery1ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery1ID.AsInteger)+'.str';
                 AssignFile (F2, GH );
                   {$I-}
                    Reset(f2);
                    if IOResult <> 0  then
                    begin
                        // Если файл не существует создаем его
                       txt[JUJU]:='';
                    end else  Readln (F2, txt[JUJU]);
                 CloseFile (F2);

                 BitMap[JUJU] := TBitmap.Create;
                 Bitmap[JUJU].Width := IBQuery1POS_BOT_X.AsInteger-IBQuery1POS_TOP_X.AsInteger;
                 Bitmap[JUJU].Height := IBQuery1POS_BOT_Y.AsInteger-IBQuery1POS_TOP_Y.AsInteger;

                 Bitmap[JUJU].Canvas.Brush.Color := clBlack;
                 Bitmap[JUJU].Canvas.Font.Name := 'Times New Roman';
                 Bitmap[JUJU].Canvas.Font.Size := 25;
                 Bitmap[JUJU].Canvas.Font.Color := clWhite;

                 TW[JUJU] := Bitmap[JUJU].Canvas.TextWidth(txt[JUJU]);

                 PaintBox[JUJU] := TPaintBox.Create(nil);
                 PaintBox[JUJU].Color := clBlack;
                 PaintBox[JUJU].Parent := but[i];
                 PaintBox[JUJU].Width:=IBQuery1POS_BOT_X.AsInteger-IBQuery1POS_TOP_X.AsInteger;
                 PaintBox[JUJU].Height:=IBQuery1POS_BOT_Y.AsInteger-IBQuery1POS_TOP_Y.AsInteger;
                 X[JUJU] := PaintBox[JUJU].Width;
              end; // if (IBQuery1OPISANIE.AsString='stroka') then

               i:=i+1;
               IBQuery1.Next;

      end;

    j:=i-1;
    START_FLAG:=1;
    Timer2.Enabled:=true;
    end;


end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if getasynckeystate($1b)<>0 then Form1.close;

end;


procedure TForm1.WindowsMediaPlayer1PlayStateChange(ASender: TObject;
  NewState: Integer);

var
   f: textfile;
   i, j: integer;
   s, s1:string;
begin
// В этой процедуре пишем лог-файл с проигранными треками

// Если позиция плеера - просмотр закончен - то записываем в лог проигранный файл
// в поле (ASender as TWindowsMediaPlayer).Hint содержится номер текущего плеера
j:=strtoint((ASender as TWindowsMediaPlayer).Hint);
 if (newState=wmppsStopped)then
     begin
       PostMessage(Handle, WM_USER, j, 0);
       s:=ExtractFilePath(Application.EXEName)+'log\'+datetostr(now)+'.log';
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
      s1:=timetostr(now)+ '+'+NPF1[j,NPF3[j]] +'+'+NPF4[j];
      Writeln (f,s1);
      CloseFile(f);
     end;
end;


procedure TForm1.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var f: textfile;
    s, s1:string;
begin

  s:=ExtractFilePath(Application.EXEName)+'log\error.log';
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
     s1:=timetostr(now)+ ' Ошибка: '+E.Message;
     Writeln (f,s1);
     CloseFile(f);

end;

procedure TForm1.FormShow(Sender: TObject);
begin
if not Form2.Timer1.Enabled then Form2.Close; // если таймер уже отключен, то закрыть
with Form1 do
  SetWindowPos(Handle,
    HWND_TOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var g:integer;
begin


 g:=1 ;
 while g<=JUJU do begin

  Bitmap[g].Width := PaintBox[g].Width;
  Bitmap[g].Height := PaintBox[g].Height;
  Bitmap[g].Canvas.Polygon([Point(0, 0), Point(Bitmap[g].Width, 0),
  Point(Bitmap[g].Width, Bitmap[g].Height), Point(0, Bitmap[g].Height)]);

  X[g] := X[g] - 1;
  If X[g] <= -TW[g] then
     X [g] := PaintBox[g].Width;
  Bitmap[g].Canvas.TextOut(X[g],10,txt[g]);
  PaintBox[g].Canvas.Draw(0,0,Bitmap[g]);
  g:=g+1;

  end;


end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
begin
Timer2.Enabled:=false;
Timer1.Enabled:=false;
end;

procedure TForm1.MyMess(var msg: TMessage);
var j:integer;
begin
  j:=msg.WParam;
  if NPF3[j]<NPF5[j] then NPF3[j]:=NPF3[j]+1
                     else if NPF3[j]>=NPF5[j] then NPF3[j]:=1;
        mp[j].URL:=NPF1[j, NPF3[j]];
        mp[j].Settings.volume:=NPF2[j, NPF3[j]];
        mp[j].controls.play;
end;

end.
