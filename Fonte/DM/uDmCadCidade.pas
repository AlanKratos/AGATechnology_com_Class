unit uDmCadCidade;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, udmConexao, Vcl.Dialogs;

type
  TdmCadCidade = class(TdmCadPai)
    FDQueryValidaUf: TFDQuery;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure Validate_Uf(Sender:TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure QueryCadastroAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadCidade: TdmCadCidade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ClassCidade, ClassPaiCadastro;

{$R *.dfm}

procedure TdmCadCidade.DataModuleCreate(Sender: TObject);
begin
  inherited;
  QueryCadastro.SQL.Add(TClassCidade.SQLBaseCadastro);
  QueryCadastro.DataSetField := TClassPaiCadastro.Helper.AdicionarCampos;

  tabela := TClassCidade.TabelaPrincipal;
  campochave := TClassCidade.CampoChave;
  TipoCadastro := TClassCidade.TipoCadastro;
end;

procedure TdmCadCidade.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_CIDADE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_CIDADE').AsInteger :=
      dmConexao.ProximoCodigo('CIDADE')
end;

procedure TdmCadCidade.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QueryCadastro.Edit;
end;

procedure TdmCadCidade.QueryCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TClassCidade.ConfigurarPropriedadesDoCampo(DataSet);
end;

procedure TdmCadCidade.Validate_Uf(Sender: TField);
begin
  FDQueryValidaUf.Close();
  FDQueryValidaUf.SQL.Text := 'select UF.DESCRICAO_UF from UF ' +
                  'where UF.CODIGO_UF = ' + IntToStr(Sender.AsInteger);
  try
    FDQueryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cliente: ' + E.Message);
  end;
  if FDQueryValidaUf.IsEmpty then
  begin
    MessageDlg('Código do cliente precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryCadastro.FieldByName('DESCRICAO_UF').AsString := FDQueryValidaUf.FieldByName('DESCRICAO_UF').AsString;
end;

end.
