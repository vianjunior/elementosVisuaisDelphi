unit uFrmDataHora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TFrmDataHora = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    LblDataHora: TLabel;
    ImgFormDataHora: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDataHora: TFrmDataHora;

implementation

{$R *.dfm}

procedure TFrmDataHora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TFrmDataHora.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
  LblDataHora.Caption := FormatDateTime('dd/mm/yyyy hh:mm:ss', now);
end;

procedure TFrmDataHora.Timer1Timer(Sender: TObject);
begin
  LblDataHora.Caption := FormatDateTime('dd/mm/yyyy hh:mm:ss', now);
end;

end.
