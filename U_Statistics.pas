unit U_Statistics;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TF_Statistics = class(TForm)
    GroupBox1: TGroupBox;
    Group_SMTP_1: TGroupBox;
    Group_SMTP_2: TGroupBox;
    Group_SMTP_3: TGroupBox;
    Group_SMTP_4: TGroupBox;
    Group_SMTP_5: TGroupBox;
    Group_Total: TGroupBox;
    Lbl_ErrorCount_1: TLabel;
    Label10: TLabel;
    Lbl_SentCount_1: TLabel;
    Lbl_Sent_1: TLabel;
    Lbl_ErrorCount_2: TLabel;
    Lbl_SentCount_2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Lbl_ErrorCount_3: TLabel;
    Lbl_SentCount_3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Lbl_ErrorCount_4: TLabel;
    Lbl_SentCount_4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Lbl_ErrorCount_5: TLabel;
    Lbl_SentCount_5: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Lbl_Sent_Total: TLabel;
    Label22: TLabel;
    Memo_log: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    FSuccCount1: Integer;
    FErrCount1: Integer;
    FSuccCount2: Integer;
    FErrCount2: Integer;
    FSuccCount3: Integer;
    FErrCount3: Integer;
    FSuccCount4: Integer;
    FErrCount4: Integer;
    FSuccCount5: Integer;
    FErrCount5: Integer;
  public
    procedure SetSuccCount(n: Integer);
    procedure SetErrCount(n: Integer);
  end;

var
  F_Statistics: TF_Statistics;

implementation

uses
  U_MultiMail;

{$R *.dfm}

procedure TF_Statistics.FormCreate(Sender: TObject);
begin
  FSuccCount1 := 0;
  FSuccCount2 := 0;
  FSuccCount3 := 0;
  FSuccCount4 := 0;
  FSuccCount5 := 0;

  FErrCount1 := 0;
  FErrCount2 := 0;
  FErrCount3 := 0;
  FErrCount4 := 0;
  FErrCount5 := 0;

end;

procedure TF_Statistics.SetErrCount(n: Integer);
begin
  case n of
    1:
      begin
        Inc(FErrCount1);
        Lbl_ErrorCount_1.Caption := IntToStr(FErrCount1)
      end;
    2:
      begin
        Inc(FErrCount2);
        Lbl_ErrorCount_2.Caption := IntToStr(FErrCount2)
      end;
    3:
      begin
        Inc(FErrCount3);
        Lbl_ErrorCount_3.Caption := IntToStr(FErrCount3)
      end;
    4:
      begin
        Inc(FErrCount4);
        Lbl_ErrorCount_4.Caption := IntToStr(FErrCount4)
      end;
    5:
      begin
        Inc(FErrCount5);
        Lbl_ErrorCount_5.Caption := IntToStr(FErrCount5)
      end;
  end;
  // Lbl_ER_Total.Caption := IntToStr(FSuccCount1 + FSuccCount2 + FSuccCount3 + FSuccCount4 + FSuccCount5)
end;

procedure TF_Statistics.SetSuccCount(n: Integer);
begin
  case n of
    1:
      begin
        Inc(FSuccCount1);
        Lbl_SentCount_1.Caption := IntToStr(FSuccCount1)
      end;
    2:
      begin
        Inc(FSuccCount2);
        Lbl_SentCount_2.Caption := IntToStr(FSuccCount2)
      end;
    3:
      begin
        Inc(FSuccCount3);
        Lbl_SentCount_3.Caption := IntToStr(FSuccCount3)
      end;
    4:
      begin
        Inc(FSuccCount4);
        Lbl_SentCount_4.Caption := IntToStr(FSuccCount4)
      end;
    5:
      begin
        Inc(FSuccCount5);
        Lbl_SentCount_5.Caption := IntToStr(FSuccCount5)
      end;
  end;
  Lbl_Sent_Total.Caption := IntToStr(FSuccCount1 + FSuccCount2 + FSuccCount3 + FSuccCount4 + FSuccCount5)

end;

end.
