unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    DxDiag: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Label5: TLabel;
    ComboBox5: TComboBox;
    Label6: TLabel;
    function CheckError(temp: string; min,max:integer) : integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  i:integer;
implementation

{$R *.dfm}

function TForm3.CheckError(temp: string; min, max: integer): integer;
begin
  result:=0;
  if (temp='') then BEGIN result:=1; Exit; END;
  for i:=1 to Length(temp) do
  If not (temp[i] in ['0'..'9']) then BEGIN result:=2; Exit; END;
  if (StrToInt(temp)<Min) or (StrToInt(temp)>Max) then
  BEGIN Result:=3;  Exit; END;
end;




end.
