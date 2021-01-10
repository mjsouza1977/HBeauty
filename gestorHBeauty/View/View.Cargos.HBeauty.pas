unit View.Cargos.HBeauty;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell,
  FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.StdCtrls, FMX.Objects, FMX.TMSBitmap, FMX.Controls.Presentation, FMX.TMSButton,
  Controller.Manipula.Design.HBeauty, Model.Profissionais.HBeauty, Units.Utils.Dados.HBeauty, Units.Utils.HBeauty,
  Units.Enumerados.HBeauty, Units.Mensagens.HBeauty;

type
  TfrmCadastroCargos = class(TForm)
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
    grdListaCargo: TTMSFMXGrid;
    lytCadastraCargo: TLayout;
    Rectangle2: TRectangle;
    Label2: TLabel;
    mmDescricao: TMemo;
    Label3: TLabel;
    Rectangle15: TRectangle;
    edtCargo: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCargoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure grdListaCargoCellClick(Sender: TObject; ACol, ARow: Integer);
  private
    FIDCargoSelecionado : Integer;
    FStatus : TAcaoBotao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCargos: TfrmCadastroCargos;

implementation

uses
  Units.Classes.HBeauty, Model.Cargos.HBeauty, Model.Dados.Server.HBeauty,
  Model.Profissionais.Servidor.HBeauty, Units.Consts.HBeauty, Winapi.Windows,
  FMX.Platform.Win;

{$R *.fmx}

procedure TfrmCadastroCargos.btnAlterarClick(Sender: TObject);
begin
    FStatus := abAlterar;

    if FIDCargoSelecionado > 0 then
        begin
            //Carrega e exibe as informações nos campos
            with ModelConexaoDados.memCargos do
                begin
                    grdListaCargo.Enabled := False;
                    pesquisaCargos(FIDCargoSelecionado,'');
                    gclCargos.NOME_CARGO  := FieldByName('NOME_CARGO').AsString;
                    gclCargos.DESCR_CARGO := FieldByName('DESCR_CARGO').AsString;
                    edtCargo.Text         := gclCargos.NOME_CARGO;
                    mmDescricao.Text      := gclCargos.DESCR_CARGO;
                    edtCargo.SetFocus;
                    lytCadastraCargo.Visible := True;
                    BloqueiaRegistro(True, FIDCargoSelecionado, tcCargo);
                    ControlaBotoes(Self, False);
                end;
        end
    else
        begin
            if ModelConexaoDados.memCargos.RecordCount = 0 then
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

procedure TfrmCadastroCargos.btnCancelarClick(Sender: TObject);
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
            BloqueiaRegistro(False, FIDCargoSelecionado, tcCargo);
            LimpaForm(Self);
            lytCadastraCargo.Visible := False;
            FStatus := abNulo;
            ControlaBotoes(Self, True);
            grdListaCargo.Enabled := True;
        end;
end;

procedure TfrmCadastroCargos.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadastroCargos.btnIncluirClick(Sender: TObject);
begin
     //Prepara o Form para a inclusão
     LimpaForm(Self);
     ControlaBotoes(Self, False);
     FStatus := abIncluir;
     lytCadastraCargo.Visible := True;
     edtCargo.SetFocus;
     FIDCargoSelecionado := 0;
end;

procedure TfrmCadastroCargos.btnSalvarClick(Sender: TObject);
begin

     rResultado := '';
     gclCargos.ID_CARGO     := FIDCargoSelecionado;
     gclCargos.NOME_CARGO   := edtCargo.Text;
     gclCargos.DESCR_CARGO  := mmDescricao.Text;

     case FStatus of
         abIncluir: begin
                         try
                             rResultado := cadastraCargo(gclCargos);
                             if rResultado = '' then
                                 begin
                                     LimpaForm(Self);
                                     lytCadastraCargo.Visible := False;
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                'Cargo salvo com sucesso.', apTitulo,
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
                             rResultado := atualizaCargo(gclCargos);
                             if rResultado = '' then
                                 begin
                                     MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                'Cargo alterado com sucesso.', apTitulo,
                                                MB_OK + MB_ICONINFORMATION);
                                     LimpaForm(Self);
                                     lytCadastraCargo.Visible := False;
                                     FormShow(Self);
                                     FStatus := abNulo;
                                     ControlaBotoes(Self, True);
                                     grdListaCargo.Enabled := True;
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

procedure TfrmCadastroCargos.edtCargoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     NextField(Key, mmDescricao);
end;

procedure TfrmCadastroCargos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

procedure TfrmCadastroCargos.FormCreate(Sender: TObject);
begin
    CarregaPersonalizacaoCabecarioRodape(Self);

    //Cria a classe de habilidades e exibe o layout com os campos referidos
    gclCargos := TModelCargos.Create(Self);

end;

procedure TfrmCadastroCargos.FormShow(Sender: TObject);
begin

    //Limpa os campos do form
    LimpaForm(Self);

    //Oculta os campos de edição
    lytCadastraCargo.Visible    := False;

    carregaCargos;

    CarregaGrid(ModelConexaoDados.memCargos, grdListaCargo, AFieldsCargos, ACaptionCargos, ASizeColCargos);

    edtCargo.SetFocus;
    //Carrega o ID do primeiro registro
    ModelConexaoDados.memCargos.First;
    if ModelConexaoDados.memCargos.RecordCount = 0 then
        FIDCargoSelecionado := 0 else
        FIDCargoSelecionado := ModelConexaoDados.memCargos.FieldByName('ID_CARGO').AsInteger;

end;

procedure TfrmCadastroCargos.grdListaCargoCellClick(Sender: TObject; ACol, ARow: Integer);
begin
FIDCargoSelecionado := ExtraiTextoGrid(grdListaCargo.Cells[0, ARow]).ToInteger;
end;

end.

