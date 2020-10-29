unit Model.Telefones.HBeauty;

interface

uses
  FMX.Forms, FMX.Platform.Win;

type
    TModelTelefones = class

    private
    FNomeTabela: String;
    FRestrito: Boolean;
    FContato: String;
    FWhatsApp: Boolean;
    FIdTabela: Integer;
    FInativo: Boolean;
    FTelefone: String;
    FFormulario : TForm;
    FIdTelefone: Integer;
    procedure SetContato(const Value: String);
    procedure SetIdTabela(const Value: Integer);
    procedure SetInativo(const Value: Boolean);
    procedure SetNomeTabela(const Value: String);
    procedure SetRestrito(const Value: Boolean);
    procedure SetTelefone(const Value: String);
    procedure SetWhatsApp(const Value: Boolean);
    procedure SetIdTelefone(const Value: Integer);

    public

        property Telefone   : String  read FTelefone   write SetTelefone;
        property Contato    : String  read FContato    write SetContato;
        property NomeTabela : String  read FNomeTabela write SetNomeTabela;
        property Inativo    : Boolean read FInativo    write SetInativo;
        property IdTabela   : Integer read FIdTabela   write SetIdTabela;
        property WhatsApp   : Boolean read FWhatsApp   write SetWhatsApp;
        property Restrito   : Boolean read FRestrito   write SetRestrito;
        property IdTelefone : Integer read FIdTelefone write SetIdTelefone;

        constructor Create(AForm : TForm);

    end;

implementation

uses
  Winapi.Windows, System.SysUtils, Units.Consts.HBeauty, Units.Strings.HBeauty;

{ TModelTelefones }

constructor TModelTelefones.create(AForm: TForm);
begin
     FFormulario := AForm;
end;

procedure TModelTelefones.SetContato(const Value: String);
begin
    if Length(Trim(Value)) < 3 then
        begin
            MessageBox(WindowHandleToPlatform(FFormulario.Handle).Wnd,
                       'Nome de contato inválido, verifique!',
                       apTitulo,
                       MB_OK + MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
            FContato := Value;
        end;
end;

procedure TModelTelefones.SetIdTabela(const Value: Integer);
begin
  FIdTabela := Value;
end;

procedure TModelTelefones.SetIdTelefone(const Value: Integer);
begin
  FIdTelefone := Value;
end;

procedure TModelTelefones.SetInativo(const Value: Boolean);
begin
  FInativo := Value;
end;

procedure TModelTelefones.SetNomeTabela(const Value: String);
begin
  FNomeTabela := Value;
end;

procedure TModelTelefones.SetRestrito(const Value: Boolean);
begin
  FRestrito := Value;
end;

procedure TModelTelefones.SetTelefone(const Value: String);
begin
    if Length(ApenasNumeros(Value)) < 11 then
        begin
            MessageBox(WindowHandleToPlatform(FFormulario.Handle).Wnd,
                       'Número de telefone inválido, verifique!',
                       apTitulo,
                       MB_OK + MB_ICONINFORMATION);
            Abort;
        end
    else
        begin
            FTelefone := Value;
        end;

end;

procedure TModelTelefones.SetWhatsApp(const Value: Boolean);
begin
  FWhatsApp := Value;
end;

end.
