unit uDmCadCliente;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, frxClass,
  frxDBSet,Vcl.Dialogs,

  ClassPessoa_Endereco

  ;

type
  TdmCadCliente = class(TdmCadPai)
    QueryEmail: TFDQuery;
    QueryEndereco: TFDQuery;
    QueryTelefone: TFDQuery;
    dsMaster: TDataSource;
    FDQueryValidaCidade: TFDQuery;
    FDSchemaAdapterCliente: TFDSchemaAdapter;
    FDQueryValidaUf: TFDQuery;
    procedure QueryCadastroNewRecord(DataSet: TDataSet);
    procedure QueryEnderecoNewRecord(DataSet: TDataSet);
    procedure QueryEnderecoBeforeEdit(DataSet: TDataSet);
    procedure QueryEnderecoBeforeInsert(DataSet: TDataSet);
    procedure QueryEnderecoBeforePost(DataSet: TDataSet);
    procedure QueryEmailNewRecord(DataSet: TDataSet);
    procedure QueryTelefoneNewRecord(DataSet: TDataSet);
    procedure QueryEmailBeforeEdit(DataSet: TDataSet);
    procedure QueryTelefoneBeforeEdit(DataSet: TDataSet);
    procedure QueryEmailBeforeInsert(DataSet: TDataSet);
    procedure QueryTelefoneBeforeInsert(DataSet: TDataSet);
    procedure QueryEmailBeforePost(DataSet: TDataSet);
    procedure QueryTelefoneBeforePost(DataSet: TDataSet);
    procedure Validate_Cidade(Sender: TField);
    procedure QueryEnderecoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure QueryCadastroReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure QueryCadastroAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QueryCadastroBeforePost(DataSet: TDataSet);
    procedure QueryCadastroAfterOpen(DataSet: TDataSet);
    procedure QueryEnderecoAfterOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);

  private
    { Private declarations }
    ClassEndPessoa: TClassPessoa_Endereco;
  public
    { Public declarations }
    qry: TFDQuery;
  end;

var
  dmCadCliente: TdmCadCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ClassPessoa, ClassPessoa_Email, ClassPessoa_Telefone;

{$R *.dfm}

procedure TdmCadCliente.DataModuleCreate(Sender: TObject);
begin
  inherited;
  //QueryCadastro.Fields.Add(TClassPessoa.SQLBaseCadastro);
  //QueryCadastro.DataSetField.Create(TClassPessoa.CamposCadastro);


  ClassEndPessoa := TClassPessoa_Endereco.Create;
  ClassEndPessoa.CriarParametros(QueryEndereco);
  QueryCadastro.SQL.Add(TClassPessoa.SQLBaseCadastro);

  tabela := TClassPessoa.TabelaPrincipal;
  campochave := TClassPessoa.CampoChave;
  TipoCadastro := TClassPessoa.TipoCadastro;

  QueryEndereco.SQL.Add(TClassPessoa_Endereco.SQLBaseCadastro);
 // QueryEndereco.GetFieldNames(TClassPessoa_Endereco.CamposCadastro);

  QueryEmail.SQL.Add(TClassPessoa_Email.SQLBaseCadastro);
  QueryTelefone.SQL.Add(TClassPessoa_Telefone.SQLBaseCadastro);

 // QueryEndereco.Fields.Add(TClassPessoa_Endereco.CamposCadastro);

  QueryEndereco.Close;
  QueryEndereco.Open;
  QueryTelefone.Close;
  QueryTelefone.Open;
  QueryEmail.Close;
  QueryEmail.Open;


             {
    sqlTelefone.CommandText := ClassTelefonePessoa.SQLBaseCadastro;
    ClassTelefonePessoa.CriarParametros(sqlTelefone);
    sqlTelefone.DataSource := dsLink;

    sqlEmail.CommandText := ClassEmailPessoa.SQLBaseCadastro;
    ClassEmailPessoa.CriarParametros(sqlEmail);
    sqlEmail.DataSource := dsLink;

    sqlReferencia.CommandText := ClassReferenciaPessoa.SQLBaseCadastro;
    ClassReferenciaPessoa.CriarParametros(sqlReferencia);
    sqlReferencia.DataSource := dsLink;



                         }

end;

procedure TdmCadCliente.QueryEmailBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  QueryCadastro.Edit;
end;

procedure TdmCadCliente.QueryEmailBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QueryCadastro.State = dsInsert then
    QueryCadastro.Post;
    QueryCadastro.Edit;
end;

procedure TdmCadCliente.QueryEmailBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_EMAIL').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_EMAIL').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_EMAIL')
end;

procedure TdmCadCliente.QueryEmailNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_EMAIL').AsInteger :=
    QueryCadastro.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.QueryEnderecoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  SetaProviderFlag(QueryEndereco, ClassEndPessoa.CampoChave);
  TClassPessoa_Endereco.ConfigurarPropriedadesDoCampo(DataSet);
end;

procedure TdmCadCliente.QueryEnderecoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
    QueryCadastro.Edit;
end;

procedure TdmCadCliente.QueryEnderecoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QueryCadastro.State = dsInsert then
    QueryCadastro.Post;
    QueryCadastro.Edit;
end;

procedure TdmCadCliente.QueryEnderecoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_ENDERECO').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_ENDERECO').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_ENDERECO');
end;

procedure TdmCadCliente.QueryEnderecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_ENDERECO').AsInteger :=
    QueryCadastro.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.QueryEnderecoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
//  ShowMessage(e.Message);
end;

procedure TdmCadCliente.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  ClassEndPessoa.Free;
end;

procedure TdmCadCliente.QueryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QueryCadastro do
  Begin
    FieldByName('STATUS_PESSOA').Value := 1;
  End;
end;

procedure TdmCadCliente.QueryCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TClassPessoa.ConfigurarPropriedadesDoCampo(DataSet);

end;

procedure TdmCadCliente.QueryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
    if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA')
end;

procedure TdmCadCliente.QueryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CLIENTE_PESSOA').AsString :='S';
  DataSet.FieldByName('FORNECEDOR_PESSOA').AsString :='N';
  DataSet.FieldByName('FUNCIONARIO_PESSOA').AsString :='N';
  QueryCadastro.Edit;
end;

procedure TdmCadCliente.QueryCadastroReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
  Action := raAbort;
  DataSet.Edit;
  ShowMessage(e.Message);
end;

procedure TdmCadCliente.QueryTelefoneBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  QueryCadastro.Edit;
end;

procedure TdmCadCliente.QueryTelefoneBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QueryCadastro.State = dsInsert then
    QueryCadastro.Post;
    QueryCadastro.Edit;
end;

procedure TdmCadCliente.QueryTelefoneBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_TELEFONE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_TELEFONE').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_TELEFONE');
end;

procedure TdmCadCliente.QueryTelefoneNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_TELEFONE').AsInteger :=
    QueryCadastro.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.Validate_Cidade(Sender: TField);
begin
  FDQueryValidaCidade.Close();
  FDQueryValidaCidade.SQL.Text := 'select DESCRICAO_CIDADE, UF_CIDADE from CIDADE' +
  ' where CIDADE.CODIGO_CIDADE = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaCidade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cidade: ' + E.Message);
  end;
  if FDQueryValidaCidade.IsEmpty then
  begin
    MessageDlg('Campo código da cidade precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryEndereco.FieldByName('DESCRICAO_CIDADE').AsString := FDQueryValidaCidade.FieldByName('DESCRICAO_CIDADE').AsString;

  FDQueryValidaUf.Close();
  FDQueryValidaUf.SQL.Text := 'select SIGLA_UF from UF' +
  ' where UF.CODIGO_UF = '+ FDQueryValidaCidade.FieldByName('UF_CIDADE').AsString;
  try
    FDQueryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro UF: ' + E.Message);
  end;
  if FDQueryValidaCidade.IsEmpty then
  begin
    MessageDlg('UF não preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryEndereco.FieldByName('SIGLA_UF').AsString := FDQueryValidaUf.FieldByName('SIGLA_UF').AsString
end;

end.
