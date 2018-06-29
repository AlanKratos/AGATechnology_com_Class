unit uFrmCadVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadVenda, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.DBCtrls, JvDBControls, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  unitVarGlobal, uFrmConsultaCliente, JvExStdCtrls, JvCombobox, JvDBCombobox;

type
  TfrmCadVenda = class(TfrmCadPai)
    Panel2: TPanel;
    dsItens: TDataSource;
    pcCadVenda: TJvPageControl;
    tsPrincipal: TTabSheet;
    dbceCodPessoa: TJvDBComboEdit;
    dbePessoa: TDBEdit;
    Label2: TLabel;
    dbgItens: TJvDBGrid;
    Label3: TLabel;
    dsTabelaPreco: TDataSource;
    dblucbTabelaPreco: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure dbceCodPessoaButtonClick(Sender: TObject);
    procedure dbgItensKeyPress(Sender: TObject; var Key: Char);
    procedure dbgItensCanEditCell(Grid: TJvDBGrid; Field: TField;
      var AllowEdit: Boolean);
    procedure FormPaint(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    procedure DBComboBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure DBComboBox1Click(Sender: TObject);
    procedure DBComboBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBComboBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure SpeedButtonPrimeiroClick(Sender: TObject);


  private

    { Private declarations }
    procedure LimparCache (Sender :TObject);
    //procedure RetornaCodCliente(Sender: TObject);
  public
    { Public declarations }
//    property pCodigoConsulta: String Read FCodigoConsulta;
    Var
      vCodigoConsulta: String;
  end;

var
  frmCadVenda: TfrmCadVenda;

implementation

{$R *.dfm}

procedure TfrmCadVenda.BitBtnCancelarClick(Sender: TObject);
begin
  dmCadVenda.FDSchemaAdapterVenda.CancelUpdates;
  inherited;
end;

procedure TfrmCadVenda.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadVenda do
      Begin
        QueryCadastro.Delete;
        FDSchemaAdapterVenda.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

  inherited;
end;

procedure TfrmCadVenda.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbceCodPessoa.SetFocus;
  dmCadVenda.QueryCadastro.FieldByName('EMPRESA_DOCUMENTO').AsInteger := varpubCodEmpresa;
end;

procedure TfrmCadVenda.BitBtnSalvarClick(Sender: TObject);
begin
  try
    with dmCadVenda do
    begin
      FDSchemaAdapterVenda.ApplyUpdates(0);
      JvCalcEditCodigo.Text := QueryCadastro.FieldByName('CODIGO_DOCUMENTO').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

  inherited;
end;

procedure TfrmCadVenda.dbceCodPessoaButtonClick(Sender: TObject);
begin
  inherited;
  if (JvCalcEditCodigo.Value <> 0) or (dmCadVenda.QueryCadastro.State = dsInsert) then
  Begin
    if frmConsultaCliente = nil then
    frmConsultaCliente := TfrmConsultaCliente.Create(self);
    if frmConsultaCliente.WindowState = wsMinimized then
    frmConsultaCliente.WindowState := wsNormal
    else
    frmConsultaCliente.Show;
  End
  else
  Abort;
end;

procedure TfrmCadVenda.DBComboBox1Click(Sender: TObject);
begin
  inherited;
ShowMessage('44444444TESTE');
end;

procedure TfrmCadVenda.DBComboBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
ShowMessage('66666TESTE');
end;

procedure TfrmCadVenda.DBComboBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
ShowMessage('5555TESTE');
end;

procedure TfrmCadVenda.DBComboBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
ShowMessage('333333333TESTE');
end;

procedure TfrmCadVenda.DBComboBox1DropDown(Sender: TObject);
begin
  inherited;
//ShowMessage('77777TESTE');
dmCadVenda.QueryCadastro.Edit;
dmCadVenda.FDQueryVendaItem.Edit;
end;

procedure TfrmCadVenda.DBComboBox1Enter(Sender: TObject);
begin
  inherited;
ShowMessage('22222TESTE');
end;

procedure TfrmCadVenda.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
ShowMessage('1111TESTE');
end;

procedure TfrmCadVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadVenda := nil;
end;

procedure TfrmCadVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadVenda := TdmCadVenda.Create(self); // Instanciar DM
//  self.tabela := 'DOCUMENTO';
//  self.campochave := 'CODIGO_DOCUMENTO';
//  self.TipoPessoa := 'MODALIDADE_DOCUMENTO = 1';
//  self.fdmCadPai := dmCadVenda;

  with dmCadVenda do
  begin
    QueryCadastro.Close;
    QueryCadastro.Open;
    FDQueryVendaItem.Close;
    FDQueryVendaItem.Open;
    FDQueryTabelaPreco.Close;
    FDQueryTabelaPreco.Open;
  end;

//  pcCadVenda.ActivePageIndex := 0;

  with dmCadVenda do
  begin
    FDSchemaAdapterVenda.AfterApplyUpdate := LimparCache;
  end;
end;

procedure TfrmCadVenda.FormPaint(Sender: TObject);
begin
  inherited;
//  JvCalcEditCodigo.AsInteger := fdmCadPai.QueryCadastro.FieldByName(campochave).AsInteger
end;

procedure TfrmCadVenda.FormShow(Sender: TObject);
begin
  inherited;
  with dmCadVenda do
  Begin
    QueryCadastro.FieldByName('CLIENTE_DOCUMENTO').OnValidate := Validate_Cliente;
    FDQueryVendaItem.FieldByName('ITEM_DOC_ITEM').OnValidate := Validate_Item;
//    FDQueryVendaItem.FieldByName('ITEM_DOC_ITEM').OnValidate := Validate_Preco;
//    Validate_Preco(FDQueryVendaItem.FieldByName('ITEM_DOC_ITEM'), FDQueryPrincipal.FieldByName('TABELA_DOCUMENTO')).OnValidate;


     { While not FDQueryTabelaPreco.EOF do
      begin
        DBComboBox1.Items.Add(FDQueryTabelaPreco.FieldByName('DESCRICAO_TABELA').AsString);
        FDQueryTabelaPreco.Next;
      end;
     }
  End;
end;

procedure TfrmCadVenda.dbgItensCanEditCell(Grid: TJvDBGrid; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  dmCadVenda.QueryCadastro.Edit;
end;

procedure TfrmCadVenda.dbgItensKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  dbgItens.Perform(WM_KEYDOWN, VK_TAB, 0);
{  case Key of
    #13: Perform(WM_NEXTDLGCTL, 0, 0);
    #27: Perform(WM_NEXTDLGCTL, 1, 0);
  end;}
end;

procedure TfrmCadVenda.LimparCache(Sender: TObject);
begin
  with dmCadVenda do
  Begin
    QueryCadastro.CommitUpdates();
    FDQueryVendaItem.CommitUpdates();
  End;
end;



procedure TfrmCadVenda.SpeedButtonPrimeiroClick(Sender: TObject);
begin
  inherited;

end;

{procedure TfrmCadVenda.RetornaCodCliente(Sender: TObject);
begin
  dbceCodPessoa.Text := '1';
end;}

end.
