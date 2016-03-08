unit Tree;

interface
uses System.SysUtils, System.Variants, System.Classes, Wintypes;
  type
    pNode = ^TNode; //��������� �� TNode
    TData = array [0..2,0..2] of integer;//��� ���� ����
    TField = array of TPoint;//��� ������� ��������� �����

   //����� ����-----------------------------------------------------------------

    TNode = class
    private
    // ����
      FData: TData;  //���� ������
      FParent:pNode; //��������
      FVertKey:integer; //���� �� ���������
      FHorzKey:integer; //���� �� �����������
      FKey:integer;
      FCountChild:integer;    //���-�� ��������
      FLinks:array of pNode; //����  ���������� �� �������� �� ��������
      CoordinatesEmptyField:TField; //������ ��������� �����

    // ������-������
    function GetLinks(index:integer):pNode;        // ������ ���������� �� ��������
    procedure SetLinks(index:integer;value:pNode); // ������ ���������� ��������

    function GetData :TData;       //������ ��������� ����
    procedure SetData (Data:TData);//������ ��������� ����


    public
    // ��������
      property Parent:pNode read FParent write FParent;
      property Data :TData read GetData write SetData;
      property Key:integer read FKey write FKey;
      property CountChild:integer read FCountChild write FCountChild;
      property Links[index:integer]:pNode read GetLinks write SetLinks;
      property VertKey:integer read FVertKey write FVertKey;
      property HorzKey:integer read FHorzKey write FHorzKey;


    // ������������
      constructor Create();overload;// ������ �����������
      constructor Create(Data:TData);overload;// ������������� ������
      constructor Create(Data:TData;CountChild:integer);overload; //������������� ������ � ��������(������ ������)
      constructor Create(Data:TData;CountChild:integer; Parent:pNode);overload;//������������� ������, �������� ���� � ��������(������ ������)
    //--------------------------------------------------------------------------
    end;


    TTree = class
      private
      // ����
       FRoot:pNode;// ������ ������


      public
      property Root:pNode read FRoot write FRoot;
      // �����������
        constructor Create();

      // ����������
        destructor Destroy;

      //������������� ������
        procedure InitializationTree(Root: pNode; Data:TData; CountChild:integer; Parent:pNode);

      //����� � ������������ ���������
        function SearchState(Root:pNode; Data: TData):TData;

    end;
   function KeyWin(Data0:TData): Integer;
implementation

{ TNode }

 // ���������� ������ ����------------------------------------------------------
constructor TNode.Create;
var
  I, j: Integer;
begin
for I := 0 to 2 do
for j := 0 to 2 do
      FData[i,j]:=0 ;
      FCountChild:=0;
      FLinks:=nil;
      FVertKey:=0;
      FHorzKey:=0;
end;

constructor TNode.Create(Data: TData );
begin
      FData:= Data;
      FCountChild:=0;
      FLinks:=nil;
      FVertKey:=0;
      FHorzKey:=0;
end;

constructor TNode.Create(Data:TData; CountChild: integer);
begin
      FData:= Data;
      FCountChild:=CountChild;
      SetLength(FLinks, CountChild); // ��������� ������ ��� ������
      FVertKey:=0;
      FHorzKey:=0;
end;

constructor TNode.Create(Data: TData; CountChild: integer; Parent: pNode);
var
  I: Integer;
  j, l: Integer;
begin

      FData:= Data;
      FCountChild:=CountChild;
      SetLength(FLinks, CountChild); // ��������� ������ ��� ������
      FVertKey:=0;
      FHorzKey:=0;
      FParent:=Parent;
       l:=0;

      //���� ���� ��������, �� ������� ��������� ����� �������� ������ ��������
      if Parent<>nil then
        begin
             SetLength(CoordinatesEmptyField, length(FParent^.CoordinatesEmptyField));//��������� ������
             CoordinatesEmptyField:=FParent^.CoordinatesEmptyField;//����������� ������
        end
                      else
       //���� ���, �� �������� ������� ��� ������(�.�. ��� ������ ����� ������)
       begin
             SetLength(CoordinatesEmptyField, FCountChild); //��������� ������
             for I := 0 to 2 do
               for j := 0 to 2 do
                begin
                  if FData[i,j]=0 then
                 begin
                  CoordinatesEmptyField[l].X:=i;
                  CoordinatesEmptyField[l].Y:=j;
                  l:=l+1;
                 end;
                end;

       end;
end;


function TNode.GetData: TData;
begin
      Getdata:= FData;
end;


function KeyWin(Data0:TData): Integer;
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function VerticalTesting(data:TData):integer;
var i, value:integer;

begin
value:=3;
for I := 0 to 2 do
    if ((Data[i,0]=2) and (Data[i,1]=2) and (Data[i,2]=0)) or ((Data[i,0]=0) and (Data[i,1]=2) and (Data[i,2]=2)) or ((Data[i,0]=2) and (Data[i,1]=2) and (Data[i,2]=2)) or((Data[i,0]=2) and (Data[i,1]=0) and (Data[i,2]=2)) then
       begin
        if value>1 then
        value:=4;
        if (Data[i,0]=2) and (Data[i,1]=2) and (Data[i,2]=2) then
            value:=5;
       end
        else
    if ((Data[i,0]=1) and (Data[i,1]=1) and (Data[i,2]=0)) or ((Data[i,0]=0) and (Data[i,1]=1) and (Data[i,2]=1)) or ((Data[i,0]=1) and (Data[i,1]=1) and (Data[i,2]=1)) or ((Data[i,0]=1) and (Data[i,1]=0) and (Data[i,2]=1))then
        begin
          if value<>5 then

           value:=1;
        end
        else
    if ((Data[i,0]=1) and (Data[i,1]=1) and (Data[i,2]=2)) or ((Data[i,0]=2) and (Data[i,1]=1) and (Data[i,2]=1)) or ((Data[i,0]=2) and (Data[i,1]=2) and (Data[i,2]=1)) or ((Data[i,0]=1) and (Data[i,1]=2) and (Data[i,2]=2)) then
       begin
         if value>1 then
           value:=3;
        end
        else
      if value>1 then
       value:=2;

   result:=value;
   end;
//------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------------------------------------------
   function HorizontalTesting(data:TData):integer;
var i, value:integer;

begin
value:=3;
for I := 0 to 2 do
    if ((Data[0, i]=2) and (Data[1,i]=2) and (Data[2,i]=0)) or ((Data[0, i]=0) and (Data[1,i]=2) and (Data[2,i]=2)) or ((Data[0,i]=2) and (Data[1,i]=2) and (Data[2,i]=2)) or ((Data[0, i]=2) and (Data[1, i]=0) and (Data[2, i]=2)) then
       begin

        if value>1 then

        value:=4;
         if (Data[0,i]=2) and (Data[1,i]=2) and (Data[2,i]=2) then
            value:=5;
       end
        else
    if ((Data[0, i]=1) and (Data[1, i]=1) and (Data[2, i]=0)) or ((Data[0, i]=0) and (Data[1, i]=1) and (Data[2, i]=1)) or ((Data[0, i]=1) and (Data[1, i]=1) and (Data[2, i]=1)) or ((Data[0, i]=1) and (Data[1, i]=0) and (Data[2, i]=1)) then
        begin
           if value<>5 then
           value:=1;
        end
        else
    if ((Data[0, i]=1) and (Data[1, i]=1) and (Data[2, i]=2)) or ((Data[0, i]=2) and (Data[1, i]=1) and (Data[2, i]=1)) or ((Data[0, i]=2) and (Data[1, i]=2) and (Data[2, i]=1)) or ((Data[0, i]=1) and (Data[1, i]=2) and (Data[2, i]=2)) then
       begin
        if value>1 then
           value:=3;
        end
        else
    if value>1 then
       value:=2;

   result:=value;
   end;
//------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------------------------------------------
   function DiagonalTesting_1(Data:TData):integer;
   var value :integer;
   begin
   value:=3;
      if ((Data[0, 0]=2) and (Data[1,1]=2) and (Data[2,2]=0)) or ((Data[0, 0]=0) and (Data[1,1]=2) and (Data[2,2]=2)) or ((Data[0,0]=2) and (Data[1,1]=2) and (Data[2,2]=2)) or ((Data[0, 0]=2) and (Data[1, 1]=0) and (Data[2, 2]=2)) then
       begin

         if value>1 then

        value:=4;
        if (Data[0,0]=2) and (Data[1,1]=2) and (Data[2,2]=2) then
            value:=5;
       end
        else
    if ((Data[0, 0]=1) and (Data[1, 1]=1) and (Data[2, 2]=0)) or ((Data[0, 0]=0) and (Data[1, 1]=1) and (Data[2, 2]=1)) or ((Data[0, 0]=1) and (Data[1, 1]=1) and (Data[2, 2]=1)) or ((Data[0, 0]=1) and (Data[1, 1]=0) and (Data[2, 2]=1)) then
        begin
           if value<>5 then
           value:=1;
        end
        else
    if ((Data[0, 0]=1) and (Data[1, 1]=1) and (Data[2, 2]=2)) or ((Data[0, 0]=2) and (Data[1, 1]=1) and (Data[2, 2]=1)) or ((Data[0, 0]=2) and (Data[1, 1]=2) and (Data[2, 2]=1)) or ((Data[0, 0]=1) and (Data[1, 1]=2) and (Data[2, 2]=2)) then
       begin
        if value>1 then
           value:=3;
        end
        else
    if value>1 then
       value:=2;

   result:=value;
   end;
//------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function DiagonalTesting_2(Data:TData):integer;

var value :integer;
   begin
   value:=3;
      if ((Data[2, 0]=2) and (Data[1,1]=2) and (Data[0,2]=0)) or ((Data[2, 0]=0) and (Data[1,1]=2) and (Data[0,2]=2)) or ((Data[2,0]=2) and (Data[1,1]=2) and (Data[0,2]=2))or ((Data[2, 0]=2) and (Data[1, 1]=0) and (Data[0, 2]=2)) then
       begin

        if value>1 then

        value:=4;
        if (Data[2,0]=2) and (Data[1,1]=2) and (Data[0,2]=2) then
            value:=5;
       end
        else
    if ((Data[2, 0]=1) and (Data[1, 1]=1) and (Data[0, 2]=0)) or ((Data[2, 0]=0) and (Data[1, 1]=1) and (Data[0, 2]=1)) or ((Data[2, 0]=1) and (Data[1, 1]=1) and (Data[0, 2]=1)) or ((Data[2, 0]=1) and (Data[1, 1]=0) and (Data[0, 2]=1)) then
        begin
          if value<>5 then
           value:=1;
        end
        else
    if ((Data[2, 0]=1) and (Data[1, 1]=1) and (Data[0, 2]=2)) or ((Data[2, 0]=2) and (Data[1, 1]=1) and (Data[0, 2]=1)) or ((Data[2, 0]=2) and (Data[1, 1]=2) and (Data[0, 2]=1)) or ((Data[2, 0]=1) and (Data[1, 1]=2) and (Data[0, 2]=2)) then
       begin
        if value>1 then
           value:=3;
        end
        else
    if value>1 then
       value:=2;

   result:=value;
   end;
//------------------------------------------------------------------------------------------------------------------------------------------------------------
var
 UpToDown, LeftToRight, diagonal1,diagonal2 :integer;
begin

UpToDown:=VerticalTesting(Data0);
LeftToRight:=HorizontalTesting(Data0);
diagonal1:=DiagonalTesting_1(Data0);
diagonal2:=DiagonalTesting_2(Data0);

if (UpToDown>=LeftToRight) and (((UpToDown>=diagonal1) and (diagonal1>=diagonal2)) or ((UpToDown>=diagonal2) and (diagonal1<=diagonal2))) then
   result:=UpToDown else

   if (UpToDown<=LeftToRight) and (((LeftToRight>=diagonal1) and (diagonal1>=diagonal2)) or ((UpToDown>=diagonal2) and (diagonal1<=diagonal2)))then
   result:=LeftToRight else

   if (diagonal1>=diagonal2) and (((diagonal1>=uptodown) and (uptodown>=lefttoright)) or ((diagonal1>=lefttoright) and (uptodown<=lefttoright))) then
       result:=diagonal1 else

   if (diagonal1<=diagonal2) and (((diagonal2>=uptodown) and (uptodown>=lefttoright)) or ((diagonal2>=lefttoright) and (uptodown<=lefttoright))) then
       result:=diagonal2;


   if (UpToDown=1) or (LeftToRight=1) or (diagonal1=1) or (diagonal2=1) then
       result:=1;

   if (UpToDown=5) or (LeftToright=5) or (diagonal1=5) or (diagonal2=5) then
      result:=5;
end;

function TNode.GetLinks(index: integer): pNode;
begin
     result:=FLinks[index];
end;

procedure TNode.SetData(Data:TData);
begin
     FData:=Data;
end;


procedure TNode.SetLinks(index: integer; value: pNode);
begin
     FLinks[index]:=value;
end;
//------------------------------------------------------------------------------


{ TTree }

 // ���������� ������ ������----------------------------------------------------
constructor TTree.Create;
begin
   FRoot:=nil;
   new(FRoot);
end;


destructor TTree.destroy;
begin
    FRoot:=nil;
    dispose(FRoot);
end;



procedure TTree.InitializationTree(Root: pNode; Data:TData; CountChild: integer; Parent:pNode);

//----------------------------�������� ����-------------------------------------
function Generation(Node:pNode; cross,toe:integer):TData;
var value, j:integer;
 begin
   value:=0;
   //new(Node);
   randomize;
   value:=random(length(Node^.CoordinatesEmptyField));

   Result:=Node^.Data;

   //����� ���� � ������������ ���������� ���� (�� ������� ��������� ������) 1 ��� 2
  if length(Node^.CoordinatesEmptyField)<>0 then
  begin
   if (cross>toe)  then
       Result[Node^.Parent^.CoordinatesEmptyField[value].X,Node^.Parent^.CoordinatesEmptyField[value].Y]:=2
                   else
       Result[Node^.Parent^.CoordinatesEmptyField[value].X,Node^.Parent^.CoordinatesEmptyField[value].Y]:=1;

   //����� ��������� �����, ������� ��������� ������ �� ������������
   for j := value to high(Node^.Parent^.CoordinatesEmptyField) do

     if j<>high(Node^.Parent^.CoordinatesEmptyField) then
         begin

           //����� ��������� � ����
           Node^.CoordinatesEmptyField[j].X:=Node^.CoordinatesEmptyField[j+1].X;
           Node^.CoordinatesEmptyField[j].Y:=Node^.CoordinatesEmptyField[j+1].Y;

           //����� ��������� � �������� ����
           Node^.Parent^.CoordinatesEmptyField[j].X:=Node^.Parent^.CoordinatesEmptyField[j+1].X;
           Node^.Parent^.CoordinatesEmptyField[j].Y:=Node^.Parent^.CoordinatesEmptyField[j+1].Y;
         end;

      //�������� �������� ��������
     setlength(Node^.CoordinatesEmptyField, length(Node^.CoordinatesEmptyField)-1);
     setlength(Node^.Parent^.CoordinatesEmptyField, length(Node^.Parent^.CoordinatesEmptyField)-1);
  end;
 end;
 //-----------------------------------------------------------------------------

var
  I, k: Integer;
  cross,toe:byte;
  begin
   cross:=0;
   toe:=0;


   // ������� ������------------------------
       Root^:=Tnode.Create(Data,CountChild, Parent);


      if Root^.Parent<>nil then
        begin

          //������� ���-�� ��������� � �������
           for i := 0 to 2 do
            for k := 0 to 2 do
              begin
                    if Root^.Parent^.Data[i,k]=1 then
                       cross:=cross+1 else
                    if Root^.Parent^.Data[i,k]=2 then
                       toe:=toe+1;
              end;

           //���������� ���� ��� ����� ����
           Root^.Data:=Generation(Root, cross, toe);
        end;

        Root^.Key:=KeyWin(Root^.Data);

        //�������� ��������
      if (Root^.CountChild>0) and (Root^.key<>5) then
        begin
             for I := 0 to Root^.CountChild-1 do
                 if Root^.Links[i]=nil then
                   begin
                      Root^.Links[i]:=new(pNode);
                      InitializationTree( Root^.Links[i], Root^.Data, Root^.CountChild-1, Root);
                   end;

        end;


 end;



function TTree.SearchState(Root:pNode; Data: TData):TData;
var
  I: Integer;
  value:TData;
  max:integer;
begin
max:=0;

  for I := 0 to Root^.CountChild-1 do
      if max<Root^.Links[i]^.Key then
      begin
       max:=Root^.Links[i]^.Key;
        value:=Root^.Links[i]^.Data;
      end;

      if Root^.Key=1 then
        begin
          for I := 0 to Root^.CountChild-1 do
              if (Root^.Links[i]^.Key=2) then

                 value:=Root^.Links[i]^.Data;
        end;
       
   result:=value;
end;

//------------------------------------------------------------------------------
end.
