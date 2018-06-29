inherited frmCadVenda: TfrmCadVenda
  Caption = 'frmCadVenda'
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
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
    object pcCadVenda: TJvPageControl
      Left = 1
      Top = 1
      Width = 590
      Height = 329
      ActivePage = tsPrincipal
      Align = alClient
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'Principal'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label2: TLabel
          Left = 6
          Top = 10
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object Label3: TLabel
          Left = 319
          Top = 10
          Width = 77
          Height = 13
          Caption = 'Tabela de Pre'#231'o'
        end
        object dbceCodPessoa: TJvDBComboEdit
          Left = 6
          Top = 29
          Width = 71
          Height = 21
          DataField = 'CLIENTE_DOCUMENTO'
          DataSource = dsCadastro
          ImageKind = ikEllipsis
          TabOrder = 0
          OnButtonClick = dbceCodPessoaButtonClick
        end
        object dbePessoa: TDBEdit
          Left = 79
          Top = 29
          Width = 234
          Height = 21
          DataField = 'NOME_PESSOA'
          DataSource = dsCadastro
          ReadOnly = True
          TabOrder = 1
        end
        object dbgItens: TJvDBGrid
          Left = 0
          Top = 137
          Width = 582
          Height = 164
          Align = alBottom
          DataSource = dsItens
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyPress = dbgItensKeyPress
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          OnCanEditCell = dbgItensCanEditCell
          Columns = <
            item
              Expanded = False
              FieldName = 'ITEM_DOC_ITEM'
              Title.Alignment = taCenter
              Title.Caption = 'Cod. Item'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO_ITEM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Item'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD_DOC_ITEM'
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_DOC_ITEM'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Width = 100
              Visible = True
            end>
        end
        object dblucbTabelaPreco: TDBLookupComboBox
          Left = 319
          Top = 29
          Width = 170
          Height = 21
          DataField = 'TABELA_DOCUMENTO'
          DataSource = dsCadastro
          KeyField = 'CODIGO_TABELA'
          ListField = 'DESCRICAO_TABELA'
          ListSource = dsTabelaPreco
          TabOrder = 3
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    Left = 296
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 232
  end
  object dsItens: TDataSource
    DataSet = dmCadVenda.FDQueryVendaItem
    Left = 169
    Top = 3
  end
  object dsTabelaPreco: TDataSource
    DataSet = dmCadVenda.FDQueryTabelaPreco
    Left = 568
  end
end
