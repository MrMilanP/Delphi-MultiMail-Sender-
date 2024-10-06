object F_MultiMail: TF_MultiMail
  Left = 0
  Top = 0
  Caption = 'Multi Mail Sender'
  ClientHeight = 718
  ClientWidth = 885
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Btn_Statistics: TBitBtn
    Left = 24
    Top = 8
    Width = 169
    Height = 35
    Caption = 'Statistics'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Btn_StatisticsClick
  end
  object Btn_Name: TBitBtn
    Left = 24
    Top = 49
    Width = 200
    Height = 35
    Caption = 'Name 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Btn_NameClick
  end
  object Btn_Sender: TBitBtn
    Left = 230
    Top = 49
    Width = 185
    Height = 35
    Caption = 'Sender 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Btn_SenderClick
  end
  object Btn_Subject: TBitBtn
    Left = 421
    Top = 49
    Width = 187
    Height = 35
    Caption = 'Subject Matter 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Btn_SubjectClick
  end
  object Btn_ListMail: TBitBtn
    Left = 24
    Top = 90
    Width = 209
    Height = 35
    Caption = 'ListMail 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Btn_ListMailClick
  end
  object Btn_ListSMTP: TBitBtn
    Left = 239
    Top = 90
    Width = 209
    Height = 35
    Caption = 'ListSMTP 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Btn_ListSMTPClick
  end
  object Btn_Attach: TBitBtn
    Left = 454
    Top = 90
    Width = 154
    Height = 35
    Caption = 'Attachment 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Btn_AttachClick
  end
  object Panel_Container: TFlowPanel
    Left = 24
    Top = 144
    Width = 841
    Height = 506
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object Panel_HTML_1: TPanel
    Left = 24
    Top = 656
    Width = 80
    Height = 40
    Color = clWindow
    ParentBackground = False
    TabOrder = 8
    object Btn_HTML_1: TSpeedButton
      Left = 1
      Top = 1
      Width = 78
      Height = 38
      Align = alClient
      Caption = '01 HTML'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Btn_HTML_1Click
      ExplicitHeight = 40
    end
  end
  object Panel_HTML_2: TPanel
    Left = 111
    Top = 657
    Width = 80
    Height = 40
    Color = clWindow
    ParentBackground = False
    TabOrder = 9
    object Btn_HTML_2: TSpeedButton
      Left = 1
      Top = 1
      Width = 78
      Height = 38
      Align = alClient
      Caption = '02 HTML'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Btn_HTML_2Click
      ExplicitHeight = 40
    end
  end
  object Panel_HTML_3: TPanel
    Left = 199
    Top = 658
    Width = 80
    Height = 40
    Color = clWindow
    ParentBackground = False
    TabOrder = 10
    object Btn_HTML_3: TSpeedButton
      Left = 1
      Top = 1
      Width = 78
      Height = 38
      Align = alClient
      Caption = '03 HTML'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Btn_HTML_3Click
      ExplicitHeight = 40
    end
  end
  object Panel_HTML_4: TPanel
    Left = 287
    Top = 659
    Width = 80
    Height = 40
    Color = clWindow
    ParentBackground = False
    TabOrder = 11
    object Btn_HTML_4: TSpeedButton
      Left = 1
      Top = 1
      Width = 78
      Height = 38
      Align = alClient
      Caption = '04 HTML'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Btn_HTML_4Click
      ExplicitHeight = 40
    end
  end
  object Panel_HTML_5: TPanel
    Left = 373
    Top = 660
    Width = 84
    Height = 40
    Color = clWindow
    ParentBackground = False
    TabOrder = 12
    object Btn_HTML_5: TSpeedButton
      Left = 1
      Top = 1
      Width = 82
      Height = 38
      Align = alClient
      Caption = '05 HTML'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Btn_HTML_5Click
      ExplicitLeft = 49
      ExplicitWidth = 79
      ExplicitHeight = 39
    end
  end
  object Btn_Start: TBitBtn
    Left = 752
    Top = 665
    Width = 113
    Height = 45
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = Btn_StartClick
  end
  object Btn_Pause: TBitBtn
    Left = 633
    Top = 665
    Width = 113
    Height = 45
    Caption = 'Pause'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = Btn_PauseClick
  end
end
