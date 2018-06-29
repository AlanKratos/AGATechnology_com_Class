unit ClassPais;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassPais = class(TClassPaiCadastro)
  public
    class function Descricao: string; override;
    class function TabelaPrincipal: string; override;
    class function CampoChave: string; override;

    class function CamposCadastro: string; override;
    class function SQLBaseCadastro: string; override;
    class function SQLBaseConsulta: string; override;

    class function CamposConsulta(Lista, Campos: TStrings): TStrings; override;
//    class function ParametrosSql: TListaDeParametrosSql; override;
//    class procedure ConfigurarPropriedadesDoCampo(CDS: TDataSet); override;
  end;

implementation


class function TClassPais.Descricao: string;
begin
  Result := 'País';
end;

{class function TClassCidade.ParametrosSql: TListaDeParametrosSql;
begin
    SetLength(Result, 1);
    Result[0].Nome := 'cod';
    Result[0].Tipo := ftInteger;
end;}

class function TClassPais.TabelaPrincipal: string;
begin
  Result := 'PAIS';
end;

class function TClassPais.CampoChave: string;
begin
  Result := 'CODIGO_PAIS';
end;

class function TClassPais.CamposCadastro: string;
begin
  Result :=
    'PAIS.CODIGO_PAIS,                 ' + #13 +
    'PAIS.DESCRICAO_PAIS,              ' + #13 +
    'PAIS.SIGLA_PAIS,                  ' + #13 +
    'PAIS.STATUS_PAIS,                 ' + #13 +
    'STATUS.DESCRICAO_STATUS,          ' + #13 +
    'PAIS.CODBANCENTRAL_PAIS,          ' + #13 +
    'PAIS.CODSISCOMEX_PAIS,            ' + #13 +
    'PAIS.MOEDA';
end;

class function TClassPais.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin
    Lista.Add('Código');
    Lista.Add('Descrição');
    Lista.Add('Sigla');
    Lista.Add('Codigo B. Central');

    Campos.Add('CODIGO_PAIS');
    Campos.Add('DESCRICAO_PAIS');
    Campos.Add('SIGLA_PAIS');
    Campos.Add('CODBANCENTRAL_PAIS');

    Result := Lista;
end;

class function TClassPais.SQLBaseCadastro: string;
begin
  Result :=
    'select '          + #13 +
    CamposCadastro     + #13 +
    'from PAIS'        + #13 +
    'left join STATUS on (PAIS.STATUS_PAIS = STATUS.CODIGO_STATUS) ' + #13 +
    'where PAIS.CODIGO_PAIS = :CODIGO';
end;

class function TClassPais.SQLBaseConsulta: string;
begin
    Result := 'select'                              + #13 +
      'PAIS.CODIGO_PAIS as "Código",'               + #13 +
      'PAIS.DESCRICAO_PAIS as "Descrição",'         + #13 +
      'PAIS.SIGLA_PAIS as "Sigla PAIS",'            + #13 +
      'PAIS.CODBANCENTRAL_PAIS as "Código B. Central",' + #13 +
      'from PAIS ';
end;

{class procedure TClassCidade.ConfigurarPropriedadesDoCampo(CDS: TDataSet);
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
end;}

initialization
  RegisterClass(TClassPais);

end.

