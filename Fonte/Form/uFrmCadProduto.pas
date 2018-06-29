unit uFrmCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadProduto, Vcl.DBCtrls, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, FireDAC.VCLUI.Controls, JvDBCheckBox, JvExControls,
  JvDBLookup, JvDBControls, JvExStdCtrls, JvCombobox, JvDBCombobox, uFrmCadPai;

type
  TfrmCadProduto = class(TfrmCadPai)
    dsItemDetalhe: TDataSource;
    Panel2: TPanel;
    JvPageControl1: TJvPageControl;
    tsPrincipal: TTabSheet;
    dbeDESCRICAO_ITEM: TDBEdit;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    dbcbCor: TJvDBCheckBox;
    dbcbGrade: TJvDBCheckBox;
    Label4: TLabel;
    dbeGrupo: TDBEdit;
    Label5: TLabel;
    dbeSubGrupo: TDBEdit;
    Label6: TLabel;
    dblkUnidade: TJvDBLookupCombo;
    dsUnidade: TDataSource;
    jvdbceGrupo: TJvDBComboEdit;
    jvdbceSubGrupo: TJvDBComboEdit;
    Panel4: TPanel;
    Label7: TLabel;
    dbmObservacao: TDBMemo;
    Label8: TLabel;
    Label9: TLabel;
    jvdbceCodNcm: TJvDBComboEdit;
    dbeNcm: TDBEdit;
    Label10: TLabel;
    jvdbcbTipoTributacao: TJvDBComboBox;
    tsDetalhamento: TTabSheet;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbmObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnPesquisarClick(Sender: TObject);
    procedure JvCalcEditCodigoClick(Sender: TObject);
    procedure dblkUnidadeCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCache (Sender :TObject);
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uFrmConsultaPai, ClassItem;

procedure TfrmCadProduto.BitBtnCancelarClick(Sender: TObject);
begin
  inherited;
  dmCadProduto.FDSchemaAdapterProduto.CancelUpdates;
end;

procedure TfrmCadProduto.BitBtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadProduto do
      Begin
        QueryCadastro.Delete;
        FDSchemaAdapterProduto.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

end;

procedure TfrmCadProduto.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbeDESCRICAO_ITEM.SetFocus;
end;

procedure TfrmCadProduto.BitBtnPesquisarClick(Sender: TObject);
begin
  frmConsultaPai := TfrmConsultaPai.Create(Self);
  frmConsultaPai.FClass := TClassItem;
  frmConsultaPai.ShowModal;
  JvCalcEditCodigo.AsInteger := frmConsultaPai.ID;
  FreeAndNil(frmConsultaPai);
  inherited;
end;

procedure TfrmCadProduto.BitBtnSalvarClick(Sender: TObject);
begin
  try
  with dmCadProduto do
    begin
      FDSchemaAdapterProduto.ApplyUpdates(0);
      JvCalcEditCodigo.Text := QueryCadastro.FieldByName('CODIGO_ITEM').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

  inherited;
end;

procedure TfrmCadProduto.dblkUnidadeCloseUp(Sender: TObject);
begin
  inherited;
  //dmCadProduto.QueryCadastro.FieldByName('') := campo_da_tabela_de_pesquisa
//  dblkUnidade.Text := dsUnidade.DataSet.FieldValues['TESTE'];

end;

procedure TfrmCadProduto.dbmObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key:= Upcase(Key);
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadProduto := nil;
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadProduto := TdmCadProduto.Create(self); // Instanciar DM
  self.fdmCadPai := dmCadProduto;

  with dmCadProduto do
  begin
    QueryCadastro.Close;
    QueryCadastro.Open;
//    QueryItemDetalhe.Close;
//    QueryItemDetalhe.Open;
//    QueryUnidade.Close;
//    QueryUnidade.Open;
  end;

  with dmCadProduto do
  begin
    FDSchemaAdapterProduto.AfterApplyUpdate := LimparCache;
  end;

end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  with dmCadProduto do
  Begin
    QueryCadastro.FieldByName('GRUPO_ITEM').OnValidate := Validate_Grupo;
    QueryCadastro.FieldByName('SUBGRUPO_ITEM').OnValidate := Validate_SubGrupo;
    QueryCadastro.FieldByName('NCM_ITEM').OnValidate := Validate_Ncm;
  End;
end;

procedure TfrmCadProduto.JvCalcEditCodigoClick(Sender: TObject);
begin
  inherited;
  BitBtnPesquisar.Click;
end;

procedure TfrmCadProduto.LimparCache(Sender: TObject);
begin
  with dmCadProduto do
  Begin
    QueryCadastro.CommitUpdates();
    QueryItemDetalhe.CommitUpdates();
  End;
end;

end.
