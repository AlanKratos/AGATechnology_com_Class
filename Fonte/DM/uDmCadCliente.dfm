inherited dmCadCliente: TdmCadCliente
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 341
  Width = 394
  inherited QueryCadastro: TFDQuery
    AfterOpen = QueryCadastroAfterOpen
    AfterInsert = QueryCadastroAfterInsert
    AfterPost = nil
    OnNewRecord = QueryCadastroNewRecord
    CachedUpdates = True
    ConstraintsEnabled = True
    OnReconcileError = QueryCadastroReconcileError
    SchemaAdapter = FDSchemaAdapterCliente
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = False
    Left = 32
    Top = 16
    object QueryCadastroCODIGO_PESSOA: TIntegerField
      FieldName = 'CODIGO_PESSOA'
      Origin = 'CODIGO_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryCadastroNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME_PESSOA'
      Size = 100
    end
    object QueryCadastroFANTASIA_PESSOA: TStringField
      FieldName = 'FANTASIA_PESSOA'
      Origin = 'FANTASIA_PESSOA'
      Size = 100
    end
    object QueryCadastroTIPO_PESSOA: TIntegerField
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      Required = True
    end
    object QueryCadastroOBSERVACAO_PESSOA: TStringField
      FieldName = 'OBSERVACAO_PESSOA'
      Origin = 'OBSERVACAO_PESSOA'
      Size = 500
    end
    object QueryCadastroSTATUS_PESSOA: TIntegerField
      FieldName = 'STATUS_PESSOA'
      Origin = 'STATUS_PESSOA'
      Required = True
    end
    object QueryCadastroCLIENTE_PESSOA: TStringField
      FieldName = 'CLIENTE_PESSOA'
      Origin = 'CLIENTE_PESSOA'
      Required = True
      Size = 1
    end
    object QueryCadastroCNPJ_PESSOA: TStringField
      FieldName = 'CNPJ_PESSOA'
      Origin = 'CNPJ_PESSOA'
      Size = 18
    end
    object QueryCadastroIE_PESSOA: TStringField
      FieldName = 'IE_PESSOA'
      Origin = 'IE_PESSOA'
      Size = 18
    end
    object QueryCadastroCPF_PESSOA: TStringField
      FieldName = 'CPF_PESSOA'
      Origin = 'CPF_PESSOA'
      Size = 14
    end
    object QueryCadastroRG_PESSOA: TStringField
      FieldName = 'RG_PESSOA'
      Origin = 'RG_PESSOA'
    end
    object QueryCadastroFORNECEDOR_PESSOA: TStringField
      FieldName = 'FORNECEDOR_PESSOA'
      Origin = 'FORNECEDOR_PESSOA'
      Required = True
      Size = 1
    end
    object QueryCadastroFUNCIONARIO_PESSOA: TStringField
      FieldName = 'FUNCIONARIO_PESSOA'
      Origin = 'FUNCIONARIO_PESSOA'
      Required = True
      Size = 1
    end
  end
  inherited QueryNavegar: TFDQuery
    Left = 176
    Top = 288
  end
  object QueryEmail: TFDQuery
    BeforeInsert = QueryEmailBeforeInsert
    BeforeEdit = QueryEmailBeforeEdit
    BeforePost = QueryEmailBeforePost
    OnNewRecord = QueryEmailNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_PESSOA_EMAIL'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_PESSOA'
    DetailFields = 'COD_PESSOA_EMAIL'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterCliente
    FetchOptions.AssignedValues = [evCache, evDetailCascade]
    FetchOptions.DetailCascade = True
    Left = 32
    Top = 144
    object QueryEmailCODIGO_PESSOA_EMAIL: TIntegerField
      FieldName = 'CODIGO_PESSOA_EMAIL'
      Origin = 'CODIGO_PESSOA_EMAIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryEmailCOD_PESSOA_EMAIL: TIntegerField
      FieldName = 'COD_PESSOA_EMAIL'
      Origin = 'COD_PESSOA_EMAIL'
      Required = True
    end
    object QueryEmailEMAIL_PESSOA_EMAIL: TStringField
      FieldName = 'EMAIL_PESSOA_EMAIL'
      Origin = 'EMAIL_PESSOA_EMAIL'
      Required = True
      Size = 40
    end
    object QueryEmailPRINCIPAL_PESSOA_EMAIL: TStringField
      FieldName = 'PRINCIPAL_PESSOA_EMAIL'
      Origin = 'PRINCIPAL_PESSOA_EMAIL'
      Size = 1
    end
    object QueryEmailCOBRANCA_PESSOA_EMAIL: TStringField
      FieldName = 'COBRANCA_PESSOA_EMAIL'
      Origin = 'COBRANCA_PESSOA_EMAIL'
      Size = 1
    end
    object QueryEmailDOCUMENTOSFISCAIS_PESSOA_EMAIL: TStringField
      FieldName = 'DOCUMENTOSFISCAIS_PESSOA_EMAIL'
      Origin = 'DOCUMENTOSFISCAIS_PESSOA_EMAIL'
      Size = 1
    end
    object QueryEmailPEDIDOCOMPRA_PESSOA_EMAIL: TStringField
      FieldName = 'PEDIDOCOMPRA_PESSOA_EMAIL'
      Origin = 'PEDIDOCOMPRA_PESSOA_EMAIL'
      Size = 1
    end
    object QueryEmailPEDIDOVENDA_PESSOA_EMAIL: TStringField
      FieldName = 'PEDIDOVENDA_PESSOA_EMAIL'
      Origin = 'PEDIDOVENDA_PESSOA_EMAIL'
      Size = 1
    end
    object QueryEmailMALADIRETA_PESSOA_EMAIL: TStringField
      FieldName = 'MALADIRETA_PESSOA_EMAIL'
      Origin = 'MALADIRETA_PESSOA_EMAIL'
      Size = 1
    end
  end
  object QueryEndereco: TFDQuery
    AfterOpen = QueryEnderecoAfterOpen
    BeforeInsert = QueryEnderecoBeforeInsert
    BeforeEdit = QueryEnderecoBeforeEdit
    BeforePost = QueryEnderecoBeforePost
    OnNewRecord = QueryEnderecoNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_PESSOA_ENDERECO'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_PESSOA'
    DetailFields = 'COD_PESSOA_ENDERECO'
    OnReconcileError = QueryEnderecoReconcileError
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterCliente
    FetchOptions.AssignedValues = [evCache, evDetailCascade]
    FetchOptions.DetailCascade = True
    Left = 32
    Top = 80
    object QueryEnderecoDESCRICAO_CIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CIDADE'
      Origin = 'DESCRICAO_CIDADE'
      ProviderFlags = []
      Size = 40
    end
    object QueryEnderecoCOMPLEMENTO_PESSOA_ENDERECO: TStringField
      FieldName = 'COMPLEMENTO_PESSOA_ENDERECO'
      Origin = 'COMPLEMENTO_PESSOA_ENDERECO'
      Size = 40
    end
    object QueryEnderecoENDERECO_PESSOA_ENDERECO: TStringField
      FieldName = 'ENDERECO_PESSOA_ENDERECO'
      Origin = 'ENDERECO_PESSOA_ENDERECO'
      Required = True
      Size = 100
    end
    object QueryEnderecoNUMERO_PESSOA_ENDERECO: TStringField
      FieldName = 'NUMERO_PESSOA_ENDERECO'
      Origin = 'NUMERO_PESSOA_ENDERECO'
      Size = 8
    end
    object QueryEnderecoDESCRICAO_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SIGLA_UF'
      Origin = 'DESCRICAO_UF'
      ProviderFlags = []
      Size = 40
    end
    object QueryEnderecoBAIRRO_PESSOA_ENDERECO: TStringField
      FieldName = 'BAIRRO_PESSOA_ENDERECO'
      Origin = 'BAIRRO_PESSOA_ENDERECO'
      Size = 40
    end
    object QueryEnderecoCIDADE_PESSOA_ENDERECO: TIntegerField
      FieldName = 'CIDADE_PESSOA_ENDERECO'
      Origin = 'CIDADE_PESSOA_ENDERECO'
      Required = True
    end
  end
  object QueryTelefone: TFDQuery
    BeforeInsert = QueryTelefoneBeforeInsert
    BeforeEdit = QueryTelefoneBeforeEdit
    BeforePost = QueryTelefoneBeforePost
    OnNewRecord = QueryTelefoneNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_PESSOA_TELEFONE'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_PESSOA'
    DetailFields = 'COD_PESSOA_TELEFONE'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterCliente
    FetchOptions.AssignedValues = [evCache, evDetailCascade]
    FetchOptions.DetailCascade = True
    Left = 32
    Top = 216
    object QueryTelefoneCODIGO_PESSOA_TELEFONE: TIntegerField
      FieldName = 'CODIGO_PESSOA_TELEFONE'
      Origin = 'CODIGO_PESSOA_TELEFONE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryTelefoneCOD_PESSOA_TELEFONE: TIntegerField
      FieldName = 'COD_PESSOA_TELEFONE'
      Origin = 'COD_PESSOA_TELEFONE'
      Required = True
    end
    object QueryTelefoneNUMERO_PESSOA_TELEFONE: TStringField
      FieldName = 'NUMERO_PESSOA_TELEFONE'
      Origin = 'NUMERO_PESSOA_TELEFONE'
      Size = 15
    end
    object QueryTelefoneCELULAR_PESSOA_TELEFONE: TStringField
      FieldName = 'CELULAR_PESSOA_TELEFONE'
      Origin = 'CELULAR_PESSOA_TELEFONE'
      Size = 15
    end
    object QueryTelefoneOBSERVACAO_PESSOA_TELEFONE: TStringField
      FieldName = 'OBSERVACAO_PESSOA_TELEFONE'
      Origin = 'OBSERVACAO_PESSOA_TELEFONE'
      Size = 100
    end
    object QueryTelefonePADRAO_PESSOA_TELEFONE: TStringField
      FieldName = 'PADRAO_PESSOA_TELEFONE'
      Origin = 'PADRAO_PESSOA_TELEFONE'
      Size = 1
    end
    object QueryTelefoneTIPO_PESSOA_TELEFONE: TStringField
      FieldName = 'TIPO_PESSOA_TELEFONE'
      Origin = 'TIPO_PESSOA_TELEFONE'
    end
  end
  object dsMaster: TDataSource
    DataSet = QueryCadastro
    Left = 136
    Top = 16
  end
  object FDQueryValidaCidade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 320
    Top = 200
  end
  object FDSchemaAdapterCliente: TFDSchemaAdapter
    Left = 248
    Top = 16
  end
  object FDQueryValidaUf: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 320
    Top = 256
  end
end
