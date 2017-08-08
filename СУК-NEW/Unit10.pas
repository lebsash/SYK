unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, Grids, DBGrids, IBQuery, Buttons,
  ComCtrls, Menus, ExtCtrls;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    DBGrid1: TDBGrid;
    IBQuery1ID: TIntegerField;
    IBQuery1PLAYER_ID: TIntegerField;
    IBQuery1PLAYER_NAME: TIBStringField;
    IBQuery1FILE_TO_UPDATE: TIBStringField;
    IBQuery1PATH_FILE_GET: TIBStringField;
    IBQuery1FILE_STATUS: TIntegerField;
    IBQuery1FILE_DOWNLOAD: TIntegerField;
    IBQuery1FILE_VERSION: TIBStringField;
    IBQuery1DATE_DOWNLOAD: TDateTimeField;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    IBQuery2: TIBQuery;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    IBQuery3: TIBQuery;
    IBQuery4: TIBQuery;
    StatusBar1: TStatusBar;
    IBQuery4ID: TIntegerField;
    IBQuery4PLAYER_ID: TIntegerField;
    IBQuery4PLAYER_NAME: TIBStringField;
    IBQuery4FILE_TO_UPDATE: TIBStringField;
    IBQuery4PATH_FILE_GET: TIBStringField;
    IBQuery4FILE_STATUS: TIntegerField;
    IBQuery4FILE_DOWNLOAD: TIntegerField;
    IBQuery4FILE_VERSION: TIBStringField;
    IBQuery4DATE_DOWNLOAD: TDateTimeField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  fn, fp : string;
implementation

uses updserv, SUKServ, dat1, Unit6, Unit7, Unit8, Unit9, Unit4;

{$R *.dfm}

procedure TForm10.FormActivate(Sender: TObject);
var sq:string;
    sum_size:integer;
begin
// Обновляем выдачу согласно выбранному плееру
  sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID';
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Append (sq);
  IBQuery1.ParamByName('PLAYER_ID').AsInteger:=strtoint (label2.Caption);
  IBQuery1.Close;
  IBQuery1.Open;

// Суммируем размер файлов для закачки
  sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID';
  IBQuery4.SQL.Clear;
  IBQuery4.SQL.Append(sq);
  IBQuery4.ParamByName('PLAYER_ID').asInteger:=strtoint (Label2.Caption);
  IBQuery4.Close;
  IBQuery4.Open;
  IBQuery4.First;

  sum_size:=0;
  While not IBQuery4.Eof do
    begin
    sum_size:=sum_size+IBQuery4FILE_DOWNLOAD.AsInteger;
    IBQuery4.Next;
    end;

StatusBar1.Panels[0].Text:='Итого размер закачки: '+ inttostr (sum_size);
end;

procedure TForm10.SpeedButton1Click(Sender: TObject);
var sq:string;
    ftp_path,ff:string;
    F:File;
    fs:integer;
    sum_size:integer;
    searchResult : TSearchRec;
begin
StatusBar1.Panels[1].Text:='Обрабатываем новые данные';

  if OpenDialog1.Execute then
    begin
      fn:=ExtractFileName(OpenDialog1.FileName);
      fp:=ExtractFilePath(OpenDialog1.FileName);
    end;

Form9.SpeedButton1Click (Sender); // Выключаем FTP
Form4.SpeedButton3Click (Sender); // Выключаем сокеты

ftp_path:=SUKserv.ftp_Param3+'\'+Label1.Caption+'\outsoft\';
if DirectoryExists(ftp_path)=false then
CreateDir(ftp_path);


// Теперь скопируем файл на FTP
if CopyFile(Pchar(fp+'\'+fn),pchar(ftp_path+fn),false) then
    begin
    end else
    ShowMessage('Копирование файла: ' + fp+'\'+fn+' прошло неудачно и вызвало ошибку : '+
                                                  IntToStr(GetLastError));


 // Внесем данные о файле в БД

// Узнаем размер файла в байтах
    ff:=fp+fn;

  if FindFirst(ff, faAnyFile, searchResult) = 0 then fs:=searchResult.Size;




   {
    AssignFile(f, ff);
    Reset(f);
    try
       fs := FileSize(f);
       label3.Caption:=inttostr(FileSize(f));
    finally
       CloseFile(f);
    end;
    }

  sq:='insert into ZAD_PO_PLEER  (FILE_DOWNLOAD, FILE_STATUS, FILE_TO_UPDATE, FILE_VERSION, PATH_FILE_GET, PLAYER_ID, PLAYER_NAME) VALUES (:FILE_DOWNLOAD,0,:FILE_NAME,:FILE_VERSION,:PATH_FILE,:PLAYER_ID,:PLAYER_NAME)';
  IBQuery2.SQL.Clear;
  IBQuery2.SQL.Append(sq);
  IBQuery2.ParamByName('FILE_DOWNLOAD').AsInteger:=fs;    // Размер файла
  IBQuery2.ParamByName('FILE_NAME').AsString:=fn;         // Имя файла
  IBQuery2.ParamByName('FILE_VERSION').AsString:='test';  // Версия файла
  IBQuery2.ParamByName('PATH_FILE').AsString:=fp;         // Путь до файла
  IBQuery2.ParamByName('PLAYER_ID').AsInteger:=strtoint(label2.Caption);  // ID плеера
  IBQuery2.ParamByName('PLAYER_NAME').AsString:=label1.Caption;           // Имя плеера
  IBQuery2.Close;
  IBQuery2.Open;
  dat1.DataModule2.IBTransaction1.CommitRetaining;

// Обновляем выдачу на экран
        sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID';
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Append (sq);
        IBQuery1.ParamByName('PLAYER_ID').AsInteger:=strtoint (label2.Caption);
        IBQuery1.Close;
        IBQuery1.Open;

// Суммируем размер файлов для закачки
  sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID';
  IBQuery4.SQL.Clear;
  IBQuery4.SQL.Append(sq);
  IBQuery4.ParamByName('PLAYER_ID').asInteger:=strtoint (Label2.Caption);
  IBQuery4.Close;
  IBQuery4.Open;
  IBQuery4.First;

  sum_size:=0;
  While not IBQuery4.Eof do
    begin
    sum_size:=sum_size+IBQuery4FILE_DOWNLOAD.AsInteger;
    IBQuery4.Next;
    end;

StatusBar1.Panels[0].Text:='Итого размер закачки: '+ inttostr (sum_size);

 Form4.SpeedButton2Click (Sender); // Включаем сокеты
 Form9.SpeedButton2Click (Sender); // Включаем FTP
StatusBar1.Panels[1].Text:='Обработка новых данных завершена';

end;

procedure TForm10.SpeedButton2Click(Sender: TObject);
var sq, pf1:string;
    sum_size:integer;
begin

// Удаляем файл с FTP
        pf1:=SUKserv.ftp_Param3+'\'+Label1.Caption+'\outsoft\'+IBQuery1FILE_TO_UPDATE.asString;
        if DeleteFile(pChar(pf1))= false then
        ShowMessage('Не могу удалить файл '+pf1);


    sq:=' delete from ZAD_PO_PLEER where ID = :OLD_ID and PLAYER_ID = :PLAYER_ID and FILE_TO_UPDATE = :FILE_TO_UPDATE';
    IBQuery3.SQL.Clear;
    IBQuery3.SQL.Append(sq);
    IBQuery3.ParamByName('OLD_ID').AsInteger:=IBQuery1ID.AsInteger;
    IBQuery3.ParamByName('PLAYER_ID').AsInteger:=IBQuery1PLAYER_ID.AsInteger;
    IBQuery3.ParamByName('FILE_TO_UPDATE').AsString:=IBQuery1FILE_TO_UPDATE.AsString;
    IBQuery3.Close;
    IBQuery3.Open;
       dat1.DataModule2.IBTransaction1.CommitRetaining;

    // Обновляем выдачу на экран
        sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID';
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Append (sq);
        IBQuery1.ParamByName('PLAYER_ID').AsInteger:=strtoint (label2.Caption);
        IBQuery1.Close;
        IBQuery1.Open;

// Суммируем размер файлов для закачки
  sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID';
  IBQuery4.SQL.Clear;
  IBQuery4.SQL.Append(sq);
  IBQuery4.ParamByName('PLAYER_ID').asInteger:=strtoint (Label2.Caption);
  IBQuery4.Close;
  IBQuery4.Open;
  IBQuery4.First;

  sum_size:=0;
  While not IBQuery4.Eof do
    begin
    sum_size:=sum_size+IBQuery4FILE_DOWNLOAD.AsInteger;
    IBQuery4.Next;
    end;

StatusBar1.Panels[0].Text:='Итого размер закачки: '+ inttostr (sum_size);



end;

procedure TForm10.SpeedButton3Click(Sender: TObject);
var sum_size:integer;
    sq: string;
begin
// Суммируем размер файлов для закачки
  sq:='select * from ZAD_PO_PLEER where PLAYER_ID=:PLAYER_ID';
  IBQuery4.SQL.Clear;
  IBQuery4.SQL.Append(sq);
  IBQuery4.ParamByName('PLAYER_ID').asInteger:=strtoint (Label2.Caption);
  IBQuery4.Close;
  IBQuery4.Open;
  IBQuery4.First;

  sum_size:=0;
  While not IBQuery4.Eof do
    begin
    sum_size:=sum_size+IBQuery4FILE_DOWNLOAD.AsInteger;
    IBQuery4.Next;
    end;

StatusBar1.Panels[0].Text:='Итого размер закачки: '+ inttostr (sum_size);

end;

procedure TForm10.Timer1Timer(Sender: TObject);
var sq:string;
    ftp_path,ff:string;
    F:File;
    fs:integer;
    sum_size:integer;
    searchResult : TSearchRec;
begin
 

end;

end.
