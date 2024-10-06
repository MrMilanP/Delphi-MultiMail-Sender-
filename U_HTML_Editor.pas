unit U_HTML_Editor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, remain, Vcl.ExtCtrls,
  Vcl.ComCtrls, RTF2HTML, JvRichEditToHtml, Vcl.Buttons, DateUtils, JvRgbToHtml;

type
  TF_HTML_Editor = class(TForm)
    GroupBox1: TGroupBox;
    Edit_Code: TEdit;
    Edit_Hour: TEdit;
    Edit_Email: TEdit;
    Edit_Link: TEdit;
    Edit_Quantity: TEdit;
    Label1: TLabel;
    PageCtrl: TPageControl;
    TabText: TTabSheet;
    TabHTML: TTabSheet;
    Memo_Html: TMemo;
    Panel_Email: TPanel;
    Btn_Email: TSpeedButton;
    TabEmail: TTabSheet;
    TabLink: TTabSheet;
    Panel_Link: TPanel;
    Btn_Link: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Memo_ListEmail: TMemo;
    Memo_ListLink: TMemo;
    Timer1: TTimer;
    Check_SysTime: TCheckBox;
    Check_StartTimeCount: TCheckBox;
    OpenDialog2: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure TabHTMLShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Btn_EmailClick(Sender: TObject);
    procedure Btn_LinkClick(Sender: TObject);
    procedure Edit_QuantityChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Check_SysTimeClick(Sender: TObject);
  private
    RE_Backup: TRichEdit;
    F_RichEdit: TF_RichEdit;
    procedure CopyRTF(redFrom, redTo: TRichEdit);
  public

  end;

var
  F_HTML_Editor: TF_HTML_Editor;

  RichEditToHtml: TJvRichEditToHtml;

implementation

uses
  U_MultiMail, SHDocVw, MSHTML;

{$R *.dfm}

procedure TF_HTML_Editor.Btn_EmailClick(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if Execute then
    begin
      Memo_ListEmail.Lines.LoadFromFile(FileName);
      TabEmail.Caption := 'Email ' + IntToStr(Memo_ListEmail.Lines.Count);
    end;
  end;
end;

procedure TF_HTML_Editor.Check_SysTimeClick(Sender: TObject);
begin
  if Check_SysTime.Checked then
  begin
    Edit_Hour.Text := FormatDateTime('hh:nn:ss', now);
  end;
end;

procedure TF_HTML_Editor.CopyRTF(redFrom, redTo: TRichEdit);

var
  s: TMemoryStream;

begin
  s := TMemoryStream.Create;

  try
    redFrom.Lines.SaveToStream(s);
    s.Position := 0;
    redTo.Lines.LoadFromStream(s);
  finally
    s.Free;
  end;
end;

procedure TF_HTML_Editor.Edit_QuantityChange(Sender: TObject);
var
  I: Integer;
begin
  try
    I := StrToInt(Edit_Quantity.Text)
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Edit_Quantity.Text := '10';
    end;
  end;
  if Edit_Quantity.Text = '0' then
  begin
    Edit_Quantity.Text := '1';
  end;
end;

function ClipboardToHTML(AParent: TWinControl): WideString;
var
  wb: TWebBrowser;

  function WaitDocumentReady: Boolean;
  var
    StartTime: DWORD;
  begin
    StartTime := GetTickCount;
    while wb.ReadyState <> READYSTATE_COMPLETE do
    begin
      Application.HandleMessage;
      if GetTickCount >= StartTime + 2000 then // time-out of max 2 sec
      begin
        Result := False; // time-out
        Exit;
      end;
    end;
    Result := True;
  end;

begin
  Result := '';
  wb := TWebBrowser.Create(nil);
  try
    wb.Silent := True;
    wb.Width := 0;
    wb.Height := 0;
    wb.Visible := False;
    TWinControl(wb).Parent := AParent;
    wb.HandleNeeded;
    if wb.HandleAllocated then
    begin
      wb.Navigate('about:blank');
      (wb.Document as IHTMLDocument2).designMode := 'on';
      if WaitDocumentReady then
      begin
        (wb.Document as IHTMLDocument2).execCommand('Paste', False, 0);
        Result := (wb.Document as IHTMLDocument2).body.innerHTML;
      end;
    end;
  finally
    wb.Free;
  end;
end;

function RichTextToStr(red: TRichEdit): string;

var
  ss: TStringStream;

begin
  ss := TStringStream.Create('');

  try
    red.Lines.SaveToStream(ss);
    Result := ss.DataString;
  finally
    ss.Free;
  end;
end;

procedure TF_HTML_Editor.FormCreate(Sender: TObject);
begin
  RE_Backup := TRichEdit.Create(self);
  RichEditToHtml := TJvRichEditToHtml.Create(self);
  Edit_Hour.Text := FormatDateTime('hh:nn:ss', now);
end;

procedure TF_HTML_Editor.FormHide(Sender: TObject);
begin
  // CopyRTF(F_RichEdit.Editor, RE_Backup);
end;

procedure TF_HTML_Editor.FormShow(Sender: TObject);
begin
  if not Assigned(F_RichEdit) then
  begin
    F_RichEdit := TF_RichEdit.Create(self);
    F_RichEdit.Parent := TabText;
    F_RichEdit.Show;
    // F_RichEdit.populateMemo(Memo_Html);
    F_RichEdit.SetParentName(self.Name);
  end;

  // ShowMessage(Self.Name);
end;

// function TF_HTML_Editor.ReturnSelf: string;
// begin
// Result := Self.Name;
// end;

procedure TF_HTML_Editor.Btn_LinkClick(Sender: TObject);
begin
  with OpenDialog2 do
  begin
    if Execute then
    begin
      Memo_ListLink.Lines.LoadFromFile(FileName);
      TabLink.Caption := 'Link ' + IntToStr(Memo_ListLink.Lines.Count);
    end;
  end;
end;

procedure TF_HTML_Editor.TabHTMLShow(Sender: TObject);
begin

  // RichEditToHtml.ConvertToHtmlStrings(F_RichEdit.Editor, Memo_Html.Lines);

  // Memo_Html.Lines.Text := StringReplace(Memo_Html.Lines.Text, '<BODY>',
  // '<BODY bgcolor="#' + RgbToHtml(F_RichEdit.Editor.Color) + '">', []);
  // F_RichEdit.Editor.SelectAll;
  // F_RichEdit.Editor.CopyToClipboard;

  // ShowMessage(ClipboardToHTML(Self));
  // Memo_Html.Text := ClipboardToHTML(Self);
end;

procedure TF_HTML_Editor.Timer1Timer(Sender: TObject);
var
  Tm: TTime;
begin
  if Check_StartTimeCount.Checked then
  begin
    if Check_SysTime.Checked then
    begin
      Edit_Hour.Text := FormatDateTime('hh:nn:ss', now);
    end
    else
    begin
      try
        Tm := StrToTime(Edit_Hour.Text);
        Edit_Hour.Text := FormatDateTime('hh:nn:ss', IncSecond(Tm, 1));
      except
        on E: Exception do
        begin
          Edit_Hour.Text := FormatDateTime('hh:nn:ss', now);
          ShowMessage(E.Message);
        end;
      end;
    end;
  end;
end;

end.
