unit uDmCadEmpresa;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, VCL.Dialogs, udmConexao;

type
  TdmCadEmpresa = class(TdmCadPai)
    FDQueryValidaCidade: TFDQuery;
    FDQueryValidaUf: TFDQuery;
    FDSchemaAdapterEmpresa: TFDSchemaAdapter;
    procedure Validate_Cidade(Sender: TField);
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure FDQueryPrincipalAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadEmpresa: TdmCadEmpresa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCadEmpresa }

procedure TdmCadEmpresa.FDQueryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QueryCadastro do
  Begin
    FieldByName('STATUS_EMPRESA').Value := 1;
  End;
end;

procedure TdmCadEmpresa.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_EMPRESA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_EMPRESA').AsInteger :=
      dmConexao.ProximoCodigo('EMPRESA')
end;

procedure TdmCadEmpresa.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QueryCadastro.Edit;
end;

procedure TdmCadEmpresa.Validate_Cidade(Sender: TField);
begin
  FDQueryValidaCidade.Close();
  FDQueryValidaCidade.SQL.Text := 'select DESCRICAO_CIDADE, UF_CIDADE from CIDADE' +
  ' where CIDADE.CODIGO_CIDADE = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaCidade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cliente: ' + E.Message);
  end;
  if FDQueryValidaCidade.IsEmpty then
  begin
    MessageDlg('Campo código da cidade precisa ser preenchido!!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryCadastro.FieldByName('DESCRICAO_CIDADE').AsString := FDQueryValidaCidade.FieldByName('DESCRICAO_CIDADE').AsString;

  FDQueryValidaUf.Close();
  FDQueryValidaUf.SQL.Text := 'select DESCRICAO_UF from UF' +
  ' where UF.CODIGO_UF = '+ FDQueryValidaCidade.FieldByName('UF_CIDADE').AsString;
  try
    FDQueryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro UF: ' + E.Message);
  end;
  if FDQueryValidaCidade.IsEmpty then
  begin
    MessageDlg('UF não preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  QueryCadastro.FieldByName('DESCRICAO_UF').AsString := FDQueryValidaUf.FieldByName('DESCRICAO_UF').AsString
end;

end.
