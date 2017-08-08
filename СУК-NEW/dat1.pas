unit dat1;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IdBaseComponent, IdComponent,
  IdTCPServer, IdUserAccounts, IdFTPServer, IdFTPList;

type
  TDataModule2 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IdFTPServer1: TIdFTPServer;
    IdUserManager1: TIdUserManager;
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure IdFTPServer1ListDirectory(ASender: TIdFTPServerThread;
      const APath: String; ADirectoryListing: TIdFTPListItems);
    procedure IBDatabase1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  DataModule2: TDataModule2;

implementation
 uses SUKserv;

{$R *.dfm}

procedure TDataModule2.IdTCPServer1Execute(AThread: TIdPeerThread);
var t1: string;
begin
t1:=AThread.Connection.ReadLn;
//Form2.memo2.Lines.Add(t1);
end;



procedure TDataModule2.IdFTPServer1ListDirectory(
  ASender: TIdFTPServerThread; const APath: String;
  ADirectoryListing: TIdFTPListItems);
begin
ASender.CurrentDir:='d:\test\';
end;

procedure TDataModule2.IBDatabase1BeforeConnect(Sender: TObject);
var f: textfile;
    sss, ppp:string;
begin
 ppp:=SUKserv.path_to_exe+'prof\db.ini';
 AssignFile (f,ppp);
 reset(f);
 Readln(f, sss);
 CloseFile (f);
 IBDataBase1.DatabaseName:=sss;
end;

end.
