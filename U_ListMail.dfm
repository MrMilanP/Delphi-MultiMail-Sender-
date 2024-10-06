object F_ListMail: TF_ListMail
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 533
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 841
    Height = 533
    Align = alClient
    Caption = 'List Mail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Memo_ListMail: TMemo
      Left = 24
      Top = 32
      Width = 793
      Height = 393
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
    object BitBtn1: TBitBtn
      Left = 688
      Top = 439
      Width = 129
      Height = 34
      Caption = 'Load from txt file'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'List Mail|ListMail.txt;Mail.txt|Any Text|*.txt'
    Left = 784
    Top = 392
  end
end
