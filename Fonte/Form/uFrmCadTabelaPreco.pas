unit uFrmCadTabelaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadTabelaPreco, Vcl.DBCtrls, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  uFrmCadPai;

type
  TfrmCadTabelaPreco = class(TfrmCadPai)
    Panel2: TPanel;
    pcTabelaPreco: TJvPageControl;
    dsItens: TDataSource;
    tsPrincipal: TTabSheet;
    dbeDescricaoTabela: TDBEdit;
    Label2: TLabel;
    dbgItens: TJvDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgItensCanEditCell(Grid: TJvDBGrid; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgItensKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure dbgItensResize(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCache (Sender :TObject);
  public
    { Public declarations }
  end;

var
  frmCadTabelaPreco: TfrmCadTabelaPreco;

implementation

{$R *.dfm}

procedure TfrmCadTabelaPreco.BitBtnCancelarClick(Sender: TObject);
begin
  inherited;
  dmCadTabelaPreco.FDSchemaAdapterTabelaPreco.CancelUpdates;
end;

procedure TfrmCadTabelaPreco.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadTabelaPreco do
      Begin
        QueryCadastro.Delete;
        FDSchemaAdapterTabelaPreco.ApplyUpdates(0);
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

procedure TfrmCadTabelaPreco.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbeDescricaoTabela.SetFocus;
end;

procedure TfrmCadTabelaPreco.BitBtnSalvarClick(Sender: TObject);
begin
  try
    with dmCadTabelaPreco do
    begin
      FDSchemaAdapterTabelaPreco.ApplyUpdates(0);
      JvCalcEditCodigo.Text := QueryCadastro.FieldByName('CODIGO_TABELA').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;
  inherited;
end;

procedure TfrmCadTabelaPreco.dbgItensCanEditCell(Grid: TJvDBGrid; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  dmCadTabelaPreco.QueryCadastro.Edit;
//  dmCadTabelaPreco.FDQueryTabela_Detalhe.Edit;
end;

procedure TfrmCadTabelaPreco.dbgItensKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  dbgItens.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadTabelaPreco.dbgItensResize(Sender: TObject);
begin
  inherited;
ShowMessage('1');
end;

procedure TfrmCadTabelaPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadTabelaPreco := nil;
end;

procedure TfrmCadTabelaPreco.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadTabelaPreco := TdmCadTabelaPreco.Create(self); // Instanciar DM
//  self.tabela := 'TABELA';
//  self.campochave := 'CODIGO_TABELA';
//  self.TipoPessoa := ' CODIGO_TABELA > 0';
//  self.fdmCadPai := dmCadTabelaPreco;

  with dmCadTabelaPreco do
  begin
    QueryCadastro.Close;
    QueryCadastro.Open;
    FDQueryTabela_Detalhe.Close;
    FDQueryTabela_Detalhe.Open;
  end;

  with dmCadTabelaPreco do
  begin
    FDSchemaAdapterTabelaPreco.AfterApplyUpdate := LimparCache;
  end;

end;

procedure TfrmCadTabelaPreco.FormPaint(Sender: TObject);
begin
  inherited;
//  JvCalcEditCodigo.AsInteger := fdmCadPai.QueryCadastro.FieldByName(campochave).AsInteger
end;

procedure TfrmCadTabelaPreco.FormShow(Sender: TObject);
begin
  inherited;
  with dmCadTabelaPreco do
  Begin
    FDQueryTabela_Detalhe.FieldByName('ITEM_TAB_DET').OnValidate := Validate_Item;
  End;
end;

procedure TfrmCadTabelaPreco.LimparCache(Sender: TObject);
begin
  with dmCadTabelaPreco do
  Begin
    QueryCadastro.CommitUpdates();
    FDQueryTabela_Detalhe.CommitUpdates();
  End;
end;

end.
