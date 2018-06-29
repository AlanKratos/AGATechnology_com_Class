unit ClassPessoa;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassPessoa = class(TClassPaiCadastro)

  public
    class function Descricao: string; override;
    class function TabelaPrincipal: string; override;
    class function CampoChave: string; override;
    class function TipoCadastro: string; override;

    class function CamposCadastro: string; override;
    class function SQLBaseCadastro: string; override;
    class function SQLBaseConsulta: string; override;

    class function CamposConsulta(Lista, Campos: TStrings): TStrings; override;
  end;

implementation

class function TClassPessoa.Descricao: string;
begin
  Result := 'Pessoa';
end;

class function TClassPessoa.TabelaPrincipal: string;
begin
  Result := 'PESSOA';
end;

class function TClassPessoa.TipoCadastro: string;
begin
  Result := TabelaPrincipal + '.' + 'CLIENTE_PESSOA = ' + QuotedStr('S');
end;

class function TClassPessoa.CampoChave: string;
begin
  Result := 'CODIGO_PESSOA';
end;

class function TClassPessoa.CamposCadastro: string;
begin
  Result :=
    'PESSOA.CODIGO_PESSOA,        '  + #13 +
    'PESSOA.NOME_PESSOA,           ' + #13 +
    'PESSOA.FANTASIA_PESSOA,       ' + #13 +
    'PESSOA.TIPO_PESSOA,           ' + #13 +
    'PESSOA.OBSERVACAO_PESSOA,     ' + #13 +
    'PESSOA.STATUS_PESSOA,         ' + #13 +
    'PESSOA.CLIENTE_PESSOA,        ' + #13 +
    'PESSOA.CNPJ_PESSOA,           ' + #13 +
    'PESSOA.IE_PESSOA,             ' + #13 +
    'PESSOA.CPF_PESSOA,            ' + #13 +
    'PESSOA.RG_PESSOA,             ' + #13 +
    'PESSOA.FORNECEDOR_PESSOA,     ' + #13 +
    'PESSOA.FUNCIONARIO_PESSOA';
end;

class function TClassPessoa.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin
    Lista.Add('Código');
    Lista.Add('Nome');
    Lista.Add('Fantasia');
    Lista.Add('CNPJ');

    Campos.Add('CODIGO_PESSOA');
    Campos.Add('NOME_PESSOA');
    Campos.Add('FANTASIA_PESSOA');
    Campos.Add('CNPJ_PESSOA');

    Result := Lista;
end;

class function TClassPessoa.SQLBaseCadastro: string;
begin
  Result :=
    'select '       + #13 +
    CamposCadastro  + #13 +
    'from PESSOA '  + #13 +
    'where PESSOA.CODIGO_PESSOA = :CODIGO';
end;

class function TClassPessoa.SQLBaseConsulta: string;
begin
  Result := 'select'                              + #13 +
      'PESSOA.CODIGO_PESSOA as "Código",'           + #13 +
      'PESSOA.NOME_PESSOA as "Nome",'     + #13 +
      'PESSOA.FANTASIA_PESSOA as "Fantasia",'            + #13 +
      'PESSOA.CNPJ_PESSOA as "CNPJ"'                  + #13 +
      'from PESSOA ';
end;

end.

