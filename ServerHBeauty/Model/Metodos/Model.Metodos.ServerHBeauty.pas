unit Model.Metodos.ServerHBeauty;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth,

    Data.FireDACJSONReflect,

    Controller.Dados.HBeautyServer,
    Controller.Conexao.HBeautyServer, Model.Usuarios.ServerHBeauty;

type
{$METHODINFO ON}
  TModelMetodos = class(TDataModule)
  private

  public
    function CarregaControle : TFDJSONDataSets;
    function ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils, Model.Controle.ServerHBeauty;



{ TModelMetodos }

function TModelMetodos.ValidaLogin(Usuario, Senha : String) : TFDJSONDataSets;
begin
    Result := Model.Usuarios.ServerHBeauty.ValidaLogin(Usuario, Senha);
end;

function TModelMetodos.CarregaControle: TFDJSONDataSets;
begin
     Result := Model.Controle.ServerHBeauty.CarregaControle;
end;


end.

