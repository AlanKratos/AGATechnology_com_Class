unit uFrmCadConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadConta, JvExStdCtrls, JvCombobox,
  JvDBCombobox, Vcl.DBCtrls, JvDBControls, JvDBCheckBox;

type
  TfrmCadConta = class(TfrmCadPai)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    dbedtDESCRICAO_CONTA: TDBEdit;
    jvdbcmbxCLASSIFICACAO_CONTA: TJvDBComboBox;
    chckbxSTATUS_CONTA: TJvDBCheckBox;
    jvdbcmbdtBANCO_CONTA: TJvDBComboEdit;
    dbedtDESCRICAO_BANCO: TDBEdit;
    dbedtAGENCIA_CONTA: TDBEdit;
    dbedtNUMEROCONTA_CONTA: TDBEdit;
    dbedtDIGITOCONTA_CONTA: TDBEdit;
    dbedtDIGITOAGENCIA_CONTA: TDBEdit;
    dbedtTITULAR_CONTA: TDBEdit;
    dbedtCNPJ_CONTA: TDBEdit;
    dbedtCPF_CONTA: TDBEdit;
    dbedtSLIP_CONTA: TDBEdit;
    dbedtCAMARACOMPENSACAO_BANCO: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConta: TfrmCadConta;

implementation

{$R *.dfm}

procedure TfrmCadConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadConta := nil;
end;

procedure TfrmCadConta.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadConta := TdmCadConta.Create(self); // Instanciar DM
//  self.tabela := 'CONTA';
//  self.campochave := 'CODIGO_CONTA';
//  self.TipoPessoa := 'CODIGO_CONTA > 0 ';
//  self.fdmCadPai := dmCadConta;

  with dmCadConta do
  begin
    QueryCadastro.Close;
    QueryCadastro.Open;
  end;
end;

end.
