unit Model.Dados.Server.HBeauty;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TModelConexaoDados = class(TDataModule)
    memUsuarios: TFDMemTable;
    memControles: TFDMemTable;
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
