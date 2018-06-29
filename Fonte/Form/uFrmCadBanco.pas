unit uFrmCadBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadPai, JvComponentBase, JvEnterTab, Vcl.DBCtrls,
  Data.DB, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits, uDmCadBanco,
  Vcl.Buttons, JvDBCheckBox, JvDBImage, Vcl.ExtDlgs, Vcl.ExtCtrls;

type
  TfrmCadBanco = class(TfrmCadPai)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    spbtnIncluir: TSpeedButton;
    spbtnExcluir: TSpeedButton;
    dbedtDESCRICAO_BANCO: TDBEdit;
    dbedtCAMARACOMPENSACAO_BANCO: TDBEdit;
    chckbxSTATUS_BANCO: TJvDBCheckBox;
    JvDBImageLogo: TJvDBImage;
    dlgOpenPic: TOpenPictureDialog;
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spbtnExcluirClick(Sender: TObject);
    procedure spbtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBanco: TfrmCadBanco;

implementation

{$R *.dfm}

procedure TfrmCadBanco.BitBtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadBanco do
      Begin
        QueryCadastro.Delete;
        TFDSchemaAdapterBanco.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

end;

procedure TfrmCadBanco.BitBtnSalvarClick(Sender: TObject);
begin
  try
    dsCadastro.DataSet.Post;
    JvCalcEditCodigo.Text := dmCadBanco.QueryCadastro.FieldByName('CODIGO_BANCO').AsString;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;
  inherited;
end;

procedure TfrmCadBanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadBanco := nil;

end;

procedure TfrmCadBanco.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadBanco := TdmCadBanco.Create(self); // Instanciar DM

  with dmCadBanco do
  begin
    QueryCadastro.Close;
    QueryCadastro.Open;
  end;

end;

procedure TfrmCadBanco.spbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if (Application.MessageBox('Deseja realmente excluir a imagem?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  try
    Begin
      dmCadBanco.QueryCadastro.Edit;
      dsCadastro.DataSet.Edit;
      JvDBImageLogo.Picture:= nil;
    End;
  Except
    ShowMessage('Erro ao tentar excluir o arquivo');
    exit;
  end;

end;

procedure TfrmCadBanco.spbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if dlgOpenPic.Execute then
  try
    Begin
      dmCadBanco.QueryCadastro.Edit;
      dsCadastro.DataSet.Edit;
      JvDBImageLogo.Picture.LoadFromFile(dlgOpenPic.FileName);
    End;
  except
    ShowMessage('Arquivo Inválido');
    exit;
  end;
end;

end.
