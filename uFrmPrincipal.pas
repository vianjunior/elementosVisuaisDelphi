unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, uFrmDataHora;

type
  TFrmPrincipal = class(TForm)
    PnlTitulo: TPanel;
    PgCtrlPrincipal: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GrpbEvento: TGroupBox;
    LblCaracteres: TLabel;
    EdtCaracteres: TEdit;
    BtnExibirDataHora: TButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    BtnDireitaAba1: TButton;
    RGListaOpcoes: TRadioGroup;
    BtnEnviaItemSelecionado: TButton;
    Label1: TLabel;
    LstBxItensSelecionados: TListBox;
    BtnLimparItens: TButton;
    Panel2: TPanel;
    BtnEsquerdaAba2: TButton;
    BtnDireitaAba2: TButton;
    MmObservacoes: TMemo;
    LblObservacoesMemo: TLabel;
    BtnSlecionarTudoMemo: TButton;
    BtnLimparMemo: TButton;
    Panel3: TPanel;
    BtnEsquerdaAba3: TButton;
    procedure FormShow(Sender: TObject);
    procedure EdtCaracteresEnter(Sender: TObject);
    procedure EdtCaracteresExit(Sender: TObject);
    procedure BtnDireitaAba1Click(Sender: TObject);
    procedure BtnEnviaItemSelecionadoClick(Sender: TObject);
    procedure BtnLimparItensClick(Sender: TObject);
    procedure BtnEsquerdaAba2Click(Sender: TObject);
    procedure BtnDireitaAba2Click(Sender: TObject);
    procedure BtnEsquerdaAba3Click(Sender: TObject);
    procedure BtnLimparMemoClick(Sender: TObject);
    procedure BtnSlecionarTudoMemoClick(Sender: TObject);
    procedure BtnExibirDataHoraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnDireitaAba1Click(Sender: TObject);
begin
  PgCtrlPrincipal.ActivePageIndex := 1;
end;

procedure TFrmPrincipal.BtnEsquerdaAba2Click(Sender: TObject);
begin
  PgCtrlPrincipal.ActivePageIndex := 0;
end;

procedure TFrmPrincipal.BtnEsquerdaAba3Click(Sender: TObject);
begin
  PgCtrlPrincipal.ActivePageIndex := 1;
end;

procedure TFrmPrincipal.BtnExibirDataHoraClick(Sender: TObject);
begin
  FrmDataHora.ShowModal;
end;

procedure TFrmPrincipal.BtnDireitaAba2Click(Sender: TObject);
begin
  PgCtrlPrincipal.ActivePageIndex := 2;
end;

procedure TFrmPrincipal.BtnEnviaItemSelecionadoClick(Sender: TObject);
begin
  if RGListaOpcoes.ItemIndex >= 0 then
  begin
    LstBxItensSelecionados.Items.Add(RGListaOpcoes.Items[RGListaOpcoes.ItemIndex]);
    RGListaOpcoes.ItemIndex := -1;
  end
  else
  begin
    MessageDlg('Você não selecionou nenhum item', mtError, [mbOK], 0);
  end;
end;


procedure TFrmPrincipal.BtnLimparItensClick(Sender: TObject);
begin
  LstBxItensSelecionados.Items.Clear;
end;

procedure TFrmPrincipal.BtnLimparMemoClick(Sender: TObject);
begin
  MmObservacoes.Lines.Clear;
end;

procedure TFrmPrincipal.BtnSlecionarTudoMemoClick(Sender: TObject);
begin
  MmObservacoes.SelectAll;
  MmObservacoes.SetFocus;
end;

procedure TFrmPrincipal.EdtCaracteresEnter(Sender: TObject);
begin
  EdtCaracteres.Color := clBlue;
end;

procedure TFrmPrincipal.EdtCaracteresExit(Sender: TObject);
begin
  if EdtCaracteres.Text = '' then
  begin
    MessageDlg('Você não informou nenhum conteúdo', mtError, [mbOK], 0);
    EdtCaracteres.SetFocus;
  end
  else if Length(EdtCaracteres.Text) <> 4 then
  begin
    MessageDlg('Quantidade de caracteres inválida', mtWarning, [mbOK], 0);
    EdtCaracteres.SetFocus;
    EdtCaracteres.SelectAll;
  end
  else
  begin
    EdtCaracteres.Color := clGreen;
    MmObservacoes.Lines.Add(EdtCaracteres.Text);
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  PnlTitulo.Caption := 'Mudando Caption do Panel com onShow';
  PnlTitulo.Color := clHotLight;
  PgCtrlPrincipal.ActivePageIndex := 0;
end;

end.
