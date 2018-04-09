unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, User, Data.DB, Data.Win.ADODB;

type
  TUniMainModule = class(TUniGUIMainModule)
    MainConnection: TADOConnection;
    dstUser: TADODataSet;
    procedure UniGUIMainModuleDestroy(Sender: TObject);
    procedure fdcMainBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    FUser: TUser;
  public
    { Public declarations }
    property User: TUser read FUser write FUser;
    procedure ExecuteQuery(const AQuery: string);
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule);
end;

procedure TUniMainModule.ExecuteQuery(const AQuery: string);
begin
  MainConnection.Execute(AQuery);
end;

procedure TUniMainModule.fdcMainBeforeConnect(Sender: TObject);
begin
  // set connection params
//  with fdcMain.Params as TFDPhysFBConnectionDefParams do
//  begin
//    Server := FAppSettings.Database.Server;
//    Database := FAppSettings.Database.DatabaseFile;
//    UserName := FAppSettings.Database.User;
//    Password := FAppSettings.Database.Password;
//  end
end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin
  FUser.Free;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
