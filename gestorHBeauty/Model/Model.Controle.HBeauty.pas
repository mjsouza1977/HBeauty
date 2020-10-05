unit Model.Controle.HBeauty;

interface

uses
  System.UITypes;

type
    TModelControle = class
    private
    FCOR_BOTOES_NEGATIVO: TAlphaColor;
    FCOR_BOTOES_POSITIVO: TAlphaColor;
    procedure SetCOR_BOTOES_NEGATIVO(const Value: TAlphaColor);
    procedure SetCOR_BOTOES_POSITIVO(const Value: TAlphaColor);

    public

    property COR_BOTOES_POSITIVO : TAlphaColor read FCOR_BOTOES_POSITIVO write SetCOR_BOTOES_POSITIVO;
    property COR_BOTOES_NEGATIVO : TAlphaColor read FCOR_BOTOES_NEGATIVO write SetCOR_BOTOES_NEGATIVO;
    end;

implementation

{ TControllerControle }

procedure TModelControle.SetCOR_BOTOES_NEGATIVO(const Value: TAlphaColor);
begin
  FCOR_BOTOES_NEGATIVO := Value;
end;

procedure TModelControle.SetCOR_BOTOES_POSITIVO(const Value: TAlphaColor);
begin
  FCOR_BOTOES_POSITIVO := Value;
end;

end.
