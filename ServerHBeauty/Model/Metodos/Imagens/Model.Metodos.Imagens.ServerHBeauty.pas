unit Model.Metodos.Imagens.ServerHBeauty;

interface

function GravaImagem(AIDTabImagem : Integer; APrefixo, AExtensao, ATipoImagem, ARefImagem, APathOriginal : String) : Integer;
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
            ControllerConexao.qryQuery.SQL.Clear;
            ControllerConexao.qryQuery.SQL.Add('UPDATE HBIMAGENS SET');
            ControllerConexao.qryQuery.SQL.Add('UPDATEIMAGEM = ''T''');
            ControllerConexao.qryQuery.SQL.Add('WHERE IDIMAGEM = :IDIMAGEM');
            ControllerConexao.qryQuery.ParamByName('IDIMAGEM').AsInteger    := AIDImagem;
            ControllerConexao.qryQuery.ExecSQL;
            Result := '';
        except on E:Exception do
            Result := E.Message;
        end;
    finally
        ControllerConexao.qryQuery.Close;
    end;
end;

function GravaImagem(AIDTabImagem : Integer; APrefixo, AExtensao, ATipoImagem, ARefImagem, APathOriginal : String) : Integer;
begin

     try
         ControllerConexao.qryQueryAux.Close;
         ControllerConexao.qryQueryAux.SQL.Clear;
         ControllerConexao.qryQueryAux.SQL.Add('INSERT INTO HBIMAGENS');
         ControllerConexao.qryQueryAux.SQL.Add('(NOMEFILEIMAGEM, IDTABIMAGEM, TIPOIMAGEM, REFIMAGEM, PATHORIGINALIMAGEM) VALUES');
         ControllerConexao.qryQueryAux.SQL.Add('(:NOMEFILEIMAGEM, :IDTABIMAGEM, :TIPOIMAGEM, :REFIMAGEM, :PATHORIGINALIMAGEM)');
         ControllerConexao.qryQueryAux.ParamByName('NOMEFILEIMAGEM'    ).AsString  := GeraNomeImagem(APrefixo, AExtensao);
         ControllerConexao.qryQueryAux.ParamByName('IDTABIMAGEM'       ).AsInteger := AIDTabImagem;
         ControllerConexao.qryQueryAux.ParamByName('TIPOIMAGEM'        ).AsString  := ATipoImagem;
         ControllerConexao.qryQueryAux.ParamByName('REFIMAGEM'         ).AsString  := ARefImagem;
         ControllerConexao.qryQueryAux.ParamByName('PATHORIGINALIMAGEM').AsString  := APathOriginal;

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
