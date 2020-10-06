unit Controller.Dados.HBeauty;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TControllerDados = class(TDataModule)
    memUsuarios: TFDMemTable;
    memControle: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControllerDados: TControllerDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
