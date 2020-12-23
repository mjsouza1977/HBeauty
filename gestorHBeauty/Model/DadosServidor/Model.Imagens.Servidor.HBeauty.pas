unit Model.Imagens.Servidor.HBeauty;

interface

function GravaImagem(APrefixo, AExtensao : String) : Integer;
function AtualizaImagem(AIDImagem : Integer) : String;
function ObterNomeImagem(AIDImagem : Integer) : String;

implementation

uses Controller.ClientModule.HBeauty;

function ObterNomeImagem(AIDImagem : Integer) : String;
begin
    Result := ControllerClientModule.ModelMetodosClient.ObterNomeImagem(AIDImagem);
end;

function GravaImagem(APrefixo, AExtensao : String) : Integer;
begin
    Result := ControllerClientModule.ModelMetodosClient.GravaImagem(APrefixo, AExtensao);
end;

function AtualizaImagem(AIDImagem : Integer) : String;
begin
    Result := ControllerClientModule.ModelMetodosClient.AtualizaImagem(AIDImagem);
end;

end.
