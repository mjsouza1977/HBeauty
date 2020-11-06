unit Model.Dados.Server.HBeauty;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin, REST.Types, REST.Response.Adapter, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TModelConexaoDados = class(TDataModule)
    memUsuarios: TFDMemTable;
    memControles: TFDMemTable;
    memProfissionais: TFDMemTable;
    memContatos: TFDMemTable;
    memHabilidades: TFDMemTable;
    memHbilXProfis: TFDMemTable;
    RESTClient: TRESTClient;
    RESTResponse: TRESTResponse;
    RESTRequest: TRESTRequest;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    memCep: TFDMemTable;
    memCepcep: TWideStringField;
    memCeplogradouro: TWideStringField;
    memCepbairro: TWideStringField;
    memCeplocalidade: TWideStringField;
    memCepuf: TWideStringField;
    memTerceirizada: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  ModelConexaoDados: TModelConexaoDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }



end.
