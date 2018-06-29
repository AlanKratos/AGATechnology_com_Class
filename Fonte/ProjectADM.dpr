program ProjectADM;



uses
  Vcl.Forms,
  Vcl.Controls,
  uFrmPrincipal in 'Form\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadPai in 'Form\uFrmCadPai.pas' {frmCadPai},
  uDmConexao in 'DM\uDmConexao.pas' {dmConexao: TDataModule},
  uDmCadPai in 'DM\uDmCadPai.pas' {dmCadPai: TDataModule},
  uDmCadCliente in 'DM\uDmCadCliente.pas' {dmCadCliente: TDataModule},
  unitValidaCnpjCpf in 'Class\unitValidaCnpjCpf.pas',
  relCliente in 'Report\relCliente.pas' {frmRelCliente},
  unitVarGlobal in 'Class\unitVarGlobal.pas',
  uFrmLogin in 'Form\uFrmLogin.pas' {frmLogin},
  uDmCadCidade in 'DM\uDmCadCidade.pas' {dmCadCidade: TDataModule},
  uFrmEmissaoNfe in 'Form\uFrmEmissaoNfe.pas' {frmEmissaoNfe},
  uFrmCadCompra in 'Form\uFrmCadCompra.pas' {frmCadCompra},
  uDmDocEntrada in 'DM\uDmDocEntrada.pas' {dmDocEntrada: TDataModule},
  uFrmConsultaPai in 'Form\uFrmConsultaPai.pas' {frmConsultaPai},
  uFrmConsultaCliente in 'Form\uFrmConsultaCliente.pas' {frmConsultaCliente},
  uFrmCadVenda in 'Form\uFrmCadVenda.pas' {frmCadVenda},
  uDmCadVenda in 'DM\uDmCadVenda.pas' {dmCadVenda: TDataModule},
  uFrmCadTabelaPreco in 'Form\uFrmCadTabelaPreco.pas' {frmCadTabelaPreco},
  uDmCadTabelaPreco in 'DM\uDmCadTabelaPreco.pas' {dmCadTabelaPreco: TDataModule},
  uFrmCadConta in 'Form\uFrmCadConta.pas' {frmCadConta},
  uDmCadConta in 'DM\uDmCadConta.pas' {dmCadConta: TDataModule},
  uFrmCadEmpresa in 'Form\uFrmCadEmpresa.pas' {frmCadEmpresa},
  uDmCadEmpresa in 'DM\uDmCadEmpresa.pas' {dmCadEmpresa: TDataModule},
  uFrmCadProduto in 'Form\uFrmCadProduto.pas' {frmCadProduto},
  uDmCadProduto in 'DM\uDmCadProduto.pas' {dmCadProduto: TDataModule},
  uFrmMovFinanceiro in 'Form\uFrmMovFinanceiro.pas' {frmMovFinanceiro},
  uFrmMovReceber in 'Form\uFrmMovReceber.pas' {frmMovReceber},
  uDmCadFinanceiro in 'DM\uDmCadFinanceiro.pas' {dmCadFinanceiro: TDataModule},
  ClassPai in 'Class\ClassPai.pas',
  ClassPaiCadastro in 'Class\ClassPaiCadastro.pas',
  ClassFuncoes in 'Class\ClassFuncoes.pas',
  ClassCidade in 'Class\ClassCidade.pas',
  ClassPessoa in 'Class\ClassPessoa.pas',
  ClassPessoa_Endereco in 'Class\ClassPessoa_Endereco.pas',
  ClassPessoa_Email in 'Class\ClassPessoa_Email.pas',
  ClassPessoa_Telefone in 'Class\ClassPessoa_Telefone.pas',
  uFrmCadCidade in 'Form\uFrmCadCidade.pas' {frmCadCidade},
  ClassUF in 'Class\ClassUF.pas',
  uFrmCadCliente in 'Form\uFrmCadCliente.pas' {frmCadCliente},
  ClassItem in 'Class\ClassItem.pas',
  ClassBanco in 'Class\ClassBanco.pas',
  ClassPais in 'Class\ClassPais.pas',
  ClassItemDetalhe in 'Class\ClassItemDetalhe.pas',
  ClassPedido in 'Class\ClassPedido.pas',
  ClassPedidoItem in 'Class\ClassPedidoItem.pas',
  ClassConta in 'Class\ClassConta.pas',
  uDmCadBanco in 'DM\uDmCadBanco.pas' {dmCadBanco: TDataModule},
  uFrmCadBanco in 'Form\uFrmCadBanco.pas' {frmCadBanco},
  uDmCadPais in 'DM\uDmCadPais.pas' {dmCadPais: TDataModule},
  uDmCadUF in 'DM\uDmCadUF.pas' {dmCadUF: TDataModule},
  uFrmCadPais in 'Form\uFrmCadPais.pas' {frmCadPais},
  uFrmCadUF in 'Form\uFrmCadUF.pas' {frmCadUF},
  ClassUnidade in 'Class\ClassUnidade.pas';

{$R *.res}

var
  StartMainForm :Boolean;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;


// CODIGO CORRETO ABAIXO
{  Application.Initialize;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmCadCidade, frmCadCidade);

  varLogin := TfrmLogin.Create(nil); // setei nil para o sistema nao assumir o form como principal
  try
   // *** se o login for válido, o retorno será mrOk e StartMainForm se tornará TRUE
    StartMainForm := varLogin.ShowModal = mrOk;
  finally
    varLogin.Release; // *** após utilizada, a tela de login é eliminada da memória
  end;

  if StartMainForm then  // *** se a senha era válida inicia a aplicação normalmente
  begin
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.Run;
  end else  // *** do contrário, terminamos a aplicação
    Application.Terminate; }

end.
