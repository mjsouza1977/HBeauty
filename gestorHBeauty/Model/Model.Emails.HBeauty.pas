unit Model.Emails.HBeauty;

interface

uses
  FMX.Forms, ACBRValidador;

type
    TModelEmails = class
        private

        FValidador : TACBrValidador;
        FForm : TForm;
        FEmail: String;
        FNomeTabela: String;
        FInativo: Boolean;
        FRestrito: Boolean;
        FIdTabela: Integer;
    FIdEmail: Integer;
        procedure SetEmail(const Value: String);
        procedure SetIdTabela(const Value: Integer);
        procedure SetInativo(const Value: Boolean);
        procedure SetNomeTabela(const Value: String);
        procedure SetRestrito(const Value: Boolean);
    procedure SetIdEmail(const Value: Integer);
        public
        property Email      : String  read FEmail      write SetEmail;
        property NomeTabela : String  read FNomeTabela write SetNomeTabela;
        property IdTabela   : Integer read FIdTabela   write SetIdTabela;
        property Inativo    : Boolean read FInativo    write SetInativo;
        property Restrito   : Boolean read FRestrito   write SetRestrito;
        property IdEmail    : Integer read FIdEmail    write SetIdEmail;
        constructor Create(AForm : TForm);
    end;

implementation

uses
  FMX.Platform.Win, Winapi.Windows, Units.Consts.HBeauty, System.SysUtils;

{ TModelEmails }

constructor TModelEmails.create(AForm: TForm);
begin
     FForm := AForm;
     FValidador := TACBrValidador.Create(nil);
end;

procedure TModelEmails.SetEmail(const Value: String);
begin

    FValidador.Documento := Value;
    FValidador.TipoDocto := docEmail;

    case FValidador.Validar of
         True : FEmail := Value;
        False : begin
                    MessageBox(WindowHandleToPlatform(FForm.Handle).Wnd,
                                  'E-Mail Inválido, verifique!',
                                  apTitulo,
                                  MB_OK + MB_ICONINFORMATION);
                    Abort;
                end;
    end;
end;

procedure TModelEmails.SetIdEmail(const Value: Integer);
begin
  FIdEmail := Value;
end;

procedure TModelEmails.SetIdTabela(const Value: Integer);
begin
  FIdTabela := Value;
end;

procedure TModelEmails.SetInativo(const Value: Boolean);
begin
  FInativo := Value;
end;

procedure TModelEmails.SetNomeTabela(const Value: String);
begin
  FNomeTabela := Value;
end;

procedure TModelEmails.SetRestrito(const Value: Boolean);
begin
  FRestrito := Value;
end;

end.
