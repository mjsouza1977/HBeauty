unit Model.Emails.HBeauty;

interface

uses
  FMX.Forms;

type
    TModelEmails = class
        private

        FForm : TForm;
        FEmail: String;
        FNomeTabela: String;
        FInativo: Boolean;
        FRestrito: Boolean;
        FIdTabela: Integer;
        procedure SetEmail(const Value: String);
        procedure SetIdTabela(const Value: Integer);
        procedure SetInativo(const Value: Boolean);
        procedure SetNomeTabela(const Value: String);
        procedure SetRestrito(const Value: Boolean);
        public
        property Email      : String read FEmail write SetEmail;
        property NomeTabela : String read FNomeTabela write SetNomeTabela;
        property IdTabela   : Integer read FIdTabela write SetIdTabela;
        property Inativo    : Boolean read FInativo write SetInativo;
        property Restrito   : Boolean read FRestrito write SetRestrito;
        constructor create(AForm : TForm);
    end;

implementation

{ TModelEmails }

constructor TModelEmails.create(AForm: TForm);
begin
     FForm := AForm;
end;

procedure TModelEmails.SetEmail(const Value: String);
begin
  FEmail := Value;
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
