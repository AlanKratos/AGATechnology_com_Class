unit uDmCadPais;

interface

uses
  System.SysUtils, System.Classes, uDmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCadPais = class(TdmCadPai)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadPais: TdmCadPais;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
