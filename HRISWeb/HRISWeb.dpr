program HRISWeb;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Login in 'Login.pas' {LoginForm: TUniLoginForm},
  EmployeeDrawer in 'EmployeeDrawer.pas' {EmployeeDrawerFrame: TUniFrame},
  EmployeeMain in 'EmployeeMain.pas' {EmployeeMainFrame: TUniFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
