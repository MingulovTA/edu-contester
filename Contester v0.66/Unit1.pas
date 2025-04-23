unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, Menus, ExtCtrls, ImgList, StdCtrls, ActnList,
  Spin;

type

  TQuake=class
  public
  s:string;
  CountA:integer;
  Count:integer;
  a1,a2,a3,a4,a5:string;
  b1,b2,b3,b4,b5:integer;
  Answer:real;
  Freezy:boolean;
   Constructor Create(NEWs:string; NEWCount:integer;
                      NEWa1,NEWa2,NEWa3,NEWa4,NEWa5:string;
                      NEWb1,NEWb2,NEWb3,NEWb4,NEWb5:integer);
   Destructor Destroy;override;
   end;

  TMain = class(TForm)
    ListBox1: TListBox;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    ActionList1: TActionList;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ACT_ADD: TAction;
    ACT_HELP: TAction;
    ACT_LOAD: TAction;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    MainMemo: TMemo;
    RadioButton1: TRadioButton;
    Memo1: TMemo;
    RadioButton2: TRadioButton;
    Memo2: TMemo;
    RadioButton3: TRadioButton;
    Memo3: TMemo;
    RadioButton4: TRadioButton;
    Memo4: TMemo;
    RadioButton5: TRadioButton;
    Memo5: TMemo;
    Edit4: TEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    N5: TMenuItem;
    Label5: TLabel;
    ACT_PROP: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    Label6: TLabel;
    Updown1: TSpinButton;
    Label7: TLabel;
    procedure N3Click(Sender: TObject);
    procedure ACT_LOADExecute(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ACT_ADDExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ACT_HELPExecute(Sender: TObject);
    procedure ACT_PROPExecute(Sender: TObject);
    procedure Updown1UpClick(Sender: TObject);
    procedure Updown1DownClick(Sender: TObject);
  private
    { Private declarations }
  public
    Balls:Real;
    TekBall:Real;
    Pros:real;
    Count:integer;   //Счётчик
    Quake:TQuake;   //Ссыдка на шарик
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

Constructor TQuake.Create(NEWs:string; NEWCount:integer;
                      NEWa1,NEWa2,NEWa3,NEWa4,NEWa5:string;
                      NEWb1,NEWb2,NEWb3,NEWb4,NEWb5:integer);
BEGIN
  inherited Create;
  s:=NEWs;
  Count:=NEWCount;
  a1:=NEWa1; a2:=NEWa2; a3:=NEWa3; a4:=NEWa4; a5:=NEWa5;
  b1:=NEWb1; b2:=NEWb2; b3:=NEWb3; b4:=NEWb4; b5:=NEWb5;
  Answer:=0.00;
  freezy:=false;
END;

destructor TQuake.Destroy;
BEGIN
inherited Destroy;
END;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
procedure TMain.N3Click(Sender: TObject);
begin
About.ShowModal;
end;

procedure TMain.ACT_LOADExecute(Sender: TObject);
VAR temp,i,j:integer; CountQ:integer; f : TextFile;
  s,Steam:string;
  Count:integer;
  a1,a2,a3,a4,a5:string;
  b1,b2,b3,b4,b5:boolean;
  upd_str:string;
begin
  OpenDialog1.FileName := '';
  if OpenDialog1.Execute then
    begin
    for i:=0 to ListBox1.Count-1 do
    ListBox1.Items.Objects[i].Free;
    Listbox1.Items.Clear;
    Count:=0;

    AssignFile(f,OpenDialog1.FileName);
    Reset(f);

    readln(f,s);
    If S<>'11' then
    BEGIN
    ShowMessage('Неизвестный формат файла');
    Exit;
    END;

    while not Eof(f) do
    begin
    Quake:=TQuake.Create('',0,
                         '0','0','0','0','0',
                        0,0,0,0,0);
      readln(f,Quake.s);

      readln(f,Quake.a1);
      readln(f,Quake.a2);
      readln(f,Quake.a3);
      readln(f,Quake.a4);
      readln(f,Quake.a5);

      readln(f,Quake.CountA);
      readln(f,upd_str);
      Quake.b1:=StrToInt(upd_str[1]);
      Quake.b2:=StrToInt(upd_str[2]);
      Quake.b3:=StrToInt(upd_str[3]);
      Quake.b4:=StrToInt(upd_str[4]);
      Quake.b5:=StrToInt(upd_str[5]);

    ListBox1.Items.AddObject('Вопрос №'+IntToStr(Count+1),Quake);
    Count:=Count+1;
    end;
    CloseFile(f);
    end;

Form3.ComboBox1.Enabled:=True;
Form3.ComboBox3.Enabled:=True;
Form3.ComboBox4.Enabled:=True;
Form3.ComboBox5.Enabled:=True;
  If Form3.ShowModal=mrOK then
  BEGIN
  If Form3.ComboBox2.ItemIndex=0 then
  begin
  ListBox1.Visible:=True;
  ACT_HELP.Enabled:=True;
  Edit1.Visible:=True;
  Edit2.Visible:=True;
  Edit3.Visible:=True;
  Edit4.Visible:=True;
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label3.Visible:=True;
  Label4.Visible:=True;
  UpDown1.Visible:=False;
  Label6.Visible:=False;
  end else
  begin
  Edit1.Visible:=False;
  Edit2.Visible:=False;
  Edit3.Visible:=False;
  Edit4.Visible:=False;
  Label1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=False;
  Label4.Visible:=False;
  ListBox1.Visible:=False;
  ACT_HELP.Enabled:=False;
  UpDown1.Visible:=True;
  Label6.Visible:=True;
  end;
//Чистка капота
Main.Count:=0;
Main.Balls:=0;
Main.Pros:=0;
Main.Count:=0;
Edit1.Text:='Ожидание';
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
MainMemo.Clear; Memo1.Clear; Memo2.Clear; Memo3.Clear; Memo4.Clear; Memo5.Clear;
    RadioButton1.Visible:=False;    RadioButton2.Visible:=False;
    RadioButton3.Visible:=False;    RadioButton4.Visible:=False;
    RadioButton5.Visible:=False;    CheckBox1.Visible:=False;
    CheckBox2.Visible:=False;      CheckBox3.Visible:=False;
    CheckBox4.Visible:=False;      CheckBox5.Visible:=False;



Edit1.Color:=clWhite;
    If Form3.ComboBox1.ItemIndex=1 then
    While Count>30 DO
      BEGIN
      Count:=Count-1;
      temp:=random(Count);
      ListBox1.Items.Objects[temp].Free;   //Удаление объекта-шарика
      ListBox1.Items.Delete(temp);         //Удаление строки их списка
      END;

    CountQ:=1;
    For i:=Count downto 1 do
    begin
    j:=random(i-1);
    Quake := Listbox1.Items.Objects[j] as TQuake; //Получение
    ListBox1.Items.AddObject('Вопрос №'+IntToStr(CountQ),Quake);
    Inc(CountQ);
    ListBox1.Items.Delete(j);         //Удаление строки их списка
    end;

  END;

end;

procedure TMain.ListBox1Click(Sender: TObject);
VAR Prime:Array[1..5,0..1] of integer;  CountQ,i,j,temp:integer;
begin
  If ListBox1.ItemIndex<>-1 then
    begin
    //Очистка всеъ Мемо
    MainMemo.Clear;
    Memo1.Clear; Memo2.Clear; Memo3.Clear; Memo4.Clear; Memo5.Clear;
    Memo3.Visible:=True; Memo4.Visible:=True; Memo5.Visible:=True;

    //Получение вопроса и переписывание его пропертей в Мемы
    Quake := Listbox1.Items.Objects[ListBox1.ItemIndex] as TQuake; //Получение
    MainMemo.Lines.Strings[0]:=Quake.S;
    Memo1.Lines.Strings[0]:=Quake.a1;
    Memo2.Lines.Strings[0]:=Quake.a2;
    Memo3.Lines.Strings[0]:=Quake.a3;
    Memo4.Lines.Strings[0]:=Quake.a4;
    Memo5.Lines.Strings[0]:=Quake.a5;

    //Если Ответ на вопрос дан - блокируем Чеки и Кнопку, вылаём ответ в Edit
    If Quake.Freezy=true then
    begin
    Label5.Caption:='Ответ уже дан';
    RadioButton1.Enabled:=true;    RadioButton2.Enabled:=true;
    RadioButton3.Enabled:=False;    RadioButton4.Enabled:=False;
    RadioButton5.Enabled:=False;    CheckBox1.Enabled:=False;
    CheckBox2.Enabled:=False;      CheckBox3.Enabled:=False;
    CheckBox4.Enabled:=False;      CheckBox5.Enabled:=False;
    Memo1.Enabled:=False;    Memo2.Enabled:=False;    Memo3.Enabled:=False;
    Memo4.Enabled:=False;    Memo5.Enabled:=False;
    Edit4.Text:=FloatToStr(Quake.Answer);
    ACT_ADD.Enabled:=False;

    end else
    begin
    Label5.Caption:='';
    RadioButton1.Enabled:=True;    RadioButton2.Enabled:=True;
    RadioButton3.Enabled:=True;    RadioButton4.Enabled:=True;
    RadioButton5.Enabled:=True;    CheckBox1.Enabled:=True;
    CheckBox2.Enabled:=True;      CheckBox3.Enabled:=True;
    CheckBox4.Enabled:=True;      CheckBox5.Enabled:=True;
    Memo1.Enabled:=true;    Memo2.Enabled:=true;    Memo3.Enabled:=true;
    Memo4.Enabled:=true;    Memo5.Enabled:=true;
    Edit4.Text:='';
    ACT_ADD.Enabled:=True;
    end;

    //Если ответов несколько - включаем Чекбоксы, иначе - РадиоБатоны
    If Quake.CountA > 1 then
    begin
      RadioButton1.Visible:=False; RadioButton2.Visible:=False;
      RadioButton3.Visible:=False; RadioButton4.Visible:=False;
      RadioButton5.Visible:=False; CheckBox1.Visible:=True;
      CheckBox2.Visible:=True;     CheckBox3.Visible:=True;
      CheckBox4.Visible:=True;     CheckBox5.Visible:=True;
    end
    else
    begin
    RadioButton1.Visible:=True;    RadioButton2.Visible:=True;
    RadioButton3.Visible:=True;    RadioButton4.Visible:=True;
    RadioButton5.Visible:=True;    CheckBox1.Visible:=False;
    CheckBox2.Visible:=False;      CheckBox3.Visible:=False;
    CheckBox4.Visible:=False;      CheckBox5.Visible:=False;
    end;

    //Выпиливаем ненужные пункты, если Ответ=NULL и считает кол-во ответов
    CountQ:=5;
    If Quake.a3='NULL' then
    begin     RadioButton3.Visible:=False;    Memo3.Visible:=False;
        CheckBox3.Visible:=false; Dec(CountQ);     end;
    If Quake.a4='NULL' then
    begin        RadioButton4.Visible:=False;         Memo4.Visible:=False;
        CheckBox4.Visible:=false;  Dec(CountQ);    end;
    If Quake.a5='NULL' then
    begin        RadioButton5.Visible:=False;        Memo5.Visible:=False;
        CheckBox5.Visible:=false;  Dec(CountQ);    end;

    //Отжимание Чеков
    RadioButton1.Checked:=False;
    RadioButton2.Checked:=False;
    RadioButton3.Checked:=False;
    RadioButton4.Checked:=False;
    RadioButton5.Checked:=False;
    CheckBox1.Checked:=False;
    CheckBox2.Checked:=False;
    CheckBox3.Checked:=False;
    CheckBox4.Checked:=False;
    CheckBox5.Checked:=False;      

    //Замес ответов
    Prime[1,0]:=112; Prime[1,1]:=280;
    Prime[2,0]:=112; Prime[2,1]:=320;
    Prime[3,0]:=112; Prime[3,1]:=360;
    Prime[4,0]:=112; Prime[4,1]:=400;
    Prime[5,0]:=112; Prime[5,1]:=440;

    For i:=CountQ downto 1 do
    begin
    j:=random(i-1)+1;
    temp:=Prime[i,0];
    Prime[i,0]:=Prime[j,0];
    Prime[j,0]:=temp;
    temp:=Prime[i,1];
    Prime[i,1]:=Prime[j,1];
    Prime[j,1]:=temp;
    end;

    CheckBox1.Top:=Prime[1,1]; RadioButton1.Top:=Prime[1,1]; Memo1.Top:=Prime[1,1]-8;
    CheckBox2.Top:=Prime[2,1]; RadioButton2.Top:=Prime[2,1]; Memo2.Top:=Prime[2,1]-8;
    CheckBox3.Top:=Prime[3,1]; RadioButton3.Top:=Prime[3,1]; Memo3.Top:=Prime[3,1]-8;
    CheckBox4.Top:=Prime[4,1]; RadioButton4.Top:=Prime[4,1]; Memo4.Top:=Prime[4,1]-8;
    CheckBox5.Top:=Prime[5,1]; RadioButton5.Top:=Prime[5,1]; Memo5.Top:=Prime[5,1]-8;
 {   For i:=1 to 5 do
    Edit1.Text:=Edit1.Text+IntToStr(Prime[i])  }


end;
end;




procedure TMain.ACT_ADDExecute(Sender: TObject); var key,key1: boolean; CountP:real;
i:integer;  tempS:string;
begin
If ListBox1.ItemIndex=-1 then Exit;
Quake := Listbox1.Items.Objects[ListBox1.ItemIndex] as TQuake; //Получение
    If Quake.CountA = 1 then
    begin
    If (RadioButton1.Checked) AND (Quake.b1=1) then Quake.Answer :=1;
    If (RadioButton2.Checked) AND (Quake.b2=1) then Quake.Answer :=1;
    If (RadioButton3.Checked) AND (Quake.b3=1) then Quake.Answer :=1;
    If (RadioButton4.Checked) AND (Quake.b4=1) then Quake.Answer :=1;
    If (RadioButton5.Checked) AND (Quake.b5=1) then Quake.Answer :=1;
    end;
key:=false;
CountP:=0;
    If Quake.CountA > 1 then
    begin
    If (CheckBox1.Checked) AND (Quake.b1=1) then CountP :=CountP+1;
    If (CheckBox2.Checked) AND (Quake.b2=1) then CountP :=CountP+1;
    If (CheckBox3.Checked) AND (Quake.b3=1) then CountP :=CountP+1;
    If (CheckBox4.Checked) AND (Quake.b4=1) then CountP :=CountP+1;
    If (CheckBox5.Checked) AND (Quake.b5=1) then CountP :=CountP+1;

    If (CheckBox1.Checked) AND (Quake.b1=0) then key:=true;
    If (CheckBox2.Checked) AND (Quake.b2=0) then key:=true;
    If (CheckBox3.Checked) AND (Quake.b3=0) then key:=true;
    If (CheckBox4.Checked) AND (Quake.b4=0) then key:=true;
    If (CheckBox5.Checked) AND (Quake.b5=0) then key:=true;


If Key=true then
Quake.Answer :=0 else
Quake.Answer:= CountP/Quake.CountA;
    end;
Quake.Freezy:=True;
ACT_ADD.Enabled:=false;

Main.TekBall:= Quake.Answer;

    RadioButton1.Enabled:=False;    RadioButton2.Enabled:=False;
    RadioButton3.Enabled:=False;    RadioButton4.Enabled:=False;
    RadioButton5.Enabled:=False;    CheckBox1.Enabled:=False;
    CheckBox2.Enabled:=False;      CheckBox3.Enabled:=False;
    CheckBox4.Enabled:=False;      CheckBox5.Enabled:=False;
    Memo1.Enabled:=False;    Memo2.Enabled:=False;    Memo3.Enabled:=False;
    Memo4.Enabled:=False;    Memo5.Enabled:=False;

Main.Balls:= Main.Balls+Main.TekBall;
Main.Pros:= Main.Balls*100/ListBox1.Count;

tempS:=FloatToStr(Main.TekBall);
Delete(tempS, 5, length(tempS));
Edit4.Text:=tempS;

tempS:=FloatToStr(Main.Balls);
Delete(tempS, 5, length(tempS));
Edit3.Text:=tempS;

tempS:=FloatToStr(Main.Pros);
Delete(tempS, 6, length(tempS));
Edit2.Text:=tempS+'%';

If Main.Pros>=StrToInt(form3.ComboBox3.Text) then
begin
  Edit1.Text:='Удовл.';
  Edit1.Color:=clYellow;
end else
begin
  Edit1.Text:='Неудовл.';
  Edit1.Color:=clRed;
end;

If Main.Pros>=StrToInt(form3.ComboBox4.Text) then
begin Edit1.Text:='Хорошо'; Edit1.Color:=clLime; end;
If Main.Pros>=StrToInt(form3.ComboBox5.Text) then
begin Edit1.Text:='Отлично'; Edit1.Color:=clAqua; end;
If Main.Pros>=95 then
begin Edit1.Text:='ПРЕВОСХОДНО!'; Edit1.Color:=clSkyBlue; end;

Key1:=False;
for i:=0 to Listbox1.Count-1 do
begin
  Quake := Listbox1.Items.Objects[i] as TQuake;  //Получение шарика из списка
  If Quake.Freezy = false then Key1:=True;
end;

If Key1 = false then
  begin
  form4.label3.Caption:=Edit1.Text;
  form4.label3.Color:=Edit1.Color;
  form4.label5.Caption:=Edit3.Text;
  form4.label7.Caption:=Edit2.Text;
  Form4.ShowModal;
  end;
  Label5.Caption:='Ответ уже дан';

end;

procedure TMain.FormShow(Sender: TObject);
begin
Main.Count:=0;
Main.Balls:=0;
Main.Pros:=0;
Main.Count:=0;
end;

procedure TMain.ACT_HELPExecute(Sender: TObject); VAR S1,S2,S3,S4,S5:string;
begin
If ListBox1.ItemIndex=-1 then Exit;
    Quake := Listbox1.Items.Objects[ListBox1.ItemIndex] as TQuake; //Получение
S1:=''; S2:=''; S3:=''; S4:=''; S5:='';
    If (Quake.a1 <> 'NULL') AND (Quake.b1 <> 0) then s1:=Quake.a1;
    If (Quake.a2 <> 'NULL') AND (Quake.b2 <> 0) then s2:=Quake.a2;
    If (Quake.a3 <> 'NULL') AND (Quake.b3 <> 0) then s3:=Quake.a3;
    If (Quake.a4 <> 'NULL') AND (Quake.b4 <> 0) then s4:=Quake.a4;
    If (Quake.a5 <> 'NULL') AND (Quake.b5 <> 0) then s5:=Quake.a5;
    ShowMessage(S1+ #13#10 + S2+ #13#10 + S3+ #13#10 + S4+ #13#10 + S5);
end;

procedure TMain.ACT_PROPExecute(Sender: TObject);
begin
Form3.ComboBox1.Enabled:=False;
Form3.ComboBox3.Enabled:=False;
Form3.ComboBox4.Enabled:=False;
Form3.ComboBox5.Enabled:=False;
if Form3.Showmodal=mrOk then
  If Form3.ComboBox2.ItemIndex=0 then
  begin
  ListBox1.Visible:=True;
  ACT_HELP.Enabled:=True;
  Edit1.Visible:=True;
  Edit2.Visible:=True;
  Edit3.Visible:=True;
  Edit4.Visible:=True;
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label3.Visible:=True;
  Label4.Visible:=True;
  UpDown1.Visible:=False;
  Label6.Visible:=False;
  end else
  begin
  Edit1.Visible:=False;
  Edit2.Visible:=False;
  Edit3.Visible:=False;
  Edit4.Visible:=False;
  Label1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=False;
  Label4.Visible:=False;
  ListBox1.Visible:=False;
  ACT_HELP.Enabled:=False;
  UpDown1.Visible:=True;
  Label6.Visible:=True;
  end;
end;

procedure TMain.Updown1UpClick(Sender: TObject);
begin
if ListBox1.ItemIndex>0 then
ListBox1.ItemIndex:=ListBox1.ItemIndex-1;
Label6.Caption:='Вопрос №'+IntToStr(ListBox1.ItemIndex+1);
  If ListBox1.ItemIndex<>-1 then
    begin
    //Очистка всеъ Мемо
    MainMemo.Clear;
    Memo1.Clear; Memo2.Clear; Memo3.Clear; Memo4.Clear; Memo5.Clear;
    Memo3.Visible:=True; Memo4.Visible:=True; Memo5.Visible:=True;

    //Получение вопроса и переписывание его пропертей в Мемы
    Quake := Listbox1.Items.Objects[ListBox1.ItemIndex] as TQuake; //Получение
    MainMemo.Lines.Strings[0]:=Quake.S;
    Memo1.Lines.Strings[0]:=Quake.a1;
    Memo2.Lines.Strings[0]:=Quake.a2;
    Memo3.Lines.Strings[0]:=Quake.a3;
    Memo4.Lines.Strings[0]:=Quake.a4;
    Memo5.Lines.Strings[0]:=Quake.a5;

    //Если Ответ на вопрос дан - блокируем Чеки и Кнопку, вылаём ответ в Edit
    If Quake.Freezy=true then
    begin
    Label5.Caption:='Ответ уже дан';
    RadioButton1.Enabled:=False;    RadioButton2.Enabled:=False;
    RadioButton3.Enabled:=False;    RadioButton4.Enabled:=False;
    RadioButton5.Enabled:=False;    CheckBox1.Enabled:=False;
    CheckBox2.Enabled:=False;      CheckBox3.Enabled:=False;
    CheckBox4.Enabled:=False;      CheckBox5.Enabled:=False;
    Memo1.Enabled:=False;    Memo2.Enabled:=False;    Memo3.Enabled:=False;
    Memo4.Enabled:=False;    Memo5.Enabled:=False;
    Edit4.Text:=FloatToStr(Quake.Answer);
    ACT_ADD.Enabled:=False;
    end else
    begin
    Label5.Caption:='';
    RadioButton1.Enabled:=True;    RadioButton2.Enabled:=True;
    RadioButton3.Enabled:=True;    RadioButton4.Enabled:=True;
    RadioButton5.Enabled:=True;    CheckBox1.Enabled:=True;
    CheckBox2.Enabled:=True;      CheckBox3.Enabled:=True;
    CheckBox4.Enabled:=True;      CheckBox5.Enabled:=True;
    Memo1.Enabled:=true;    Memo2.Enabled:=true;    Memo3.Enabled:=true;
    Memo4.Enabled:=true;    Memo5.Enabled:=true;
    Edit4.Text:='';
    ACT_ADD.Enabled:=True;
    end;

    //Если ответов несколько - включаем Чекбоксы, иначе - РадиоБатоны
    If Quake.CountA > 1 then
    begin
      RadioButton1.Visible:=False; RadioButton2.Visible:=False;
      RadioButton3.Visible:=False; RadioButton4.Visible:=False;
      RadioButton5.Visible:=False; CheckBox1.Visible:=True;
      CheckBox2.Visible:=True;     CheckBox3.Visible:=True;
      CheckBox4.Visible:=True;     CheckBox5.Visible:=True;
    end
    else
    begin
    RadioButton1.Visible:=True;    RadioButton2.Visible:=True;
    RadioButton3.Visible:=True;    RadioButton4.Visible:=True;
    RadioButton5.Visible:=True;    CheckBox1.Visible:=False;
    CheckBox2.Visible:=False;      CheckBox3.Visible:=False;
    CheckBox4.Visible:=False;      CheckBox5.Visible:=False;
    end;

    //Выпиливаем ненужные пункты, если Ответ=NULL
    If Quake.a3='NULL' then
    begin     RadioButton3.Visible:=False;    Memo3.Visible:=False;
    CheckBox3.Visible:=false;     end;
    If Quake.a4='NULL' then
    begin        RadioButton4.Visible:=False;         Memo4.Visible:=False;
        CheckBox4.Visible:=false;    end;
    If Quake.a5='NULL' then
    begin        RadioButton5.Visible:=False;        Memo5.Visible:=False;
        CheckBox5.Visible:=false;    end;

    //Отжимание Чеков
    RadioButton1.Checked:=False;
    RadioButton2.Checked:=False;
    RadioButton3.Checked:=False;
    RadioButton4.Checked:=False;
    RadioButton5.Checked:=False;
    CheckBox1.Checked:=False;
    CheckBox2.Checked:=False;
    CheckBox3.Checked:=False;
    CheckBox4.Checked:=False;
    CheckBox5.Checked:=False;
end;
end;

procedure TMain.Updown1DownClick(Sender: TObject);
begin
if ListBox1.ItemIndex<ListBox1.count then
ListBox1.ItemIndex:=ListBox1.ItemIndex+1;
Label6.Caption:='Вопрос №'+IntToStr(ListBox1.ItemIndex+1);
  If ListBox1.ItemIndex<>-1 then
    begin
    //Очистка всеъ Мемо
    MainMemo.Clear;
    Memo1.Clear; Memo2.Clear; Memo3.Clear; Memo4.Clear; Memo5.Clear;
    Memo3.Visible:=True; Memo4.Visible:=True; Memo5.Visible:=True;

    //Получение вопроса и переписывание его пропертей в Мемы
    Quake := Listbox1.Items.Objects[ListBox1.ItemIndex] as TQuake; //Получение
    MainMemo.Lines.Strings[0]:=Quake.S;
    Memo1.Lines.Strings[0]:=Quake.a1;
    Memo2.Lines.Strings[0]:=Quake.a2;
    Memo3.Lines.Strings[0]:=Quake.a3;
    Memo4.Lines.Strings[0]:=Quake.a4;
    Memo5.Lines.Strings[0]:=Quake.a5;

    //Если Ответ на вопрос дан - блокируем Чеки и Кнопку, вылаём ответ в Edit
    If Quake.Freezy=true then
    begin
    Label5.Caption:='Ответ уже дан';
    RadioButton1.Enabled:=False;    RadioButton2.Enabled:=False;
    RadioButton3.Enabled:=False;    RadioButton4.Enabled:=False;
    RadioButton5.Enabled:=False;    CheckBox1.Enabled:=False;
    CheckBox2.Enabled:=False;      CheckBox3.Enabled:=False;
    CheckBox4.Enabled:=False;      CheckBox5.Enabled:=False;
    Memo1.Enabled:=False;    Memo2.Enabled:=False;    Memo3.Enabled:=False;
    Memo4.Enabled:=False;    Memo5.Enabled:=False;
    Edit4.Text:=FloatToStr(Quake.Answer);
    ACT_ADD.Enabled:=False;
    end else
    begin
    Label5.Caption:='';
    RadioButton1.Enabled:=True;    RadioButton2.Enabled:=True;
    RadioButton3.Enabled:=True;    RadioButton4.Enabled:=True;
    RadioButton5.Enabled:=True;    CheckBox1.Enabled:=True;
    CheckBox2.Enabled:=True;      CheckBox3.Enabled:=True;
    CheckBox4.Enabled:=True;      CheckBox5.Enabled:=True;
    Memo1.Enabled:=true;    Memo2.Enabled:=true;    Memo3.Enabled:=true;
    Memo4.Enabled:=true;    Memo5.Enabled:=true;
    Edit4.Text:='';
    ACT_ADD.Enabled:=True;
    end;

    //Если ответов несколько - включаем Чекбоксы, иначе - РадиоБатоны
    If Quake.CountA > 1 then
    begin
      RadioButton1.Visible:=False; RadioButton2.Visible:=False;
      RadioButton3.Visible:=False; RadioButton4.Visible:=False;
      RadioButton5.Visible:=False; CheckBox1.Visible:=True;
      CheckBox2.Visible:=True;     CheckBox3.Visible:=True;
      CheckBox4.Visible:=True;     CheckBox5.Visible:=True;
    end
    else
    begin
    RadioButton1.Visible:=True;    RadioButton2.Visible:=True;
    RadioButton3.Visible:=True;    RadioButton4.Visible:=True;
    RadioButton5.Visible:=True;    CheckBox1.Visible:=False;
    CheckBox2.Visible:=False;      CheckBox3.Visible:=False;
    CheckBox4.Visible:=False;      CheckBox5.Visible:=False;
    end;

    //Выпиливаем ненужные пункты, если Ответ=NULL
    If Quake.a3='NULL' then
    begin     RadioButton3.Visible:=False;    Memo3.Visible:=False;
    CheckBox3.Visible:=false;     end;
    If Quake.a4='NULL' then
    begin        RadioButton4.Visible:=False;         Memo4.Visible:=False;
        CheckBox4.Visible:=false;    end;
    If Quake.a5='NULL' then
    begin        RadioButton5.Visible:=False;        Memo5.Visible:=False;
        CheckBox5.Visible:=false;    end;

    //Отжимание Чеков
    RadioButton1.Checked:=False;
    RadioButton2.Checked:=False;
    RadioButton3.Checked:=False;
    RadioButton4.Checked:=False;
    RadioButton5.Checked:=False;
    CheckBox1.Checked:=False;
    CheckBox2.Checked:=False;
    CheckBox3.Checked:=False;
    CheckBox4.Checked:=False;
    CheckBox5.Checked:=False;
end;
end;

end.
