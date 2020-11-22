unit View.Habilidades.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.TMSBaseControl, FMX.TMSBitmap, ACBrBase, ACBrValidador, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.TMSButton, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Layouts, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid, Units.Enumerados.HBeauty, Model.Profissionais.HBeauty, View.Profissionais.HBeauty, Model.Profissionais.Servidor.HBeauty,
  Model.Habilidades.HBeauty, Units.Utils.Dados.HBeauty, Units.Utils.HBeauty;

type
  TfrmCadastroHabilidades = class(TForm)
    recRodapeHabilidades: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    StyleBook2: TStyleBook;
    recCabecarioTelefones: TRectangle;
    imgIconeForm: TTMSFMXImage;
    Line1: TLine;
    lblTituloForm: TLabel;
    Label1: TLabel;
    grdListaHabilidade: TTMSFMXGrid;
    lytCadastraHabilidade: TLayout;
    Rectangle15: TRectangle;
    edtHabilidade: TEdit;
    Label14: TLabel;
    Rectangle2: TRectangle;
    Label2: TLabel;
    mmDescricao: TMemo;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure grdListaHabilidadeCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure edtHabilidadeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FStatus : TAcaoBotao;
    FidHabilidadeSelecionada : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroHabilidades: TfrmCadastroHabilidades;

implementation

uses
  Units.Classes.HBeauty,
  Controller.Manipula.Design.HBeauty, Model.Dados.Server.HBeauty,
  Units.Consts.HBeauty, Winapi.Windows, FMX.Platform.Win;

{$R *.fmx}

procedure TfrmCadastroHabilidades.btnAlterarClick(Sender: TObject);
begin
    FStatus := abAlterar;

    if FidHabilidadeSelecionada > 0 then
        begin
            //Carrega e exibe as informações nos campos
            with ModelConexaoDados.memHabilidades do
                begin
                    gclHabilidade.NomeHabilidade      := FieldByName('NOME_HABILIDADE').AsString;
                    gclHabilidade.DescricaoHabilidade := FieldByName('DESCR_HABILIDADE').AsString;
                    edtHabilidade.Text := gclHabilidade.NomeHabilidade;
                    mmDescricao.Text   := gclHabilidade.DescricaoHabilidade;
                    edtHabilidade.SetFocus;
                    lytCadastraHabilidade.Visible := True;
                    BloqueiaRegistro(True, FidHabilidadeSelecionada, tcTelefones);
                end;
        end
    else
        begin
            if ModelConexaoDados.memHabilidades.RecordCount = 0 then
                begin
                    MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                               'Nenhum registro cadastrado para alterar!', apTitulo,
                               MB_OK + MB_ICONINFORMATION);
                    Exit;
                end
            else
                begin
                    MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                               'É necessário selecionar um registro na lista!', apTitulo,
                               MB_OK + MB_ICONINFORMATION);
                    Exit;
                end;
        end;
end;

procedure TfrmCadastroHabilidades.btnCancelarClick(Sender: TObject);
var
AMsg : String;
begin
    case FStatus of
        abIncluir: AMsg := 'Confirma o cancelamento desta inclusão?';
        abAlterar: AMsg := 'Confirma o cancelamento desta alteração?';
    end;

    if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                  AMsg, apTitulo, MB_OK + MB_ICONQUESTION) = ID_YES then
        begin
            BloqueiaRegistro(False, FidHabilidadeSelecionada, tcHabilidades);
            LimpaForm(Self);
            lytCadastraHabilidade.Visible := False;
            FStatus := abNulo;
        end;
end;

procedure TfrmCadastroHabilidades.btnFecharClick(Sender: TObject);
begin
     //Caso esteja em modo de edição Desbloqueia o registro
     if FStatus = abAlterar then     
         BloqueiaRegistro(False, FidHabilidadeSelecionada, tcHabilidades);

     //Fecha o Form
     Close;
end;

procedure TfrmCadastroHabilidades.btnIncluirClick(Sender: TObject);
begin
     //Prepara o Form para a inclusão
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
     lytCadastraHabilidade.Visible := True;
     edtHabilidade.SetFocus;
     FidHabilidadeSelecionada := 0;
end;

procedure TfrmCadastroHabilidades.btnSalvarClick(Sender: TObject);
begin

     gclHabilidade.IdHabilidade        := FidHabilidadeSelecionada;
     gclHabilidade.NomeHabilidade      := edtHabilidade.Text;
     gclHabilidade.DescricaoHabilidade := mmDescricao.Text;

     case FStatus of
         abIncluir: begin
                         try
                             cadastraHabilidade(gclHabilidade);
                             LimpaForm(Self);
                             lytCadastraHabilidade.Visible := False;
                             MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                        'Habilidade salva com sucesso.', apTitulo,
                                        MB_OK + MB_ICONINFORMATION);
                             FStatus := abNulo;
                         except
                             on E:Exception do
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                pChar('Ocorreu um erro no salvamento da habilidade, ' +
                                                'tente novamente. Se o problema persistir entre ' +
                                                'em contato com a MS Software e informe a mensagem abaixo.' + #13#13 +
                                                'Mensagem: ' + E.Message), apTitulo,
                                                MB_OK + MB_ICONWARNING);
                                     Exit;
                                 end;
                         end;
                    end;
         abAlterar: begin
                         try
                             atualizaHabilidades(gclHabilidade);
                             MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                        'Habilidade alterada com sucesso.', apTitulo,
                                        MB_OK + MB_ICONINFORMATION);
                             LimpaForm(Self);
                             lytCadastraHabilidade.Visible := False;
                             FStatus := abNulo;
                         except
                             on E:Exception do
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                pChar('Ocorreu um erro no salvamento da habilidade, ' +
                                                'tente novamente. Se o problema persistir entre ' +
                                                'em contato com a MS Software e informe a mensagem abaixo.' + #13#13 +
                                                'Mensagem: ' + E.Message), apTitulo,
                                                MB_OK + MB_ICONWARNING);
                                     Exit;
                                 end;

                         end;

                    end;
     end;

end;

procedure TfrmCadastroHabilidades.edtHabilidadeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
    NextField(Key, mmDescricao);
end;

procedure TfrmCadastroHabilidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

procedure TfrmCadastroHabilidades.FormCreate(Sender: TObject);
begin
    CarregaPersonalizacaoCabecarioRodape(Self);

    //Cria a classe de habilidades e exibe o layout com os campos referidos
    gclHabilidade := TModelHabilidades.Create;

    grdListaHabilidade.Cells[0,0] := 'Habilidade';
    grdListaHabilidade.Cells[1,0] := 'Descrição';

    carregaHabilidades;

    CarregaGrid(ModelConexaoDados.memHabilidades,grdListaHabilidade, AFieldsHabilidades, ACaptionHabilidades, ASizeColHabilidades);

    if ModelConexaoDados.memProfissionais.RecordCount > 0 then
        FidHabilidadeSelecionada :=  ExtraiTextoGrid(grdListaHabilidade.Cells[0, 1]).ToInteger;

end;

procedure TfrmCadastroHabilidades.FormShow(Sender: TObject);
var
AIndex : Integer;
begin

    //Limpa os campos do form
    LimpaForm(Self);

    //Oculta os campos de edição
    lytCadastraHabilidade.Visible    := False;

    //faz o download dos dados do servidor
    carregaHabilidades;

    //formata o grid para a exibição dos dados
    CarregaGrid(ModelConexaoDados.memHabilidades,grdListaHabilidade, AFieldsHabilidades, ACaptionHabilidades, ASizeColHabilidades);

    //Carrega o ID do primeiro registro
    if ModelConexaoDados.memHabilidades.RecordCount = 0 then
        FidHabilidadeSelecionada := 0 else
        FidHabilidadeSelecionada := ModelConexaoDados.memHabilidades.FieldByName('ID_HAILIDADE').AsInteger;
end;

procedure TfrmCadastroHabilidades.grdListaHabilidadeCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FidHabilidadeSelecionada := ExtraiTextoGrid(grdListaHabilidade.Cells[0, ARow]).ToInteger;
end;

end.
