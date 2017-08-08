unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, Buttons;

type
  TForm11 = class(TForm)
    IBQuery1: TIBQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    IBQuery2: TIBQuery;
    DataSource2: TDataSource;
    IBQuery1ID: TIntegerField;
    IBQuery1UIN: TIntegerField;
    IBQuery1NAME: TIBStringField;
    IBQuery1IP_ADR: TIBStringField;
    IBQuery1OPISANIE: TIBStringField;
    IBQuery1CLIENT_ACTIV: TIntegerField;
    IBQuery1CLIENT_TYPE: TIBStringField;
    IBQuery1DATE_CONNECT: TDateTimeField;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    IBQuery3: TIBQuery;
    IBQuery2ID: TIntegerField;
    IBQuery2ID_PLAYER: TIntegerField;
    IBQuery2NAME_FRAME: TIBStringField;
    IBQuery2POS_TOP_X: TIntegerField;
    IBQuery2POS_TOP_Y: TIntegerField;
    IBQuery2POS_BOT_X: TIntegerField;
    IBQuery2POS_BOT_Y: TIntegerField;
    IBQuery2OPISANIE: TIBStringField;
    SpeedButton1: TSpeedButton;
    IBQuery3ID: TIntegerField;
    IBQuery3ID_PLAYER: TIntegerField;
    IBQuery3ID_FRAME: TIntegerField;
    IBQuery3NAME_FILE: TIBStringField;
    IBQuery3PATH: TIBStringField;
    IBQuery3LOC: TIntegerField;
    IBQuery3SEND: TIntegerField;
    IBQuery3NUM: TIntegerField;
    IBQuery3VOL: TIntegerField;
    IBQuery4: TIBQuery;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses updserv, SUKServ, dat1, unit7;
Var flg:integer;

{$R *.dfm}

procedure TForm11.FormActivate(Sender: TObject);
var sq: string;
begin

sq:='select * from NAME_CONNECTION where CLIENT_TYPE=:CLIENT_TYPE';
IBQuery1.SQL.Clear;
IBQuery1.SQL.Append(sq);
IBQuery1.ParamByName('CLIENT_TYPE').AsString:='pleer';
IBQuery1.Close;
IBQuery1.Open;

sq:='select * from FRAME_PLAYER where ID_PLAYER=:ID_PLAYER';
IBQuery2.SQL.Clear;
IBQuery2.SQL.Append(sq);
IBQuery2.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
IBQuery2.Close;
IBQuery2.Open;

sq:='select * from PLAYLIST where ID_PLAYER=:ID_PLAYER and ID_FRAME=:ID_FRAME order by NUM';
IBQuery3.SQL.Clear;
IBQuery3.SQL.Append(sq);
IBQuery3.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
IBQuery3.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
IBQuery3.Close;
IBQuery3.Open;


end;

procedure TForm11.DBGrid1CellClick(Column: TColumn);
var sq: string;
begin

sq:='select * from FRAME_PLAYER where ID_PLAYER=:ID_PLAYER';
IBQuery2.SQL.Clear;
IBQuery2.SQL.Append(sq);
IBQuery2.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
IBQuery2.Close;
IBQuery2.Open;
sq:='select * from PLAYLIST where ID_PLAYER=:ID_PLAYER and ID_FRAME=:ID_FRAME order by NUM';
IBQuery3.SQL.Clear;
IBQuery3.SQL.Append(sq);
IBQuery3.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
IBQuery3.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
IBQuery3.Close;
IBQuery3.Open;

end;

procedure TForm11.DBGrid2CellClick(Column: TColumn);
var sq:string;
begin


sq:='select * from PLAYLIST where ID_PLAYER=:ID_PLAYER and ID_FRAME=:ID_FRAME order by NUM';
IBQuery3.SQL.Clear;
IBQuery3.SQL.Append(sq);
IBQuery3.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
IBQuery3.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
IBQuery3.Close;
IBQuery3.Open;

end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
var sq:string;
begin


    IBQuery3.First;
  if not IBQuery3.Eof then begin
    // Удалим текущий плейлист
    sq:='delete from PLAYLIST  where ID_PLAYER = :ID_PLAYER and ID_FRAME=:ID_FRAME';
    IBQuery4.SQL.Clear;
    IBQuery4.SQL.Append(sq);
    IBQuery4.ParamByName('ID_PLAYER').AsInteger:=form7.IBQuery2ID_PLAYER.AsInteger; // ID - плеера
    IBQuery4.ParamByName('ID_FRAME').AsInteger:=form7.IBQuery2ID.AsInteger; // ID фрейма
    IBQuery4.Close;
    IBQuery4.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;
    // Добавим новый плейлист
    Sq:='insert into PLAYLIST  (ID_PLAYER, ID_FRAME, NAME_FILE, PATH, LOC, SEND, NUM, VOL) VALUES (:IP_PLAYER, :ID_FRAME, :NAME_FILE, :PATH, :LOC, "0", :NUM, :VOL)';


    while not IBQuery3.Eof do
    begin
    form7.IBQuery5.SQL.Clear;
    form7.IBQuery5.SQL.Append(sq);


    form7.IBQuery5.ParamByName('IP_PLAYER').AsInteger:=form7.IBQuery2ID_PLAYER.AsInteger; // ID - плеера
    form7.IBQuery5.ParamByName('ID_FRAME').AsInteger:=form7.IBQuery2ID.AsInteger; // ID фрейма


    form7.IBQuery5.ParamByName('NAME_FILE').AsString:=IBQuery3NAME_FILE.AsString;
    form7.IBQuery5.ParamByName('PATH').AsString:=IBQuery3PATH.AsString;
    form7.IBQuery5.ParamByName('LOC').AsInteger:=IBQuery3LOC.AsInteger;
    form7.IBQuery5.ParamByName('NUM').AsInteger:=IBQuery3NUM.AsInteger;
    form7.IBQuery5.ParamByName('VOL').AsInteger:=IBQuery3VOL.AsInteger;   // Значение громкости

    form7.IBQuery5.Close;
    form7.IBQuery5.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;
    IBQuery3.Next;
    end;
    // Обновляем выдачу
    form7.IBQuery6.ParamByName('ID_PLAYER').AsInteger:=form7.IBQuery2ID_PLAYER.AsInteger;
    form7.IBQuery6.ParamByName('ID_FRAME').AsInteger:=form7.IBQuery2ID.AsInteger;
    form7.IBQuery6.Close;
    form7.IBQuery6.Open;
   end;
end;

end.
