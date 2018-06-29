unit uDmCadProduto;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, Vcl.Dialogs;

type
  TdmCadProduto = class(TdmCadPai)
    QueryItemDetalhe: TFDQuery;
    FDSchemaAdapterProduto: TFDSchemaAdapter;
    dsMaster: TDataSource;
    QueryUnidade: TFDQuery;
    QueryValidaGrupo: TFDQuery;
    QueryValidaSubGrupo: TFDQuery;
    QueryValida_Ncm: TFDQuery;
    QueryItemDetalheCODIGO_ITEM_DETALHE: TIntegerField;
    QueryItemDetalheCOD_ITEM_DETALHE: TIntegerField;
    QueryItemDetalheCOR_ITEM_DETALHE: TIntegerField;
    QueryItemDetalheGRADE_ITEM_DETALHE: TIntegerField;
    QueryItemDetalheTECIDO_ITEM_DETALHE: TIntegerField;
    QueryItemDetalheSTATUS_ITEM_DETALHE: TIntegerField;
    QueryItemDetalheCODIGOBARRAS_ITEM_DETALHE: TStringField;
    QueryItemDetalheINCLUSAO_ITEM_DETALHE: TSQLTimeStampField;
    QueryItemDetalheALTERACAO_ITEM_DETALHE: TSQLTimeStampField;
    QueryItemDetalheUSUARIOINCLUSAO_ITEM_DETALHE: TStringField;
    QueryItemDetalheUSUARIOALTERACAO_ITEM_DETALHE: TStringField;
    QueryCadastroCODIGO_ITEM: TIntegerField;
    QueryCadastroTIPO_ITEM: TIntegerField;
    QueryCadastroDESCRICAO_ITEM: TStringField;
    QueryCadastroCODIGOBARRAS_ITEM: TStringField;
    QueryCadastroCOLECAO_ITEM: TIntegerField;
    QueryCadastroKIT_ITEM: TStringField;
    QueryCadastroCONTROLAESTOQUE_ITEM: TStringField;
    QueryCadastroDTINCLUSAO_ITEM: TSQLTimeStampField;
    QueryCadastroDTALTERACAO_ITEM: TSQLTimeStampField;
    QueryCadastroNOMEREDUZIDO_ITEM: TStringField;
    QueryCadastroVALIDADE_ITEM: TIntegerField;
    QueryCadastroVARIATECIDO_ITEM: TStringField;
    QueryCadastroVARIAACABAMENTO_ITEM: TStringField;
    QueryCadastroEMPILHAMENTOMAXIMO_ITEM: TIntegerField;
    QueryCadastroFABRICACAOPROPRIA_ITEM: TStringField;
    QueryCadastroGRUPO_ITEM: TIntegerField;
    QueryCadastroSUBGRUPO_ITEM: TIntegerField;
    QueryCadastroFATURA_ITEM: TStringField;
    QueryCadastroNCM_ITEM: TIntegerField;
    QueryCadastroPERCENTUALIMPORTACAO_ITEM: TCurrencyField;
    QueryCadastroPESOBRUTO_ITEM: TBCDField;
    QueryCadastroPESOLIQUIDO_ITEM: TBCDField;
    QueryCadastroREGISTROEAN_ITEM: TStringField;
    QueryCadastroSTATUS_ITEM: TIntegerField;
    QueryCadastroREFERENCIA_ITEM: TStringField;
    QueryCadastroPRODUTO_ITEM: TIntegerField;
    QueryCadastroVARIACOR_ITEM: TBooleanField;
    QueryCadastroVARIAGRADE_ITEM: TBooleanField;
    QueryCadastroUNIDADE_ITEM: TIntegerField;
    QueryCadastroOBSERVACAO_ITEM: TMemoField;
    QueryCadastroTRIBUTACAO_ITEM: TIntegerField;
    QueryCadastroCONTROLACOR_ITEM: TStringField;
    QueryCadastroCONTROLAGRADE_ITEM: TStringField;
    QueryCadastroDESCRICAO_UNIDADE: TStringField;
    QueryUnidadeCODIGO_UNIDADE: TIntegerField;
    QueryUnidadeDESCRICAO_UNIDADE: TStringField;
    QueryCadastroCOD_NCM: TStringField;
    QueryCadastroDESCRICAO_GRUPO: TStringField;
    QueryCadastroDESCRICAO_SUBGRUPO: TStringField;
    procedure FDQueryPrincipalAfterInsert(DataSet: TDataSet);
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure QueryItemDetalheBeforeEdit(DataSet: TDataSet);
    procedure QueryItemDetalheBeforeInsert(DataSet: TDataSet);
    procedure QueryItemDetalheBeforePost(DataSet: TDataSet);
    procedure QueryItemDetalheNewRecord(DataSet: TDataSet);
    procedure Validate_Grupo(Sender: TField);
    procedure Validate_SubGrupo(Sender: TField);
    procedure Validate_Ncm(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadProduto: TdmCadProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ClassItem, ClassItemDetalhe, ClassUnidade;

{$R *.dfm}

procedure TdmCadProduto.DataModuleCreate(Sender: TObject);
begin
  inherited;
  QueryCadastro.SQL.Add(TClassItem.SQLBaseCadastro);

  tabela := TClassItem.TabelaPrincipal;
  campochave := TClassItem.CampoChave;
  TipoCadastro := TClassItem.TipoCadastro;

  QueryItemDetalhe.SQL.Add(TClassItemDetalhe.SQLBaseCadastro);
  QueryUnidade.SQL.Add(TClassUnidade.SQLBaseCadastro);

  QueryItemDetalhe.Close;
  QueryItemDetalhe.Open;
  QueryUnidade.Close;
  QueryUnidade.Open;
end;

procedure TdmCadProduto.QueryItemDetalheBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QueryCadastro do
  Begin
    Edit;
//    FieldByName('ENDERECO_PESSOA').AsInteger := 0;
  End;
end;

procedure TdmCadProduto.QueryItemDetalheBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QueryCadastro.State = dsInsert then
    QueryCadastro.Post;
    QueryCadastro.Edit;
end;

procedure TdmCadProduto.QueryItemDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM_DETALHE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM_DETALHE').AsInteger :=
      dmConexao.ProximoCodigo('ITEM_DETALHE');
end;

procedure TdmCadProduto.QueryItemDetalheNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_ITEM_DETALHE').AsInteger :=
    QueryCadastro.FieldByName('CODIGO_ITEM').AsInteger;
end;

procedure TdmCadProduto.FDQueryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QueryCadastro do
  Begin
    FieldByName('STATUS_ITEM').Value := 1;
    FieldByName('VARIACOR_ITEM').Value := False;
    FieldByName('VARIAGRADE_ITEM').Value := False;
  End;
end;

procedure TdmCadProduto.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM').AsInteger :=
      dmConexao.ProximoCodigo('ITEM')
end;

procedure TdmCadProduto.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PRODUTO_ITEM').AsInteger := 1;
  QueryCadastro.Edit;

end;

procedure TdmCadProduto.Validate_Grupo(Sender: TField);
begin
  QueryValidaGrupo.Close();
  QueryValidaGrupo.SQL.Text := 'select DESCRICAO_GRUPO from GRUPO' +
  ' where GRUPO.CODIGO_GRUPO = '+ IntToStr(Sender.AsInteger);
  try
    QueryValidaGrupo.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grupo: ' + E.Message);
  end;
  if QueryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código do grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryCadastro.FieldByName('DESCRICAO_GRUPO').AsString := QueryValidaGrupo.FieldByName('DESCRICAO_GRUPO').AsString;
end;

procedure TdmCadProduto.Validate_Ncm(Sender: TField);
begin
  QueryValida_Ncm.Close();
  QueryValida_Ncm.SQL.Text := 'select COD_NCM from NCM' +
  ' where NCM.CODIGO_NCM = '+ IntToStr(Sender.AsInteger);
  try
    QueryValida_Ncm.Open();
  Except
    On E:Exception do
    ShowMessage('Erro SubGrupo: ' + E.Message);
  end;
  if QueryValida_Ncm.IsEmpty then
  begin
    MessageDlg('Campo código do NCM precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryCadastro.FieldByName('COD_NCM').AsString := QueryValida_Ncm.FieldByName('COD_NCM').AsString;
end;

procedure TdmCadProduto.Validate_SubGrupo(Sender: TField);
begin
  QueryValidaSubGrupo.Close();
  QueryValidaSubGrupo.SQL.Text := 'select DESCRICAO_SUBGRUPO from SUBGRUPO' +
  ' where SUBGRUPO.CODIGO_SUBGRUPO = '+ IntToStr(Sender.AsInteger);
  try
    QueryValidaSubGrupo.Open();
  Except
    On E:Exception do
    ShowMessage('Erro SubGrupo: ' + E.Message);
  end;
  if QueryValidaSubGrupo.IsEmpty then
  begin
    MessageDlg('Campo código do sub grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryCadastro.FieldByName('DESCRICAO_SUBGRUPO').AsString := QueryValidaSubGrupo.FieldByName('DESCRICAO_SUBGRUPO').AsString;
end;

end.
