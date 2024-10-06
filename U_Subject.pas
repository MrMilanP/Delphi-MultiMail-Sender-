unit U_Subject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TF_Subject = class(TForm)
    GroupBox1: TGroupBox;
    Memo_Subject: TMemo;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Subject: TF_Subject;

implementation

Uses
  U_MultiMail;

{$R *.dfm}

procedure TF_Subject.BitBtn1Click(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if Execute then
    begin
      Memo_Subject.Lines.Clear;
      Memo_Subject.Lines.LoadFromFile(FileName);
      F_MultiMail.Btn_Subject.Caption := 'Subject matter ' + IntToStr(Memo_Subject.Lines.Count);
    end;
  end;
end;

end.
