unit Model.Metodos.Imagens.ServerHBeauty;

interface

function GravaImagem(APrefixo, AExtensao : String) : Integer;
function AtualizaImagem(AIDImagem : Integer) : String;
function ObterNomeImagem(AIDImagem : Integer) : String;


implementation

uses
  System.SysUtils,
  Controller.Conexao.HBeautyServer,
  Units.Utils.ServerBeauty,
  VCL.Dialogs;

function ObterNomeImagem(AIDImagem : Integer) : String;
begin
    try
        ControllerConexao.qryQuery.Close;
        ControllerConexao.qryQuery.SQL.Clear;
        ControllerConexao.qryQuery.SQL.Add('SELECT NOMEFILEIMAGEM FROM HBIMAGENS');
        ControllerConexao.qryQuery.SQL.Add('WHERE IDIMAGEM = :IDIMAGEM');
        ControllerConexao.qryQuery.ParamByName('IDIMAGEM').AsInteger := AIDImagem;
        ControllerConexao.qryQuery.Open;

        Result := ControllerConexao.qryQuery.FieldByName('NOMEFILEIMAGEM').AsString;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;


function AtualizaImagem(AIDImagem : Integer) : String;
begin
    try
        try
            ControllerConexao.qryQuery.Close;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBIMAGENS SET');
            ControllerConexao.qryQuery.SQL.Add('UPDATEIMAGEM = :UPDATEIMAGEM');
            ControllerConexao.qryQuery.SQL.Add('WHERE IDIMAGEM = :IDIMAGEM');
            ControllerConexao.qryQuery.ParamByName('IDIMAGEM').AsInteger      := AIDImagem;
            ControllerConexao.qryQuery.ParamByName('UPDATEIMAGEM').AsDateTime := Now;
            ControllerConexao.qryQuery.ExecSQL;
            Result := '';
        except on E:Exception do
            Result := E.Message;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function GravaImagem(APrefixo, AExtensao : String) : Integer;
begin

     try
         ControllerConexao.qryQueryAux.Close;
         ControllerConexao.qryQueryAux.SQL.Clear;
         ControllerConexao.qryQueryAux.SQL.Add('INSERT INTO HBIMAGENS');
         ControllerConexao.qryQueryAux.SQL.Add('(NOMEFILEIMAGEM) VALUES');
         ControllerConexao.qryQueryAux.SQL.Add('(:NOMEFILEIMAGEM)');
         ControllerConexao.qryQueryAux.ParamByName('NOMEFILEIMAGEM').AsString := GeraNomeImagem(APrefixo, AExtensao);
         ControllerConexao.qryQueryAux.ExecSQL;

         ControllerConexao.qryQueryAux.Close;
         ControllerConexao.qryQueryAux.SQL.Clear;
         ControllerConexao.qryQueryAux.SQL.Add('SELECT MAX(IDIMAGEM) AS IDIMAGEM FROM HBIMAGENS');
         ControllerConexao.qryQueryAux.Open;

         Result := ControllerConexao.qryQueryAux.FieldByName('IDIMAGEM').AsInteger;

     finally
         ControllerConexao.qryQueryAux.Close;
     end;

end;



end.
