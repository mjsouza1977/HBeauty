unit Utils.Query.HBeautyServer;

interface

uses
  Controller.Conexao.HBeautyServer, Controller.Dados.HBeautyServer,
  FireDAC.Comp.Client;

type
    TUtilsQuery = class(TFDQuery)
    private
       FAConexao : TControllerConexao;
       FFDQuery  : TControllerQuery;

    public
        constructor Create;

    end;

implementation


{ TUtilsQuery }

constructor TUtilsQuery.Create;
begin
    FAConexao := TControllerConexao.Create;
    FFDQuery  := TControllerQuery.Create(nil, FAConexao.AConexao);
end;

end.
