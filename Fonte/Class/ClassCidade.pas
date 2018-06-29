unit ClassCidade;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassCidade = class(TClassPaiCadastro)
  public
    class function Descricao: string; override;
    class function TabelaPrincipal: string; override;
    class function CampoChave: string; override;

    class function CamposCadastro: string; override;
    class function SQLBaseCadastro: string; override;
    class function SQLBaseConsulta: string; override;

    class function CamposConsulta(Lista, Campos: TStrings): TStrings; override;
//    class function ParametrosSql: TListaDeParametrosSql; override;
    class procedure ConfigurarPropriedadesDoCampo(CDS: TDataSet); override;
  end;

implementation

class function TClassCidade.Descricao: string;
begin
  Result := 'Cidade';
end;

{class function TClassCidade.ParametrosSql: TListaDeParametrosSql;
begin
    SetLength(Result, 1);
    Result[0].Nome := 'cod';
    Result[0].Tipo := ftInteger;
end;}

class function TClassCidade.TabelaPrincipal: string;
begin
  Result := 'CIDADE';
end;

class function TClassCidade.CampoChave: string;
begin
  Result := 'CODIGO_CIDADE';
end;

class function TClassCidade.CamposCadastro: string;
begin
  Result :=
    'CIDADE.CODIGO_CIDADE,          ' + #13 +
    'CIDADE.DESCRICAO_CIDADE,       ' + #13 +
    'CIDADE.REGIAO_CIDADE,          ' + #13 +
    'CIDADE.STATUS_CIDADE,          ' + #13 +
    'CIDADE.PAIS_CIDADE,            ' + #13 +
    'CIDADE.UF_CIDADE,              ' + #13 +
    'CIDADE.POPULACAO_CIDADE,       ' + #13 +
    'CIDADE.CODMUNICIPIO_CIDADE,    ' + #13 +
    'STATUS.DESCRICAO_STATUS,       ' + #13 +
    'UF.DESCRICAO_UF,               ' + #13 +
    'UF.SIGLA_UF,                   ' + #13 +
    'PAIS.DESCRICAO_PAIS,           ' + #13 +
    'PAIS.SIGLA_PAIS';
end;

class function TClassCidade.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin
    Lista.Add('Código');
    Lista.Add('Descrição');
    Lista.Add('Descrição UF');
    Lista.Add('Sigla UF');

    Campos.Add('CODIGO_CIDADE');
    Campos.Add('DESCRICAO_CIDADE');
    Campos.Add('DESCRICAO_UF');
    Campos.Add('SIGLA_UF');

    Result := Lista;
end;

class function TClassCidade.SQLBaseCadastro: string;
begin
  Result :=
    'select '          + #13 +
    CamposCadastro     + #13 +
    'from CIDADE'        + #13 +
    'left join STATUS on (CIDADE.STATUS_CIDADE = STATUS.CODIGO_STATUS) ' + #13 +
    'left join UF on (CIDADE.UF_CIDADE = UF.CODIGO_UF) ' + #13 +
    'left join PAIS on (CIDADE.PAIS_CIDADE = PAIS.CODIGO_PAIS) ' + #13 +
    'left join REGIAO on (CIDADE.REGIAO_CIDADE = REGIAO.CODIGO_REGIAO) ' + #13 +
    'where CIDADE.CODIGO_CIDADE = :CODIGO';
end;

class function TClassCidade.SQLBaseConsulta: string;
begin
    Result := 'select'                              + #13 +
      'CIDADE.CODIGO_CIDADE as "Código",'           + #13 +
      'CIDADE.DESCRICAO_CIDADE as "Descrição",'     + #13 +
      'CIDADE.UF_CIDADE as "Código UF",'            + #13 +
      'UF.SIGLA_UF as "Sigla UF",'                  + #13 +
      'UF.DESCRICAO_UF as "Descrição UF"'           + #13 +
      'from CIDADE '                                 + #13 +
      'left join UF on (CIDADE.UF_CIDADE = UF.CODIGO_UF)';
end;

class procedure TClassCidade.ConfigurarPropriedadesDoCampo(CDS: TDataSet);
var
    I: integer;
    Campo: String;
begin
    for I := 0 to CDS.FieldCount - 1 do
    begin
        Campo := CDS.Fields[I].FieldName;

        with CDS.FieldByName(Campo) do
        if (Campo = 'CODIGO_CIDADE') then
        begin
            Visible := False;
        end
        else if (Campo = 'DESCRICAO_STATUS') then
        begin
            ProviderFlags := []
        end
        else if (Campo = 'DESCRICAO_PAIS') then
        begin
            ProviderFlags := []
        end
        else if (Campo = 'DESCRICAO_UF') then
        begin
            ProviderFlags := []
        end
        else if (Campo = 'DESCRICAO_CIDADE') then
        begin
            DisplayLabel := 'Descrição Cidade';
            ConstraintErrorMessage := DisplayLabel + ' deve ser preenchido!';
        end;
    end;
end;

initialization
  RegisterClass(TClassCidade);

end.

