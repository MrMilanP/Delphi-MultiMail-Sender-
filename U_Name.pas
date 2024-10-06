unit U_Name;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TF_Name = class(TForm)
    GroupBox1: TGroupBox;
    Memo_Name: TMemo;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Name: TF_Name;

implementation

uses
  U_MultiMail;

{$R *.dfm}

procedure TF_Name.BitBtn1Click(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if Execute then
    begin
      Memo_Name.Lines.Clear;
      Memo_Name.Lines.LoadFromFile(FileName);
      F_MultiMail.Btn_Name.Caption := 'Name ' + IntToStr(Memo_Name.Lines.Count);
    end;
  end;
end;

end.
