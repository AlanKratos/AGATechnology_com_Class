inherited dmCadEmpresa: TdmCadEmpresa
  OldCreateOrder = True
  Height = 203
  Width = 329
  object FDQueryValidaCidade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 48
    Top = 80
  end
  object FDQueryValidaUf: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 16
  end
  object FDSchemaAdapterEmpresa: TFDSchemaAdapter
    Left = 168
    Top = 80
  end
end
