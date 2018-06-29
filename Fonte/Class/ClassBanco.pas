unit ClassBanco;

interface

uses Classes,
     Db,
     SysUtils,
     ClassPaiCadastro,
     Data.DBConsts,
     Data.SqlExpr;

type
  TClassBanco = class(TClassPaiCadastro)
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

class function TClassBanco.Descricao: string;
begin
  Result := 'BANCO';
end;

{class function TClassBanco.ParametrosSql: TListaDeParametrosSql;
begin
    SetLength(Result, 1);
    Result[0].Nome := 'cod';
    Result[0].Tipo := ftInteger;
end;}

class function TClassBanco.TabelaPrincipal: string;
begin
  Result := 'BANCO';
end;

class function TClassBanco.CampoChave: string;
begin
  Result := 'CODIGO_BANCO';
end;

class function TClassBanco.CamposCadastro: string;
begin
  Result :=
    'BANCO.CODIGO_BANCO,            ' + #13 +
    'BANCO.DESCRICAO_BANCO,         ' + #13 +
    'BANCO.CAMARACOMPENSACAO_BANCO, ' + #13 +
    'BANCO.LOGO_BANCO,              ' + #13 +
    'BANCO.STATUS_BANCO,            ';
end;

class function TClassBanco.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin
    Lista.Add('Código');
    Lista.Add('Descrição');
    Lista.Add('Camara Compensação');
    Lista.Add('Status (Código)');

    Campos.Add('CODIGO_BANCO');
    Campos.Add('DESCRICAO_BANCO');
    Campos.Add('CAMARACOMPENSACAO_BANCO');
    Campos.Add('STATUS_BANCO');

    Result := Lista;
end;

class function TClassBanco.SQLBaseCadastro: string;
begin
  Result :=
    'select '          + #13 +
    CamposCadastro     + #13 +
    'from BANCO'       + #13 +
    'left join STATUS on (BANCO.STATUS_BANCO = STATUS.CODIGO_STATUS) ' + #13 +
    'where BANCO.CODIGO_BANCO = :CODIGO';
end;

class function TClassBanco.SQLBaseConsulta: string;
begin
    Result := 'select'                                         + #13 +
      'BANCO.CODIGO_BANCO as "Código",'                        + #13 +
      'BANCO.DESCRICAO_BANCO as "Descrição",'                  + #13 +
      'BANCO.CAMARACOMPENSACAO_BANCO as "Camara Compensação",' + #13 +
      'from BANCO'                                             ;
end;

{class procedure TClassBanco.ConfigurarPropriedadesDoCampo(CDS: TDataSet);
var
    I: integer;
    Campo: String;
begin
    for I := 0 to CDS.FieldCount - 1 do
    begin
        Campo := CDS.Fields[I].FieldName;

        with CDS.FieldByName(Campo) do
        if (Campo = 'CODIGO_BANCO') then
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
        else if (Campo = 'DESCRICAO_BANCO') then
        begin
            DisplayLabel := 'Descrição BANCO';
            ConstraintErrorMessage := DisplayLabel + ' deve ser preenchido!';
        end;
    end;
end;}

initialization
  RegisterClass(TClassBanco);

end.

