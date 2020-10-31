unit Model.Habilidades.HBeauty;

interface

type
    TModelHabilidades = class
        private
            FNomeHabilidade: String;
            FDescricaoHabilidade: String;
    FIdabilidade: Integer;
            procedure SetDescricaoHabilidade(const Value: String);
            procedure SetNomeHabilidade(const Value: String);
    procedure SetIdabilidade(const Value: Integer);

        public
            property Idabilidade         : Integer read FIdabilidade         write SetIdabilidade;
            property NomeHabilidade      : String  read FNomeHabilidade      write SetNomeHabilidade;
            property DescricaoHabilidade : String  read FDescricaoHabilidade write SetDescricaoHabilidade;
    end;

implementation

{ TModelHabilidades }

procedure TModelHabilidades.SetDescricaoHabilidade(const Value: String);
begin
  FDescricaoHabilidade := Value;
end;

procedure TModelHabilidades.SetIdabilidade(const Value: Integer);
begin
  FIdabilidade := Value;
end;

procedure TModelHabilidades.SetNomeHabilidade(const Value: String);
begin
  FNomeHabilidade := Value;
end;

end.
