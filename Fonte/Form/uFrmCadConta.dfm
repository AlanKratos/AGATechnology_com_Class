inherited frmCadConta: TfrmCadConta
  Caption = 'frmCadConta'
  ClientHeight = 273
  ClientWidth = 570
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 586
  ExplicitHeight = 312
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    Width = 570
  end
  inherited PanelLeft: TPanel
    Height = 238
  end
  object pnl1: TPanel [2]
    Left = 81
    Top = 35
    Width = 489
    Height = 238
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 493
    ExplicitHeight = 248
    object lbl1: TLabel
      Left = 6
      Top = 10
      Width = 93
      Height = 13
      Caption = 'Descri'#231#227'o da Conta'
    end
    object lbl2: TLabel
      Left = 287
      Top = 10
      Width = 67
      Height = 13
      Caption = 'Tipo de Conta'
    end
    object lbl3: TLabel
      Left = 6
      Top = 56
      Width = 29
      Height = 13
      Caption = 'Banco'
      FocusControl = dbedtDESCRICAO_BANCO
    end
    object lbl4: TLabel
      Left = 6
      Top = 101
      Width = 38
      Height = 13
      Caption = 'Ag'#234'ncia'
      FocusControl = dbedtAGENCIA_CONTA
    end
    object lbl5: TLabel
      Left = 118
      Top = 101
      Width = 84
      Height = 13
      Caption = 'N'#250'mero da Conta'
      FocusControl = dbedtNUMEROCONTA_CONTA
    end
    object lbl6: TLabel
      Left = 242
      Top = 101
      Width = 27
      Height = 13
      Caption = 'D'#237'gito'
      FocusControl = dbedtDIGITOCONTA_CONTA
    end
    object lbl7: TLabel
      Left = 76
      Top = 101
      Width = 27
      Height = 13
      Caption = 'D'#237'gito'
      FocusControl = dbedtDIGITOAGENCIA_CONTA
    end
    object lbl8: TLabel
      Left = 6
      Top = 144
      Width = 77
      Height = 13
      Caption = 'T'#237'tular da Conta'
      FocusControl = dbedtTITULAR_CONTA
    end
    object lbl9: TLabel
      Left = 288
      Top = 144
      Width = 73
      Height = 13
      Caption = 'CNPJ do T'#237'tular'
      FocusControl = dbedtCNPJ_CONTA
    end
    object lbl10: TLabel
      Left = 288
      Top = 187
      Width = 67
      Height = 13
      Caption = 'CPF do T'#237'tular'
      FocusControl = dbedtCPF_CONTA
    end
    object lbl11: TLabel
      Left = 288
      Top = 101
      Width = 48
      Height = 13
      Caption = 'Slip Conta'
      FocusControl = dbedtSLIP_CONTA
    end
    object lbl12: TLabel
      Left = 344
      Top = 59
      Width = 67
      Height = 13
      Caption = 'Compensa'#231#227'o'
      FocusControl = dbedtCAMARACOMPENSACAO_BANCO
    end
    object dbedtDESCRICAO_CONTA: TDBEdit
      Left = 6
      Top = 29
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_CONTA'
      DataSource = dsCadastro
      TabOrder = 0
    end
    object jvdbcmbxCLASSIFICACAO_CONTA: TJvDBComboBox
      Left = 287
      Top = 29
      Width = 194
      Height = 21
      DataField = 'CLASSIFICACAO_CONTA'
      DataSource = dsCadastro
      Items.Strings = (
        'Conta Caixa'
        'Conta Corrente'
        'Conta Aplica'#231#227'o')
      TabOrder = 1
      Values.Strings = (
        '1'
        '2'
        '3')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
    end
    object chckbxSTATUS_CONTA: TJvDBCheckBox
      Left = 424
      Top = 76
      Width = 49
      Height = 17
      Caption = 'Ativo'
      DataField = 'STATUS_CONTA'
      DataSource = dsCadastro
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '2'
    end
    object jvdbcmbdtBANCO_CONTA: TJvDBComboEdit
      Left = 6
      Top = 74
      Width = 65
      Height = 21
      DataField = 'BANCO_CONTA'
      DataSource = dsCadastro
      ImageKind = ikEllipsis
      TabOrder = 2
    end
    object dbedtDESCRICAO_BANCO: TDBEdit
      Left = 77
      Top = 74
      Width = 261
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_BANCO'
      DataSource = dsCadastro
      ReadOnly = True
      TabOrder = 4
    end
    object dbedtAGENCIA_CONTA: TDBEdit
      Left = 6
      Top = 117
      Width = 70
      Height = 21
      DataField = 'AGENCIA_CONTA'
      DataSource = dsCadastro
      TabOrder = 6
    end
    object dbedtNUMEROCONTA_CONTA: TDBEdit
      Left = 118
      Top = 117
      Width = 124
      Height = 21
      DataField = 'NUMEROCONTA_CONTA'
      DataSource = dsCadastro
      TabOrder = 8
    end
    object dbedtDIGITOCONTA_CONTA: TDBEdit
      Left = 242
      Top = 117
      Width = 27
      Height = 21
      DataField = 'DIGITOCONTA_CONTA'
      DataSource = dsCadastro
      TabOrder = 9
    end
    object dbedtDIGITOAGENCIA_CONTA: TDBEdit
      Left = 76
      Top = 117
      Width = 27
      Height = 21
      DataField = 'DIGITOAGENCIA_CONTA'
      DataSource = dsCadastro
      TabOrder = 7
    end
    object dbedtTITULAR_CONTA: TDBEdit
      Left = 6
      Top = 163
      Width = 263
      Height = 21
      DataField = 'TITULAR_CONTA'
      DataSource = dsCadastro
      TabOrder = 11
    end
    object dbedtCNPJ_CONTA: TDBEdit
      Left = 288
      Top = 163
      Width = 186
      Height = 21
      DataField = 'CNPJ_CONTA'
      DataSource = dsCadastro
      TabOrder = 12
    end
    object dbedtCPF_CONTA: TDBEdit
      Left = 288
      Top = 203
      Width = 186
      Height = 21
      DataField = 'CPF_CONTA'
      DataSource = dsCadastro
      TabOrder = 13
    end
    object dbedtSLIP_CONTA: TDBEdit
      Left = 288
      Top = 117
      Width = 186
      Height = 21
      DataField = 'SLIP_CONTA'
      DataSource = dsCadastro
      TabOrder = 10
    end
    object dbedtCAMARACOMPENSACAO_BANCO: TDBEdit
      Left = 344
      Top = 74
      Width = 67
      Height = 21
      TabStop = False
      DataField = 'CAMARACOMPENSACAO_BANCO'
      DataSource = dsCadastro
      ReadOnly = True
      TabOrder = 5
    end
  end
  inherited dsCadastro: TDataSource
    Left = 280
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 160
  end
end
