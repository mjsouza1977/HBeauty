unit Model.Usuarios.Servidor.HBeauty;

interface

uses Controller.Conexao.Proxy.HBeauty,
     Model.Usuarios.HBeauty,
     Controller.Dados.HBeauty,
     Controller.ClientModule.HBeauty,
     Units.Utils.HBeauty;


function ValidaLogin(Usuario, Senha : String) : Boolean;


implementation

uses
  Data.FireDACJSONReflect, System.SysUtils;


function ValidaLogin(Usuario, Senha : String) : Boolean;
var
    LoginUsuario : TFDJSONDataSets;
begin

    ControllerClientModule.ModelMetodosClient.ValidaLogin(Usuario, Senha);
    Assert(TFDJSONDataSetsReader.GetListCount(LoginUsuario) = 1);
    ControllerDados.memUsuarios.Active := False;
    ControllerDados.memUsuarios.AppendData(TFDJSONDataSetsReader.GetListValue(LoginUsuario, 0));
    ControllerDados.memUsuarios.Active := True;

    Result := StringToBool('1','0',IntToStr(ControllerDados.memUsuarios.RecordCount));

end;


end.
