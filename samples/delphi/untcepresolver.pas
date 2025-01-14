unit untcepresolver;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmCepResolver = class(TForm)
    panHeader: TPanel;
    btnBuscarCep: TButton;
    rdgApi: TRadioGroup;
    labCep: TLabel;
    panBody: TPanel;
    edtCep: TEdit;
    edtLogradouro: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtUf: TEdit;
    edtIbge: TLabeledEdit;
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscarCepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCepResolver: TfrmCepResolver;

implementation

uses
  untCepRequest, System.SysUtils;

{$R *.dfm}

procedure TfrmCepResolver.btnBuscarCepClick(Sender: TObject);
var
  CepRequest: TCepRequest;
begin
  CepRequest := TCepRequest.Create;
  try
    case rdgApi.ItemIndex of
      0: CepRequest.ApiCep := apiViaCep;
      1: CepRequest.ApiCep := ApiOpenCep;
    end;

    CepRequest.Cep := StrToIntDef(edtCep.Text, 0);

    if CepRequest.Search then
    begin
      edtlogradouro.Text  := CepRequest.Logradouro;
      edtBairro.Text      := CepRequest.Bairro;
      edtComplemento.Text := CepRequest.Complemento;
      edtCidade.Text      := CepRequest.Cidade;
      edtUf.Text          := CepRequest.Uf;
      edtIbge.Text        := CepRequest.Ibge;
    end;
  finally
    FreeAndNil(CepRequest);
  end;
end;

procedure TfrmCepResolver.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;

end.
