program pleer;

uses
  Forms,
  pl1 in 'pl1.pas' {Form1},
  logo in 'logo.pas' {Form2};

{$R *.res}

begin

 { Application.Initialize;


  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
  }
  Application.Initialize; // ������������� ���������� 
  Form2 := TForm2.Create(Application); // ������� ����-��������
  Form2.Show; // ������� ���� �������
  Form2.Update; // ������������ ����

  //(��������� ���������� ��� �� ��������, ��� ���������� ������ �������)
  Application.CreateForm(TForm1, Form1); // ������� ������� ����

// ������ ��������� ��� ��������� ���� � ����� ��������� 
  Form2.Close; // ������� ����-��������
  Application.Run; // ������ ����������
end.
