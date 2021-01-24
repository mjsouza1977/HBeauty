unit View.Marcas.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid, FMX.StdCtrls, FMX.Objects, FMX.TMSBitmap, FMX.Controls.Presentation, FMX.TMSButton,
  Units.Enumerados.HBeauty, Units.Strings.HBeauty;

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
    recLogoMarca: TRectangle;
    Label2: TLabel;
    opFile: TOpenDialog;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdListaMarcaCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure recLogoMarcaClick(Sender: TObject);
  private
    FIDSelecionado : Integer;
    FStatus        : TAcaoBotao;
    FPathImagem    : String;
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
     Units.Mensagens.HBeauty,
     Model.Imagens.Servidor.HBeauty;


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
                    if FieldByName('IDLOGO_MARCA').AsString <> '' then
                        begin
                            gclMarcas.IMAGENS.IDIMAGEM := FieldByName('IDLOGO_MARCA').AsInteger;
                            recLogoMarca.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_FOTOS + ObterNomeImagem(gclMarcas.IMAGENS.IDIMAGEM));
                        end
                    else
                        begin
                            gclMarcas.IMAGENS.IDIMAGEM      := 0;
                            recLogoMarca.Fill.Bitmap.Bitmap := nil;
                        end;

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
     gclMarcas.ID_MARCA         := FIDSelecionado;
     gclMarcas.MARCA_MARCA      := edtMarca.Text;
     case FStatus of
         abIncluir : begin
                          if FPathImagem <> '' then
                              begin
                                   gclMarcas.IMAGENS.IDIMAGEM := GravaImagem(0, 'MRC',UpperCase(ExtractFileExt(FPathImagem)), '','',opFile.FileName);
                                   CopyFile(pChar(FPathImagem), pChar(ctrPATH_FOTOS + ObterNomeImagem(gclMarcas.IMAGENS.IDIMAGEM)), False);
                              end;
                     end;
         abAlterar : begin
                         if ModelConexaoDados.memMarcas.FieldByName('IDLOGO_MARCA').AsString <> '' then
                            gclMarcas.IMAGENS.IDIMAGEM := ModelConexaoDados.memMarcas.FieldByName('IDLOGO_MARCA').AsInteger else
                            gclMarcas.IMAGENS.IDIMAGEM := 0;

                          if (FPathImagem <> '') and (gclMarcas.IMAGENS.IDIMAGEM = 0) then
                             begin
                                 gclMarcas.IMAGENS.IDIMAGEM := GravaImagem(0, 'MRC',UpperCase(ExtractFileExt(FPathImagem)), '', '', opFile.FileName);
                                 CopyFile(pChar(FPathImagem), pChar(ctrPATH_FOTOS + ObterNomeImagem(gclMarcas.IMAGENS.IDIMAGEM)), False);
                             end;
                         if (FPathImagem <> '') and (gclMarcas.IMAGENS.IDIMAGEM > 0) then
                            begin
                                 AtualizaImagem(gclMarcas.IMAGENS.IDIMAGEM);
                                 CopyFile(pChar(FPathImagem), pChar(ctrPATH_FOTOS + ObterNomeImagem(gclMarcas.IMAGENS.IDIMAGEM)), False);
                            end;
                     end;
     end;

     case FStatus of
         abIncluir: begin
                         try
                             rResultado := cadastraMarca(gclMarcas);

                             if isNumeric(rResultado) = True then
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

procedure TfrmCadastroMarcas.recLogoMarcaClick(Sender: TObject);
var
ANomeImagem, AExtensao : String;
begin
    if opFile.Execute then
        begin
            AExtensao := UpperCase(ExtractFileExt(opFile.FileName));
            if (Pos('JPG', AExtensao) = 0) and (Pos('JPEG', AExtensao) = 0) then
                begin
                    MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                              'Formato do arquivo inválido, selecione um arquivo do tipo "jpg"!',
                              apTitulo, MB_OK + MB_ICONEXCLAMATION);
                    Exit;
                end
            else
                begin
                    if TamanhoImagem(opFile.FileName) <> ctrSIZE_LOGO then
                        begin
                            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                      pChar('O arquivo da foto deve ser no formato de ' + ctrSIZE_LOGO + '!'),
                                      apTitulo, MB_OK + MB_ICONEXCLAMATION);
                            Exit;
                        end
                    else
                        begin
                             FPathImagem := opFile.FileName;
                             recLogoMarca.Fill.Bitmap.Bitmap.LoadFromFile(FPathImagem);
                        end;
                end;
        end;

end;

end.
