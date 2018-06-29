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
