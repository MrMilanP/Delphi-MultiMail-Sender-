object F_HTML_Editor: TF_HTML_Editor
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'F_HTML_Editor'
  ClientHeight = 511
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 841
    Height = 511
    Align = alClient
    Caption = 'HTML Editor - 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 645
      Top = 27
      Width = 117
      Height = 18
      Caption = 'Shipping Quantity:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit_Code: TEdit
      Left = 6
      Top = 25
      Width = 121
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '2548'
      TextHint = 'Code...'
    end
    object Edit_Hour: TEdit
      Left = 231
      Top = 25
      Width = 107
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TextHint = 'Hour...'
    end
    object Edit_Email: TEdit
      Left = 344
      Top = 25
      Width = 121
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TextHint = 'Email...'
    end
    object Edit_Link: TEdit
      Left = 471
      Top = 25
      Width = 121
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TextHint = 'Link...'
    end
    object Edit_Quantity: TEdit
      Left = 768
      Top = 24
      Width = 49
      Height = 26
      BiDiMode = bdRightToLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 4
      Text = '10'
      OnChange = Edit_QuantityChange
    end
    object PageCtrl: TPageControl
      Left = 2
      Top = 57
      Width = 837
      Height = 452
      ActivePage = TabText
      Align = alBottom
      TabOrder = 5
      object TabText: TTabSheet
        Caption = 'Text'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object TabHTML: TTabSheet
        Caption = 'HTML'
        ImageIndex = 1
        OnShow = TabHTMLShow
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Memo_Html: TMemo
          Left = 0
          Top = 0
          Width = 829
          Height = 419
          Align = alClient
          TabOrder = 0
        end
      end
      object TabEmail: TTabSheet
        Caption = 'Email 0'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Memo_ListEmail: TMemo
          Left = 0
          Top = 0
          Width = 829
          Height = 419
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          WordWrap = False
        end
      end
      object TabLink: TTabSheet
        Caption = 'Link 0'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Memo_ListLink: TMemo
          Left = 0
          Top = 0
          Width = 829
          Height = 419
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          WordWrap = False
        end
      end
    end
    object Panel_Email: TPanel
      Left = 344
      Top = 24
      Width = 121
      Height = 27
      Color = clWindow
      ParentBackground = False
      TabOrder = 6
      object Btn_Email: TSpeedButton
        Left = 1
        Top = 1
        Width = 119
        Height = 25
        Align = alClient
        Caption = 'Email'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = Btn_EmailClick
        ExplicitTop = 0
        ExplicitWidth = 78
        ExplicitHeight = 39
      end
    end
    object Panel_Link: TPanel
      Left = 472
      Top = 24
      Width = 121
      Height = 27
      Color = clWindow
      ParentBackground = False
      TabOrder = 7
      object Btn_Link: TSpeedButton
        Left = 1
        Top = 1
        Width = 119
        Height = 25
        Align = alClient
        Caption = 'Link'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = Btn_LinkClick
        ExplicitWidth = 120
      end
    end
    object Check_SysTime: TCheckBox
      Left = 138
      Top = 36
      Width = 73
      Height = 17
      Caption = 'Sys. Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Check_SysTimeClick
    end
    object Check_StartTimeCount: TCheckBox
      Left = 138
      Top = 20
      Width = 87
      Height = 17
      Caption = 'Start Timer'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 9
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Email|ListEmail.txt;Email.txt|Any Text|*.txt'
    Left = 712
    Top = 64
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 272
    Top = 64
  end
  object OpenDialog2: TOpenDialog
    Filter = 'Link|ListLink.txt;Link.txt|Any Text|*.txt'
    Left = 760
    Top = 64
  end
end
