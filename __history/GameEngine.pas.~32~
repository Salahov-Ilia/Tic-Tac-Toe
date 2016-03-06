unit GameEngine;

interface
uses Tree,  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics;

type
 TGameEngine=class
  private
    Tree:TTree;
    InitialState: TData;
    nilGraphic, cross, toe:TBitmap;
  public
    procedure Draw(Canvas:TCanvas);
    procedure PlayerClick(X, Y:integer);
    procedure EnimyClick;
    constructor Create;
    destructor Destroy;
end;
var n:integer;
implementation
  uses TicTacToe;
{ TGameEngine }

constructor TGameEngine.Create;
begin
     nilgraphic:=TBitmap.Create;
     cross:=TBitmap.Create;
     toe:=TBitmap.Create;
     n:=9;
     nilGraphic.LoadFromFile('resource/nil.bmp');
     //nilGraphic.TransparentColor:=clwhite;
     cross.LoadFromFile('resource/cross.bmp');
     cross.TransparentColor:=clwhite;
     cross.Transparent:=true;
     toe.LoadFromFile('resource/toe.bmp');
end;

destructor TGameEngine.Destroy;
begin
   nilGraphic.Destroy;
   cross.Destroy;
   toe.Destroy;
end;

procedure TGameEngine.Draw(Canvas: TCanvas);
var
   i,j:integer;
begin
Canvas.Pen.Width:=3;

    for I := 0 to 2 do
        for j := 0 to 2 do
      if InitialState[i,j]=0 then
         Canvas.Draw(i*96,j*96,nilGraphic)
                             else

      if InitialState[i,j]=1 then
         Canvas.Draw(i*96,j*96,cross)
                             else

      if InitialState[i,j]=2 then
         Canvas.Draw(i*96,j*96,toe);

         Canvas.MoveTo(96,0);
         Canvas.LineTo(96, 288);

         Canvas.MoveTo(192, 0);
         Canvas.LineTo(192, 288);

         Canvas.MoveTo(0,96);
         Canvas.LineTo(288, 96);

         Canvas.MoveTo(0, 192);
         Canvas.LineTo(288, 192);
end;

procedure TGameEngine.EnimyClick;

begin
    Tree:=TTree.Create;
    Tree.InitializationTree(Tree.Root,InitialState,n,nil);
    InitialState:=Tree.SearchState(Tree.Root, InitialState);
    Tree.Destroy;
    n:=n-1;
end;

procedure TGameEngine.PlayerClick(X, Y: integer);
begin
     if InitialState[X div 96, Y div 96]=0 then
     begin
        InitialState[X div 96, Y div 96]:=1;
        form1.Label5.Caption:='59';
        form1.Timer3.Enabled:=true;
        n:=n-1;
     end;
end;

end.
