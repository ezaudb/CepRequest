unit untCepRequest;

interface

type EnmApiCep = (apiViaCep, ApiOpenCep);

type

  { TCepRequest }

  TCepRequest = class
  private
    FApiCep: EnmApiCep;

    FCep: Integer;
    FLogradouro, FBairro, FComplemento, FCidade, FUf, FIbge: String;

    procedure JsonToField(AValue: String);
    {$IFDEF FPC}
    procedure ExtractJson(AValue: String);
    {$ELSE}
    procedure ExtractJson(AValue: String);
    {$ENDIF}

    function LoadApi: Boolean;
  public
    property ApiCep: EnmApiCep read FApiCep write FApiCep;

    property Cep: Integer read FCep write FCep;

    property Logradouro: String read FLogradouro;
    property Bairro: String read FBairro;
    property Complemento: String read FComplemento;
    property Cidade: String read FCidade;
    property Uf: String read FUf;
    property Ibge: String read FIbge;

    function Search: Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  IdHTTP, IdSSLOpenSSL, SysUtils, Classes,
  {$IFDEF FPC}
  fpjson, jsonparser;
  {$ELSE}
  System.JSON;
  {$ENDIF}

{ TCepRequest }

constructor TCepRequest.Create;
begin
  ApiCep := apiViaCep;
  FCep := 0;
end;

destructor TCepRequest.Destroy;
begin
  inherited;
end;

function TCepRequest.LoadApi: Boolean;
const
  HOST_VIA_CEP = 'https://viacep.com.br/ws/';
  HOST_OPEN_CEP = 'https://opencep.com/v1/';
var
  IdHTTP: TIdHTTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  HostApi: String;
  Response: TStringStream;
begin
  IdHTTP := TIdHTTP.Create(nil);
  IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  Response := TStringStream.Create(EmptyStr, TEncoding.UTF8);
  try
    try
      IdSSL.SSLOptions.Method := sslvSSLv23;
      IdHttp.IOHandler := IdSSL;

      case FApiCep of
        apiViaCep: HostApi := HOST_VIA_CEP + FCep.ToString  + '/json';
        ApiOpenCep: HostApi := HOST_OPEN_CEP + FCep.ToString;
      end;

      IdHTTP.Request.Accept := 'application/json';
      IdHTTP.Get(HostApi, Response);
    except
      on E:Exception do
      begin
        raise Exception.Create('Erro ao Realizar Requisição: ' + E.Message);
      end;
    end;

    JsonToField(Response.DataString);

    Result := True;
  finally
    FreeAndNil(Response);
    FreeAndNil(IdSSL);
    FreeAndNil(IdHTTP);
  end;
end;

procedure TCepRequest.JsonToField(AValue: String);
begin
  try
    ExtractJson(AValue);
  except on E: Exception do
    begin
      raise Exception.Create('Erro ao processar JSON: ' + E.Message);
    end;
  End;
end;

{$IFDEF FPC}
procedure TCepRequest.ExtractJson(AValue: String);
var
  JSONObject: TJSONObject;
begin
  JSONObject := TJSONObject(GetJSON(AValue));
  try
    FLogradouro := JSONObject.Get('logradouro', EmptyStr);
    FComplemento := JSONObject.Get('complemento', EmptyStr);
    FBairro := JSONObject.Get('bairro', EmptyStr);
    FCidade := JSONObject.Get('localidade', EmptyStr);
    FUf := JSONObject.Get('uf', EmptyStr);
    FIbge := JSONObject.Get('ibge', EmptyStr);
  finally
    FreeAndNil(JSONObject);
  end;
end;

{$ELSE}

procedure TCepRequest.ExtractJson(AValue: String);
var
  JSONObject: TJSONObject;
begin
  JSONObject := TJSONObject.ParseJSONValue(AValue) as TJSONObject;
  if Assigned(JSONObject) then
  begin
    try
      JSONObject.TryGetValue<String>('logradouro', Self.FLogradouro);
      JSONObject.TryGetValue<String>('bairro', FBairro);
      JSONObject.TryGetValue<String>('complemento', Self.FComplemento);
      JSONObject.TryGetValue<String>('localidade', Self.FCidade);
      JSONObject.TryGetValue<String>('uf', Self.FUf);
      JSONObject.TryGetValue<String>('ibge', Self.FIbge);
    finally
      FreeAndNil(JSONObject);
    end;
  end;
end;
{$ENDIF}

function TCepRequest.Search: Boolean;
begin
  if FCep = 0 then
    raise Exception.Create('Informe o CEP');

  Result := LoadApi;
end;

end.
