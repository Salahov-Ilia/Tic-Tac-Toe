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
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
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
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     GameEngine:TGameEngine;
     NamePl:string;
     Color_set:TColor;
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Settings;

procedure TForm1.FormCreate(Sender: TObject);
var
   g:TextFile;
begin
    GameEngine:=TGameEngine.Create;
    assignFile(g,'settings.txt');
    reset(g);
    readln(g, NamePl);
    readln(g,Color_set);
    closefile(g);
    form1.Color:=Color_Set;
    label2.Caption:=NamePl;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    GameEngine.Destroy;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if timer3.Enabled=false then
   begin
     GameEngine.PlayerClick(X, Y);
     label2.Caption:='���������';
   end;
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

procedure TForm1.N7Click(Sender: TObject);
begin
showmessage('��������� ����: ������� ����.'+#13+'���� ������� ��� ������-������������ ����������� ����������.'+#13+'2016�.');
end;

procedure TForm1.N8Click(Sender: TObject);
begin
Form3.show;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

 GameEngine.Draw(Image1.Canvas);

   if GameEngine.State=1 then
    begin
      Timer1.Enabled:=false;
      timer2.Enabled:=false;

      form2.Label2.Caption:='��������� �������:(';
      form2.Show;

    end
       else
  if GameEngine.State=0 then
    begin
      Timer1.Enabled:=false;
      timer2.Enabled:=false;
      form2.Label2.Caption:=NamePl+' �������:)';
      form2.Show;
    end else

    if GameEngine.State=2 then
    begin
      Timer1.Enabled:=false;
      timer2.Enabled:=false;
      form2.Label2.Caption:='�����:)';
      form2.Show;
    end;



end;
procedure TForm1.Timer2Timer(Sender: TObject);
var
  I: Integer;
begin

if Label5.Caption<>'0' then
   label5.Caption:=inttostr(strtoint(Label5.Caption)-1)
                        else
   begin


   form2.Label2.Caption:='����� �������:(';
    form2.show;
   end;


end;


procedure TForm1.Timer3Timer(Sender: TObject);
begin
GameEngine.EnimyClick;
label2.Caption:=NamePl;
Label5.Caption:='59';
timer3.Enabled:=false;
end;

end.
