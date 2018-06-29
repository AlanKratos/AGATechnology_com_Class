unit uFrmConsultaPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvExStdCtrls, JvCombobox, JvDBCombobox, ClassPaiCadastro,
  Vcl.Imaging.pngimage;

type
  TfrmConsultaPai = class(TForm)
    dbgConsulta: TDBGrid;
    edtConsulta: TLabeledEdit;
    sbPesquisar: TSpeedButton;
    dsConsulta: TDataSource;
    FDQueryConsulta: TFDQuery;
    cbCampoConsulta: TJvDBComboBox;
    cbCriterioConsulta: TJvDBComboBox;
    imgPesquisar: TImage;
    imgConfirma: TImage;
    procedure sbPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbOperadorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cdsConsultaAfterOpen(DataSet: TDataSet);
    procedure dbgConsultaTitleClick(Column: TColumn);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure cbCriterioConsultaCloseUp(Sender: TObject);
    procedure cbCriterioConsultaExit(Sender: TObject);
    procedure imgPesquisarClick(Sender: TObject);
    procedure imgConfirmaClick(Sender: TObject);
  private
    CamposSQL: TStrings;
    function SQLOperador: string;
    function SQLCampos: string;
  public
    FClass: TFClassPaiCadastro;
    ID: integer;
  end;

    FClass = class of TClassPaiCadastro;

var
  frmConsultaPai: TfrmConsultaPai;

{
0 - Igual
1 - Maior que
2 - Menor que
3 - Maior ou igual a
4 - Menor ou igual a
5 - Começa com
6 - Termina com
7 - Contém
8 - Preenchido
}

implementation

{$R *.dfm}

uses UdmConexao;


procedure TfrmConsultaPai.btnCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmConsultaPai.btnConfirmarClick(Sender: TObject);
begin
    ID := dsConsulta.DataSet.Fields[0].AsInteger;
    Close;
end;

procedure TfrmConsultaPai.cbbOperadorChange(Sender: TObject);
begin
    with edtConsulta do
    begin
    case cbCriterioConsulta.ItemIndex of
        0: begin
            Clear;
        end;
        1: begin
            Clear;
        end;
        2: begin
            Clear;
        end;
        3: begin
            Clear;
        end;
        4: begin
            Clear;
        end;
        5: begin
            Clear;
        end;
        6: begin
            Clear;
        end;
        7: begin
            Clear;
        end;
        8: begin
            Clear;
        end;
    end;
    end;
end;

procedure TfrmConsultaPai.cbCriterioConsultaCloseUp(Sender: TObject);
begin
    if (cbCriterioConsulta.ItemIndex = 8) then
      edtConsulta.Enabled := False
    else
      edtConsulta.Enabled := True;
end;

procedure TfrmConsultaPai.cbCriterioConsultaExit(Sender: TObject);
begin
    if (cbCriterioConsulta.ItemIndex = 8) then
      edtConsulta.Enabled := False
    else
      edtConsulta.Enabled := True;
end;

procedure TfrmConsultaPai.cdsConsultaAfterOpen(DataSet: TDataSet);
var
    I: integer;
begin
    for I := 0 to DataSet.FieldCount - 1 do
    begin
        if DataSet.Fields[I] is TDateTimeField then
            TDateTimeField(DataSet.Fields[I]).DisplayFormat := 'dd/mm/yyyy';
    end;

end;

procedure TfrmConsultaPai.dbgConsultaDblClick(Sender: TObject);
begin
    ID := dsConsulta.DataSet.Fields[0].AsInteger;
    Close;
end;


procedure TfrmConsultaPai.dbgConsultaTitleClick(Column: TColumn);
begin
    FDQueryConsulta.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsultaPai.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FDQueryConsulta.Close;
    CamposSQL.Free;
end;

procedure TfrmConsultaPai.FormCreate(Sender: TObject);
begin
    CamposSQL := TStringList.Create;

 //   dspConsulta.SQLConnection := dmConexaoPai.conConexao;
 //   dspConsulta.ServerClassName := 'TSDMPaiConsulta';
 //   FDQueryConsulta.ProviderName := 'dspConsulta';
end;

procedure TfrmConsultaPai.FormShow(Sender: TObject);
var
    Lista: TStrings;
begin
    frmConsultaPai.Caption := 'Consulta de ' + FClass.Descricao;

    Lista := TStringList.Create;
    try
        cbCampoConsulta.Items.AddStrings(FClass.CamposConsulta(Lista, CamposSQL));
    finally
        Lista.Free;
    end;

    cbCampoConsulta.ItemIndex := 1;
    cbCriterioConsulta.ItemIndex := 7;

    edtConsulta.SetFocus;

end;

procedure TfrmConsultaPai.imgConfirmaClick(Sender: TObject);
begin
  ID := dsConsulta.DataSet.Fields[0].AsInteger;
  Close;
end;

procedure TfrmConsultaPai.imgPesquisarClick(Sender: TObject);
var
  Consulta: string;
begin
  Consulta := FClass.SQLBaseConsulta;
  Consulta := Consulta + SQLOperador;

  with FDQueryConsulta do
  begin
    Close;
    SQL.Clear;
    SQL.Text := Consulta;
    Open;
  end;
end;

procedure TfrmConsultaPai.sbPesquisarClick(Sender: TObject);
var
  Consulta: string;
begin
  Consulta := FClass.SQLBaseConsulta;
  Consulta := Consulta + SQLOperador;

  with FDQueryConsulta do
  begin
    Close;
    SQL.Clear;
    SQL.Text := Consulta;
    Open;
  end;
end;

function TfrmConsultaPai.SQLCampos: string;
begin
    Result := ' where ' + CamposSQL[cbCampoConsulta.ItemIndex];
end;

function TfrmConsultaPai.SQLOperador: string;
begin
    if cbCriterioConsulta.ItemIndex in [0..7] then
    begin
        if Trim(edtConsulta.Text) = '' then
        begin
            ShowMessage('Para este tipo de opereador, deve informar um valor.');
            Abort;
        end;
    end;

    case cbCriterioConsulta.ItemIndex of
        0: Result := SQLCampos + ' = ' + QuotedStr(Trim(edtConsulta.Text));
        1: Result := SQLCampos + ' > ' + QuotedStr(Trim(edtConsulta.Text));
        2: Result := SQLCampos + ' < ' + QuotedStr(Trim(edtConsulta.Text));
        3: Result := SQLCampos + ' >= ' + QuotedStr(Trim(edtConsulta.Text));
        4: Result := SQLCampos + ' <= ' + QuotedStr(Trim(edtConsulta.Text));
        5: Result := SQLCampos + ' like ' + QuotedStr(Trim(edtConsulta.Text) + '%');
        6: Result := SQLCampos + ' like ' + QuotedStr('%' + Trim(edtConsulta.Text));
        7: Result := SQLCampos + ' like ' + QuotedStr('%' + Trim(edtConsulta.Text) + '%');
        8: Result := '';
    end;
end;

end.


{    var varTabela, varCampo, varCriterio, varModalidade :string;
 // protected
  //  RefDM: TdmCadPai;
  fdmConsulta :TdmCadPai;
  end;

//  RefDM = class of TdmCadPai;

var
  frmConsultaPai: TfrmConsultaPai;

implementation

{$R *.dfm}
     {
procedure TfrmConsultaPai.dbgConsultaDblClick(Sender: TObject);
begin
{  with fdmConsulta.FDQueryPrincipal do
  Begin
    Close;
    ParamByName('CODIGO_PESSOA').AsInteger := FDQueryConsulta.Fields[0].AsInteger;
    Open;
  End;  }
{
end;

procedure TfrmConsultaPai.FormShow(Sender: TObject);
begin
  leConsulta.SetFocus;
end;

procedure TfrmConsultaPai.sbPesquisarClick(Sender: TObject);
var
  consulta, teste : String;
  qry : TFDQuery;
begin
  if leConsulta.Text = '' then
  Begin
    ShowMessage('Favor preencher o campo de consulta.');
    leConsulta.SetFocus;
  End
  else
  Begin
    with FDQueryConsulta do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + varTabela);
      SQL.Add(' where ' + varCampo + varCriterio);
      SQL.Add(' and ' + varModalidade);
      SQL.Add(' order by ' + varCampo);
      teste := SQL.Text;
      Open();
    End;
  End;
end;

end.                 }
