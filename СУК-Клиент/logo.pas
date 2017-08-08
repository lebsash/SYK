unit logo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, pl1;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Timer1Timer(Sender: TObject);
begin

Timer1.Enabled:=false; // заблокировать дальнейшее применение таймера
if Form1.Visible then Close; // если главное окно уже видно, то закрыть окно-заставку

end;

end.
