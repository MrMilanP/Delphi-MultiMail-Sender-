object F_Sender: TF_Sender
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 497
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 832
    Height = 497
    Align = alClient
    Caption = 'Sender'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Memo_Sender: TMemo
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
    FileName = 
      'C:\Users\Zorica\Documents\Embarcadero\Studio\Projects\MultiMailS' +
      'ender\Sender.txt'
    Filter = 'Sender|ListSender.txt;Sender.txt|Any Text|*.txt'
    Left = 784
    Top = 392
  end
end
