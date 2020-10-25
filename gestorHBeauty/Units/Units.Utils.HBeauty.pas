unit Units.Utils.HBeauty;

interface

uses Units.Consts.HBeauty, FMX.Objects, FMX.Forms, FMX.Layouts, Units.Enumerados.HBeauty,
  FMX.Edit, FMX.ListBox, FMX.NumberBox;

function BooleanToString(ATrue, AFalse : String; AValue : Boolean) : String;
function StringToBool(ATrue, AFalse, AValue : String) : Boolean;
procedure CarregaImagemRessource(Image : TImage; NomeImagem : String);
procedure ControlaBotoes(AForm : TForm; AOpcao: Boolean);
function PrefixoTabela(ATabela : TTabelaCadastrada) : String;
function ExtraiTextoGrid(AValue : String) : String;

procedure NextField(Key : Word; ANext : TEdit); overload;
procedure NextField(Key : Word; ANext : TComboBox); overload;
procedure NextField(Key : Word; ANext : TNumberBox); overload;

implementation

uses
  Winapi.Windows, System.Classes, FMX.TMSButton, System.UITypes;

function ExtraiTextoGrid(AValue : String) : String;
var
    AIndex : Integer;
    ARes   : String;
    ACopia : Boolean;
begin
    ARes   := '';
    ACopia := False;

    for AIndex := 0 to Length(AValue) - 1 do
        begin
            if (ACopia = True) or (AValue[AIndex - 1] = '>') and (AValue[AIndex] <> '<') then
               begin
                    ACopia := True;
                    if ACopia then
                       if AValue[AIndex] <> '<' then
                          ARes := ARes + AValue[AIndex] else
                          Break;
               end;
        end;

    Result := ARes;

end;

function PrefixoTabela(ATabela : TTabelaCadastrada) : String;
begin

     case ATabela of
         tcProfissionais      : Result := 'PROFIS';
         tcFornecedores       : Result := 'FORNEC';
         tcClientes           : Result := 'CLIENT';
         tcEmpresaTercerizada : Result := 'EMPTER';
         tcTelefone           : Result := 'TELEFO';
     end;

end;

procedure NextField(Key : Word; ANext : TEdit);
begin

    if Key = vkReturn then ANext.SetFocus;

end;

procedure NextField(Key : Word; ANext : TNumberBox);
begin

    if Key = vkReturn then ANext.SetFocus;

end;

procedure NextField(Key : Word; ANext : TComboBox);
begin

    if Key = vkReturn then ANext.SetFocus;

end;

function StringToBool(ATrue, AFalse, AValue : String) : Boolean;
begin
     if AValue = ATrue  then Result := True;
     if AValue = AFalse then Result := False;
end;

function BooleanToString(ATrue, AFalse : String; AValue : Boolean) : String;
begin
     case AValue of
          True : Result := ATrue;
         False : Result := AFalse;
     end;
end;

procedure CarregaImagemRessource(Image : TImage; NomeImagem : String);
var
InStream: TResourceStream;
begin

   InStream := TResourceStream.Create(HInstance, NomeImagem, RT_RCDATA);
   try
      Image.Bitmap.LoadFromStream(InStream);
   finally
      InStream.Free;
   end;

end;

procedure ControlaBotoes(AForm : TForm; AOpcao: Boolean);
begin

         try
             TTMSFMXButton(AForm.FindComponent('btnIncluir')).Visible   := AOpcao;
         except

         end;
         try
             TTMSFMXButton(AForm.FindComponent('btnAlterar')).Visible   := AOpcao;
         except

         end;
         try
             TTMSFMXButton(AForm.FindComponent('btnAtualizar')).Visible := AOpcao;
         except

         end;
         try
             TTMSFMXButton(AForm.FindComponent('btnFechar')).Visible    := AOpcao;
         except

         end;

         try
             TTMSFMXButton(AForm.FindComponent('btnSalvar')).Visible    := not AOpcao;
         except

         end;
         try
             TTMSFMXButton(AForm.FindComponent('btnCancelar')).Visible  := not AOpcao;
         except

         end;
         try
             TLayout(AForm.FindComponent('lytCadastro')).Visible    := not AOpcao;
         except

         end;


end;


end.
