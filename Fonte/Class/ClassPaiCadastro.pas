unit ClassPaiCadastro;

interface

uses Data.DB, System.SysUtils, System.Classes, System.DateUtils, System.Variants, DBClient,
     StrUtils, FMTBcd, Controls, SqlTimSt, SqlExpr, TypInfo, Rtti, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client, ClassPai;

type
  TRotuloDescricao = record
    Name: string;
    Index: Integer;
  end;
  TListaDeRotuloDescricao = array of TRotuloDescricao;

  TParametrosSql = record
    Nome: string;
    Tipo: TFieldType;
    Valor: Integer;
  end;
  TListaDeParametrosSql = array of TParametrosSql;

type
{
    Diretivas:
  virtual      - Usado para definir um m�todo que pode ser sobrescrito.
  override     - Utilizado para definir um m�todo que est� sobrescrevendo um m�todo virtual.
  abstract     - � usado com virtual ou override para definir um m�todo sem implementa��o que deve ser sobrescrito na subclasse, sen�o o mesmo n�o ser� chamado.
  final        - Usado com virtual ou override para definir um m�todo que n�o pode ser sobrescrito.
  reintroduce  - � como o override, porem, funciona com m�todos n�o dinamicos e n�o virtuais. Utilizado se voc� quiser reintroduzir um m�todo  e comunicar para o compilador que voc� n�o cometeu um engano escrevendo um m�todo com mesmo nome da classe pai.
  overload     - Essa diretiva permite que voc� declare um m�todo com mesmo nome, porem, com par�metros diferentes.


}
  TDataSetHelper = class Helper for TDataSet
  public
    procedure AdicionarCampos(VerificarSeJaExiste: Boolean); virtual;
  end;


  TClassPaiCadastro = class(TClassPai)
  private
    procedure AdicionarFields(const bVerificarSeJaExiste: Boolean);
  public
    class function Descricao: string; virtual;
    class function TabelaPrincipal: string; virtual;
    class function CampoChave: string; virtual;
    class function TipoCadastro: string; virtual;

    class function CamposCadastro: string; virtual;
    class function SQLBaseCadastro: string; virtual;
    class function SQLBaseConsulta: string; virtual;

    class function ParametrosSql: TListaDeParametrosSql; virtual;

    class function CamposConsulta(Lista, Campos: TStrings): TStrings; virtual;

    class function CriarParametros(ATFDQuery: TFDQuery): string;

    class procedure ConfigurarPropriedadesDoCampo(CDS: TDataSet); virtual;



  end;

  TFClassPaiCadastro = class of TClassPaiCadastro;

implementation

class function TClassPaiCadastro.Descricao: string;
begin
  Result := '';
end;

class function TClassPaiCadastro.ParametrosSql: TListaDeParametrosSql;
begin
  SetLength(Result, 0);

 //  Exemplo de como passar parametro. � realizado na classe filha.

    SetLength(Result, 1);
    Result[0].Nome := 'cod';
    Result[0].Tipo := ftInteger
end;

class function TClassPaiCadastro.TabelaPrincipal: string;
begin
  Result := '';
end;

class function TClassPaiCadastro.TipoCadastro: string;
begin
  Result := '1 = 1'; //usar quando nao precisar utilizar
end;

class function TClassPaiCadastro.CriarParametros(ATFDQuery: TFDQuery): string;
var
  Parametros: TListaDeParametrosSql;
  i: integer;
begin
    Parametros := Self.ParametrosSql;
  if Length(Parametros) > 0 then
  begin
     ATFDQuery.Params.Clear;
     for i := Low(Parametros) to High(Parametros) do
     begin
       with TParam(ATFDQuery.Params.Add) do
       begin
         Name := Parametros[i].Nome;
         DataType := Parametros[i].Tipo;
         ParamType := ptInput;
       end;
     end;
  end;
end;

class function TClassPaiCadastro.CamposCadastro: string;
begin
  Result := '';
end;

class function TClassPaiCadastro.CamposConsulta(Lista, Campos: TStrings): TStrings;
begin
    //
end;

class procedure TClassPaiCadastro.ConfigurarPropriedadesDoCampo(CDS: TDataSet);
begin
    //
end;

procedure TDataSetHelper.AdicionarCampos(VerificarSeJaExiste: Boolean);
var
  X: Integer;
begin
  // Atualizando os tipos dos TFields, conforme tipos dos campos definidos no banco de dados
  Active := False;
  FieldDefs.Update;

  // Criar os TFields inserindo-os no DataSet.
  for X := 0 to FieldDefs.Count - 1 do
    if (not VerificarSeJaExiste) or (FindField(FieldDefs[x].Name) = nil) then
      FieldDefs.Items[X].CreateField(Self);
end;

procedure TClassPaiCadastro.AdicionarFields(
  const bVerificarSeJaExiste: Boolean);
begin

end;

class function TClassPaiCadastro.CampoChave: string;
begin
  Result := '';
end;

class function TClassPaiCadastro.SQLBaseCadastro: string;
begin
    Result := '';
end;

class function TClassPaiCadastro.SQLBaseConsulta: string;
begin
  Result := '';
end;



end.

