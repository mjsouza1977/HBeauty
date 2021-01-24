unit View.Fornecedores.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, ACBrBase, ACBrValidador, FMX.Effects, FMX.Filter.Effects, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox,
  FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSBaseGroup, FMX.TMSRadioGroup,
  FMX.Edit, FMX.TabControl, FMX.Controls.Presentation, FMX.TMSButton, FMX.ListBox, Model.Fornecedor.Servidor.HBeauty, FireDAC.Comp.Client,
  Units.Enumerados.HBeauty, Units.Utils.Dados.HBeauty, Model.Marca.Servidor.HBeauty, View.Marcas.HBeauty, Model.Vendedor.Servidor.HBeauty,
  View.Contatos.HBeauty, Model.Imagens.Servidor.HBeauty;

type
  TfrmCadastroFornecedores = class(TForm)
    recRodapeTerceirizada: TRectangle;
    btnAlterar: TTMSFMXButton;
    btnFechar: TTMSFMXButton;
    btnIncluir: TTMSFMXButton;
    btnSalvar: TTMSFMXButton;
    btnCancelar: TTMSFMXButton;
    tabCabecarioFornecedor: TTabControl;
    tabPesquisa: TTabItem;
    recCabecarioTerceirizada: TRectangle;
    btnPesquisar: TTMSFMXButton;
    Label1: TLabel;
    Rectangle6: TRectangle;
    edtPesquisaBase: TEdit;
    rbOperador: TTMSFMXRadioGroup;
    rbPor: TTMSFMXRadioGroup;
    tabDados: TTabItem;
    Rectangle3: TRectangle;
    Label4: TLabel;
    lblNome: TLabel;
    Label13: TLabel;
    lblStatus: TLabel;
    tabGerenciadorFornecedor: TTabControl;
    tabListaFornecedor: TTabItem;
    Layout4: TLayout;
    recModal: TRectangle;
    recMsg: TRectangle;
    Layout1: TLayout;
    Line10: TLine;
    Image7: TImage;
    lblCaption: TLabel;
    Layout2: TLayout;
    imgIcoMsg: TImage;
    lblMensagem: TLabel;
    sbtnOK: TSpeedButton;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    Rectangle11: TRectangle;
    grdListaFornecedor: TTMSFMXGrid;
    StyleBook1: TStyleBook;
    tabFichaFornecedor: TTabItem;
    rgDados: TTMSFMXRadioGroup;
    Rectangle1: TRectangle;
    edtRazaoSocial: TEdit;
    Label2: TLabel;
    Rectangle10: TRectangle;
    edtCNPJ: TEdit;
    Label10: TLabel;
    Rectangle12: TRectangle;
    edtIE: TEdit;
    Label11: TLabel;
    Rectangle13: TRectangle;
    edtNomeFantasia: TEdit;
    Label12: TLabel;
    Rectangle16: TRectangle;
    lblNumero: TLabel;
    edtNumeroLog: TNumberBox;
    Rectangle2: TRectangle;
    edtLogradouro: TEdit;
    Label3: TLabel;
    Rectangle4: TRectangle;
    edtComplementoLog: TEdit;
    Label5: TLabel;
    Rectangle5: TRectangle;
    edtBairroLog: TEdit;
    Label6: TLabel;
    Rectangle7: TRectangle;
    edtCepLog: TEdit;
    Label7: TLabel;
    Rectangle8: TRectangle;
    edtCidadeLog: TEdit;
    Label8: TLabel;
    Rectangle9: TRectangle;
    edtUFLog: TEdit;
    Label9: TLabel;
    grpContatos: TGroupBox;
    btnCadastraTelefone: TTMSFMXButton;
    btnCadastraEmail: TTMSFMXButton;
    FillRGBEffect2: TFillRGBEffect;
    ACBrValidador1: TACBrValidador;
    grpMarca: TGroupBox;
    recMarcas: TRectangle;
    gbVendedor: TGroupBox;
    Rectangle14: TRectangle;
    cbVendedores: TComboBox;
    TMSFMXButton1: TTMSFMXButton;
    Label14: TLabel;
    recLogoFornecedor: TRectangle;
    opFile: TOpenDialog;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure grdListaFornecedorCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCNPJTyping(Sender: TObject);
    procedure edtCepLogTyping(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtCNPJKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtIEKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtRazaoSocialKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLogradouroKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNumeroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure TMSFMXButton1Click(Sender: TObject);
    procedure btnCadastraTelefoneClick(Sender: TObject);
    procedure btnCadastraEmailClick(Sender: TObject);
    procedure edtCepLogExit(Sender: TObject);
    procedure recLogoFornecedorClick(Sender: TObject);
  private
    FIdSelecionado : Integer;
    FScroll : TVertScrollBox;
    FStatus : TAcaoBotao;
    FNomeMarcas : String;
    FListaMarcasDepois, FPathImage : String;
    FListaMarcasAntes, FListaMarcas : TStringList;
    procedure listaMarcas(ATable : TFDMemTable; AIDForn : Integer);
    procedure AlimentaClasseFornecedores;
    procedure SalvaMarcaFornecedor(AIdForn: Integer);
    procedure armazenaListaMarcas;
    function excluiMarca: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFornecedores: TfrmCadastroFornecedores;

implementation

{$R *.fmx}

uses Units.Classes.HBeauty,
     Model.Fornecedor.HBeauty,
     Model.Dados.Server.HBeauty,
     Units.Consts.HBeauty,
     Controller.Manipula.Design.HBeauty,
     Model.Genericos.Servidor.HBeauty,
     System.UIConsts,
     Units.Strings.HBeauty,
     Units.Utils.HBeauty,
     Winapi.Windows,
     FMX.Platform.Win,
     Units.Mensagens.HBeauty,
     Controller.Formata.HBeauty,
     Model.Endereco.HBeauty;

procedure TfrmCadastroFornecedores.AlimentaClasseFornecedores;
begin
    gclFornecedor.ID_FORN             := FIdSelecionado;
    gclFornecedor.NOME_FORN           := edtRazaoSocial.Text;
    gclFornecedor.PSEUDO_FORN         := edtNomeFantasia.Text;
    gclFornecedor.CNPJCPF_FORN        := ApenasNumeros(edtCNPJ.Text);
    gclFornecedor.IERG_FORN           := edtIE.Text;
    gclFornecedor.IDVEND_FORN         := Integer(cbVendedores.Items.Objects[cbVendedores.ItemIndex]);

    gclFornecedor.ENDERECO.LOGRADOURO := edtLogradouro.Text;
    gclFornecedor.ENDERECO.NRLOG      := edtNumeroLog.Text.ToInteger;
    gclFornecedor.ENDERECO.BAIRROLOG  := edtBairroLog.Text;
    gclFornecedor.ENDERECO.CIDADELOG  := edtCidadeLog.Text;
    gclFornecedor.ENDERECO.UFLOG      := edtUFLog.Text;
    gclFornecedor.ENDERECO.CEP        := edtCepLog.Text;
end;

procedure TfrmCadastroFornecedores.btnAlterarClick(Sender: TObject);
begin
    if FIdSelecionado > 0 then
        begin
            Case BloqueiaRegistro(True, FIdSelecionado, tcFornecedores) of
                False : begin
                            FStatus                := abAlterar;
                            PesquisaFornecedores('','','','',FIdSelecionado);

                            carregaCamposSelecionados(ModelConexaoDados.memGenerica, 'ID_VEND, NOME_VEND, SOBRENOME_VEND','HBVENDEDOR','ORDER BY NOME_VEND');
                            ModelConexaoDados.memGenerica.First;
                            cbVendedores.Items.Clear;
                            cbVendedores.Items.Add('');
                            While not ModelConexaoDados.memGenerica.Eof do
                                begin
                                    cbVendedores.Items.AddObject(ModelConexaoDados.memGenerica.FieldByName('NOME_VEND').AsString + ' ' +
                                                                 ModelConexaoDados.memGenerica.FieldByName('SOBRENOME_VEND').AsString,
                                                                 TObject(ModelConexaoDados.memGenerica.FieldByName('ID_VEND').AsInteger));
                                    ModelConexaoDados.memGenerica.Next;
                                end;

                            if ModelConexaoDados.memFornecedores.FieldByName('IDVEND_FORN').AsInteger > 0 then
                                cbVendedores.ItemIndex := cbVendedores.Items.IndexOf(ModelConexaoDados.memGenerica.FieldByName('NOME_VEND').AsString + ' ' +
                                                                                     ModelConexaoDados.memGenerica.FieldByName('SOBRENOME_VEND').AsString);


                            carregaCamposSelecionados(ModelConexaoDados.memGenerica, 'ID_MARCA, MARCA_MARCA','HBMARCA','ORDER BY MARCA_MARCA');
                            listaMarcas(ModelConexaoDados.memGenerica, FIdSelecionado);

                            edtCNPJ.Text           := FormatarCNPJouCPF(ModelConexaoDados.memFornecedores.FieldByName('CNPJCPF_FORN').AsString);
                            edtIE.Text             := ModelConexaoDados.memFornecedores.FieldByName('IERG_FORN').AsString;
                            edtRazaoSocial.Text    := ModelConexaoDados.memFornecedores.FieldByName('NOME_FORN').AsString;
                            edtNomeFantasia.Text   := ModelConexaoDados.memFornecedores.FieldByName('PSEUDO_FORN').AsString;
                            edtLogradouro.Text     := ModelConexaoDados.memFornecedores.FieldByName('LOGRADOURO_FORN').AsString;
                            edtNumeroLog.Text      := ModelConexaoDados.memFornecedores.FieldByName('NRLOG_FORN').AsString;
                            edtComplementoLog.Text := ModelConexaoDados.memFornecedores.FieldByName('COMPLLOG_FORN').AsString;
                            edtBairroLog.Text      := ModelConexaoDados.memFornecedores.FieldByName('BAILOG_FORN').AsString;
                            edtCepLog.Text         := FormatarCEP(ModelConexaoDados.memFornecedores.FieldByName('CEPLOG_FORN').AsString);
                            edtCidadeLog.Text      := ModelConexaoDados.memFornecedores.FieldByName('CIDLOG_FORN').AsString;
                            edtUFLog.Text          := ModelConexaoDados.memFornecedores.FieldByName('UFLOG_FORN').AsString;

                            AlimentaClasseFornecedores;

                            if ModelConexaoDados.memFornecedores.FieldByName('IDLOGO_FORN').AsString > '0' then
                                begin
                                    gclFornecedor.IMAGENS.IDIMAGEM := ModelConexaoDados.memFornecedores.FieldByName('IDLOGO_FORN').AsInteger;
                                    recLogoFornecedor.Fill.Bitmap.Bitmap.LoadFromFile(ctrPATH_FOTOS + ObterNomeImagem(gclFornecedor.IMAGENS.IDIMAGEM));
                                end
                            else
                                begin
                                    gclFornecedor.IMAGENS.IDIMAGEM       := 0;
                                    recLogoFornecedor.Fill.Bitmap.Bitmap := nil;
                                end;

                            ControlaBotoes(Self, False);
                            tabFichaFornecedor.Visible := True;
                            tabGerenciadorFornecedor.TabIndex := 1;
                            tabCabecarioFornecedor.Next;
                        end;
                   True : begin
                              MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Este registro esta sendo editado por outro usuário!',
                                         apTitulo, MB_OK + MB_ICONSTOP);
                              Exit;
                          end;
            end;
        end
    else
        begin
            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'Selecione um profissional na lista para alterar!',
                       apTitulo, MB_OK + MB_ICONINFORMATION);
            Exit;
        end;
end;

procedure TfrmCadastroFornecedores.btnCadastraEmailClick(Sender: TObject);
begin

     if FStatus = abIncluir then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os e-mails é necessário primeiro salvar o fornecedor'+#13#13+
                         'Deseja salvar agora?', apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    FIdSelecionado := CadastraFornecedor(gclFornecedor, Self).ToInteger;
                    ControlaBotoes(Self, True);

                    if FIdSelecionado <> 0 then
                       begin
                           Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
                           frmCadastroContatos.TipoForm   := tfEmail;
                           frmCadastroContatos.IdRegTab   := FIdSelecionado;
                           frmCadastroContatos.NomeTabela := PrefixoTabela(tcFornecedores);
                           frmCadastroContatos.Nome       := edtRazaoSocial.Text;
                           frmCadastroContatos.Titulo     := 'Fornecedor';
                           frmCadastroContatos.TituloForm := 'Cadastro de E-mails';
                           frmCadastroContatos.imgIconeForm.BitmapName := 'Email';
                           frmCadastroContatos.ShowModal;
                       end;
                end;
        end
    else
        begin
            Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
            frmCadastroContatos.TipoForm   := tfEmail;
            frmCadastroContatos.IdRegTab   := FIdSelecionado;
            frmCadastroContatos.NomeTabela := PrefixoTabela(tcFornecedores);
            frmCadastroContatos.Nome       := edtRazaoSocial.Text;
            frmCadastroContatos.Titulo     := 'Fornecedor';
            frmCadastroContatos.TituloForm := 'Cadastro de E-mails';
            frmCadastroContatos.imgIconeForm.BitmapName := 'Email';
            frmCadastroContatos.ShowModal;
        end;

end;

procedure TfrmCadastroFornecedores.btnCadastraTelefoneClick(Sender: TObject);
begin
    if FStatus = abIncluir then
        begin
            if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                         'Para cadastrar os telefones é necessário primeiro salvar o fornecedor'+#13#13+
                         'Deseja salvar agora?', 'HBeauty', MB_YESNO + MB_ICONQUESTION) = IDYES then
                begin
                    AlimentaClasseFornecedores;
                    FIdSelecionado := CadastraFornecedor(gclFornecedor, Self).ToInteger;

                    if FIdSelecionado <> 0 then
                        begin
                            Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
                            frmCadastroContatos.TipoForm     := tfTelefone;
                            frmCadastroContatos.IdRegTab     := FIdSelecionado;
                            frmCadastroContatos.NomeTabela   := PrefixoTabela(tcFornecedores);
                            frmCadastroContatos.Titulo       := 'Fornecedor';
                            frmCadastroContatos.TituloForm   := 'Cadastro de Telefone';
                            frmCadastroContatos.imgIconeForm.BitmapName := 'Telefone';
                            frmCadastroContatos.ShowModal;
                            FStatus := abNulo;
                        end;
                end;
        end
    else
        begin
            Application.CreateForm(TfrmCadastroContatos, frmCadastroContatos);
            frmCadastroContatos.TipoForm   := tfTelefone;
            frmCadastroContatos.IdRegTab   := FIdSelecionado;
            frmCadastroContatos.NomeTabela := PrefixoTabela(tcFornecedores);
            frmCadastroContatos.Nome       := edtRazaoSocial.Text;
            frmCadastroContatos.Titulo     := 'Fornecedor';
            frmCadastroContatos.imgIconeForm.BitmapName := 'Telefone';
            frmCadastroContatos.TituloForm := 'Cadastro de Telefone';

            frmCadastroContatos.ShowModal;
        end;

end;

procedure TfrmCadastroFornecedores.btnCancelarClick(Sender: TObject);
var
AMensagem : String;
begin

     case FStatus of
         abIncluir : AMensagem := 'Tem certeza que deseja cancelar esta inclusão. ' +
                                  'Os dados serão perdidos.'+#13#13+
                                  'Deseja continuar?';
         abAlterar : AMensagem := 'Tem certeza que deseja cancelar esta alteração. ' +
                                  'Caso tenha feito alguma alteração os dados não serão salvos.'+#13#13+
                                  'Deseja continuar?';
            abNulo : begin
                         LimpaForm(Self);
                         tabFichaFornecedor.Visible := False;
                         tabCabecarioFornecedor.TabIndex := 0;
                         tabGerenciadorFornecedor.TabIndex := 0;
                         ControlaBotoes(Self, True);
                         Abort;
                     end;
     end;

     if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                   pChar(AMensagem), apTitulo, MB_YESNO + MB_ICONQUESTION) = IDYES then
         begin
             LimpaForm(Self);
             tabFichaFornecedor.Visible := False;
             tabCabecarioFornecedor.TabIndex := 0;
             tabGerenciadorFornecedor.TabIndex := 0;
             BloqueiaRegistro(False, FIdSelecionado, tcFornecedores);
             ControlaBotoes(Self, True);
         end;

end;

procedure TfrmCadastroFornecedores.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadastroFornecedores.btnIncluirClick(Sender: TObject);
begin
     tabFichaFornecedor.Visible := True;
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
     lblStatus.Text := 'Inclusão';
     tabCabecarioFornecedor.Next;
     tabGerenciadorFornecedor.ActiveTab := tabFichaFornecedor;
end;

procedure TfrmCadastroFornecedores.btnPesquisarClick(Sender: TObject);
var
TipoPesquisa : String;
begin

     case rbOperador.ItemIndex of
          0 : TipoPesquisa := tpInicia;
          1 : TipoPesquisa := tpTermina;
          2 : TipoPesquisa := tpContenha;
          3 : TipoPesquisa := tpIgual;
     end;

     case rbPor.ItemIndex of
          0 : PesquisaFornecedores(edtPesquisaBase.Text,'', '',TipoPesquisa,0);
          1 : PesquisaFornecedores('',edtPesquisaBase.Text,'',TipoPesquisa,0);
          2 : PesquisaFornecedores('','',ApenasNumeros(edtPesquisaBase.Text),TipoPesquisa,0);
     end;

     CarregaGrid(ModelConexaoDados.memFornecedores,grdListaFornecedor,AFieldsFornecedores, ACaptionFornecedores, ASizeColFornecedores);

     if ModelConexaoDados.memFornecedores.RecordCount > 0 then
        FIdSelecionado :=  ExtraiTextoGrid(grdListaFornecedor.Cells[0, 1]).ToInteger;

end;

procedure TfrmCadastroFornecedores.armazenaListaMarcas;
var
i : Integer;
begin
    FListaMarcasDepois := '';
    for i := 0 to frmCadastroFornecedores.ComponentCount - 1 do
        begin
            if frmCadastroFornecedores.Components[i] is TCheckBox then
                begin
                    if Pos('chkMarca', TCheckBox(frmCadastroFornecedores.Components[i]).Name) > 0 then
                        if TCheckBox(frmCadastroFornecedores.Components[i]).IsChecked = True then
                            FListaMarcasDepois := FListaMarcasDepois + '|' + TCheckBox(frmCadastroFornecedores.Components[i]).TagString;
                end;
        end;
end;

procedure TfrmCadastroFornecedores.SalvaMarcaFornecedor(AIdForn : Integer);
var
i : Integer;
begin
    for i := 0 to frmCadastroFornecedores.ComponentCount - 1 do
        begin
            if frmCadastroFornecedores.Components[i] is TCheckBox then
                begin
                    if Pos('chkMarca', TCheckBox(frmCadastroFornecedores.Components[i]).Name) > 0 then
                        if TCheckBox(frmCadastroFornecedores.Components[i]).IsChecked = True then
                            cadastraMarcaFornecedor(AIdForn, TCheckBox(frmCadastroFornecedores.Components[i]).TagString.ToInteger);
                end;
        end;
end;

procedure TfrmCadastroFornecedores.TMSFMXButton1Click(Sender: TObject);
begin
Application.CreateForm(TfrmCadastroMarcas, frmCadastroMarcas);
frmCadastroMarcas.ShowModal;

carregaMarcas;
listaMarcas(ModelConexaoDados.memMarcas, 0);
end;

function TfrmCadastroFornecedores.excluiMarca : Boolean;
var
i : Integer;
AMarcas, ACodigos : String;
ARes : Boolean;
begin

     ARes := True;
     AMarcas := marcasUsadasProdutos;

     for i := 0 to FListaMarcasAntes.Count - 1 do
         begin
             if Pos(FListaMarcasAntes.Strings[i], FListaMarcasDepois) = 0 then
                 begin
                     if Pos(FListaMarcasAntes.Strings[i], AMarcas) > 0 then
                        begin
                            ARes := False;
                            ACodigos := ACodigos + ',' + FListaMarcasAntes.Strings[i];
                        end;
                 end;
         end;
     if not ARes then
         begin
             ACodigos := Copy(ACodigos, 2, Length(ACodigos));
             carregaCamposSelecionados(ModelConexaoDados.memGenerica, 'MARCA_MARCA', 'HBMARCA', 'WHERE ID_MARCA IN (' + ACodigos + ')');

             ModelConexaoDados.memGenerica.First;
             while not ModelConexaoDados.memGenerica.Eof do
                 begin
                     FNomeMarcas := ModelConexaoDados.memGenerica.FieldByName('MARCA_MARCA').AsString + ', ' + FNomeMarcas;
                     ModelConexaoDados.memGenerica.Next;
                 end;
             FNomeMarcas := Copy(FNomeMarcas, 1, Length(FNomeMarcas) - 2);
         end;
     Result := ARes;
end;

procedure TfrmCadastroFornecedores.btnSalvarClick(Sender: TObject);
var
S : String;
begin
    rResultado := '';
    case FStatus of
         abIncluir : begin
                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                         'Confirma a inclusão deste fornecedor?',
                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                             IDYES : begin
                                         if cbVendedores.ItemIndex < 0 then
                                             begin
                                                 MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                            'É necessário selecionar um vendedor para o fornecedor!',
                                                            apTitulo, MB_OK + MB_ICONWARNING);
                                                 Exit;
                                             end
                                         else
                                             begin
                                                 AlimentaClasseFornecedores;
                                                 Try
                                                    if FPathImage <> '' then
                                                       begin
                                                           gclFornecedor.IMAGENS.IDIMAGEM := GravaImagem(0, 'FOR',UpperCase(ExtractFileExt(FPathImage)), pxFornecedor,'', opFile.FileName);
                                                           CopyFile(pChar(FPathImage), pChar(ctrPATH_FOTOS + ObterNomeImagem(gclFornecedor.IMAGENS.IDIMAGEM)), False);
                                                       end;

                                                    FIdSelecionado := CadastraFornecedor(gclFornecedor, Self).ToInteger;
                                                    SalvaMarcaFornecedor(FIdSelecionado);

                                                    case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                    'Fornecedor cadastrado com sucesso.'+#13#13+
                                                                    'Deseja cadastrar outro fornecedor?', apTitulo,
                                                                     MB_YESNO + MB_ICONQUESTION) of
                                                        IDYES : begin
                                                                     FStatus := abIncluir;
                                                                     FPathImage := '';
                                                                     recLogoFornecedor.Fill.Bitmap.Bitmap := nil;
                                                                     LimpaForm(Self);
                                                                     edtCNPJ.SetFocus;
                                                                end;
                                                         IDNO : begin
                                                                     FStatus := abNulo;
                                                                     FPathImage := '';
                                                                     recLogoFornecedor.Fill.Bitmap.Bitmap := nil;
                                                                     tabGerenciadorFornecedor.TabIndex := 0;
                                                                     tabCabecarioFornecedor.Previous;
                                                                     tabFichaFornecedor.Visible := False;
                                                                     ControlaBotoes(Self, True);
                                                                end;
                                                    end;

                                                 Except
                                                     On E:Exception do
                                                         begin
                                                             if Pos('aborted', E.Message) = 0 then
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
                         end;
                     end;
         abAlterar : begin
                         armazenaListaMarcas;
                         case excluiMarca of
                              True : begin
                                         case MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                         'Confirma a alteração desta fornecedor?',
                                                         apTitulo, MB_YESNO + MB_ICONQUESTION) of
                                             IDYES : begin
                                                         try
                                                             AlimentaClasseFornecedores;

                                                              if ModelConexaoDados.memFornecedores.FieldByName('IDLOGO_FORN').AsString <> '' then
                                                                    gclFornecedor.IMAGENS.IDIMAGEM := ModelConexaoDados.memFornecedores.FieldByName('IDLOGO_FORN').AsInteger else
                                                                    gclFornecedor.IMAGENS.IDIMAGEM := 0;

                                                                 if (FPathImage <> '') and (gclFornecedor.IMAGENS.IDIMAGEM = 0) then
                                                                     begin
                                                                         gclFornecedor.IMAGENS.IDIMAGEM := GravaImagem(0, pxFornecedor,UpperCase(ExtractFileExt(FPathImage)),'','',opFile.FileName);
                                                                         CopyFile(pChar(FPathImage), pChar(ctrPATH_FOTOS + ObterNomeImagem(gclFornecedor.IMAGENS.IDIMAGEM)), False);
                                                                     end;
                                                                 if (FPathImage <> '') and (gclFornecedor.IMAGENS.IDIMAGEM > 0) then
                                                                    begin
                                                                         AtualizaImagem(gclFornecedor.IMAGENS.IDIMAGEM);
                                                                         CopyFile(pChar(FPathImage), pChar(ctrPATH_FOTOS + ObterNomeImagem(gclFornecedor.IMAGENS.IDIMAGEM)), False);
                                                                    end;

                                                                     atualizaFornecedores(gclFornecedor);
                                                                     limpaMarcaFornecedor(FIdSelecionado);
                                                                     SalvaMarcaFornecedor(FIdSelecionado);

                                                                     BloqueiaRegistro(False, FIdSelecionado, tcFornecedores);
                                                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                                                'Registro salvo com sucesso!', apTitulo,
                                                                                MB_OK + MB_ICONINFORMATION);
                                                                     btnPesquisarClick(Self);
                                                                     LimpaForm(Self);
                                                                     tabFichaFornecedor.Visible := False;
                                                                     ControlaBotoes(Self, True);
                                                                     tabCabecarioFornecedor.Previous;
                                                                     tabGerenciadorFornecedor.TabIndex := 0;
                                                         except
                                                              On E:Exception do
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
                             False : begin
                                         MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                    pChar('A(s) marca(s) ' + FNomeMarcas + ' esta(ão) vinculada(s) a um ou mais produtos!' + #13 +
                                                          'Corrija para continuar.'), apTitulo, MB_OK + MB_ICONWARNING);
                                         Exit;
                                     end;
                         end;
                     end;
    end;
end;

procedure TfrmCadastroFornecedores.edtBairroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtCidadeLog);
end;

procedure TfrmCadastroFornecedores.edtCepLogExit(Sender: TObject);
var
AEndereco : TModelEndereco;
begin
   try
       AEndereco := TModelEndereco.Create(Self);
       AEndereco := PesquisaCEP(Self, edtCepLog.Text);

       edtCepLog.Text     := AEndereco.CEP;
       edtLogradouro.Text := AEndereco.LOGRADOURO;
       edtBairroLog.Text  := AEndereco.BAIRROLOG;
       edtCidadeLog.Text  := AEndereco.CIDADELOG;
       edtUFLog.Text      := AEndereco.UFLOG;
   finally
       AEndereco.DisposeOf;
   end;
end;

procedure TfrmCadastroFornecedores.edtCepLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLogradouro);
end;

procedure TfrmCadastroFornecedores.edtCepLogTyping(Sender: TObject);
begin
Formatar(edtCepLog, erCEP);
end;

procedure TfrmCadastroFornecedores.edtCidadeLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtUFLog);
end;

procedure TfrmCadastroFornecedores.edtCNPJExit(Sender: TObject);
begin
     if Length(ApenasNumeros(edtCNPJ.Text)) = 14 then
        edtCNPJ.Text := ACBrValidador.FormatarCNPJ(edtCNPJ.Text);
end;

procedure TfrmCadastroFornecedores.edtCNPJKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtIE);
end;

procedure TfrmCadastroFornecedores.edtCNPJTyping(Sender: TObject);
begin
Formatar(edtCNPJ, erCNPJ);
end;

procedure TfrmCadastroFornecedores.edtComplementoLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtBairroLog);
end;

procedure TfrmCadastroFornecedores.edtIEKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtRazaoSocial);
end;

procedure TfrmCadastroFornecedores.edtLogradouroKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtNumeroLog);
end;

procedure TfrmCadastroFornecedores.edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtCepLog);
end;

procedure TfrmCadastroFornecedores.edtNumeroLogKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtComplementoLog);
end;

procedure TfrmCadastroFornecedores.edtRazaoSocialKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtNomeFantasia);
end;

procedure TfrmCadastroFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     DebloqueiaRegistro('HBFORNECEDOR');
     FreeAndNil(FListaMarcas);
     FreeAndNil(FListaMarcasAntes);
     FreeAndNil(gclFornecedor);
     Action := TCloseAction.caFree;
end;

procedure TfrmCadastroFornecedores.FormCreate(Sender: TObject);
begin
     FListaMarcas       := TStringList.Create;
     FListaMarcasAntes  := TStringList.Create;

     CarregaPersonalizacaoCabecarioRodape(Self);
     tabCabecarioFornecedor.TabIndex   := 0;
     tabGerenciadorFornecedor.TabIndex := 0;
     gclFornecedor := TModelFornecedor.Create(Self);
     carregaMarcas;
     listaMarcas(ModelConexaoDados.memMarcas, 0);

     PesquisaVendedor('','','',0);

     ModelConexaoDados.memVendedores.First;

     cbVendedores.Items.Clear;
     while not ModelConexaoDados.memVendedores.Eof do
         begin
              cbVendedores.Items.AddObject(ModelConexaoDados.memVendedores.FieldByName('NOME_VEND').AsString + ' ' +
                                           ModelConexaoDados.memVendedores.FieldByName('SOBRENOME_VEND').AsString,
                                           TObject(ModelConexaoDados.memVendedores.FieldByName('ID_VEND').AsInteger));
              ModelConexaoDados.memVendedores.Next;
         end;
     CarregaGrid(nil,grdListaFornecedor,AFieldsFornecedores, ACaptionFornecedores, ASizeColFornecedores, True);
end;

procedure TfrmCadastroFornecedores.grdListaFornecedorCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FIdSelecionado := ExtraiTextoGrid(grdListaFornecedor.Cells[0, ARow]).ToInteger;
end;

procedure TfrmCadastroFornecedores.listaMarcas(ATable : TFDMemTable; AIDForn : Integer);
var
ALayout : TLayout;
ACheckBox : TCheckBox;
FTable : TFDMemTable;
AIndex : Integer;
begin

    if Assigned(FScroll) then FreeAndNil(FScroll);

    FScroll := TVertScrollBox.Create(nil);
    FScroll.Parent := recMarcas;
    FScroll.Align := TAlignLayout.Client;
    FScroll.Margins.Top    := 5;
    FScroll.Margins.Left   := 5;
    FScroll.Margins.Right  := 5;
    FScroll.Margins.Bottom := 5;
    AIndex := 0;

    try

        FTable := TFDMemTable.Create(nil);
        carregaCamposSelecionados(FTable,'*','HBFORNXMARCA','WHERE IDFORN_FORNXMARCA = ' + AIDForn.ToString);

        While not ATable.eof do
            begin
                ALayout := TLayout.Create(nil);
                ALayout.Parent := FScroll;
                ALayout.Align  := TAlignLayout.Top;
                ALayout.Height := 30;

                ACheckBox        := TCheckBox.Create(Self);
                ACheckBox.Parent := ALayout;
                ACheckBox.Align  := TAlignLayout.Client;
                ACheckBox.StyledSettings := ACheckBox.StyledSettings - [TStyledSetting.Size,
                                                                        TStyledSetting.FontColor,
                                                                        TStyledSetting.Family,
                                                                        TStyledSetting.Style];
                ACheckBox.FontColor  := StringToAlphaColor('#FF980000');
                ACheckBox.Font.Size  := 14;
                ACheckBox.Font.Style := [TFontStyle.fsBold];
                ACheckBox.Text       := ATable.FieldByName('MARCA_MARCA').AsString;
                ACheckBox.TagString  := ATable.FieldByName('ID_MARCA').AsString;
                ACheckBox.Name       := 'chkMarca' + AIndex.ToString;
 
                FTable.Filtered := False;
                FTable.Filter   := 'IDMARCA_FORNXMARCA=' + ATable.FieldByName('ID_MARCA').AsString;
                FTable.Filtered := True;

                if FTable.RecordCount > 0 then
                    begin
                        ACheckBox.IsChecked := True;
                        FListaMarcasAntes.Add(ATable.FieldByName('ID_MARCA').AsString);
                    end
                else
                    begin
                        ACheckBox.IsChecked := False;
                    end;

                AIndex := AIndex + 1;
                ATable.Next;
            end;
    finally
        FreeAndNil(FTable);
    end;

end;

procedure TfrmCadastroFornecedores.recLogoFornecedorClick(Sender: TObject);
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
                             FPathImage := opFile.FileName;
                             recLogoFornecedor.Fill.Bitmap.Bitmap.LoadFromFile(FPathImage);
                        end;
                end;
        end;
end;

end.
