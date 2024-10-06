program MultiMailSender;

uses
  Vcl.Forms,
  U_MultiMail in 'U_MultiMail.pas' {F_MultiMail} ,
  U_Statistics in 'U_Statistics.pas' {F_Statistics} ,
  U_HTML_Editor in 'U_HTML_Editor.pas' {F_HTML_Editor} ,
  U_Name in 'U_Name.pas' {F_Name} ,
  U_Sender in 'U_Sender.pas' {F_Sender} ,
  U_Subject in 'U_Subject.pas' {F_Subject} ,
  U_ListMail in 'U_ListMail.pas' {F_ListMail} ,
  U_ListSMTP in 'U_ListSMTP.pas' {F_ListSMTP} ,
  U_Attach in 'U_Attach.pas' {F_Attach} ,
  remain in 'remain.pas',
  PluginManager in 'PluginAPI\Core\PluginManager.pas',
  PluginAPI in 'PluginAPI\Headers\PluginAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_MultiMail, F_MultiMail);
  Application.CreateForm(TF_Statistics, F_Statistics);
  Application.CreateForm(TF_HTML_Editor, F_HTML_Editor);
  Application.CreateForm(TF_Name, F_Name);
  Application.CreateForm(TF_Sender, F_Sender);
  Application.CreateForm(TF_Subject, F_Subject);
  Application.CreateForm(TF_ListMail, F_ListMail);
  Application.CreateForm(TF_ListSMTP, F_ListSMTP);
  Application.CreateForm(TF_Attach, F_Attach);
  Application.Run;

end.
