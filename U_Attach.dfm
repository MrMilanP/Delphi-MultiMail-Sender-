object F_Attach: TF_Attach
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 549
  ClientWidth = 923
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 923
    Height = 549
    Align = alClient
    Caption = 'Attachment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object ListView1: TListView
      Left = 40
      Top = 32
      Width = 777
      Height = 385
      Columns = <
        item
          Caption = 'List'
          Width = 630
        end
        item
          Caption = 'MimeType'
          Width = 140
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
    end
    object Btn_Add: TBitBtn
      Left = 688
      Top = 439
      Width = 129
      Height = 34
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Btn_AddClick
    end
    object BitBtn1: TBitBtn
      Left = 504
      Top = 439
      Width = 169
      Height = 34
      Caption = 'Remove Selected'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object Button1: TButton
      Left = 176
      Top = 440
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 824
    Top = 392
  end
end
