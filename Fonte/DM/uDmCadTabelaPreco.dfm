inherited dmCadTabelaPreco: TdmCadTabelaPreco
  OldCreateOrder = True
  Height = 219
  Width = 269
  object FDQueryTabela_Detalhe: TFDQuery
    BeforeInsert = FDQueryTabela_DetalheBeforeInsert
    BeforeEdit = FDQueryTabela_DetalheBeforeEdit
    BeforePost = FDQueryTabela_DetalheBeforePost
    BeforeDelete = FDQueryTabela_DetalheBeforeDelete
    OnNewRecord = FDQueryTabela_DetalheNewRecord
    CachedUpdates = True
    MasterSource = dsMaster
    MasterFields = 'CODIGO_TABELA'
    OnReconcileError = FDQueryTabela_DetalheReconcileError
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterTabelaPreco
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select '
      '    TABELA_DETALHE.CODIGO_TAB_DET,'
      '    TABELA_DETALHE.TABELA_TAB_DET,'
      '    TABELA_DETALHE.ITEM_TAB_DET,'
      '    TABELA_DETALHE.VALOR_TAB_DET,'
      '    ITEM.DESCRICAO_ITEM'
      'from TABELA_DETALHE'
      
        'inner join TABELA ON (TABELA.CODIGO_TABELA = TABELA_DETALHE.TABE' +
        'LA_TAB_DET)'
      
        'left join ITEM ON (ITEM.CODIGO_ITEM = TABELA_DETALHE.ITEM_TAB_DE' +
        'T)'
      'where TABELA_DETALHE.TABELA_TAB_DET = :CODIGO_TABELA')
    Left = 40
    Top = 88
    ParamData = <
      item
        Name = 'CODIGO_TABELA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryTabela_DetalheCODIGO_TAB_DET: TIntegerField
      FieldName = 'CODIGO_TAB_DET'
      Origin = 'CODIGO_TAB_DET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryTabela_DetalheTABELA_TAB_DET: TIntegerField
      FieldName = 'TABELA_TAB_DET'
      Origin = 'TABELA_TAB_DET'
      Required = True
    end
    object FDQueryTabela_DetalheITEM_TAB_DET: TLargeintField
      FieldName = 'ITEM_TAB_DET'
      Origin = 'ITEM_TAB_DET'
      Required = True
    end
    object FDQueryTabela_DetalheVALOR_TAB_DET: TBCDField
      FieldName = 'VALOR_TAB_DET'
      Origin = 'VALOR_TAB_DET'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object FDQueryTabela_DetalheDESCRICAO_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'DESCRICAO_ITEM'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsMaster: TDataSource
    Left = 128
    Top = 24
  end
  object FDSchemaAdapterTabelaPreco: TFDSchemaAdapter
    Left = 168
    Top = 128
  end
  object FDQueryValidaItem: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 160
  end
end
