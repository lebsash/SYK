unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SUKserv, Buttons, Mask, StdCtrls;

type
  TForm12 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  gh: integer;
implementation

{$R *.dfm}

procedure TForm12.SpeedButton2Click(Sender: TObject);
begin
SUKserv.Form1.Close;
end;

procedure TForm12.SpeedButton1Click(Sender: TObject);
begin

// Проверка на пароль
if ((MaskEdit1.Text=inttostr(DayOfWeek(now))+'tdhj12450')and(Edit2.Text='5465-2345-1234-5637-2385-2376-5467')) then
  begin
    // открываем доступ к функциям
    SUKserv.Form1.SpeedButton1.Enabled:=True;
    SUKserv.Form1.SpeedButton2.Enabled:=True;
    SUKserv.Form1.SpeedButton3.Enabled:=True;
    SUKserv.Form1.MainMenu1.Items.Items[3].Enabled:=True;
    SUKserv.Form1.SpeedButton4.Visible:=False;
    Form12.Close;
  end else
  begin
     gh:=gh+1;
     if gh>=3 then begin
                     SUKserv.Form1.Close;
                   end;

  end;

end;

procedure TForm12.FormActivate(Sender: TObject);
begin
gh:=0;
end;

end.
