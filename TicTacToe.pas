unit TicTacToe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, GameOver,
  Vcl.Menus, GameEngine;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Timer1: TTimer;
    N8: TMenuItem;
    Timer2: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Timer3: TTimer;
    procedure FormDestroy(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     GameEngine:TGameEngine;
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Settings;

procedure TForm1.FormCreate(Sender: TObject);
begin
    GameEngine:=TGameEngine.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    GameEngine.Destroy;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   GameEngine.PlayerClick(X, Y);

end;

procedure TForm1.N2Click(Sender: TObject);
begin
GameEngine.Destroy;
GameEngine:=TGameEngine.Create;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
Form3.show;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

 GameEngine.Draw(Image1.Canvas);

end;
procedure TForm1.Timer2Timer(Sender: TObject);
var
  I: Integer;
begin
if Label5.Caption<>'00' then
   label5.Caption:=inttostr(strtoint(Label5.Caption)-1)
                        else
   form2.show;


end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
GameEngine.EnimyClick;
timer3.Enabled:=false;
end;

end.
