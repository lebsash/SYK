unit updserv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls,SUKServ, dat1;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    Edit4: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    CheckBox1: TCheckBox;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
Edit1.Text:='127.0.0.1';
Edit2.Text:='2104';
Edit3.Text:='0';
Edit4.Text:='';
CheckBox1.Checked:=false;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
if Opendialog1.Execute then Edit4.Text:=OpenDialog1.FileName;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
var f:textfile;
begin
 AssignFile (f,'updserv.ini');
 Rewrite (f);
 Append (f);
 Writeln (f,Edit1.text);
 Writeln (f,Edit2.text);
 Writeln (f,Edit3.text);
 Writeln (f,Edit4.text);
 if CheckBox1.Checked then Writeln (f,'1')
                      else Writeln (f,'0');
 CloseFile(f);

 // Сохраняем новые параметры в глобальных переменных программы
  SUKserv.SC_param1:= Edit1.Text;
  SUKserv.SC_param2:= Edit2.Text;
  SUKserv.SC_param3:= Edit3.Text;
  SUKserv.SC_param4:= Edit4.Text;
  if CheckBox1.Checked then SUKserv.SC_param5:='1'
                       else SUKserv.SC_param5:='0';

 Form3.Close;
end;

procedure TForm3.FormActivate(Sender: TObject);
var f:TextFile;
    i:string;
begin
 AssignFile (f,'updserv.ini');
 Reset (f);
 Readln (f,i);
 Edit1.Text:=i;
 Readln (f,i);
 Edit2.Text:=i;
 Readln (f,i);
 Edit3.Text:=i;
 Readln (f,i);
 Edit4.Text:=i;
 Readln (f,i);
 if i='1' then CheckBox1.Checked:=true
          else CheckBox1.Checked:=false;

 CloseFile(f);

 Form3.Close;
end;

end.
