inherited dmCadProduto: TdmCadProduto
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 348
  Width = 263
  inherited QueryCadastro: TFDQuery
    CachedUpdates = True
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = False
    Left = 48
    object QueryCadastroCODIGO_ITEM: TIntegerField
      FieldName = 'CODIGO_ITEM'
      Origin = 'CODIGO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryCadastroTIPO_ITEM: TIntegerField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
    end
    object QueryCadastroDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'DESCRICAO_ITEM'
      Required = True
      Size = 100
    end
    object QueryCadastroCODIGOBARRAS_ITEM: TStringField
      FieldName = 'CODIGOBARRAS_ITEM'
      Origin = 'CODIGOBARRAS_ITEM'
    end
    object QueryCadastroCOLECAO_ITEM: TIntegerField
      FieldName = 'COLECAO_ITEM'
      Origin = 'COLECAO_ITEM'
    end
    object QueryCadastroKIT_ITEM: TStringField
      FieldName = 'KIT_ITEM'
      Origin = 'KIT_ITEM'
      Size = 1
    end
    object QueryCadastroCONTROLAESTOQUE_ITEM: TStringField
      FieldName = 'CONTROLAESTOQUE_ITEM'
      Origin = 'CONTROLAESTOQUE_ITEM'
      Size = 1
    end
    object QueryCadastroDTINCLUSAO_ITEM: TSQLTimeStampField
      FieldName = 'DTINCLUSAO_ITEM'
      Origin = 'DTINCLUSAO_ITEM'
    end
    object QueryCadastroDTALTERACAO_ITEM: TSQLTimeStampField
      FieldName = 'DTALTERACAO_ITEM'
      Origin = 'DTALTERACAO_ITEM'
    end
    object QueryCadastroNOMEREDUZIDO_ITEM: TStringField
      FieldName = 'NOMEREDUZIDO_ITEM'
      Origin = 'NOMEREDUZIDO_ITEM'
      Size = 13
    end
    object QueryCadastroVALIDADE_ITEM: TIntegerField
      FieldName = 'VALIDADE_ITEM'
      Origin = 'VALIDADE_ITEM'
    end
    object QueryCadastroVARIATECIDO_ITEM: TStringField
      FieldName = 'VARIATECIDO_ITEM'
      Origin = 'VARIATECIDO_ITEM'
      Size = 1
    end
    object QueryCadastroVARIAACABAMENTO_ITEM: TStringField
      FieldName = 'VARIAACABAMENTO_ITEM'
      Origin = 'VARIAACABAMENTO_ITEM'
      Size = 1
    end
    object QueryCadastroEMPILHAMENTOMAXIMO_ITEM: TIntegerField
      FieldName = 'EMPILHAMENTOMAXIMO_ITEM'
      Origin = 'EMPILHAMENTOMAXIMO_ITEM'
    end
    object QueryCadastroFABRICACAOPROPRIA_ITEM: TStringField
      FieldName = 'FABRICACAOPROPRIA_ITEM'
      Origin = 'FABRICACAOPROPRIA_ITEM'
      Size = 1
    end
    object QueryCadastroGRUPO_ITEM: TIntegerField
      FieldName = 'GRUPO_ITEM'
      Origin = 'GRUPO_ITEM'
    end
    object QueryCadastroSUBGRUPO_ITEM: TIntegerField
      FieldName = 'SUBGRUPO_ITEM'
      Origin = 'SUBGRUPO_ITEM'
    end
    object QueryCadastroFATURA_ITEM: TStringField
      FieldName = 'FATURA_ITEM'
      Origin = 'FATURA_ITEM'
      Size = 1
    end
    object QueryCadastroNCM_ITEM: TIntegerField
      FieldName = 'NCM_ITEM'
      Origin = 'NCM_ITEM'
    end
    object QueryCadastroPERCENTUALIMPORTACAO_ITEM: TCurrencyField
      FieldName = 'PERCENTUALIMPORTACAO_ITEM'
      Origin = 'PERCENTUALIMPORTACAO_ITEM'
    end
    object QueryCadastroPESOBRUTO_ITEM: TBCDField
      FieldName = 'PESOBRUTO_ITEM'
      Origin = 'PESOBRUTO_ITEM'
      Precision = 18
      Size = 3
    end
    object QueryCadastroPESOLIQUIDO_ITEM: TBCDField
      FieldName = 'PESOLIQUIDO_ITEM'
      Origin = 'PESOLIQUIDO_ITEM'
      Precision = 18
      Size = 3
    end
    object QueryCadastroREGISTROEAN_ITEM: TStringField
      FieldName = 'REGISTROEAN_ITEM'
      Origin = 'REGISTROEAN_ITEM'
      Size = 1
    end
    object QueryCadastroSTATUS_ITEM: TIntegerField
      FieldName = 'STATUS_ITEM'
      Origin = 'STATUS_ITEM'
      Required = True
    end
    object QueryCadastroREFERENCIA_ITEM: TStringField
      FieldName = 'REFERENCIA_ITEM'
      Origin = 'REFERENCIA_ITEM'
    end
    object QueryCadastroPRODUTO_ITEM: TIntegerField
      FieldName = 'PRODUTO_ITEM'
      Origin = 'PRODUTO_ITEM'
      Required = True
    end
    object QueryCadastroVARIACOR_ITEM: TBooleanField
      FieldName = 'VARIACOR_ITEM'
      Origin = 'VARIACOR_ITEM'
      Required = True
    end
    object QueryCadastroVARIAGRADE_ITEM: TBooleanField
      FieldName = 'VARIAGRADE_ITEM'
      Origin = 'VARIAGRADE_ITEM'
      Required = True
    end
    object QueryCadastroUNIDADE_ITEM: TIntegerField
      FieldName = 'UNIDADE_ITEM'
      Origin = 'UNIDADE_ITEM'
      Required = True
    end
    object QueryCadastroOBSERVACAO_ITEM: TMemoField
      FieldName = 'OBSERVACAO_ITEM'
      Origin = 'OBSERVACAO_ITEM'
      BlobType = ftMemo
    end
    object QueryCadastroTRIBUTACAO_ITEM: TIntegerField
      FieldName = 'TRIBUTACAO_ITEM'
      Origin = 'TRIBUTACAO_ITEM'
      Required = True
    end
    object QueryCadastroCONTROLACOR_ITEM: TStringField
      FieldName = 'CONTROLACOR_ITEM'
      Origin = 'CONTROLACOR_ITEM'
      Size = 1
    end
    object QueryCadastroCONTROLAGRADE_ITEM: TStringField
      FieldName = 'CONTROLAGRADE_ITEM'
      Origin = 'CONTROLAGRADE_ITEM'
      Size = 1
    end
    object QueryCadastroDESCRICAO_UNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_UNIDADE'
      Origin = 'DESCRICAO_UNIDADE'
      ProviderFlags = []
    end
    object QueryCadastroCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 0
    end
    object QueryCadastroDESCRICAO_GRUPO: TStringField
      FieldName = 'DESCRICAO_GRUPO'
    end
    object QueryCadastroDESCRICAO_SUBGRUPO: TStringField
      FieldName = 'DESCRICAO_SUBGRUPO'
    end
  end
  inherited QueryNavegar: TFDQuery
    Left = 48
    Top = 256
  end
  object QueryItemDetalhe: TFDQuery
    BeforeInsert = QueryItemDetalheBeforeInsert
    BeforeEdit = QueryItemDetalheBeforeEdit
    BeforePost = QueryItemDetalheBeforePost
    OnNewRecord = QueryItemDetalheNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_ITEM_DETALHE'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_ITEM'
    DetailFields = 'COD_ITEM_DETALHE'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterProduto
    Left = 48
    Top = 88
    object QueryItemDetalheCODIGO_ITEM_DETALHE: TIntegerField
      FieldName = 'CODIGO_ITEM_DETALHE'
      Origin = 'CODIGO_ITEM_DETALHE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryItemDetalheCOD_ITEM_DETALHE: TIntegerField
      FieldName = 'COD_ITEM_DETALHE'
      Origin = 'COD_ITEM_DETALHE'
      Required = True
    end
    object QueryItemDetalheCOR_ITEM_DETALHE: TIntegerField
      FieldName = 'COR_ITEM_DETALHE'
      Origin = 'COR_ITEM_DETALHE'
      Required = True
    end
    object QueryItemDetalheGRADE_ITEM_DETALHE: TIntegerField
      FieldName = 'GRADE_ITEM_DETALHE'
      Origin = 'GRADE_ITEM_DETALHE'
      Required = True
    end
    object QueryItemDetalheTECIDO_ITEM_DETALHE: TIntegerField
      FieldName = 'TECIDO_ITEM_DETALHE'
      Origin = 'TECIDO_ITEM_DETALHE'
    end
    object QueryItemDetalheSTATUS_ITEM_DETALHE: TIntegerField
      FieldName = 'STATUS_ITEM_DETALHE'
      Origin = 'STATUS_ITEM_DETALHE'
      Required = True
    end
    object QueryItemDetalheCODIGOBARRAS_ITEM_DETALHE: TStringField
      FieldName = 'CODIGOBARRAS_ITEM_DETALHE'
      Origin = 'CODIGOBARRAS_ITEM_DETALHE'
      Size = 13
    end
    object QueryItemDetalheINCLUSAO_ITEM_DETALHE: TSQLTimeStampField
      FieldName = 'INCLUSAO_ITEM_DETALHE'
      Origin = 'INCLUSAO_ITEM_DETALHE'
    end
    object QueryItemDetalheALTERACAO_ITEM_DETALHE: TSQLTimeStampField
      FieldName = 'ALTERACAO_ITEM_DETALHE'
      Origin = 'ALTERACAO_ITEM_DETALHE'
    end
    object QueryItemDetalheUSUARIOINCLUSAO_ITEM_DETALHE: TStringField
      FieldName = 'USUARIOINCLUSAO_ITEM_DETALHE'
      Origin = 'USUARIOINCLUSAO_ITEM_DETALHE'
    end
    object QueryItemDetalheUSUARIOALTERACAO_ITEM_DETALHE: TStringField
      FieldName = 'USUARIOALTERACAO_ITEM_DETALHE'
      Origin = 'USUARIOALTERACAO_ITEM_DETALHE'
    end
  end
  object FDSchemaAdapterProduto: TFDSchemaAdapter
    Left = 176
    Top = 80
  end
  object dsMaster: TDataSource
    DataSet = QueryCadastro
    Left = 176
    Top = 24
  end
  object QueryUnidade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 48
    Top = 160
    object QueryUnidadeCODIGO_UNIDADE: TIntegerField
      FieldName = 'CODIGO_UNIDADE'
      Origin = 'CODIGO_UNIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryUnidadeDESCRICAO_UNIDADE: TStringField
      FieldName = 'DESCRICAO_UNIDADE'
      Origin = 'DESCRICAO_UNIDADE'
      Required = True
    end
  end
  object QueryValidaGrupo: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 160
  end
  object QueryValidaSubGrupo: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 216
  end
  object QueryValida_Ncm: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 280
  end
end
