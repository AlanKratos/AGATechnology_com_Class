unit ClassItem;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassItem = class(TClassPaiCadastro)

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

class function TClassItem.Descricao: string;
begin
  Result := 'Produto';
end;

class function TClassItem.TabelaPrincipal: string;
begin
  Result := 'ITEM';
end;

class function TClassItem.CampoChave: string;
begin
  Result := 'CODIGO_ITEM';
end;

class function TClassItem.CamposCadastro: string;
begin
  Result :=
    'ITEM.CODIGO_ITEM,                  ' + #13 +
    'ITEM.TIPO_ITEM,                    ' + #13 +
    'ITEM.DESCRICAO_ITEM,               ' + #13 +
    'ITEM.CODIGOBARRAS_ITEM,            ' + #13 +
    'ITEM.COLECAO_ITEM,                 ' + #13 +
    'ITEM.KIT_ITEM,                     ' + #13 +
    'ITEM.CONTROLAESTOQUE_ITEM,         ' + #13 +
    'ITEM.DTINCLUSAO_ITEM,              ' + #13 +
    'ITEM.DTALTERACAO_ITEM,             ' + #13 +
    'ITEM.NOMEREDUZIDO_ITEM,            ' + #13 +
    'ITEM.VALIDADE_ITEM,                ' + #13 +
    'ITEM.VARIATECIDO_ITEM,             ' + #13 +
    'ITEM.VARIAACABAMENTO_ITEM,         ' + #13 +
    'ITEM.EMPILHAMENTOMAXIMO_ITEM,      ' + #13 +
    'ITEM.FABRICACAOPROPRIA_ITEM,       ' + #13 +
    'ITEM.GRUPO_ITEM,                   ' + #13 +
    'ITEM.SUBGRUPO_ITEM,                ' + #13 +
    'ITEM.FATURA_ITEM,                  ' + #13 +
    'ITEM.NCM_ITEM,                     ' + #13 +
    'ITEM.PERCENTUALIMPORTACAO_ITEM,    ' + #13 +
    'ITEM.PESOBRUTO_ITEM,               ' + #13 +
    'ITEM.PESOLIQUIDO_ITEM,             ' + #13 +
    'ITEM.REGISTROEAN_ITEM,             ' + #13 +
    'ITEM.STATUS_ITEM,                  ' + #13 +
    'ITEM.REFERENCIA_ITEM,              ' + #13 +
    'ITEM.PRODUTO_ITEM,                 ' + #13 +
    'ITEM.VARIACOR_ITEM,                ' + #13 +
    'ITEM.VARIAGRADE_ITEM,              ' + #13 +
    'ITEM.UNIDADE_ITEM,                 ' + #13 +
    'ITEM.OBSERVACAO_ITEM,              ' + #13 +
    'ITEM.TRIBUTACAO_ITEM,              ' + #13 +
    'ITEM.CONTROLACOR_ITEM,             ' + #13 +
    'ITEM.CONTROLAGRADE_ITEM,           ' + #13 +
    'NCM.COD_NCM,                       ' + #13 +
    'GRUPO.DESCRICAO_GRUPO,             ' + #13 +
    'SUBGRUPO.DESCRICAO_SUBGRUPO,       ' + #13 +
    'UNIDADE.DESCRICAO_UNIDADE';
end;

class function TClassItem.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin
    Lista.Add('Codigo');
    Lista.Add('Descricao');

    Campos.Add('CODIGO_ITEM');
    Campos.Add('DESCRICAO_ITEM');

    Result := Lista;
end;

class function TClassItem.SQLBaseCadastro: string;
begin
  Result :=
    'select '       + #13 +
    CamposCadastro  + #13 +
    'from ITEM '    + #13 +
    'left join UNIDADE on (ITEM.UNIDADE_ITEM = UNIDADE.CODIGO_UNIDADE) ' + #13 +
    'left join NCM on (NCM.CODIGO_NCM = ITEM.NCM_ITEM) ' + #13 +
    'left join GRUPO on (GRUPO.CODIGO_GRUPO = ITEM.GRUPO_ITEM) ' + #13 +
    'left join SUBGRUPO on (SUBGRUPO.CODIGO_SUBGRUPO = ITEM.SUBGRUPO_ITEM) ' + #13 +
    'where ITEM.CODIGO_ITEM = :CODIGO';
end;

class function TClassItem.SQLBaseConsulta: string;
begin
  Result := 'select'                        + #13 +
      'ITEM.CODIGO_ITEM as "Codigo",'   + #13 +
      'ITEM.DESCRICAO_ITEM as "Descricao"'        + #13 +
      'from ITEM';
end;

end.

