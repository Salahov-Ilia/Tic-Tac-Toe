unit GameOver;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses TicTacToe;

procedure TForm2.Button1Click(Sender: TObject);
begin

form1.GameEngine.Create;
form1.Timer1.Enabled:=true;
form1.Timer2.Enabled:=true;
close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
Form2.Color:=Form1.Color_set;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
if label2.Caption='Ничья:)' then
   label2.left:=190 else
   label2.Left:=80;
end;

end.
