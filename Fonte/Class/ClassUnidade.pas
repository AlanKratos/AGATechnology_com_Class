unit ClassUnidade;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassUnidade = class(TClassPaiCadastro)

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

class function TClassUnidade.Descricao: string;
begin
  Result := 'Unidade';
end;

class function TClassUnidade.TabelaPrincipal: string;
begin
  Result := 'UNIDADE';
end;

class function TClassUnidade.CampoChave: string;
begin
  Result := 'CODIGO_UNIDADE';
end;

class function TClassUnidade.CamposCadastro: string;
begin
  Result :=
    'UNIDADE.CODIGO_UNIDADE,              ' + #13 +
    'UNIDADE.DESCRICAO_UNIDADE,           ' + #13 +
    'UNIDADE.ABREVEATURA_UNIDADE,         ' + #13 +
    'UNIDADE.STATUS_UNIDADE,              ' + #13 +
    'UNIDADE.INCLUSAO_UNIDADE,            ' + #13 +
    'UNIDADE.ALTERACAO_UNIDADE,           ' + #13 +
    'UNIDADE.USUARIOINCLUSAO_UNIDADE,     ' + #13 +
    'UNIDADE.USUARIOALTERACAO_UNIDADE';
end;

class function TClassUnidade.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin
    Lista.Add('Código');
    Lista.Add('Unidade');

    Campos.Add('CODIGO_UNIDADE');
    Campos.Add('DESCRICAO_UNIDADE');

    Result := Lista;
end;

class function TClassUnidade.SQLBaseCadastro: string;
begin
  Result :=
    'select '       + #13 +
    CamposCadastro  + #13 +
    'from UNIDADE '  + #13 +
    'where UNIDADE.CODIGO_UNIDADE = :CODIGO';
end;

class function TClassUnidade.SQLBaseConsulta: string;
begin
  Result := 'select'                        + #13 +
      'UNIDADE.CODIGO_UNIDADE as "Codigo",'   + #13 +
      'UNIDADE.DESCRICAO_UNIDADE as "Unidade"'        + #13 +
      'from UNIDADE';
end;

end.

