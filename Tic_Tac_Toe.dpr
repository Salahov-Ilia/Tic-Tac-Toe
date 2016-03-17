program Tic_Tac_Toe;

uses
  Vcl.Forms,
  TicTacToe in 'TicTacToe.pas' {Form1},
  Tree in 'Tree.pas',
  GameOver in 'GameOver.pas' {Form2},
  GameEngine in 'GameEngine.pas',
  Settings in 'Settings.pas' {Form3},
  resource in 'resource.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
