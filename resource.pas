unit resource;

interface
uses System.SysUtils, System.Classes, Vcl.Graphics;

 {$R image.RES}


function GetCross:TBitmap;
function GetToe:TBitmap;
function GetNil:TBitmap;
function GetIco:TIcon;

implementation


 function GetCross:TBitmap;
var Cross:TBitmap;
begin
  Cross:=TBitmap.create;
  Cross.LoadFromResourceName(HInstance,'cross');
  result:=cross;
end;

function GetToe:TBitmap;
var Toe:TBitmap;
begin
  Toe:=TBitmap.create;
  Toe.LoadFromResourceName(HInstance,'toe');
  result:=Toe;
end;

function GetNil:TBitmap;
var _Nil:TBitmap;
begin
  _Nil:=TBitmap.create;
  _Nil.LoadFromResourceName(HInstance,'nil');
  result:=_Nil;
end;

function GetIco:TIcon;
var ico:TIcon;
begin
  ico:=TIcon.create;
  ico.LoadFromResourceName(HInstance,'icon');
  result:=ico;
end;
end.
