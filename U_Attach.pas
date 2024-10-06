unit U_Attach;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TF_Attach = class(TForm)
    GroupBox1: TGroupBox;
    ListView1: TListView;
    Btn_Add: TBitBtn;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure Btn_AddClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Attach: TF_Attach;

implementation

uses
  U_MultiMail, USMTPth;

{$R *.dfm}

procedure TF_Attach.BitBtn1Click(Sender: TObject);
begin
  ListView1.DeleteSelected;
  F_MultiMail.Btn_Attach.Caption := 'Attachment ' + IntToStr(ListView1.Items.Count);
end;

procedure TF_Attach.Btn_AddClick(Sender: TObject);
var
  Itm: TListItem;
  MimeType: string;
begin
  with OpenDialog1 do
    if Execute then
    begin
      Itm := ListView1.Items.Add;
      Itm.Caption := FileName;
      MimeType := getMimeType(FileName);
      if MimeType = '' then
        MimeType := 'application/octet-stream';
      Itm.SubItems.Add(MimeType);
      F_MultiMail.Btn_Attach.Caption := 'Attachment ' + IntToStr(ListView1.Items.Count);

    end;

end;

procedure TF_Attach.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListView1.Items.Count - 1 do
  begin
    ShowMessage(ListView1.Items[I].SubItems[0]);
  end;
end;

end.
