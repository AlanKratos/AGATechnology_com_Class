unit uFrmCadCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, JvDBControls, JvExStdCtrls, JvCombobox,
  JvDBCombobox, Vcl.DBCtrls, udmCadCidade;

type
  TfrmCadCidade = class(TfrmCadPai)
    Panel2: TPanel;
    dbeDescCidade: TDBEdit;
    dbeDescUf: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    jvdbcmbdtUF_CIDADE: TJvDBComboEdit;
    dbeCodMunicipio: TDBEdit;
    dbeSiglaUf: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnPesquisarClick(Sender: TObject);
    procedure JvCalcEditCodigoButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCidade: TfrmCadCidade;

implementation

{$R *.dfm}

uses ClassCidade, uFrmConsultaPai;

procedure TfrmCadCidade.BitBtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadCidade do
      Begin
//        FDTransactionPrincipal.StartTransaction;
          QueryCadastro.Delete;
  //      FDTransactionPrincipal.Commit;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;
end;

procedure TfrmCadCidade.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbeDescCidade.SetFocus;
end;

procedure TfrmCadCidade.BitBtnPesquisarClick(Sender: TObject);
begin

 {if frmConsultaPai = nil then
    frmConsultaPai := TfrmConsultaPai.Create(Self);
  if frmConsultaPai.WindowState = wsMinimized then
    frmConsultaPai.WindowState := wsNormal
  else
    frmConsultaPai.ShowModal;
               }

    frmConsultaPai := TfrmConsultaPai.Create(Self);
    frmConsultaPai.FClass := TClassCidade;
    frmConsultaPai.ShowModal;
    JvCalcEditCodigo.AsInteger := frmConsultaPai.ID;
    FreeAndNil(frmConsultaPai);
  inherited;
end;

procedure TfrmCadCidade.BitBtnSalvarClick(Sender: TObject);
begin
  try
    dsCadastro.DataSet.Post;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;
  inherited;
end;

procedure TfrmCadCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadCidade := nil;
end;

procedure TfrmCadCidade.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadCidade := TdmCadCidade.Create(self); // Instanciar DM
  self.fdmCadPai := dmCadCidade;

  with dmCadCidade do
  begin
    QueryCadastro.Close;
    QueryCadastro.Open;
  end;
end;

procedure TfrmCadCidade.FormShow(Sender: TObject);
begin
  inherited;
with dmCadCidade do
  Begin
    QueryCadastro.FieldByName('UF_CIDADE').OnValidate := Validate_Uf;
  End;
end;

procedure TfrmCadCidade.JvCalcEditCodigoButtonClick(Sender: TObject);
begin
  BitBtnPesquisar.Click;
  inherited;
end;

end.
