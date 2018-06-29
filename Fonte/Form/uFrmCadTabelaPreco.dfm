inherited frmCadTabelaPreco: TfrmCadTabelaPreco
  Caption = 'frmCadTabelaPreco'
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
    object pcTabelaPreco: TJvPageControl
      Left = 1
      Top = 1
      Width = 590
      Height = 329
      ActivePage = tsPrincipal
      Align = alClient
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'tsPrincipal'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label2: TLabel
          Left = 0
          Top = 3
          Width = 96
          Height = 13
          Caption = 'Descri'#231#227'o da Tabela'
        end
        object dbeDescricaoTabela: TDBEdit
          Left = 0
          Top = 22
          Width = 235
          Height = 21
          DataField = 'DESCRICAO_TABELA'
          DataSource = dsCadastro
          TabOrder = 0
        end
        object dbgItens: TJvDBGrid
          Left = 0
          Top = 139
          Width = 582
          Height = 162
          Align = alBottom
          DataSource = dsItens
          TabOrder = 1
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
              FieldName = 'ITEM_TAB_DET'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Item'
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
              FieldName = 'VALOR_TAB_DET'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Width = 100
              Visible = True
            end>
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    Left = 256
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 176
  end
  object dsItens: TDataSource
    DataSet = dmCadTabelaPreco.FDQueryTabela_Detalhe
    Left = 560
  end
end
