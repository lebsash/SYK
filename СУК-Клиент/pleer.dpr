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
  Application.Initialize; // инициализация приложения 
  Form2 := TForm2.Create(Application); // создать окно-заставку
  Form2.Show; // сделать окно видимым
  Form2.Update; // перерисовать окно

  //(поскольку приложение еще не запущено, это необходимо делать вручную)
  Application.CreateForm(TForm1, Form1); // создать главное окно

// дальше создаются все остальные окна в вашей программе 
  Form2.Close; // закрыть окно-заставку
  Application.Run; // запуск приложения
end.
