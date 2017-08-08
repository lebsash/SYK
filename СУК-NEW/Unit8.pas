unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, Menus,
  ComCtrls;

type
  TForm8 = class(TForm)
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    IBQuery1ID: TIntegerField;
    IBQuery1ID_PLAYER: TSmallintField;
    IBQuery1NAME_FILE: TIBStringField;
    IBQuery1SIZE_FILE: TIntegerField;
    IBQuery1DOWNLOADED: TIntegerField;
    IBQuery1DATE_TO_UPD: TDateTimeField;
    IBQuery1PATH_FILE: TIBStringField;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    IBQuery2: TIBQuery;
    Label2: TLabel;
    IBQuery3: TIBQuery;
    IBQuery3ID: TIntegerField;
    IBQuery3ID_PLAYER: TSmallintField;
    IBQuery3NAME_FILE: TIBStringField;
    IBQuery3SIZE_FILE: TIntegerField;
    IBQuery3DOWNLOADED: TIntegerField;
    IBQuery3DATE_TO_UPD: TDateTimeField;
    IBQuery3PATH_FILE: TIBStringField;
    IBQuery4: TIBQuery;
    IBQuery4ID: TIntegerField;
    IBQuery4ID_PLAYER: TSmallintField;
    IBQuery4NAME_FILE: TIBStringField;
    IBQuery4SIZE_FILE: TIntegerField;
    IBQuery4DOWNLOADED: TIntegerField;
    IBQuery4DATE_TO_UPD: TDateTimeField;
    IBQuery4PATH_FILE: TIBStringField;
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
uses ShellAPI, updserv, SUKServ, dat1, Unit6, Unit5;
{$R *.dfm}

procedure TForm8.FormActivate(Sender: TObject);
var sq:string;
    file_size:integer;
begin
  sq:='select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Append(sq);
  IBQuery1.ParamByName('ID_PLAYER').AsInteger:=strtoint(label1.Caption);
  IBQuery1.Close;
  IBQuery1.Open;

// Считаем размер данных на закачку
  file_size:=0;
  sq:='select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
  IBQuery3.SQL.Clear;
  IBQuery3.SQL.Append(sq);
  IBQuery3.ParamByName('ID_PLAYER').AsInteger:=strtoint(label1.Caption);
  IBQuery3.close;
  IBQuery3.open;
  IBQuery3.First;
  While not IBQuery3.Eof do
    begin
    file_size:=file_size+IBQuery3SIZE_FILE.AsInteger;
    IBQuery3.Next;
    end;
   StatusBar1.Panels[0].Text:='Размер: '+inttostr(file_size)+' байт';
end;

procedure TForm8.N1Click(Sender: TObject);
var st, sq, ge1, ge2, ge3, pf1:string;
begin
// Производим удаление плейлиста из списка закачек ЦЕЛЕКОМ
  st:='Вы действительно хотите удалить плейлист для плеера '+ Label2.Caption+'?';
  if MessageDlg(st, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

     //Удаляем файлы с FTP
    sq:='select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
    IBQuery4.SQL.Clear;
    IBQuery4.SQL.Append(sq);
    IBQuery4.ParamByName('ID_PLAYER').AsInteger:=strtoint (Label1.Caption);
    IBQuery4.Close;
    IBQuery4.Open;

    IBQuery4.First;
    While not IBQuery4.Eof do
       begin
        pf1:=SUKServ.ftp_Param3+'\'+Label2.Caption+'\outlist\'+IBQuery4NAME_FILE.AsString;
        if DeleteFile(pChar(pf1))= false then
        ShowMessage('Не могу удалить файл '+pf1);
        IBQuery4.Next;
       end;


    // Удаляем записи из таблицы
    sq:='delete from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
    IBQuery2.SQL.Clear;
    IBQuery2.SQL.Append(sq);
    IBQuery2.ParamByName('ID_PLAYER').AsInteger:=strtoint (Label1.Caption);
    IBQuery2.Close;
    IBQuery2.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;

    // Запишем в лог-файл информацию о плейлисте
     ge1:=GetCurrentDir+'\logs\'+Label2.caption + '.log';
     ge2:=DateToStr(Now)+' '+timetostr(now)+' Плейлист удален из списка задач ';
     Form1.STL (ge1,ge2,ge3);



    // Обновляем выдачу
      IBQuery1.ParamByName('ID_PLAYER').AsInteger:=strtoint(label1.Caption);
      IBQuery1.Close;
      IBQuery1.Open;
      StatusBar1.Panels[0].Text:='Плейлист удален из закачки';

  end;

end;

end.
