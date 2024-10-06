unit U_ListSMTP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TF_ListSMTP = class(TForm)
    GroupBox1: TGroupBox;
    Memo_ListSMTP: TMemo;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ListSMTP: TF_ListSMTP;

implementation

uses
  U_MultiMail;

{$R *.dfm}

procedure TF_ListSMTP.BitBtn1Click(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if Execute then
    begin
      Memo_ListSMTP.Lines.Clear;
      Memo_ListSMTP.Lines.LoadFromFile(FileName);
      F_MultiMail.Btn_ListSMTP.Caption := 'ListSMTP ' + IntToStr(Memo_ListSMTP.Lines.Count);
    end;
  end;
end;

end.
