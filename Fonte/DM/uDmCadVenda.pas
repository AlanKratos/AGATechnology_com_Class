unit uDmCadVenda;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, Vcl.Dialogs;

type
  TdmCadVenda = class(TdmCadPai)
    FDSchemaAdapterVenda: TFDSchemaAdapter;
    FDQueryVendaItem: TFDQuery;
    dsMaster: TDataSource;
    FDQueryValidaCliente: TFDQuery;
    FDQueryValidaItem: TFDQuery;
    FDQueryVendaItemCODIGO_DOC_ITEM: TIntegerField;
    FDQueryVendaItemDOCUMENTO_DOC_ITEM: TIntegerField;
    FDQueryVendaItemITEM_DOC_ITEM: TIntegerField;
    FDQueryVendaItemQTD_DOC_ITEM: TIntegerField;
    FDQueryVendaItemVALOR_DOC_ITEM: TBCDField;
    FDQueryVendaItemCODIGO_ITEM: TIntegerField;
    FDQueryVendaItemDESCRICAO_ITEM: TStringField;
    FDQueryValidaPreco: TFDQuery;
    FDQueryTabelaPreco: TFDQuery;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryVendaItemBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure FDQueryVendaItemBeforeInsert(DataSet: TDataSet);
    procedure FDQueryVendaItemNewRecord(DataSet: TDataSet);
    procedure Validate_Cliente(Sender: TField);
    procedure Validate_Item(Sender: TField);
    procedure FDQueryVendaItemBeforeEdit(DataSet: TDataSet);
    procedure FDQueryVendaItemAfterDelete(DataSet: TDataSet);
//    procedure Validate_Preco(Sender: TField; TabelaPreco: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadVenda: TdmCadVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadVenda.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DOCUMENTO').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DOCUMENTO').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO')
end;

procedure TdmCadVenda.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('MODALIDADE_DOCUMENTO').AsString :='S';
  QueryCadastro.Edit;
end;

procedure TdmCadVenda.FDQueryVendaItemAfterDelete(DataSet: TDataSet);
begin
  inherited;
  QueryCadastro.Edit;
end;

procedure TdmCadVenda.FDQueryVendaItemBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QueryCadastro do
  Begin
    Edit;
  End;
end;

procedure TdmCadVenda.FDQueryVendaItemBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QueryCadastro.State = dsInsert then
    QueryCadastro.Post;
    QueryCadastro.Edit;
end;

procedure TdmCadVenda.FDQueryVendaItemBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DOC_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DOC_ITEM').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO_ITEM')
end;

procedure TdmCadVenda.FDQueryVendaItemNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DOCUMENTO_DOC_ITEM').AsInteger :=
    QueryCadastro.FieldByName('CODIGO_DOCUMENTO').AsInteger;
end;

procedure TdmCadVenda.Validate_Cliente(Sender: TField);
begin
//preencher o campo descrição cliente
  FDQueryValidaCliente.Close();
  FDQueryValidaCliente.SQL.Text := 'select PESSOA.NOME_PESSOA from pessoa ' +
                  'where PESSOA.CODIGO_PESSOA = ' + IntToStr(Sender.AsInteger);
  try
    FDQueryValidaCliente.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cliente: ' + E.Message);
  end;
  if FDQueryValidaCliente.IsEmpty then
  begin
    MessageDlg('Código do cliente precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryCadastro.FieldByName('NOME_PESSOA').AsString := FDQueryValidaCliente.FieldByName('NOME_PESSOA').AsString;
end;

procedure TdmCadVenda.Validate_Item(Sender: TField);
begin
  //preencher o campo descrição do item e valor do item
  FDQueryValidaItem.Close();
  FDQueryValidaItem.SQL.Text := 'select ITEM.DESCRICAO_ITEM from ITEM ' +
                  'where ITEM.CODIGO_ITEM = ' + IntToStr(Sender.AsInteger);
  try
    FDQueryValidaItem.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Item: ' + E.Message);
  end;
  if FDQueryValidaItem.IsEmpty then
  begin
    MessageDlg('Código do item está incorreto!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryVendaItem.FieldByName('DESCRICAO_ITEM').AsString := FDQueryValidaItem.FieldByName('DESCRICAO_ITEM').AsString;


//  if (FDQueryPrincipal.State in [dsInsert, dsedit]) then
  Begin
    FDQueryValidaPreco.Close();
    FDQueryValidaPreco.SQL.Text := ('select TABELA_DETALHE.VALOR_TAB_DET from TABELA_DETALHE ' +
                  'where TABELA_DETALHE.ITEM_TAB_DET = ' + IntToStr(Sender.AsInteger) +
                  ' and TABELA_DETALHE.TABELA_TAB_DET = ' + QueryCadastro.FieldByName('TABELA_DOCUMENTO').AsString);
    try
      FDQueryValidaPreco.Open();
    Except
      On E:Exception do
      ShowMessage('Erro Preço: ' + E.Message);
    end;
    FDQueryVendaItem.FieldByName('VALOR_DOC_ITEM').AsString :=
                     FDQueryValidaPreco.FieldByName('VALOR_TAB_DET').AsString;
  end;
end;


end.
