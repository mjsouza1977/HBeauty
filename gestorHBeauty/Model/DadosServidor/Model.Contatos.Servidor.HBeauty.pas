unit Model.Contatos.Servidor.HBeauty;

interface

uses
    Controller.ClientModule.HBeauty,
    Model.Dados.Server.HBeauty,
    Model.Telefones.HBeauty, Model.Emails.HBeauty;

procedure CarregaEmails(ATipoEmail : String; AIdTabEmail : Integer);
procedure CarregaTelefones(ATipoFone : String; AIdTabFone : Integer);

function CadastraTelefone(ATelefone : TModelTelefones) : Integer;
function CadastraEmail(AEmail : TModelEmails) : Integer;

function AtualizaEmail(AEmail : TModelEmails) : Boolean;
function AtualizaTelefone(ATelefone : TModelTelefones) : Boolean;



implementation

uses
  Data.FireDACJSONReflect;

function AtualizaEmail(AEmail : TModelEmails) : Boolean;
begin
    Result := ControllerClientModule.ModelMetodosClient.AtualizaEmail(AEmail.Email, AEmail.IdEmail, AEmail.Restrito);
end;

function AtualizaTelefone(ATelefone : TModelTelefones) : Boolean;
begin
    Result := ControllerClientModule.ModelMetodosClient.AtualizaTelefone(ATelefone.Telefone, ATelefone.Contato, ATelefone.IdTelefone,
                                                                         ATelefone.WhatsApp, ATelefone.Restrito);
end;

function CadastraTelefone(ATelefone : TModelTelefones) : Integer;
begin

    Result := ControllerClientModule.ModelMetodosClient.CadastraTelefone(ATelefone.Telefone, ATelefone.Contato, ATelefone.NomeTabela,
                                                                          ATelefone.IdTabela, ATelefone.WhatsApp, ATelefone.Restrito);

end;

function CadastraEmail(AEmail : TModelEmails) : Integer;
begin

    Result := ControllerClientModule.ModelMetodosClient.CadastraEmail(AEmail.Email, AEmail.NomeTabela, AEmail.IdTabela, AEmail.Restrito);

end;

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

    dsTelefone := ControllerClientModule.ModelMetodosClient.CarregaTelefones(ATipoFone, AIdTabFone);
    Assert(TFDJSONDataSetsReader.GetListCount(dsTelefone) = 1);
    ModelConexaoDados.memContatos.Active := False;
    ModelConexaoDados.memContatos.AppendData(TFDJSONDataSetsReader.GetListValue(dsTelefone, 0));
    ModelConexaoDados.memContatos.Active := True;

end;

end.
