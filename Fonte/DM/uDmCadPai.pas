unit uDmCadPai;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmCadPai = class(TDataModule)
    QueryCadastro: TFDQuery;
    QueryNavegar: TFDQuery;
    procedure QueryCadastroAfterPost(DataSet: TDataSet);
    procedure QueryCadastroBeforePost(DataSet: TDataSet);

  private
    { Private declarations }
    varTabela: string; //tabela chamada
    varCampochave: string; //chave primaria
    varTipoPessoa: string;
  public
    { Public declarations }
    Codigo: Integer;
    procedure Navegar(Botao: Integer);

    property tabela:string read varTabela write varTabela;
    property TipoCadastro:string read varTipoPessoa write varTipoPessoa;
    property campochave:string read varCampochave write varCampochave;
  protected
    procedure SetaProviderFlag(CDS: TFDQuery; Chave: string); virtual;
  end;

var
  dmCadPai: TdmCadPai;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadPai.QueryCadastroAfterPost(DataSet: TDataSet);
begin
  QueryCadastro.ApplyUpdates(0);
end;

procedure TdmCadPai.SetaProviderFlag(CDS: TFDQuery; Chave: string);
var
    I: integer;
begin
    for I := 0 to CDS.FieldCount - 1 do
        if CDS.Fields[I].FieldName = Chave then
            CDS.Fields[I].ProviderFlags := [pfInKey, pfInWhere, pfInUpdate]
        else
            CDS.Fields[I].ProviderFlags := [pfInUpdate];
end;

procedure TdmCadPai.QueryCadastroBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) and (QueryCadastro.FieldByName(dmCadPai.campochave).AsInteger = 0) then
    begin
      Codigo := dmConexao.ProximoCodigo(dmCadPai.tabela);
      QueryCadastro.FieldByName(campochave).AsInteger := Codigo;
    end;
end;

procedure TdmCadPai.Navegar(Botao: Integer);
begin
  QueryCadastro.Open();
  QueryNavegar.Close;
  case Botao of
    0: QueryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+
     ' CODIGO' + ' from '+tabela+' where '+TipoCadastro+
     ' order by '+tabela+'.'+campochave;

    1: QueryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+TipoCadastro +' order by '+tabela+'.'+campochave+' desc';

    2: QueryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where (('+tabela+'.'+campochave+' < '+IntToStr(Codigo) + ')' +
    'and '+TipoCadastro+
    '  or ('+tabela+'.'+campochave+' = '+ '(select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+TipoCadastro+' order by '+tabela+'.'+campochave+' )))'+
    ' order by '+tabela+'.'+campochave+' desc';

    3: QueryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where (('+tabela+'.'+campochave+' > '+IntToStr(Codigo) + ')' +
    'and '+TipoCadastro+
    '  or ('+tabela+'.'+campochave+' = '+ '(select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+TipoCadastro+' order by '+tabela+'.'+campochave+' desc'+' )))'+
    ' order by '+tabela+'.'+campochave;
  End;

  QueryNavegar.Open();
  Codigo := QueryNavegar.FieldByName('CODIGO').AsInteger;
  QueryNavegar.Close;
end;

end.
