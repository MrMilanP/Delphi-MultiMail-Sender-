unit USMTPth;

interface


uses
   SysUtils, Classes, Windows , Forms, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
   IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler,
   IdIOHandlerSocket, IdSSL, IdIOHandlerStack, IdMessage, IdSSLOpenSSL,
   IdSASLLogin,
   IdSASL_CRAM_SHA1, IdSASL, IdSASLUserPass, IdSASL_CRAMBase, IdSASL_CRAM_MD5,
   IdSASLSKey, IdSASLPlain, IdSASLOTP, IdSASLExternal, IdSASLDigest, IdText,
   IdSASLAnonymous, IdUserPassProvider, IdAttachment, IdAttachmentFile,
   dprocess,  MyStrUtils;

const
   SMTP_PORT_EXPLICIT_TLS = 587;

type
   TMimeType = record
      _type:      string;
      _extension: string;
   end;

type
   TMimeTypes = array of TMimeType;
   //Structure of Thread for sending mail
type
   TEmailThread = class(TThread)
   private
      IdMessage: TIdMessage;
      SMTP:      TIdSMTP;//main Indy SMTP component for  sending mail, exist in thread

      FedBody:   TStrings;
      FedAttachemts:   TStrings;
      FedMimeTypes: TStrings;
      //EedAttachment: string;
      //FedMimeType: string;
      FedSMTPPort: integer;
      FedToEmail: string;
      FedSubject: string;
      FedSMTPServer: string;
      FedCCEmail: string;
      FedPassword: string;
      FedBCCEmail: string;
      FedSenderName: string;
      FedUserName: string;
      FedPriority: TIdMessagePriority;
      FedSenderEmail: string;
      FedSSLConnection: boolean;
      FFileName: string;
      //FHost:     string;
      //FPassword: string;
      //FUsername: string;

      procedure SetBody(const Value: TStrings);
      procedure SetAttachemts(const Value: TStrings);
       procedure SetMimeTypes(const Value: TStrings);

      procedure Init;
      procedure InitMailMessage;
      procedure InitSASL;
      procedure AddSSLHandler;
      //...
   protected
      procedure Execute; override;
   public
      Excep: string;
      constructor Create(const ASMTPServer: string; const ASMTPPort: integer;
         const AUserName, APassword: string); overload;

      property edBCCEmail: string Read FedBCCEmail Write FedBCCEmail;
      property edBody: TStrings Read FedBody Write SetBody;
      property edAttachments: TStrings Read FedAttachemts Write SetAttachemts;
      property edCCEmail: string Read FedCCEmail Write FedCCEmail;
      property edPassword: string Read FedPassword Write FedPassword;
      property edPriority: TIdMessagePriority Read FedPriority Write FedPriority;
      property edSenderEmail: string Read FedSenderEmail Write FedSenderEmail;
      property edSenderName: string Read FedSenderName Write FedSenderName;
      property edSMTPServer: string Read FedSMTPServer Write FedSMTPServer;
      property edSMTPPort: integer Read FedSMTPPort Write FedSMTPPort;
      property edSSLConnection: boolean Read FedSSLConnection Write FedSSLConnection;
      property edToEmail: string Read FedToEmail Write FedToEmail;
      property edUserName: string Read FedUserName Write FedUserName;
      property edSubject: string Read FedSubject Write FedSubject;
      //property edAttachment: string Read EedAttachment Write EedAttachment;
      property edMimeTypes: TStrings Read FedMimeTypes Write SetMimeTypes;
   end;
   //Structure of object who call thread and pass them parameters

type
   TSentMessage_On = procedure(msg : string) of object;
   TSSLEmail = class(TObject)
   private
      FedBody:        TStrings;
      FedSMTPPort:    integer;
      FedToEmail:     string;
      FedSubject:     string;
      FedSMTPServer:  string;
      FedCCEmail:     string;
      FedPassword:    string;
      FedBCCEmail:    string;
      FedSenderName:  string;
      FedUserName:    string;
      FedSenderEmail: string;
      FedAttachemts:   TStrings;
      FedMimeTypes: TStrings;
      //FedMimeType: string;
      FSentMessage_On: TSentMessage_On;

      procedure SetBody(const Value: TStrings);
      procedure SetAttachemts(const Value: TStrings);
      procedure SetMimeTypes(const Value: TStrings);
    //function EedAttachment: string;
   public
      constructor Create(num: integer); overload;
      destructor Free;
      procedure SendAMail();
      procedure ThredDone(ASender: TObject);
      property edBCCEmail: string Read FedBCCEmail Write FedBCCEmail;
      property edBody: TStrings Read FedBody Write SetBody;
      property edCCEmail: string Read FedCCEmail Write FedCCEmail;
      property edPassword: string Read FedPassword Write FedPassword;
      property edSenderEmail: string Read FedSenderEmail Write FedSenderEmail;
      property edSenderName: string Read FedSenderName Write FedSenderName;
      property edSMTPServer: string Read FedSMTPServer Write FedSMTPServer;
      property edSMTPPort: integer Read FedSMTPPort Write FedSMTPPort;

      property edToEmail: string Read FedToEmail Write FedToEmail;
      property edUserName: string Read FedUserName Write FedUserName;
      property edSubject: string Read FedSubject Write FedSubject;
      property edAttachments: TStrings Read FedAttachemts Write SetAttachemts;
      property edMimeTypes: TStrings Read FedMimeTypes Write SetMimeTypes;
      property onSentMessage: TSentMessage_On read FSentMessage_On write FSentMessage_On;
   end;


function getMimeType(FName: string): string;
procedure initMimeTypes();

var
   MimeTypes: TMimeTypes;

implementation
//we must know mime type of attachemt, so we use mime.txt
procedure initMimeTypes();
var
   SL: TStringList;
   I:  integer;
   line, _type_, _extension_: string;
begin

   SL := TStringList.Create;
   try
      Sl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'mime.txt');
      for I := 0 to SL.Count - 1 do
      begin
         if Copy(Trim(SL[I]), 1, 1) <> '#' then
         begin
            line := StringReplace(SL[i], #9, ' ', [rfReplaceAll]);
            if ScanFormat(trim(line), '%s %s', [@_type_, @_extension_]) = 2 then
            begin
               SetLength(MimeTypes, Length(MimeTypes) + 1);
               with MimeTypes[Length(MimeTypes) - 1] do
               begin
                  _type := _type_;
                  _extension := '.' + _extension_;
               end;
            end;
         end;
      end;
   finally
      SL.Free;
   end;
end;
//this function return mime type
function getMimeType(FName: string): string;
var
   ext: string;
   I: integer;
begin
   Result := '';
   ext := ExtractFileExt(FName);
   for I := Low(MimeTypes) to High(MimeTypes) do
   begin
      if ext = MimeTypes[I]._extension then
      begin
         Result := MimeTypes[I]._type;
      end;
   end;

end;

//Initilaztion of mail message
procedure TEmailThread.InitMailMessage;
var
   //Attachment: TIdAttachmentfile;
   I : Integer;
begin
   Randomize;
   IdMessage.Sender.Text := FedSenderEMail;
   IdMessage.From.Name := FedSenderName;
   IdMessage.From.Address := FedSenderEMail;
   IdMessage.ReplyTo.EMailAddresses := FedSenderEmail;
   IdMessage.Recipients.EMailAddresses := FedToEmail;
   IdMessage.Subject  := FedSubject;
   IdMessage.Priority := FedPriority;
   IdMessage.CCList.EMailAddresses := FedCCEMail;
   IdMessage.ReceiptRecipient.Text := '';
   IdMessage.BccList.EMailAddresses := FedBCCEMail;
   IdMessage.IsEncoded := True;
   IdMessage.Encoding := meMIME;
   //if have not attachemt we send message in main body
   if edAttachments.Count = 0 then
   begin
      IdMessage.ContentType := 'text/html';
      IdMessage.Charset := 'UTF-8';
      IdMessage.Body.Text := FedBody.Text;
   end
   //or make multipart, where is body one part, but will be corect displayed in mail client
   else
   begin
      for I := 0 to edAttachments.Count - 1 do
      begin
      with TIdText.Create(IdMessage.MessageParts, nil) do
      begin
         Body.Text := edBody.Text;
         CharSet :=  'UTF-8';
         ContentType := 'text/html';
      end;
      begin
         //we add attachemt
         with TIdAttachmentFile.Create(IdMessage.MessageParts, edAttachments[I]) do
         begin
            ContentID := IntToStr(Random(1000000));
            ContentType := edMimeTypes[I];// must be mime type or mail not correct displayed
            FileName  := ExtractFileName(edAttachments[I]);
         end;
      end;
      end;
      IdMessage.ContentType := 'multipart/related; type="text/html"'; //we says - it's message  multipart
   end;




end;

procedure TEmailThread.AddSSLHandler;
var
   SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
   SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(SMTP);
   // SSL/TLS handshake determines the highest available SSL/TLS version dynamically
   SSLHandler.SSLOptions.Method := sslvSSLv23;
   SSLHandler.SSLOptions.Mode := sslmClient;
   SSLHandler.SSLOptions.VerifyMode := [];
   SSLHandler.SSLOptions.VerifyDepth := 0;
   SMTP.IOHandler := SSLHandler;
end;

//Thread Constructor  where we pass some parameters
constructor TEmailThread.Create(const ASMTPServer: string;
   const ASMTPPort: integer; const AUserName, APassword: string);
begin
   inherited Create(True);

   edSMTPServer := ASMTPServer;
   edSMTPPort := ASMTPPort;
   edUserName := AUserName;
   edPassword := APassword;

   Init;

   FedBody := TStringList.Create;
   FedAttachemts := TStringList.Create;
   FedMimeTypes := TStringList.Create;

   FreeOnTerminate := True;

end;

procedure TEmailThread.Init;
begin
   FedSSLConnection := True;
   FedPriority := TIdMessagePriority.mpNormal;
end;


//Thread send mail
procedure TEmailThread.Execute;
begin
   //We initalize exception with empty string
   Excep := '';
   IdMessage := TIdMessage.Create(nil);
   try
      InitMailMessage;

      SMTP := TIdSMTP.Create;
      try
         if FedSSLConnection then
         begin
            AddSSLHandler;

            if FedSMTPPort = SMTP_PORT_EXPLICIT_TLS then
               SMTP.UseTLS := utUseExplicitTLS
            else
               SMTP.UseTLS := utUseImplicitTLS;
         end;
         //
         if (FedUserName <> '') or (FedPassword <> '') then
         begin
            //Simple Authentication and Security Layer
            SMTP.AuthType := satSASL;
            InitSASL;
         end
         else
         begin
            SMTP.AuthType := satNone;
         end;
         //we set server
         SMTP.Host := FedSMTPServer;
         //port
         SMTP.Port := FedSMTPPort;
         //connection timeout in ms
         SMTP.ConnectTimeout := 10000;
         SMTP.UseEHLO := True;

         try
            SMTP.Connect;

            try
               try
                  SMTP.Send(IdMessage);
               except
                  //Exception with sending mail
                  on E: Exception do
                     Excep := ' Sending ERROR: ' + E.Message;
               end;
            finally
               SMTP.Disconnect;
            end;
         except
            //Exception with connection
            on E: Exception do
               Excep := ' Sending ERROR: ' + E.Message;
         end;
      finally
         SMTP.Free;
      end;
   finally
      IdMessage.Free;
   end;
end;


//Thread assign body string list
procedure TEmailThread.SetAttachemts(const Value: TStrings);
begin
   FedAttachemts.Assign(Value);
end;

procedure TEmailThread.SetBody(const Value: TStrings);
begin
   FedBody.Assign(Value);
end;



procedure TEmailThread.SetMimeTypes(const Value: TStrings);
begin
  FedMimeTypes.Assign(value);
end;

//Main point where we create  TSSLEmail object
constructor TSSLEmail.Create(num: integer);
begin
   Create;
   //we pass parameters from main window
   FedBody := TStringList.Create;
   FedAttachemts := TStringList.Create;
   FedMimeTypes := TStringList.Create;
   //edSMTPServer := ASMTPServer;
   //edSMTPPort := ASMTPPort;
   //edUserName := AUserName;
   //edPassword := APassword;
end;

//function TSSLEmail.EedAttachment: string;
//begin
//
//end;

destructor TSSLEmail.Free;
begin
   //before destroy Object of TSSLEmail, we must free string list - FedBody
   FedBody.Free;
   FedAttachemts.Free;
   FedMimeTypes.Free;
end;

//we notice here did have any error in sending mail
procedure TSSLEmail.ThredDone(ASender: TObject);
var
   P: TEmailThread;
begin
   if Assigned(FSentMessage_On) then
     onSentMessage(TEmailThread(ASender).Excep);
end;

//method which be called from main window for sending mail, but inside will be created thread for sending
procedure TSSLEmail.SendAMail();
var
   th: TEmailThread;
begin
   //we create susspended thread because we need pass some parameters;
   th := TEmailThread.Create(edSMTPServer, edSMTPPort, edUserName, edPassword);

   th.edSenderName := edSenderName;
   th.edSenderEmail := edSenderEmail;
   th.edToEmail := edToEmail;
   th.edSubject := edSubject;
   th.edBody := edBody;
   th.edAttachments := edAttachments;
   th.edMimeTypes := edMimeTypes;

   th.FreeOnTerminate := True;
   th.OnTerminate := ThredDone; //we through this event know did is email sent
   //when we done with parameters, we resume thread
   th.Resume;
end;

procedure TSSLEmail.SetAttachemts(const Value: TStrings);
begin
       FedAttachemts.Assign(Value);
end;

procedure TSSLEmail.SetBody(const Value: TStrings);
begin
   FedBody.Assign(Value);
end;


procedure TSSLEmail.SetMimeTypes(const Value: TStrings);
begin
     FedMimeTypes.Assign(Value);
end;

//Initalize SASL for Indy SMTP componet
procedure TEmailThread.InitSASL;
var
   IdUserPassProvider: TIdUserPassProvider;
   IdSASLCRAMMD5: TIdSASLCRAMMD5;
   IdSASLCRAMSHA1: TIdSASLCRAMSHA1;
   IdSASLPlain: TIdSASLPlain;
   IdSASLLogin: TIdSASLLogin;
   IdSASLSKey: TIdSASLSKey;
   IdSASLOTP: TIdSASLOTP;
   IdSASLAnonymous: TIdSASLAnonymous;
   IdSASLExternal: TIdSASLExternal;
begin
   IdUserPassProvider := TIdUserPassProvider.Create(SMTP);
   IdUserPassProvider.Username := FedUserName;
   IdUserPassProvider.Password := FedPassword;

   IdSASLCRAMSHA1 := TIdSASLCRAMSHA1.Create(SMTP);
   IdSASLCRAMSHA1.UserPassProvider := IdUserPassProvider;
   IdSASLCRAMMD5 := TIdSASLCRAMMD5.Create(SMTP);
   IdSASLCRAMMD5.UserPassProvider := IdUserPassProvider;
   IdSASLSKey := TIdSASLSKey.Create(SMTP);
   IdSASLSKey.UserPassProvider := IdUserPassProvider;
   IdSASLOTP  := TIdSASLOTP.Create(SMTP);
   IdSASLOTP.UserPassProvider := IdUserPassProvider;
   IdSASLAnonymous := TIdSASLAnonymous.Create(SMTP);
   IdSASLExternal := TIdSASLExternal.Create(SMTP);
   IdSASLLogin := TIdSASLLogin.Create(SMTP);
   IdSASLLogin.UserPassProvider := IdUserPassProvider;
   IdSASLPlain := TIdSASLPlain.Create(SMTP);
   IdSASLPlain.UserPassProvider := IdUserPassProvider;

   SMTP.SASLMechanisms.Add.SASL := IdSASLCRAMSHA1;
   SMTP.SASLMechanisms.Add.SASL := IdSASLCRAMMD5;
   SMTP.SASLMechanisms.Add.SASL := IdSASLSKey;
   SMTP.SASLMechanisms.Add.SASL := IdSASLOTP;
   SMTP.SASLMechanisms.Add.SASL := IdSASLAnonymous;
   SMTP.SASLMechanisms.Add.SASL := IdSASLExternal;
   SMTP.SASLMechanisms.Add.SASL := IdSASLLogin;
   SMTP.SASLMechanisms.Add.SASL := IdSASLPlain;
end;

end.

