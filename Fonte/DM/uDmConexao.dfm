object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 339
  Width = 384
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=D:\Sistema\AGATechnology_com_class\Banco\SISTEMA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=iSO8859_1'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3054'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 128
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 24
  end
  object FDQueryProximoCodigo: TFDQuery
    Connection = FDConexao
    Transaction = FDTransactionProximoCodigo
    UpdateTransaction = FDTransactionProximoCodigo
    Left = 48
    Top = 104
  end
  object FDTransactionProximoCodigo: TFDTransaction
    Connection = FDConexao
    Left = 56
    Top = 176
  end
end
