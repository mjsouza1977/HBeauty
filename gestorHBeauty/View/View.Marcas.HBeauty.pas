unit View.Marcas.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid, FMX.StdCtrls, FMX.Objects, FMX.TMSBitmap, FMX.Controls.Presentation, FMX.TMSButton,
  Units.Enumerados.HBeauty;

type
  TfrmCadastroMarcas = class(TForm)
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
    lblTituloMarcas: TLabel;
    Label1: TLabel;
    grdListaMarca: TTMSFMXGrid;
    lytCadastraMarcas: TLayout;
    Label3: TLabel;
    Rectangle15: TRectangle;
    edtMarca: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdListaMarcaCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FIDSelecionado : Integer;
    FStatus : TAcaoBotao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroMarcas: TfrmCadastroMarcas;

implementation

{$R *.fmx}

uses Controller.Manipula.Design.HBeauty,
     Units.Classes.HBeauty,
     Model.Marcas.HBeauty,
     Units.Utils.Dados.HBeauty,
     Model.Dados.Server.HBeauty,
     Model.Marca.Servidor.HBeauty,
     Units.Consts.HBeauty,
     Units.Utils.HBeauty, Winapi.Windows, FMX.Platform.Win,
     Units.Mensagens.HBeauty;

procedure TfrmCadastroMarcas.btnAlterarClick(Sender: TObject);
begin
    FStatus := abAlterar;

    if FIDSelecionado > 0 then
        begin
            //Carrega e exibe as informações nos campos
            with ModelConexaoDados.memMarcas do
                begin
                    grdListaMarca.Enabled := False;
                    pesquisaMarcas(FIDSelecionado,'');
                    gclMarcas.MARCA_MARCA := FieldByName('MARCA_MARCA').AsString;
                    edtMarca.Text         := gclMarcas.MARCA_MARCA;
                    edtMarca.SetFocus;
                    lytCadastraMarcas.Visible := True;
                    BloqueiaRegistro(True, FIDSelecionado, tcMarcas);
                    ControlaBotoes(Self, False);
                end;
        end
    else
        begin
            if ModelConexaoDados.memMarcas.RecordCount = 0 then
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

procedure TfrmCadastroMarcas.btnCancelarClick(Sender: TObject);
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
            BloqueiaRegistro(False, FIDSelecionado, tcCargo);
            LimpaForm(Self);
            lytCadastraMarcas.Visible := False;
            FStatus := abNulo;
            ControlaBotoes(Self, True);
            grdListaMarca.Enabled := True;
        end;

end;

procedure TfrmCadastroMarcas.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadastroMarcas.btnIncluirClick(Sender: TObject);
begin
     //Prepara o Form para a inclusão
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
     lytCadastraMarcas.Visible := True;
     edtMarca.SetFocus;
     FIDSelecionado := 0;
end;

procedure TfrmCadastroMarcas.btnSalvarClick(Sender: TObject);
begin
     rResultado := '';
     gclMarcas.ID_MARCA    := FIDSelecionado;
     gclMarcas.MARCA_MARCA := edtMarca.Text;

     case FStatus of
         abIncluir: begin
                         try
                             rResultado := cadastraMarca(gclMarcas.MARCA_MARCA);
                             if rResultado = '' then
                                 begin
                                     LimpaForm(Self);
                                     lytCadastraMarcas.Visible := False;
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                'Marca salvo com sucesso.', apTitulo,
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
                             rResultado := '';
                             rResultado := atualizaMarca(gclMarcas);
                             if rResultado = '' then
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                'Marca alterado com sucesso.', apTitulo,
                                                MB_OK + MB_ICONINFORMATION);
                                     LimpaForm(Self);
                                     lytCadastraMarcas.Visible := False;
                                     FormShow(Self);
                                     FStatus := abNulo;
                                     ControlaBotoes(Self, True);
                                     grdListaMarca.Enabled := True;
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
                                                pChar(Format(MSG_ERRO_INTERNET,[rResultado])),
                                                apTitulo, MB_OK + MB_ICONWARNING);
                                     Exit;
                                 end;

                         end;

                    end;
     end;
end;

procedure TfrmCadastroMarcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := TCloseAction.caFree;
end;

procedure TfrmCadastroMarcas.FormCreate(Sender: TObject);
begin
    CarregaPersonalizacaoCabecarioRodape(Self);

    gclMarcas := TModelMarcas.Create(Self);
end;

procedure TfrmCadastroMarcas.FormShow(Sender: TObject);
var
AIndex : Integer;
begin
    //Limpa os campos do form
    LimpaForm(Self);

    //Oculta os campos de edição
    lytCadastraMarcas.Visible    := False;

    carregaMarcas;

    CarregaGrid(ModelConexaoDados.memMarcas, grdListaMarca, AFieldsMarcas, ACaptionMarcas, ASizeColMarcas);

    //Carrega o ID do primeiro registro
    ModelConexaoDados.memMarcas.First;
    if ModelConexaoDados.memMarcas.RecordCount = 0 then
        FIDSelecionado := 0 else
        FIDSelecionado := ModelConexaoDados.memMarcas.FieldByName('ID_MARCA').AsInteger;
end;

procedure TfrmCadastroMarcas.grdListaMarcaCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FIDSelecionado := ExtraiTextoGrid(grdListaMarca.Cells[0, ARow]).ToInteger;
end;

end.
