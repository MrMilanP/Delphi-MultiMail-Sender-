unit U_ListMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TF_ListMail = class(TForm)
    GroupBox1: TGroupBox;
    Memo_ListMail: TMemo;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ListMail: TF_ListMail;

implementation

uses
  U_MultiMail;

{$R *.dfm}

procedure TF_ListMail.BitBtn1Click(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if Execute then
    begin
      Memo_ListMail.Lines.Clear;
      Memo_ListMail.Lines.LoadFromFile(FileName);
      F_MultiMail.Btn_ListMail.Caption := 'ListMail ' + IntToStr(Memo_ListMail.Lines.Count);
    end;
  end;
end;

end.
