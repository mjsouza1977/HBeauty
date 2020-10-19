unit Model.Contatos.Servidor.HBeauty;

interface

uses
    Controller.ClientModule.HBeauty,
    Model.Dados.Server.HBeauty;

procedure CarregaEmails(ATipoEmail : String; AIdTabEmail : Integer);
procedure CarregaTelefones(ATipoFone : String; AIdTabFone : Integer);

implementation

uses
  Data.FireDACJSONReflect;


procedure CarregaEmails(ATipoEmail : String; AIdTabEmail : Integer);
var
    dsEmail : TFDJSONDataSets;
begin

    dsEmail := ControllerClientModule.ModelMetodosClient.CarregaEmails(ATipoEmail, AIdTabEmail);
    Assert(TFDJSONDataSetsReader.GetListCount(dsEmail) = 1);
    ModelConexaoDados.memContatos.Active := False;
    ModelConexaoDados.memContatos.AppendData(TFDJSONDataSetsReader.GetListValue(dsEmail, 0));
    ModelConexaoDados.memContatos.Active := True;

end;

procedure CarregaTelefones(ATipoFone : String; AIdTabFone : Integer);
var
    dsTelefone : TFDJSONDataSets;
begin

    dsTelefone := ControllerClientModule.ModelMetodosClient.CarregaEmails(ATipoFone, AIdTabFone);
    Assert(TFDJSONDataSetsReader.GetListCount(dsTelefone) = 1);
    ModelConexaoDados.memContatos.Active := False;
    ModelConexaoDados.memContatos.AppendData(TFDJSONDataSetsReader.GetListValue(dsTelefone, 0));
    ModelConexaoDados.memContatos.Active := True;

end;

end.
