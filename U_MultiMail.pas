unit U_MultiMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  USMTPth,
  U_Statistics, U_HTML_Editor, U_Name, U_Sender, U_Subject, U_ListMail,
  U_ListSMTP, U_Attach;

type
  TMySpeedButton = class(TSpeedButton);

type
  TPositions = record
    EmailStartPos: integer;
    EmailCurrPos: integer;
    EmailCount: integer;
    ShippingQuantity: integer;
    // ShippingStartPos: integer;
    ShippingCurrPos: integer;
    ShippingUsed: integer;
  end;

type
  TF_MultiMail = class(TForm)
    Btn_Statistics: TBitBtn;
    Btn_Name: TBitBtn;
    Btn_Sender: TBitBtn;
    Btn_Subject: TBitBtn;
    Btn_ListMail: TBitBtn;
    Btn_ListSMTP: TBitBtn;
    Btn_Attach: TBitBtn;
    Panel_Container: TFlowPanel;
    Panel_HTML_1: TPanel;
    Btn_HTML_1: TSpeedButton;
    Panel_HTML_2: TPanel;
    Btn_HTML_2: TSpeedButton;
    Panel_HTML_3: TPanel;
    Btn_HTML_3: TSpeedButton;
    Panel_HTML_4: TPanel;
    Btn_HTML_4: TSpeedButton;
    Panel_HTML_5: TPanel;
    Btn_HTML_5: TSpeedButton;
    Btn_Start: TBitBtn;
    Btn_Pause: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_HTML_1Click(Sender: TObject);
    procedure Btn_HTML_2Click(Sender: TObject);
    procedure Btn_HTML_3Click(Sender: TObject);
    procedure Btn_HTML_4Click(Sender: TObject);
    procedure Btn_HTML_5Click(Sender: TObject);
    procedure Btn_StatisticsClick(Sender: TObject);
    procedure Btn_NameClick(Sender: TObject);
    procedure Btn_SenderClick(Sender: TObject);
    procedure Btn_StartClick(Sender: TObject);
    procedure Btn_PauseClick(Sender: TObject);
    procedure Btn_SubjectClick(Sender: TObject);
    procedure Btn_ListMailClick(Sender: TObject);
    procedure Btn_ListSMTPClick(Sender: TObject);
    procedure Btn_AttachClick(Sender: TObject);

  private
    SSLEmail1: TSSLEmail;
    SSLEmail2: TSSLEmail;
    SSLEmail3: TSSLEmail;
    SSLEmail4: TSSLEmail;
    SSLEmail5: TSSLEmail;

    Positions1: TPositions;
    Positions2: TPositions;
    Positions3: TPositions;
    Positions4: TPositions;
    Positions5: TPositions;

    procedure HideAllForms();
    procedure SentMessage1(msg: string);
    procedure SentMessage2(msg: string);
    procedure SentMessage3(msg: string);
    procedure SentMessage4(msg: string);
    procedure SentMessage5(msg: string);
    procedure SetFirstStart();

    procedure SendMail(SSLEmail: TSSLEmail; Positions: TPositions; F_HTML_Editor: TF_HTML_Editor);
    procedure SendAllMail();
    function MakeBody(Frm: TF_HTML_Editor): string;
    procedure EnableDiasbleControls(val: Boolean);

  public
    { Public declarations }
  end;

var
  F_MultiMail: TF_MultiMail;
  F_HTML_Editor_1: TF_HTML_Editor;
  F_HTML_Editor_2: TF_HTML_Editor;
  F_HTML_Editor_3: TF_HTML_Editor;
  F_HTML_Editor_4: TF_HTML_Editor;
  F_HTML_Editor_5: TF_HTML_Editor;
  FirstStart: Boolean = True;
  // EmailCounter: integer = 0;
  EmailCapacity: integer = 0;
  NumActiveSenders: integer = 0;
  SMPTCount: integer = 0;

  Pause: Boolean = false;

  CountSent: integer = 0;

  // NameCounter: integer = 0;
  // SenderCounter: integer = 0;
  // SubjectCounter: integer = 0;

implementation

{$R *.dfm}

procedure TF_MultiMail.Btn_AttachClick(Sender: TObject);
begin
  HideAllForms;
  F_Attach.Visible := True;
end;

procedure TF_MultiMail.Btn_HTML_1Click(Sender: TObject);
begin
  HideAllForms;
  F_HTML_Editor_1.GroupBox1.Caption := 'HTML Editor - 1';
  F_HTML_Editor_1.Visible := True;
end;

procedure TF_MultiMail.Btn_HTML_2Click(Sender: TObject);
begin
  HideAllForms;
  F_HTML_Editor_2.GroupBox1.Caption := 'HTML Editor - 2';
  F_HTML_Editor_2.Visible := True;
end;

procedure TF_MultiMail.Btn_HTML_3Click(Sender: TObject);
begin
  HideAllForms;
  F_HTML_Editor_3.GroupBox1.Caption := 'HTML Editor - 3';
  F_HTML_Editor_3.Visible := True;
end;

procedure TF_MultiMail.Btn_HTML_4Click(Sender: TObject);
begin
  HideAllForms;
  F_HTML_Editor_4.GroupBox1.Caption := 'HTML Editor - 4';
  F_HTML_Editor_4.Visible := True;
end;

procedure TF_MultiMail.Btn_HTML_5Click(Sender: TObject);
begin
  HideAllForms;
  F_HTML_Editor_5.Visible := True;
end;

procedure TF_MultiMail.Btn_ListMailClick(Sender: TObject);
begin
  HideAllForms;
  F_ListMail.Visible := True;
end;

procedure TF_MultiMail.Btn_ListSMTPClick(Sender: TObject);
begin
  HideAllForms;
  F_ListSMTP.Visible := True;
end;

procedure TF_MultiMail.Btn_NameClick(Sender: TObject);
begin
  HideAllForms;
  F_Name.Visible := True;
end;

procedure TF_MultiMail.Btn_PauseClick(Sender: TObject);
begin
  Btn_Start.Enabled := True;
  Btn_Pause.Enabled := false;
  Pause := True;
end;

procedure TF_MultiMail.Btn_SenderClick(Sender: TObject);
begin
  HideAllForms;
  F_Sender.Visible := True;
end;

procedure TF_MultiMail.Btn_StartClick(Sender: TObject);

begin
  Pause := false;
  if FirstStart then // first start iteration after app is stared
  begin
    FirstStart := false;
    SetFirstStart;
  end
  else
  begin
    Btn_Pause.Enabled := True;
    Btn_Start.Enabled := false;
  end;
  EnableDiasbleControls(false);
  SendAllMail;

end;

procedure TF_MultiMail.Btn_StatisticsClick(Sender: TObject);
begin
  HideAllForms;
  F_Statistics.Visible := True;
end;

procedure TF_MultiMail.Btn_SubjectClick(Sender: TObject);
begin
  HideAllForms;
  F_Subject.Visible := True;
end;

procedure TF_MultiMail.EnableDiasbleControls(val: Boolean);
begin
  F_Subject.Memo_Subject.Enabled := val;
  F_Subject.BitBtn1.Enabled := val;
  F_Name.Memo_Name.Enabled := val;
  F_Name.BitBtn1.Enabled := val;
  F_Sender.Memo_Sender.Enabled := val;
  F_Sender.BitBtn1.Enabled := val;
  F_ListSMTP.Memo_ListSMTP.Enabled := val;
  F_ListSMTP.BitBtn1.Enabled := val;
  F_ListMail.Memo_ListMail.Enabled := val;
  F_ListMail.BitBtn1.Enabled := val;

end;

procedure TF_MultiMail.FormCreate(Sender: TObject);
begin
  initMimeTypes;

  Panel_HTML_1.Color := $FACE87;
  Panel_HTML_2.Color := $FAE6E6;
  Panel_HTML_3.Color := $CDFAFF;
  Panel_HTML_4.Color := $E1E4FF;
  Panel_HTML_5.Color := $006BFCC3;

  SSLEmail1 := TSSLEmail.Create(1);
  SSLEmail1.onSentMessage := SentMessage1;
  SSLEmail2 := TSSLEmail.Create(2);
  SSLEmail2.onSentMessage := SentMessage2;
  SSLEmail3 := TSSLEmail.Create(3);
  SSLEmail3.onSentMessage := SentMessage3;
  SSLEmail4 := TSSLEmail.Create(4);
  SSLEmail4.onSentMessage := SentMessage4;
  SSLEmail5 := TSSLEmail.Create(5);
  SSLEmail5.onSentMessage := SentMessage5;

end;

procedure TF_MultiMail.FormShow(Sender: TObject);
begin

  F_HTML_Editor_1 := TF_HTML_Editor.Create(Self);
  F_HTML_Editor_1.Parent := Panel_Container;
  with F_HTML_Editor_1 do
  begin
    Name := 'F_HTML_Editor_1';
    Edit_Code.Color := $FACE87;
    Edit_Hour.Color := $FACE87;
    Edit_Email.Color := $FACE87;
    Edit_Link.Color := $FACE87;
    Edit_Quantity.Color := $FACE87;
    Memo_Html.Color := $FACE87;
    Panel_Email.Color := $FACE87;
    Panel_Link.Color := $FACE87;
    GroupBox1.Caption := 'HTML Editor - 1';
    Show;
    Hide;
  end;

  F_HTML_Editor_2 := TF_HTML_Editor.Create(Self);
  F_HTML_Editor_2.Parent := Panel_Container;
  with F_HTML_Editor_2 do
  begin
    Name := 'F_HTML_Editor_2';
    Edit_Code.Color := $FAE6E6;
    Edit_Hour.Color := $FAE6E6;
    Edit_Email.Color := $FAE6E6;
    Edit_Link.Color := $FAE6E6;
    Edit_Quantity.Color := $FAE6E6;
    Panel_Email.Color := $FAE6E6;
    Memo_Html.Color := $FAE6E6;
    Panel_Link.Color := $FAE6E6;
    GroupBox1.Caption := 'HTML Editor - 2';
    Show;
    Hide;
  end;

  F_HTML_Editor_3 := TF_HTML_Editor.Create(Self);
  F_HTML_Editor_3.Parent := Panel_Container;
  with F_HTML_Editor_3 do
  begin
    Name := 'F_HTML_Editor_3';
    Edit_Code.Color := $CDFAFF;
    Edit_Hour.Color := $CDFAFF;
    Edit_Email.Color := $CDFAFF;
    Edit_Link.Color := $CDFAFF;
    Edit_Quantity.Color := $CDFAFF;
    Panel_Email.Color := $CDFAFF;
    Panel_Link.Color := $CDFAFF;
    Memo_Html.Color := $CDFAFF;
    GroupBox1.Caption := 'HTML Editor - 3';
    Show;
    Hide;
  end;

  F_HTML_Editor_4 := TF_HTML_Editor.Create(Self);
  F_HTML_Editor_4.Parent := Panel_Container;
  with F_HTML_Editor_4 do
  begin
    Name := 'F_HTML_Editor_4';
    Edit_Code.Color := $E1E4FF;
    Edit_Hour.Color := $E1E4FF;
    Edit_Email.Color := $E1E4FF;
    Edit_Link.Color := $E1E4FF;
    Edit_Quantity.Color := $E1E4FF;
    Panel_Email.Color := $E1E4FF;
    Panel_Link.Color := $E1E4FF;
    Memo_Html.Color := $E1E4FF;
    GroupBox1.Caption := 'HTML Editor - 4';
    Show;
    Hide;
  end;

  F_HTML_Editor_5 := TF_HTML_Editor.Create(Self);
  F_HTML_Editor_5.Parent := Panel_Container;
  with F_HTML_Editor_5 do
  begin
    Name := 'F_HTML_Editor_5';
    Edit_Code.Color := $006BFCC3;
    Edit_Hour.Color := $006BFCC3;
    Edit_Email.Color := $006BFCC3;
    Edit_Link.Color := $006BFCC3;
    Edit_Quantity.Color := $006BFCC3;
    Panel_Email.Color := $006BFCC3;
    Panel_Link.Color := $006BFCC3;
    Memo_Html.Color := $006BFCC3;
    GroupBox1.Caption := 'HTML Editor - 5';
    Show;
    Hide;
  end;

  F_Statistics.Parent := Panel_Container;
  F_Name.Parent := Panel_Container;
  F_Sender.Parent := Panel_Container;
  F_Subject.Parent := Panel_Container;
  F_ListMail.Parent := Panel_Container;
  F_ListSMTP.Parent := Panel_Container;
  F_Attach.Parent := Panel_Container;

  F_HTML_Editor_1.Show;

  // SSLEmail1 := TSSLEmail.Create;

end;

procedure TF_MultiMail.HideAllForms;
begin
  F_Statistics.Visible := false;
  F_HTML_Editor_1.Visible := false;
  F_HTML_Editor_2.Visible := false;
  F_HTML_Editor_3.Visible := false;
  F_HTML_Editor_4.Visible := false;
  F_HTML_Editor_5.Visible := false;
  F_Name.Visible := false;
  F_Sender.Visible := false;
  F_Subject.Visible := false;
  F_ListMail.Visible := false;
  F_ListSMTP.Visible := false;
  F_Attach.Visible := false;
end;

function TF_MultiMail.MakeBody(Frm: TF_HTML_Editor): string;
var
  Body, link, email: String;
begin
  Result := '';
  Randomize;
  Body := Frm.Memo_Html.Text;
  if Frm.Memo_ListEmail.Lines.Count = 0 then
  begin
    Body := StringReplace(Body, '%email%', '', [rfReplaceAll]);
  end
  else
  begin
    email := Frm.Memo_ListEmail.Lines[Random(Frm.Memo_ListEmail.Lines.Count)];
    email := '<a href="mailto:' + email + '">' + email + '</a>';
    Body := StringReplace(Body, '%email%', email, [rfReplaceAll]);
  end;
  if Frm.Memo_ListLink.Lines.Count = 0 then
  begin

    Body := StringReplace(Body, '%link%', '', [rfReplaceAll]);
  end
  else
  begin
    link := Frm.Memo_ListLink.Lines[Random(Frm.Memo_ListLink.Lines.Count)];
    link := '<a href="' + link + '">' + link + '</a>';
    Body := StringReplace(Body, '%link%', link, [rfReplaceAll]);
  end;
  Body := StringReplace(Body, '%code%', Frm.Edit_Code.Text, [rfReplaceAll]);
  Body := StringReplace(Body, '%time%', Frm.Edit_Hour.Text, [rfReplaceAll]);
  Frm.Edit_Code.Text := IntToStr(StrToInt(Frm.Edit_Code.Text) + 1);

  Result := Body;

end;

procedure TF_MultiMail.SendAllMail;
begin
  SendMail(SSLEmail1, Positions1, F_HTML_Editor_1);
  SendMail(SSLEmail2, Positions2, F_HTML_Editor_2);
  SendMail(SSLEmail3, Positions3, F_HTML_Editor_3);
  SendMail(SSLEmail4, Positions4, F_HTML_Editor_4);
  SendMail(SSLEmail5, Positions5, F_HTML_Editor_5);
end;

procedure TF_MultiMail.SendMail(SSLEmail: TSSLEmail; Positions: TPositions; F_HTML_Editor: TF_HTML_Editor);
var
  SL1 { , SL2, SL3 } : Tstrings;
  S, S2, S3: String;
  I: integer;
begin
  if not Pause then
  begin
    Randomize;

    Inc(Positions.ShippingUsed);
    SL1 := TStringList.Create;
    try
      with SSLEmail do
      begin
        SL1.Text := StringReplace(F_ListSMTP.Memo_ListSMTP.Lines[Positions.ShippingCurrPos], ';', #13#10,
           [rfReplaceAll]);
        edSMTPServer := SL1[0];
        edSenderEmail := SL1[1];
        edUserName := SL1[1];
        edPassword := SL1[2];
        edSMTPPort := StrToInt(SL1[3]);
        edToEmail := F_ListMail.Memo_ListMail.Lines[Positions.EmailCurrPos];
        edSubject := F_Subject.Memo_Subject.Lines[Random(F_Subject.Memo_Subject.Lines.Count)];
        edSenderName := F_Sender.Memo_Sender.Lines[Random(F_Sender.Memo_Sender.Lines.Count)];
        edBody.Text := MakeBody(F_HTML_Editor);

        edAttachments.Clear;
        edMimeTypes.Clear;
        S2 := '';
        S3 := '';
        if F_Attach.ListView1.Items.Count > 0 then
        begin
          for I := 0 to F_Attach.ListView1.Items.Count - 1 do
          begin
            S2 := S2 + F_Attach.ListView1.Items[I].Caption + #13#10;
            S3 := S3 + F_Attach.ListView1.Items[I].SubItems[0] + #13#10;
          end;
          edAttachments.Text := S2;
          edMimeTypes.Text := S3;
        end;
        with F_Statistics.Memo_log.Lines do
        begin
           add('==========SEND MESSAGE===============');
           add('SMTPServer : ' + edSMTPServer);
           add('SMTPPort : ' + IntToStr(edSMTPPort));
           add('UserName : ' + edUserName);
           add('Password : ' + edPassword);
           add('SenderEmail : ' + edSenderEmail);
           add('ToEmail : ' + edToEmail);
            //add('Current Position  : ' +  IntToStr( Positions.EmailCurrPos));
           add('Subject : ' + edSubject);
           add('SenderName : ' + edSenderName);
           add('=====================================');
        end;
        SendAMail;
      end;
    finally
      SL1.Free;
    end;
  end;
end;

procedure TF_MultiMail.SentMessage1(msg: string);
begin

  if msg = '' then
  begin
    F_Statistics.SetSuccCount(1);
    F_Statistics.Memo_log.Lines.add('Success');
  end
  else
  begin
    F_Statistics.SetErrCount(1);
    F_Statistics.Memo_log.Lines.add('Error : ' + msg);
  end;
  if (Positions1.ShippingUsed >= Positions1.ShippingQuantity) then
  begin
    if (SMPTCount - 1) < (Positions1.ShippingCurrPos + 5) then
    begin
      with Positions1 do
      begin
        ShippingCurrPos := 0;
        ShippingUsed := 0;
      end;
    end
    else
    begin
      with Positions1 do
      begin
        ShippingCurrPos := ShippingCurrPos + 5;
        ShippingUsed := 0;
      end;
    end;
  end;

  Inc(Positions1.EmailCurrPos);
  if Positions1.EmailCurrPos < (Positions1.EmailCount + Positions1.EmailStartPos) then
  begin
    //if not Pause then
      SendMail(SSLEmail1, Positions1, F_HTML_Editor_1);
  end
  else
  begin
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');
    F_Statistics.Memo_log.Lines.add('Sender 1 finished job');
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');

  end;
  Inc(CountSent);
  if CountSent = EmailCapacity then
  begin
    SetFirstStart;
    Btn_Pause.Enabled := false;
    Btn_Start.Enabled := True;
    EnableDiasbleControls(True);
  end;
end;

procedure TF_MultiMail.SentMessage2(msg: string);
begin
  if msg = '' then
  begin
    F_Statistics.SetSuccCount(2);
    F_Statistics.Memo_log.Lines.add('Success');
  end
  else
  begin
    F_Statistics.SetErrCount(2);
    F_Statistics.Memo_log.Lines.add('Error : ' + msg);
  end;
  if (Positions2.ShippingUsed >= Positions2.ShippingQuantity) then
  begin
    if (SMPTCount - 1) < (Positions2.ShippingCurrPos + 5) then
    begin
      with Positions2 do
      begin
        if SMPTCount > 1 then
        begin
          ShippingCurrPos := 1;
        end
        else
        begin
          ShippingCurrPos := 0;
        end;
        ShippingUsed := 0;
      end;
    end
    else
    begin
      with Positions2 do
      begin
        ShippingCurrPos := ShippingCurrPos + 5;
        ShippingUsed := 0;
      end;
    end;
  end;

  Inc(Positions2.EmailCurrPos);
  if Positions2.EmailCurrPos < (Positions2.EmailCount + Positions2.EmailStartPos) then
  begin
    //if not Pause then
      SendMail(SSLEmail2, Positions2, F_HTML_Editor_2);
  end
  else
  begin
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');
    F_Statistics.Memo_log.Lines.add('Sender 2 finished job');
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');

  end;
  Inc(CountSent);
  if CountSent = EmailCapacity then
  begin
    SetFirstStart;
    Btn_Pause.Enabled := false;
    Btn_Start.Enabled := True;
    EnableDiasbleControls(True);
  end;
end;

procedure TF_MultiMail.SentMessage3(msg: string);
begin
  if msg = '' then
  begin
    F_Statistics.SetSuccCount(3);
    F_Statistics.Memo_log.Lines.add('Success');
  end
  else
  begin
    F_Statistics.SetErrCount(3);
    F_Statistics.Memo_log.Lines.add('Error : ' + msg);
  end;

  if (Positions3.ShippingUsed >= Positions3.ShippingQuantity) then
  begin
    if (SMPTCount - 1) < (Positions3.ShippingCurrPos + 5) then
    begin
      with Positions3 do
      begin
        if SMPTCount > 2 then
        begin
          ShippingCurrPos := 2;
        end
        else
        begin
          ShippingCurrPos := SMPTCount - 1;
        end;
        ShippingUsed := 0;
      end;
    end
    else
    begin
      with Positions3 do
      begin
        ShippingCurrPos := ShippingCurrPos + 5;
        ShippingUsed := 0;
      end;
    end;
  end;

  Inc(Positions3.EmailCurrPos);
  if Positions3.EmailCurrPos < (Positions3.EmailCount + Positions3.EmailStartPos) then
  begin
    //if not Pause then
      SendMail(SSLEmail3, Positions3, F_HTML_Editor_3);
  end
  else
  begin
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');
    F_Statistics.Memo_log.Lines.add('Sender 3 finished job');
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');
    // Exit
  end;
  Inc(CountSent);
  if CountSent = EmailCapacity then
  begin
    SetFirstStart;
    Btn_Pause.Enabled := false;
    Btn_Start.Enabled := True;
    EnableDiasbleControls(True);
  end;
end;

procedure TF_MultiMail.SentMessage4(msg: string);
begin
  if msg = '' then
  begin
    F_Statistics.SetSuccCount(4);
    F_Statistics.Memo_log.Lines.add('Success');
  end
  else
  begin
    F_Statistics.SetErrCount(4);
    F_Statistics.Memo_log.Lines.add('Error : ' + msg);
  end;

  if (Positions4.ShippingUsed >= Positions4.ShippingQuantity) then
  begin
    if (SMPTCount - 1) < (Positions4.ShippingCurrPos + 5) then
    begin
      with Positions4 do
      begin
        if SMPTCount > 3 then
        begin
          ShippingCurrPos := 3;
        end
        else
        begin
          ShippingCurrPos := SMPTCount - 1;
        end;
        ShippingUsed := 0;
      end;
    end
    else
    begin
      with Positions4 do
      begin
        ShippingCurrPos := ShippingCurrPos + 5;
        ShippingUsed := 0;
      end;
    end;
  end;

  Inc(Positions4.EmailCurrPos);
  if Positions4.EmailCurrPos < (Positions4.EmailCount + Positions4.EmailStartPos) then
  begin
    //if not Pause then
      SendMail(SSLEmail4, Positions4, F_HTML_Editor_4);
  end
  else
  begin
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');
    F_Statistics.Memo_log.Lines.add('Sender 4 finished job');
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');
    // Exit
  end;
  Inc(CountSent);
  if CountSent = EmailCapacity then
  begin
    SetFirstStart;
    Btn_Pause.Enabled := false;
    Btn_Start.Enabled := True;
    EnableDiasbleControls(True);
  end;
end;

procedure TF_MultiMail.SentMessage5(msg: string);
begin
  if msg = '' then
  begin
    F_Statistics.SetSuccCount(5);
    F_Statistics.Memo_log.Lines.add('Success');
  end

  else
  begin
    F_Statistics.SetErrCount(5);
    F_Statistics.Memo_log.Lines.add('Error : ' + msg);
  end;

  if (Positions5.ShippingUsed >= Positions5.ShippingQuantity) then
  begin
    if (SMPTCount - 1) < (Positions5.ShippingCurrPos + 5) then
    begin
      with Positions5 do
      begin
        if SMPTCount > 4 then
        begin
          ShippingCurrPos := 4;
        end
        else
        begin
          ShippingCurrPos := SMPTCount - 1;
        end;
        ShippingUsed := 0;
      end;
    end
    else
    begin
      with Positions5 do
      begin
        ShippingCurrPos := ShippingCurrPos + 5;
        ShippingUsed := 0;
      end;
    end;
  end;

  Inc(Positions5.EmailCurrPos);
  if Positions5.EmailCurrPos < (Positions5.EmailCount + Positions5.EmailStartPos) then
  begin
    //if not Pause then
      SendMail(SSLEmail5, Positions5, F_HTML_Editor_5);
  end
  else
  begin
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');
    F_Statistics.Memo_log.Lines.add('Sender 5 finished job');
    F_Statistics.Memo_log.Lines.add('++++++++++++++++++++++++++++++++++');

  end;
  Inc(CountSent);
  if CountSent = EmailCapacity then
  begin

    SetFirstStart;
    Btn_Pause.Enabled := false;
    Btn_Start.Enabled := True;
    EnableDiasbleControls(True);
  end;
end;

procedure TF_MultiMail.SetFirstStart;
var
  NumMailBySender, NumMailModalbySender: integer;
  SL1: Tstrings;
begin
  // ShowMessage('pozvan');
  EmailCapacity := F_ListMail.Memo_ListMail.Lines.Count;
  SMPTCount := F_ListSMTP.Memo_ListSMTP.Lines.Count;
  CountSent := 0;
  if (SMPTCount = 0) or (EmailCapacity = 0) or (F_Subject.Memo_Subject.Lines.Count = 0) or
     (F_Sender.Memo_Sender.Lines.Count = 0) then
  begin
    ShowMessage('Please load ListMail, SMTP, Subject Matter, Sender!');
  end
  else
  begin
    Btn_Pause.Enabled := True;
    Btn_Start.Enabled := false;
    if (EmailCapacity <= 5) and (EmailCapacity > 0) then
    begin
      NumActiveSenders := 1;
      NumMailBySender := EmailCapacity;
      with Positions1 do
      begin
        EmailStartPos := 0;
        EmailCurrPos := 0;
        EmailCount := EmailCapacity;
        ShippingQuantity := StrToInt(F_HTML_Editor_1.Edit_Quantity.Text);
        // ShippingStartPos := 0;
        ShippingCurrPos := 0;
        ShippingUsed := 0;
      end;
    end;
    if (EmailCapacity > 5) then
    begin
      NumActiveSenders := 5;
      NumMailBySender := EmailCapacity div 5;
      NumMailModalbySender := EmailCapacity mod 5;
      with Positions1 do
      begin
        EmailStartPos := 0;
        EmailCurrPos := 0;
        EmailCount := NumMailBySender;
        ShippingQuantity := StrToInt(F_HTML_Editor_1.Edit_Quantity.Text);
        // ShippingStartPos := 0;
        ShippingCurrPos := 0;
        ShippingUsed := 0;
      end;
      with Positions2 do
      begin
        EmailStartPos := NumMailBySender;
        EmailCurrPos := NumMailBySender;
        EmailCount := NumMailBySender;
        ShippingQuantity := StrToInt(F_HTML_Editor_2.Edit_Quantity.Text);
        if SMPTCount > 1 then
        begin
          // ShippingStartPos := 1;
          ShippingCurrPos := 1;
        end
        else
        begin
          // ShippingStartPos := 0;
          ShippingCurrPos := 0;
        end;
        ShippingUsed := 0;
      end;
      with Positions3 do
      begin
        EmailStartPos := 2 * NumMailBySender;
        EmailCurrPos := 2 * NumMailBySender;
        EmailCount := NumMailBySender;
        ShippingQuantity := StrToInt(F_HTML_Editor_3.Edit_Quantity.Text);
        if SMPTCount > 2 then
        begin
          // ShippingStartPos := 2;
          ShippingCurrPos := 2;
        end
        else
        begin
          // ShippingStartPos := SMPTCount - 1;
          ShippingCurrPos := SMPTCount - 1;
        end;
        ShippingUsed := 0;
      end;
      with Positions4 do
      begin
        EmailStartPos := 3 * NumMailBySender;
        EmailCurrPos := 3 * NumMailBySender;
        EmailCount := NumMailBySender;
        ShippingQuantity := StrToInt(F_HTML_Editor_4.Edit_Quantity.Text);
        if SMPTCount > 3 then
        begin
          // ShippingStartPos := 3;
          ShippingCurrPos := 3;
        end
        else
        begin
          // ShippingStartPos := SMPTCount - 1;
          ShippingCurrPos := SMPTCount - 1;
        end;
        ShippingUsed := 0;
      end;
      with Positions5 do
      begin
        EmailStartPos := 4 * NumMailBySender;
        EmailCurrPos := 4 * NumMailBySender;
        EmailCount := NumMailBySender + NumMailModalbySender;
        ShippingQuantity := StrToInt(F_HTML_Editor_5.Edit_Quantity.Text);
        if SMPTCount > 4 then
        begin
          // ShippingStartPos := 4;
          ShippingCurrPos := 4;
        end
        else
        begin
          // ShippingStartPos := SMPTCount - 1;
          ShippingCurrPos := SMPTCount - 1;
        end;
        ShippingUsed := 0;
      end;
    end;
    FirstStart := false;
  end;
end;

end.
