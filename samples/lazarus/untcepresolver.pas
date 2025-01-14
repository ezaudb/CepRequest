unit untCepResolver;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmCepResolver }

  TfrmCepResolver = class(TForm)
    btnBuscarCep: TButton;
    edtBairro: TLabeledEdit;
    edtCep: TEdit;
    edtCidade: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtIbge: TLabeledEdit;
    edtLogradouro: TLabeledEdit;
    edtUf: TEdit;
    labCep: TLabel;
    panBody: TPanel;
    panHeader: TPanel;
    rdgApi: TRadioGroup;
    procedure btnBuscarCepClick(Sender: TObject);
  private

  public

  end;

var
  frmCepResolver: TfrmCepResolver;

implementation

{$R *.lfm}

{ TfrmCepResolver }

uses
  untCepRequest;

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


end.

