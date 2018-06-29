unit ClassPessoa_Email;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassPessoa_Email = class(TClassPaiCadastro)

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

class function TClassPessoa_Email.CampoChave: string;
begin
  Result := 'COD_PESSOA_EMAIL';
end;

class function TClassPessoa_Email.CamposCadastro: string;
begin
  Result :=
    'PESSOA_EMAIL.CODIGO_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.COD_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.EMAIL_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.PRINCIPAL_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.COBRANCA_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.DOCUMENTOSFISCAIS_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.PEDIDOCOMPRA_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.PEDIDOVENDA_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.MALADIRETA_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.INCLUSAO_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.ALTERACAO_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.USUARIOINCLUSAO_PESSOA_EMAIL, ' + #13 +
    'PESSOA_EMAIL.USUARIOALTERACAO_PESSOA_EMAIL';
end;

class function TClassPessoa_Email.CamposConsulta(Lista,
  Campos: TStrings): TStrings;
begin

end;

class function TClassPessoa_Email.Descricao: string;
begin

end;

class function TClassPessoa_Email.SQLBaseCadastro: string;
begin
  Result :=
    'select ' + #13 +
    CamposCadastro + #13 +
    'from PESSOA_EMAIL ' + #13 +
    'where PESSOA_EMAIL.COD_PESSOA_EMAIL = :CODIGO_PESSOA';
end;

class function TClassPessoa_Email.SQLBaseConsulta: string;
begin

end;

class function TClassPessoa_Email.TabelaPrincipal: string;
begin
  Result := 'PESSOA_EMAIL'
end;

end.
