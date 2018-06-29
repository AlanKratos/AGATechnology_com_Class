inherited dmCadCidade: TdmCadCidade
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 224
  Width = 295
  inherited QueryCadastro: TFDQuery
    AfterOpen = QueryCadastroAfterOpen
  end
  object FDQueryValidaUf: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 64
    Top = 152
  end
end
