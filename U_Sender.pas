unit U_Sender;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TF_Sender = class(TForm)
    GroupBox1: TGroupBox;
    Memo_Sender: TMemo;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Sender: TF_Sender;

implementation

uses
  U_MultiMail;

{$R *.dfm}

procedure TF_Sender.BitBtn1Click(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if Execute then
    begin
      Memo_Sender.Lines.Clear;
      Memo_Sender.Lines.LoadFromFile(FileName);
      F_MultiMail.Btn_Sender.Caption := 'Sender ' + IntToStr(Memo_Sender.Lines.Count);
    end;
  end;
end;

end.
