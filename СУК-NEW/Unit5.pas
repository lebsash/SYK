unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, Menus, StdCtrls,
  ExtCtrls, Buttons;

type
  TForm5 = class(TForm)
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    P1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    IBQuery1ID: TIntegerField;
    IBQuery1UIN: TIntegerField;
    IBQuery1NAME: TIBStringField;
    IBQuery1IP_ADR: TIBStringField;
    IBQuery1OPISANIE: TIBStringField;
    N5: TMenuItem;
    N6: TMenuItem;
    IBQuery2: TIBQuery;
    IBDataSet1: TIBDataSet;
    N7: TMenuItem;
    N8: TMenuItem;
    IBQuery1CLIENT_ACTIV: TIntegerField;
    IBQuery1CLIENT_TYPE: TIBStringField;
    IBQuery3: TIBQuery;
    N9: TMenuItem;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    N10: TMenuItem;
    N11: TMenuItem;
    IBQuery4: TIBQuery;
    IBQuery5: TIBQuery;
    IBQuery4ID: TIntegerField;
    IBQuery4ID_PLAYER: TIntegerField;
    IBQuery4ID_FRAME: TIntegerField;
    IBQuery4NAME_FILE: TIBStringField;
    IBQuery4PATH: TIBStringField;
    IBQuery4LOC: TIntegerField;
    IBQuery4SEND: TIntegerField;
    IBQuery4NUM: TIntegerField;
    IBQuery4VOL: TIntegerField;
    IBQuery6: TIBQuery;
    IBQuery7: TIBQuery;
    IBQuery7ID: TIntegerField;
    IBQuery7ID_PLAYER: TIntegerField;
    IBQuery7NAME_FRAME: TIBStringField;
    IBQuery7POS_TOP_X: TIntegerField;
    IBQuery7POS_TOP_Y: TIntegerField;
    IBQuery7POS_BOT_X: TIntegerField;
    IBQuery7POS_BOT_Y: TIntegerField;
    IBQuery6PATH_FILE: TIBStringField;
    IBQuery8: TIBQuery;
    IBQuery8ID: TIntegerField;
    IBQuery8ID_PLAYER: TIntegerField;
    IBQuery8ID_FRAME: TIntegerField;
    IBQuery8NAME_FILE: TIBStringField;
    IBQuery8PATH: TIBStringField;
    IBQuery8LOC: TIntegerField;
    IBQuery8SEND: TIntegerField;
    IBQuery8NUM: TIntegerField;
    IBQuery8VOL: TIntegerField;
    IBQuery7OPISANIE: TIBStringField;
    IBQuery9: TIBQuery;
    IBQuery9ID: TIntegerField;
    IBQuery9ID_PLAYER: TSmallintField;
    IBQuery9NAME_FILE: TIBStringField;
    IBQuery9SIZE_FILE: TIntegerField;
    IBQuery9DOWNLOADED: TIntegerField;
    IBQuery9DATE_TO_UPD: TDateTimeField;
    IBQuery9PATH_FILE: TIBStringField;
    IBQuery10: TIBQuery;
    IBQuery1DATE_CONNECT: TDateTimeField;
    SoftwareUPDADE1: TMenuItem;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure SoftwareUPDADE1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
        function FullRemoveDir(Dir: string; DeleteAllFilesAndFolders,
    StopIfNotAllDeleted, RemoveRoot: boolean):boolean;
  public
    procedure Refr;
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses updserv, SUKServ, dat1, Unit6, Unit7, Unit8, Unit4, Unit10, Unit9;
{$R *.dfm}

function TForm5.FullRemoveDir(Dir: string; DeleteAllFilesAndFolders,
  StopIfNotAllDeleted, RemoveRoot: boolean): Boolean;
var
  i: Integer;
  SRec: TSearchRec;
  FN: string;
begin
  Result := False;
  if not DirectoryExists(Dir) then
    exit;
  Result := True;
  // ��������� ���� � ����� � ������ ����� - "��� ����� � ����������"
  Dir := IncludeTrailingBackslash(Dir);
  i := FindFirst(Dir + '*', faAnyFile, SRec);
  try
    while i = 0 do
    begin
      // �������� ������ ���� � ����� ��� ����������
      FN := Dir + SRec.Name;
      // ���� ��� ����������
      if SRec.Attr = faDirectory then
      begin
        // ����������� ����� ���� �� ������� � ������ �������� �����
        if (SRec.Name <> '') and (SRec.Name <> '.') and (SRec.Name <> '..') then
        begin
          if DeleteAllFilesAndFolders then
            FileSetAttr(FN, faArchive);
          Result := FullRemoveDir(FN, DeleteAllFilesAndFolders,
            StopIfNotAllDeleted, True);
          if not Result and StopIfNotAllDeleted then
            exit;
        end;
      end
      else // ����� ������� ����
      begin
        if DeleteAllFilesAndFolders then
          FileSetAttr(FN, faArchive);
        Result := SysUtils.DeleteFile(FN);
        if not Result and StopIfNotAllDeleted then
          exit;
      end;
      // ����� ��������� ���� ��� ����������
      i := FindNext(SRec);
    end;
  finally
    SysUtils.FindClose(SRec);
  end;
  if not Result then
    exit;
  if RemoveRoot then // ���� ���������� ������� ������ - �������
    if not RemoveDir(Dir) then
      Result := false;
end;


procedure TForm5.FormCreate(Sender: TObject);
var sq, put, put1:string;
    f:textfile;
    v1:integer;
begin
//��������� ������� ��������
v1:=0;
put1:=GetCurrentDir+'\Prof\'+'updcl.ini';
  AssignFile (f,put1);
    {$I-}
     Reset(f);
     if IOResult <> 0  then
         begin
          // ���� ���� �� ���������� ������� ���
          rewrite (f);
          v1:=1;
         end;

     if v1=0 then
               begin
                 readln (f,put);
                 if put='1' then RadioButton1.Checked:=true
                               else RadioButton1.Checked:=false;
                 readln (f,put);
                 if put='1' then RadioButton2.Checked:=true
                               else RadioButton2.Checked:=false;
                 readln (f,put);
                 if put='1' then RadioButton3.Checked:=true
                               else RadioButton3.Checked:=false;
                 readln (f,put);
                 ComboBox1.Text:=put;
               end;
      if v1=1 then begin
                    RadioButton1.Checked:=false;
                    RadioButton2.Checked:=false;
                    RadioButton3.Checked:=true;
                    ComboBox1.Text:='��� �������';
                   end;
     CloseFile(f);

refr;
end;

procedure TForm5.DBGrid1TitleClick(Column: TColumn);
 var sq:string;
    v:integer;
begin
//������ ������ SQL
v:=0;
sq:='select * from NAME_CONNECTION ';
if RadioButton1.Checked=true then  begin
                                     sq:=sq+'Where CLIENT_ACTIV=1';
                                     v:=1;
                                   end;
if RadioButton2.Checked=true then  begin
                                     sq:=sq+'Where CLIENT_ACTIV=0';
                                     v:=1;
                                   end;


if ComboBox1.Text='��� �������' then   begin
                                          end;

if ComboBox1.Text='������' then   begin

                                           if v=1 then  sq:=sq+' and CLIENT_TYPE="pleer"';
                                           if v=0 then begin
                                                        v:=1;
                                                        sq:=sq+'Where CLIENT_TYPE="pleer"';
                                                       end;

                                          end;
if ComboBox1.Text='������ �������' then   begin

                                           if v=1 then  sq:=sq+' and CLIENT_TYPE="other"';
                                           if v=0 then begin
                                                        v:=1;
                                                        sq:=sq+'Where CLIENT_TYPE="other"';
                                                       end;

                                          end;

//������ �������
sq:=sq+' order by ';
sq:=sq+Column.FieldName;
IBQuery1.SQL.Clear;
IBQuery1.SQL.Append(sq);

IBQuery1.Close;
IBQuery1.Open;

end;

procedure TForm5.DBGrid1DblClick(Sender: TObject);
begin
// �� ������� ������ ���� ������� ������ �������

end;

procedure TForm5.N2Click(Sender: TObject);
var f:textfile;
    f1:string;
begin
// ������� ����������, �������������� ���������� ������
// ��������� ���� (������������, �� �������� ���������� ������)
//��� ����� �������� ���������� �� � DBGRID1
// � � IBQuery (�.�. � ��� ���������� ��������� ������� �������)
// IBQuery1NAME.asstring; �������� ������� ��� �������

//������ ���� ���� ���������� � ���������� logs
//� ������  IBQuery1NAME.asstring + '.log'

 f1:=ExtractFilePath(Application.EXEName)+'logs\'+IBQuery1NAME.asstring + '.log';
 AssignFile(f,f1);
  {$I-}
 Reset(f);
  if IOResult <> 0  then
  begin
  // ���� ���� �� ���������� ������� ���
    rewrite (f);
  end;
  CloseFile(f);
  Form6.Caption:='��� - ���������� ������� '+ IBQuery1NAME.AsString;
  Form6.StatusBar1.Panels[0].Text:=f1;
  Form6.Memo1.Clear;  //������ ���� �����������
  Form6.Memo1.Lines.LoadFromFile(f1);  //��������� �� �����
  Form6.showmodal;    //��������� ����� ����������� ���������� ��������
end;

procedure TForm5.N6Click(Sender: TObject);
var st,sq:string;
    nm, put1, put2,put21,put22:string;
    id1,uin1:integer;
    DirInfo: TSearchRec;
    r: integer;
    pf1, pf2:string;
begin
//������� ���������� �������
{
�������������� ������� �� ��������� ������� � ��
IBQuery1NAME.asstring
IBQuery1ID.asInteger;
IBQuery1UIN.asInteger;
}
nm:=IBQuery1NAME.asstring;
id1:=IBQuery1ID.asInteger;
uin1:=IBQuery1UIN.asInteger;

  st:='�� ������������� ������ ������� ������� '+IBQuery1NAME.asstring;
  if MessageDlg(st, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    IBQuery2.ParamByName('OLD_ID').AsInteger:=id1;
    IBQuery2.ParamByName('OLD_UIN').AsInteger:=uin1;
    IBQuery2.ParamByName('OLD_NAME').AsString:=nm;
    IBQuery2.Close;
    IBQuery2.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;

    //������� ������ DBGrid
     //������ ������ SQL
     sq:='select * from NAME_CONNECTION order by ID';
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Append(sq);
     IBQuery1.Close;
     IBQuery1.Open;

     //������� ��� ����
     put1:=ExtractFilePath(Application.EXEName)+'logs\'+nm + '.log';
     if FileExists(put1) then DeleteFile(put1);

     //������� ������ ����������� ��� ������� ����
     //�������� ������� �� �������


   //������ ������� FTP

    pf2:=SUKServ.ftp_Param3+'\'+nm;
    FullRemoveDir('pf2', true, true, true);

    // ������� ������ � ������� �������
    sq:='delete from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
    IBQuery10.SQL.Clear;
    IBQuery10.SQL.Append(sq);
    IBQuery10.ParamByName('ID_PLAYER').AsInteger:=id1;
    IBQuery10.Close;
    IBQuery10.Open;
    dat1.DataModule2.IBTransaction1.CommitRetaining;


     // ������� ������ �������
    sq:='delete from FRAME_PLAYER where ID_PLAYER=:ID_PLAYER';
    IBQuery10.SQL.Clear;
    IBQuery10.SQL.Append(sq);
    IBQuery10.ParamByName('ID_PLAYER').AsInteger:=id1;
    IBQuery10.Close;
    IBQuery10.Open;


     //����� � ��� ����� �������� �������
     put2:= ExtractFilePath(Application.EXEName)+'logs\mlog.log';
     put21:=DateToStr(Now)+' '+timetostr(now)+' ������ ������ - '+nm;
     SUKServ.Form1.STL (put2,put21,put22);

  end;




end;




procedure TForm5.N8Click(Sender: TObject);
var st,sq:string;
    nm, put2,put21,put22:string;
    id1,uin1:integer;
begin
 //������ ������� ����� ��������
 // ��� ����� ���� CLIENT_ACTIV ������� NAME_CONNECTION
 // ��� �������� ������ ��������� � 1
  nm:=IBQuery1NAME.asstring;
  id1:=IBQuery1ID.asInteger;
  uin1:=IBQuery1UIN.asInteger;
  Sq:='update NAME_CONNECTION set CLIENT_ACTIV=:ADR where NAME=:Name';
  IBQuery3.SQL.Clear;
  IBQuery3.SQL.Append(Sq);

  IBQuery3.ParamByName('ADR').AsInteger:=1;
  IBQuery3.ParamByName('Name').AsString:=nm;
  IBQuery3.Close;
  IBQuery3.Open;
  dat1.DataModule2.IBTransaction1.Commit;

    //������� ������ DBGrid
     //������ ������ SQL
     sq:='select * from NAME_CONNECTION order by ID';
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Append(sq);
     IBQuery1.Close;
     IBQuery1.Open;

end;

procedure TForm5.N9Click(Sender: TObject);
var st,sq:string;
    nm, put2,put21,put22:string;
    id1,uin1:integer;
begin
  //������ ������� ����� ����������������
  // ��� ����� ���� CLIENT_ACTIV ������� NAME_CONNECTION
  // ��� �������� ������ ��������� � 0
  nm:=IBQuery1NAME.asstring;
  id1:=IBQuery1ID.asInteger;
  uin1:=IBQuery1UIN.asInteger;
  Sq:='update NAME_CONNECTION set CLIENT_ACTIV=:ADR where NAME=:Name';
  IBQuery3.SQL.Clear;
  IBQuery3.SQL.Append(Sq);

  IBQuery3.ParamByName('ADR').AsInteger:=0;
  IBQuery3.ParamByName('Name').AsString:=nm;
  IBQuery3.Close;
  IBQuery3.Open;
  dat1.DataModule2.IBTransaction1.Commit;

    //������� ������ DBGrid
     //������ ������ SQL
     sq:='select * from NAME_CONNECTION order by ID';
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Append(sq);
     IBQuery1.Close;
     IBQuery1.Open;
end;

procedure TForm5.PopupMenu1Popup(Sender: TObject);
begin
//������������ ����:
//���� ����� ��� �����������, �� ��� ������������� �������� � ����
//����������� ��������� ���������
// ����� ��������� ��������� ������� ��� ������ - ���������� ������
// ��� ��������� �������� - ���������.
N8.Visible:=true;
N9.Visible:=true;
N4.Visible:=true;
N11.Visible:=true;
  if IBQuery1CLIENT_TYPE.AsString='pleer' then begin
                                                 N10.Visible:=true;
                                                 N4.Visible:=true;
                                                 N11.Visible:=false;
                                                 SoftwareUPDADE1.Visible:=true;

                                               end
                                          else begin
                                                 N10.Visible:=false;
                                                 N4.Visible:=false;
                                                 N11.Visible:=true;
                                                 SoftwareUPDADE1.Visible:=false;
                                                end;


  if IBQuery1CLIENT_ACTIV.AsInteger=1 then
                                         begin

                                          N8.Visible:=False;
                                          N9.Visible:=true;
                                         end;

  if IBQuery1CLIENT_ACTIV.AsInteger=0 then
                                         begin
                                          N9.Visible:=False;
                                          N8.Visible:=true;;
                                         end;
end;

procedure TForm5.RadioButton3Click(Sender: TObject);
begin
Refr;
end;

procedure TForm5.RadioButton2Click(Sender: TObject);
begin
Refr;
end;

procedure TForm5.RadioButton1Click(Sender: TObject);
begin
Refr;
end;

procedure TForm5.Refr;
 var sq:string;
    v:integer;
begin
//������ ������ SQL
v:=0;
sq:='select * from NAME_CONNECTION ';
if RadioButton1.Checked=true then  begin
                                     sq:=sq+'Where CLIENT_ACTIV=1';
                                     v:=1;
                                   end;
if RadioButton2.Checked=true then  begin
                                     sq:=sq+'Where CLIENT_ACTIV=0';
                                     v:=1;
                                   end;


if ComboBox1.Text='��� �������' then   begin
                                          end;

if ComboBox1.Text='������' then   begin

                                           if v=1 then  sq:=sq+' and CLIENT_TYPE="pleer"';
                                           if v=0 then begin
                                                        v:=1;
                                                        sq:=sq+'Where CLIENT_TYPE="pleer"';
                                                       end;

                                          end;
if ComboBox1.Text='������ �������' then   begin

                                           if v=1 then  sq:=sq+' and CLIENT_TYPE="other"';
                                           if v=0 then begin
                                                        v:=1;
                                                        sq:=sq+'Where CLIENT_TYPE="other"';
                                                       end;

                                          end;

sq:=sq+' order by ID';
IBQuery1.SQL.Clear;
IBQuery1.SQL.Append(sq);
IBQuery1.Close;
IBQuery1.Open;
end;


procedure TForm5.ComboBox1Change(Sender: TObject);
begin
Refr;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
var f:textfile;
    put,put1:string;
begin
//��������� ��������� ������� ������� � ���� �������
 put1:=GetCurrentDir+'\Prof\'+'updcl.ini';
  AssignFile (f,put1);
  rewrite (f);
  Append (f);
   if RadioButton1.Checked=true then put:='1'
                                else put:='0';
   Writeln (f,put);
   if RadioButton2.Checked=true then put:='1'
                                else put:='0';
   Writeln (f,put);
   if RadioButton3.Checked=true then put:='1'
                                else put:='0';

   Writeln (f,put);
   put:=ComboBox1.Text;
   Writeln (f,put);
  CloseFile(f);
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
refr;
end;

procedure TForm5.N10Click(Sender: TObject);
begin
Unit7.Form7.Caption:='�������� ������ '+ IBQuery1NAME.AsString;
//�������� ������ � ������� ������ ����� Label1 � Label2 �� ����� ���������
Unit7.Form7.Label1.Caption:=IBQuery1NAME.AsString;
Unit7.Form7.Label2.Caption:=inttostr (IBQuery1ID.asInteger);
Form7.showmodal;
end;

procedure TForm5.N4Click(Sender: TObject);
var sq, sq1, PL, ns: string;
    f: file of Byte;
    fs, hg, summ_size:integer;
    f1: textfile;
    fp1, ge1, ge2, ge3, ftp_path:string;
begin
// ����� ��������� ������ ����� �� �������� �������

// ��������� �����, ������� ���������� ��������� (��� �������)
// � ��������� ������ ����� � ��������� LOC ����� 2



Form9.SpeedButton1Click (Sender); // ��������� FTP
Form4.SpeedButton3Click (Sender); // ��������� ������





 sq:='select * from PLAYLIST where ID_PLAYER=:ID_PLAYER and LOC=:LOC';
 IBQuery4.SQL.Clear;
 IBQuery4.SQL.Append(sq);
 IBQuery4.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
 IBQuery4.ParamByName('LOC').AsInteger:=2;
 IBQuery4.Close;
 IBQuery4.Open;
// ������� ��� ����� � ������� PLAYER_ZAD
// + ���������� ��������� ��������� �� ���� �����

   sq1:='select PATH_FILE from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER and  PATH_FILE=:PATH_FILE';
   IBQuery6.SQL.Clear;
   IBQuery6.SQL.Append(sq1);

// ������ ���� ��� FTP

// SUKserv.ftp_Param3 - ����� ��������� ���� � ����� FTP
// ��� �������: D:\work\Soft Develop\���-NEW\FTP-SERV
//������ � ����� ���� �������� \players\[���_������]\OutList
//�����, ���� ��� �� ����������, ���������� �������

    // ��������� ������� �������� ��� ������
         ftp_path:=SUKserv.ftp_Param3+'\'+IBQuery1NAME.AsString+'\log\';

      // ftp_path ������ �������� ���� � ����� FTP
       if not DirectoryExists(ftp_path) then begin
                                          if ForceDirectories(ftp_path) then
                                            begin
                                            end
                                             else ShowMessage('�������� ������ �������� ������ �������� � ������� ������ : '+
                                                  IntToStr(GetLastError));
                                        end;





  ftp_path:=SUKserv.ftp_Param3+'\'+IBQuery1NAME.AsString+'\outlist\';

// ftp_path ������ �������� ���� � ����� FTP
  if not DirectoryExists(ftp_path) then begin
                                          if ForceDirectories(ftp_path) then
                                            begin
                                            end
                                             else ShowMessage('�������� ������ �������� ������ �������� � ������� ������ : '+
                                                  IntToStr(GetLastError));
                                        end;


 IBQuery4.First;
 While not IBQuery4.Eof do
 begin

   // ���������� ��������� ��������� �� ���� �����
   // ��������� � ������� PLAYER_ZAD ������� ����� �� �������  IBQuery4PATH.AsString - ���� �����

   IBQuery6.ParamByName('PATH_FILE').AsString:=IBQuery4PATH.AsString;
   IBQuery6.ParamByName('ID_PLAYER').AsInteger:=IBQuery4ID_PLAYER.AsInteger;
   IBQuery6.Close;
   IBQuery6.Open;
   IBQuery6.First;


   // ���� ���������� �� ������� - ������� ������ � ������� ��������
   if IBQuery6.Eof then begin

   sq:='insert into PLAYER_ZAD  (ID_PLAYER, NAME_FILE, PATH_FILE, SIZE_FILE, DOWNLOADED, DATE_TO_UPD ) VALUES (:ID_PLAYER, :NAME_FILE, :PATH_FILE, :SIZE_FILE, 0, :DATE_TO_UPD)';
   IBQuery5.SQL.Clear;
   IBQuery5.SQL.Append(sq);
   IBQuery5.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
   IBQuery5.ParamByName('NAME_FILE').AsString:=IBQuery4NAME_FILE.AsString;
   IBQuery5.ParamByName('PATH_FILE').AsString:=IBQuery4PATH.AsString;
   // ������ ������ ����� � ������
   ns:=IBQuery4PATH.AsString;
    AssignFile(f, ns);
    Reset(f);
    try
       fs := FileSize(f);
    finally
       CloseFile(f);
    end;


   IBQuery5.ParamByName('SIZE_FILE').AsInteger:=fs;
   IBQuery5.ParamByName('DATE_TO_UPD').AsDateTime:=Now;
   IBQuery5.Close;
   IBQuery5.Open;

 //������ ���������� ����������� �����, ���������� �� ��������
 // IBQuery4PATH.AsString - ���� ����� ������� ���������� ����������
 // ftp_path - ������� ���� ��������

 if CopyFile(Pchar(IBQuery4PATH.AsString),pchar(ftp_path+IBQuery4NAME_FILE.AsString),false) then
    begin
    end else
    ShowMessage('����������� ����� ������ ��������!  ��������:'
    + IBQuery4PATH.AsString+',  ���� �������: '+ ftp_path+IBQuery4NAME_FILE.AsString+' ������:'+
                                                  IntToStr(GetLastError));
  end;
  dat1.DataModule2.IBTransaction1.CommitRetaining;
  IBQuery4.Next;
  end;
//������ ��������� ������� ��� �������

   sq1:='select * from FRAME_PLAYER where ID_PLAYER=:ID_PLAYER';
   IBQuery7.SQL.Clear;
   IBQuery7.SQL.Append(sq1);
   IBQuery7.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
   IBQuery7.Close;
   IBQuery7.Open;
   IBQuery7.First;
        fp1:=ExtractFilePath(Application.EXEName)+'player\'+IBQuery1ID.asstring + '.FRM';
        AssignFile (f1, fp1);
        Rewrite (f1);
        Append (f1);
  While not IBQuery7.Eof do
     begin
       {
        write (f1,IBQuery7ID.asInteger);
        write (f1,'^');
        write (f1,IBQuery7NAME_FRAME.asString);
                write (f1,'^');
        write (f1,IBQuery7POS_TOP_X.asInteger);
                write (f1,'^');
        write (f1,IBQuery7POS_TOP_Y.asInteger);
                write (f1,'^');
        write (f1,IBQuery7POS_BOT_X.asInteger);
                write (f1,'^');
        write (f1,IBQuery7POS_BOT_Y.asInteger);
                write (f1,'^');
        write (f1,IBQuery7OPISANIE.asString);
        writeln (f1,'@');
       }
        sq1:='insert into FRAME_PLAYER  (ID, ID_PLAYER, NAME_FRAME, POS_TOP_X, POS_TOP_Y,POS_BOT_X, POS_BOT_Y, OPISANIE )';
     sq1:=sq1+'VALUES ('+IBQuery7ID.asstring+', '+IBQuery7ID_PLAYER.AsString+', "'+IBQuery7NAME_FRAME.AsString+'", '+IBQuery7POS_TOP_X.AsString+', '+IBQuery7POS_TOP_Y.AsString+', '+ IBQuery7POS_BOT_X.AsString+', '+IBQuery7POS_BOT_Y.AsString+', "'+IBQuery7OPISANIE.AsString+'")';
     writeln (f1,sq1);


        IBQuery7.Next;
     end;
     CloseFile (f1);


// ������ ��������

   sq1:='select * from PLAYLIST where ID_PLAYER=:ID_PLAYER';
   IBQuery8.SQL.Clear;
   IBQuery8.SQL.Append(sq1);
   IBQuery8.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
   IBQuery8.Close;
   IBQuery8.Open;
   IBQuery8.First;
        fp1:=ExtractFilePath(Application.EXEName)+'player\'+IBQuery1ID.asstring + '.PLL';
        AssignFile (f1, fp1);
        Rewrite (f1);
        Append (f1);
  While not IBQuery8.Eof do
     begin
     sq1:='insert into PLAYLIST  (ID_FRAME, NAME_FILE, NUM, VOL, DATE1 )';
     sq1:=sq1+'VALUES ('+IBQuery8ID_FRAME.asstring+', "'+IBQuery8NAME_FILE.AsString+'", '+IBQuery8NUM.AsString+', '+IBQuery8VOL.AsString+', "'+datetostr(now)+'")';
     writeln (f1,sq1);
     IBQuery8.Next;
     end;
     CloseFile (f1);
// ���������� � ������� ����������
// � ������� ������ 2 ����� � - �����_������.frm  - ����� �������
//                            - �����_������.pll  - �������� � ������� ����� SQL


 // �������� �� ������� ������ ������ � �������
   fp1:=ExtractFilePath(Application.EXEName)+'player\'+IBQuery1ID.asstring + '.FRM';
   IBQuery6.ParamByName('PATH_FILE').AsString:=fp1;
   IBQuery6.Close;
   IBQuery6.Open;
   IBQuery6.First;
   // ���� ���������� �� ������� - ������� ������ � ������� ��������
   if IBQuery6.Eof then begin


   sq:='insert into PLAYER_ZAD  (ID_PLAYER, NAME_FILE, PATH_FILE, SIZE_FILE, DOWNLOADED, DATE_TO_UPD ) VALUES (:ID_PLAYER, :NAME_FILE, :PATH_FILE, :SIZE_FILE, 0, :DATE_TO_UPD)';
   IBQuery5.SQL.Clear;
   IBQuery5.SQL.Append(sq);

   // ��������� � ������� ���� � ������ �������
   //fp1:=GetCurrentDir+'\player\'+IBQuery1ID.asstring + '.FRM';
   IBQuery5.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
   IBQuery5.ParamByName('NAME_FILE').AsString:=IBQuery1ID.asstring+'.frm';
   IBQuery5.ParamByName('PATH_FILE').AsString:=fp1;
   // ������ ������ ����� � ������
    AssignFile(f, fp1);
    Reset(f);
    try
       fs := FileSize(f);
    finally
       CloseFile(f);
    end;
   IBQuery5.ParamByName('SIZE_FILE').AsInteger:=fs;
   IBQuery5.ParamByName('DATE_TO_UPD').AsDateTime:=Now;
   IBQuery5.Close;
   IBQuery5.Open;
   end;
  if CopyFile(Pchar(fp1),pchar(ftp_path+IBQuery1ID.asstring + '.FRM'),false) then
    begin
    end else
    ShowMessage('����������� �����: ' + IBQuery4PATH.AsString+' ������ �������� � ������� ������ : '+
                                                  IntToStr(GetLastError));


  // �������� �� ������� ������ ������ � �������
   fp1:=ExtractFilePath(Application.EXEName)+'player\'+IBQuery1ID.asstring + '.PLL';
   IBQuery6.ParamByName('PATH_FILE').AsString:=fp1;
   IBQuery6.Close;
   IBQuery6.Open;
   IBQuery6.First;
   // ���� ���������� �� ������� - ������� ������ � ������� ��������
   if IBQuery6.Eof then begin

   // ��������� � ������� ���� � ����������

   IBQuery5.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
   IBQuery5.ParamByName('NAME_FILE').AsString:=IBQuery1ID.asstring+'.PLL';
   IBQuery5.ParamByName('PATH_FILE').AsString:=fp1;
   // ������ ������ ����� � ������
    AssignFile(f, fp1);
    Reset(f);
    try
       fs := FileSize(f);
    finally
       CloseFile(f);
    end;
   IBQuery5.ParamByName('SIZE_FILE').AsInteger:=fs;
   IBQuery5.ParamByName('DATE_TO_UPD').AsDateTime:=Now;
   IBQuery5.Close;
   IBQuery5.Open;
  end;
  if CopyFile(Pchar(fp1),pchar(ftp_path+IBQuery1ID.asstring + '.PLL'),false) then
    begin
    end else
    ShowMessage('����������� �����: ' + IBQuery1ID.asstring + '.PLL'+' ������ �������� � ������� ������ : '+
                                                  IntToStr(GetLastError));

// ���� � ���, ��� ��� ���������� ������� �������� �������� �� ����������
// �.�. �� ���� ������ ������ ������ � ��������� �� ������� ���������� ��� ����������
// �����. ����� ������� �������� �� ������ � �������� ������������ � ��������� �������


// ������ ���������� ������� ������ ��������
// ������������ ���� SIZE_FILE ������� PLAYER_ZAD � ���������� ������� �� ID_PLAYER

 sq:='select * from PLAYER_ZAD where ID_PLAYER=:ID_PLAYER';
 IBQuery9.SQL.Clear;
 IBQuery9.SQL.Append(sq);
 IBQuery9.ParamByName('ID_PLAYER').AsInteger:=IBQuery1ID.AsInteger;
 IBQuery9.Close;
 IBQuery9.Open;
 summ_size:=0;
 IBQuery9.First;
 While not IBQuery9.Eof do
   begin
     summ_size:=summ_size+IBQuery9SIZE_FILE.AsInteger;
     IBQuery9.Next;
   end;

 // ������� � ���-���� ���������� � ���������
 ge1:=GetCurrentDir+'\logs\'+IBQuery1NAME.asstring + '.log';
 ge2:=DateToStr(Now)+' '+timetostr(now)+' ������� ������ �� ���������� ������, ������: '+inttostr(summ_size)+'����';
 Form1.STL (ge1,ge2,ge3);
// �������� ����� �� ���


 Form4.SpeedButton2Click (Sender); // �������� ������
 Form9.SpeedButton2Click (Sender); // �������� FTP



 sq1:='��������� ������������ ������ �� ��������. ��������� ������: '+inttostr(summ_size)+' ����';
 MessageDlg(sq1, mtInformation, [mbOk],0);

end;

procedure TForm5.N7Click(Sender: TObject);
begin
// ��������� ����� ������ ������� ��� ������
if IBQuery1CLIENT_TYPE.AsString='pleer' then
 begin
    Unit8.Form8.Label1.Caption:=IBQuery1ID.AsString;
    Unit8.Form8.Label2.Caption:=IBQuery1NAME.AsString;
    Unit8.Form8.Caption:='��� - ������ �� ����������� ��� ������ '+ IBQuery1NAME.AsString;
    Form8.showmodal;
 end;

end;

procedure TForm5.SoftwareUPDADE1Click(Sender: TObject);
var pth: string;
begin



Unit10.Form10.Label1.Caption:=IBQuery1NAME.AsString;
Unit10.Form10.Label2.Caption:=inttostr (IBQuery1ID.asInteger);
Unit10.Form10.Caption:='���-������: ���������� �� �� ������';
Form10.showmodal;

end;

procedure TForm5.Timer1Timer(Sender: TObject);
begin
SpeedButton1Click (Sender) ;
end;

end.
