object dmCadPai: TdmCadPai
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QueryCadastro: TFDQuery
    BeforePost = QueryCadastroBeforePost
    AfterPost = QueryCadastroAfterPost
    Connection = dmConexao.FDConexao
    Left = 64
    Top = 24
  end
  object QueryNavegar: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 64
    Top = 88
  end
end
