inherited frmCadCidade: TfrmCadCidade
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Cidades'
  ClientHeight = 244
  ClientWidth = 501
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 509
  ExplicitHeight = 271
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    Width = 501
    ExplicitWidth = 501
    inherited Panel1: TPanel
      Left = 359
      ExplicitLeft = 359
    end
  end
  inherited PanelLeft: TPanel
    Height = 209
    ExplicitHeight = 209
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
    inherited BitBtnPesquisar: TSpeedButton
      ExplicitLeft = 2
    end
  end
  object Panel2: TPanel [2]
    Left = 81
    Top = 35
    Width = 420
    Height = 209
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 6
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label3: TLabel
      Left = 6
      Top = 64
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label4: TLabel
      Left = 6
      Top = 118
      Width = 94
      Height = 13
      Caption = 'C'#243'digo do Munic'#237'pio'
    end
    object dbeDescCidade: TDBEdit
      Left = 6
      Top = 33
      Width = 403
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_CIDADE'
      DataSource = dsCadastro
      TabOrder = 0
    end
    object dbeDescUf: TDBEdit
      Left = 141
      Top = 83
      Width = 268
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_UF'
      DataSource = dsCadastro
      ReadOnly = True
      TabOrder = 1
    end
    object jvdbcmbdtUF_CIDADE: TJvDBComboEdit
      Left = 6
      Top = 83
      Width = 67
      Height = 21
      DataField = 'UF_CIDADE'
      DataSource = dsCadastro
      ImageKind = ikEllipsis
      ButtonWidth = 16
      TabOrder = 2
    end
    object dbeCodMunicipio: TDBEdit
      Left = 6
      Top = 137
      Width = 121
      Height = 21
      DataField = 'CODMUNICIPIO_CIDADE'
      DataSource = dsCadastro
      TabOrder = 3
    end
    object dbeSiglaUf: TDBEdit
      Left = 79
      Top = 83
      Width = 56
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'SIGLA_UF'
      DataSource = dsCadastro
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited dsCadastro: TDataSource
    Left = 160
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 224
  end
end
