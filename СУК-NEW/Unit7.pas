unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids, Buttons, Menus, DBCtrls, dbcgrids;


type



  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    IBQuery1: TIBQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Image1: TImage;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    IBQuery2: TIBQuery;
    DataSource1: TDataSource;
    IBQuery2ID: TIntegerField;
    IBQuery2ID_PLAYER: TIntegerField;
    IBQuery2NAME_FRAME: TIBStringField;
    IBQuery2POS_TOP_X: TIntegerField;
    IBQuery2POS_TOP_Y: TIntegerField;
    IBQuery2POS_BOT_X: TIntegerField;
    IBQuery2POS_BOT_Y: TIntegerField;
    IBQuery2OPISANIE: TIBStringField;
    N1: TMenuItem;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    IBQuery3: TIBQuery;
    IBQuery4: TIBQuery;
    IBQuery4ID: TIntegerField;
    IBQuery4ID_PLAYER: TIntegerField;
    IBQuery4NAME_FRAME: TIBStringField;
    IBQuery4POS_TOP_X: TIntegerField;
    IBQuery4POS_TOP_Y: TIntegerField;
    IBQuery4POS_BOT_X: TIntegerField;
    IBQuery4POS_BOT_Y: TIntegerField;
    IBQuery4OPISANIE: TIBStringField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid3: TDBGrid;
    IBQuery5: TIBQuery;
    DataSource3: TDataSource;
    IBQuery6: TIBQuery;
    IBQuery6ID: TIntegerField;
    IBQuery6ID_PLAYER: TIntegerField;
    IBQuery6ID_FRAME: TIntegerField;
    IBQuery6NAME_FILE: TIBStringField;
    IBQuery6PATH: TIBStringField;
    IBQuery6LOC: TIntegerField;
    IBQuery6SEND: TIntegerField;
    IBQuery6NUM: TIntegerField;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    TrackBar1: TTrackBar;
    IBQuery7: TIBQuery;
    IBQuery7ID: TIntegerField;
    IBQuery7ID_PLAYER: TIntegerField;
    IBQuery7ID_FRAME: TIntegerField;
    IBQuery7NAME_FILE: TIBStringField;
    IBQuery7PATH: TIBStringField;
    IBQuery7LOC: TIntegerField;
    IBQuery7SEND: TIntegerField;
    IBQuery7NUM: TIntegerField;
    IBQuery7VOL: TIntegerField;
    SpeedButton2: TSpeedButton;
    IBQuery5ID: TIntegerField;
    IBQuery5ID_PLAYER: TIntegerField;
    IBQuery5ID_FRAME: TIntegerField;
    IBQuery5NAME_FILE: TIBStringField;
    IBQuery5PATH: TIBStringField;
    IBQuery5LOC: TIntegerField;
    IBQuery5SEND: TIntegerField;
    IBQuery5NUM: TIntegerField;
    IBQuery5VOL: TIntegerField;
    IBQuery6VOL: TIntegerField;
    N7: TMenuItem;
    N8: TMenuItem;
    IBQuery8: TIBQuery;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    N9: TMenuItem;
    N10: TMenuItem;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Label3: TLabel;
    Label10: TLabel;
    SpeedButton5: TSpeedButton;

    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure DBGrid3DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBGrid3StartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DataSource3StateChange(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrackBar1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N10Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    //procedure DBGrid3DragDrop(Sender, Source: TObject; X, Y: Integer);
  private

    { Private declarations }
  public
      procedure WMDropFiles(var Msg: TWMDropFiles);
      message WM_DROPFILES;
    procedure RISOVANIE (st:string);
    { Public declarations }
  end;

var
  Form7: TForm7;
  g, b1, b:integer;
implementation




uses ShellAPI, updserv, SUKServ, dat1, Unit6, Unit5, Unit11;
var NAME_PLEER, NAME_CHECKED_PLAYER: string;
    ID_PLAYER, i, x1,y1:  integer;
    Flag_Memo1: integer;



{$R *.dfm}

type 
  TMyDragObject = class (TDragObject)
    ID :Variant;
  public
    constructor Create (AID :Variant);
  end;

constructor TMyDragObject.Create (AID :Variant);
begin
  inherited Create;
  ID := AID;
end;


// Процедура прорисовки расположения фреймов
procedure TForm7.RISOVANIE (st:string);
var j,X2, Y2:integer;
    TheRect: TRect;
    CX1,CX2,CY1,CY2:integer;
Begin
 //Пройдемся по таблице, параллельно рисуя все фреймы
IBQuery4.ParamByName('ID_PLAYER').AsInteger:=ID_PLAYER;
IBQuery4.Close;
IBQuery4.Open;

with Image1.Canvas do
begin
    Brush.Color:=clGray; //задаем цвет фона
    FillRect(ClipRect);
    Pen.Width:=3; //ширина линии
    Pen.Color:=clRed;

    IBQuery4.First;
    while not IBQuery4.Eof do
     begin
    // Для корректного отображения необходимо пересчитать координаты
    CX1:= (IBQuery4POS_TOP_X.AsInteger div 2);
    CY1:= (IBQuery4POS_TOP_Y.AsInteger div 2);
    CX2:= (IBQuery4POS_BOT_X.AsInteger div 2);
    CY2:= (IBQuery4POS_BOT_Y.AsInteger div 2);
      Brush.Color:=clGray;
      TheRect:=Rect(CX1,CY1,CX2,CY2);
      Rectangle(TheRect);
      if CX1=0 then X2:= ((CX2-1) div 2) else
      if CX2=0 then X2:=CX2 else
      IF CY1=0 then Y2:= ((CY2-1) div 2) else
      IF CY2=0 then Y2:= CY2 else
       begin
         X2:= ((CX2-CX1) div 2);
         Y2:= ((CY2-CY1) div 2);
       end;
      if IBQuery4OPISANIE.AsString='video' then Brush.Color:=clBlue
      else if IBQuery4OPISANIE.AsString='stroka' then Brush.Color:=clGreen
       else if IBQuery4OPISANIE.AsString='Flash' then Brush.Color:=clRed
        else Brush.Color:=clBlue;


      TextRect(TheRect,CX1+X2,CY1+Y2, IBQuery4NAME_FRAME.AsString );

      IBQuery4.Next;
     end;
 end;
End;


procedure TForm7.WMDropFiles(var Msg: TWMDropFiles);
var
 HF: THandle;
  s: array [0..1023] of char;
  i, FileCount: integer; 
  p: TPoint; 
  ts: TTabSheet;
  memo: TMemo;
  k1,k2:integer;
  sq:string;
  num1:integer;
begin 
  HF := Msg.Drop;
  FileCount := DragQueryFile(HF, $FFFFFFFF, nil, 0);
  for i := 0 to FileCount - 1 do begin 
    DragQueryFile(HF, i, s, sizeof(s)); 
    ts := TTabSheet.Create(nil); 
{    DragQueryPoint(HF, p);
    if PtInRect(PageControl1.BoundsRect, p)
      then ts.PageControl := PageControl1
      else ts.PageControl := PageControl2;
}
   // Вносим Имя файла и путь в IBQuery5
   // Через IBQuery6 обновляем выдачу
    num1:=0;
    k1:=IBQuery2ID_PLAYER.AsInteger; // ID - плеера
    k2:=IBQuery2ID.AsInteger; // ID - фрейма


    //Вычисляем num поля, для присвоения максимального
    Sq:=('select * FROM PLAYLIST where ID_PLAYER=:IP_PLAYER and ID_FRAME=:ID_FRAME order by NUM');
    IBQuery5.SQL.Clear;
    IBQuery5.SQL.Append(sq);
    IBQuery5.ParamByName('IP_PLAYER').AsInteger:=k1;
    IBQuery5.ParamByName('ID_FRAME').AsInteger:=k2;
    IBQuery5.Close;
    IBQuery5.Open;
    IBQuery5.Last;
    num1:=IBQuery5NUM.asInteger;
    num1:=num1+1;


    Sq:='insert into PLAYLIST  (ID_PLAYER, ID_FRAME, NAME_FILE, PATH, LOC, SEND, NUM, VOL) VALUES (:IP_PLAYER, :ID_FRAME, :NAME_FILE, :PATH, :LOC, "0", :NUM, :VOL)';
    IBQuery5.SQL.Clear;
    IBQuery5.SQL.Append(sq);
    IBQuery5.ParamByName('IP_PLAYER').AsInteger:=k1;
    IBQuery5.ParamByName('ID_FRAME').AsInteger:=k2;
    ts.Caption := ExtractFileName(s);
    IBQuery5.ParamByName('NAME_FILE').AsString:=ts.Caption;
    IBQuery5.ParamByName('PATH').AsString:=s;
    IBQuery5.ParamByName('LOC').AsInteger:=1;
    IBQuery5.ParamByName('NUM').AsInteger:=num1;
    IBQuery5.ParamByName('VOL').AsInteger:=100;   // Значение громкости

    IBQuery5.Close;
    IBQuery5.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;

    // Обновляем выдачу
    IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
    IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
    IBQuery6.Close;
    IBQuery6.Open;



  end;
  DragFinish(HF);
end;

procedure TForm7.FormDockOver(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept:=true;
end;



procedure TForm7.FormCreate(Sender: TObject);
begin
 // Позволяем перетаскивать файлы извне в программу
 DragAcceptFiles(Form7.Handle, true);
 Flag_Memo1:=0; // Флаг изменения memo1
end;

procedure TForm7.FormDestroy(Sender: TObject);
begin
 // Закрываем перетаскивание файлов извне
 DragAcceptFiles(Form7.Handle, false);
end;

procedure TForm7.BitBtn1Click(Sender: TObject);
var sq:string;
begin
//Сохраняем изменения в таблице
IBQuery3.SQL.Clear;
Sq:='update FRAME_PLAYER set POS_TOP_X=:POS_TOP_X, POS_TOP_Y=:POS_TOP_Y,POS_BOT_X=:POS_BOT_X, POS_BOT_Y=:POS_BOT_Y, OPISANIE=:OPISANIE  where NAME_FRAME=:Name';
IBQuery3.SQL.Append(Sq);
IBQuery3.ParamByName('POS_TOP_X').AsInteger:=strtoint(Edit2.Text);
IBQuery3.ParamByName('POS_BOT_X').AsInteger:=strtoint(Edit3.Text);
IBQuery3.ParamByName('POS_TOP_Y').AsInteger:=strtoint(Edit4.Text);
IBQuery3.ParamByName('POS_BOT_Y').AsInteger:=strtoint(Edit5.Text);
if ComboBox1.Text =  'Плеер' then IBQuery3.ParamByName('OPISANIE').AsString:='video'; // Тип фрейма
if ComboBox1.Text =  'Бегущая строка' then IBQuery3.ParamByName('OPISANIE').AsString:='stroka'; // Тип фрейма
if ComboBox1.Text =  'Flash' then IBQuery3.ParamByName('OPISANIE').AsString:='Flash'; // Тип фрейма


IBQuery3.ParamByName('NAME').AsString:=NAME_CHECKED_PLAYER;
IBQuery3.Close;
IBQuery3.Open;

//Обновляем выдачу
IBQuery2.ParamByName('ID_PLAYER').AsInteger:=ID_PLAYER;
IBQuery2.Close;
IBQuery2.Open;

IBQuery4.ParamByName('ID_PLAYER').AsInteger:=ID_PLAYER;
IBQuery4.Close;
IBQuery4.Open;
    IBQuery2.First;
    while ((not IBQuery2.Eof)and(CompareText(IBQuery2NAME_FRAME.AsString,NAME_CHECKED_PLAYER )<>0)) do
     begin
     IBQuery2.Next;
     End;


 RISOVANIE('start');
end;

procedure TForm7.Image1Click(Sender: TObject);
var CX1, CX2, CY1, CY2: integer;
begin


IBQuery2.First;
while not IBQuery2.Eof do
 begin
  // Для корректного отображения необходимо преобразовать координаты
    CX1:= (IBQuery2POS_TOP_X.AsInteger div 2);
    CY1:= (IBQuery2POS_TOP_Y.AsInteger div 2);
    CX2:= (IBQuery2POS_BOT_X.AsInteger div 2);
    CY2:= (IBQuery2POS_BOT_Y.AsInteger div 2);


  if ((X1>CX1) and (X1<CX2) and
(y1>CY1) and(y1<CY2))
   then
     begin

    NAME_CHECKED_PLAYER:=IBQuery2NAME_FRAME.AsString;
    Edit2.Text:=inttostr(IBQuery2POS_TOP_X.asInteger);
    Edit4.Text:=inttostr(IBQuery2POS_TOP_Y.asInteger);
    Edit3.Text:=inttostr(IBQuery2POS_BOT_X.asInteger);
    Edit5.Text:=inttostr(IBQuery2POS_BOT_Y.asInteger);
    if IBQuery2OPISANIE.AsString='video' then ComboBox1.Text:='Плеер'
    else if IBQuery2OPISANIE.AsString='stroka' then ComboBox1.Text:='Бегущая строка'
        else if IBQuery2OPISANIE.AsString='Flash' then ComboBox1.Text:='Flash'
        else ComboBox1.Text:='Плеер';

        exit;

     End;
     //Выдаем координаты для заполнения


 IBQuery2.Next;
    end;

end;

procedure TForm7.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
x1:=x;
y1:=y;
end;

procedure TForm7.FormActivate(Sender: TObject);
begin

SpeedButton1.Enabled:=false;
Edit1.Text:='';
// Получаем имя текущего плеера через label1.caption;
 NAME_PLEER:=label1.Caption;
 ID_PLAYER:=strtoint(Label2.caption);
 Form7.Caption:='СУК - Управление плеером:  '+NAME_PLEER;

// Обновляем выдачу списка фреймов
 IBQuery2.ParamByName('ID_PLAYER').AsInteger:=ID_PLAYER;
 IBQuery2.Close;
 IBQuery2.Open;

 IBQuery4.ParamByName('ID_PLAYER').AsInteger:=ID_PLAYER;
 IBQuery4.Close;
 IBQuery4.Open;

 RISOVANIE('start'); // Отрисовка фреймов

Edit2.Text:=inttostr(IBQuery2POS_TOP_X.asInteger);
Edit4.Text:=inttostr(IBQuery2POS_TOP_Y.asInteger);
Edit3.Text:=inttostr(IBQuery2POS_BOT_X.asInteger);
Edit5.Text:=inttostr(IBQuery2POS_BOT_Y.asInteger);

IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
IBQuery6.Close;
IBQuery6.Open;

if IBQuery2OPISANIE.AsString='video' then begin
                                            DBGrid3.Visible:=true;
                                            memo1.Visible:=false;
                                            SpeedButton5.Visible:=False;
                                             TrackBar1.Visible:=true;
                                             SpeedButton2.Visible:=true;
                                          end else
if IBQuery2OPISANIE.AsString='stroka' then begin
                                            DBGrid3.Visible:=false;
                                            memo1.Visible:=true;
                                             Flag_Memo1:=0; // Флаг изменения memo1
                                             SpeedButton5.Visible:=true;
                                             SpeedButton5.Enabled:=false;
                                             TrackBar1.Visible:=false;
                                             SpeedButton2.Visible:=false;
                                            // Ищем файл с  именем, если файл существует - заполняем memo1
                                            if FileExists(ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str') then
                                                               begin
                                                               memo1.Lines.LoadFromFile(ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str');
                                                               end;                                             
                                           end else
                                           begin
                                            DBGrid3.Visible:=true;
                                            memo1.Visible:=false;
                                            SpeedButton5.Visible:=False;
                                             TrackBar1.Visible:=true;
                                             SpeedButton2.Visible:=true;                                            
                                           end;

end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
var flag:integer; // Флаг схожести имени фрейма с уже имеющимися в данном плеере
    f1, str1, res1: string;
begin
// Проверяем на наличие данного имени в списке фреймов
    flag:=0;
    IBQuery2.First;
    while not IBQuery2.Eof do
    begin
      if CompareText(IBQuery2NAME_FRAME.AsString, Edit1.Text) = 0
         then begin
                MessageDlg('Фрейм с таким именем уже существует', mtInformation,
                [mbOk], 0);
                flag:=1;
              end;
      IBQuery2.Next;
    end;

// Исли фрейм с данным именем еще не существует - добавляем запись в БД
     If flag=0 then
        begin
         IBQuery1.SQL.Clear;
         IBQuery1.SQL.Append('insert into FRAME_PLAYER  (ID_PLAYER, NAME_FRAME, POS_TOP_X, POS_TOP_Y, POS_BOT_X, POS_BOT_Y, OPISANIE) VALUES (:ID_PLAYER,:NAME_PLEER,:POS_TOP_X,:POS_TOP_Y,:POS_BOT_X,:POS_BOT_Y,:OPIS)');
         IBQuery1.ParamByName('ID_PLAYER').AsInteger:=strtoint(label2.caption);
         IBQuery1.ParamByName('NAME_PLEER').AsString:=Edit1.Text;
         IBQuery1.ParamByName('POS_TOP_X').AsInteger:=0;
         IBQuery1.ParamByName('POS_TOP_Y').AsInteger:=0;
         IBQuery1.ParamByName('POS_BOT_X').AsInteger:=0;
         IBQuery1.ParamByName('POS_BOT_Y').AsInteger:=0;
         IBQuery1.ParamByName('OPIS').AsString:='';
         IBQuery1.Close;
         IBQuery1.Open;
         dat1.DataModule2.IBTransaction1.CommitRetaining;
         IBQuery2.ParamByName('ID_PLAYER').AsInteger:=ID_PLAYER;
         IBQuery2.Close;
         IBQuery2.Open;
            // Логируем информацию
            f1:=GetCurrentDir+'\logs\'+NAME_PLEER + '.log';
            str1:=DateToStr(Now)+' '+timetostr(now)+' СОЗДАН ФРЕЙМ: '+Edit1.text;
            Form1.STL (f1,str1,res1);

            // Восстанавливаем визуальную картину на форме
         Edit1.Text:='';
         SpeedButton1.Enabled:=false;
        end;
end;

procedure TForm7.Edit1Change(Sender: TObject);
begin
if length (Edit1.Text)<1 then SpeedButton1.Enabled:=false
                         else SpeedButton1.Enabled:=true;
end;

procedure TForm7.N1Click(Sender: TObject);
var st:string;
    sq:string;
    t1:integer;
    t11,f1,str1,res1:string;
begin
// Запрашиваем на удаление фрейма
// Если действительно нужно удалить - удаляем из таблицы фреймов
  st:='Вы действительно хотите УДАЛИТЬ фрейм? '+IBQuery2NAME_FRAME.asstring;
  if MessageDlg(st, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    t1:=IBQuery2ID.AsInteger;
    t11:=IBQuery2NAME_FRAME.asstring;
    sq:='delete from FRAME_PLAYER where ID = :OLD_ID and NAME_FRAME=:OLD_NAME';
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Append(sq);
    IBQuery1.ParamByName('OLD_ID').AsInteger:=IBQuery2ID.AsInteger;
    IBQuery1.ParamByName('OLD_NAME').AsString:=IBQuery2NAME_FRAME.AsString;
    IBQuery1.Close;
    IBQuery1.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;

// Удаляем из плейлиста
// Чистим вот по ID_PLAYER и ID_FRAME
   sq:='delete from PLAYLIST  where ID_PLAYER = :ID_PLAYER and ID_FRAME=:ID_FRAME';
   IBQuery8.SQL.Clear;
   IBQuery8.SQL.Append(sq);
   IBQuery8.ParamByName('ID_PLAYER').AsInteger:=ID_PLAYER;
   IBQuery8.ParamByName('ID_FRAME').AsInteger:=t1;
   IBQuery8.Close;
   IBQuery8.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;
       //Обновляем выдачу
     IBQuery2.ParamByName('ID_PLAYER').AsInteger:=ID_PLAYER;
     IBQuery2.Close;
     IBQuery2.Open;
     PageControl1.ActivePage := Tabsheet1;

                // Логируем информацию
            f1:=GetCurrentDir+'\logs\'+NAME_PLEER + '.log';
            str1:=DateToStr(Now)+' '+timetostr(now)+' Удален фрейм: '+t11;
            Form1.STL (f1,str1,res1);


  end;

end;

procedure TForm7.DBGrid1CellClick(Column: TColumn);
begin
//Выдаем координаты для заполнения
NAME_CHECKED_PLAYER:=IBQuery2NAME_FRAME.AsString;
Edit2.Text:=inttostr(IBQuery2POS_TOP_X.asInteger);
Edit4.Text:=inttostr(IBQuery2POS_TOP_Y.asInteger);
Edit3.Text:=inttostr(IBQuery2POS_BOT_X.asInteger);
Edit5.Text:=inttostr(IBQuery2POS_BOT_Y.asInteger);
    if IBQuery2OPISANIE.AsString='video' then ComboBox1.Text:='Плеер'
    else if IBQuery2OPISANIE.AsString='stroka' then ComboBox1.Text:='Бегущая строка'
        else if IBQuery2OPISANIE.AsString='Flash' then ComboBox1.Text:='Flash'
        else ComboBox1.Text:='Плеер';


// Обновляем TabShit2
IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
IBQuery6.Close;
IBQuery6.Open;
if IBQuery2OPISANIE.AsString='video' then begin
                                            DBGrid3.Visible:=true;
                                            memo1.Visible:=false;
                                             SpeedButton5.Visible:=False;
                                             TrackBar1.Visible:=true;
                                             SpeedButton2.Visible:=true;
                                          end else
if IBQuery2OPISANIE.AsString='stroka' then begin
                                            DBGrid3.Visible:=false;
                                            memo1.Visible:=true;
                                            Flag_Memo1:=0; // Флаг изменения memo1
                                            // Ищем файл с  именем, если файл существует - заполняем memo1
                                            if FileExists(ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str') then
                                                               begin
                                                               memo1.Lines.LoadFromFile(ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str');
                                                               end else Memo1.Clear;

                                             SpeedButton5.Visible:=true;
                                             SpeedButton5.Enabled:=false;
                                             TrackBar1.Visible:=false;
                                             SpeedButton2.Visible:=false;
                                           end else
                                           begin
                                            DBGrid3.Visible:=true;
                                            memo1.Visible:=false;
                                            SpeedButton5.Visible:=False;
                                             TrackBar1.Visible:=true;
                                             SpeedButton2.Visible:=true;
                                           end;

end;

procedure TForm7.Edit2KeyPress(Sender: TObject; var Key: Char);
begin

if not (key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', char(ord(vk_delete))]) then
begin
beep;
key := #0;
end;

end;

procedure TForm7.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', char(ord(vk_delete))]) then
begin
beep;
key := #0;
end;
end;

procedure TForm7.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', char(ord(vk_delete))]) then
begin
beep;
key := #0;
end;
end;

procedure TForm7.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', char(ord(vk_delete))]) then
begin
beep;
key := #0;
end;
end;

procedure TForm7.DBGrid3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
 Accept := True;

end;

procedure TForm7.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
IBQuery6.Close;
IBQuery6.Open;
if IBQuery2OPISANIE.AsString='video' then begin
                                            DBGrid3.Visible:=true;
                                            memo1.Visible:=false;
                                            SpeedButton5.Visible:=false;
                                             TrackBar1.Visible:=true;
                                             SpeedButton2.Visible:=true;
                                          end else
if IBQuery2OPISANIE.AsString='stroka' then begin
                                            DBGrid3.Visible:=false;
                                            memo1.Visible:=true;
                                            Flag_Memo1:=0; // Флаг изменения memo1
                                            SpeedButton5.Visible:=true;
                                            SpeedButton5.Enabled:=false;
                                             TrackBar1.Visible:=false;
                                             SpeedButton2.Visible:=false;
                                            // Ищем файл с  именем, если файл существует - заполняем memo1
                                            if FileExists(ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str') then
                                                               begin
                                                               memo1.Lines.LoadFromFile(ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str');
                                                               end;                                             
                                           end else
                                           begin
                                            DBGrid3.Visible:=true;
                                            memo1.Visible:=false;
                                            SpeedButton5.Visible:=false;
                                             TrackBar1.Visible:=true;
                                             SpeedButton2.Visible:=true;                                            
                                           end;

//if PageControl1.ActivePage=TabSheet2 then DBGrid3.SetFocus;
end;

procedure TForm7.DBGrid3DragDrop(Sender, Source: TObject; X, Y: Integer);
var 
  pos : TGridCoord;
  a,a1, n :integer;
  sq:string;
  I, RowToSkip: Integer;

begin

 b:=IBQuery6NUM.AsInteger;
 b1:=IBQuery6ID.AsInteger;



 pos := DBGrid3.MouseCoord(X, Y);

  if pos.Y > 0 then begin

    RowToSkip := pos.Y - DBCTRLGRID1.RowCount;;
    if RowToSkip > 0 then
      for I := 1 to RowToSkip do DBGrid3.DataSource.DataSet.Next
    else
      for I := 1 to -RowToSkip do DBGrid3.DataSource.DataSet.Prior;
  end;



  //pos := DBGrid3.MouseCoord(X, Y);
// Ставим перед той на кот. мышь



  (Sender as TDBGrid).DataSource.Dataset.RecNo:=pos.Y;
  a:= (Sender as TDBGrid).DataSource.Dataset.FieldValues['NUM'];
  a1:= (Sender as TDBGrid).DataSource.Dataset.FieldValues['ID'];



    Sq:='Update PLAYLIST set NUM=:NUM where ID=:ID ';

    IBQuery5.SQL.Clear;
    IBQuery5.SQL.Append(sq);
    IBQuery5.ParamByName('NUM').AsInteger:=b;
    IBQuery5.ParamByName('ID').AsInteger:=a1;
    IBQuery5.Close;
    IBQuery5.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;

   Sq:='Update PLAYLIST set NUM=:NUM where ID=:ID ';

    IBQuery5.SQL.Clear;
    IBQuery5.SQL.Append(sq);
    IBQuery5.ParamByName('NUM').AsInteger:=a;
    IBQuery5.ParamByName('ID').AsInteger:=b1;
    IBQuery5.Close;
    IBQuery5.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;

IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
IBQuery6.Close;
IBQuery6.Open;


end;




procedure TForm7.DBGrid3StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
 DragObject:=TMyDragObject.Create((Sender as TDBGrid).DataSource.Dataset.FieldValues['ID']);
end;

procedure TForm7.DBGrid3CellClick(Column: TColumn);
begin

{
  b:=IBQuery6NUM.AsInteger;
  b1:=IBQuery6ID.AsInteger;
  DBGrid3.SelectedIndex:=b;
}

TrackBar1.Position:=IBQuery6VOL.AsInteger;

end;

procedure TForm7.DBGrid3DblClick(Sender: TObject);
begin
DBGrid3.BeginDrag(true);

end;

procedure TForm7.N6Click(Sender: TObject);
var Sq:String;
    t1, t2, t22, t3:integer;
begin
// Удаляем выбранный элемент из списка

//Вычисляем позицию выделенного элемента

t1:=IBQuery6ID_PLAYER.AsInteger;
t2:=IBQuery6ID_FRAME.AsInteger;
t22:=IBQuery6ID.AsInteger;
 Sq:='Delete from PLAYLIST WHERE ID_PLAYER=:IP_PLAYER and ID_FRAME=:ID_FRAME and ID=:ID';
    IBQuery5.SQL.Clear;
    IBQuery5.SQL.Append(sq);
    IBQuery5.ParamByName('IP_PLAYER').AsInteger:=t1;
    IBQuery5.ParamByName('ID_FRAME').AsInteger:=t2;
    IBQuery5.ParamByName('ID').AsInteger:=t22;
    IBQuery5.ExecSQL;

    dat1.DataModule2.IBTransaction1.CommitRetaining;

 // Приводим в порядок позицию по NUM
 IBQuery7.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
 IBQuery7.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
 IBQuery7.Close;
 IBQuery7.Open;

 t3:=1;
 IBQuery7.First;
 While not IBQuery7.Eof do
   begin
     Sq:='Update PLAYLIST set NUM=:NUM where ID=:ID';
     IBQuery5.SQL.Clear;
     IBQuery5.SQL.Append(Sq);
     IBQuery5.ParamByName('NUM').AsInteger:=t3;
     t3:=t3+1;
     IBQuery5.ParamByName('ID').AsInteger:=IBQuery7ID.AsInteger;
     IBQuery5.Close;
     IBQuery5.Open;
     dat1.DataModule2.IBTransaction1.CommitRetaining;

    IBQuery7.Next;
   end;



 //Обновляем выдачу
 IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
 IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
 IBQuery6.Close;
 IBQuery6.Open;

end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
var g: integer;
    sq: string;
begin
// Все выбранные

  if DBGrid3.SelectedRows.Count > 0 then begin
    for g:= 0 to DBGrid3.SelectedRows.Count - 1 do begin
      with DBGrid3.DataSource.DataSet do begin
        GotoBookmark(Pointer(DBGrid3.SelectedRows.Items[g]));


       Sq:='Update PLAYLIST set VOL=:VOL where ID=:ID';
       IBQuery5.SQL.Clear;
       IBQuery5.SQL.Append(Sq);
       IBQuery5.ParamByName('VOL').AsInteger:=trackBar1.Position;
       IBQuery5.ParamByName('ID').AsInteger:=DBGrid3.DataSource.DataSet.Fields[0].AsInteger;
       IBQuery5.Close;
       IBQuery5.Open;
       dat1.DataModule2.IBTransaction1.CommitRetaining;
      end;
    end;
  end;

// Далее традиционно обновляем выдачу
 IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
 IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
 IBQuery6.Close;
 IBQuery6.Open;

end;

procedure TForm7.DataSource3StateChange(Sender: TObject);
begin
TrackBar1.Position:=IBQuery6VOL.AsInteger;
end;

procedure TForm7.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_UP)or(Key = VK_DOWN)) then TrackBar1.Position:=IBQuery6VOL.AsInteger;
end;

procedure TForm7.TrackBar1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var g: integer;
    sq: string;
begin
// Все выбранные

  if DBGrid3.SelectedRows.Count > 0 then begin
    for g:= 0 to DBGrid3.SelectedRows.Count - 1 do begin
      with DBGrid3.DataSource.DataSet do begin
        GotoBookmark(Pointer(DBGrid3.SelectedRows.Items[g]));

       Sq:='Update PLAYLIST set VOL=:VOL where ID=:ID';
       IBQuery5.SQL.Clear;
       IBQuery5.SQL.Append(Sq);
       IBQuery5.ParamByName('VOL').AsInteger:=trackBar1.Position;
       IBQuery5.ParamByName('ID').AsInteger:=DBGrid3.DataSource.DataSet.Fields[0].AsInteger;
       IBQuery5.Close;
       IBQuery5.Open;
       dat1.DataModule2.IBTransaction1.CommitRetaining;
      end;
    end;
  end;

// Далее традиционно обновляем выдачу
 IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
 IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
 IBQuery6.Close;
 IBQuery6.Open;
end;

procedure TForm7.PopupMenu2Popup(Sender: TObject);
begin
N7.Visible:=true;
N8.Visible:=true;
if IBQuery6LOC.AsInteger=1 then begin
                                 N7.Visible:=False;
                                 N8.Visible:=true;
                                end else
                                begin
                                 N7.Visible:=True;
                                 N8.Visible:=False;
                                end;
end;

procedure TForm7.N7Click(Sender: TObject);
var Sq: string;
    g:integer;
begin
// Назначаем выбранный файл локальным
 if DBGrid3.SelectedRows.Count > 0 then begin
    for g:= 0 to DBGrid3.SelectedRows.Count - 1 do begin
      with DBGrid3.DataSource.DataSet do begin
        GotoBookmark(Pointer(DBGrid3.SelectedRows.Items[g]));

       Sq:='Update PLAYLIST set LOC=:LOC where ID=:ID';
       IBQuery5.SQL.Clear;
       IBQuery5.SQL.Append(Sq);
       IBQuery5.ParamByName('LOC').AsInteger:=1;
       IBQuery5.ParamByName('ID').AsInteger:=DBGrid3.DataSource.DataSet.Fields[0].AsInteger;
       IBQuery5.Close;
       IBQuery5.Open;
       dat1.DataModule2.IBTransaction1.CommitRetaining;
      end;
    end;
  end;

// Далее традиционно обновляем выдачу
 IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
 IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
 IBQuery6.Close;
 IBQuery6.Open;


end;

procedure TForm7.N8Click(Sender: TObject);
var Sq: string;
    g:integer;
begin
// Назначаем выбранную группу файлов перемещаемыми

 if DBGrid3.SelectedRows.Count > 0 then begin
    for g:= 0 to DBGrid3.SelectedRows.Count - 1 do begin
      with DBGrid3.DataSource.DataSet do begin
        GotoBookmark(Pointer(DBGrid3.SelectedRows.Items[g]));

       Sq:='Update PLAYLIST set LOC=:LOC where ID=:ID';
       IBQuery5.SQL.Clear;
       IBQuery5.SQL.Append(Sq);
       IBQuery5.ParamByName('LOC').AsInteger:=2;
       IBQuery5.ParamByName('ID').AsInteger:=DBGrid3.DataSource.DataSet.Fields[0].AsInteger;
       IBQuery5.Close;
       IBQuery5.Open;
       dat1.DataModule2.IBTransaction1.CommitRetaining;
      end;
    end;
  end;

// Далее традиционно обновляем выдачу
 IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
 IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
 IBQuery6.Close;
 IBQuery6.Open;
end;

procedure TForm7.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
StatusBar1.Panels[0].Text:='X:'+inttostr(X)+' Y:'+inttostr(Y);
end;

procedure TForm7.DBGrid1DblClick(Sender: TObject);
begin
//Выдаем координаты для заполнения
NAME_CHECKED_PLAYER:=IBQuery2NAME_FRAME.AsString;
Edit2.Text:=inttostr(IBQuery2POS_TOP_X.asInteger);
Edit4.Text:=inttostr(IBQuery2POS_TOP_Y.asInteger);
Edit3.Text:=inttostr(IBQuery2POS_BOT_X.asInteger);
Edit5.Text:=inttostr(IBQuery2POS_BOT_Y.asInteger);
    if IBQuery2OPISANIE.AsString='video' then ComboBox1.Text:='Плеер'
    else if IBQuery2OPISANIE.AsString='stroka' then ComboBox1.Text:='Бегущая строка'
        else if IBQuery2OPISANIE.AsString='Flash' then ComboBox1.Text:='Flash'
        else ComboBox1.Text:='Плеер';


// Обновляем TabShit2
IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
IBQuery6.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
IBQuery6.Close;
IBQuery6.Open;

if IBQuery2OPISANIE.AsString='video' then begin
                                            DBGrid3.Visible:=true;
                                            memo1.Visible:=false;
                                            SpeedButton5.Visible:=false;
                                             TrackBar1.Visible:=true;
                                             SpeedButton2.Visible:=true;                                            
                                          end else
if IBQuery2OPISANIE.AsString='stroka' then begin
                                            DBGrid3.Visible:=false;
                                            memo1.Visible:=true;
                                            Flag_Memo1:=0; // Флаг изменения memo1
                                            SpeedButton5.Visible:=true;
                                            SpeedButton5.Enabled:=false;
                                             TrackBar1.Visible:=false;
                                             SpeedButton2.Visible:=false;
                                            // Ищем файл с  именем, если файл существует - заполняем memo1
                                            if FileExists(ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str') then
                                                               begin
                                                               memo1.Lines.LoadFromFile(ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str');
                                                               end;                                             
                                           end else
                                           begin
                                            DBGrid3.Visible:=true;
                                            memo1.Visible:=false;
                                            SpeedButton5.Visible:=false;
                                             TrackBar1.Visible:=true;
                                             SpeedButton2.Visible:=true;
                                           end;

end;

procedure TForm7.DBGrid3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
StatusBar1.Panels[0].Text:='X:'+inttostr(X)+' Y:'+inttostr(Y);
end;

procedure TForm7.N10Click(Sender: TObject);
begin
Form11.showmodal;
end;

procedure TForm7.Memo1Change(Sender: TObject);
begin
// Если в бегущей строке что-то изменили
// сохраняем изменения в файл с именем PLAYERID_FRAMEID_STR.str
// Сейчас выставляем флаг изменения на мемо, по флагу сохраняем на выходе
 Flag_Memo1:=1; // Флаг изменения memo1
 SpeedButton5.Enabled:=true;
end;

procedure TForm7.SpeedButton5Click(Sender: TObject);
var
    F:textFile;
    df1, df2, df3,Sq:string;
    i:integer;
begin
// Производим сохранение бегущей с троки

// Обрабатываем Memo1
// Все записи необходимо поместить в одну строку
  df2:='';
  for i:=0 to Memo1.Lines.Count do begin
                                   if i=0 then df2:=Memo1.Lines.Strings[i]
                                   else df2:=df2+' '+Memo1.Lines.Strings[i];
                                   end;

 // Формируем строку имени файла бегущей строки
  df3:=inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str';
  df1:=ExtractFilePath(Application.EXEName)+'BEGSTR\'+inttostr(IBQuery2ID_PLAYER.AsInteger)+'_'+inttostr(IBQuery2ID.AsInteger)+'.str';
  AssignFile (F,df1);
  Rewrite (F);
  Append (F);
  writeln (F,df2);

  CloseFile (F);

 Flag_Memo1:=0; // Флаг изменения memo1
 SpeedButton5.Enabled:=False;

 // Теперь необходимо выставить файл на обновление

 // Удаляем Запись о данном файле из PLAYLIST

    Sq:='Delete from PLAYLIST WHERE ID_PLAYER=:IP_PLAYER and ID_FRAME=:ID_FRAME and NAME_FILE=:ID';
    IBQuery5.SQL.Clear;
    IBQuery5.SQL.Append(sq);
    IBQuery5.ParamByName('IP_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
    IBQuery5.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
    IBQuery5.ParamByName('ID').AsString:=df3;
    IBQuery5.Close;
    IBQuery5.Open;

    dat1.DataModule2.IBTransaction1.CommitRetaining;


 // Вносим запись о нем в таблицу PLAYLIST

    Sq:='insert into PLAYLIST  (ID_PLAYER, ID_FRAME, NAME_FILE, PATH, LOC, SEND, NUM, VOL) VALUES (:IP_PLAYER, :ID_FRAME, :NAME_FILE, :PATH, :LOC, "0", :NUM, :VOL)';
    IBQuery5.SQL.Clear;
    IBQuery5.SQL.Append(sq);
    IBQuery5.ParamByName('IP_PLAYER').AsInteger:=IBQuery2ID_PLAYER.AsInteger;
    IBQuery5.ParamByName('ID_FRAME').AsInteger:=IBQuery2ID.AsInteger;
    IBQuery5.ParamByName('NAME_FILE').AsString:=df3;
    IBQuery5.ParamByName('PATH').AsString:=df1;
    IBQuery5.ParamByName('LOC').AsInteger:=2;
    IBQuery5.ParamByName('NUM').AsInteger:=1;
    IBQuery5.ParamByName('VOL').AsInteger:=100;   // Значение громкости

    IBQuery5.Close;
    IBQuery5.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;

 
end;

end.

