inherited dmCadVenda: TdmCadVenda
  OldCreateOrder = True
  Height = 365
  Width = 401
  inherited QueryCadastro: TFDQuery
    Left = 48
  end
  inherited QueryNavegar: TFDQuery
    Left = 312
    Top = 80
  end
  object FDSchemaAdapterVenda: TFDSchemaAdapter
    Left = 200
    Top = 16
  end
  object FDQueryVendaItem: TFDQuery
    BeforeInsert = FDQueryVendaItemBeforeInsert
    BeforeEdit = FDQueryVendaItemBeforeEdit
    BeforePost = FDQueryVendaItemBeforePost
    AfterDelete = FDQueryVendaItemAfterDelete
    OnNewRecord = FDQueryVendaItemNewRecord
    CachedUpdates = True
    IndexFieldNames = 'DOCUMENTO_DOC_ITEM'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_DOCUMENTO'
    DetailFields = 'DOCUMENTO_DOC_ITEM'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterVenda
    SQL.Strings = (
      'select '
      '    DOCUMENTO_ITEM.CODIGO_DOC_ITEM,'
      '    DOCUMENTO_ITEM.DOCUMENTO_DOC_ITEM,'
      '    DOCUMENTO_ITEM.ITEM_DOC_ITEM,'
      '    DOCUMENTO_ITEM.QTD_DOC_ITEM,'
      '    DOCUMENTO_ITEM.VALOR_DOC_ITEM,'
      '    ITEM.CODIGO_ITEM,'
      '    ITEM.DESCRICAO_ITEM'
      'from DOCUMENTO_ITEM'
      
        'left join ITEM on (ITEM.CODIGO_ITEM = DOCUMENTO_ITEM.ITEM_DOC_IT' +
        'EM)'
      'where DOCUMENTO_ITEM.DOCUMENTO_DOC_ITEM = :CODIGO_DOCUMENTO')
    Left = 48
    Top = 88
    ParamData = <
      item
        Name = 'CODIGO_DOCUMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryVendaItemCODIGO_DOC_ITEM: TIntegerField
      FieldName = 'CODIGO_DOC_ITEM'
      Origin = 'CODIGO_DOC_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryVendaItemDOCUMENTO_DOC_ITEM: TIntegerField
      FieldName = 'DOCUMENTO_DOC_ITEM'
      Origin = 'DOCUMENTO_DOC_ITEM'
      Required = True
    end
    object FDQueryVendaItemITEM_DOC_ITEM: TIntegerField
      FieldName = 'ITEM_DOC_ITEM'
      Origin = 'ITEM_DOC_ITEM'
      Required = True
    end
    object FDQueryVendaItemQTD_DOC_ITEM: TIntegerField
      FieldName = 'QTD_DOC_ITEM'
      Origin = 'QTD_DOC_ITEM'
      Required = True
    end
    object FDQueryVendaItemVALOR_DOC_ITEM: TBCDField
      FieldName = 'VALOR_DOC_ITEM'
      Origin = 'VALOR_DOC_ITEM'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object FDQueryVendaItemCODIGO_ITEM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_ITEM'
      Origin = 'CODIGO_ITEM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryVendaItemDESCRICAO_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'DESCRICAO_ITEM'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsMaster: TDataSource
    Left = 320
    Top = 8
  end
  object FDQueryValidaCliente: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 152
    Top = 200
  end
  object FDQueryValidaItem: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 160
    Top = 144
  end
  object FDQueryValidaPreco: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 208
  end
  object FDQueryTabelaPreco: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select '
      '    TABELA.DESCRICAO_TABELA,'
      '    TABELA.CODIGO_TABELA'
      'from TABELA')
    Left = 48
    Top = 144
  end
end
