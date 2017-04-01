program Kiosk;

uses
  AppUtil,
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Login in 'Login.pas',
  BaseForm in '..\Base\BaseForm.pas' {frmBase},
  BasePopup in '..\Base\BasePopup.pas' {frmBasePopup};

{$R *.res}

begin
  if not RestoreIfRunning(Application.Handle) then
  begin
    if TfrmLogin.LoggedIn then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TfrmBasePopup, frmBasePopup);
  Application.Run;
    end;
  end;
end.
