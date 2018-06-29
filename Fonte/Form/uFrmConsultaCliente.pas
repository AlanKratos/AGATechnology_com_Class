unit uFrmConsultaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, udmCadCliente, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  udmConexao, JvExStdCtrls, JvCombobox, JvDBCombobox, uFrmCadPai, uDmCadVenda;

type
  TfrmConsultaCliente = class(TfrmConsultaPai)
 //   procedure sbPesquisarClick(Sender: TObject);
  //  procedure FormCreate(Sender: TObject);
 //   procedure dbgConsultaDblClick(Sender: TObject);
//    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    vCodCliente :String;
  end;

  RefConsultaPai = class of TfrmConsultaPai;

var
  frmConsultaCliente: TfrmConsultaCliente;

implementation

{$R *.dfm}
 {
procedure TfrmConsultaCliente.dbgConsultaDblClick(Sender: TObject);
begin
  inherited;
  vCodCliente := dbgConsulta.Fields[0].AsString;

//  dsConsulta.DataSet.FieldByName('CODIGO_PESSOA').AsString := dbgConsulta.Fields[0].AsString;
//  dmCadVenda.FDQueryPrincipal.FieldByName('CODIGO_PESSOA').AsString :=
//             FDQueryConsulta.FieldByName('CODIGO_PESSOA').AsString;
  //frmConsultaCliente.Close;
end;

procedure TfrmConsultaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmConsultaCliente := nil;
end;

procedure TfrmConsultaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  varTabela := 'PESSOA';
  varModalidade :=  'CLIENTE_PESSOA = ' + QuotedStr('S');
  cbCampoConsulta.ItemIndex := 1;
  cbCriterioConsulta.ItemIndex := 6;
  fdmConsulta := dmCadCliente;
end;

procedure TfrmConsultaCliente.sbPesquisarClick(Sender: TObject);
begin
  case cbCampoConsulta.ItemIndex of
      0: varCampo := ' CODIGO_PESSOA';
      1: varCampo := ' NOME_PESSOA';
      2: varCampo := ' CNPJ_PESSOA';
      3: varCampo := ' CPF_PESSOA';
    end;
  case cbCriterioConsulta.ItemIndex of
      0: varCriterio := ' > ' + leConsulta.Text;
      1: varCriterio := ' < ' + leConsulta.Text;
      2: varCriterio := ' >= ' + leConsulta.Text;
      3: varCriterio := ' <= ' + leConsulta.Text;
      4: varCriterio := ' LIKE ' + QuotedStr(leConsulta.Text + '%');
      5: varCriterio := ' LIKE ' + QuotedStr('%' + leConsulta.Text);
      6: varCriterio := ' LIKE ' + QuotedStr('%' + leConsulta.Text + '%');
    end;
  inherited;
  {
  if leConsulta.Text = '' then
    ShowMessage('Favor preencher o campo de consulta.')
  else
  Begin
    consulta := 'SELECT * FROM ';
    consulta := consulta +  varTabela;
    consulta := consulta + ' WHERE ';
    case cbCampoConsulta.ItemIndex of
      0: varCampo := ' CODIGO_PESSOA';
      1: varCampo := ' NOME_PESSOA';
      2: varCampo := ' CNPJ_PESSOA';
      3: varCampo := ' CPF_PESSOA';
    end;
    consulta := consulta + varCampo;
    case cbCriterioConsulta.ItemIndex of
      0: consulta := consulta + ' > '+ QuotedStr(leConsulta.Text);
      1: consulta := consulta + ' < '+ QuotedStr(leConsulta.Text);
      2: consulta := consulta + ' >= '+ QuotedStr(leConsulta.Text);
      3: consulta := consulta + ' <= '+ QuotedStr(leConsulta.Text);
      4: consulta := consulta + ' LIKE ' + QuotedStr(leConsulta.Text + '%');
      5: consulta := consulta + ' LIKE ' + QuotedStr('%' + leConsulta.Text);
      6: consulta := consulta + ' LIKE ' + QuotedStr('%' + leConsulta.Text + '%');
    end;
    consulta := consulta + ' order by ' + varCampo;

    with dmCadCliente do
    Begin
      qry := TfdQuery.Create(Self);
      qry.Connection := dmConexao.FDConexao;
      qry.SQL.Text := consulta;
      qry.Open();
      dsConsulta.DataSet := qry;
    End;
  End;
  }
//end;

end.
