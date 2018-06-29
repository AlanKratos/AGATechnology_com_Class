inherited frmConsultaCliente: TfrmConsultaCliente
  Caption = 'frmConsultaCliente'
  ClientHeight = 298
  ClientWidth = 486
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 502
  ExplicitHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPesquisar: TSpeedButton
    Left = 218
    Top = 98
    ExplicitLeft = 218
    ExplicitTop = 98
  end
  inherited dbgConsulta: TDBGrid
    Top = 125
    Width = 486
    Height = 173
    DataSource = dsConsulta
    ReadOnly = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_PESSOA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PESSOA'
        Title.Caption = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ_PESSOA'
        Title.Caption = 'CNPJ'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF_PESSOA'
        Title.Caption = 'CPF'
        Width = 100
        Visible = True
      end>
  end
  inherited leConsulta: TLabeledEdit
    Top = 98
    CharCase = ecUpperCase
    EditLabel.ExplicitTop = 82
    ExplicitTop = 98
  end
  inherited cbCampoConsulta: TJvDBComboBox
    Items.Strings = (
      'C'#243'digo'
      'Nome'
      'CNPJ'
      'CPF')
    ReadOnly = True
  end
  inherited cbCriterioConsulta: TJvDBComboBox
    ReadOnly = True
  end
  inherited dsConsulta: TDataSource
    DataSet = FDQueryConsulta
    Left = 416
    Top = 64
  end
  inherited FDQueryConsulta: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select '
      '    PESSOA.CODIGO_PESSOA,'
      '    PESSOA.NOME_PESSOA,'
      '    PESSOA.FANTASIA_PESSOA,'
      '    PESSOA.TIPO_PESSOA,'
      '    PESSOA.OBSERVACAO_PESSOA,'
      '    PESSOA.TELEFONE_PESSOA,'
      '    PESSOA.EMAIL_PESSOA,'
      '    PESSOA.ENDERECO_PESSOA,'
      '    PESSOA.PLANODECONTAS_PESSOA,'
      '    PESSOA.GRUPOCLIENTES_PESSOA,'
      '    PESSOA.STATUS_PESSOA,'
      '    PESSOA.TRIBUTACAO_PESSOA,'
      '    PESSOA.NOMEFANTASIA_PESSOA,'
      '    PESSOA.USUARIOALTERACAO_PESSOA,'
      '    PESSOA.USUARIOINCLUSAO_PESSOA,'
      '    PESSOA.CPF_PESSOA,'
      '    PESSOA.CNPJ_PESSOA,'
      '    PESSOA.RG_PESSOA,'
      '    PESSOA.IE_PESSOA,'
      '    PESSOA.CLIENTE_PESSOA,'
      '    PESSOA.FORNECEDOR_PESSOA,'
      '    PESSOA.FUNCIONARIO_PESSOA'
      'from PESSOA')
    Left = 416
    Top = 8
  end
end
