unit Model.Usuarios.Servidor.HBeauty;

interface

uses Controller.Conexao.Proxy.HBeauty,
     Model.Usuarios.HBeauty,
     Controller.ClientModule.HBeauty,
     Units.Utils.HBeauty;


function ValidaLogin(Usuario, Senha : String) : Boolean;


implementation

uses
  Data.FireDACJSONReflect, System.SysUtils, Model.Dados.Server.HBeauty;


function ValidaLogin(Usuario, Senha : String) : Boolean;
var
    LoginUsuario : TFDJSONDataSets;
begin

    LoginUsuario := ControllerClientModule.ModelMetodosClient.ValidaLogin(Usuario, Senha);
    Assert(TFDJSONDataSetsReader.GetListCount(LoginUsuario) = 1);
    ModelConexaoDados.memUsuarios.Active := False;
    ModelConexaoDados.memUsuarios.AppendData(TFDJSONDataSetsReader.GetListValue(LoginUsuario, 0));
    ModelConexaoDados.memUsuarios.Active := True;

    Result := StringToBool('1','0',IntToStr(ModelConexaoDados.memUsuarios.RecordCount));

end;


end.
