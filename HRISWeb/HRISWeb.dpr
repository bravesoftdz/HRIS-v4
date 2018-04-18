program HRISWeb;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  WebLogin in 'WebLogin.pas' {LoginForm: TUniLoginForm},
  WebEmployeeDrawer in 'WebEmployeeDrawer.pas' {EmployeeDrawerFrame: TUniFrame},
  WebEmployeeMain in 'WebEmployeeMain.pas' {EmployeeMainFrame: TUniFrame},
  WebAddressAndContact in 'WebAddressAndContact.pas' {AddressAndContactFrame: TUniFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
