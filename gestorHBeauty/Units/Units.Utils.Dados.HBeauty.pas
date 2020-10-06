unit Units.Utils.Dados.HBeauty;

interface

uses
    System.UIConsts;


procedure CarregaVariaveisControle;

implementation


uses
  Units.Classes.HBeauty,
  Model.Controle.HBeauty,
  Units.COnsts.HBeauty,
  Model.Dados.Server.HBeauty,
  Model.Controles.Servidor.HBeauty;

procedure CarregaVariaveisControle;
begin

    try
        gControle := TModelControle.Create;
        CarregaControle;

        gControle.COR_BOTOES_POSITIVO := StringToAlphaColor(ModelConexaoDados.memControles.FieldByName('COR_BOTOES_POSITIVO').AsString);
        gControle.COR_BOTOES_NEGATIVO := StringToAlphaColor(ModelConexaoDados.memControles.FieldByName('COR_BOTOES_NEGATIVO').AsString);

        ctrFCOR_BOTOES_NEGATIVO := gControle.COR_BOTOES_NEGATIVO;
        ctrFCOR_BOTOES_POSITIVO := gControle.COR_BOTOES_POSITIVO;
    finally
        gControle.DisposeOf;
    end;

end;

end.
