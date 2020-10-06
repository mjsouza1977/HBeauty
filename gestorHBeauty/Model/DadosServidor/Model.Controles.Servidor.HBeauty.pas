unit Model.Controles.Servidor.HBeauty;

interface

uses Model.Controle.HBeauty, Controller.ClientModule.HBeauty;


procedure CarregaControle;

implementation

uses
  Controller.Dados.HBeauty, Data.FireDACJSONReflect;

procedure CarregaControle;
var
    Controle : TFDJSONDataSets;
begin

    ControllerClientModule.ModelMetodosClient.CarregaControle;
    Assert(TFDJSONDataSetsReader.GetListCount(Controle) = 1);
    ControllerDados.memControle.Active := False;
    ControllerDados.memControle.AppendData(TFDJSONDataSetsReader.GetListValue(Controle, 0));
    ControllerDados.memControle.Active := True;

end;

end.
