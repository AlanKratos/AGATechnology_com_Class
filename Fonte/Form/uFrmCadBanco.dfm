inherited frmCadBanco: TfrmCadBanco
  Caption = 'Cadastro de Banco'
  ClientHeight = 271
  ClientWidth = 554
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 562
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    Width = 554
    ExplicitWidth = 554
  end
  inherited PanelLeft: TPanel
    Height = 236
    ExplicitHeight = 236
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
      ExplicitTop = 80
    end
  end
  object pnl1: TPanel [2]
    Left = 81
    Top = 35
    Width = 473
    Height = 240
    TabOrder = 2
    object lbl1: TLabel
      Left = 5
      Top = 13
      Width = 46
      Height = 13
      Caption = 'Descricao'
      FocusControl = dbedtDESCRICAO_BANCO
    end
    object lbl2: TLabel
      Left = 5
      Top = 56
      Width = 71
      Height = 13
      Caption = 'C'#226'mara Comp.'
      FocusControl = dbedtCAMARACOMPENSACAO_BANCO
    end
    object lbl3: TLabel
      Left = 88
      Top = 56
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object spbtnIncluir: TSpeedButton
      Left = 12
      Top = 115
      Width = 64
      Height = 22
      Caption = 'Incluir'
      OnClick = spbtnIncluirClick
    end
    object spbtnExcluir: TSpeedButton
      Left = 12
      Top = 143
      Width = 64
      Height = 22
      Caption = 'Excluir'
      OnClick = spbtnExcluirClick
    end
    object dbedtDESCRICAO_BANCO: TDBEdit
      Left = 5
      Top = 29
      Width = 364
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_BANCO'
      DataSource = dsCadastro
      TabOrder = 0
    end
    object dbedtCAMARACOMPENSACAO_BANCO: TDBEdit
      Left = 5
      Top = 72
      Width = 71
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CAMARACOMPENSACAO_BANCO'
      DataSource = dsCadastro
      TabOrder = 1
    end
    object chckbxSTATUS_BANCO: TJvDBCheckBox
      Left = 88
      Top = 75
      Width = 49
      Height = 17
      Caption = 'Ativo'
      DataField = 'STATUS_BANCO'
      DataSource = dsCadastro
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '2'
    end
    object JvDBImageLogo: TJvDBImage
      Left = 88
      Top = 109
      Width = 369
      Height = 108
      DataField = 'LOGO_BANCO'
      DataSource = dsCadastro
      Proportional = True
      TabOrder = 3
    end
  end
  inherited dsCadastro: TDataSource
    Left = 336
  end
  object dlgOpenPic: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.cur;*.pcx;*.ani;*.png_old;*.gif;*.png;*.jpg;*.jpeg;' +
      '*.bmp;*.tif;*.tiff;*.ico;*.emf;*.wmf)|*.gif;*.cur;*.pcx;*.ani;*.' +
      'png_old;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.ico;*.emf;' +
      '*.wmf|CompuServe GIF Image (*.gif)|*.gif|Portable Network Graphi' +
      'cs (*.png_old)|*.png_old|GIF Image (*.gif)|*.gif|Portable Networ' +
      'k Graphics (*.png)|*.png|JPEG Image File (*.jpg)|*.jpg|JPEG Imag' +
      'e File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|TIFF Images (*.tiff' +
      ')|*.tiff|Icons (*.ico)|*.ico|Metafiles (*.wmf)|*.wmf'
    Left = 232
  end
end
