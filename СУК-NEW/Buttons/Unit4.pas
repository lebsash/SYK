unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Menus;

type
  TForm4 = class(TForm)
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses updserv, SUKServ, Unit5;

{$R *.dfm}

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
Form3.showmodal;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
label2.Caption:=SUKserv.UPDT_Status;

end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
//Стартуем сервер
Form1.Button3Click(Sender);
label2.Caption:=SUKserv.UPDT_Status;
//Обновим светофоры на главной странице
           SUKServ.Form1.GreenImage2.Visible := True;
           SUKServ.Form1.RedImage2.Visible   := False;

SUKserv.SC_param5:='1';
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
begin

//Form1.WSocketServer1.Client
Form1.WSocketServer1.DisconnectAll;
Form1.WSocketServer1.Close;

label2.Caption:='Offline';
SUKserv.UPDT_Status:='Offline';
//Обновим светофоры на главной странице
           SUKServ.Form1.GreenImage2.Visible := False;
           SUKServ.Form1.RedImage2.Visible   := True;
SUKserv.SC_param5:='0';
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
begin
form5.showmodal;
end;

procedure TForm4.N1Click(Sender: TObject);
begin
SUKserv.Form1.WSocketServer1.Disconnect(SUKserv.Form1.WSocketServer1.Client[ListBox1.ItemIndex]);

end;

end.
