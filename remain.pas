unit remain;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, ClipBrd,
  ToolWin, ActnList, ImgList, PluginAPI, System.Actions, System.ImageList, JvRgbToHtml,
  JvRichEditToHtml;

type
  TF_RichEdit = class(TForm, IEditor, IMenuManager)
    MainMenu: TMainMenu;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FilePrintItem: TMenuItem;
    FileExitItem: TMenuItem;
    EditUndoItem: TMenuItem;
    EditCutItem: TMenuItem;
    EditCopyItem: TMenuItem;
    EditPasteItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    Ruler: TPanel;
    FontDialog1: TFontDialog;
    FirstInd: TLabel;
    LeftInd: TLabel;
    RulerLine: TBevel;
    RightInd: TLabel;
    N5: TMenuItem;
    miEditFont: TMenuItem;
    Editor: TRichEdit;
    StandardToolBar: TToolBar;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    PrintButton: TToolButton;
    ToolButton5: TToolButton;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    FontSize: TEdit;
    ToolButton11: TToolButton;
    UpDown1: TUpDown;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    ToolbarImages: TImageList;
    ActionList1: TActionList;
    FileNewCmd: TAction;
    FileOpenCmd: TAction;
    FileSaveCmd: TAction;
    FilePrintCmd: TAction;
    FileExitCmd: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Bevel1: TBevel;
    LanguageMenu: TMenuItem;
    LanguageEnglish: TMenuItem;
    LanguageGerman: TMenuItem;
    EditCutCmd: TAction;
    EditCopyCmd: TAction;
    EditPasteCmd: TAction;
    EditUndoCmd: TAction;
    EditFontCmd: TAction;
    FileSaveAsCmd: TAction;
    LanguageFrench: TMenuItem;
    miPlugins: TMenuItem;
    ColorBox1: TColorBox;
    Label1: TLabel;
    ColorBox2: TColorBox;
    Label2: TLabel;
    Timer1: TTimer;

    procedure SelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FileNew(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrint(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure EditUndo(Sender: TObject);
    procedure EditCut(Sender: TObject);
    procedure EditCopy(Sender: TObject);
    procedure EditPaste(Sender: TObject);
    procedure HelpAbout(Sender: TObject);
    procedure SelectFont(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RulerItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RulerItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure RichEditChange(Sender: TObject);
    procedure SwitchLanguage(Sender: TObject);
    procedure ActionList2Update(Action: TBasicAction; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure EditorExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FParentName: string;
    FFileName: string;
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    // FMemo : Tmemo;
    function CurrText: TTextAttributes;
    procedure GetFontNames;
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure SetupRuler;
    procedure SetEditRect;
    procedure UpdateCursorPos;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);

    procedure BuildFilterList;
    function FindPlugin(const AIndex: Integer; const AGUID: TGUID; out Obj): Boolean;
  protected
    // IMenuManager
    function CreateMenuItem: IMenuItem; safecall;
    procedure DeleteMenuItem(var AItem: IMenuItem); safecall;
    // IEditor
    function GetText: WideString; safecall;
    procedure SetText(const AValue: WideString); safecall;
    function GetSelText: WideString; safecall;
    procedure SetSelText(const AValue: WideString); safecall;
    function GetSelStart: Integer; safecall;
    procedure SetSelStart(const AValue: Integer); safecall;
    function GetSelLength: Integer; safecall;
    procedure SetSelLength(const AValue: Integer); safecall;
    function GetModified: BOOL; safecall;
    function GetCanUndo: BOOL; safecall;
    function GetCaretPos: TPoint; safecall;
    procedure SetCaretPos(const AValue: TPoint); safecall;
    procedure SelectAll; safecall;
    procedure Undo; safecall;
    procedure ClearUndo; safecall;
    procedure Clear; safecall;
    procedure ClearSelection; safecall;
    procedure CopyToClipboard; safecall;
    procedure CutToClipboard; safecall;
    procedure PasteFromClipboard; safecall;
    function FindText(const SearchStr: WideString; const StartPos, Length: Integer; Options: TEditorSearchTypes)
       : Integer; safecall;
  public
    procedure PopulateMemo(Memo: TMemo);
    function GetParentName: string;
    procedure SetParentName(name: string);
  end;

implementation

uses REAbout, RichEdit, ShellAPI, ReInit, ActiveX, PluginManager, U_HTML_Editor, U_MultiMail;



// __ Plugins _________________________________________________________________________

type
  // Для старых версий Delphi, для новых это можно удалить:
  IInterfaceComponentReference = interface
    ['{41D23E9C-0974-4ED4-BBE8-4375D65E1129}']
    function GetComponent: TObject;
  end;

  TPluginMenuItem = class(TMenuItem, IUnknown, IInterfaceComponentReference, IMenuItem)
  private
    FClickHandler: INotifyEvent;
  protected
    // IInterfaceComponentReference (можно удалить для новых Delphi)
    function GetComponent: TObject;
    // IMenuItem
    function GetCaption: WideString; safecall;
    function GetChecked: BOOL; safecall;
    function GetEnabled: BOOL; safecall;
    function GetHint: WideString; safecall;
    procedure SetCaption(const AValue: WideString); safecall;
    procedure SetChecked(const AValue: BOOL); safecall;
    procedure SetEnabled(const AValue: BOOL); safecall;
    procedure SetHint(const AValue: WideString); safecall;
    procedure RegisterExecuteHandler(const AEventHandler: INotifyEvent); safecall;
  public

    procedure Click; override;
  end;

  { TPluginMenuItem }

procedure TPluginMenuItem.Click;
begin
  inherited; // вызываем стандартную обработку

  // Вызываем плагин
  if Enabled and Assigned(FClickHandler) then
    FClickHandler.Execute(Self);
end;

function TPluginMenuItem.GetCaption: WideString;
begin
  Result := Caption;
end;

function TPluginMenuItem.GetChecked: BOOL;
begin
  Result := Checked;
end;

function TPluginMenuItem.GetComponent: TObject;
begin
  Result := Self;
end;

function TPluginMenuItem.GetEnabled: BOOL;
begin
  Result := Enabled;
end;

function TPluginMenuItem.GetHint: WideString;
begin
  Result := Hint;
end;

procedure PopulateMemo(Memo: TMemo);
begin

end;

procedure TPluginMenuItem.SetCaption(const AValue: WideString);
begin
  Caption := AValue;
end;

procedure TPluginMenuItem.SetChecked(const AValue: BOOL);
begin
  Checked := AValue;
end;

procedure TPluginMenuItem.SetEnabled(const AValue: BOOL);
begin
  Enabled := AValue;
end;

procedure TPluginMenuItem.SetHint(const AValue: WideString);
begin
  Hint := AValue;
end;

procedure TPluginMenuItem.RegisterExecuteHandler(const AEventHandler: INotifyEvent);
begin
  FClickHandler := AEventHandler;
end;

// ____________________________________________________________________________________

resourcestring
  sSaveChanges = 'Save changes to %s?';
  sOverWrite = 'OK to overwrite %s';
  sUntitled = 'Untitled';
  sModified = 'Modified';
  sColRowInfo = 'Line: %3d   Col: %3d';

const
  RulerAdj = 4 / 3;
  GutterWid = 6;

  ENGLISH = (SUBLANG_ENGLISH_US shl 10) or LANG_ENGLISH;
  FRENCH = (SUBLANG_FRENCH shl 10) or LANG_FRENCH;
  GERMAN = (SUBLANG_GERMAN shl 10) or LANG_GERMAN;

{$R *.dfm}

procedure SetWordBackGroundColor(RichEdit: TRichEdit; aWord: String; AColor: TColor);
var
  Format: CHARFORMAT2;
  Index: Integer;
  Len: Integer;
begin
  FillChar(Format, SizeOf(Format), 0);
  Format.cbSize := SizeOf(Format);
  Format.dwMask := CFM_BACKCOLOR;
  Format.crBackColor := AColor;

  Index := 0;
  Len := Length(RichEdit.Lines.Text);
  Index := RichEdit.FindText(aWord, Index, Len, []);

  while Index <> -1 do
  begin
    RichEdit.SelStart := Index;
    RichEdit.SelLength := Length(aWord);
    RichEdit.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@Format));
    Index := RichEdit.FindText(aWord, Index + Length(aWord), Len, []);
  end;
end;

procedure TF_RichEdit.SelectionChange(Sender: TObject);
begin
  with Editor.Paragraph do
    try
      FUpdating := True;
      FirstInd.Left := Trunc(FirstIndent * RulerAdj) - 4 + GutterWid;
      LeftInd.Left := Trunc((LeftIndent + FirstIndent) * RulerAdj) - 4 + GutterWid;
      RightInd.Left := Ruler.ClientWidth - 6 - Trunc((RightIndent + GutterWid) * RulerAdj);
      BoldButton.Down := fsBold in Editor.SelAttributes.Style;
      ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
      UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
      BulletsButton.Down := Boolean(Numbering);
      FontSize.Text := IntToStr(Editor.SelAttributes.Size);
      FontName.Text := Editor.SelAttributes.name;
      case Ord(Alignment) of
        0:
          begin
            LeftAlign.Down := True;
            RightAlign.Down := False;
            CenterAlign.Down := False;
          end;
        1:
          begin
            RightAlign.Down := True;
            LeftAlign.Down := False;
            CenterAlign.Down := False;
          end;
        2:
          begin
            CenterAlign.Down := True;
            RightAlign.Down := False;
            LeftAlign.Down := False;
          end;
      end;
      UpdateCursorPos;
    finally
      FUpdating := False;
    end;
end;

function TF_RichEdit.CurrText: TTextAttributes;
begin
  if Editor.SelLength > 0 then
    Result := Editor.SelAttributes
  else
    Result := Editor.DefAttributes;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: Integer; Data: Pointer)
   : Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TF_RichEdit.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TF_RichEdit.SetFileName(const FileName: String);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

procedure TF_RichEdit.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not Editor.Modified then
    Exit;
  SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]), mtConfirmation, mbYesNoCancel, 0);
  case SaveResp of
    idYes:
      FileSave(Self);
    idNo: { Nothing }
      ;
    idCancel:
      Abort;
  end;
end;

function TF_RichEdit.CreateMenuItem: IMenuItem;
var
  MI: TPluginMenuItem;
begin
  MI := TPluginMenuItem.Create(miPlugins);
  Result := MI;
  miPlugins.Add(MI);

  miPlugins.Visible := True;
end;

procedure TF_RichEdit.DeleteMenuItem(var AItem: IMenuItem);

  function GetComponent(var AItem: IMenuItem): TPluginMenuItem;
  var
    Internal: IInterfaceComponentReference;
  begin
    if not Supports(AItem, IInterfaceComponentReference, Internal) then
      Assert(False);
    Result := Internal.GetComponent as TPluginMenuItem;
    Internal := nil;
    AItem := nil;
  end;

begin
  GetComponent(AItem).Free;

  miPlugins.Visible := (miPlugins.Count > 0);
end;

function TF_RichEdit.GetText: WideString;
begin
  Result := Editor.Text;
end;

procedure TF_RichEdit.SetText(const AValue: WideString);
begin
  Editor.Text := AValue;
end;

function TF_RichEdit.GetSelText: WideString;
begin
  Result := Editor.SelText;
end;

procedure TF_RichEdit.SetSelText(const AValue: WideString);
begin
  Editor.SelText := AValue;
end;

function TF_RichEdit.GetSelStart: Integer;
begin
  Result := Editor.SelStart;
end;

procedure TF_RichEdit.SetSelStart(const AValue: Integer);
begin
  Editor.SelStart := AValue;
end;

function TF_RichEdit.GetSelLength: Integer;
begin
  Result := Editor.SelLength;
end;

procedure TF_RichEdit.SetSelLength(const AValue: Integer);
begin
  Editor.SelLength := AValue;
end;

function TF_RichEdit.GetModified: BOOL;
begin
  Result := Editor.Modified;
end;

function TF_RichEdit.GetParentName: string;
begin

end;

function TF_RichEdit.GetCanUndo: BOOL;
begin
  Result := Editor.CanUndo;
end;

function TF_RichEdit.GetCaretPos: TPoint;
begin
  Result := Editor.CaretPos;
end;

procedure TF_RichEdit.SetCaretPos(const AValue: TPoint);
begin
  Editor.CaretPos := AValue;
end;

procedure TF_RichEdit.SelectAll;
begin
  Editor.SelectAll;
end;

procedure TF_RichEdit.Undo;
begin
  Editor.Undo;
end;

procedure TF_RichEdit.ClearUndo;
begin
  Editor.ClearUndo;
end;

procedure TF_RichEdit.Clear;
begin
  Editor.Clear;
end;

procedure TF_RichEdit.ClearSelection;
begin
  Editor.ClearSelection;
end;

procedure TF_RichEdit.ColorBox1Change(Sender: TObject);
var
  rAttrib: TTextAttributes;
begin
  Editor.SelAttributes.Color := ColorBox1.Selected;
  // Editor.SelAttributes.Size := StrToInt(FontSize.Text);
  // Editor.SelAttributes.Style := [fsBold,fsItalic]; //Change the font style.
  // Editor.SelAttributes.Name := FontName.Text;
end;

procedure TF_RichEdit.ColorBox2Change(Sender: TObject);
begin
  Editor.Color := ColorBox2.Selected;
end;

procedure TF_RichEdit.CopyToClipboard;
begin
  Editor.CopyToClipboard;
end;

procedure TF_RichEdit.CutToClipboard;
begin
  Editor.CutToClipboard;
end;

procedure TF_RichEdit.PasteFromClipboard;
begin
  Editor.PasteFromClipboard;
end;

function TF_RichEdit.FindText(const SearchStr: WideString; const StartPos, Length: Integer;
   Options: TEditorSearchTypes): Integer;
var
  Opts: TSearchTypes;
begin
  Opts := [];
  if (Options and esfWholeWord) <> 0 then
    Include(Opts, stWholeWord);
  if (Options and esfMatchCase) <> 0 then
    Include(Opts, stMatchCase);
  Result := Editor.FindText(SearchStr, StartPos, Length, Opts);
end;

procedure TF_RichEdit.SetupRuler;
var
  I: Integer;
  S: String;
begin
  SetLength(S, 201);
  I := 1;
  while I < 200 do
  begin
    S[I] := #9;
    S[I + 1] := '|';
    Inc(I, 2);
  end;
  Ruler.Caption := S;
end;

procedure TF_RichEdit.SetEditRect;
var
  R: TRect;
begin
  with Editor do
  begin
    R := Rect(GutterWid, 0, ClientWidth - GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

{ Event Handlers }

procedure RE_AlignText1(ARichEdit: TRichEdit; Alignment: TAlignment);
begin
  ARichEdit.Paragraph.Alignment := Alignment;
end;

// Using PARAFORMAT2; nonVCL
procedure RE_AlignText2(ARichEdit: TRichEdit; Alignment: TAlignment);
var
  pf2: PARAFORMAT2;
begin
  FillChar(pf2, SizeOf(pf2), 0);
  pf2.cbSize := SizeOf(PARAFORMAT2);
  SendMessage(ARichEdit.Handle, EM_GETPARAFORMAT, 0, Longint(@pf2));
  pf2.dwMask := PFM_ALIGNMENT;
  case Alignment of
    taLeftJustify:
      pf2.wAlignment := PFA_LEFT;
    taCenter:
      pf2.wAlignment := PFA_CENTER;
    taRightJustify:
      pf2.wAlignment := PFA_RIGHT;
  end;
  SendMessage(ARichEdit.Handle, EM_SETPARAFORMAT, 0, Longint(@pf2));
end;

procedure TF_RichEdit.FormCreate(Sender: TObject);
begin
  SetErrorMode(SetErrorMode(0) or SEM_NOOPENFILEERRORBOX or SEM_FAILCRITICALERRORS);
  Plugins.SetVersion(1);
  Plugins.RegisterServiceProvider(Self);
  // Загрузка всех плагинов. Подразумевается, что они лежат в под-папке Plugins
  Plugins.LoadPlugins(ExtractFilePath(ParamStr(0)) + 'Plugins', SPluginExt);
  BuildFilterList;

  Application.OnHint := ShowHint;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  SetFileName(sUntitled);
  GetFontNames;
  SetupRuler;
  SelectionChange(Self);

  CurrText.name := DefFontData.name;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  LanguageEnglish.Tag := ENGLISH;
  LanguageFrench.Tag := FRENCH;
  LanguageGerman.Tag := GERMAN;
  case SysLocale.DefaultLCID of
    ENGLISH:
      SwitchLanguage(LanguageEnglish);
    FRENCH:
      SwitchLanguage(LanguageFrench);
    GERMAN:
      SwitchLanguage(LanguageGerman);
  end;

  RE_AlignText2(Editor, taCenter);

  // editor.Paragraph.Alignment := taLeftJustify;
  // editor.Lines.Add('This line is left justified.');
  // editor.Paragraph.Alignment := taCenter;
  // editor.Lines.Add('This line is centered.');
  // editor.Paragraph.Alignment := taRightJustify;
  // editor.Lines.Add('This line is right justified');
end;

procedure TF_RichEdit.FormDestroy(Sender: TObject);
begin
  Plugins.UnloadAll;
end;

procedure TF_RichEdit.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    // StatusBar.SimplePanel := True;
    // StatusBar.SimpleText := Application.Hint;
  end
  else // StatusBar.SimplePanel := False;
end;

procedure TF_RichEdit.FileNew(Sender: TObject);
begin
  SetFileName(sUntitled);
  Editor.Lines.Clear;
  Editor.Modified := False;
  SetModified(False);
end;

procedure TF_RichEdit.PerformFileOpen(const AFileName: string);
begin
  Editor.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Editor.SetFocus;
  Editor.Modified := False;
  SetModified(False);
end;

procedure TF_RichEdit.PopulateMemo(Memo: TMemo);
begin
  RichEditToHtml.ConvertToHtmlStrings(Editor, Memo.Lines);

  Memo.Lines.Text := StringReplace(Memo.Lines.Text, '<BODY>', '<BODY bgcolor="#' + RgbToHtml(Editor.Color) + '">', []);
end;

procedure TF_RichEdit.FileOpen(Sender: TObject);
var
  Stream: TStream;
  RTFStream: IStream;
  Plugin: IImportPlugin;
begin
  CheckFileSave;
  SetFileName(sUntitled);
  if OpenDialog.Execute then
  begin
    // Импорт
    Stream := TMemoryStream.Create;
    RTFStream := TStreamAdapter.Create(Stream, soOwned);
    if not FindPlugin(OpenDialog.FilterIndex - 1, IImportPlugin, Plugin) then
      Exit;
    Plugin.ImportRTF(OpenDialog.FileName, RTFStream);

    // Обработка данных импорта
    Stream.Position := 0;
    Editor.Lines.LoadFromStream(Stream);

    // Учёт
    Editor.SetFocus;
    Editor.Modified := False;
    SetModified(False);
    Editor.ReadOnly := ofReadOnly in OpenDialog.Options;
  end;
end;

procedure TF_RichEdit.FileSave(Sender: TObject);
var
  Plugin: IExportPlugin;
  RTFStream: IStream;
  Stream: TStream;
begin
  if FFileName = sUntitled then
    FileSaveAs(Sender)
  else
  begin
    // Ищем плагин
    if not FindPlugin(SaveDialog.FilterIndex - 1, IExportPlugin, Plugin) then
      Exit;

    // Вызываем экспорт
    Stream := TMemoryStream.Create;
    RTFStream := TStreamAdapter.Create(Stream, soOwned);
    Editor.Lines.SaveToStream(Stream);
    Stream.Position := 0;
    Plugin.ExportRTF(RTFStream, FFileName);

    Editor.Modified := False;
    SetModified(False);
  end;
end;

procedure TF_RichEdit.FileSaveAs(Sender: TObject);
var
  Plugin: IExportPlugin;
  RTFStream: IStream;
  Stream: TStream;
begin
  if SaveDialog.Execute then
  begin
    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(sOverWrite, [SaveDialog.FileName]), mtConfirmation, mbYesNoCancel, 0) <> idYes then
        Exit;

    // Ищем плагин
    if not FindPlugin(SaveDialog.FilterIndex - 1 { у FilterIndex отсчёт с 1, корректируем } , IExportPlugin, Plugin)
    then
      Exit;

    // Вызываем экспорт
    Stream := TMemoryStream.Create;
    RTFStream := TStreamAdapter.Create(Stream, soOwned);
    Editor.Lines.SaveToStream(Stream);
    Stream.Position := 0;
    Plugin.ExportRTF(RTFStream, SaveDialog.FileName);

    // учёт
    SetFileName(SaveDialog.FileName);
    Editor.Modified := False;
    SetModified(False);
  end;
end;

function TF_RichEdit.FindPlugin(const AIndex: Integer; const AGUID: TGUID; out Obj): Boolean;
var
  X: Integer;
begin
  Result := False;
  for X := 0 to Plugins.Count - 1 do
    if Plugins[X].FilterIndex = AIndex then
    begin
      Result := Supports(Plugins[X], AGUID, Obj);
      if Result then
        Break;
    end;
end;

procedure TF_RichEdit.FilePrint(Sender: TObject);
begin
  if PrintDialog.Execute then
    Editor.Print(FFileName);
end;

procedure TF_RichEdit.FileExit(Sender: TObject);
begin
  Close;
end;

procedure TF_RichEdit.EditUndo(Sender: TObject);
begin
  with Editor do
    if HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TF_RichEdit.EditCut(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TF_RichEdit.EditorExit(Sender: TObject);
begin
  // ShowMessage('ecit');
  Timer1.Enabled := True;
end;

procedure TF_RichEdit.EditCopy(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TF_RichEdit.EditPaste(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TF_RichEdit.HelpAbout(Sender: TObject);
begin
  with TAboutBox.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TF_RichEdit.SelectFont(Sender: TObject);
begin
  FontDialog1.Font.Assign(Editor.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  SelectionChange(Self);
  Editor.SetFocus;
end;

procedure TF_RichEdit.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.ClientWidth - (RulerLine.Left * 2);
end;

procedure TF_RichEdit.FormResize(Sender: TObject);
begin
  SetEditRect;
  SelectionChange(Sender);
end;

procedure TF_RichEdit.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;

procedure TF_RichEdit.BoldButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TF_RichEdit.ItalicButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TF_RichEdit.FontSizeChange(Sender: TObject);
begin
  if FUpdating then
    Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TF_RichEdit.AlignButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TF_RichEdit.FontNameChange(Sender: TObject);
begin
  if FUpdating then
    Exit;
  CurrText.name := FontName.Items[FontName.ItemIndex];
end;

procedure TF_RichEdit.UnderlineButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TF_RichEdit.BuildFilterList;

  function BuildFilter(const AInterface: TGUID): String;
  var
    X, Y: Integer;
    Intf: IInterface;
  begin
    Result := '';
    Y := 0;
    // Отбираем только нужные плагины и заносим их в список
    for X := 0 to Plugins.Count - 1 do
      if Supports(Plugins[X], AInterface, Intf) then
      begin
        Result := Result + Plugins[X].Description + '|' + Plugins[X].Mask + '|';
        Plugins[X].FilterIndex := Y;
        Inc(Y);
        Intf := nil;
      end;
    // Удалили лишний | в конце строки
    SetLength(Result, Length(Result) - 1);
  end;

begin
  OpenDialog.Filter := BuildFilter(IImportPlugin);
  SaveDialog.Filter := BuildFilter(IExportPlugin);

  OpenDialog.FilterIndex := 1;
  SaveDialog.FilterIndex := 1;
end;

procedure TF_RichEdit.BulletsButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  Editor.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);
end;

procedure TF_RichEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    CheckFileSave;
  except
    CanClose := False;
  end;
end;

{ Ruler Indent Dragging }

procedure TF_RichEdit.RulerItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left + X - FDragOfs;
  FDragging := True;
end;

procedure TF_RichEdit.RulerItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
    TLabel(Sender).Left := TLabel(Sender).Left + X - FDragOfs
end;

procedure TF_RichEdit.FirstIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.FirstIndent := Trunc((FirstInd.Left + FDragOfs - GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TF_RichEdit.LeftIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.LeftIndent := Trunc((LeftInd.Left + FDragOfs - GutterWid) / RulerAdj) - Editor.Paragraph.FirstIndent;
  SelectionChange(Sender);
end;

procedure TF_RichEdit.RightIndMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.RightIndent := Trunc((Ruler.ClientWidth - RightInd.Left + FDragOfs - 2) / RulerAdj) - 2 * GutterWid;
  SelectionChange(Sender);
end;

procedure TF_RichEdit.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0, Editor.SelStart);
  CharPos.X := (Editor.SelStart - SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
  // StatusBar.Panels[0].Text := Format(sColRowInfo, [CharPos.Y, CharPos.X]);
end;

procedure TF_RichEdit.FormShow(Sender: TObject);
var
  HTML_Editor: TF_HTML_Editor;
begin
  UpdateCursorPos;
  DragAcceptFiles(Handle, True);
  RichEditChange(nil);
  Editor.SetFocus;
  { Check if we should load a file from the command line }
  if (ParamCount > 0) and FileExists(ParamStr(1)) then
    PerformFileOpen(ParamStr(1));

  // editor.Paragraph.Alignment := taLeftJustify;
  Editor.Paragraph.Alignment := taCenter;
  Editor.Lines.Add('%email%');
  Editor.Lines.Add('%time%');
  Editor.Lines.Add('%link%');
  Editor.Lines.Add('%code%');

  ColorBox2.Selected := Editor.Color;
  // TEdit(FindComponent(NamePrefix + IntToStr(i)))

  // editor.Lines.Add('This line is centered.');
  // editor.Paragraph.Alignment := taRightJustify;
  // editor.Lines.Add('This line is right justified');
end;

procedure TF_RichEdit.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array [0 .. MAX_PATH] of Char;
begin
  try
    if DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0 then
    begin
      CheckFileSave;
      PerformFileOpen(CFileName);
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

procedure TF_RichEdit.RichEditChange(Sender: TObject);
begin
  SetModified(Editor.Modified);

end;

procedure TF_RichEdit.SetModified(Value: Boolean);
begin
  // if Value then StatusBar.Panels[1].Text := sModified
  // else StatusBar.Panels[1].Text := '';
end;

procedure TF_RichEdit.SetParentName(name: string);
begin
  FParentName := name;
  // ShowMessage(FParentName);
end;

procedure TF_RichEdit.SwitchLanguage(Sender: TObject);
var
  name: String;
  Size: Integer;
begin
  if LoadNewResourceModule(TComponent(Sender).Tag) <> 0 then
  begin
    Name := FontName.Text;
    Size := StrToInt(FontSize.Text);
    ReinitializeForms;
    LanguageEnglish.Checked := LanguageEnglish = Sender;
    LanguageFrench.Checked := LanguageFrench = Sender;
    LanguageGerman.Checked := LanguageGerman = Sender;

    CurrText.name := Name;
    CurrText.Size := Size;
    SelectionChange(Self);
    FontName.SelLength := 0;

    SetupRuler;
    if Visible then
      Editor.SetFocus;
  end;
end;

procedure TF_RichEdit.Timer1Timer(Sender: TObject);
begin
  if FParentName = 'F_HTML_Editor_1' then
  begin
    // U_MultiMail.F_HTML_Editor_1.Memo_Html.Text := Editor.Text ;
    RichEditToHtml.ConvertToHtmlStrings(Editor, U_MultiMail.F_HTML_Editor_1.Memo_Html.Lines);

    U_MultiMail.F_HTML_Editor_1.Memo_Html.Lines.Text := StringReplace(U_MultiMail.F_HTML_Editor_1.Memo_Html.Lines.Text,
       '<BODY>', '<BODY bgcolor="#' + RgbToHtml(Editor.Color) + '">', []);
  end
  else if FParentName = 'F_HTML_Editor_2' then
  begin
    RichEditToHtml.ConvertToHtmlStrings(Editor, U_MultiMail.F_HTML_Editor_2.Memo_Html.Lines);

    U_MultiMail.F_HTML_Editor_2.Memo_Html.Lines.Text := StringReplace(U_MultiMail.F_HTML_Editor_2.Memo_Html.Lines.Text,
       '<BODY>', '<BODY bgcolor="#' + RgbToHtml(Editor.Color) + '">', []);
  end
  else if FParentName = 'F_HTML_Editor_3' then
  begin
    RichEditToHtml.ConvertToHtmlStrings(Editor, U_MultiMail.F_HTML_Editor_3.Memo_Html.Lines);

    U_MultiMail.F_HTML_Editor_3.Memo_Html.Lines.Text := StringReplace(U_MultiMail.F_HTML_Editor_3.Memo_Html.Lines.Text,
       '<BODY>', '<BODY bgcolor="#' + RgbToHtml(Editor.Color) + '">', []);
  end
  else if FParentName = 'F_HTML_Editor_4' then
  begin
    RichEditToHtml.ConvertToHtmlStrings(Editor, U_MultiMail.F_HTML_Editor_4.Memo_Html.Lines);

    U_MultiMail.F_HTML_Editor_4.Memo_Html.Lines.Text := StringReplace(U_MultiMail.F_HTML_Editor_4.Memo_Html.Lines.Text,
       '<BODY>', '<BODY bgcolor="#' + RgbToHtml(Editor.Color) + '">', []);
  end
  else if FParentName = 'F_HTML_Editor_5' then
  begin
    RichEditToHtml.ConvertToHtmlStrings(Editor, U_MultiMail.F_HTML_Editor_5.Memo_Html.Lines);

    U_MultiMail.F_HTML_Editor_5.Memo_Html.Lines.Text := StringReplace(U_MultiMail.F_HTML_Editor_5.Memo_Html.Lines.Text,
       '<BODY>', '<BODY bgcolor="#' + RgbToHtml(Editor.Color) + '">', []);
  end;
  Timer1.Enabled := False;

end;

procedure TF_RichEdit.ActionList2Update(Action: TBasicAction; var Handled: Boolean);
begin
  { Update the status of the edit commands }
  EditCutCmd.Enabled := Editor.SelLength > 0;
  EditCopyCmd.Enabled := EditCutCmd.Enabled;
  if Editor.HandleAllocated then
  begin
    EditUndoCmd.Enabled := Editor.Perform(EM_CANUNDO, 0, 0) <> 0;
    EditPasteCmd.Enabled := Editor.Perform(EM_CANPASTE, 0, 0) <> 0;
  end;
end;

// initialization
// ReportMemoryLeaksOnShutdown := True;
end.
