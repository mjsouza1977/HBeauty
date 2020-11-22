unit Model.Habilidades.HBeauty;

interface

uses
    FMX.Forms;

type
    TModelHabilidades = class
    private
        FNomeHabilidade: String;
        FDescricaoHabilidade: String;
        FIdabilidade: Integer;
        FForm : TForm;
    FIdCargoHabilidade: Integer;
        procedure SetDescricaoHabilidade(const Value: String);
        procedure SetNomeHabilidade(const Value: String);
        procedure SetIdHabilidade(const Value: Integer);
        procedure SetIdCargoHabilidade(const Value: Integer);
    public
        property IdHabilidade        : Integer read FIdabilidade         write SetIdHabilidade;
        property NomeHabilidade      : String  read FNomeHabilidade      write SetNomeHabilidade;
        property DescricaoHabilidade : String  read FDescricaoHabilidade write SetDescricaoHabilidade;
        property IdCargoHabilidade   : Integer read FIdCargoHabilidade   write SetIdCargoHabilidade;
        constructor Create(AForm : TForm);
    end;

implementation

uses
  Winapi.Windows, FMX.Platform.Win, Units.Consts.HBeauty, System.SysUtils;

{ TModelHabilidades }

constructor TModelHabilidades.Create(AForm: TForm);
begin
    FForm := AForm;
end;

procedure TModelHabilidades.SetDescricaoHabilidade(const Value: String);
begin
    FDescricaoHabilidade := Value;
end;

procedure TModelHabilidades.SetIdCargoHabilidade(const Value: Integer);
begin
    if Value <= 0 then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'É necessário selecionar um cargo!',
                       apTitulo, MB_OK + MB_ICONINFORMATION);
           Abort;
        end
    else
        begin
            FIdCargoHabilidade := Value;
        end;
end;

procedure TModelHabilidades.SetIdHabilidade(const Value: Integer);
begin
  FIdabilidade := Value;
end;

procedure TModelHabilidades.SetNomeHabilidade(const Value: String);
begin
    if Value = '' then
        begin
            MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                       'A habilidade não pode ser vazio!',
                       apTitulo, MB_OK + MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
            FNomeHabilidade := Value;
        end;
end;

end.
