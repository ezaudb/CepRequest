program CepResolver;

uses
  Vcl.Forms,
  untcepresolver in 'untcepresolver.pas' {frmCepResolver},
  untCepRequest in '..\..\src\untCepRequest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCepResolver, frmCepResolver);
  Application.Run;
end.
