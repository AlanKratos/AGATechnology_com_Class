unit uFrmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.DBCtrls,
  JvDBCheckBox, JvExExtCtrls, JvExtComponent, JvDBRadioPanel, JvExStdCtrls,
  JvEdit, JvDBSearchEdit, JvMaskEdit, JvDBControls, uDmCadCliente, frxClass,
  frxDBSet, RelCliente, unitValidaCnpjCpf, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmCadCliente = class(TfrmCadPai)
    dbeRazao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeFantasia: TDBEdit;
    pcCliente: TJvPageControl;
    tsPrincipal: TTabSheet;
    dbrpTipoPessoa: TJvDBRadioPanel;
    dbmObservacao: TDBMemo;
    Panel2: TPanel;
    dbcbStatus: TJvDBCheckBox;
    JvDBCheckBox2: TJvDBCheckBox;
    dbmeCpf: TJvDBMaskEdit;
    dbmeRg: TJvDBMaskEdit;
    dsTelefone: TDataSource;
    dsEndereco: TDataSource;
    dsEmail: TDataSource;
    lCNPJ: TLabel;
    lIE: TLabel;
    Label15: TLabel;
    lCPF: TLabel;
    lRG: TLabel;
    dbmeCnpj: TJvDBMaskEdit;
    dbmeIe: TJvDBMaskEdit;
    Label4: TLabel;
    TabSheet1: TTabSheet;
    tsEmails: TTabSheet;
    dbeBairro: TDBEdit;
    dbeNumero: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeComplemento: TDBEdit;
    dbceCodCidade: TJvDBComboEdit;
    dbeCidade: TDBEdit;
    dbedtSIGLA_UF: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    JvDBGrid1: TJvDBGrid;
    tsTelefones: TTabSheet;
    jvdbgrdEmails: TJvDBGrid;
    jvdbgrdTelefones: TJvDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbmObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure SpeedButtonPrimeiroClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnRelatorioClick(Sender: TObject);
    procedure BitBtnPesquisarClick(Sender: TObject);
    procedure dbrpTipoPessoaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbceCodCidadeButtonClick(Sender: TObject);
    procedure JvCalcEditCodigoButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCache (Sender :TObject);
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses ClassPessoa, uFrmConsultaPai, ClassCidade;

procedure TfrmCadCliente.BitBtnCancelarClick(Sender: TObject);
begin
  dmCadCliente.FDSchemaAdapterCliente.CancelUpdates;
  inherited;
end;

procedure TfrmCadCliente.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadCliente do
      Begin
        QueryCadastro.Delete;
        FDSchemaAdapterCliente.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

  inherited;
end;

procedure TfrmCadCliente.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbeRazao.SetFocus;
  dbrpTipoPessoa.ItemIndex:= 0;
  dbmeCpf.Visible := True;
  dbmeRg.Visible := True;
  dbmeCnpj.Visible := False;
  dbmeIe.Visible := False;
  lCNPJ.Visible := False;
  lIE.Visible := False;
  lCPF.Visible := True;
  lRG.Visible := True;
end;

procedure TfrmCadCliente.BitBtnPesquisarClick(Sender: TObject);
begin
    frmConsultaPai := TfrmConsultaPai.Create(Self);
    frmConsultaPai.FClass := TClassPessoa;
    frmConsultaPai.ShowModal;
    JvCalcEditCodigo.AsInteger := frmConsultaPai.ID;
    FreeAndNil(frmConsultaPai);
    inherited;
end;

procedure TfrmCadCliente.BitBtnRelatorioClick(Sender: TObject);
begin
  inherited;
  if frmRelCliente = nil then
    frmRelCliente := TfrmRelCliente.Create(self);
  if frmRelCliente.WindowState = wsMinimized then
    frmRelCliente.WindowState := wsNormal
  else
    frmRelCliente.Show;
end;

procedure TfrmCadCliente.BitBtnSalvarClick(Sender: TObject);
begin
  if dbrpTipoPessoa.ItemIndex = 0 then
  begin
    if not ValidaCPF(dbmeCpf.Text) then
    begin
      ShowMessage('CPF Inv�lido!');
      abort;
    end;
  end
  else if not ValidaCNPJ(dbmeCnpj.Text) then
  begin
    ShowMessage('CNPJ Inv�lido!');
    abort;
  end;

  try
    with dmCadCliente do
    begin
      FDSchemaAdapterCliente.ApplyUpdates(0);
      JvCalcEditCodigo.Text := QueryCadastro.FieldByName('CODIGO_PESSOA').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

  inherited;
end;

procedure TfrmCadCliente.dbceCodCidadeButtonClick(Sender: TObject);
begin
  inherited;
  frmConsultaPai := TfrmConsultaPai.Create(Self);
  frmConsultaPai.FClass := TClassCidade;
  frmConsultaPai.ShowModal;
  dmCadCliente.QueryEndereco.Edit;
  dbceCodCidade.Text := IntToStr(frmConsultaPai.ID);
  FreeAndNil(frmConsultaPai);
end;

procedure TfrmCadCliente.dbmObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key:= Upcase(Key);
end;

procedure TfrmCadCliente.dbrpTipoPessoaClick(Sender: TObject);
begin
  inherited;
  if dbrpTipoPessoa.ItemIndex = 0 then
  Begin
    dbmeCpf.Visible := True;
    dbmeRg.Visible := True;
    dbmeCnpj.Visible := False;
    dbmeIe.Visible := False;
    lCNPJ.Visible := False;
    lIE.Visible := False;
    lCPF.Visible := True;
    lRG.Visible := True;
  End
  else
  Begin
    dbmeCpf.Visible := False;
    dbmeRg.Visible := False;
    dbmeCnpj.Visible := True;
    dbmeIe.Visible := True;
    lCNPJ.Visible := True;
    lIE.Visible := True;
    lCPF.Visible := False;
    lRG.Visible := False;
  End;
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadCliente := nil;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadCliente := TdmCadCliente.Create(self); // Instanciar DM
  self.fdmCadPai := dmCadCliente;

  with dmCadCliente do
  begin
    QueryCadastro.Close;
    QueryCadastro.Open;
//    QueryEndereco.Close;
//    QueryEndereco.Open;
//    QueryTelefone.Close;
//    QueryTelefone.Open;
//    QueryEmail.Close;
//    QueryEmail.Open;
  end;

  if dbrpTipoPessoa.ItemIndex = 1 then
  Begin
    BitBtnExcluir.Enabled := False;
    dbmeCpf.Visible := False;
    dbmeRg.Visible := False;
    dbmeCnpj.Visible := False;
    dbmeIe.Visible := False;
    lCNPJ.Visible := False;
    lIE.Visible := False;
    lCPF.Visible := False;
    lRG.Visible := False;
  End;
  pcCliente.ActivePageIndex := 0;

  with dmCadCliente do
  begin
    FDSchemaAdapterCliente.AfterApplyUpdate := LimparCache;
  end;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  with dmCadCliente do
  Begin
    QueryEndereco.FieldByName('CIDADE_PESSOA_ENDERECO').OnValidate := Validate_Cidade;
  End;
end;

procedure TfrmCadCliente.JvCalcEditCodigoButtonClick(Sender: TObject);
begin
  BitBtnPesquisar.Click;
  inherited;
end;

procedure TfrmCadCliente.LimparCache(Sender: TObject);
begin
  with dmCadCliente do
  Begin
    QueryCadastro.CommitUpdates();
    QueryEmail.CommitUpdates();
    QueryEndereco.CommitUpdates();
    QueryTelefone.CommitUpdates();
  End;
end;

procedure TfrmCadCliente.SpeedButtonPrimeiroClick(Sender: TObject);
begin
  inherited;
  if dbrpTipoPessoa.ItemIndex = 0 then
  Begin
    dbmeCpf.Visible := True;
    dbmeRg.Visible := True;
    lCPF.Visible := True;
    lRG.Visible := True;
    dbmeCnpj.Visible := False;
    dbmeIe.Visible := False;
    lCNPJ.Visible := False;
    lIE.Visible := False;
  End
  else
  Begin
    dbmeCpf.Visible := False;
    dbmeRg.Visible := False;
    lCPF.Visible := False;
    lRG.Visible := False;
    dbmeCnpj.Visible := True;
    dbmeIe.Visible := True;
    lCNPJ.Visible := True;
    lIE.Visible := True;
  End;
end;

end.
