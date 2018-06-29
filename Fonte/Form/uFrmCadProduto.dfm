inherited frmCadProduto: TfrmCadProduto
  Caption = 'frmCadProduto'
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 681
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    inherited JvCalcEditCodigo: TJvCalcEdit
      OnClick = JvCalcEditCodigoClick
    end
  end
  inherited PanelLeft: TPanel
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
  end
  object Panel2: TPanel [2]
    Left = 81
    Top = 35
    Width = 592
    Height = 331
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object Label2: TLabel
      Left = 6
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object JvPageControl1: TJvPageControl
      Left = 1
      Top = 58
      Width = 590
      Height = 272
      ActivePage = tsPrincipal
      Align = alBottom
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'Principal'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 224
          Height = 244
          Align = alLeft
          TabOrder = 0
          object Label3: TLabel
            Left = 48
            Top = 3
            Width = 67
            Height = 13
            Caption = 'Detalhamento'
          end
          object Label4: TLabel
            Left = 8
            Top = 145
            Width = 29
            Height = 13
            Caption = 'Grupo'
          end
          object Label5: TLabel
            Left = 8
            Top = 191
            Width = 47
            Height = 13
            Caption = 'SubGrupo'
          end
          object Label6: TLabel
            Left = 8
            Top = 77
            Width = 39
            Height = 13
            Caption = 'Unidade'
          end
          object dbcbCor: TJvDBCheckBox
            Left = 8
            Top = 22
            Width = 97
            Height = 17
            Caption = 'Cor'
            DataField = 'VARIACOR_ITEM'
            DataSource = dsCadastro
            TabOrder = 0
            Visible = False
          end
          object dbcbGrade: TJvDBCheckBox
            Left = 8
            Top = 45
            Width = 97
            Height = 17
            Caption = 'Grade'
            DataField = 'VARIAGRADE_ITEM'
            DataSource = dsCadastro
            TabOrder = 1
            Visible = False
          end
          object dbeGrupo: TDBEdit
            Left = 86
            Top = 164
            Width = 133
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DESCRICAO_GRUPO'
            DataSource = dsCadastro
            ReadOnly = True
            TabOrder = 2
          end
          object dbeSubGrupo: TDBEdit
            Left = 86
            Top = 210
            Width = 133
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DESCRICAO_SUBGRUPO'
            DataSource = dsCadastro
            ReadOnly = True
            TabOrder = 3
          end
          object dblkUnidade: TJvDBLookupCombo
            Left = 8
            Top = 96
            Width = 145
            Height = 21
            DataField = 'UNIDADE_ITEM'
            DataSource = dsCadastro
            LookupField = 'CODIGO_UNIDADE'
            LookupDisplay = 'DESCRICAO_UNIDADE'
            LookupSource = dsUnidade
            TabOrder = 4
            OnCloseUp = dblkUnidadeCloseUp
          end
          object jvdbceGrupo: TJvDBComboEdit
            Left = 9
            Top = 164
            Width = 75
            Height = 21
            DataField = 'GRUPO_ITEM'
            DataSource = dsCadastro
            TabOrder = 5
          end
          object jvdbceSubGrupo: TJvDBComboEdit
            Left = 9
            Top = 210
            Width = 75
            Height = 21
            DataField = 'SUBGRUPO_ITEM'
            DataSource = dsCadastro
            TabOrder = 6
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 48
            Top = 123
            Width = 145
            Height = 21
            DataField = 'UNIDADE_ITEM'
            DataSource = dsCadastro
            KeyField = 'CODIGO_UNIDADE'
            ListField = 'DESCRICAO_UNIDADE'
            ListSource = dsUnidade
            TabOrder = 7
          end
        end
        object Panel4: TPanel
          Left = 225
          Top = 0
          Width = 357
          Height = 244
          Align = alRight
          TabOrder = 1
          object Label7: TLabel
            Left = 136
            Top = 3
            Width = 51
            Height = 13
            Caption = 'Tributa'#231#227'o'
          end
          object Label8: TLabel
            Left = 5
            Top = 135
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
          end
          object Label9: TLabel
            Left = 5
            Top = 23
            Width = 22
            Height = 13
            Caption = 'NCM'
          end
          object Label10: TLabel
            Left = 5
            Top = 69
            Width = 89
            Height = 13
            Caption = 'Tipo de Tributa'#231#227'o'
          end
          object dbmObservacao: TDBMemo
            Left = 1
            Top = 154
            Width = 355
            Height = 89
            Align = alBottom
            DataField = 'OBSERVACAO_ITEM'
            DataSource = dsCadastro
            TabOrder = 0
            OnKeyPress = dbmObservacaoKeyPress
          end
          object jvdbceCodNcm: TJvDBComboEdit
            Left = 5
            Top = 42
            Width = 84
            Height = 21
            DataField = 'NCM_ITEM'
            DataSource = dsCadastro
            TabOrder = 1
          end
          object dbeNcm: TDBEdit
            Left = 92
            Top = 42
            Width = 141
            Height = 21
            DataField = 'COD_NCM'
            DataSource = dsCadastro
            ReadOnly = True
            TabOrder = 2
          end
          object jvdbcbTipoTributacao: TJvDBComboBox
            Left = 5
            Top = 88
            Width = 145
            Height = 21
            DataField = 'TRIBUTACAO_ITEM'
            DataSource = dsCadastro
            Items.Strings = (
              'Tributado'
              'N'#227'o Tributado'
              'Substitui'#231#227'o Tribut'#225'ria'
              'Isento')
            TabOrder = 3
            Values.Strings = (
              '1'
              '2'
              '3'
              '4')
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
        end
      end
      object tsDetalhamento: TTabSheet
        Caption = 'Detalhamento'
        ImageIndex = 1
      end
    end
    object dbeDESCRICAO_ITEM: TDBEdit
      Left = 6
      Top = 27
      Width = 249
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_ITEM'
      DataSource = dsCadastro
      TabOrder = 1
    end
  end
  object dsItemDetalhe: TDataSource
    DataSet = dmCadProduto.QueryItemDetalhe
    Left = 568
  end
  object dsUnidade: TDataSource
    DataSet = dmCadProduto.QueryUnidade
    Left = 208
  end
end
