unit View.Habilidades.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.TMSBaseControl, FMX.TMSBitmap, ACBrBase, ACBrValidador, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.TMSButton, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Layouts, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid, Units.Enumerados.HBeauty, Model.Profissionais.HBeauty, View.Profissionais.HBeauty, Model.Profissionais.Servidor.HBeauty,
  Model.Habilidades.HBeauty, Units.Utils.Dados.HBeauty, Units.Utils.HBeauty, FMX.ListBox, Units.Mensagens.HBeauty;

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
    Rectangle1: TRectangle;
    cbCargos: TComboBox;
    Label3: TLabel;
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
    procedure cbCargosKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
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
                    grdListaHabilidade.Enabled := False;
                    pesquisaHabilidade(FidHabilidadeSelecionada,0, '');
                    gclHabilidade.NomeHabilidade      := FieldByName('NOME_HABILIDADE').AsString;
                    gclHabilidade.DescricaoHabilidade := FieldByName('DESCR_HABILIDADE').AsString;
                    gclHabilidade.IdCargoHabilidade   := FieldByName('IDCARGO_HABILIDADE').AsInteger;
                    edtHabilidade.Text := gclHabilidade.NomeHabilidade;
                    mmDescricao.Text   := gclHabilidade.DescricaoHabilidade;
                    cbCargos.ItemIndex := cbCargos.Items.IndexOf(FieldByName('NOME_CARGO').AsString);
                    edtHabilidade.SetFocus;
                    lytCadastraHabilidade.Visible := True;
                    BloqueiaRegistro(True, FidHabilidadeSelecionada, tcTelefones);
                    ControlaBotoes(Self, False);
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
                  pChar(AMsg), apTitulo, MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
            BloqueiaRegistro(False, FidHabilidadeSelecionada, tcHabilidades);
            LimpaForm(Self);
            lytCadastraHabilidade.Visible := False;
            FStatus := abNulo;
            ControlaBotoes(Self, True);
            grdListaHabilidade.Enabled := True;
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
     cbCargos.SetFocus;
     FidHabilidadeSelecionada := 0;
     cbCargos.ItemIndex := -1;
end;

procedure TfrmCadastroHabilidades.btnSalvarClick(Sender: TObject);
begin

     rResultado := '';
     gclHabilidade.IdHabilidade         := FidHabilidadeSelecionada;
     gclHabilidade.NomeHabilidade       := edtHabilidade.Text;
     gclHabilidade.DescricaoHabilidade  := mmDescricao.Text;
     if cbCargos.ItemIndex < 0 then
        gclHabilidade.IdCargoHabilidade := 0 else
        gclHabilidade.IdCargoHabilidade    := Integer(cbCargos.Items.Objects[cbCargos.ItemIndex]);

     case FStatus of
         abIncluir: begin
                         try
                             rResultado := cadastraHabilidade(gclHabilidade);
                             if rResultado = '' then
                                 begin
                                     LimpaForm(Self);
                                     lytCadastraHabilidade.Visible := False;
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                'Habilidade salva com sucesso.', apTitulo,
                                                MB_OK + MB_ICONINFORMATION);
                                     FormShow(Self);
                                     FStatus := abNulo;
                                     ControlaBotoes(Self, True);
                                 end
                             else
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                pChar(Format(MSG_ERRO_SERVIDOR,[rResultado])),
                                                apTitulo, MB_OK + MB_ICONWARNING);
                                     Exit;
                                 end;
                         except
                             on E:Exception do
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                pChar(Format(MSG_ERRO_INTERNET,[E.Message])),
                                                apTitulo, MB_OK + MB_ICONWARNING);
                                     Exit;
                                 end;
                         end;
                    end;
         abAlterar: begin
                         try
                             gclHabilidade.NomeHabilidade      := edtHabilidade.Text;
                             gclHabilidade.DescricaoHabilidade := mmDescricao.Text;
                             rResultado := atualizaHabilidades(gclHabilidade);
                             if rResultado = '' then
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                'Habilidade alterada com sucesso.', apTitulo,
                                                MB_OK + MB_ICONINFORMATION);
                                     LimpaForm(Self);
                                     lytCadastraHabilidade.Visible := False;
                                     FormShow(Self);
                                     FStatus := abNulo;
                                     ControlaBotoes(Self, True);
                                     grdListaHabilidade.Enabled := True;
                                 end
                             else
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                pChar(Format(MSG_ERRO_SERVIDOR,[rResultado])),
                                                apTitulo, MB_OK + MB_ICONWARNING);
                                     Exit;
                                 end;
                         except
                             on E:Exception do
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                pChar(Format(MSG_ERRO_INTERNET,[E.Message])),
                                                apTitulo, MB_OK + MB_ICONWARNING);
                                     Exit;
                                 end;

                         end;

                    end;
     end;

end;

procedure TfrmCadastroHabilidades.cbCargosKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, edtHabilidade);
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
    gclHabilidade := TModelHabilidades.Create(Self);

end;

procedure TfrmCadastroHabilidades.FormShow(Sender: TObject);
begin

    carregaCargos;
    if ModelConexaoDados.memCargos.RecordCount = 0 then
        begin
            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'Para cadastrar um habilidade é necessário cadastro um cargo primeiro!',
                       apTitulo, MB_OK + MB_ICONWARNING);
            frmCadastroHabilidades.Close;
        end
    else
        begin
            ModelConexaoDados.memCargos.First;
            cbCargos.Items.Clear;
            while not ModelConexaoDados.memCargos.Eof do
                 begin
                      cbCargos.Items.AddObject(ModelConexaoDados.memCargos.FieldByName('NOME_CARGO').AsString,
                                               TObject(ModelConexaoDados.memCargos.FieldByName('ID_CARGO').AsInteger));
                      ModelConexaoDados.memCargos.Next;
                 end;
        end;

    carregaHabilidades;

    CarregaGrid(ModelConexaoDados.memHabilidades,grdListaHabilidade, AFieldsHabilidades, ACaptionHabilidades, ASizeColHabilidades);

    cbCargos.SetFocus;
    //Carrega o ID do primeiro registro
    ModelConexaoDados.memHabilidades.First;
    if ModelConexaoDados.memHabilidades.RecordCount = 0 then
        FidHabilidadeSelecionada := 0 else
        FidHabilidadeSelecionada := ModelConexaoDados.memHabilidades.FieldByName('ID_HABILIDADE').AsInteger;

    //Limpa os campos do form
    LimpaForm(Self);

    //Oculta os campos de edição
    lytCadastraHabilidade.Visible    := False;

end;

procedure TfrmCadastroHabilidades.grdListaHabilidadeCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FidHabilidadeSelecionada := ExtraiTextoGrid(grdListaHabilidade.Cells[0, ARow]).ToInteger;
end;

end.
