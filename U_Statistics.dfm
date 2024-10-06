object F_Statistics: TF_Statistics
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'F_Statistics'
  ClientHeight = 503
  ClientWidth = 885
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  OnCreate = FormCreate
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 885
    Height = 503
    Align = alClient
    Caption = 'Statistics'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Memo_log: TMemo
      Left = 16
      Top = 32
      Width = 530
      Height = 434
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Group_SMTP_1: TGroupBox
      Left = 552
      Top = 32
      Width = 257
      Height = 73
      Caption = 'SMTP - 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Lbl_ErrorCount_1: TLabel
        Left = 183
        Top = 48
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label10: TLabel
        Left = 32
        Top = 48
        Width = 48
        Height = 18
        Caption = 'Errors :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Lbl_SentCount_1: TLabel
        Left = 183
        Top = 24
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Lbl_Sent_1: TLabel
        Left = 32
        Top = 24
        Width = 39
        Height = 18
        Caption = 'Sent :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Group_SMTP_2: TGroupBox
      Left = 552
      Top = 104
      Width = 257
      Height = 73
      Caption = 'SMTP - 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Lbl_ErrorCount_2: TLabel
        Left = 183
        Top = 47
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Lbl_SentCount_2: TLabel
        Left = 183
        Top = 24
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 32
        Top = 47
        Width = 48
        Height = 18
        Caption = 'Errors :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 32
        Top = 24
        Width = 39
        Height = 18
        Caption = 'Sent :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Group_SMTP_3: TGroupBox
      Left = 552
      Top = 176
      Width = 257
      Height = 73
      Caption = 'SMTP - 3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Lbl_ErrorCount_3: TLabel
        Left = 183
        Top = 47
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Lbl_SentCount_3: TLabel
        Left = 183
        Top = 24
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 32
        Top = 47
        Width = 48
        Height = 18
        Caption = 'Errors :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 32
        Top = 24
        Width = 39
        Height = 18
        Caption = 'Sent :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Group_SMTP_4: TGroupBox
      Left = 552
      Top = 248
      Width = 257
      Height = 73
      Caption = 'SMTP - 4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Lbl_ErrorCount_4: TLabel
        Left = 183
        Top = 47
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Lbl_SentCount_4: TLabel
        Left = 183
        Top = 24
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label13: TLabel
        Left = 32
        Top = 47
        Width = 48
        Height = 18
        Caption = 'Errors :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 32
        Top = 24
        Width = 39
        Height = 18
        Caption = 'Sent :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Group_SMTP_5: TGroupBox
      Left = 552
      Top = 320
      Width = 257
      Height = 73
      Caption = 'SMTP - 5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object Lbl_ErrorCount_5: TLabel
        Left = 183
        Top = 47
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Lbl_SentCount_5: TLabel
        Left = 183
        Top = 24
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 32
        Top = 47
        Width = 48
        Height = 18
        Caption = 'Errors :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 32
        Top = 24
        Width = 39
        Height = 18
        Caption = 'Sent :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Group_Total: TGroupBox
      Left = 552
      Top = 393
      Width = 257
      Height = 73
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Lbl_Sent_Total: TLabel
        Left = 143
        Top = 40
        Width = 10
        Height = 18
        BiDiMode = bdRightToLeft
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label22: TLabel
        Left = 88
        Top = 16
        Width = 67
        Height = 18
        Caption = 'Email Sent'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
