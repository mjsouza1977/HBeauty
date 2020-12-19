unit Model.Marca.Servidor.HBeauty;

interface

uses
     Data.FireDACJSONReflect,
     FireDAC.Stan.Param,
     Model.Marcas.HBeauty;


function carregaMarcas : TFDJSONDataSets;
function pesquisaMarcas(AIdMarca : Integer; AMarca : String) : TFDJSONDataSets;
function cadastraMarca(AMarca  : String) : String;
function atualizaMarca(AMarca : TModelMarcas) : String;


implementation

uses
  Controller.ClientModule.HBeauty,
   Model.Dados.Server.HBeauty;


function carregaMarcas : TFDJSONDataSets;
var
   dsMarca : TFDJSONDataSets;
begin
   dsMarca := ControllerClientModule.ModelMetodosClient.carregaMarcas;
   Assert(TFDJSONDataSetsReader.GetListCount(dsMarca) = 1);
   ModelConexaoDados.memMarcas.Active := False;
   ModelConexaoDados.memMarcas.AppendData(TFDJSONDataSetsReader.GetListValue(dsMarca, 0));
   ModelConexaoDados.memMarcas.Active := True;
end;

function pesquisaMarcas(AIdMarca : Integer; AMarca : String) : TFDJSONDataSets;
var
   dsMarca : TFDJSONDataSets;
begin
   dsMarca := ControllerClientModule.ModelMetodosClient.pesquisaMarcas(AIdMarca, AMarca);
   Assert(TFDJSONDataSetsReader.GetListCount(dsMarca) = 1);
   ModelConexaoDados.memMarcas.Active := False;
   ModelConexaoDados.memMarcas.AppendData(TFDJSONDataSetsReader.GetListValue(dsMarca, 0));
   ModelConexaoDados.memMarcas.Active := True;
end;

function cadastraMarca(AMarca  : String) : String;
begin
     Result := ControllerClientModule.ModelMetodosClient.cadastraMarca(AMarca);
end;

function atualizaMarca(AMarca : TModelMarcas) : String;
begin
     Result := ControllerClientModule.ModelMetodosClient.atualizaMarca(AMarca.ID_MARCA, AMarca.MARCA_MARCA);
end;

end.
