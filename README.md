# TCepRequest - Classe para Consulta de CEP

A `TCepRequest` é uma classe Delphi projetada para realizar consultas de CEP utilizando APIs públicas. Ela suporta tanto o ambiente Delphi quanto Lazarus (Free Pascal), garantindo flexibilidade e compatibilidade em diversos projetos.

## Funcionalidades
- Realiza consultas de CEP utilizando as APIs:
  - [ViaCEP](https://viacep.com.br)
  - [OpenCEP](https://opencep.com)
- Retorna informações de logradouro, bairro, complemento, cidade, UF e código IBGE.
- Possui tratamento de exceções para erros de requisição e processamento de JSON.
- Compatível com Delphi e Lazarus, utilizando diretivas condicionais para suporte a ambas as plataformas.

## Como Usar

### Instanciação e Configuração
```delphi
uses
  untCepRequest;

var
  CepRequest: TCepRequest;
begin
  CepRequest := TCepRequest.Create;
  try
    CepRequest.ApiCep := apiViaCep;

    CepRequest.Cep := 29950000; 

    if CepRequest.Search then
    begin
      Writeln('Logradouro: ', CepRequest.Logradouro);
      Writeln('Bairro: ', CepRequest.Bairro);
      Writeln('Cidade: ', CepRequest.Cidade);
      Writeln('UF: ', CepRequest.Uf);
      Writeln('IBGE: ', CepRequest.Ibge);
    end;
  except
    on E: Exception do
      Writeln('Erro: ', E.Message);
  end;
  FreeAndNil(CepRequest);
end;
```

### Propriedades
- **ApiCep**: Define a API utilizada (apiViaCep ou apiOpenCep).
- **Cep**: CEP a ser consultado (inteiro).
- **Logradouro**: Resultado do logradouro do CEP.
- **Bairro**: Bairro associado ao CEP.
- **Complemento**: Complemento do endereço.
- **Cidade**: Nome da cidade.
- **Uf**: Unidade Federativa (estado).
- **Ibge**: Código IBGE do município.

### Métodos
- **Search**: Realiza a consulta do CEP definido e retorna `True` em caso de sucesso.

## Requisitos
**Delphi:** Testado no Delphi 11.

**Lazarus:** Testado no Lazarus 3.2

**Dependências:** [Indy (TIdHTTP e TIdSSL)](https://www.indyproject.org/)