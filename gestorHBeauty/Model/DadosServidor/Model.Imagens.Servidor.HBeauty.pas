unit Model.Imagens.Servidor.HBeauty;

interface

function GravaImagem(AIdTabImagem : Integer; APrefixo, AExtensao, ATipoImagem, ARefImagem, APathOriginal : String; AResult : String = 'ID') : String;
function AtualizaImagem(AIDImagem : Integer) : String;
function ObterNomeImagem(AIDImagem : Integer) : String;

implementation

uses Controller.ClientModule.HBeauty;

function ObterNomeImagem(AIDImagem : Integer) : String;
begin
    Result := ControllerClientModule.ModelMetodosClient.ObterNomeImagem(AIDImagem);
end;

function GravaImagem(AIdTabImagem : Integer; APrefixo, AExtensao, ATipoImagem, ARefImagem, APathOriginal : String; AResult : String = 'ID') : String;
begin
    Result := ControllerClientModule.ModelMetodosClient.GravaImagem(AIdTabImagem, APrefixo, AExtensao, ATipoImagem, ARefImagem, APathOriginal, AResult);
end;

function AtualizaImagem(AIDImagem : Integer) : String;
begin
    Result := ControllerClientModule.ModelMetodosClient.AtualizaImagem(AIDImagem);
end;

end.
