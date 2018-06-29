unit ClassPessoa_Endereco;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassPessoa_Endereco = class(TClassPaiCadastro)
  private


public
    class function Descricao: string; override;
    class function TabelaPrincipal: string; override;
    class function CampoChave: string; override;

    class function CamposCadastro: string; override;
    class function SQLBaseCadastro: string; override;
    class function SQLBaseConsulta: string; override;

    class function CamposConsulta(Lista, Campos: TStrings): TStrings; override;
    class procedure ConfigurarPropriedadesDoCampo(CDS: TDataSet); override;
  end;

implementation

{ TClassPessoa_Endereco }

class function TClassPessoa_Endereco.CampoChave: string;
begin
  Result := 'COD_PESSOA_ENDERECO';
end;

class function TClassPessoa_Endereco.CamposCadastro: string;
begin
  Result :=
    'PESSOA_ENDERECO.CODIGO_PESSOA_ENDERECO,      ' + #13 +
    'PESSOA_ENDERECO.COD_PESSOA_ENDERECO,         ' + #13 +
    'PESSOA_ENDERECO.ENDERECO_PESSOA_ENDERECO,    ' + #13 +
    'PESSOA_ENDERECO.NUMERO_PESSOA_ENDERECO,      ' + #13 +
    'PESSOA_ENDERECO.COMPLEMENTO_PESSOA_ENDERECO, ' + #13 +
    'PESSOA_ENDERECO.BAIRRO_PESSOA_ENDERECO,      ' + #13 +
    'PESSOA_ENDERECO.CIDADE_PESSOA_ENDERECO,      ' + #13 +
    'CIDADE.DESCRICAO_CIDADE,                     ' + #13 +
    'UF.SIGLA_UF';
end;

class function TClassPessoa_Endereco.CamposConsulta(Lista,
  Campos: TStrings): TStrings;
begin

end;


class function TClassPessoa_Endereco.TabelaPrincipal: string;
begin
  Result := 'PESSOA_ENDERECO';
end;


class function TClassPessoa_Endereco.Descricao: string;
begin

end;

class function TClassPessoa_Endereco.SQLBaseCadastro: string;
begin
  Result :=
    'select ' + #13 +
    CamposCadastro + #13 +
    'from PESSOA_ENDERECO ' + #13 +
    'left join cidade on (pessoa_endereco.cidade_pessoa_endereco = cidade.codigo_cidade) ' + #13 +
    'left join uf on (cidade.uf_cidade = uf.codigo_uf) ' + #13 +
    'where PESSOA_ENDERECO.COD_PESSOA_ENDERECO = :CODIGO_PESSOA';
end;

class function TClassPessoa_Endereco.SQLBaseConsulta: string;
begin

end;

class procedure TClassPessoa_Endereco.ConfigurarPropriedadesDoCampo(CDS: TDataSet);
var
    I: integer;
    Campo: String;
begin
    for I := 0 to CDS.FieldCount - 1 do
    begin
        Campo := CDS.Fields[I].FieldName;

        with CDS.FieldByName(Campo) do
        if (Campo = 'CODIGO_PESSOA_ENDERECO') then
        begin
            Visible := False;
        end
        else if (Campo = 'COD_PESSOA_ENDERECO') then
        begin
            Visible := False;
        end
       else if (Campo = 'ENDERECO_PESSOA_ENDERECO') then
        begin
            DisplayLabel := 'Endereço';
            DisplayWidth := 40;
        end
        else if (Campo = 'NUMERO_PESSOA_ENDERECO') then
        begin
            DisplayLabel := 'Número';
        end
        else if (Campo = 'BAIRRO_PESSOA_ENDERECO') then
        begin
            DisplayLabel := 'Bairro';
        end
        else if (Campo = 'CIDADE_PESSOA_ENDERECO') then
        begin
            DisplayLabel := 'Cidade';
        end
        else if (Campo = 'DESCRICAO_CIDADE') then
        begin
            DisplayLabel := 'Descrição Cidade';
        end
        else if (Campo = 'SIGLA_UF') then
        begin
            DisplayLabel := 'UF';
        end
        else if (Campo = 'COMPLEMENTO_PESSOA_ENDERECO') then
        begin
            DisplayLabel := 'Complemento';
            DisplayWidth := 25;
        end;
    end;
end;


end.
