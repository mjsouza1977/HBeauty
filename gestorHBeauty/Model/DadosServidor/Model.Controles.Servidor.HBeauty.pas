unit Model.Controles.Servidor.HBeauty;

interface

uses Controller.ClientModule.HBeauty;


procedure CarregaControle;

implementation

uses
  Data.FireDACJSONReflect, Model.Dados.Server.HBeauty;

procedure CarregaControle;
var
    Controle : TFDJSONDataSets;
begin

    Controle := ControllerClientModule.ModelMetodosClient.CarregaControle;
    Assert(TFDJSONDataSetsReader.GetListCount(Controle) = 1);
    ModelConexaoDados.memControles.Active := False;
    ModelConexaoDados.memControles.AppendData(TFDJSONDataSetsReader.GetListValue(Controle, 0));
    ModelConexaoDados.memControles.Active := True;

end;

end.
