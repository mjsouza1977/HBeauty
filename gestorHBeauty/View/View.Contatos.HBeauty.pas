unit View.Contatos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, View.Principal.HBeauty, FMX.TMSButton, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions,
  FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Edit, FMX.TMSBitmap,
  Units.Enumerados.HBeauty, View.Loading.HBeauty;

type
  TfrmCadastroContatos = class(TForm)
    recCabecarioTelefones: TRectangle;
    recRodapeTelefones: TRectangle;
    lblTitulo: TLabel;
    lblNome: TLabel;
    grdListaContatos: TTMSFMXGrid;
    lytCadastroTelefone: TLayout;
    btnFechar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    btnAlterar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    Rectangle15: TRectangle;
    edtTelefone: TEdit;
    Label14: TLabel;
    Rectangle2: TRectangle;
    edtContato: TEdit;
    Label2: TLabel;
    chkWhatsApp: TCheckBox;
    chkTelefoneRestrito: TCheckBox;
    chkInativarFone: TCheckBox;
    imgIconeForm: TTMSFMXImage;
    lblTituloForm: TLabel;
    Line1: TLine;
    lytCadastroEmail: TLayout;
    Rectangle3: TRectangle;
    edtEmail: TEdit;
    Label3: TLabel;
    chkEmailRestrito: TCheckBox;
    chkInativarEmail: TCheckBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdListaContatosCellClick(Sender: TObject; ACol, ARow: Integer);
  private
    FNomeTabela: String;
    FIdRegTab: Integer;
    FTitulo: String;
    FNome: String;
    FStatus : TAcaoBotao;
    FTipoForm: TTipoForm;
    FIdContatoSelecionado : Integer;
    FLinha : Integer;
    FTituloForm: String;
    procedure SetIdRegTab(const Value: Integer);
    procedure SetNomeTabela(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTitulo(const Value: String);
    procedure SetTipoForm(const Value: TTipoForm);
    procedure SetTituloForm(const Value: String);
    { Private declarations }
  public
    property NomeTabela : String    read FNomeTabela write SetNomeTabela;
    property IdRegTab   : Integer   read FIdRegTab   write SetIdRegTab;
    property Titulo     : String    read FTitulo     write SetTitulo;
    property Nome       : String    read FNome       write SetNome;
    property TipoForm   : TTipoForm read FTipoForm   write SetTipoForm;
    property TituloForm : String read FTituloForm write SetTituloForm;
  end;


var
  frmCadastroContatos: TfrmCadastroContatos;

implementation

{$R *.fmx}

uses Units.Utils.HBeauty,
     Model.Dados.Server.HBeauty,
     Model.Contatos.Servidor.HBeauty,
     Units.Consts.HBeauty,
     Units.Utils.Dados.HBeauty,
     Model.Telefones.HBeauty,
     Units.Classes.HBeauty,
     Units.Strings.HBeauty,
     Winapi.Windows,
     FMX.PLatForm.Win,
     Model.Emails.HBeauty,
     Controller.Manipula.Design.HBeauty;

procedure TfrmCadastroContatos.btnAlterarClick(Sender: TObject);
begin

    //Define o Status para Alteração
    FStatus := TAcaoBotao.abAlterar;

    if FIdContatoSelecionado > 0 then
        begin

            //VErifica o tipo do cadastro
            case TipoForm of
                tfTelefone : begin
                                //Cria a classe de telefones e exibe o layout com os campos referidos
                                gclTelefone := TModelTelefones.Create(Self);
                                lytCadastroTelefone.Visible := True;

                                //Filtra a tabela com o id correspondente
                                ModelConexaoDados.memContatos.Filter   := 'ID_FONE=' + FIdContatoSelecionado.ToString;
                                ModelConexaoDados.memContatos.Filtered := True;

                                //Carrega as informações nos campos
                                with ModelConexaoDados.memContatos do
                                    begin
                                        edtTelefone.Text := FieldByName('NR_FONE').AsString;
                                        edtContato.Text  := FieldByName('CONTATO_FONE').AsString;
                                        chkWhatsApp.IsChecked := StringToBool('T','F',FieldByName('WHATS_FONE').AsString);
                                        chkTelefoneRestrito.IsChecked := StringToBool('T','F',FieldByName('RESTRITO_FONE').AsString);
                                        chkInativarFone.IsChecked := StringToBool('T','F',FieldByName('INATIVO_FONE').AsString);
                                    end;
                            end;
                tfEmail    : begin
                                //Cria a classe de emails e exibe o layout com os campos referidos
                                gclEmail := TModelEmails.Create(Self);
                                lytCadastroEmail.Visible := True;

                                //Filtra a tabela com o id correspondente
                                ModelConexaoDados.memContatos.Filter   := 'ID_EMAIL=' + FIdContatoSelecionado.ToString;
                                ModelConexaoDados.memContatos.Filtered := True;

                                //Carrega as informações nos campos
                                with ModelConexaoDados.memContatos do
                                    begin
                                        edtEmail.Text := FieldByName('EMAIL_EMAIL').AsString;
                                        chkEmailRestrito.IsChecked := StringToBool('T','F',FieldByName('RESTRITO_EMAIL').AsString);
                                        chkInativarEmail.IsChecked := StringToBool('T','F',FieldByName('INATIVO_EMAIL').AsString);
                                    end;
                            end;
            end;
            //Manipula a exibição dos botões
            ControlaBotoes(Self, False);
            ModelConexaoDados.memContatos.Filtered := False;
        end;

end;

procedure TfrmCadastroContatos.btnCancelarClick(Sender: TObject);
begin

     //Destroi as variaveis das classes caso ja esteja criadas
     if Assigned(gclEmail)   then FreeAndNil(gclEmail);
     if Assigned(gclTelefone) then FreeAndNil(gclTelefone);

     LimpaForm(Self);
     lytCadastroTelefone.Visible := False;
     lytCadastroEmail.Visible    := False;

     //Manipula a exibição dos botões
     ControlaBotoes(Self, True);

end;

procedure TfrmCadastroContatos.btnFecharClick(Sender: TObject);
begin

     //Fecha o form
     Close;

end;

procedure TfrmCadastroContatos.btnIncluirClick(Sender: TObject);
begin

     //Define a ação do form
     FStatus := TAcaoBotao.abIncluir;

     //Verifica o tipo do cadastro
     case TipoForm of
         tfTelefone : begin
                         //Cria a variavel da classe e exibe o layout
                         gclTelefone := TModelTelefones.Create(Self);
                         lytCadastroTelefone.Visible := True;
                     end;
         tfEmail    : begin
                         //Cria a variavel da classe e exibe o layout
                         gclEmail := TModelEmails.Create(Self);
                         lytCadastroEmail.Visible := True;
                     end;
     end;

     ControlaBotoes(Self, False);

end;

procedure TfrmCadastroContatos.btnSalvarClick(Sender: TObject);
begin

    {$region 'carrega a classe'}
    case TipoForm of
        tfEmail    : begin
                         gclEmail            := TModelEmails.create(Self);
                         gclEmail.IdEmail    := FIdContatoSelecionado;
                         gclEmail.Email      := edtEmail.Text;
                         gclEmail.NomeTabela := PrefixoTabela(tcProfissionais);
                         gclEmail.IdTabela   := FIdRegTab;
                         gclEmail.Restrito   := chkEmailRestrito.IsChecked;
                     end;
        tfTelefone : begin
                         gclTelefone            := TModelTelefones.create(Self);
                         gclTelefone.IdTelefone := FIdContatoSelecionado;
                         gclTelefone.Telefone   := ApenasNumeros(edtTelefone.Text);
                         gclTelefone.Contato    := edtContato.Text;
                         gclTelefone.WhatsApp   := chkWhatsApp.IsChecked;
                         gclTelefone.Restrito   := chkTelefoneRestrito.IsChecked;
                         gclTelefone.NomeTabela := PrefixoTabela(tcProfissionais);
                         gclTelefone.IdTabela   := FIdRegTab;
                     end;
    end;
    {$endregion}

    {$region 'Controle do cadastro/alteração do contato'}
    case TipoForm of
        {$region 'Telefone'}
        tfTelefone : begin
                          case FStatus of
                               {$region 'Inclusao do Telefone'}
                               abIncluir : begin
                                               try
                                                   try
                                                       if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                     'Confirma a inclusão deste telefone?', apTitulo,
                                                                     MB_YESNO + MB_ICONEXCLAMATION) = ID_YES then
                                                           begin
                                                               //Executa a inclusão dos dados no servidor
                                                               CadastraTelefone(gclTelefone);
                                                               MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                          'Registro salvo com sucesso!', apTitulo,
                                                                          MB_OK + MB_ICONINFORMATION);
                                                               //caso tenha sucesso na inclusão executa o FormShow e Manipuloa os botões
                                                               FormShow(Self);
                                                               ControlaBotoes(Self, True);
                                                           end;
                                                   except
                                                   on E:Exception do
                                                       begin
                                                            //Caso de erro na inclusão exibe a mensagem abaixo
                                                            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                       pChar('Ocorreu um erro ao tentar salvar este registro, ' +
                                                                             'verifique sua conexão com a internet e tente ' +
                                                                             'novamente. Caso o problema persistir entre em contato ' +
                                                                             'com a MS Software informando a mensagem abaixo!' + #13#13 +
                                                                             'Mensagem: ' + E.Message + #13 +
                                                                             'Formulário: ' + Self.Name),
                                                                       apTitulo,
                                                                       MB_OK + MB_ICONWARNING);
                                                            Abort;
                                                       end;
                                                   end;
                                               finally
                                                   //Destroi a variavel
                                                   FreeAndNil(gclTelefone);
                                               end;
                                           end;
                               {$endregion}
                               {$region 'Alteração do Telefone'}
                               abAlterar : begin
                                               try
                                                   try
                                                       if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                     'Confirma a alteração deste telefone?', apTitulo,
                                                                     MB_YESNO + MB_ICONEXCLAMATION) = ID_YES then
                                                           begin
                                                               //Executa a alteração e salva no servidor
                                                               AtualizaTelefone(gclTelefone);

                                                               //caso tenha sucesso na operação fecha o form
                                                               MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                          'Registro atualizado com sucesso!', apTitulo,
                                                                          MB_OK + MB_ICONINFORMATION);
                                                               frmCadastroContatos.Close;
                                                           end;
                                                   except
                                                   on E:Exception do
                                                       begin
                                                            //caso tenha algum erro exibe a mensagem abaixo
                                                            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                       pChar('Ocorreu um erro ao tentar salvar este registro, ' +
                                                                             'verifique sua conexão com a internet e tente ' +
                                                                             'novamente. Caso o problema persistir entre em contato ' +
                                                                             'com a MS Software informando a mensagem abaixo!' + #13#13 +
                                                                             'Mensagem: ' + E.Message + #13 +
                                                                             'Formulário: ' + Self.Name),
                                                                       apTitulo,
                                                                       MB_OK + MB_ICONWARNING);
                                                            Abort;
                                                       end;
                                                   end;
                                               finally
                                                   //Destroi a variabel
                                                   FreeAndNil(gclTelefone);
                                               end;
                                           end;
                               {$endregion}
                          end;
                     end;
         {$endregion}
         {$region 'Email'}
           tfEmail : begin //as ações abaixo seguem o mesmo padrao do telefone
                          case FStatus of
                               {$region 'Inclusao do Email'}
                               abIncluir : begin
                                               try
                                                   try
                                                       if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                     'Confirma a inclusão deste e-mail?', apTitulo,
                                                                     MB_YESNO + MB_ICONEXCLAMATION) = ID_YES then
                                                           begin
                                                               CadastraEmail(gclEmail);
                                                               MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                          'Registro salvo com sucesso!', apTitulo,
                                                                          MB_OK + MB_ICONINFORMATION);
                                                               FormShow(Self);
                                                               ControlaBotoes(Self, True);
                                                           end;
                                                   except on E:Exception do
                                                       begin
                                                            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                       pChar('Ocorreu um erro ao tentar salvar este registro, ' +
                                                                             'verifique sua conexão com a internet e tente ' +
                                                                             'novamente. Caso o problema persistir entre em contato ' +
                                                                             'com a MS Software informando a mensagem abaixo!' + #13#13 +
                                                                             'Mensagem: ' + E.Message + #13 +
                                                                             'Formulário: ' + Self.Name),
                                                                       apTitulo,
                                                                       MB_OK + MB_ICONWARNING);
                                                            Abort;
                                                       end;
                                                   end;
                                               finally
                                                   FreeAndNil(frmLoading);
                                                   FreeAndNil(gclEmail);
                                               end;
                                           end;
                               {$endregion}
                               {$region 'Alteração do Email'}
                               abAlterar : begin
                                               try
                                                   try
                                                       if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                     'Confirma a alteração deste e-mail?', apTitulo,
                                                                     MB_YESNO + MB_ICONEXCLAMATION) = ID_YES then
                                                           begin
                                                               AtualizaEmail(gclEmail);
                                                               MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                          'Registro salvo com sucesso!', apTitulo,
                                                                          MB_OK + MB_ICONINFORMATION);
                                                               frmCadastroContatos.Close;
                                                           end;
                                                   except on E:Exception do
                                                       begin
                                                            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                       pChar('Ocorreu um erro ao tentar salvar este registro, ' +
                                                                             'verifique sua conexão com a internet e tente ' +
                                                                             'novamente. Caso o problema persistir entre em contato ' +
                                                                             'com a MS Software informando a mensagem abaixo!' + #13#13 +
                                                                             'Mensagem: ' + E.Message + #13 +
                                                                             'Formulário: ' + Self.Name),
                                                                       apTitulo,
                                                                       MB_OK + MB_ICONWARNING);
                                                            Abort;
                                                       end;
                                                   end;
                                               finally
                                                   FreeAndNil(frmLoading);
                                                   FreeAndNil(gclEmail);
                                               end;
                                           end;
                               {$endregion}
                          end;

                     end;
         {$endregion}
    end;
    {$endregion}
end;

procedure TfrmCadastroContatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

procedure TfrmCadastroContatos.FormCreate(Sender: TObject);
begin
     //Zera a variavel do item selecionado
     FIdContatoSelecionado := 0;
     CarregaPersonalizacaoCabecarioRodape(Self);
end;

procedure TfrmCadastroContatos.FormShow(Sender: TObject);
var
AIndex : Integer;
S : String;
begin

     //Limpa os campos do form
     LimpaForm(Self);

     //Oculta os campos de edição
     lytCadastroEmail.Visible    := False;
     lytCadastroTelefone.Visible := False;

     //verifica o tipo do form (e-mail/telefone)
     case FTipoForm of
        tfTelefone : begin
                         //faz o download dos dados do servidor
                         CarregaTelefones(FNomeTabela, FIdRegTab);
                         //formata o grid para a exibição dos dados
                         CarregaGrid(ModelConexaoDados.memContatos,grdListaContatos, AFieldsTelefones, ACaptionTelefones, ASizeColTelefones);

                         //Da um loop nos registros para colocar os icones nos campos RESTRITO/WHATSAPP
                         for AIndex := 1 to grdListaContatos.RowCount - 1 do
                             begin
                                 if Trim(ExtraiTextoGrid(grdListaContatos.Cells[3, AIndex])) = 'F' then
                                     begin
                                          grdListaContatos.Cells[3, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(3, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Unchecked.png');
                                     end
                                 else
                                     begin
                                          grdListaContatos.Cells[3, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(3, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Checked.png');
                                     end;
                                 if Trim(ExtraiTextoGrid(grdListaContatos.Cells[4, AIndex])) = 'F' then
                                     begin
                                          grdListaContatos.Cells[4, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(4, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Unchecked.png');
                                     end
                                 else
                                     begin
                                          grdListaContatos.Cells[4, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(4, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Checked.png');
                                     end;
                             end;
                     end;
           tfEmail : begin
                        //faz o download dos dados do servidor
                        CarregaEmails(FNomeTabela, FIdRegTab);
                        //formata o grid para a exibição dos dados
                        CarregaGrid(ModelConexaoDados.memContatos, grdListaContatos, AFieldsEmails, ACaptionEmails, ASizeColEmails);

                        //Da um loop nos registros para colocar o icone no campo restrito
                        for AIndex := 1 to grdListaContatos.RowCount - 1 do
                             begin
                                 if Trim(ExtraiTextoGrid(grdListaContatos.Cells[2, AIndex])) = 'F' then
                                     begin
                                          grdListaContatos.Cells[2, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(2, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Unchecked.png');
                                     end
                                 else
                                     begin
                                          grdListaContatos.Cells[2, AIndex] := '';
                                          grdListaContatos.AddBitmapFile(2, AIndex, ExtractFilePath(ParamStr(0)) + 'Imagens\Icones\Checked.png');
                                     end;
                             end;
                     end;
     end;
end;

procedure TfrmCadastroContatos.grdListaContatosCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FIdContatoSelecionado := ExtraiTextoGrid(grdListaContatos.Cells[0, ARow]).ToInteger;
end;

procedure TfrmCadastroContatos.SetIdRegTab(const Value: Integer);
begin
  FIdRegTab := Value;
end;

procedure TfrmCadastroContatos.SetNome(const Value: String);
begin
  FNome        := Value;
  lblNome.Text := FNome;
end;

procedure TfrmCadastroContatos.SetNomeTabela(const Value: String);
begin
  FNomeTabela := Value;
end;

procedure TfrmCadastroContatos.SetTipoForm(const Value: TTipoForm);
begin
  FTipoForm := Value;
end;

procedure TfrmCadastroContatos.SetTitulo(const Value: String);
begin
  FTitulo        := Value;
  lblTitulo.Text := FTitulo;
end;


procedure TfrmCadastroContatos.SetTituloForm(const Value: String);
begin
  FTituloForm := Value;
  lblTituloForm.Text := FTituloForm;
end;

end.
