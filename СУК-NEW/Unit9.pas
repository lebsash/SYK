unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, Buttons, OverbyteIcsWndControl,
  OverbyteIcsFtpSrv, OverbyteIcsFTPSRVC, tlhelp32, OverbyteIcsWSocket,
  OverbyteIcsWSocketS,updserv, SUKServ, dat1, FileCtrl;

type
  TForm9 = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    Label2: TLabel;
    Edit2: TEdit;
    CheckBox3: TCheckBox;
    InfoMemo: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    SaveDialog1: TSaveDialog;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation
uses  Unit6;
{$R *.dfm}

procedure TForm9.CheckBox1Click(Sender: TObject);
var
    I : Integer;
begin

   // Настройка, влияющая на то, может ли пользователь фтп выйти на
   // верхний уровень каталогов (из домашнего каталога);
    if CheckBox1.Checked then
    begin

        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options + [ftpsCdUpHome];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options + [ftpCdUpHome];
    end
    else begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options - [ftpsCdUpHome];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options - [ftpCdUpHome];
    end;
end;

procedure TForm9.CheckBox2Click(Sender: TObject);
var
    I : Integer;
begin
    // Настройка фтп, скрфывающая физический путь

    if CheckBox2.Checked then
    begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options + [ftpsHidePhysicalPath];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options + [ftpHidePhysicalPath];
    end
    else begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options - [ftpsHidePhysicalPath];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options - [ftpHidePhysicalPath];
    end;
end;

procedure TForm9.FormActivate(Sender: TObject);
var F1: textfile;
    ge1, ge2: string;
begin
// Грузим сервисную информацию из файла
  ge1:=ExtractFilePath(Application.EXEName)+'prof\ftp.ini';
  AssignFile (F1, ge1);
  Reset (F1);
  Readln (F1,ge2);
  If ge2='1' then CheckBox1.Checked:=true
           else CheckBox1.Checked:=false;
  Readln (F1,ge2);
  If ge2='1' then CheckBox2.Checked:=true
           else CheckBox2.Checked:=false;
  Readln (F1,ge2);
  if length(ge2)<1 then Edit1.Text:=ExtractFilePath(Application.EXEName)+'FTP-SERV'
                   else Edit1.Text:=ge2;

  Readln (F1,ge2);
  if length(ge2)<1 then Edit2.Text:='ftp'
                   else Edit2.Text:=ge2;

  Readln (F1,ge2);
  if ge2='Auto'    then CheckBox3.Checked:=true
                   else CheckBox3.Checked:=false;

  Readln (F1,ge2);
  if length(ge2)<1    then Edit3.Text:='127.0.0.1'
                      else Edit3.Text:=ge2;
  Readln (F1,ge2);
  Edit4.Text:=ge2;
  Readln (F1,ge2);
  Edit5.Text:=ge2;
  CloseFile (F1);
  
  if SUKServ.Form1.FtpServer1.Active then
                                      begin
                                       SpeedButton1.Visible:=true;
                                       SpeedButton2.Visible:=false;
                                      end
                                    else begin
                                       SpeedButton1.Visible:=false;
                                       SpeedButton2.Visible:=true;
                                         end;


end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
var f: textFile;
    ge1, ge2: string;
begin
// Сохраняем сервисную информацию в файл
 ge1:=ExtractFilePath(Application.EXEName)+'prof\ftp.ini';
 AssignFile (f, ge1);
 Rewrite (f);
 Append (f);
 if CheckBox1.Checked=true then writeln (f,'1')
                           else writeln (f,'0');
 if CheckBox2.Checked=true then writeln (f,'1')
                           else writeln (f,'0');
 Writeln (f, Edit1.text);
 Writeln (f, Edit2.text);
 if CheckBox3.Checked=true then writeln (f,'Auto')
                           else writeln (f,'0');
 Writeln (f, Edit3.text);
 Writeln (f, Edit4.text);
 Writeln (f, Edit5.text);
 CloseFile (f);

 // Сохраняем новые значения в переменных программы:
  if CheckBox1.Checked=true then  SUKserv.ftp_Param1:='1'
                            else  SUKserv.ftp_Param1:='0';
 if CheckBox2.Checked=true then  SUKserv.ftp_Param2:='1'
                           else  SUKserv.ftp_Param2:='0';

 SUKserv.ftp_Param3:=Edit1.text;
 SUKserv.ftp_Param4:=Edit2.text;
  if CheckBox3.Checked=true then SUKserv.ftp_Param5:='Auto'
                           else SUKserv.ftp_Param5:='0';
 SUKserv.ftp_Param6:=Edit3.text;
 SUKserv.ftp_log:=Edit4.text;
 SUKserv.ftp_pass:=Edit5.text;


end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
    SUKserv.Form1.StopServer;
   if SUKServ.Form1.FtpServer1.Active=false then
                                      begin
                                       SpeedButton1.Visible:=false;
                                       SpeedButton2.Visible:=true;
                                       SUKserv.ftp_Param5:='0';
                                      end;
  if SUKserv.Form1.GreenImage2.Visible then begin

                              //Form1.WSocketServer1.Client
                              Form1.WSocketServer1.DisconnectAll;
                              Form1.WSocketServer1.Close;
                              SUKserv.SC_param5:='0';
                              Form1.Button3Click(Sender);

                             end;                                      
end;

procedure TForm9.SpeedButton2Click(Sender: TObject);
var i:integer;
begin
  //Вносим данные в настройку сервера:

   // Настройка, влияющая на то, может ли пользователь фтп выйти на
   // верхний уровень каталогов (из домашнего каталога);

    if SUKserv.ftp_param1='1' then
    begin

        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options + [ftpsCdUpHome];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options + [ftpCdUpHome];
    end
    else begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options - [ftpsCdUpHome];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options - [ftpCdUpHome];
    end;

  // Настройка фтп, скрывающая физический путь
      if SUKserv.ftp_param2='1' then
    begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options + [ftpsHidePhysicalPath];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options + [ftpHidePhysicalPath];
    end
    else begin
        SUKServ.Form1.FtpServer1.Options := SUKServ.Form1.FtpServer1.Options - [ftpsHidePhysicalPath];
        for I := 0 to SUKServ.Form1.FtpServer1.ClientCount -1 do
            SUKServ.Form1.FtpServer1.Client[I].Options := SUKServ.Form1.FtpServer1.Client[I].Options - [ftpHidePhysicalPath];
    end;

    SUKserv.Form1.FtpServer1.Port:=ftp_param4;
    SUKserv.Form1.FtpServer1.Addr:=ftp_param6;



    SUKserv.Form1.StartServer;
  if SUKServ.Form1.FtpServer1.Active then
                                      begin
                                       SpeedButton1.Visible:=true;
                                       SpeedButton2.Visible:=false;
                                       SUKserv.ftp_Param5:='1';
                                      end;
  if SUKserv.Form1.GreenImage2.Visible then begin

                              //Form1.WSocketServer1.Client
                              Form1.WSocketServer1.DisconnectAll;
                              Form1.WSocketServer1.Close;
                              //Обновим светофоры на главной странице
                             SUKServ.Form1.GreenImage2.Visible := False;
                             SUKServ.Form1.RedImage2.Visible   := True;
                             SUKserv.SC_param5:='0';
                             Form1.Button3Click(Sender);
                             SUKServ.Form1.GreenImage2.Visible := True;
                             SUKServ.Form1.RedImage2.Visible   := False;
                             end;

end;

procedure TForm9.N1Click(Sender: TObject);
begin
InfoMemo.Clear;
end;

procedure TForm9.N2Click(Sender: TObject);
begin

if SaveDialog1.Execute then
 begin
  Infomemo.Lines.SaveToFile(savedialog1.filename);
 end;

end;

end.
