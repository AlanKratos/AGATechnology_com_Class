unit ClassFuncoes;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Dialogs,
    Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Classes, Vcl.Forms, frxClass, System.Variants;

const
    {
    0 = Não salva o "_" no banco de dados.
    1 = Salva o "_" no banco de dados.
    }
    MASK_CEP: string = '99\.999\-999;0;_';
    MASK_RG: string = '999\.999\.999;1;_';
    MASK_CPF: string = '999\.999\.999\-99;1;_';
    MASK_CNPJ: string = '999\.999\.999\/9999\-99;1;_';
    MASK_TELEFONE: string =  '!\(00\)0 0000-9999;1;_';//'\(99\) 9999\-9999;1;_';
    MASK_CELULAR: string = '\(99\) 9 9999\-9999;1;_';
    MASK_PLACA: string = 'LLL\-9999;1';
    MASK_IE: string = '999999999999;0;';
    MASK_DIGITO: string = 'LL;0;_';
    MASK_NUMEROS: string = '999999999999999;0;';
    MASK_MUNICIPIO: string = '99999999;0;_';
    MASK_NUMEROS_PEQUENOS: string = '999999999;0;';
    MASK_DATA_HORA: string = '99/99/9999 !99:99:99;1;_';
    MASK_TIME: string = '99:99;1;';
    MASK_REAL: string = '##0.00;0';

//Avisos e Erros
//procedure MensagemAviso(Mensagem: string);
//procedure MensagemErro(Mensagem: string);
//procedure MensagemInformacao(Mensagem: string);

// Criptografia
//Function Criptografa(texto: string; chave: Integer): String;
//Function DesCriptografa(texto: string; chave: Integer): String;

type
    TClassFuncoes = class
    private


    end;

implementation

{ TClassFuncoes }

var
    TempStream: TMemoryStream;


{class function ClassFuncoes.SoNumeros(Const Texto:String):String;
var
  vContString: integer;
  vString: string;
begin
  vString:='';
  for vContString:= 1 To Length(Texto) Do
    begin
      if (Texto[vContString] in ['0'..'9']) then
        begin
          vString:= vString + Copy(Texto, vContString, 1);
        end;
    end;

  if vString<>'' then
    result:=vString
  else
    result:='00000000000';
end;}

{procedure MensagemAviso(Mensagem: string);
begin
    MessageDlg(Mensagem, mtWarning, [mbOK], 0);
end;

procedure MensagemInformacao(Mensagem: string);
begin
    MessageDlg(Mensagem, mtInformation, [mbOK], 0);
end;

procedure MensagemErro(Mensagem: string);
begin
    MessageDlg(Mensagem, mtError, [mbOK], 0);
end;}

// Faz tratamento das telas quando minimizar a maximizar.
// ---------------------------------------------------------------------------------
{function Tela(Dono, Formulario: TForm; ClassFormulario: TFormClass; Modal: Boolean; Sender: TObject = nil): TFormClass;
begin
    Formulario := nil;

    if not Assigned(Formulario) then
        Formulario := TFormClass(ClassFormulario).Create(Dono);

    with Formulario do
    begin
        if WindowState = wsMinimized then
            WindowState := wsNormal;
        if Modal then
        begin
            FormStyle := fsNormal;
            ShowModal;
            Result := nil;
        end
        else
        begin
            if DebugHook = 0 then
                Formulario.FormStyle := fsStayOnTop;
            Show;
            Result := TFormClass(Formulario);
        end;
    end;
end;}


{function iif(Condicao: Boolean; RetornaTrue, RetornaFalse: Variant): Variant;
begin
    if Condicao then
        Result := RetornaTrue
    else
        Result := RetornaFalse;
end;}


{Function Criptografa(texto: string; chave: Integer): String;
var
    cont: Integer;
    Retorno: string;
begin
    if (trim(texto) = EmptyStr) or (chave = 0) then
    begin
        Result := texto;
    end
    else
    begin
        Retorno := '';
        for cont := 1 to Length(texto) do
        begin
            Retorno := Retorno + Chr(AsciiToInt(texto[cont]) + chave);
        end;
        Result := Retorno;
    end;
end;

Function DesCriptografa(texto: string; chave: Integer): String;
var
    cont: Integer;
    Retorno: string;
begin
    if (trim(texto) = EmptyStr) or (chave = 0) then
    begin
        Result := texto;
    end
    else
    begin
        Retorno := '';
        for cont := 1 to Length(texto) do
        begin
            Retorno := Retorno + Chr(AsciiToInt(texto[cont]) - chave);
        end;
        Result := Retorno;
    end;
end;}


end.
