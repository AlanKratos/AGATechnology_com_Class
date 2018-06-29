unit ClassPessoa_Telefone;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassPessoa_Telefone = class(TClassPaiCadastro)

  public
    class function Descricao: string; override;
    class function TabelaPrincipal: string; override;
    class function CampoChave: string; override;

    class function CamposCadastro: string; override;
    class function SQLBaseCadastro: string; override;
    class function SQLBaseConsulta: string; override;

    class function CamposConsulta(Lista, Campos: TStrings): TStrings; override;
  end;

implementation

{ TClassPessoa_Email }

class function TClassPessoa_Telefone.CampoChave: string;
begin
  Result := 'COD_PESSOA_TELEFONE'
end;

class function TClassPessoa_Telefone.CamposCadastro: string;
begin
  Result :=
    'PESSOA_TELEFONE.CODIGO_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.COD_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.NUMERO_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.CELULAR_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.OBSERVACAO_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.PADRAO_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.TIPO_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.INCLUSAO_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.ALTERACAO_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.USUSARIOINCLUS_PESSOA_TELEFONE, ' + #13 +
    'PESSOA_TELEFONE.USUARIOALTERA_PESSOA_TELEFONE';
end;

class function TClassPessoa_Telefone.CamposConsulta(Lista,
  Campos: TStrings): TStrings;
begin

end;

class function TClassPessoa_Telefone.Descricao: string;
begin

end;

class function TClassPessoa_Telefone.SQLBaseCadastro: string;
begin
  Result :=
    'select ' + #13 +
    CamposCadastro + #13 +
    'from PESSOA_TELEFONE ' + #13 +
    'where PESSOA_TELEFONE.COD_PESSOA_TELEFONE = :CODIGO_PESSOA';
end;

class function TClassPessoa_Telefone.SQLBaseConsulta: string;
begin

end;

class function TClassPessoa_Telefone.TabelaPrincipal: string;
begin
  Result := 'PESSOA_TELEFONE'
end;

end.
