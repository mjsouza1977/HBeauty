unit Model.Genericos.Servidor.HBeauty;

interface

uses Controller.Conexao.Proxy.HBeauty, Controller.ClientModule.HBeauty,
     FMX.Forms, Data.FireDACJSONReflect, FireDAC.Comp.Client;

function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String; AForm : TForm; ANomeCampo, ATipoTabela : String) : Boolean;
function ManipulaEstadoRegistro(ABloqueia : Boolean; AIdRegistro: Integer; ACampoID, ATabela : String) : Boolean;
function carregaCamposSelecionados(AMemTable : TFDMemTable; ACampos, ATabela : String; ACondicao : String = '') : TFDJSONDataSets;
function carregaCamposSQL(AMemTable : TFDMemTable; ASQL: String): TFDJSONDataSets;
procedure DebloqueiaRegistro(ATabela: String);
function GeraNomeImagem(APrefixo, AExtensao: String): String;

implementation

uses
  Winapi.Windows, FMX.Platform.Win, Units.Consts.HBeauty, System.SysUtils,
  Model.Dados.Server.HBeauty;

function GeraNomeImagem(APrefixo, AExtensao: String): String;
begin
    Result := ControllerClientModule.ModelMetodosClient.GeraNomeImagem(APrefixo, AExtensao);
end;

function carregaCamposSQL(AMemTable : TFDMemTable; ASQL: String): TFDJSONDataSets;
var
    dsGenerico : TFDJSONDataSets;
begin
    dsGenerico := ControllerClientModule.ModelMetodosClient.carregaCamposSQL(ASQL);
    Assert(TFDJSONDataSetsReader.GetListCount(dsGenerico) = 1);
    AMemTable.Active := False;
    AMemTable.AppendData(TFDJSONDataSetsReader.GetListValue(dsGenerico, 0));
    AMemTable.Active := True;
end;

function carregaCamposSelecionados(AMemTable : TFDMemTable; ACampos, ATabela : String; ACondicao : String = '') : TFDJSONDataSets;
var
    dsGenerico : TFDJSONDataSets;
begin
    dsGenerico := ControllerClientModule.ModelMetodosClient.carregaCamposSelecionados(ACampos, ATabela, ACondicao);
    Assert(TFDJSONDataSetsReader.GetListCount(dsGenerico) = 1);
    AMemTable.Active := False;
    AMemTable.AppendData(TFDJSONDataSetsReader.GetListValue(dsGenerico, 0));
    AMemTable.Active := True;
end;

procedure DebloqueiaRegistro(ATabela: String);
begin
    ControllerClientModule.ModelMetodosClient.DebloqueiaRegistro(ATabela, gIDUsuarioConectado);
end;

function ManipulaEstadoRegistro(ABloqueia : Boolean; AIdRegistro: Integer; ACampoID, ATabela : String) : Boolean;
begin
    Result := ControllerClientModule.ModelMetodosClient.ManipulaEstadoRegistro(ABloqueia ,gIDUsuarioConectado, AIdRegistro, ACampoID, ATabela);
end;

function DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela : String; AForm : TForm; ANomeCampo, ATipoTabela : String) : Boolean;
var
ARepetido : String;
begin

    ARepetido := '';
    ARepetido := ControllerClientModule.ModelMetodosClient.DocumentoRepetido(ADocumento, ACampoDocumento, ACampoNome, ATabela);

    if ARepetido <> '' then
        begin
            Result := True;
            MessageBox(WindowHandleToPlatform(AForm.Handle).Wnd,
                       pChar(ATipoTabela + ARepetido + ' esta cadastrada com o ' + ANomeCampo + ' informado, verifique!'),
                        apTitulo, MB_OK + MB_ICONWARNING);
            Abort;
        end
    else
        begin
            Result := False;
        end;
end;

end.
