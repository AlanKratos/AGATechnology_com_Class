unit uFrmCadCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, ACBrBase,
  ACBrDFe, ACBrNFe, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.DBCtrls,
  udmDocEntrada;

type
    TMensagem = class
  private
    FCorpo: String;
    FCabecalho: String;
    FPara: String;
    FDe: String;
  public
    property Para     : String read FPara      write FPara;
    property De       : String read FDe        write FDe;
    property Cabecalho: String read FCabecalho write FCabecalho;
    property Corpo    : String read FCorpo     write FCorpo;
  end;



  TfrmCadCompra = class(TfrmCadPai)
    PanelCenter: TPanel;
    dbgItens: TJvDBGrid;
    dbeChaveAcesso: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeNumero: TDBEdit;
    procedure dbgItensDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgItensTitleClick(Column: TColumn);
    procedure dbgItensMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCompra: TfrmCadCompra;

implementation

{$R *.dfm}

{ TfrmCadCompra }

procedure TfrmCadCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadCompra := nil;
end;

procedure TfrmCadCompra.FormCreate(Sender: TObject);
begin
  inherited;
  dmDocEntrada := TdmDocEntrada.Create(self); // Instanciar DM
//  self.tabela := 'DOCUMENTOS_ENTRADA';
//  self.campochave := 'CODIGO_DOC_ENTRADA';
//  self.TipoPessoa := 'CODIGO_DOC_ENTRADA > 0';
//  self.fdmCadPai := dmDocEntrada;
  //JvDBCheckBoxCliente := ''
  // self.modalidade := QuotedStr('1 = 1'); usar quando nao precisar utilizar
  //modalidade no where

  with dmDocEntrada do
  begin
    QueryCadastro.Close;
    QueryCadastro.Open;
  end;
end;

procedure TfrmCadCompra.dbgItensDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  {with DBGrid1 do
  begin
    if Odd( DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clSilver
    else
      Canvas.Brush.Color := clMoneyGreen;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;}
end;

procedure TfrmCadCompra.dbgItensMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  mousePt: TGridcoord;
begin
  inherited;
  {
  //mudar o icone do mouse quando este estivar passando pelo titulo dos campos
  mousePt := DbGrid1.MouseCoord(x,y);
  if mousePt.y = 0 then
    Screen.Cursor := crHandPoint
  else
    Screen.Cursor := crDefault;
  }
end;

procedure TfrmCadCompra.dbgItensTitleClick(Column: TColumn);
var
  I: Integer;
begin
  inherited;
   {
   //ordenar pelo titulo da coluna
    for I := 0 to JvDBGrid1.Columns.Count - 1 do
    JvDBGrid1.Columns[i].Title.Font.Style := [];
    TClientDataSet(JvDBGrid1.DataSource.DataSet).IndexFieldNames := Column.FieldName;
    Column.Title.Font.Style := [fsBold];
    }
end;


end.
