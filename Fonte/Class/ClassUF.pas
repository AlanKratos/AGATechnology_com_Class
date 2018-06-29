unit ClassUF;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassUF = class(TClassPaiCadastro)
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

uses ClassFuncoes;

class function TClassUF.Descricao: string;
begin
  Result := 'UF';
end;

{class function TClassCidade.ParametrosSql: TListaDeParametrosSql;
begin
    SetLength(Result, 1);
    Result[0].Nome := 'cod';
    Result[0].Tipo := ftInteger;
end;}

class function TClassUF.TabelaPrincipal: string;
begin
  Result := 'UF';
end;

class function TClassUF.CampoChave: string;
begin
  Result := 'CODIGO_UF';
end;

class function TClassUF.CamposCadastro: string;
begin
  Result :=
    'UF.CODIGO_UF,                 ' + #13 +
    'UF.DESCRICAO_UF,              ' + #13 +
    'UF.SIGLA_UF,                  ' + #13 +
    'STATUS.DESCRICAO_STATUS,      ' + #13 +
    'UF.STATUS_UF';
end;

class function TClassUF.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin
    Lista.Add('Código');
    Lista.Add('Descrição');
    Lista.Add('Sigla');

    Campos.Add('CODIGO_UF');
    Campos.Add('DESCRICAO_UF');
    Campos.Add('SIGLA_UF');

    Result := Lista;
end;

class function TClassUF.SQLBaseCadastro: string;
begin
  Result :=
    'select '          + #13 +
    CamposCadastro     + #13 +
    'from UF'        + #13 +
    'left join STATUS on (UF.STATUS_UF = STATUS.CODIGO_STATUS) ' + #13 +
    'where UF.CODIGO_UF = :CODIGO';
end;

class function TClassUF.SQLBaseConsulta: string;
begin
    Result := 'select'                              + #13 +
      'UF.CODIGO_UF as "Código",'           + #13 +
      'UF.DESCRICAO_UF as "Descrição",'     + #13 +
      'UF.SIGLA_UF as "Sigla UF",'            + #13 +
      'from UF ';
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
  RegisterClass(TClassUF);

end.

