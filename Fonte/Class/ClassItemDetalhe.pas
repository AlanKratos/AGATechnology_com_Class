unit ClassItemDetalhe;

interface

uses Classes, Db, SysUtils, ClassPaiCadastro, Data.DBConsts, Data.SqlExpr;

type
  TClassItemDetalhe = class(TClassPaiCadastro)

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

class function TClassItemDetalhe.Descricao: string;
begin
  Result := 'Produto';
end;

class function TClassItemDetalhe.TabelaPrincipal: string;
begin
  Result := 'ITEM_DETALHE';
end;

class function TClassItemDetalhe.CampoChave: string;
begin
  Result := 'COD_ITEM_DETALHE';
end;

class function TClassItemDetalhe.CamposCadastro: string;
begin
  Result :=
    'ITEM_DETALHE.CODIGO_ITEM_DETALHE,            ' + #13 +
    'ITEM_DETALHE.COD_ITEM_DETALHE,               ' + #13 +
    'ITEM_DETALHE.COR_ITEM_DETALHE,               ' + #13 +
    'ITEM_DETALHE.GRADE_ITEM_DETALHE,             ' + #13 +
    'ITEM_DETALHE.TECIDO_ITEM_DETALHE,            ' + #13 +
    'ITEM_DETALHE.STATUS_ITEM_DETALHE,            ' + #13 +
    'ITEM_DETALHE.CODIGOBARRAS_ITEM_DETALHE,      ' + #13 +
    'ITEM_DETALHE.INCLUSAO_ITEM_DETALHE,          ' + #13 +
    'ITEM_DETALHE.ALTERACAO_ITEM_DETALHE,         ' + #13 +
    'ITEM_DETALHE.USUARIOINCLUSAO_ITEM_DETALHE,   ' + #13 +
    'ITEM_DETALHE.USUARIOALTERACAO_ITEM_DETALHE';
end;

class function TClassItemDetalhe.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin

end;

class function TClassItemDetalhe.SQLBaseCadastro: string;
begin
  Result :=
    'select '       + #13 +
    CamposCadastro  + #13 +
    'from ITEM_DETALHE '  + #13 +
    'where ITEM_DETALHE.COD_ITEM_DETALHE = :CODIGO_ITEM';
end;

class function TClassItemDetalhe.SQLBaseConsulta: string;
begin

end;

end.

